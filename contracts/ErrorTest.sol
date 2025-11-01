// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract ErrorTest {
    function testRequire(uint _x) public pure {
        require(_x <= 20, "_x greater than 20");
    }

    function testRevert(uint _y) public pure {
        if (_y > 20) {
            revert("_y greater than 20");
        }
    }

    uint public num = 234;

    function testAssert() public view {
        assert(num == 234);
    }

    error MyError(address caller, uint i);

    function testMyError(uint _z) public view {
        if (_z > 20) {
            revert MyError(msg.sender, _z);
        }
    }
}
