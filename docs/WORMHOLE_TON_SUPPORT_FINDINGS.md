# KRID Wormhole TON Support Findings

## Investigation

Goal:

Determine whether KRID TON Jetton can use Wormhole NTT for Base expansion.


## Current Finding

Wormhole NTT architecture is suitable for KRID's multichain goal.

NTT provides:

- Native token transfer framework
- Token ownership control
- Metadata preservation
- Configurable security controls


## Open Question

Does Wormhole NTT directly support:

TON Mainnet Jettons (TEP-74)


Status:

UNCONFIRMED


## Required Answer

Need confirmation:

1. TON source chain support
2. TON Jetton compatibility
3. Adapter requirements
4. Deployment requirements
5. Cost estimates


## Current Recommendation

Do not deploy Base contracts until TON compatibility is confirmed.


## Possible Outcomes

### Outcome A

Direct NTT support:

TON KRID
→ Wormhole NTT
→ Base KRID


### Outcome B

Adapter required:

TON KRID
→ Custom integration
→ Wormhole
→ Base KRID


### Outcome C

Alternative bridge required:

Evaluate:

- LayerZero
- Other interoperability solutions


## Decision

Pending Wormhole TON confirmation.
