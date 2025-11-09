// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

// 练习使⽤Immutable变量
// 定义⼀个合约
// 在构造函数中初始化Immutable变量
// 测试合约的Gas消耗

contract Immutables {
    //52551 gas
    //address public owner;
    //50098 gas
    address public immutable owner;
    uint public x;

    constructor() {
        owner = msg.sender;
    }

    // returns (uint)
    function example() external {
        //这一句漏了的
        require(owner == msg.sender);
        x += 1;
    }
}
