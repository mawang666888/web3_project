// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

//接口一般以I开头
interface ICounter {
    //接口中只需要把对应合约的方法名声明出来。无需实现方法。只是为了其他合约调用的。
    function count() external view returns (uint);
    function increment() external;
}

//执行函数时把接口对应的合约的地址部署后 然后复制过来
contract MyContract{
    function incrementCounter(address _counter) external {
        ICounter(_counter).increment();
    }

    function getCount(address _counter) external view returns(uint256){
        return ICounter(_counter).count();
    }
}
