# KRID Bridge Technical Plan

## Objective

Expand KRID from TON into additional ecosystems while preserving:

- Single total supply
- Canonical TON Jetton origin
- Transparent backing
- Secure cross-chain accounting


# Current Architecture

Canonical Asset:

KRID Jetton on TON Mainnet

Jetton Minter:

EQCzrzXy-CRTA6-A_WMgWaRjCu8xvS9SW7AhiwvavxLBfvHP


Supply:

1,000,000,000 KRID

Decimals:

9


Current Security State:

- Fixed supply
- Minting disabled
- Admin removed
- Jetton metadata verified
- Security review completed


# Bridge Model

Preferred architecture:

Native token transfer model.

The TON KRID remains the canonical asset.

When KRID moves cross-chain:

1. TON KRID is locked or accounted for
2. Cross-chain message is verified
3. Equivalent KRID representation is released
4. Returning KRID burns/releases the representation


# Bridge Reserve

Dedicated reserve:

Address:

UQAlSvxAeEFiWZw9UJCQVNPjXxDX4c3wzW8S8QGxTC9crCu3


Allocation:

25,000,000 KRID


Purpose:

Backing future cross-chain expansion.


# Candidate Infrastructure

## Option 1 — Wormhole NTT

Native Token Transfer model.

Advantages:

- Purpose-built cross-chain token transfers
- Multi-chain support
- EVM compatibility
- Solana compatibility
- Established ecosystem

Evaluation required:

- TON support
- Deployment requirements
- Guardians/security model
- Integration cost


## Option 2 — LayerZero OFT

Omnichain token framework.

Advantages:

- Widely adopted
- EVM focused
- Flexible messaging

Evaluation required:

- TON compatibility
- Development requirements
- Deployment costs


## Option 3 — Native Listings First

Alternative approach:

Expand liquidity and listings before bridging.

Advantages:

- Lower technical complexity
- Lower upfront cost
- Community validation first


# Recommended Rollout

## Phase 1

Base

Reason:

- Low transaction costs
- Strong meme ecosystem
- EVM compatibility


## Phase 2

BNB Chain

Reason:

- Large retail ecosystem
- Strong meme activity


## Phase 3

Arbitrum

Reason:

- Established DeFi infrastructure


## Phase 4

Solana

Reason:

- Large meme market
- Requires additional evaluation


# Technical Requirements

Before deployment:

- Bridge contract review
- Supply accounting review
- Monitoring setup
- Emergency controls
- Destination chain verification
- Liquidity planning


# Liquidity Strategy

Do not immediately deploy all chains.

Recommended:

Start with one chain.

Allocate liquidity based on demand.

Monitor:

- Volume
- Holders
- Price impact
- Arbitrage activity


# Security Requirements

Required before launch:

- Contract audit
- Bridge configuration review
- Multisig control
- Monitoring alerts
- Recovery procedures


# Decision Point

Before implementation:

Compare:

1. Wormhole NTT
2. LayerZero OFT
3. Listing/liquidity expansion without bridge

Select the lowest-cost secure path.
