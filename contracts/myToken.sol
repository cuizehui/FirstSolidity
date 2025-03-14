// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract NELANFT is ERC721URIStorage, Ownable {
    uint256 private _tokenIds;  
    uint256 public constant MAX_SUPPLY = 1000; // 设置最大供应量

    // 向 ERC721 构造函数传递代币名称和符号
    /**
     * @dev 合约构造函数，初始化 ERC721 代币的名称和符号，同时初始化 ERC721URIStorage 和 Ownable 合约
     */
    constructor() 
        ERC721("NELANFT", "NELA") 
        
        ERC721URIStorage() 
        Ownable(msg.sender) 
    {
        _tokenIds = 0;
    }

    function mintNFT(address recipient, string memory tokenURI)
        public onlyOwner
        returns (uint256)
    {
        require(recipient != address(0), "Invalid recipient address");  // 检查接收者地址是否有效
        require(bytes(tokenURI).length > 0, "Invalid token URI");  // 检查元数据 URI 是否为空
        require(_tokenIds < MAX_SUPPLY ,  "Max supply reached");  // 检查是否达到最大供应量     
        _tokenIds++;
        uint256 newItemId = _tokenIds;
        _mint(recipient, newItemId);
        _setTokenURI(newItemId, tokenURI);
        return newItemId;
    }

}