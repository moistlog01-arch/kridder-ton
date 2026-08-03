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

get fun get_gateway_data(): GatewayStorage {
    return GatewayStorage.load();
}
