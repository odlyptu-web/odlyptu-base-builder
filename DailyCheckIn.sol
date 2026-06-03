// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StorageV1 {
    string public message = "Hello Base! My first GitHub commit for builder activities";

    function setMessage(string memory newMsg) public {
        message = newMsg;
    }

    function getMessage() public view returns (string memory) {
        return message;
    }
}
