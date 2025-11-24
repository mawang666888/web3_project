// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

// 编程作业
// 任务描述
// 在Solidity中创建⼀个智能合约，实现⼀个名为 optimizeGasUsage 的函数，该函数接受⼀个整数
// 数组。该函数将执⾏以下操作：
// 1. 使⽤上述所有燃⽓优化技术。
// 2. 计算数组中所有⼩于100的偶数的和。
// 3. 返回计算结果。
// 提交要求
// •
// 提交完整的Solidity合约代码。
// •
// 包括⼀段说明，描述每项优化对燃⽓消耗的具体影响。

contract GasGolf {
    uint256 public total;

    function optimizeGasUsage(uint256[] calldata arr) external {
        uint256 _total = total;
        for (uint256 i = 0; i < arr.length; i++) {
            uint256 currentNum = arr[i];
            if (currentNum % 2 == 0 && currentNum < 100) {
                _total += currentNum;
            }
        }
        total = _total;
    }
}
