// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

//[1,2,3,4,5,100]
contract GasGolf {

    uint256 public total;

    event GasUsed(uint256 gasUsed);

    //memory换成calldata
    function sumIfEvenAndLessThan99(uint[] calldata nums) external {
         uint256 startGas = gasleft();

        uint256 _total=total;
        for (uint i = 0; i < nums.length; i++) {
            uint currentNums = nums[i];
            if (currentNums % 2 == 0 && currentNums < 99) {
                _total += currentNums;
            }
        }
        total=_total;

        uint256 gasUsed = startGas - gasleft();
        emit GasUsed(gasUsed);
    }
}
