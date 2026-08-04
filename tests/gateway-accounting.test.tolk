import "@acton/build"
import "@acton/emulation/network"
import "@acton/emulation/testing"
import "@acton/testing/expect"
import "@acton/types/transaction"

import "@contracts/KRIDGateway"
import "@contracts/errors"
import "@contracts/messages"
import "@wrappers/JettonMinter.gen"
import "@wrappers/JettonWallet.gen"
import "@wrappers/KRIDGateway.gen"
import "@wrappers/utils"

import "test-utils"

const BASE_RECIPIENT_A = 0x1111111111111111111111111111111111111111
const BASE_RECIPIENT_B = 0x2222222222222222222222222222222222222222

fun bridgePayload(baseRecipient: uint256): cell {
    return BridgeToBasePayload {
        version: 1,
        destinationChain: BASE_EVM_CHAIN_ID,
        baseRecipient,
    }.toCell();
}

fun expectGatewayStepFailure(result: SendResult, expectedExitCode: int): void {
    val description = result.tx.load().description.load();
    if (description is TlbTransOrd && description.computePh is TlbTrComputeVm) {
        expect(description.computePh.success).toEqual(false);
        expect(description.computePh.data.load().exitCode).toEqual(expectedExitCode);
        return;
    }

    throw 0xFFFF;
}

fun bridgeForwardPayload(baseRecipient: uint256): slice {
    return beginCell().storeMaybeRef(bridgePayload(baseRecipient)).endCell().beginParse();
}

fun setupGateway(minter: JettonMinter, owner: Treasury): KRIDGateway {
    val gateway = KRIDGateway.fromStorage({
        owner: owner.address,
        kridMinter: minter.address,
        jettonWalletCode: build("JettonWallet"),
        lockedKrid: 0,
        nextDepositId: 0,
        paused: false,
        processedDeposits: [],
        deposits: [],
    });
    val deployResult = net.send(
        owner.address,
        createMessage({
            bounce: false,
            value: ton("10"),
            dest: { stateInit: gateway.stateInit! },
            body: SetGatewayPaused { paused: false },
        }),
    );
    expect(deployResult).toHaveSuccessfulDeploy<SetGatewayPaused>({
        from: owner.address,
        to: gateway.address,
    });
    return gateway;
}

fun gatewayWallet(minter: JettonMinter, gateway: KRIDGateway): JettonWallet {
    return userWallet(minter, gateway.address);
}

fun sendDeposit(
    wallet: JettonWallet,
    sender: Treasury,
    gateway: KRIDGateway,
    amount: coins,
    recipient: uint256,
): SendResultList {
    return wallet.sendTransfer(
        sender.address,
        DEFAULT_TRANSFER_MSG_VALUE,
        amount,
        gateway.address,
        sender.address,
        null,
        DEFAULT_FORWARD_TON_AMOUNT,
        bridgePayload(recipient),
    );
}

get fun `test gateway: valid deposit locks canonical KRID and records deposit`() {
    val (minter, deployer, _) = setupTest();
    val gateway = setupGateway(minter, deployer);
    val depositorWallet = mintTo(minter, deployer, deployer.address, ton("5"));
    val amount = ton("2");

    val result = sendDeposit(depositorWallet, deployer, gateway, amount, BASE_RECIPIENT_A);
    expect(result).toHaveSuccessfulTx<TransferNotificationForRecipient>({
        from: gatewayWallet(minter, gateway).address,
        to: gateway.address,
    });

    val storage = gateway.getGatewayData();
    expect(gateway.getLockedKrid()).toEqual(amount);
    expect(gatewayWallet(minter, gateway).getJettonBalance()).toEqual(amount);
    expect(storage.nextDepositId).toEqual(1);
    expect(storage.deposits.exists(1)).toEqual(true);
    val deposit = storage.deposits.mustGet(1);
    expect(deposit.sender).toEqual(deployer.address);
    expect(deposit.queryId).toEqual(0);
    expect(deposit.amount).toEqual(amount);
    expect(deposit.baseRecipient).toEqual(BASE_RECIPIENT_A);
    expect(gateway.isDepositProcessed(deployer.address, 0)).toEqual(true);
}

