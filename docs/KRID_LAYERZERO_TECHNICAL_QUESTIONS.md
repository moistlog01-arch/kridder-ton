# KRID LayerZero Technical Question

## Status

AWAITING TECHNICAL CONFIRMATION


## Asset

KRID

Network:

TON Mainnet

Standard:

TEP-74 Jetton


Properties:

- Fixed supply
- 1,000,000,000 supply
- Mint disabled
- Admin removed


## Goal

Expand KRID to:

- Base
- Solana
- Additional LayerZero-supported chains


## Required Architecture

Preferred:

Existing KRID TON Jetton remains canonical.

LayerZero provides interoperability.


## Technical Questions

1. Does LayerZero support an existing TON TEP-74 Jetton as an OFT-compatible asset?

2. Is there a TON Jetton adapter pattern?

3. Can an immutable Jetton use lock/unlock accounting?

4. If not, what migration path is recommended?

5. What contracts must exist on TON and destination chains?


## Current Infrastructure

Prepared:

- Base deployment wallet
- Bridge operations wallet
- Treasury wallet
- Liquidity wallet


## Decision

No Base or Solana token deployment until TON compatibility is confirmed.
