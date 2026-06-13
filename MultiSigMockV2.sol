// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MultiSigMockV2 {
    mapping(address => bool) public owners;
    uint256 public transactionCount;

    event TransactionExecuted(address owner, uint256 txId);

    constructor() {
        owners[msg.sender] = true;
    }

    function executeTransaction() public {
        require(owners[msg.sender], "Not owner");
        transactionCount += 1;
        emit TransactionExecuted(msg.sender, transactionCount);
    }

    function executeMultiple(uint256 times) public {
        for (uint256 i = 0; i < times; i++) {
            executeTransaction();
        }
    }
}
