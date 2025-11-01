// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

// Function modifier - 代码重⽤
// Basic, inputs, sandwich

contract FunctionModifier {
    bool public paused;
    uint public count;

    modifier whenNotPaused() {
        require(!paused, "Contract is paused");
        _;
    }

    function inc() external whenNotPaused {
        //require(!paused, "Contract is paused");
        count += 1;
    }

    function dec() external whenNotPaused {
        //require(!paused, "Contract is paused");
        count -= 1;
    }

    modifier cap(uint _x) {
        require(_x < 100, "x>100");
        _;
    }

    function incBy(uint _x) external whenNotPaused cap(_x) {
        count += _x;
    }

    modifier sandwich() {
        count += 1;
        _;
        count *= 2;
    }

    function foo() external sandwich {
        count += 1;
    }
}
