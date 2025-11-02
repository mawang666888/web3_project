// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract ArrayTest {
    uint[] public nums = [1, 2, 3];
    uint[3] public fixedNums = [4, 5, 6];

    function pushArray() public {
        nums.push(4);
    }

    modifier whenLessThanLen(uint i) {
        require(i <= nums.length - 1, "more than nums length"); //满足条件才行 否则提示语
        _;
    }

    function getDyValue(uint i) external whenLessThanLen(i) view returns (uint) {
        return nums[i];
    }

    function updateDyValue(uint x, uint y) external whenLessThanLen(x) {
        nums[x] = y;
    }

    function delDyValue(uint x) external whenLessThanLen(x) {
        delete nums[x];
    }

    function getDyLength() external view returns (uint) {
        return nums.length;
    }
}
