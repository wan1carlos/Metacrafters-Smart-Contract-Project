// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DecentralizedVoting {
    // Owner of the contract
    address public owner;

    // Structure to define a proposal
    struct Proposal {
        string description;
        uint256 votes;
    }

    // List of proposals
    Proposal[] public proposals;

    // Mapping to track whether an address has voted
    mapping(address => bool) public hasVoted;

    // Mapping to track existing proposals (to prevent duplicates)
    mapping(bytes32 => bool) private proposalExists;

    // Event declarations
    event ProposalAdded(uint256 proposalId, string description, uint256 votes);
    event VoteCast(address indexed voter, uint256 proposalId);

    // Modifier to restrict actions to the owner
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can perform this action");
        _;
    }

    // Constructor: Set the owner to the deployer
    constructor() {
        owner = msg.sender;
    }

    // Function to add a proposal (only owner can add)
    function addProposal(string memory description) public onlyOwner {
        require(bytes(description).length > 0, "Proposal description cannot be empty");

        // Generate a hash of the proposal description to prevent duplicates
        bytes32 proposalHash = keccak256(abi.encodePacked(description));
        require(!proposalExists[proposalHash], "Duplicate proposal is not allowed");

        // Add the proposal
        proposals.push(Proposal({description: description, votes: 0}));
        uint256 proposalId = proposals.length - 1;
        proposalExists[proposalHash] = true;

        // Emit the ProposalAdded event to log the added proposal
        emit ProposalAdded(proposalId, description, 0);
    }

    // Function to vote on a proposal
    function vote(uint256 proposalId) public {
        require(!hasVoted[msg.sender], "You have already voted");
        require(proposalId < proposals.length, "Invalid proposal ID");

        // Update the votes for the proposal
        proposals[proposalId].votes += 1;
        hasVoted[msg.sender] = true;

        // Use assert to ensure the vote count is correctly updated
        assert(proposals[proposalId].votes > 0);

        // Emit the VoteCast event to log the vote
        emit VoteCast(msg.sender, proposalId);
    }

    // Function to get all proposals with IDs (returns an array of Proposal structs along with the proposal ID)
    function getAllProposals() public view returns (uint256[] memory, string[] memory, uint256[] memory) {
        uint256[] memory proposalIds = new uint256[](proposals.length);
        string[] memory descriptions = new string[](proposals.length);
        uint256[] memory votes = new uint256[](proposals.length);

        for (uint256 i = 0; i < proposals.length; i++) {
            proposalIds[i] = i; // Set the proposal ID to the index
            descriptions[i] = proposals[i].description;
            votes[i] = proposals[i].votes;
        }

        return (proposalIds, descriptions, votes);
    }

    // Function to get the total number of proposals
    function getProposalCount() public view returns (uint256) {
        return proposals.length;
    }

    // Fallback function to prevent accidental ether deposits
    fallback() external payable {
        revert("Ether not accepted");
    }

    receive() external payable {
        revert("Ether not accepted");
    }
}
