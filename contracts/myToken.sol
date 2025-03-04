// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract NELANFT is ERC721URIStorage, Ownable {
    uint256 private _tokenIds;  

    // 向 ERC721 构造函数传递代币名称和符号
    /**
     * @dev 合约构造函数，初始化 ERC721 代币的名称和符号，同时初始化 ERC721URIStorage 和 Ownable 合约
     */
    constructor() 
        ERC721("NELANFT", "NELA") 
        ERC721URIStorage() 
        Ownable() 
    {
        _tokenIds = 0;
    }

    function mintNFT(address recipient, string memory tokenURI)
        public onlyOwner
        returns (uint256)
    {
        require(recipient != address(0), "Invalid recipient address");  // 检查接收者地址是否有效
        require(bytes(tokenURI).length > 0, "Invalid token URI");  // 检查元数据 URI 是否为空

        _tokenIds++;
        uint256 newItemId = _tokenIds;
        _mint(recipient, newItemId);
        _setTokenURI(newItemId, tokenURI);
        return newItemId;
    }
}