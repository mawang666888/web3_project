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

    function updateStruct(string memory _str) external pure returns (MyStruct memory) {
        uint[] memory tempArr = new uint[](3);
        tempArr[0] = 1;
        tempArr[1] = 2;
        tempArr[2] = 3;

        MyStruct memory struct1 = MyStruct(_str, tempArr);
        return struct1;
    }

    function getStruct(uint[] calldata _arr) external pure returns(MyStruct memory){
        MyStruct storage struct1;
        struct1.arr=_arr;
        MyStruct storage ms=struct1;
        return ms;
        
    }
}
