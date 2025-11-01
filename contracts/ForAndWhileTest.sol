// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract ForAndWhileTest {
    /// 定义⼀个函数来计算从1到n的累加和
    function sum(uint _n) external pure returns (uint) {
        uint s;

        for (uint i = 0; i <= _n; i++) {
            s += i;
        }

        return s;
    }
}
