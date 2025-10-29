// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract StateVariables {
    uint public myUnit = 123; //状态变量是存储在区块链上的一种变量 在方法之外

    function foo() external {
        uint notStateVar = 456; //函数里面的变量 是局部变量
    }
}
