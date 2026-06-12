// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract NFTMinterV3 is ERC721 {
    uint256 private _tokenIdCounter;

    constructor() ERC721("Base Builder NFT V3", "BBNFT3") {}

    function mint() public {
        uint256 tokenId = _tokenIdCounter;
        _tokenIdCounter += 1;
        _safeMint(msg.sender, tokenId);
    }

    function mintMultiple(uint256 quantity) public {
        for (uint256 i = 0; i < quantity; i++) {
            mint();
        }
    }
}
