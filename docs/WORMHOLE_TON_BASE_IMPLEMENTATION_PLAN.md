# KRID Wormhole TON → Base Implementation Plan

## Objective

Define the implementation path for expanding KRID from TON Mainnet to Base.

Target:

TON KRID → Base KRID


# Current Asset

Canonical Token:

Kridder ($KRID)


Chain:

TON Mainnet


Standard:

TEP-74 Jetton


Properties:

- Fixed supply
- Minting disabled
- Admin removed
- 9 decimals


# Phase 1 — Compatibility Confirmation

Required before deployment:

- Confirm Wormhole TON support
- Confirm Jetton compatibility
- Confirm NTT availability
- Confirm required contracts
- Confirm operational requirements


Status:

PENDING


# Phase 2 — Bridge Configuration

Required components:

## TON Side

Tasks:

- Register KRID source asset
- Configure transfer permissions
- Validate supply controls


Status:

PENDING


## Base Side

Tasks:

- Configure destination asset
- Deploy required contracts
- Verify metadata
- Configure ownership


Status:

PENDING


# Phase 3 — Testing

Required tests:

## Transfer Test

TON → Base

Verify:

- Correct recipient
- Correct amount
- Correct metadata


## Return Test

Base → TON

Verify:

- Correct accounting
- Correct supply behavior
- Correct final balances


Status:

PENDING


# Phase 4 — Base Liquidity

Trading Pair:

KRID / ETH


DEX Candidates:

- Aerodrome
- Uniswap V3


Requirements:

- Create pool
- Add liquidity
- Verify trading
- Monitor activity


Status:

PENDING


# Phase 5 — Security Review

Before launch:

Required:

- Contract review
- Permission review
- Wallet review
- Monitoring setup
- Emergency procedures


Status:

PENDING


# Launch Criteria

KRID Base launch requires:

[ ] Bridge compatibility confirmed

[ ] Contracts deployed

[ ] Transfers tested

[ ] Security reviewed

[ ] Liquidity added

[ ] Metadata verified


# Expansion After Base

Future:

1. Solana
2. BNB Chain
3. Arbitrum


# Principle

Base is the proving ground.

Do not expand to additional chains until:

- Bridge works reliably
- Liquidity is healthy
- Users are active
