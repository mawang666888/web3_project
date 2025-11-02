// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract ArrayShiftTest {
    function example(uint[] memory arr,uint _index) public pure returns (uint[] memory) {
        require(arr.length > 0, "array cannot be empty");
        require(_index < arr.length, "out of bound index");

        uint[] memory newArray = new uint[](arr.length - 1);
        //复制要删除之前的元素
        for (uint i = 0; i < _index; i++) {
            newArray[i] = arr[i];
        }
        //[1,2,3,4,5]
        for (uint i = _index; i < newArray.length; i++) {
            newArray[_index] = arr[i + 1];
        }

        return newArray;
    }
}
