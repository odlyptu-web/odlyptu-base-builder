// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CrossChainBridgeMock {
    mapping(address => uint256) public bridged;
    uint256 public totalBridged;

    event Bridged(address user, uint256 amount, string target);

    function bridge(uint256 amount, string memory target) public {
        bridged[msg.sender] += amount;
        totalBridged += amount;
        emit Bridged(msg.sender, amount, target);
    }

    function bridgeMultiple(uint256 times) public {
        for (uint256 i = 0; i < times; i++) {
            bridge(100, "Ethereum");
        }
    }
}
