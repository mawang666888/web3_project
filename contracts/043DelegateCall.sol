// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

/*
A calls B,send 100 wei
        B calls C, sends 50 wei

        msg.sender=B
        msg.value=50
        execute code on C's state variable
        use eth in C     


A calls B,send 100 wei        
        B delegatecall C
A----->B----->C
        msg.sender=A
        msg.value=100
        execute code on B's state variable
        use eth in B   

*/

contract B {
    //NOTE: storage layout must be the same contract A
    //不一致 得出的结果会很奇怪
    //address public owner;
    uint256 public num;
    address public sender;
    uint256 public value;
    address public owner;//可以把增加的状态变量追加后面 就是不能放到最前面

    function setVars(uint256 _num) public payable {
        num = _num * 2;
        sender = msg.sender;
        value = msg.value;
    }
}

contract A {
    uint256 public num;
    address public sender;
    uint256 public value;

    function setVars(address _contract, uint256 _num) public payable {
        //    _contract.delegatecall(abi.encodeWithSignature("setVars(uint256)", _num));
        (bool success, bytes memory data) = _contract.delegatecall(
            abi.encodeWithSelector(B.setVars.selector, _num)
        );
        require(success, "delegatecall failed");
    }
}
