// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract SimpleStorage {

    string public text;

    //calldata 更省gas memory 
    function set(string calldata _text) external {
        text = _text;
    }

    function get() external view returns (string memory) {
        return text;
    }
}
