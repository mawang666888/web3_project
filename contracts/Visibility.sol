// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

//任务：编写⼀个Solidity合约，包含所有四种可⻅性的函数和状态变量，并验证它们的访问权限

contract Base {
    uint private pri;
    uint internal inter;
    uint public pub;

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

    function examples() public view {
        pri + inter + pub;
        privateFun();
        internalFun();
        publicFun();
    }
}

contract Y is Base {
    //之前没有写这个方法  需要一个方法的
    function examples2() external view {
        inter + pub;
        // Base.internalFun();
        // Base.publicFun();
        internalFun();
        publicFun();
    }
}
