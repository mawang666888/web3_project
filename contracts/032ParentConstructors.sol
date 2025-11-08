// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

//2 ways to call parent constructors
//Order of initiallization

contract S {
    string public name;

    constructor(string memory _name) {
        name = _name;
    }
}

contract T {
    string public text;

    constructor(string memory _text) {
        text = _text;
    }
}

//这种方式的弊端 是写合约的时候 就要知道函数的参数
contract U is S("s"), T("t") {}

//第2种调用父合约构造函数的方式
contract V is S, T {
    constructor(string memory _name, string memory _text) S(_name) T(_text) {}
}

//融合了上面2种写法
contract VV is S("s"), T {
    constructor(string memory _text) T(_text) {}
}

//执行顺序 
//1.S
//2.T
//3.V0
contract V0 is S, T {
    //执行顺序和这里构造方法写的S  T 顺序无关的。是看is 后面的顺序的 
    constructor(string memory _name, string memory _text) S(_name) T(_text) {}
}

//执行顺序 
//1.S
//2.T
//3.V1
contract V1 is S, T {
    //执行顺序和这里构造方法写的S  T 顺序无关的。是看is 后面的顺序的 
    constructor(string memory _name, string memory _text)  T(_text) S(_name) {}
}

//执行顺序 
//1.T
//2.S
//3.V2
contract V2 is T, S {
    //执行顺序和这里构造方法写的S  T 顺序无关的。是看is 后面的顺序的 
    constructor(string memory _name, string memory _text)  T(_text) S(_name) {}
}

//执行顺序 
//1.T
//2.S
//3.V3
contract V3 is T, S {
    //执行顺序和这里构造方法写的S  T 顺序无关的。是看is 后面的顺序的 
    constructor(string memory _name, string memory _text)   S(_name) T(_text) {}
}
