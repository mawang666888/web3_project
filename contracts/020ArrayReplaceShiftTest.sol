// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract ArrayReplaceShiftTest {

    uint[] public arr;

    function efficientRemove(uint _index) public  returns (uint[] memory) {
        arr[_index] = arr[arr.length - 1];
        arr.pop();
        return arr;
    }

    function test() public  {
       arr=[1,2,3,4,5];
       arr=this.efficientRemove(2);
       assert(arr.length==4);
       assert(arr[0]==1);
       assert(arr[0]==2);
       assert(arr[0]==4);
       assert(arr[0]==5);
       
    }
}
