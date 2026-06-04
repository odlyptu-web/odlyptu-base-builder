// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BridgeSimulator {
    mapping(address => uint256) public bridgedAmount;
    uint256 public totalBridged;

    event Bridged(address user, uint256 amount, string targetChain);

    function bridge(uint256 amount, string memory targetChain) public {
        bridgedAmount[msg.sender] += amount;
        totalBridged += amount;
        emit Bridged(msg.sender, amount, targetChain);
    }

    function bridgeMultiple(uint256 times) public {
        for (uint256 i = 0; i < times; i++) {
            bridge(100, "Ethereum");
        }
    }
}
