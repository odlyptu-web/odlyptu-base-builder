// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BatchExecutor {
    uint256 public executionCount;

    event BatchExecuted(address executor, uint256 count);

    function executeBatch(uint256 times) public {
        for (uint256 i = 0; i < times; i++) {
            executionCount += 1;
        }
        emit BatchExecuted(msg.sender, times);
    }
}
