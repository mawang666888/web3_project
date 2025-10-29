// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract GlobalInfoViewer {
    function viewGlobalInfo() external view returns (address, uint, uint) {
        address myAddr = msg.sender;
        uint timestamp = block.timestamp;
        uint blockNum = block.number;

        return (myAddr, timestamp, blockNum);
    }
}
