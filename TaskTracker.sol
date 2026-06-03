// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TaskTracker {
    mapping(address => uint256) public completedTasks;
    uint256 public totalTasksCompleted;

    event TaskCompleted(address user, uint256 taskId);

    function completeTask(uint256 taskId) public {
        completedTasks[msg.sender] += 1;
        totalTasksCompleted += 1;
        emit TaskCompleted(msg.sender, taskId);
    }

    function completeMultiple(uint256 count) public {
        for (uint256 i = 0; i < count; i++) {
            completeTask(i + 1);
        }
    }
}
