// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

// Import the ERC20 contract from OpenZeppelin
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

// Define the MyToken contract inheriting from ERC20
contract MyToken is ERC20 {
    // State variable to store the owner of the contract
    address public owner;

    // Constructor function to initialize the ERC20 token
    constructor() ERC20("MyToken", "MTK") {
        owner = msg.sender;
    }

    // Modifier to check if the caller is the owner
    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }

    // Function to mint tokens to a specified address
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    // Function to burn tokens from a specified address
    function burn(address from, uint256 amount) public onlyOwner {
        _burn(from, amount);
    }

    // Override the transfer function to explicitly handle token transfers
    function transfer(address recipient, uint256 amount) public override returns (bool) {
        _transfer(_msgSender(), recipient, amount);
        return true;
    }
}
