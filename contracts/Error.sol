// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract Error {
    function testRequire(uint _x) public pure {
        require(_x < 10, "input number need less than 10");
        //code
    }

    function testRevert(uint _y) public pure {
        if (_y > 10) {
            revert("_y>10"); //多个if的嵌套需要用revert
        }
    }

    uint public num = 123;
    function testAssert() public view {
        assert(num == 123);
    }

    function fool(uint _i) public {
        num += 1;
        require(_i < 10); //若_i传的是13 则报错，然后num值会回退到123
    }

    error MyError(address caller, uint i);

    function testCustomerError(uint _i) public view {
        if (_i > 10) {
            revert MyError(msg.sender, _i); //revert 和自定义错误结合使用
        }
    }
}
