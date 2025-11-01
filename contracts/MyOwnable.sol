// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract MyOwnable {
    address public owner;
    uint public count;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "not owner");
        _;
    }

    function transferOwnership(address _newOwner) external onlyOwner {
        require(_newOwner != address(0), "invalid address");
        owner = _newOwner;
    }

    function anyoneCanCallThisFun() external {
        count += 1;
    }

    function resetCount() external onlyOwner {
        count = 0;
    }
}
