// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract ViewAndPureFunction {
    uint public num;

    function viewFunction() external view returns (uint) {
        return num;
    }

    function pureFunction() external pure returns (uint) {
        return 1;
    }

    function addNum(uint x) external view returns (uint) {
        return x + num;
    }

    function add(uint x, uint y) external pure returns (uint) {
        return x + y;
    }
}
