// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract ForAndWhileLoops {
    function loops() external pure {
        for (uint i = 0; i < 10; i++) {
            //code
            if (i == 3) {
                continue; //后面代码不会执行，但是会继续for循环
            }
            //more code

            if (i == 5) {
                break; //循环终止了。跳出for循环
            }
        }

        uint j = 0;
        while (j < 10) {
            //code
            j++;
        }
    }

    function sum(uint _n) external pure returns (uint) {
        uint s = 0;
        for (uint i = 1; i <= _n; i++) {
            s += i;
        }
        return s;
    }
}
