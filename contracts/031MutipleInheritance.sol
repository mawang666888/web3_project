// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

//继承顺序 最上层的最优先
/*
     X
    / |
    Y |
    \ |
      Z
  //X ,Y, Z    

     X
    / \
    Y  A
    |  | 
    |  B
    \  /
     Z
   //X Y A B Z    
*/

contract X {
    function fool() public pure virtual returns (string memory) {
        return "X";
    }

    function bar() public pure virtual returns (string memory) {
        return "X";
    }

    function x() public pure returns (string memory) {
        return "X";
    }
}

contract Y is X {
    function fool() public pure virtual override returns (string memory) {
        return "Y";
    }

    function bar() public pure virtual override returns (string memory) {
        return "Y";
    }

    function y() public pure returns (string memory) {
        return "Y";
    }
}

//继承多个合约 最前面的优先
contract Z is X, Y {
    //override 中的X Y 顺序谁在前后都 无所谓
    function fool() public pure override(X, Y) returns (string memory) {
        return "Z";
    }

    function bar() public pure override(Y, X) returns (string memory) {
        return "Z";
    }
}
