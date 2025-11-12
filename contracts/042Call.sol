// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract TestCall {
    string public message;
    uint public x;

    event Log(address caller, uint amount, string message);

    receive() external payable {}
    //这里若注释 再调用没有的方法是会报错的
    // fallback() external payable {
    //     emit Log(msg.sender,msg.value,"Fallback was called");
    // }

    function foo(
        string memory _message,
        uint256 _x
    ) public payable returns (bool, uint) {
        message = _message;
        x = _x;
        return (true, 999);
    }
}

contract Call{
    bytes public data;
    function callFoo(address _test) external payable {
        //,gas:5000 gas费限制最高5000 
        (bool success,bytes memory _data)=_test.call{value:111}(abi.encodeWithSignature("foo(string,uint256)", "call foo",123));
        require(success,"call failed");
        data=_data;
    }

    //调用不存在的方法
    function callNotExist(address _test) external {
        (bool success,)=_test.call(abi.encodeWithSignature("doesNotExist()"));
        require(success,"call failed");
    }

}
