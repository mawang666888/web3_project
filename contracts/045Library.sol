// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

library Math {
    function max(uint x, uint y) internal pure returns (uint) {
        return x >= y ? x : y;
    }
}
contract Test {
    function testMax(uint x, uint y) external pure returns (uint) {
        return Math.max(x, y);
    }
}

library ArrayLib {
    function find(uint[] storage arr, uint num) internal view returns (uint) {
        for (uint i = 0; i < arr.length; i++) {
            if (arr[i] == num) {
                return i;
            }
        }
        revert("not found");
    }
}

contract TestArray {
    //增强一个数据类型使用 把ArrayLib功能都赋值uint数组
    using ArrayLib for uint[];
    uint[] public arr = [1, 2, 3];

    function testFind() external view returns (uint i) {
        //i = ArrayLib.find(arr, 2);
        return arr.find(2);
    }
}
