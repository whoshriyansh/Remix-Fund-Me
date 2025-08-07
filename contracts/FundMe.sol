// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./PriceConvertor.sol";

/*
Our Main Motive
1. Get Funds from the User
2. Withdraw Funds
3. Set a Minimum Funding Value in USD
*/

contract FundMe {

    using  PriceConvertor for uint256;

    uint256 public minUsd = 50 * 1e18;

    address[] public funders;
    mapping (address => uint256) public addressToFunders;

    function fund() public payable {
        /*First Issues -> There should be a minimum fund ammount in USD.
            1. How do we send the ETH to the account. -> For sending or taking value we need to mark our function
            2. How do we get the ETH from the account. -> To get The value we can use the Global Variable keyword msg and then extract value from it.
        
        Second Issue -> How to convert eth into usd to match if the dontaion is above 50 USD.
        Solution -> We can use Chainlink Oracles. 
        */

        require(msg.value.getConversionalRate() >= minUsd, "Didn't Send Enough!");
        funders.push(msg.sender);
        addressToFunders[msg.sender] += msg.value;
        //This statement in for reverting and it means that undo every action before and send back the remaining gas which did't get used.
    }
  
}