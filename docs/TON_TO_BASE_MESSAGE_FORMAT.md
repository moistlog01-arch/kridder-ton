# TON to Base Local Bridge Message Format

## Scope

This document defines the local, transport-neutral proof message accepted by
`KRIDGateway`. It does not configure LayerZero, deploy a Base contract, mint on
Base, or authorize a release from TON escrow.

## Deposit transport on TON

The user transfers canonical KRID to the deterministic Jetton wallet owned by
`KRIDGateway`. The transfer must include a non-zero `forward_ton_amount`, which
causes that wallet to send a standard TEP-74 `TransferNotificationForRecipient`
to the gateway.

The gateway accepts a notification only when its sender is the deterministic
wallet calculated from:

```text
owner = KRIDGateway address
minter = configured canonical KRID minter
code = configured canonical KRID JettonWallet code
```

## Forward payload

The standard TEP-74 notification's `forward_payload` is an Either payload with
a reference to this exact cell. All integers are unsigned and big-endian under
the Tolk/TLB encoding.

| Field | Encoding | Value / rule |
| --- | --- | --- |
| `opcode` | `uint32` | `0x4b524944` (`KRID`) |
| `version` | `uint8` | `1` |
| `destinationChain` | `uint32` | `8453` (Base EVM chain ID) |
| `baseRecipient` | `uint256` | left-zero-padded 20-byte Base address; cannot be zero |

`8453` is an application destination identifier, not a LayerZero endpoint ID.
No LayerZero endpoint ID is introduced until the exact TON-to-Base pathway is
independently verified and configured.

## Local accounting and replay rule

For an accepted notification, the gateway records:

```text
replayKey = hash(cell(sender TON address, queryId))
depositId = nextDepositId + 1
lockedKrid += jettonAmount
```

The replay key is permanently marked processed. A second notification with the
same initiating TON address and `queryId` fails. During this local-proof phase,
no operation decreases `lockedKrid`; consequently the invariant is:

```text
lockedKrid = sum(amount of every recorded accepted deposit)
```

The gateway's deterministic KRID Jetton-wallet balance must equal `lockedKrid`
in local tests. Future outbound transport and Base representation work must
preserve the stronger cross-chain invariant that Base outstanding KRID never
exceeds locked canonical TON KRID.
