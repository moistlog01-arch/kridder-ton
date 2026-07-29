import "@acton/io"
import "@acton/emulation/network"
import "@acton/emulation/scripts"
import "@wrappers/JettonMinter.gen"
import "@wrappers/JettonWallet.gen"
import "utils/common"

fun main() {
    val owner = promptJettonWallet("JETTON_OWNER", "Select Jetton Owner ActonWallet");
    val minter = promptJettonMinter("Enter Jetton Minter address");
    val burnAmount = promptJettonCoins(
        "JETTON_BURN_AMOUNT",
        "Enter burn amount",
        "1000000000000000000",
    );

    val ownerWallet = JettonWallet { address: minter.getWalletAddress(owner.address) };

    println("WARNING: This permanently burns jettons and reduces total supply.");
    println("MINTER={}", minter.address);
    println("OWNER={}", owner.address);
    println("JETTON_WALLET={}", ownerWallet.address);
    println("BURN_AMOUNT={}", burnAmount);

    val res = ownerWallet.sendAskToBurn(
        owner.address,
        0,
        burnAmount,
        owner.address,
        null,
        { value: ton("0.08") },
    );

    println(res.waitForTrace());
    printJettonMinterInfo(minter, "JETTON");
    printJettonWalletInfo(minter, owner.address, "JETTON_OWNER");
}
