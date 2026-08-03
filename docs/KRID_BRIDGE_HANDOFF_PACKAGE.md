# KRID Bridge Handoff Package

## Project Overview

Project:

Kridder ($KRID)


Origin Chain:

TON Mainnet


Token Standard:

TEP-74 Jetton


Goal:

Expand KRID into additional ecosystems while maintaining one unified token identity.


# Current KRID Deployment

Token:

Kridder


Symbol:

KRID


Supply:

1,000,000,000


Decimals:

9


Contract:

EQCzrzXy-CRTA6-A_WMgWaRjCu8xvS9SW7AhiwvavxLBfvHP


Current Security Properties:

- Fixed supply
- Mint disabled
- Admin removed
- Metadata configured


# Desired Architecture

Preferred:

TON KRID
        |
        |
Wormhole Infrastructure
        |
        |
Base KRID Representation


Objectives:

- Maintain token identity
- Preserve supply accounting
- Enable cross-chain transfers
- Expand liquidity access


# First Target Chain

Base


Reason:

- EVM compatibility
- Low transaction costs
- Strong ecosystem
- Easier initial deployment


# Technical Questions

## TON Integration

Need confirmation:

1. Can an existing TON Jetton integrate with Wormhole NTT?

2. Is a custom adapter required?

3. Are changes required to the existing Jetton contract?

4. What permissions are required?


## Wormhole Configuration

Need information:

1. Required contracts

2. Deployment process

3. Security model

4. Monitoring requirements

5. Upgrade requirements


## Base Deployment

Need information:

1. Destination token architecture

2. Contract requirements

3. Ownership model

4. Verification process

5. Metadata process


# Testing Requirements

Before production:

Required:

- TON → Base transfer test
- Base → TON transfer test
- Supply accounting verification
- Metadata verification
- Balance verification


# Launch Requirements

After successful testing:

- Base liquidity pool
- KRID/ETH market
- Explorer verification
- Community announcement


# Future Expansion

After Base:

- Solana
- BNB Chain
- Arbitrum


# Current Status

KRID is prepared for bridge evaluation.

Pending:

- Wormhole TON compatibility confirmation
- Implementation requirements
- Deployment cost estimate


# Contact Objective

Request:

Technical guidance for integrating KRID TON Jetton into Wormhole-based multichain architecture.
