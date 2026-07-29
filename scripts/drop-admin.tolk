import "@acton/io"
import "@acton/emulation/network"
import "@acton/emulation/scripts"
import "@wrappers/JettonMinter.gen"
import "utils/common"

fun main() {
    val admin = promptJettonWallet(
        "JETTON_ADMIN",
        "Select current Jetton Admin ActonWallet",
    );

    val minter = promptJettonMinter("Enter Jetton Minter address");

    println("WARNING: This permanently disables minting, metadata updates, admin changes, and upgrades.");
    println("MINTER={}", minter.address);
    println("CURRENT_ADMIN={}", admin.address);

    val res = minter.sendDropMinterAdmin(
        admin.address,
        0,
        { value: ton("0.05") },
    );

    println(res.waitForTrace());
    printJettonMinterInfo(minter, "JETTON");
}
