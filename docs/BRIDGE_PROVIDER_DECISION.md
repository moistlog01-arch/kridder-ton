# KRID Bridge Provider Decision

## Decision Status

Current preferred architecture:

Wormhole Native Token Transfers (NTT)


## Objective

Expand KRID from TON into additional ecosystems while maintaining:

- One token identity
- Controlled supply
- Transparent accounting
- Secure cross-chain transfers


## Evaluation Summary

### Wormhole NTT

Status:

Preferred candidate for further technical validation.


Advantages:

- Designed for native token transfers
- Multi-chain architecture
- EVM ecosystem compatibility
- Solana ecosystem compatibility
- Token behavior preservation
- Security configuration options


Requirements before deployment:

- Confirm TON Jetton implementation path
- Confirm deployment workflow
- Confirm costs
- Review security model
- Determine operational requirements



### LayerZero OFT

Status:

Secondary candidate.


Advantages:

- Large omnichain ecosystem
- Strong EVM adoption
- Mature messaging infrastructure


Requires verification:

- TON Jetton compatibility
- Adapter requirements
- Deployment complexity
- Long-term maintenance requirements



## Recommended Rollout

### Phase 1

TON → Base

Reason:

- Low transaction costs
- Strong meme ecosystem
- EVM compatibility


### Phase 2

TON → BNB Chain


### Phase 3

TON → Arbitrum


### Phase 4

TON → Solana



## Current Recommendation

Proceed with Wormhole NTT technical investigation.

No bridge deployment should occur until:

- TON compatibility is confirmed
- Cost structure is known
- Security assumptions are reviewed
- Required contracts are identified


## Next Actions

1. Verify TON support
2. Determine required contracts
3. Estimate deployment costs
4. Determine liquidity requirements
5. Prepare implementation plan
