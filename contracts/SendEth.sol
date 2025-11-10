// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

// 编程作业
// 编写⼀个Solidity智能合约，包含以下功能：
// 1. 能够接收ETH（使⽤ receive 函数）。
// 2. 能够使⽤ transfer ⽅法发送ETH。
// 3. 能够使⽤ send ⽅法发送ETH并处理失败情况。
// 4. 能够使⽤ call ⽅法发送ETH并处理返回值。

contract SendEther {
    //这个缺失了
    receive() external payable {}

    // //多了一个参数  金额动态的
    function sendViaTransfer(
        address payable _to,
        uint _amount
    ) external payable {
        _to.transfer(_amount);
    }

    //多了一个参数  金额动态的
    function sendViaSend(
        address payable _to,
        uint _amount
    ) public returns (bool) {
        bool sent = _to.send(_amount);
        require(sent, "send failed");
        return sent;
    }

    function sendViaCall(address payable _to,
        uint _amount) public returns(bool) {
        (bool success, ) = _to.call{value: _amount}("");
        require(success, "call failed");
        return success;
    }
}

//示例代码没有下面的
// contract ReceiveEther {
//     event Log(uint amount, uint gas);
//     receive() external payable {
//         emit Log(msg.value, gasleft());
//     }
// }
