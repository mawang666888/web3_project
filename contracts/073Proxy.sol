// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

//1.重现透明可升级代理，并探讨其错误实现

contract CounterV1 {
    address public implementation;
    address public admin;
    uint256 public count;

    function inc() external {
        count += 1;
    }
}

contract CounterV2 {
    address public implementation;
    address public admin;
    uint256 public count;

    function inc() external {
        count += 1;
    }

    function dec() external {
        count -= 1;
    }
}

contract BuggyProxy {
    address public implementation;
    address public admin;

    constructor() {
        admin = msg.sender;
    }

    // function _delegate() private {
    //     (bool ok, bytes memory res) = implementation.delegatecall(msg.data);
    //     require(ok, "delegatecall failed");
    // }
    function _delegate(address _implementation) private {
        assembly{
            calldatacopy(0,0,calldatasize())

            let result:=delegatecall(gas(),_implementation,0,calldatasize(),0,0)

            returndatacopy(0,0,returndatasize())

            switch result
            case 0{
                revert(0,returndatasize())
            }
            default {
                return(0,returndatasize())
            }
        }
    }

    fallback() external payable {
        _delegate(implementation);
    }

    receive() external payable {
        _delegate(implementation);
    }

    function upgradeTo(address _implementation) external {
        require(msg.sender == admin, "not authorized");
        implementation = _implementation;
    }
}
