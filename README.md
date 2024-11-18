# DecentralizedVoting: Solidity Smart Contract for Secure Voting

## Project Overview

**DecentralizedVoting** is a Solidity-based smart contract designed to facilitate a secure and decentralized voting process. The contract allows users to propose new ideas and vote on them. It ensures that only valid proposals can be added, prevents duplicate proposals, and restricts voting to one vote per address. Additionally, it includes robust error-handling mechanisms using Solidity's `require()`, `assert()`, and `revert()` statements to guarantee the integrity of the voting process.

This contract is designed to provide a transparent and fair way to conduct voting within a decentralized application, with additional security checks to prevent fraudulent behavior.

## Features

- **Add Proposal**: Only the contract owner can add new proposals, ensuring that the process is controlled and manageable.
- **Vote on Proposals**: Users can vote on proposals, but each address is limited to one vote per proposal.
- **Proposal Integrity**: Proposals are hashed to prevent duplication, and only valid proposals can be voted on.
- **Security and Error Handling**: Implements `require()`, `assert()`, and `revert()` statements for validation and error handling.

## Contract Details

### `DecentralizedVoting` - Key Functions and Statements

1. **Constructor**
   - Sets the contract owner as the deployer of the contract.

2. **`addProposal()` Function**
   - Allows the contract owner to add a new proposal.
   - Ensures the proposal description is not empty and prevents duplicate proposals using `require()`.
   - Emits an `ProposalAdded` event when a proposal is successfully added.

3. **`vote()` Function**
   - Allows users to vote on a specific proposal.
   - Ensures the user has not voted already and the proposal ID is valid using `require()`.
   - Verifies the vote count using `assert()` to ensure it is updated correctly.
   - Emits a `VoteCast` event when a vote is cast.

4. **`getAllProposals()` Function**
   - Returns all proposals with their IDs, descriptions, and vote counts.

5. **`getProposalCount()` Function**
   - Returns the total number of proposals in the contract.

6. **Fallback and Receive Functions**
   - Prevent accidental ether deposits by rejecting any incoming ether transactions using `revert()`.

### Error-Handling Statements Summary

- **`require()`**: Ensures valid proposal descriptions, prevents duplicate proposals, and validates user votes.
- **`assert()`**: Verifies the correctness of the vote count for proposals.
- **`revert()`**: Prevents accidental ether deposits by rejecting any incoming ether.

## Usage

- **Add Proposal**: The contract owner can add new proposals.
- **Vote on Proposal**: Users can vote on existing proposals.
- **View Proposals**: Anyone can view the list of proposals, including their descriptions and vote counts.
- **Check Total Proposals**: Users can check the total number of proposals.

## License

This project is licensed under the MIT License.

## Author

- **Juan Carlos Francisco** - [GitHub Profile](https://github.com/wan1carlos)
