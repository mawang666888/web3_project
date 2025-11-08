// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

// 编程作业
// 请按照以下要求编写⼀个Solidity智能合约，完成练习：
// 1. 声明事件：
// ◦
// 声明⼀个名为
// LogMessage的事件，包含以下参数：
// ▪
// 发送者地址（ address ，使⽤ indexed 关键字）
// ▪
// 接收者地址（ address ，使⽤ indexed 关键字）
// ▪
// 消息内容（ string ）
// 2. 创建发送消息的函数：
// ◦
// 创建⼀个名为
// sendMessage的函数，该函数包含两个参数：
// ▪
// 接收者地址（ address ）
// ▪
// 消息内容（ string ）
// ◦
// 在函数内部，使⽤ emit 记录 LogMessage 事件，将发送者地址设为 msg.sender ，接
// 收者地址设为函数参数，消息内容设为函数参数。
// 3. 部署和测试：
// 部署智能合约并测试 sendMessage 函数，确保事件正确记录在区块链上。
contract EventTest {
    event LogMessage(address indexed from, address indexed to, string message);

    function sendMessage(address _to, string calldata message) external {
        emit LogMessage(msg.sender, _to, message);
    }
}
