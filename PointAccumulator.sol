// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PointAccumulator {
    mapping(address => uint256) public points;
    uint256 public totalPoints;

    event PointsAdded(address user, uint256 amount, uint256 newTotal);

    function addPoints(uint256 amount) public {
        points[msg.sender] += amount;
        totalPoints += amount;
        emit PointsAdded(msg.sender, amount, points[msg.sender]);
    }

    function addMultiple(uint256 times) public {
        for (uint256 i = 0; i < times; i++) {
            addPoints(100);
        }
    }
}

