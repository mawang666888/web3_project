// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

/*Inheritance tree

-direct
-super

  E
/   \
F   G
\   /
  h
*/

contract E {
    event Log(string message);

    function foo() public virtual {
        emit Log("E.foo");
    }

    function bar() public virtual {
        emit Log("E.bar");
    }
}

contract F is E {
    function foo() public virtual override {
        emit Log("F.foo");
        //调用父级函数的方式1
        E.foo();
    }

    function bar() public virtual override {
        emit Log("F.bar");
        //调用父级函数的方式2
        super.bar();
    }
}

contract G is E {
    function foo() public virtual override {
        emit Log("G.foo");
        E.foo();
    }

    function bar() public virtual override {
        emit Log("G.bar");
        super.bar();
    }
}

//H只需要is 直接的前面的合约 之前is E, F, G 是不对的
contract H is F, G {
    function foo() public override(F, G) {
        //这种写法 只会调用F中的foo函数
        F.foo();
    }

    function bar() public override(F, G) {
        //这种方式 会分别调用F中的bar 以及G中的bar函数
       super.bar();
    }
}
