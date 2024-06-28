**Overview**

This project involves creating a basic ERC20 token named MyToken (MTK) by utilizing the OpenZeppelin library. The smart contract allows for minting and burning tokens, with only the contract owner having access control.

**Prerequisites**

- Solidity version: ^0.8.26
- OpenZeppelin Contracts: ERC20

**Features**

**1. Importing ERC20 Standard** 

This token is built on OpenZeppelin's ERC20 contract, guaranteeing that it meets the requirements of the ERC20 standard. It can seamlessly work with Ethereum applications, wallets, and exchanges that are compatible with ERC20 tokens.

**2. Minting token** 

**- Function** The mint(address to, uint256 amount) function allows the contract owner to mint new tokens to the specific address.

**- Parameters:**

to: The address to which new tokens will be minted.

amount: The number of tokens to be minted.

**3. Burning token**

**- Function** The burn(address from, uint256 amount) function allows the contract owner to burn (destroy) existing tokens from the specified from address.

**- Parameters:**

from: The address from which tokens will be burned.

amount: The number of tokens to be burned.

**4. Constructor function** 

The constructor function runs during contract deployment, setting the token's name ("MyToken") and symbol ("MTK") with ERC20 constructor arguments. Additionally, it assigns the owner variable to the deploying address.


**Code**
```
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
```
**Usage**

To compile the contract, go to the "Solidity Compiler" tab in Remix IDE and select the appropriate compiler version, such as 0.8.26. Click on "Compile MyToken.sol" to compile the contract. Then, switch to the "Deploy & Run Transactions" tab to deploy the compiled contract. Once deployed, the contract owner can use the mint function to mint new tokens to a specified address and increase the total supply of tokens. Similarly, the owner can use the burn function to burn tokens from a specified address and decrease the total supply of tokens.

**License** This project is licensed under the MIT License.
