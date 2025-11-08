// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

// 编程作业
// 请按照以下要求编写⼀个Solidity智能合约，完成练习：
// 1. 声明⽗合约：
// 编写⼀个名为 S 的合约，包含⼀个字符串类型的状态变量 name 和⼀个接收 name 参数的
// 构造函数。
// 编写⼀个名为 T 的合约，包含⼀个字符串类型的状态变量 text 和⼀个接收 text 参数的
// 构造函数。
// 2. 创建继承合约：
// 编写⼀个名为 U 的合约，继承 S 和 T 。
// 在 U 的构造函数中调⽤ S 和 T 的构造函数，并传递相应的参数。
// 3. 混合构造函数参数：
// 编写⼀个名为 BB 的合约，继承 S 和 T 。
// 静态传递 S 的构造函数参数，动态传递 T 的构造函数参数。
// 4. 验证初始化顺序：
// 编写⼀个名为 B0 的合约，先继承 S 再继承 T ，验证构造函数的调⽤顺序。
// 编写⼀个名为 B2 的合约，先继承 T 再继承 S ，验证构造函数的调⽤顺序。

contract S {
    string public name;
    event Log(string message);
    constructor(string memory _name) {
        name = _name;
        emit Log("Constructor S executed");
    }
}

contract T {
    string public text;
    event Log2(string message);
    constructor(string memory _text) {
        text = _text;
        emit Log2("Constructor T executed");
    }
}

contract U is S, T {
    constructor(string memory _name, string memory _text) S(_name) T(_text) {
        emit Log("Constructor U executed");
    }
}

contract BB is S("s"), T {
    constructor(string memory _text) T(_text) {
        emit Log("Constructor BB executed");
    }
}

contract B0 is S, T {
    constructor(string memory _name, string memory _text) S(_name) T(_text) {
        emit Log("Constructor B0 executed");
    }
}

contract B2 is T, S {
    constructor(string memory _name, string memory _text) S(_name) T(_text) {
        emit Log("Constructor B2 executed");
    }
}
