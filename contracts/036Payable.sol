// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract Payable {
    //这里加上payable就可以用这个owner发送以太了  接受以太
    address payable public owner;

    constructor() {
        //开始不加payble时是报错的 因为上面声明的状态变量是 address+payable的 所以需要加上payable把地址转换一下
        owner = payable(msg.sender);
    }

    //payable  这里要是不加上这个参数 是没法执行发送以太的
    function deposit() external payable {}

    //获取当前地址的余额 
    //msg.value 只在** payable 函数调用时才有值，它表示本次交易发送的以太币数量**，而 getBalance() 是 view 函数，没有接收以太币，所以 msg.value 永远为 0。
    //要获取合约的总余额，应该用 address(this).balance。
    function getBalance() external view returns (uint) {
        return address(this).balance;
        //return msg.value;  //方法需要是payable类型的才能调用
    }
}
