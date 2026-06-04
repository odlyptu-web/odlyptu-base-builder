// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MessageBoard {
    string[] public messages;
    mapping(address => uint256) public feedbackCount;

    event MessagePosted(address indexed user, string message, uint256 index);

    function postMessage(string memory message) public {
        messages.push(message);
        feedbackCount[msg.sender] += 1;
        emit MessagePosted(msg.sender, message, messages.length - 1);
    }

    function postMultiple(string memory baseMessage, uint256 times) public {
        for (uint256 i = 0; i < times; i++) {
            postMessage(string(abi.encodePacked(baseMessage, " #", i)));
        }
    }
}
