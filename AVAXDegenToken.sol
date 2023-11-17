// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts@4.9.0/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts@4.9.0/access/Ownable.sol";

contract DegenToken is ERC20, Ownable {

    struct Food {
        uint256 price;
    }

    mapping(address => uint256) public redeemedItems;
    mapping(string => Food) public foods;

    constructor() ERC20("Degen", "DGN") {
        foods["Spaghetti"] = Food(120);
        foods["Chicken"] = Food(70);
    }

    function mint(uint256 amount) public onlyOwner {
        _mint(msg.sender, amount);
    }

    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }

    function redeem(string memory itemName) public payable {
        Food memory food = foods[itemName];
        require(food.price > 0, "Invalid item name");
        require(balanceOf(msg.sender) >= food.price, "Insufficient balance to redeem item");

        _burn(msg.sender, food.price);
        redeemedItems[msg.sender] += 1;
    }

    function getRedeemedItems(address account) public view returns (uint256) {
        return redeemedItems[account];
    }

    function transfer(address to, uint256 amount) public override returns (bool) {
        _transfer(_msgSender(), to, amount);
        return true;
    }
}
