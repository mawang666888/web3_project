// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

// 编程作业
// 任务：创建⼀个Solidity智能合约，实现⼀个简单的银⾏账⼾系统。
// 1. 合约名称： SimpleBank
// 2. 功能
// 3. ：
// ◦
// 创建⼀个公开的映射 balances ，键类型为 address ，值类型为 uint 。
// ◦
// 实现⼀个函数 deposit() ，允许⽤⼾为⾃⼰的账⼾存款。
// ◦
// 实现⼀个函数 withdraw(uint amount) ，允许⽤⼾从⾃⼰的账⼾中提取⾦额。
// ◦
// 实现⼀个函数 checkBalance() ，返回调⽤者的当前余额。

contract SimpleBankTest {
    mapping(address => uint) public balances; //小括号中写成了逗号 映射是键值对 key=>value

    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw(uint amount) public {
        require(balances[msg.sender] >= amount, "Insufficient funds");//提示语 Insufficient 少个i
        payable(msg.sender).transfer(amount);//有些迟疑
        balances[msg.sender] -= amount;
    }

    function checkBalance() public view returns(uint){
        return balances[msg.sender];
    }

}
