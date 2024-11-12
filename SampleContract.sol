// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SampleContract {
    address public owner;
    mapping(address => uint256) public balances;

    constructor() {
        owner = msg.sender;
    }

    // Require statement example
    function deposit() public payable {
        require(msg.value > 0, "Deposit must be greater than zero");
        balances[msg.sender] += msg.value;
    }

    // Revert statement example
    function withdraw(uint256 amount) public {
        if (amount > balances[msg.sender]) {
            revert("Insufficient balance");
        }
        balances[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
    }

    // Assert statement example
    function checkOwner() public view {
        assert(owner == msg.sender)
    }
}
