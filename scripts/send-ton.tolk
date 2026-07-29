import "@acton/io"
import "@acton/emulation/network"
import "@acton/emulation/scripts"
import "utils/common"

fun main() {
    val sender = promptJettonWallet("TON_SENDER", "Select TON sender ActonWallet");
    val recipient = promptJettonAddress("TON_RECIPIENT", "Enter TON recipient");
    val amount = promptJettonCoins("TON_AMOUNT", "Enter TON amount", "50000000");

    val message = createMessage({
        bounce: false,
        value: amount,
        dest: recipient,
        body: beginCell().endCell(),
    });

    val result = net.send(sender.address, message);
    println(result.waitForTrace());
    println("TON_SENDER={}", sender.address);
    println("TON_RECIPIENT={}", recipient);
    println("TON_AMOUNT={}", amount);
}
