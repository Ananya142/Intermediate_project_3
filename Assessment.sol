// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

// Import the ERC20 contract from OpenZeppelin
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

// Define the MyToken contract inheriting from ERC20
contract MyToken is ERC20 {
    address public owner; 

    //created a Constructor function to initialize the ERC20 token 
    constructor() ERC20("MyToken", "MTK") {
        owner = msg.sender; 
    }

    // Function to mint tokens to a specified address 
    function mint(address to, uint256 amount) public {
        require(msg.sender == owner, "Only owner can mint"); 
        _mint(to, amount); 
    }

    // Function to burn tokens from a specified address
    function burn(address from, uint256 amount) public {
        require(msg.sender == owner, "Only owner can burn"); 
        _burn(from, amount); 
    }
}

