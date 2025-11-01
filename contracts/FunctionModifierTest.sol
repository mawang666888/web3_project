// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract FunctionModifierTest {
    uint private number;

    modifier nonZero() {
        require(number != 0, "number is zero");
        _;
    }

    function doubleNumber() public nonZero {
        number *= 2;
    }

    function resetNumber() public {
        number = 0;
    }
}
