// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract Event {
    //第一种方式
    event Log(string message, uint val);
    //第二种方式  up to 3 最多三次使用indexed  关键的地方使用即可
    event IndexedLog(address indexed sender, uint val);

    function example() external {
        emit Log("fool", 1234);
        emit IndexedLog(msg.sender, 5678);
    }

    event Message(address indexed _from, address indexed _to, string message);
    //发送信息的小应用
    function sendMessage(address _to,string calldata message) external {
        emit Message(msg.sender, _to, message);
    }
}
