// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract LocalVariables {
    uint256 public i;
    bool public b;
    address public myAddress;

    function fool() external {
        uint x = 123;

        bool f = false;

        x += 456;

        f = true;

        i = 123;
        b = true;
        myAddress = address(1);
    }
}
