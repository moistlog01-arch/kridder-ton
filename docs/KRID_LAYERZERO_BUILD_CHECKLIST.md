# KRID LayerZero Build Checklist

## Objective

Build KRID interoperability while preserving the existing immutable TON Jetton.

Target:

TON KRID
|
KRID Gateway
|
LayerZero
|
Base
|
Solana


# Phase 1 — LayerZero Confirmation

Status:

PENDING


Checklist:

[ ] Confirm TON integration architecture

[ ] Confirm gateway/OApp requirements

[ ] Confirm message flow

[ ] Confirm destination token model

[ ] Confirm security requirements



# Phase 2 — TON Gateway Development

Status:

PENDING


Requirements:

[ ] Design KRID Gateway contract

[ ] Receive KRID Jetton transfers

[ ] Verify TransferNotificationForRecipient

[ ] Validate:

- queryId
- jettonAmount
- transferInitiator
- forwardPayload


[ ] Implement accounting storage

[ ] Implement replay protection



# Phase 3 — Testnet Deployment

Status:

PENDING


Checklist:

[ ] Deploy gateway to TON testnet

[ ] Connect LayerZero test environment

[ ] Deploy Base test representation

[ ] Execute TON → Base transfer

[ ] Verify balances

[ ] Verify supply accounting



# Phase 4 — Security Review

Status:

PENDING


Checklist:

[ ] Contract review

[ ] Message verification review

[ ] Access control review

[ ] Emergency controls review

[ ] External audit consideration



# Phase 5 — Mainnet Launch

Status:

PENDING


Requirements:

[ ] Final LayerZero approval

[ ] TON gateway deployed

[ ] Base contracts deployed

[ ] Solana expansion plan approved

[ ] Liquidity strategy finalized



# Current KRID Status


Token:

TON TEP-74 Jetton


Properties:

- Fixed supply
- 1,000,000,000 supply
- Mint disabled
- Admin permanently locked
- Upgrade disabled


Prepared Infrastructure:

[ ] Base deployment wallet

[ ] Bridge operations wallet

[ ] Treasury wallet

[ ] Liquidity wallet



# Current Decision

Proceed with LayerZero gateway implementation path.

No changes to original KRID Jetton contract.
