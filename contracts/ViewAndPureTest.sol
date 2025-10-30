// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract ViewAndPureTest {
    uint public num;

    constructor(uint initialValue) {
        num = initialValue;
    }

    function mutiFun(uint x, uint y) public pure returns (uint) {
        return x * y;
    }

    function viewFun() public view returns (uint) {
        return num;
    }
}
