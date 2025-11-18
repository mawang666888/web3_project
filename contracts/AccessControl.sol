// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

// 作业说明
// 实现⼀个简化版本的访问控制合约，包含以下功能：
// 1. 定义两个⻆⾊： admin 和 user
// 2. 实现分配和撤销⻆⾊的函数
// 3. 为合约部署者分配 admin ⻆⾊

contract AccessControl {
    //indexed以及后面的参数没有写
    event GrantRoleLog(bytes32 indexed role, address indexed account);
    event RovokeRoleLog(bytes32 indexed role, address indexed account);

    //0xdf8b4c520ffe197c5343c6f5aec59570151ef9a492f2c624fd45ddde6135ec42
    bytes32 private constant ADMIN = keccak256(abi.encodePacked("ADMIN"));
    // 0x2db9fd3d099848027c2383d0a083396f6c41510d7acfd92adc99b6cffcf31e96
    bytes32 private constant USER = keccak256(abi.encodePacked("USER"));

    mapping(bytes32 => mapping(address => bool)) public roles;

    constructor() {
        // roles[ADMIN][msg.sender] = true;
        _grantRole(ADMIN, msg.sender);
    }

    modifier onlyOwner(bytes32 _role) {
        require(roles[_role][msg.sender], "not Authorize");
        _;
    }

    //address被写成 bytes 需要谨记
    function _grantRole(bytes32 _role, address _address) internal {
        roles[_role][_address] = true;
        emit GrantRoleLog(_role, _address);
    }

    function _rovokeRole(bytes32 _role, address _address) internal {
        roles[_role][_address] = false;
        emit RovokeRoleLog(_role, _address);
    }

    //修饰符给忘了  上面也没有写修饰符的相关代码 需注意
    function grantRole(
        bytes32 _role,
        address _address
    ) external onlyOwner(ADMIN) {
        _grantRole(_role, _address);
    }

    function rovokeRole(
        bytes32 _role,
        address _address
    ) external onlyOwner(ADMIN) {
        _rovokeRole(_role, _address);
    }
}
