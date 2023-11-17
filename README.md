# AvalancheDegenToken

## Overview

This repository contains a Solidity smart contract named DegenToken. The contract is an ERC-20 token that extends the OpenZeppelin ERC-20 implementation and includes additional functionality for token minting, burning, and item redemption. It also incorporates a basic ownership model.

## Contract Details

### Token Information

- **Name**: Degen
- **Symbol**: DGN

### State Variables

- `redeemedItems`: A mapping tracking the number of items redeemed by each address.
- `foods`: A mapping associating food item names with their prices.

### Constructor

- Initializes the token with the name "Degen" and symbol "DGN".
- Predefines prices for two food items: "Spaghetti" and "Chicken".

### Functions

#### `mint(uint256 amount) public onlyOwner`

- Allows the owner to mint new tokens.

#### `burn(uint256 amount) public`

- Allows any address to burn a specified amount of tokens.

#### `redeem(string memory itemName) public payable`

- Allows users to redeem a food item by providing the item name and paying the specified amount of tokens.
- Updates the redeemed items count for the caller.

#### `getRedeemedItems(address account) public view returns (uint256)`

- Retrieves the number of items redeemed by a specific address.

#### `transfer(address to, uint256 amount) public override returns (bool)`

- Overrides the transfer function from ERC20 to add transfer functionality.

### Ownership

The contract uses the `Ownable` contract from OpenZeppelin, ensuring that certain functions can only be called by the owner.

## Usage

Deploy the contract to an Ethereum-compatible blockchain using a tool like Remix or Truffle.

## Author
Donato, Zeno 202011124@fit.edu.ph
