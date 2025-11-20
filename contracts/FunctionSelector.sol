// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

// 编程作业
// 请编写⼀个简单的Solidity智能合约，实现以下功能：
// 1. 创建⼀个合约 Receiver ，包含⼀个事件 Log ，⽤于记录传递的数据。
// 2. 实现⼀个函数 transfer ，接收⼀个地址和⼀个⾦额，并在调⽤时触发 Log 事件，记录传递
// 的 message.data 。
// 3. 创建⼀个合约 FunctionSelector ，实现⼀个函数 getSelector ，接收⼀个函数签名字符
// 串，并返回其哈希值的前四字节。
// 4. 部署合约并测试，通过 FunctionSelector 合约验证 Receiver 合约中 transfer 函数
// 的选择器编码是否正确。

contract FunctionSelector{
    //之前写的memory pure少了的
    function getSelector(string calldata _func) external pure  returns(bytes4){
        return bytes4(keccak256(bytes(_func)));
    }
}

//0xa9059cbb
//0000000000000000000000005b38da6a701c568545dcfcb03fcb875f56beddc4
//000000000000000000000000000000000000000000000000000000000000000b
contract Receiver {
    event Log(bytes data);

    function transfer(address _to, uint amount) public  {
        emit Log(msg.data);
    }
}
