// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract ifElseTest {
    function processNumber(uint x) public pure returns (string memory) {
        if (x < 10) {
            return "less than 10"; //中文返回会有编码相关问题 要么用unicode 要么纯英文  推荐纯英文
        } else if (x <= 20) {
            return "between 10 and 20";
        } else {
            return "greater than 20";
        }
    }

    function tenary(uint x) public pure returns (string memory) {
        string memory result = x < 10
            ? "less than 10"
            : (x <= 20 ? "between 10 and 20" : "greater than 20");
        return result;
    }
}
