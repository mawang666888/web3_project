// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

// 作业描述
// 编写⼀个Solidity合约，使⽤Library实现以下功能：
// 1. 创建⼀个名为 MathLib 的Library，包含⼀个 min 函数，⽤于返回两个 uint 类型整数中的较⼩
// 值。
// 2. 创建⼀个名为 ArrayUtils 的Library，包含⼀个 sum 函数，⽤于计算并返回 uint 类型数组中
// 所有元素的和。
// 3. 在测试合约中使⽤这两个Library，验证其功能。
// 作业要求
// 1. 创建 MathLib 并实现 min 函数。
// 2. 创建 ArrayUtils 并实现 sum 函数。
// 3. 创建测试合约 TestLibraries ，在合约中使⽤ MathLib.min 函数和 ArrayUtils.sum 函
// 数。

library MathLib {
    //写成了external 
    function min(uint x, uint y) internal pure returns (uint) {
        return x <= y ? x : y;
    }
}

library ArrayUtils {
    //写成了external 
    function sum(uint[] storage arr) internal  view returns (uint) {
        uint total = 0;
        for (uint i = 0; i < arr.length; i++) {
            total += arr[i];
        }
        return total;
    }
}

contract TestLibraries {
    function testmin(uint x, uint y) external pure  returns (uint) {
        return MathLib.min(x, y);
    }

    using ArrayUtils for uint[];
    uint[] arr = [1, 2, 3];
    function testsum() external view returns (uint) {
        return arr.sum();
    }
}
