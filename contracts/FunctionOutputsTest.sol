// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract FunctionOutputsTest {
    uint public x;
    bool public y;
    string public z;

    function returnMultiple() public pure returns (uint, bool, string memory) {
        return (123, false, "hello");
    }

    function captureOutputs() public {
        (x, y, z) = returnMultiple();
    }

    function displayOutputs() public view returns (uint, bool, string memory) {
        return (x, y, z);
    }
}
