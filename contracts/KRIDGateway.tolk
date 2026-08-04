import "errors"
import "jetton-utils"
import "messages"

const BASE_EVM_CHAIN_ID = 8453

struct GatewayStorage {
    owner: address
    kridMinter: address
    jettonWalletCode: cell
    lockedKrid: coins
    nextDepositId: uint64
    paused: bool
    processedDeposits: map<uint256, bool>
    deposits: map<uint64, GatewayDeposit>
}

struct GatewayDeposit {
    queryId: uint64
    sender: address
    amount: coins
    baseRecipient: uint256
}

/// Versioned payload carried in the TEP-74 transfer notification's forward payload.
/// `baseRecipient` is a left-zero-padded 20-byte EVM address.
struct (0x4b524944) BridgeToBasePayload {
    version: uint8
    destinationChain: uint32
    baseRecipient: uint256
}

struct (0x50415553) SetGatewayPaused {
    paused: bool
}

struct GatewayReplayKey {
    sender: address
    queryId: uint64
}

type AllowedMessageToGateway = TransferNotificationForRecipient | SetGatewayPaused

fun GatewayStorage.load(): GatewayStorage {
    return GatewayStorage.fromCell(contract.getData());
}

fun GatewayStorage.save(self) {
    contract.setData(self.toCell());
}

fun bridgeReplayKey(sender: address, queryId: uint64): uint256 {
    return GatewayReplayKey { sender, queryId }.toCell().hash();
}

fun parseBridgeToBasePayload(payload: ForwardPayloadRemainder): BridgeToBasePayload {
    var payloadCopy = payload;
    val payloadRef = payloadCopy.loadMaybeRef();
    assert (payloadRef != null) throw Errors.InvalidBridgePayload;
    payloadCopy.assertEnd();
    var bridgePayloadCell = payloadRef!;
    var bridgePayloadSlice = bridgePayloadCell.beginParse();
    if (
        bridgePayloadSlice.remainingBitsCount() == 1 && bridgePayloadSlice.preloadUint(1) == 1 &&
        bridgePayloadSlice.remainingRefsCount() == 1
    ) {
        bridgePayloadSlice.loadUint(1);
        bridgePayloadCell = bridgePayloadSlice.loadRef();
    }
    return BridgeToBasePayload.fromSlice(
        bridgePayloadCell.beginParse(),
        { assertEndAfterReading: true, throwIfOpcodeDoesNotMatch: Errors.InvalidBridgePayload },
    );
}

contract KRIDGateway {
    author: "Kridder"
    version: "0.1.0"
    description: "Local TON escrow accounting for the KRID TON to Base bridge proof"
    storage: GatewayStorage
    incomingMessages: AllowedMessageToGateway
}

fun onInternalMessage(in: InMessage) {
    val msg = lazy AllowedMessageToGateway.fromSlice(in.body);

    match (msg) {
        TransferNotificationForRecipient => {
            var storage = lazy GatewayStorage.load();
            assert (!storage.paused) throw Errors.GatewayPaused;
            assert (msg.jettonAmount > 0) throw Errors.InvalidBridgeAmount;
            assert (msg.transferInitiator != null) throw Errors.InvalidBridgePayload;
            assert (
                in.senderAddress ==
                calcAddressOfJettonWallet(
                    contract.getAddress(),
                    storage.kridMinter,
                    storage.jettonWalletCode,
                )
            ) throw Errors.NotValidWallet;

            val payload = parseBridgeToBasePayload(msg.forwardPayload);
            assert (payload.version == 1) throw Errors.InvalidBridgePayload;
            assert (
                payload.destinationChain == BASE_EVM_CHAIN_ID
            ) throw Errors.InvalidBridgePayload;
            assert (payload.baseRecipient != 0) throw Errors.InvalidBridgePayload;

            val sender = msg.transferInitiator!;
            val replayKey = bridgeReplayKey(sender, msg.queryId);
            assert (!storage.processedDeposits.exists(replayKey)) throw Errors.BridgeReplay;

            storage.processedDeposits.set(replayKey, true);
            storage.nextDepositId += 1;
            storage.lockedKrid += msg.jettonAmount;
            storage
                .deposits
                .set(
                    storage.nextDepositId,
                    {
                        queryId: msg.queryId,
                        sender,
                        amount: msg.jettonAmount,
                        baseRecipient: payload.baseRecipient,
                    },
                );
            storage.save();
        }

        SetGatewayPaused => {
            var storage = lazy GatewayStorage.load();
            assert (in.senderAddress == storage.owner) throw Errors.NotOwner;
            storage.paused = msg.paused;
            storage.save();
        }

        else => throw Errors.InvalidMessage,
    }
}

get fun get_gateway_data(): GatewayStorage {
    return GatewayStorage.load();
}

get fun get_locked_krid(): coins {
    return GatewayStorage.load().lockedKrid;
}

get fun is_deposit_processed(sender: address, queryId: uint64): bool {
    val storage = lazy GatewayStorage.load();
    return storage.processedDeposits.exists(bridgeReplayKey(sender, queryId));
}
