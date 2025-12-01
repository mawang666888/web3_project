// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract UncheckedMath {
    function add(uint256 x, uint256 y) external pure returns (uint256) {
        //927 gas
        return x + y;

        //748 gas
        // unchecked {
        //     return x + y;
        // }
    }

    function sub(uint256 x, uint256 y) external pure returns (uint256) {
        //949 gas
        return x - y;

        //770 gas
        // unchecked {
        //     return x - y;
        // }
    }

    function sumOfCubes(uint256 x, uint256 y) external pure returns (uint256) {
        //827 gas
        unchecked {
            uint256 x3 = x * x * x;
            uint256 y3 = y * y * y;
            return x3 + y3;
        }
    }
}
