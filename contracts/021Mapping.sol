// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

//Mapping
//How to declare a mapping (简单版本 & 嵌套版本)
//Set get ,delete

//["alice","bob","charlie"]
//{"alice":true,"bob":true,"charlie":true}

contract Mapping {
    mapping(address => uint) public balances;
    mapping(address => mapping(address => bool)) public isFriend;

    function examples() external {
        balances[msg.sender] = 123;
        uint bal = balances[msg.sender];
        uint bal2 = balances[address(1)]; // 0

        balances[msg.sender] += 456; //123 + 456 =579

        delete balances[msg.sender]; //删除之后 变成 uint的默认值 0

        isFriend[msg.sender][address(this)] = true;
    }
}
