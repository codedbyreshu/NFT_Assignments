// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract TecharaNFT is ERC721URIStorage, Ownable {

    uint256 public tokenCounter;

    constructor() 
        ERC721("TecharaNFT", "TNFT") 
        Ownable(msg.sender)   
    {
        tokenCounter = 0;
    }

    //Add a condition so that only contract owner can mint
    function mintNFT(address recipient, string memory tokenURI) public onlyOwner returns (uint256) {
        //Limit total NFTs to maximum 5
        require (tokenCounter <= 5," maximum limit reached");
        //Prevent minting if tokenURI is empty
        require (bytes(tokenURI).length>0," tokenURI cannot be empty");
        uint256 newItemId = tokenCounter;

        _safeMint(recipient, newItemId);
        _setTokenURI(newItemId, tokenURI);

        tokenCounter++;

        return newItemId;
    }
}