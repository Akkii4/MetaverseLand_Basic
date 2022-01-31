// SPDX-License-Identifier:
pragma solidity ^0.8.10;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract MetaLand is ERC721 {
    uint256 public landID;

    constructor() ERC721("MetaLand", "LAND") {}

    function _baseURI() internal pure override returns (string memory) {
        return "https://path/to/metadata";
    }

    function mintLand() external payable {
        require(msg.value == 1 ether, "Land price is 1 ether");
        require(landID < 10000, "All land IDs are already taken");
        _safeMint(msg.sender, landID);
        landID++;
    }
}
