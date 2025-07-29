// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import "forge-std/Script.sol";
import "../src/DeadMansWallet.sol";

contract ViewStateScript is Script {
    function run() external view {
        address contractAddress = vm.envAddress("CONTRACT_ADDRESS");
        DeadMansWallet wallet = DeadMansWallet(payable(contractAddress));

        console.log(" Owner:        ", wallet.owner());
        console.log(" Heir:         ", wallet.heir());
        console.log(" Timeout (sec):", wallet.timeout());
        console.log(" Last Ping:    ", wallet.lastPing());
        // console.log(" Can Claim?:   ", wallet.canClaim());
    }
}
