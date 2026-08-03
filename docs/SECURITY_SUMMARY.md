# KRID Security Summary

## Project

Name:
Kridder

Symbol:
KRID

Chain:
TON Mainnet

Token Standard:
TON Jetton (TEP-74)


## Canonical Contract

Jetton Minter:

EQCzrzXy-CRTA6-A_WMgWaRjCu8xvS9SW7AhiwvavxLBfvHP


## Supply Configuration

Total Supply:

1,000,000,000 KRID


Decimals:

9


Minting:

Disabled


Admin:

Permanently removed


## Security Verification

Completed:

- Jetton source review
- ABI inspection
- Deployment verification
- OpenAudit AI-assisted security review
- Supply validation
- Metadata validation
- Allocation wallet documentation


## Security Properties

Verified:

### Fixed Supply

KRID has a fixed maximum supply of:

1,000,000,000 tokens


### Mint Controls

Minting is disabled.

No additional KRID supply can be created.


### Administrative Controls

Admin privileges have been removed.

The deployed contract no longer has an active administrative controller.


### Jetton Compliance

Implementation includes:

- TEP-74 compatible Jetton architecture
- Jetton wallet discovery
- Transfer validation
- Burn notification validation
- Bounce handling


## Wallet Allocation

| Role | Allocation |
|---|---:|
| Creator | 100,000,000 KRID |
| Community | 650,000,000 KRID |
| Liquidity | 150,000,000 KRID |
| Marketing | 50,000,000 KRID |
| Treasury | 25,000,000 KRID |
| Bridge Reserve | 25,000,000 KRID |

Total:

1,000,000,000 KRID


## Bridge Expansion Security Model

KRID will use a locked backing model for cross-chain expansion.

The TON Jetton remains the canonical asset.

Cross-chain representations will be backed by locked TON KRID held in the Bridge Reserve wallet.


## Bridge Reserve

Address:

UQAlSvxAeEFiWZw9UJCQVNPjXxDX4c3wzW8S8QGxTC9crCu3


Allocation:

25,000,000 KRID


Purpose:

Backing future KRID representations on additional networks.


## Planned Networks

Initial:

- Base
- BNB Chain
- Arbitrum

Future:

- Solana


## Bridge Evaluation

Preferred evaluation:

Wormhole ecosystem

Requirements:

- Cross-chain supply accounting
- Secure messaging
- Monitoring
- Emergency controls
- Contract verification
