// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

// 编程作业
// 请按照以下要求编写⼀个Solidity智能合约，完成练习：
// 1. 声明合约：
// 编写⼀个名为 Account 的合约，包含⼀个 owner 地址类型的状态变量，构造函数接收
// owner 参数并初始化状态变量。
// 编写⼀个名为 AccountFactory 的合约，⽤于创建 Account 合约。
// 2. 创建合约函数：
// 在 AccountFactory 合约中，创建⼀个名为 createAccount 的函数。
// 函数参数包括⼀个地址 owner ，将其传递给 Account 合约的构造函数。
// 使⽤ new 关键字创建 Account 合约实例。
// 将新创建的 Account 实例添加到 accounts 数组中。
// 确保 createAccount 函数是 payable ，并在创建合约时发送以太币。
// 3. 部署和测试：
// 部署 AccountFactory 合约并调⽤ createAccount 函数，传递 owner 地址和⼀些以太币。
// 验证新创建的 Account 合约地址和所有者是否正确。

contract Account {
    address public owner;
    constructor(address _owner) payable {
        owner = _owner;
    }
}

contract AccountFactory {
    Account[] public accounts;
    function createAccount(address _owner) external payable {
        //严谨方式
        require(msg.value >= 222, "Not enough ether sent");
        Account account = new Account{value: 222}(_owner);
        accounts.push(account);
    }
}
