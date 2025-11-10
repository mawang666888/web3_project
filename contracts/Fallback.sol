// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

// 作业内容：编写⼀个包含Fallback和Receive函数的Solidity合约，并测试其⾏为。
// 要求：
// 1. 定义⼀个可以接收Ether的合约，包含Fallback和Receive函数。
// 2. Fallback函数应记录调⽤者地址、发送的⾦额和数据。
// 3. Receive函数应记录调⽤者地址和发送的⾦额。
// 4. 部署合约并测试：
// ◦
// 发送带数据的Ether，验证Fallback函数被调⽤。
// ◦
// 发送不带数据的Ether，验证Receive函数被调⽤。
// ◦
// 删除Receive函数，再次发送不带数据的Ether，验证Fallback函数被调⽤。

contract Fallback {
    event Log(string func, address addr, uint value, bytes b);

    fallback() external payable {
        emit Log("fallback", msg.sender, msg.value, msg.data);
    }

    // receive() external payable {
    //     emit Log("receive", msg.sender, msg.value, '');
    // }
}
