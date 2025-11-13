// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

// 编程作业:
// 编写⼀个Solidity合约，使⽤delegatecall来更新状态变量。具体要求如下：
// 1. 创建两个合约： Caller 和 Callee 。
// 2. 在 Caller 合约中定义⼀个状态变量 num 。
// 3. 在 Callee 合约中定义⼀个函数 setNum ，接收⼀个 uint 参数并更新 Caller 合约中的
// num 变量。
// 4. 在 Caller 合约中实现⼀个函数，通过delegatecall调⽤ Callee 合约的 setNum 函数。
// 5. 部署并调⽤这些合约，验证 num 变量的更新情况。

contract Callee {
    uint public num;
    function setNum(uint _num) external payable {
        num = _num;
    }
}

contract Caller {
    uint public num;
    function setNum(address _addr, uint _num) external payable {
        (bool success,) = _addr.delegatecall(
            abi.encodeWithSelector(Callee.setNum.selector, _num)
        );
        require(success, "DelegateCall failed");
    }
}
