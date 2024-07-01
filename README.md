# Staking Contract Project

This project contains a simple staking contract developed during my internship with Guild Audit. The primary objective of this project is to understand and implement fuzzing and invariants testing using Foundry.

## Project Structure

- `src/Staking.sol`: The staking contract.
- `test/StakingTest.t.sol`: The test contract containing unit tests and invariant tests.

## Staking Contract

The staking contract allows users to stake ETH and later unstake it. The contract also includes an owner who can withdraw the contract's balance.

### Features

- **Stake ETH**: Users can stake ETH by sending it to the contract.
- **Unstake ETH**: Users can unstake a specified amount of ETH from their staked balance.
- **Withdraw**: The owner can withdraw the entire balance of the contract.

### Events

- `Staked`: Emitted when a user stakes ETH.
- `Unstaked`: Emitted when a user unstakes ETH.

### Functions

- `stake()`: Allows users to stake ETH.
- `unstake(uint256 amount)`: Allows users to unstake a specified amount of ETH.
- `withdraw()`: Allows the owner to withdraw the contract's balance.

## Testing

The project includes tests written using Foundry's testing framework. The tests ensure the correctness and robustness of the staking contract through fuzzing and invariant testing.

### Invariant Tests

- **Total Staked Invariant**: Ensures that the sum of all individual stakes equals the `totalStaked` value.
- **No Negative Stakes Invariant**: Ensures that no user has a negative stake.

### Unit Tests

- **testStake()**: Tests the staking functionality.
- **testUnstake()**: Tests the unstaking functionality.

## Setup and Usage

1. **Install Foundry**

   Follow the installation instructions from the [Foundry GitHub page](https://github.com/foundry-rs/foundry):

   ```sh
   curl -L https://foundry.paradigm.xyz | bash
   foundryup

2. **Clone the Repository**
    git clone https://github.com/Bryanmankind/guildAudits_stakingContract.git
    cd guildAudits_stakingContract

3. **Run the Tests**
    forge test
