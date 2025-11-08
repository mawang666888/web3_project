// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

//B若继承A的函数 需要A里面的函数是virtual虚拟函数
//继承的关键字 是is
contract A {
    function foo() public pure virtual returns (string memory) {
        return "A";
    }

    function bar() public pure virtual returns (string memory) {
        return "A";
    }

    //非虚拟函数
    function barz() public pure returns (string memory) {
        return "A";
    }
}

//继承A  复制过来的方法中的virtual 改成 override
contract B is A {
    function foo() public pure override returns (string memory) {
        return "B";
    }

    //后面要让合约C继承修改合约B的这个方法 所以加上virtual参数
    function bar() public pure virtual override returns (string memory) {
        return "B";
    }
}
contract C is B {
    
    function bar() public pure override returns (string memory) {
        return "C";
    }
}
