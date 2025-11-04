// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

//     任务：实现⼀个Solidity合约，其中包括上述的 balances , keys ,和 inserted 数据结构，
// 以及 set , getSize ,和⼀个能够根据索引返回余额的函数。
// 要求：
// a. 使⽤Solidity0.8编写合约。
// b. 实现⼀个 set 函数，⽤于向 balances 添加或更新条⽬，并处理 keys 和 inserted 。
// c. 实现 getSize 函数返回当前 keys 数组的⻓度。
// d. 实现函数，根据传⼊的索引返回相应地址的余额。

contract IterableMapping {
    mapping(address => uint) public balances;
    mapping(address => bool) public inserted;

    address[] public  keys;//少了public

    function set(address _addr, uint _balances) external {
        balances[_addr] = _balances;
        if (!inserted[_addr]) {
            inserted[_addr] = true;
            keys.push(_addr);
        }
    }

    function getSize() external  view returns (uint) {//原來是public
        return keys.length;
    }

    function first() external  view returns (uint) {//原來是public
        return balances[keys[0]];
    }

    function last() external  view returns (uint) {//原來是public
        return balances[keys[keys.length - 1]];
    }

    function getBalanceByIndex(uint _index) external  view returns (uint) {//原來是public
        return balances[keys[_index]];
    }
}
