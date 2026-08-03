# KRID Base Deployment Runbook

## Objective

Operational checklist for launching KRID on Base.

Architecture:

TON KRID
    |
Bridge
    |
Base KRID


# Phase 1 — Wallet Preparation

Create dedicated wallets:

## Base Deployment Wallet

Purpose:

- Contract deployment
- Configuration
- Verification


## Base Treasury Wallet

Purpose:

- Ecosystem funds
- Future allocations


## Base Liquidity Wallet

Purpose:

- Initial liquidity
- LP management


Security:

- Separate wallets
- Secure key storage
- Multisig recommended


# Phase 2 — Bridge Configuration

Requirements:

- Confirm bridge provider
- Configure TON asset
- Configure Base asset
- Establish permissions
- Test transfers


Testing:

- TON → Base
- Base → TON


# Phase 3 — Base Contract Deployment

Tasks:

- Deploy KRID Base contract
- Set metadata
- Verify contract source
- Confirm ownership
- Confirm decimals


Token:

Name:
Kridder

Symbol:
KRID

Decimals:
9


# Phase 4 — Liquidity Launch

Trading Pair:

KRID / ETH


Tasks:

- Select DEX
- Create pool
- Add liquidity
- Confirm pricing
- Monitor trading


# Phase 5 — Verification

Complete:

- Explorer verification
- Token metadata
- Contract links
- Social links


# Phase 6 — Public Launch

Tasks:

- Announcement
- Community push
- Monitor volume
- Monitor liquidity


# Expansion After Base

Future:

1. Solana
2. BNB Chain
3. Arbitrum


# Launch Rule

Do not expand until Base has:

- functioning bridge
- stable liquidity
- active users
