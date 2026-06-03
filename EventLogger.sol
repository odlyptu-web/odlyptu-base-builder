// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EventLogger {
    uint256 public logCount;

    event LogCreated(address indexed user, string message);

    function createLog(string memory message) public {
        logCount += 1;
        emit LogCreated(msg.sender, message);
    }

    function createMultipleLogs(uint256 times) public {
        for (uint256 i = 0; i < times; i++) {
            createLog("Log entry");
        }
    }
}
