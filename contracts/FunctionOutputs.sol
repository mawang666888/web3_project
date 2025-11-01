// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

//return multiple outputs
//Name outputs
//Destructing Assignment

contract FunctionOutputs {
    function returnMany() public pure returns (uint, bool) {
        return (1, true);
    }

    function named() public pure returns (uint x, bool b) {
        return (1, true);
    }

    function assigned() public pure returns (uint x, bool b) {
        x = 1;
        b = true;
    }

    function destructingAssignments() public pure {
        (uint x, bool b) = returnMany(); //两个参数的值都获取
        (, bool _b) = returnMany(); //只获取第二个参数
    }
}
