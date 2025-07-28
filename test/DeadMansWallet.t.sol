// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "forge-std/Test.sol";
import "../src/DeadMansWallet.sol";

contract DeadMansWallet is Test {
    DeadMansWallet wallet;
    address owner = address(0xA);
    address heir = address(0xB);

    function setUp() public{
        vm.prank(owner);
        wallet = new DeadMansWallet(heir, 7 days);
    }

    function testHeartbeatAndClaim() public{
        vm.prank(owner);
        wallet.heartbeat();

        vm.warp(block.timestamp + 8 days);

        vm.prank(heir);
        vm.deal(address(wallet), 1 ether);

        uint256 balanceBefore = heir.balance;
        vm.prank(heir);
        wallet.claim();

        assertEq(heir.balance, balanceBefore + 1 ether);
    }
}
