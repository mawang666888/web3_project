// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

// 任务：在Solidity中编写⼀个智能合约，实现⾼效的数组元素删除。
// 要求：
// 1. 创建⼀个Solidity智能合约，包含⼀个函数 efficientRemove 。
// 2. efficientRemove 函数接受⼀个数组和要删除的元素索引作为参数。
// 3. 编写测试⽤例验证函数逻辑：确保删除元素后数组的⻓度正确，并且数组的内容符合预期。

contract ArrayReplaceShift {
    function efficientRemove(
        uint[] memory arr,
        uint _index
    ) public pure returns (uint[] memory) {
        require(arr.length > 0, "array is not empty");//新补的
        require(_index <= arr.length - 1, "out of bounds");

        uint[] memory newArr = new uint[](arr.length - 1); //新补的

        //[1,2,3,4,5]
        //移除索引为2的 也是3那个位置的值
        //索引前面的可以原样赋值过来
        //索引后面的  把后面一位的赋值给前面一位
        for (uint i = 0; i < _index; i++) {
            newArr[i] = arr[i];
        }

        // for (uint j = _index; j < arr.length - _index - 1; j++) {
        //     newArray[j] = arr[j + 1];
        // }

        for (uint i = _index; i < newArr.length; i++) {
            newArr[i] = arr[i + 1];
        }

        return newArr;
    }
}
