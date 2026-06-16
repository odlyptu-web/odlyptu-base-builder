// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TaskBoard {
    uint256 public taskCount;
    mapping(address => uint256) public completedByUser;

    event TaskCompleted(address user, uint256 taskId);

    function completeTask(uint256 taskId) public {
        taskCount += 1;
        completedByUser[msg.sender] += 1;
        emit TaskCompleted(msg.sender, taskId);
    }

    function completeMultiple(uint256 times) public {
        for (uint256 i = 0; i < times; i++) {
            completeTask(i + 1);
        }
    }
}
