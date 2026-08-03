# KRID LayerZero Integration Inquiry

## Project

KRID ($KRID)


## Current Asset

Network:

TON Mainnet


Token Standard:

TEP-74 Jetton


Token Properties:

- Fixed supply
- 1,000,000,000 total supply
- Mint disabled
- Admin removed


## Objective

Make KRID an omnichain asset.

Target ecosystems:

- TON
- Base
- Solana
- Additional EVM chains


## Current Infrastructure

Prepared:

- Base deployment wallet
- Bridge operations wallet
- Treasury wallet
- Liquidity wallet
- Technical documentation


## Core Question

We need guidance on the correct LayerZero architecture.


Specifically:

Can an existing TON TEP-74 Jetton be integrated into LayerZero omnichain infrastructure?


## Architecture Questions


### Option A — Existing Token Integration

Can the current KRID Jetton remain the canonical asset while connecting to LayerZero?


Questions:

- Is an adapter required?
- Are existing token permissions sufficient?
- How is supply accounting handled?


### Option B — OFT Architecture

Should KRID migrate to a LayerZero OFT-style architecture?


Questions:

- What is the recommended migration path?
- How is TON handled as the source chain?
- How are Base and Solana representations deployed?


### Option C — Custom Integration

If neither option applies:

- Is a custom TON adapter required?
- What development requirements exist?
- What security review is recommended?


## Desired Outcome

A single KRID ecosystem:

TON KRID

|

LayerZero interoperability

|

Base KRID

|

Solana KRID

|

Additional networks


## Technical Background

KRID was designed with:

- fixed supply
- no future minting
- transparent allocation
- separated operational wallets


## Requested Guidance

Please provide:

1. Recommended architecture

2. Required contracts

3. Deployment process

4. Estimated timeline

5. Estimated costs

6. Security requirements


## Contact Summary

Project:

KRID

Network Origin:

TON

Expansion Goal:

Multichain liquidity and accessibility
