// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

library PriceConvertor{

    function getPrice () internal  view returns (uint256) {
        //We can use Chainlink Oracles to get the price of ETH in USD.
        //we need 2 things 
        //ABI -  we can use from the Github Repo
        //Address - 0x694AA1769357215DE4FAC081bf1f309aDC325306
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (,int256 answer,,,) = priceFeed.latestRoundData();
        //we are using the latestRoundData function to get the price of ETH in USD.
         
         return  uint256(answer * 1e10);
    }

    function getConversionalRate(uint256  ethAmount) internal  view returns (uint256){
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice*ethAmount) / 1e18;
        return  ethAmountInUsd;
    } 

}