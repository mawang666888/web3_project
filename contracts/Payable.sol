// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

// 编程作业
// 请基于所学内容，编写⼀个简单的Solidity合约，包含以下要求：
// 1. 定义⼀个 payable 函数 receiveEther ，⽤于接收以太币。
// 2. 创建⼀个 payable 地址 recipient ，并在构造函数中初始化为 msg.sender 。
// 3. 编写⼀个函数 queryBalance ，返回合约当前的以太币余额。
// 4. 确保在未使⽤ payable 关键字时，合约⽆法接收以太币，并记录错误⽇志。

contract Payable {
    //少了public
    address payable public recipient;

    constructor() {
        recipient = payable(msg.sender);
    }

    function receiveEther() external payable {

    }

    function queryBalance() external view returns(uint){
        return address(this).balance;
    }

    // 接收以太币失败时的回退函数
    // fallback() external payable {
    // revert("Function not payable");
    // }
    
}
