import "@stdlib/strings"

struct GatewayStorage {
    owner: address
    kridMinter: address
    bridgeReserveWallet: address
    nonce: uint64
    paused: bool
}

struct BridgeDeposit {
    queryId: uint64
    sender: address
    amount: coins
    destinationChain: uint32
    recipient: cell
}

fun GatewayStorage.load(): GatewayStorage {
    return GatewayStorage.fromCell(contract.getData());
}

fun GatewayStorage.save(self) {
    contract.setData(self.toCell());
}

type AllowedMessageToGateway =
    | BridgeDeposit

fun onInternalMessage(in: InMessage) {
    val msg = lazy AllowedMessageToGateway.fromSlice(in.body);

    match (msg) {
        BridgeDeposit => {
            var storage = lazy GatewayStorage.load();

            if (storage.paused) {
                throw 0x100;
            }

            storage.nonce += 1;
            storage.save();
        }

        else => throw 0xFFFF,
    }
}

get fun get_gateway_data(): GatewayStorage {
    return GatewayStorage.load();
}
