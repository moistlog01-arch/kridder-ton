import "@acton/io"
import "@acton/emulation/scripts"

fun main() {
    val community = scripts.wallet("krid-community");
    val liquidity = scripts.wallet("krid-liquidity");
    val marketing = scripts.wallet("krid-marketing");
    val treasury = scripts.wallet("krid-treasury");

    println("KRID_COMMUNITY={}", community.address);
    println("KRID_LIQUIDITY={}", liquidity.address);
    println("KRID_MARKETING={}", marketing.address);
    println("KRID_TREASURY={}", treasury.address);
}
