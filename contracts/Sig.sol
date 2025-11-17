// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

// 编程作业
// 编写⼀个智能合约，实现以下功能：
// 1. verify 函数，⽤于验证签名。
// 2. getMessageHash 函数，⽤于⽣成消息哈希。
// 3. getEthSignedMessageHash 函数，⽤于⽣成Ethereum签名消息哈希。
// 4. recover 函数，⽤于恢复签名者地址。
// 5. splitSignature 函数，⽤于拆分签名。
contract VerifySig {
    function verify(
        address _signer,
        string memory _message,
        bytes memory _sig
    ) public pure returns (bool) {
        bytes32 messageHash = getMessageHash(_message);
        bytes32 ethSignedMessageHash = getEthSignedMessageHash(messageHash);
        return recover(ethSignedMessageHash, _sig) == _signer;
    }

    function getMessageHash(
        string memory _message
    ) public pure returns (bytes32) {
        return keccak256(abi.encodePacked(_message));
    }

    function getEthSignedMessageHash(
        bytes32 _messagehash
    ) public pure returns (bytes32) {
        return
            keccak256(
                abi.encodePacked(
                    "\x19Ethereum Signed Message:\n32",
                    _messagehash
                )
            );
    }

    function recover(
        bytes32 _ethsignmessagehash,
        bytes memory _sig
    ) public pure returns (address) {
        (bytes32 r, bytes32 s, uint8 v) = splitSignature(_sig);
        return ecrecover(_ethsignmessagehash, v, r, s);
    }

    function splitSignature(
        bytes memory _sig
    ) internal pure returns (bytes32 r, bytes32 s, uint8 v) {
        require(_sig.length == 65, "invalid signature length");

        assembly {
            r := mload(add(_sig, 32))
            s := mload(add(_sig, 64))
            v := byte(0, mload(add(_sig, 96)))
        }
    }
}
