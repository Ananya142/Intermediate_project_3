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

- **Go to the Remix website**:
  - Open your web browser and navigate to [Remix](https://remix.ethereum.org/).

- **Create a new file**:
  - Click on the "+" icon located in the left-hand sidebar.
  - A new file dialog will appear; name the file with a `.sol` extension (e.g., `MyToken.sol`).

- **Paste the following code into the file**:
  - Open the newly created `MyToken.sol` file.
  - Paste the Solidity code into the file editor.

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


- **Compile the contract**:
  - Navigate to the "Solidity Compiler" tab in the Remix IDE (usually represented by a gavel icon).
  - Select the appropriate compiler version from the dropdown menu (e.g., `0.8.26`).
    - If you don’t see the desired version, click on the "Load Compiler" button to find more versions.
  - After selecting the correct version, click on the "Compile `MyToken.sol`" button.
    - Ensure there are no errors in the code. If there are, fix them and recompile.

- **Deploy the compiled contract**:
  - Switch to the "Deploy & Run Transactions" tab (represented by a rocket icon).
  - In the "Environment" dropdown, select the desired environment.
  - Make sure your contract (`MyToken`) is selected in the "Contract" dropdown.
  - Click on the "Deploy" button to deploy the contract.
  - Wait for the deployment to complete. You should see your deployed contract under the "Deployed Contracts" section.

- **Interact with the deployed contract**:
  - **Mint new tokens**:
    - In the "Deployed Contracts" section, expand your deployed contract to see the available functions.
    - Locate the `mint` function.
    - Enter the recipient’s address and the amount of tokens to mint in the provided input fields.
    - Click on the `mint` button to execute the function. This will mint new tokens to the specified address and increase the total supply.
  - **Burn tokens**:
    - Locate the `burn` function in the list of available functions.
    - Enter the address from which tokens will be burned and the amount of tokens to burn in the provided input fields.
    - Click on the `burn` button to execute the function. This will burn the specified amount of tokens from the given address and decrease the total supply.
      
   - **Transfer tokens**:
     - address recipient: The address of the recipient to whom the tokens are being transferred.
     - uint256 amount: The amount of tokens to be transferred.
     - public: The function can be called by any external account or contract.
     - override: This function overrides the transfer function in the inherited ERC20 contract.
     - returns (bool): The function returns a boolean value indicating whether the transfer was successful.

- **Verify the results**:
  - Use the `totalSupply` function to check the total supply of tokens.
  - Use the `balanceOf` function to verify the balances of different addresses.

**License** This project is licensed under the MIT License.
