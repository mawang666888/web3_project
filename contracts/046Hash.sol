// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

/*
Alice：

计算消息的哈希值：hash(message)=H
用她的私钥对哈希值进行签名：signature=Sign(H,Alice's private key)
发送消息和签名给Bob

接收到消息和签名
用Alice 的公钥对签名进行验证，得到哈希值：H'=Verify(signature,Alice's public key)
计算接收到消息的哈希值：H''=hash(message)
比较H'和H''，如果相等，消息未被篡改且确实来自Alice

*/
contract HashFunc {
    function hash(
        string memory text,
        uint num,
        address addr
    ) external pure returns (bytes32) {
        return keccak256(abi.encodePacked(text, num, addr));
    }

    function encode(
        string memory text0,
        string memory text1
    ) external pure returns (bytes memory) {
        return abi.encode(text0, text1);
    }

    function encodePacked(
        string memory text0,
        string memory text1
    ) external pure returns (bytes memory) {
        return abi.encodePacked(text0, text1);
    }

    //哈希冲突
    //text0:AAA  text1:BBB  和 text0:AA  text1:ABBB 生成结果都是 0xf6568e65381c5fc6a447ddf0dcb848248282b798b2121d9944a87599b7921358
    //解决冲突有2种方式 1、abi.encodePacked 改成 abi.encode  2、入参新增  之前2个参数中间加上uint参数
    function collision(
        string memory text0,
        uint x,
        string memory text1
    ) external pure returns (bytes32) {
        return keccak256(abi.encodePacked(text0, x, text1));
    }
}
