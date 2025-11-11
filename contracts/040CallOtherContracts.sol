// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract Caller {
    // function setX(address _test,uint _x) external {
    //     TestContract(_test).setx(_x);
    // }

    function setX(TestContract _test, uint _x) external {
        _test.setx(_x);
    }

    //若没有用return 方法返回值把x加上
    function getX(address _test) external view returns (uint x) {
        // uint x=TestContract(_test).getX();
        // return x;
        //或者
        //return TestContract(_test).getX();
        //或者
        x=TestContract(_test).getX();
    }

    function setXandSendEther(TestContract _test, uint _x) external payable  {
        _test.setXandSendEther{value:msg.value}(_x);
    }

    // function getXandValue(address _test) external view returns(uint,uint){
    //     (uint x,uint value)=TestContract(_test).getXandValue();
    //     return (x,value);
    // }

    function getXandValue(address _test) external view returns(uint x,uint value){
        (x,value)=TestContract(_test).getXandValue();
    }
}

contract TestContract {
    uint256 public x;
    uint256 public value = 123;

    function setx(uint256 _x) public returns (uint256) {
        x = _x;
        return x;
    }

    function getX() external view returns (uint256) {
        return x;
    }

    function setXandSendEther(
        uint256 _x
    ) public payable returns (uint256, uint256) {
        x = _x;
        value = msg.value;
        return (x, value);
    }

    function getXandValue() external view returns (uint, uint) {
        return (x, value);
    }
}
