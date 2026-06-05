// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MultiCallSimulator {
    uint256 public callCount;

    event Called(address user, uint256 callId);

    function multiCall(uint256 times) public {
        for (uint256 i = 0; i < times; i++) {
            callCount += 1;
            emit Called(msg.sender, callCount);
        }
    }
}
