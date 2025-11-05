// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

//这是一个可遍历的映射数据结构，解决了普通mapping无法遍历的问题。
//测试的时候 复制下拉框中的地址然后给对应测试金额即可
// 任务：实现⼀个Solidity合约，其中包括上述的 balances , keys ,和 inserted 数据结构，
// 以及 set , getSize ,和⼀个能够根据索引返回余额的函数。
// 要求：
// a. 使⽤Solidity0.8编写合约。
// b. 实现⼀个 set 函数，⽤于向 balances 添加或更新条⽬，并处理 keys 和 inserted 。
// c. 实现 getSize 函数返回当前 keys 数组的⻓度。
// d. 实现函数，根据传⼊的索引返回相应地址的余额。

contract IterableMapping {
    mapping(address => uint) public balances;// 存储地址对应的余额
    mapping(address => bool) public inserted;// 记录地址是否已插入

    address[] public keys;// 存储所有已插入的地址

    //添加新记录或更新现有记录
    function set(address _key, uint _amount) public {
        balances[_key] = _amount;// 设置或更新余额
        //修改状态了 不能使用view
        if (!inserted[_key]) {// 如果是新地址
            //balances[msg.sender] = _amount;//位置错误 地址也不对 msg.sender需要是_key
            inserted[_key] = true; //msg.sender 需要是_key

            keys.push(_key);// 添加到键数组
        }
    }

    function getSize() external view returns (uint) {
        //原来是public
        return keys.length;
    }

    function first() external view returns (uint) {
        return balances[keys[0]];
    }

    function last() external view returns (uint) {
        return balances[keys[keys.length - 1]];
    }

    function getBalance(uint _index) external view returns (uint) {
        //传参少了  原来是public
        return balances[keys[_index]]; //原来是 balances[msg.sender]
    }
}
