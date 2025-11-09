// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract Immutable {
    //immutable 常量 不可改变 更省gas  只能在部署的时候初始化 后面不能再更改了 所以在构造函数中进行初始化
    //52576 gas
    //address public owner = msg.sender;
    address public owner;
    //50123 gas
    //address public immutable owner = msg.sender;
    //address public immutable owner;

    constructor() {
        owner = msg.sender;
    }

    uint public x;
    function foo() external { 
        require(owner == msg.sender);
        x += 1;
    }
}
