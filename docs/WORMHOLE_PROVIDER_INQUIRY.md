# KRID Wormhole Provider Inquiry

## Project

Kridder ($KRID)


## Current Deployment

Chain:

TON Mainnet


Token Standard:

TEP-74 Jetton


Properties:

- Fixed supply
- 1,000,000,000 total supply
- Minting disabled
- Admin removed
- 9 decimals


## Objective

Expand KRID from TON to Base while maintaining a single cross-chain token identity.


Target:

TON KRID
|
Wormhole
|
Base KRID


# Technical Questions

## TON Compatibility

1. Does Wormhole currently support TON Mainnet as an NTT source chain?

2. Can an existing TON Jetton (TEP-74) be integrated directly?

3. Does KRID require a custom adapter or middleware layer?

4. Are changes required to the existing Jetton contract?


## NTT Architecture

5. Can KRID use Native Token Transfer architecture?

6. How is supply accounting handled?

7. How are mint/burn permissions controlled?

8. What contracts are deployed on each chain?


## Base Deployment

9. What is required to deploy KRID on Base?

10. Is the Base representation an ERC-20 controlled by Wormhole contracts?

11. What ownership/security model is recommended?


## Costs

Request information on:

- Deployment costs
- Integration costs
- Testing requirements
- Ongoing operational costs


## Security

Request information on:

- Recommended controls
- Monitoring
- Upgrade requirements
- Emergency procedures


# Current Status

Decision:

Proceed only after Wormhole confirms TON compatibility.


# Alternative Path

If direct TON support is unavailable:

Evaluate:

- LayerZero
- Custom adapter
- Delayed expansion
