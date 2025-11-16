// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

// 编程作业
// 请根据以下要求完成⼀个Solidity智能合约：
// 1. 创建⼀个名为 MyHash 的合约，其中包含以下功能：
// 函数 hashFunction ：接受字符串 text 、整数 num 和地址 addr 作为参数，返回这些参
// 数的Keccak256哈希值。
// 函数 encodeFunction ：接受两个字符串 text0 和 text1 ，使⽤ abi.encode 编码并
// 返回结果。
// 函数 encodePackedFunction ：接受两个字符串 text0 和 text1 ，使⽤
// abi.encodePacked 编码并返回结果。
// 函数 collisionFunction ：接受两个字符串 text0 和 text1 ，使⽤
// abi.encodePacked 编码并返回Keccak256哈希值。
// 2. 编译并部署合约，测试以下功能：
// 调⽤ hashFunction 函数，验证输⼊参数的哈希值。
// 调⽤ encodeFunction 和 encodePackedFunction ，对⽐编码后的结果。
// 调⽤ collisionFunction ，验证哈希冲突的发⽣，并通过添加⼀个额外的整数参数解决冲
// 突。
contract MyHash {
    function hashFunction(
        string memory text,
        uint num,
        address addr
    ) external pure returns (bytes32) {
        //开始写的时候没有加上abi.encodePacked
        return keccak256(abi.encodePacked(text, num, addr));
    }

    //返回参数开始写的bytes32
    function encodeFunction(
        string memory text0,
        string memory text1
    ) external pure returns (bytes memory) {
        return abi.encode(text0, text1);
    }

    function encodePackedFunction(
        string memory text0,
        string memory text1
    ) external pure returns (bytes memory) {
        return abi.encodePacked(text0, text1);
    }

    function collisionFunction(
        string memory text0,
        uint num,
        string memory text1
    ) external pure returns (bytes32) {
        return keccak256(abi.encodePacked(text0, num, text1));
    }
}
