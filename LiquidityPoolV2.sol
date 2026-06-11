// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LiquidityPoolV2 {
    mapping(address => uint256) public liquidity;
    uint256 public totalLiquidity;

    event LiquidityAdded(address user, uint256 amount);

    function addLiquidity(uint256 amount) public {
        liquidity[msg.sender] += amount;
        totalLiquidity += amount;
        emit LiquidityAdded(msg.sender, amount);
    }

    function addMultiple(uint256 times) public {
        for (uint256 i = 0; i < times; i++) {
            addLiquidity(200);
        }
    }
}
