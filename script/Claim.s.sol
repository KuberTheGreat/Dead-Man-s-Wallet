// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import "forge-std/Script.sol";
import "../src/DeadMansWallet.sol";

contract ClaimScript is Script {
    function run() external {
        uint256 heirKey = vm.envUint("HEIR_PRIVATE_KEY");

        vm.startBroadcast(heirKey);

        DeadMansWallet wallet = DeadMansWallet(payable(vm.envAddress("CONTRACT_ADDRESS")));
        wallet.claim();

        vm.stopBroadcast();
    }
}
