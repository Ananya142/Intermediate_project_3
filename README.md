**ERC20 Token**

**Description**

This program is a simple contract written in Solidity, a programming language used for developing smart contracts on the Ethereum blockchain. It extends the functionality of the widely used ERC20 token standard provided by OpenZeppelin. The purpose of this contract is to create a new ERC20 token named "MyToken" with the symbol "MTK." This token includes additional functionalities for minting and burning tokens, which can only be executed by the contract owner.

**Prerequisites**

- Solidity version: ^0.8.26
- OpenZeppelin Contracts: ERC20

 **Getting Started**

**1. Importing ERC20 Standard** 

This token is built on OpenZeppelin's ERC20 contract, guaranteeing that it meets the requirements of the ERC20 standard. It can seamlessly work with Ethereum applications, wallets, and exchanges that are compatible with ERC20 tokens.

**2. Minting token** 

**- Function** The mint(address to, uint256 amount) function allows the contract owner to mint new tokens to the specific address.

**3. Burning token**

**- Function** The burn(address from, uint256 amount) function allows the contract owner to burn (destroy) existing tokens from the specified from address.

**4. Constructor function** 

The constructor function runs during contract deployment, setting the token's name ("MyToken") and symbol ("MTK") with ERC20 constructor arguments. Additionally, it assigns the owner variable to the deploying address.

**5. Transferring**

Standard ERC20 transfer functionality, allowing token transfers between addresses.

**Executing program**

To run this program, I use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once I am on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., MyToken.sol). Paste the following code into the file

**Code**
```

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
   
```


To compile the contract, go to the "Solidity Compiler" tab in Remix IDE and select the appropriate compiler version, such as 0.8.26. Click on "Compile MyToken.sol" to compile the contract. Once the code is compiled then, switch to the "Deploy & Run Transactions" tab to deploy the compiled contract. Once the contract is deployed, I interact with it by using the functions. 
Firstly I use the mint function to mint new tokens to a specified address and increase the total supply of tokens. Similarly, I use the burn function to burn tokens from a specified address and decrease the total supply of tokens.

**License** This project is licensed under the MIT License.
