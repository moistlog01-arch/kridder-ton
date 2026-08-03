# KRID Bridge Wallet Setup

## Objective

Define the wallet architecture required for KRID multichain expansion.

Goal:

Maintain security separation between:

- Bridge operations
- Deployment
- Treasury
- Liquidity


# Wallet Structure


## 1. Bridge Operations Wallet

Purpose:

Manage bridge-related operations.

Responsibilities:

- Bridge configuration
- Operational approvals
- Integration tasks


Status:

NOT CREATED


Address:

TBD


Security:

- Dedicated wallet
- Limited funding
- Separate from treasury


---

## 2. Base Deployment Wallet

Purpose:

Deploy Base-side infrastructure.


Responsibilities:

- Contract deployment
- Verification
- Configuration


Status:

NOT CREATED


Address:

TBD


Security:

- Temporary operational use
- Fund only required amount


---

## 3. Base Treasury Wallet

Purpose:

Hold ecosystem allocations on Base.


Responsibilities:

- Ecosystem funds
- Future incentives
- Partnerships


Status:

NOT CREATED


Address:

TBD


Security:

Recommended:

- Multisig
- Multiple approvals
- Documented ownership


---

## 4. Base Liquidity Wallet

Purpose:

Manage KRID/Base liquidity.


Responsibilities:

- Initial liquidity
- LP management
- Market operations


Status:

NOT CREATED


Address:

TBD


Security:

- Separate from treasury
- Transparent tracking


# Funding Requirements

Before deployment:

Required:

- ETH for Base gas
- Bridge testing funds
- Liquidity allocation


# Wallet Separation Rules

Do not:

- Deploy from treasury wallet
- Hold all assets in one wallet
- Mix operational and liquidity funds


# Recommended Flow


TON KRID Treasury

        |

Bridge Operations

        |

Base Deployment

        |

Base Liquidity


# Security Checklist

Before launch:

[ ] Wallets created

[ ] Addresses documented

[ ] Backups secured

[ ] Permissions reviewed

[ ] Funding plan approved


# Current Status

Wallet architecture:

DEFINED


Creation:

PENDING


Next Steps:

1. Confirm bridge requirements
2. Create wallets
3. Fund operational wallets
4. Begin test environment setup
