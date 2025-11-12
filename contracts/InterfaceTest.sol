// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

// 请学员编写⼀个合约，该合约通过接⼝调⽤另⼀个已部署的计数器合约，实现以下功能：
// 1. 定义接⼝ ICounter ，包含以下函数：
// function count() external view returns (uint);
// function increment() external;
// 2. 编写合约 CallCounter ，包含以下功能：
// 定义状态变量 uint public count; 
// 定义函数 incrementCounter 调⽤ ICounter.increment 函数
// 定义函数 updateCount 调⽤ ICounter.count 函数，并更新状态变量 count 
// 3. 部署 CallCounter 合约后，通过传⼊已部署的计数器合约地址，调⽤ incrementCounter 
// 和 updateCount 函数，实现计数器的增加和获取当前计数值的功能。

interface ICounter {
    function count() external view returns (uint);
    function increment() external;
}

contract CallCounter {
    uint public count;

    function incrementCounter(address _counter) external {
        ICounter(_counter).increment();
    }

    function updateCount(address _counter) external returns (uint) {
        count = ICounter(_counter).count();
        return count;
    }
}
