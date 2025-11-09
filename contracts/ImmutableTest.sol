// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

// 作业内容
// 1. 编写⼀个Solidity合约，包含以下要求：
// ◦
// 定义⼀个名为 owner 的状态变量，并使⽤ immutable 关键字。
// ◦
// 在合约的构造函数中将 owner 初始化为 msg.sender 。
// ◦
// 编写⼀个函数 getOwner ，返回 owner 的值。
// 2. 编译并部署合约。
// 3. 调⽤ getOwner 函数，验证合约部署时 owner 的值正确性。

contract Immutable {
    //	168180 gas
    address public immutable owner;
    //	194483 gas
    //address public owner;

    constructor() {
        owner = msg.sender;
    }

    function getOwner() external view returns (address) {
        require(owner == msg.sender);
        return owner;
    }
}
