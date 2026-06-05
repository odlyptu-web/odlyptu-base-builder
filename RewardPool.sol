// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RewardPool {
    mapping(address => uint256) public rewards;
    uint256 public totalRewards;

    event RewardClaimed(address user, uint256 amount);

    function claimReward(uint256 amount) public {
        rewards[msg.sender] += amount;
        totalRewards += amount;
        emit RewardClaimed(msg.sender, amount);
    }

    function claimMultiple(uint256 times) public {
        for (uint256 i = 0; i < times; i++) {
            claimReward(50);
        }
    }
}
