// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract Constructor {
    address public owner;
    uint public x;

    //只在部署的时候 自动调用
    constructor(uint _x) {
        owner = msg.sender; //部署这个合约的账号地址
        x = _x;
    }
}
