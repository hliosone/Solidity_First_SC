// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

//Get funds from users
//Withdraw funds
//Set a minimum funding value in USD

contract FundMe{

    uint256 public minimumUSD = 50;

    function fund() public payable {
        require((msg.value >= 1e18), "Didnd't send enough");

    //function withdraw(){}
    }
}