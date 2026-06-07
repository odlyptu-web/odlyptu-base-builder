// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract YieldFarmMock {
    mapping(address => uint256) public staked;
    uint256 public totalStaked;

    event Staked(address user, uint256 amount);
    event Harvested(address user, uint256 reward);

    function stake(uint256 amount) public {
        staked[msg.sender] += amount;
        totalStaked += amount;
        emit Staked(msg.sender, amount);
    }

    function harvest() public {
        emit Harvested(msg.sender, 50);
    }

    function stakeMultiple(uint256 times) public {
        for (uint256 i = 0; i < times; i++) {
            stake(200);
        }
    }
}
