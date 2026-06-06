// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CrossChainMessenger {
    mapping(address => uint256) public messagesSent;
    uint256 public totalMessages;

    event MessageSent(address from, string message, string targetChain);

    function sendMessage(string memory message, string memory targetChain) public {
        messagesSent[msg.sender] += 1;
        totalMessages += 1;
        emit MessageSent(msg.sender, message, targetChain);
    }

    function sendMultiple(string memory baseMessage, uint256 times) public {
        for (uint256 i = 0; i < times; i++) {
            sendMessage(baseMessage, "Ethereum");
        }
    }
}
