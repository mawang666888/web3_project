// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract SimpleBank {
    mapping(address => uint) public balances;

    function deposit() public payable {
        //balances[msg.sender] += _amout;  错的
        balances[msg.sender] += msg.value;
    }

    function withdraw(uint _amout) public {
        require(balances[msg.sender] >= _amout, "Insufficient funds"); //没考虑到的
        payable(msg.sender).transfer(_amout); //没考虑到的
        balances[msg.sender] -= _amout;
    }

    function checkBalance() public view returns (uint) {
        return balances[msg.sender];
    }
}
