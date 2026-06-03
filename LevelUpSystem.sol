// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LevelUpSystem {
    mapping(address => uint256) public level;
    mapping(address => uint256) public experience;

    event LeveledUp(address user, uint256 newLevel);

    function gainExperience(uint256 exp) public {
        experience[msg.sender] += exp;
        if (experience[msg.sender] >= level[msg.sender] * 100 + 100) {
            level[msg.sender] += 1;
            emit LeveledUp(msg.sender, level[msg.sender]);
        }
    }

    function gainMultipleExp(uint256 times) public {
        for (uint256 i = 0; i < times; i++) {
            gainExperience(50);
        }
    }
}
