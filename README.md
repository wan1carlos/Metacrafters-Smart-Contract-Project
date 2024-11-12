# SampleContract: Solidity Smart Contract with Error Handling

## Project Overview

**SampleContract** is a Solidity-based smart contract designed to demonstrate essential error-handling mechanisms in Solidity: `require()`, `revert()`, and `assert()`. This contract enables users to deposit and withdraw Ether while ensuring the validity of transactions and ownership through smart contract error-handling features.

This project provides examples of each of these statements, helping developers understand how to apply them for improved contract security and functionality.

## Features

- **Deposit**: Users can deposit Ether into the contract with a `require()` statement validating the minimum deposit amount.
- **Withdraw**: Users can withdraw Ether from their balance with a `revert()` statement ensuring they have sufficient funds.
- **Owner Verification**: Verifies contract ownership with `assert()` to restrict owner-only functions.

## Contract Details

### `SampleContract` - Key Functions and Statements

1. **Constructor**
   - Sets the `owner` of the contract to the address that deploys the contract.

2. **`deposit()` Function**
   - Allows a user to deposit Ether into the contract.
   - Implements `require()` to ensure the deposited value is greater than zero.
   - **Error Handling**: Fails if the deposit amount is zero or less.

3. **`withdraw()` Function**
   - Enables a user to withdraw Ether from their balance.
   - Uses `revert()` within an `if` statement to check for sufficient balance.
   - **Error Handling**: Fails if the requested withdrawal amount exceeds the user’s balance.

4. **`checkOwner()` Function**
   - Verifies that the caller is the contract owner.
   - Implements `assert()` to confirm ownership, essential for security-sensitive functions.
   - **Error Handling**: Fails if `msg.sender` is not the owner, indicating a critical code issue.

## Usage

1. **Deposit Ether**
   - `await contractInstance.deposit({ from: userAddress, value: web3.utils.toWei("1", "ether") });`

2. **Withdraw Ether**
   - `await contractInstance.withdraw(web3.utils.toWei("0.5", "ether"), { from: userAddress });`

3. **Verify Ownership**
   - `await contractInstance.checkOwner({ from: ownerAddress });`

## Error-Handling Statements Summary

- **`require()`**: Ensures that only positive amounts are deposited, providing an error message if conditions are unmet.
- **`revert()`**: Cancels withdrawals if the balance is insufficient, protecting user funds.
- **`assert()`**: Verifies that only the owner can access certain functions, ensuring contract integrity.

## License

This project is licensed under the MIT License.

## Author

- **Juan Carlos Francisco** - [GitHub Profile](https://github.com/wan1carlos)
