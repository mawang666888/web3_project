// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract GlobalVariables {
    function globalVars() external view returns (address, uint, uint) {
        address sender = msg.sender;//调用函数的账户地址
        uint timestamp = block.timestamp;//调用函数时的unix时间戳
        uint blockNum = block.number;//当前的区块变化
        return (sender, timestamp, blockNum);
    }
}
