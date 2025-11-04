// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract ArrayReplaceShiftTest {

    uint[] public arr;

    function efficientRemove(uint _index) public  returns (uint[] memory) {
        require(_index < arr.length, "Index out of bounds");
        arr[_index] = arr[arr.length - 1];
        arr.pop();
        return arr;
    }

    function test() public  {
       arr=[1,2,3,4,5];
       arr=efficientRemove(2);
       assert(arr.length==4);
       assert(arr[0]==1);
       assert(arr[1]==2);
       assert(arr[2]==5);
       assert(arr[3]==4);
       
    }

     // 添加一个辅助函数来查看当前数组状态
    function getArray() public view returns (uint[] memory) {
        return arr;
    }
}
