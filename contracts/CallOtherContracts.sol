// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

// 编程作业
// 编写⼀个智能合约，包含以下功能：
// 1. 合约初始化和调⽤
// ◦
// 创建⼀个合约 MyCallerContract ，⽤于调⽤⽬标合约 MyTargetContract 。
// ◦
// 在 MyCallerContract 中编写⼀个函数 setTargetX ，调⽤ MyTargetContract 
// 的 setX 函数，并传递参数。
// 2. 直接调⽤
// ◦
// 在 MyCallerContract 中编写⼀个函数 getTargetX ，直接调⽤
// MyTargetContract 的 getX 函数，并返回结果。
// 3. 传递Ether
// ◦
// 在 MyCallerContract 中编写⼀个函数 setXWithEther ，调⽤
// MyTargetContract 的 setXAndReceiveEther 函数，并传递Ether值。
// 4. 处理多个返回值
// ◦
// 在 MyCallerContract 中编写⼀个函数 getXAndValueFromTarget ，调⽤
// MyTargetContract 的 getXAndValue 函数，并返回多个输出值。

contract MyCallerContract {
    function setTargetX(MyTargetContract _target, uint _x) external {
        _target.setX(_x);
    }

    function getTargetX(
        MyTargetContract _target
    ) external view returns (uint x) {
        x = _target.getX();
    }

    //自己写的
    // function setXWithEther(MyTargetContract _target, uint _value) external {
    //     _target.setXAndReceiveEther(_value);
    // }

    function setXWithEther(MyTargetContract _target, uint _x) external payable  {
        _target.setXAndReceiveEther{value:msg.value}(_x);
    }

    function getXAndValueFromTarget(
        MyTargetContract _target
    ) external view returns (uint x, uint value) {
        (x, value) = _target.getXAndValue();
    }
}

contract MyTargetContract {
    uint public x;
    uint public value;

    receive() external payable {}

    function setX(uint _x) external payable {
        x = _x;
        //value = msg.value;
    }

    function getX() external view returns (uint) {
        return x;
    }

    function setXAndReceiveEther(uint _x) external payable {
        //原来写的
        //value = _value;
        x=_x;
        value=msg.value;
    }

    function getXAndValue() external view returns (uint, uint) {
        return (x, value);
    }
}
