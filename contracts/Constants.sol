// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

//307 gas
contract Constants {
    int public constant MY_INT = 2;
}

//2407 gas
contract Var {
    int public i = 2;
}
