// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

// 编程作业：Solidity继承练习
// •
// ⽬标
// •
// ：创建⼀个Solidity程序，包含三个合约：ContractA，ContractB和ContractC。
// ◦
// ContractA：定义两个函数 foo() 和 bar() ，返回字符串"A"。
// ◦
// ContractB：继承ContractA，重写 foo() 和 bar() ，使其返回字符串"B"。
// ◦
// ContractC：继承ContractB，只重写 bar() ，使其返回字符串"C"。
// 任务：编写完整的合约代码，编译并部署合约，验证函数调⽤的结果符合预期。

contract ContractA {
    function foo() external view virtual returns (string memory) {
        return "A";
    }

    function bar() external view virtual returns (string memory) {
        return "A";
    }
}

contract ContractB is ContractA {
    function foo() external pure override returns (string memory) {
        return "B";
    }

    function bar() external view virtual override returns (string memory) {
        return "B";
    }
}

contract ContractC is ContractB {
    function bar() external pure  override returns (string memory) {
        return "C";
    }
}
