# KRID Bridge Provider Comparison

## Objective

Select the best infrastructure for expanding KRID from TON to:

- Base
- BNB Chain
- Arbitrum
- Solana


## Option 1 — Wormhole Native Token Transfer (NTT)

### Overview

Wormhole NTT is designed for native token expansion across multiple chains.

Architecture:

TON KRID
    |
    |
 Wormhole NTT
    |
-------------------
Base KRID
BNB KRID
Arbitrum KRID
Solana KRID


### Advantages

- Multi-chain focused
- Supports EVM ecosystems
- Supports Solana ecosystem
- Designed specifically for token transfers
- Strong ecosystem adoption


### Considerations

Need to verify:

- TON Jetton compatibility
- Deployment requirements
- Integration support
- Security model
- Operational requirements


### Fit for KRID

Rating:

High potential


Reason:

KRID wants a long-term multi-chain identity including Solana.


---

# Option 2 — LayerZero OFT

## Overview

LayerZero Omnichain Fungible Token framework.

Architecture:

KRID token contracts connected through LayerZero messaging.


### Advantages

- Large adoption
- Strong EVM ecosystem
- Flexible messaging infrastructure


### Considerations

Need to verify:

- TON support
- Jetton compatibility
- Development requirements
- Cost structure


### Fit for KRID

Rating:

Medium to High potential


Reason:

Excellent EVM coverage, but TON support requires investigation.


---

# Option 3 — No Bridge Initially

## Overview

Expand through liquidity and listings first.

Strategy:

TON first.

Build:
- holders
- volume
- liquidity
- exchange presence

Bridge later.


### Advantages

- Lowest cost
- Lowest technical risk
- Faster execution


### Disadvantages

- No cross-chain availability
- Misses early multi-chain exposure


### Fit for KRID

Rating:

Strong short-term option


---

# Preliminary Recommendation

## Phase 1

Do not deploy multiple chains immediately.

Recommended sequence:

1. Establish Base presence
2. Evaluate bridge infrastructure
3. Expand to BNB
4. Expand to Arbitrum
5. Evaluate Solana


## Current Preferred Candidate

Wormhole NTT

Reason:

KRID's long-term goal requires:

- EVM compatibility
- Solana compatibility
- secure supply synchronization
- native token transfer model


## Decision Required

Before implementation:

Confirm:

1. Does Wormhole support TON Jettons?
2. What are integration requirements?
3. What contracts are required?
4. What are costs?
5. What liquidity is needed?

