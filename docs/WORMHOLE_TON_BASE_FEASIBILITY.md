# KRID Wormhole TON → Base Feasibility

## Objective

Determine whether KRID can expand from TON Mainnet to Base using Wormhole infrastructure.

Target:

TON KRID → Base KRID


## Current KRID State

Chain:

TON Mainnet


Standard:

TEP-74 Jetton


Properties:

- Fixed supply
- Minting disabled
- Admin removed
- 9 decimals
- Metadata configured


## Target Architecture

TON KRID

        |

Wormhole messaging layer

        |

Base KRID

        |

KRID / ETH liquidity


## TON Requirements

Verify:

- TON Jetton compatibility
- Source asset configuration
- Required bridge contracts
- Security controls


## Base Requirements

Required:

- ERC-20 representation
- Contract verification
- Metadata configuration
- Ownership controls
- Liquidity pool


## Liquidity Considerations

Bridge availability does not create liquidity.

Base requires:

- KRID/ETH pool
- Initial liquidity
- Market monitoring


Suggested ranges:

Testing:

$2,000-$5,000


Public launch:

$10,000-$25,000+


## Security Requirements

Before launch:

- Test transfers
- Supply accounting validation
- Multisig controls
- Monitoring
- Emergency procedures


## Decision

Proceed only after:

1. Wormhole TON compatibility confirmed
2. Deployment requirements known
3. Costs understood
4. Liquidity budget selected
