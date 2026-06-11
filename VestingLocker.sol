// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VestingLocker {
    mapping(address => uint256) public locked;
    uint256 public totalLocked;

    event Locked(address user, uint256 amount);
    event Released(address user, uint256 amount);

    function lock(uint256 amount) public {
        locked[msg.sender] += amount;
        totalLocked += amount;
        emit Locked(msg.sender, amount);
    }

    function release(uint256 amount) public {
        require(locked[msg.sender] >= amount, "Insufficient locked");
        locked[msg.sender] -= amount;
        totalLocked -= amount;
        emit Released(msg.sender, amount);
    }

    function lockMultiple(uint256 times) public {
        for (uint256 i = 0; i < times; i++) {
            lock(100);
        }
    }
}
