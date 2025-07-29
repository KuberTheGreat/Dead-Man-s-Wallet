// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import "forge-std/Script.sol";
import "../src/DeadMansWallet.sol";

contract HeartbeatScript is Script {
    function run() external {
        uint256 deployerKey = vm.envUint("PRIVATE_KEY");

        vm.startBroadcast(deployerKey);

        DeadMansWallet wallet = DeadMansWallet(payable(vm.envAddress("CONTRACT_ADDRESS")));
        wallet.heartbeat();

        vm.stopBroadcast();
    }
}
