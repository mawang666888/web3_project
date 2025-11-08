// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

// 任务描述： 编写⼀个Solidity合约，展⽰多重继承的使⽤。包括以下⼏个步骤：
// 1. 定义三个合约A、B和C。
// 。
// 合约A有⼀个函数
// 。
// 合约B继承合约A，并重写
// 。
// 合约C继承合约B和A，并重写
// 2. 确保继承顺序正确：从最基础的合约到派⽣合约。
// 3. 编译并部署合约C ，验证合约C是否继承了所有的函数并重写成功。

contract A {
    function foo() public pure virtual returns (string memory) {
        return "A";
    }
}

contract B is A {
    function foo() public pure virtual override returns (string memory) {
        return "B";
    }
}

contract C is A, B {
    function foo() public pure override(A, B) returns (string memory) {
        return "C";
    }
}
