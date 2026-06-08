// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract OraclePriceFeed {
    uint256 public currentPrice;
    uint256 public updateCount;

    event PriceUpdated(uint256 newPrice, uint256 timestamp);

    function updatePrice(uint256 newPrice) public {
        currentPrice = newPrice;
        updateCount += 1;
        emit PriceUpdated(newPrice, block.timestamp);
    }

    function updateMultiple(uint256 times) public {
        for (uint256 i = 0; i < times; i++) {
            updatePrice(2000 + (i * 10));
        }
    }
}
