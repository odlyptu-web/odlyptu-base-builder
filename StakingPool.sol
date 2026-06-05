// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StakingPool {
    mapping(address => uint256) public staked;
    uint256 public totalStaked;

    event Staked(address user, uint256 amount);
    event Unstaked(address user, uint256 amount);

    function stake(uint256 amount) public {
        staked[msg.sender] += amount;
        totalStaked += amount;
        emit Staked(msg.sender, amount);
    }

    function unstake(uint256 amount) public {
        require(staked[msg.sender] >= amount, "Insufficient stake");
        staked[msg.sender] -= amount;
        totalStaked -= amount;
        emit Unstaked(msg.sender, amount);
    }

    function stakeMultiple(uint256 times) public {
        for (uint256 i = 0; i < times; i++) {
            stake(100);
        }
    }
}
