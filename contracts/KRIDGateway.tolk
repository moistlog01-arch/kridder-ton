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
    recipient: bytes
}

fun GatewayStorage.load(): GatewayStorage {
    return GatewayStorage.fromCell(contract.getData());
}

fun GatewayStorage.save(self) {
    contract.setData(self.toCell());
}

receive(msg: BridgeDeposit) {
    val storage = lazy GatewayStorage.load();

    if (storage.paused) {
        throw 0x100;
    }

    storage.nonce += 1;

    println(
        "KRID bridge deposit amount={}",
        msg.amount
    );

    storage.save();
}

receive("pause") {
    val storage = lazy GatewayStorage.load();

    assert(sender() == storage.owner);

    storage.paused = true;
    storage.save();
}

receive("unpause") {
    val storage = lazy GatewayStorage.load();

    assert(sender() == storage.owner);

    storage.paused = false;
    storage.save();
}

get fun get_gateway_data(): GatewayStorage {
    return GatewayStorage.load();
}
