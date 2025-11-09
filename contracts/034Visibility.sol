// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

//visibility 函数或变量的可见性 以及是否可调用
//private   只在合约内部
//internal  合约内部或子合约
//public    内部或外部
//external  只能外部调用

/*
A
private pri()
internal inter()
public pub()    <-------------C是外部合约  pub() and ext()
external ext()

B is A
inter()         <-------------C是外部合约  pub() and ext()
pub()
*/

contract B {
    uint private x = 0;
    uint internal y = 1;
    uint public z = 2;

    function privateFun() private pure returns (uint) {
        return 0;
    }

    function internalFun() internal pure returns (uint) {
        return 100;
    }

    function publicFun() public pure returns (uint) {
        return 200;
    }

    function externalFun() external pure returns (uint) {
        return 300;
    }

    function examples() external view {
        x+y+z;
        privateFun();
        internalFun();
        publicFun();
    }
}

contract Child is B{
    function example2() external view {
        y+z;
        internalFun();
        publicFun();
    }
}