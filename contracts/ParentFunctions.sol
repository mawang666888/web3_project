// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

// 编程作业
// 任务描述：请编写⼀个Solidity合约，其中包含⼀个基础合约和两个继承该基础合约的⼦合约，再创
// 建⼀个继承⾃这两个⼦合约的合约。在这个合约中：
// 1. 使⽤直接调⽤的⽅式调⽤⽗合约的⼀个函数。
// 2. 使⽤ super 关键字调⽤⽗合约的另⼀个函数。
// 要求：
// •
// 基础合约应包含两个函数，并使⽤事件记录⽇志。
// •
// ⼦合约应覆盖基础合约中的函数。
// •
// 复合继承合约应调⽤⼦合约中的函数，并演⽰直接调⽤和使⽤ super 的区别。

/*
  A
/   \
B   C
\   /
  D

---direct
---super
event  emit
*/

//基础合约
contract A {
    event Log(string message);

    function foo() public virtual {
        emit Log("A.foo");
    }

    function bar() public virtual {
        emit Log("A.bar");
    }
}

//子合约B继承自A
contract B is A {
    
    function foo() public virtual override {
        emit Log("B.foo");
        A.foo();
    }

    function bar() public virtual override {
        emit Log("B.bar");
        super.bar();
    }
}

//子合约C 继承自A
contract C is A {
    
    function foo() public virtual  override {
        emit Log("C.foo");
        A.foo();
    }

    function bar() public virtual override {
        emit Log("C.bar");
        super.bar();
    }
}

//复合继承合约D 继承自B和C
contract D is B,C {
    
    function foo() public override(B,C) {
        emit Log("D.foo");
        B.foo();
    }

    function bar() public override(B,C) {
        emit Log("D.bar");
        super.bar();
    }
}

