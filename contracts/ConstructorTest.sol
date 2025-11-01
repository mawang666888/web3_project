// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract ConstructorTest {
    uint public number;

    constructor(uint _x) {
        number = _x;
    }
}
