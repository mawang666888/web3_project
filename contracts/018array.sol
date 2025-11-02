// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

//Array - 动态或固定长度
//初始化
//Insert (push),get,update,delete,pop,length
//Creating arr in memory
//Returning array from function

contract Array {
    uint[] public nums = [1, 2, 3]; //动态 长度不固定的数组
    uint[3] public fixedNums = [4, 5, 6]; //固定长度的数组

    function examples() external {
        nums.push(4); //[1,2,3,4]
        uint x = nums[2];
        nums[2] = 777; //[1,2,777,4]
        delete nums[1]; //[1,0,777,4]  仅仅把对应的值置空而已。还是占位的，由于是uint类型的数据。所以对应位置的值为0
        nums.pop(); //[1,0,777]数组的最后一个数字就没有了 被pop出去了 数组长度也变化了
        uint len = nums.length;

        //create array in memory 内存中创建一个数组
        uint[] memory a = new uint[](5); //内存中创建一个长度为5的数组 只能在内存中创建固定长度的数组 不能创建动态数组
        a[1] = 123;
    }

    //数组放到内存中 返回数组 数组长度越大 gas费就越贵 一般不建议返回数组  和for循环希望少一点一样 考虑到gas费
    // function returnArray() external view returns (uint[] memory) {
    //     return nums;
    // }
}
