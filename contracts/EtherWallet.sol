// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

// 编写⼀个简单的以太坊智能合约EtherWallet，要求如下：
// 1. 合约可以接收以太币。
// 2. 只有合约所有者可以提取以太币。
// 3. 合约中有⼀个函数可以返回当前存储的以太币余额。

contract EtherWallet {
    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }
    //可接收以太币
    receive() external payable {}

    function withdraw(uint _amount) external {
        require(msg.sender == owner, "caller not owner");
        payable(msg.sender).transfer(_amount);
    }

    function getBalance() external view returns (uint) {
        return address(this).balance;
    }
}
