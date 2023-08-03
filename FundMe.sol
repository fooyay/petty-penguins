// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

// Get funds
// Withdraw funds
// Set a minimum funding value in USD

contract FundMe {

    uint256 public minimumUsd = 5;

    function fund() public payable {
        require(msg.value > 1e18, "Didn't send enough ETH.");
    }

    // function withdraw() public {}

    function getPrice() public view returns(uint256) {
        // Sepolia ETH/USD 0x694AA1769357215DE4FAC081bf1f309aDC325306
        // MainNet ETH/USD 0x5f4eC3Df9cbd43714FE2740f5E3616155c5b8419
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (, int256 price,,,) = priceFeed.latestRoundData();
        // Price returned is shifted 8 decimal places
        // 1 eth is 1e18 wei
        // so we want to divided by 1e8 and multiply by 1e18
        // net, multiply by 1e10
        return uint256(price * 1e10);
    }

    function getConversionRate() public {}

    function getVersion() public view returns (uint256) {
        return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();
    }
}