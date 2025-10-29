// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract test {
    uint public u;
    bool public b;
    address public myAddress;

    function fool() external {
        uint i = 123;
        bool j = false;

        i += 11;
        j = true;

        u = 234;
        b = true;
        myAddress=address(1);
    }
}
