// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract QuestSystem {
    mapping(address => uint256) public completedQuests;
    uint256 public totalQuestsCompleted;

    event QuestCompleted(address user, uint256 questId);

    function completeQuest(uint256 questId) public {
        completedQuests[msg.sender] += 1;
        totalQuestsCompleted += 1;
        emit QuestCompleted(msg.sender, questId);
    }

    function completeMultipleQuests(uint256 times) public {
        for (uint256 i = 0; i < times; i++) {
            completeQuest(i + 1);
        }
    }
}
