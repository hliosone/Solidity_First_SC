// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

//Get funds from users
//Withdraw funds
//Set a minimum funding value in USD

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract FundMe{

    uint256 public minimumUSD = 50;

    function fund() public payable {
        require(getConversionRate((msg.value)) >= 1e18, "Didn't send enough");
        //msg.value is going to have 18 decimals (1 eth = 1e18 wei)
        //function withdraw(){}
    }

    function getPrice() public view returns (uint256) {
    //ETH USD on Sepolia : 0x694AA1769357215DE4FAC081bf1f309aDC325306
    AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
    (,int256 price,,,) = priceFeed.latestRoundData();

    //ETH in terms of USD
    return uint256(price * 1e10); //to match format of 18 decimals and return uint
    }

    function getConversionRate(uint256 ethAmount) public view returns (uint256) {
        uint256 ethPrice = getPrice();
        //ethPrice ex : 1 eth is 2000 dollars

        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18;
        return ethAmountInUsd;
    }

    function ethInGwei (uint256 ethAmount) public pure returns (uint256){
        return (ethAmount * 1e9);
    }

    function gweiInEth (uint256 gweiAmount) public pure returns (uint256){
        return (gweiAmount / 1e9);
    }
}