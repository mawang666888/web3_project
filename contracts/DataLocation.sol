// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

// 编程作业：实现⼀个简单的智能合约，包括以下功能：
// •
// 定义⼀个struct，包含⼀个字符串和⼀个整数数组。
// •
// 实现两个函数：
// a. ⼀个函数⽤于修改struct的字符串成员，该函数的参数为字符串，使⽤storage存储数据位置。
// b. 另⼀个函数⽤于读取struct的整数数组成员，该函数的参数为整数数组，使⽤calldata存储数据
// 位置，且在函数内部调⽤时，参数也使⽤calldata存储位置。

contract DataLocation {
    struct MyStruct {
        string str;
        uint[] arr;
    }

    //这个之前是缺失的
    MyStruct public myStruct;

    constructor() {
        myStruct.str = "jack";
        myStruct.arr = [1, 2, 3];
    }

    //之前是memory
    function updateStr(string calldata _str) external {
        MyStruct storage struct1 = myStruct;
        struct1.str = _str;
    }

    function processArray(
        uint[] calldata _arr
    ) external pure returns (uint[] memory) {
        return _internalProcess(_arr);
    }

    function _internalProcess(
        uint[] calldata data
    ) private pure returns (uint[] memory) {
        //创建新的memory数组
        uint[] memory result = new uint[](data.length);

        //处理calldata只读
        for (uint i = 0; i < data.length; i++) {
            result[i] = data[i] + 100; //每个元素加100
        }

        return result;
    }

    function getStruct() external view returns (string memory, uint[] memory) {
        return (myStruct.str, myStruct.arr);
    }
}
