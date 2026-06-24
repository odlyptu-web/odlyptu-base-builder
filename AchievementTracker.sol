// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AchievementTracker {
    mapping(address => mapping(uint256 => bool)) public unlocked;
    uint256 public totalUnlocks;

    event AchievementUnlocked(address indexed user, uint256 achievementId);

    function unlockAchievement(uint256 achievementId) public {
        unlocked[msg.sender][achievementId] = true;
        totalUnlocks += 1;
        emit AchievementUnlocked(msg.sender, achievementId);
    }

    function unlockMultiple(uint256 times) public {
        for (uint256 i = 0; i < times; i++) {
            unlockAchievement(i + 1);
        }
    }
}
