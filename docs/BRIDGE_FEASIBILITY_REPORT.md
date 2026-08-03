# KRID Bridge Feasibility Report

## Objective

Determine the practical requirements to expand KRID from TON into additional ecosystems.

Primary target:

TON → Base

Future targets:

- BNB Chain
- Arbitrum
- Solana


# Current KRID State

Canonical Chain:

TON Mainnet


Token:

KRID


Jetton Minter:

EQCzrzXy-CRTA6-A_WMgWaRjCu8xvS9SW7AhiwvavxLBfvHP


Supply:

1,000,000,000 KRID


Current Security Properties:

- Fixed supply
- Minting disabled
- Admin removed
- Metadata verified
- Security review completed


# Bridge Architecture Evaluation

## Wormhole NTT

Current status:

Primary candidate.

Purpose:

Enable native token transfers while preserving KRID identity across chains.


Required verification:

- TON Jetton compatibility
- Deployment process
- Required contracts
- Security configuration
- Operational requirements


Expected architecture:

TON KRID
    |
 Wormhole messaging
    |
Base KRID
    |
Liquidity pool


# Destination Chain Evaluation

## Base

Priority:

First expansion target.


Reasons:

- Low transaction costs
- Strong community ecosystem
- EVM compatibility
- Accessible liquidity


Required:

- Base token deployment
- Contract verification
- Liquidity pool creation
- Metadata setup


## BNB Chain

Priority:

Second expansion.


Reasons:

- Large retail user base
- Strong meme ecosystem


## Arbitrum

Priority:

Third expansion.


Reasons:

- DeFi infrastructure
- EVM compatibility


## Solana

Priority:

Future expansion.


Requires:

- Additional compatibility review
- Different ecosystem tooling


# Liquidity Requirements

A bridge does not create liquidity automatically.

Each destination chain requires:

- Trading pair
- Initial liquidity
- Market availability
- Monitoring


Recommended approach:

Start with one chain.

Suggested Base launch ranges:

Minimum testing liquidity:

$5,000+

Stronger market launch:

$25,000-$50,000+


Final amount depends on:

- Expected volume
- Community size
- Marketing capacity
- Market conditions


# Operational Requirements

Before launch:

Required:

- Multisig control
- Monitoring alerts
- Emergency procedures
- Contract verification
- Bridge reserve tracking


# Implementation Sequence

## Step 1

Confirm bridge provider compatibility.


## Step 2

Deploy destination infrastructure.


## Step 3

Test transfers.


## Step 4

Verify contracts and metadata.


## Step 5

Add liquidity.


## Step 6

Public launch.


# Current Recommendation

Proceed with Wormhole NTT technical validation.

Do not deploy until:

- TON support is confirmed
- Costs are known
- Security model is reviewed
- Liquidity budget is decided
