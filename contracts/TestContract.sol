// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

//编程作业
// 根据课程内容，编写⼀个Solidity合约，实现以下功能：
// 1. 创建⼀个名为 TestContract 的合约，包含以下函数：
// foo(string memory _msg, uint256 _num) :接受字符串和uint256类型参数，并更
// 新状态变量 message 和 number
// fallback() external :回退函数，记录⽇志"Fallbackwascalled"。
// 2. 创建⼀个名为 Caller 的合约，包含以下函数：
// ◦ callFoo(address _testContract, string memory _msg, uint256 _num) :
// 使⽤call调⽤ TestContract 合约中的 foo 函数，并传递参数。
// ◦ callNonExistentFunction(address _testContract) :使⽤call调⽤⼀个不存在的
// 函数，验证回退函数是否被调⽤。
// 编写完成后，部署并测试这两个合约，验证所有功能是否正常⼯作

contract TestContract {
    string public message;
    uint public number;
    function foo(string memory _msg, uint256 _num) public  payable returns(bool,uint){
        message = _msg;
        number = _num;
        return (true,999);
    }

    receive() external payable { }

    event Log(address addr, uint amount, string msg);

    //多加了function
    fallback() external payable {
        emit Log(msg.sender, msg.value, "Fallback was called");
    }
}

contract Caller {
    bytes public data;
    function callFoo(
        address _testContract
    ) external payable{
        (bool success, bytes memory _data) = _testContract.call{value: 111}(abi.encodeWithSignature("foo(string,uint256)","call foo",123 ));
         
        require(success, "caller failed");
        data = _data;
    }

    function callNonExistentFunction(address _testContract) external {
        (bool success, ) = _testContract.call(abi.encodeWithSignature("doesNotExist()"));
        require(success, "callNonExistentFunction");
    }
}