get fun `test gateway: duplicate notification is rejected without changing accounting`() {
    val (minter, deployer, _) = setupTest();
    val gateway = setupGateway(minter, deployer);
    val depositorWallet = mintTo(minter, deployer, deployer.address, ton("5"));
    val amount = ton("2");
    sendDeposit(depositorWallet, deployer, gateway, amount, BASE_RECIPIENT_A);

    val duplicate = createMessage({
        bounce: true,
        value: ton("0.1"),
        dest: gateway.address,
        body: TransferNotificationForRecipient {
            queryId: 0,
            jettonAmount: amount,
            transferInitiator: deployer.address,
            forwardPayload: bridgeForwardPayload(BASE_RECIPIENT_A),
        },
    });
    val duplicateResult = testing.processSingleTraceStep(
        gatewayWallet(minter, gateway).address,
        duplicate,
    );
    expectGatewayStepFailure(duplicateResult, Errors.BridgeReplay);

    val storage = gateway.getGatewayData();
    expect(gateway.getLockedKrid()).toEqual(amount);
    expect(storage.nextDepositId).toEqual(1);
    expect(gatewayWallet(minter, gateway).getJettonBalance()).toEqual(amount);
}

get fun `test gateway: unauthorized notification sender is rejected`() {
    val (minter, deployer, outsider) = setupTest();
    val gateway = setupGateway(minter, deployer);
    val badNotification = createMessage({
        bounce: true,
        value: ton("0.1"),
        dest: gateway.address,
        body: TransferNotificationForRecipient {
            queryId: 7,
            jettonAmount: ton("1"),
            transferInitiator: outsider.address,
            forwardPayload: bridgeForwardPayload(BASE_RECIPIENT_A),
        },
    });
    val result = net.send(outsider.address, badNotification);
    expect(result).toHaveFailedTx<TransferNotificationForRecipient>({
        from: outsider.address,
        to: gateway.address,
        exitCode: Errors.NotValidWallet,
    });
    expect(gateway.getLockedKrid()).toEqual(0);
    expect(gateway.getGatewayData().nextDepositId).toEqual(0);
}

get fun `test gateway: paused gateway rejects a valid wallet notification`() {
    val (minter, deployer, _) = setupTest();
    val gateway = setupGateway(minter, deployer);
    val gatewayJettonWallet = gatewayWallet(minter, gateway);

    val pauseResult = gateway.sendSetGatewayPaused(
        deployer.address,
        true,
        { bounce: false, value: ton("0.1") },
    );
    expect(pauseResult).toHaveSuccessfulTx<SetGatewayPaused>({
        from: deployer.address,
        to: gateway.address,
    });

    val notification = createMessage({
        bounce: true,
        value: ton("0.1"),
        dest: gateway.address,
        body: TransferNotificationForRecipient {
            queryId: 9,
            jettonAmount: ton("1"),
            transferInitiator: deployer.address,
            forwardPayload: bridgeForwardPayload(BASE_RECIPIENT_A),
        },
    });
    val result = testing.processSingleTraceStep(gatewayJettonWallet.address, notification);
    expectGatewayStepFailure(result, Errors.GatewayPaused);
    expect(gateway.getLockedKrid()).toEqual(0);
    expect(gateway.getGatewayData().nextDepositId).toEqual(0);
}

get fun `test gateway: locked accounting equals all recorded local deposits`() {
    val (minter, deployer, otherDepositor) = setupTest();
    val gateway = setupGateway(minter, deployer);
    val firstWallet = mintTo(minter, deployer, deployer.address, ton("5"));
    val secondWallet = mintTo(minter, deployer, otherDepositor.address, ton("5"));
    val firstAmount = ton("1.25");
    val secondAmount = ton("2.75");

    sendDeposit(firstWallet, deployer, gateway, firstAmount, BASE_RECIPIENT_A);
    sendDeposit(secondWallet, otherDepositor, gateway, secondAmount, BASE_RECIPIENT_B);

    val storage = gateway.getGatewayData();
    val firstDeposit = storage.deposits.mustGet(1);
    val secondDeposit = storage.deposits.mustGet(2);
    val recordedTotal = firstDeposit.amount + secondDeposit.amount;
    expect(storage.nextDepositId).toEqual(2);
    expect(storage.lockedKrid).toEqual(recordedTotal);
    expect(gateway.getLockedKrid()).toEqual(recordedTotal);
    expect(gatewayWallet(minter, gateway).getJettonBalance()).toEqual(recordedTotal);
    expect(gateway.isDepositProcessed(deployer.address, 0)).toEqual(true);
    expect(gateway.isDepositProcessed(otherDepositor.address, 0)).toEqual(true);
}
