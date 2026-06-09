// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LotteryDraw {
    uint256 public drawCount;
    mapping(address => uint256) public wins;

    event Drew(address player, uint256 result);

    function draw() public {
        drawCount += 1;
        uint256 result = block.timestamp % 10;
        if (result >= 7) wins[msg.sender] += 1;
        emit Drew(msg.sender, result);
    }

    function drawMultiple(uint256 times) public {
        for (uint256 i = 0; i < times; i++) {
            draw();
        }
    }
}
