// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import "forge-std/Script.sol";
import "../src/DeadMansWallet.sol";

contract DeployDeadMansWallet is Script {
    function run() external {
        // Load deployer's private key from .env or environment
        uint256 deployerKey = vm.envUint("PRIVATE_KEY");

        // Broadcast transactions using the deployer's key
        vm.startBroadcast(deployerKey);

        // Customize: heir address + timeout (in seconds)
        address heir = vm.envAddress("HEIR_ADDRESS"); // define in .env
        uint256 timeout = 7 days;

        new DeadMansWallet(heir, timeout);

        vm.stopBroadcast();
    }
}

