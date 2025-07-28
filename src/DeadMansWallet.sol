// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract DeadMansWallet {
    address public owner;
    address public heir;
    uint256 public timeout;
    uint256 public lastPing;

    constructor(address _heir, uint256 _timeout){
        owner = msg.sender;
        heir = _heir;
        timeout = _timeout;
        lastPing = block.timestamp;
    }

    modifier onlyOwner(){
        require(msg.sender == owner, "Not owner!");
        _;
    }

    function heartbeat() external onlyOwner{
        lastPing = block.timestamp;
    }

    function claim() external {
        require(msg.sender == heir, "Not Heir!");
        require(block.timestamp > lastPing + timeout, "Owner still Alive!");

        payable(heir).transfer(address(this).balance);
    }

    receive() external payable {}
}
