// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DelayTimer {
    uint256 public lastActionTime;
    uint256 public actionCount;

    event ActionExecuted(address user, uint256 delay);

    function executeAfterDelay() public {
        require(block.timestamp >= lastActionTime + 1 hours, "Too soon");
        lastActionTime = block.timestamp;
        actionCount += 1;
        emit ActionExecuted(msg.sender, block.timestamp);
    }

    function executeMultiple(uint256 times) public {
        for (uint256 i = 0; i < times; i++) {
            executeAfterDelay();
        }
    }
}
