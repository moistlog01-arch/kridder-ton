# KRID LayerZero Gateway Architecture

## Decision

KRID will preserve the existing TON Jetton as the canonical asset.

No changes to:

- supply
- admin
- minting
- Jetton Minter

The interoperability layer will exist separately.


# Current KRID State

Network:

TON Mainnet


Standard:

TEP-74 Jetton


Properties:

- 1,000,000,000 supply
- Mint disabled
- Admin permanently locked
- Upgrade disabled


# Architecture Overview


TON KRID

        |

        |

KRID Gateway Contract

        |

        |

LayerZero Messaging Layer

        |

        +----------------+

        |                |

      Base            Solana



# TON Gateway Responsibilities


The gateway contract must:

1. Receive KRID deposits

2. Verify Jetton transfer notifications

3. Validate:

- queryId
- jettonAmount
- transferInitiator
- forwardPayload


4. Lock KRID accounting

5. Create LayerZero bridge message


# Deposit Flow


User:

1. Sends KRID to gateway Jetton wallet

2. JettonWallet sends:

TransferNotificationForRecipient


Notification contains:

- queryId
- jettonAmount
- transferInitiator
- forwardPayload


Gateway:

1. Confirms deposit

2. Records locked amount

3. Sends LayerZero message



# Destination Flow


Base:

Receive LayerZero message

Process:

1. Verify message

2. Update KRID representation

3. Release destination asset


Solana:

Future expansion using same architecture.



# Security Requirements


Gateway must include:

- replay protection
- message verification
- amount accounting
- emergency controls
- audited code


# Supply Model


Original:

TON KRID:

1,000,000,000


Bridge accounting:

Locked TON KRID represents destination supply.


Goal:

Total KRID supply remains controlled.


# Current Unknowns


Before implementation:

[ ] Confirm LayerZero TON gateway pattern

[ ] Confirm supported message architecture

[ ] Confirm destination token model

[ ] Confirm security requirements

[ ] Confirm audit requirements


# Status

Architecture defined.

Awaiting LayerZero implementation confirmation.
