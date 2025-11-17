// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

/*
0.message
1.hash(message)
2.sign(hash(message),private key) | offchain
3.ecrecover(hash(message),signature) == signer
*/

contract VerifySig {
    function verify(
        address _signer,
        string memory _message,
        bytes memory _sig
    ) external pure returns (bool) {
        //获取hash
        bytes32 messageHash = getMessageHash(_message);
        //二次加工hash
        bytes32 ethSignedMessageHash = getEthSignedMessageHash(messageHash);
        //恢复看 发送地址是否吻合
        //_sig是小狐狸钱包控制台获取的签名
        return recover(ethSignedMessageHash, _sig) == _signer;
    }

    //获取消息哈希值
    function getMessageHash(
        string memory _message
    ) public pure returns (bytes32) {
        return keccak256(abi.encodePacked(_message));
    }

    //再次对已获取的hash 加工信息
    function getEthSignedMessageHash(
        bytes32 _messageHash
    ) public pure returns (bytes32) {
        return
            keccak256(
                abi.encodePacked(
                    "\x19Ethereum Signed Message:\n32",
                    _messageHash
                )
            );
    }

    //恢复
    function recover(
        bytes32 _ethSignedMessageHash,
        bytes memory _sig
    ) public pure returns (address) {
        //对签名信息拆分
        (bytes32 r, bytes32 s, uint8 v) = _split(_sig);
        return ecrecover(_ethSignedMessageHash, v, r, s);
    }

    function _split(
        bytes memory _sig
    ) internal pure returns (bytes32 r, bytes32 s, uint8 v) {
        //判断长度对不对 32+32+1
        require(_sig.length == 65, "invalid signature length");

        assembly {
            r := mload(add(_sig, 32)) //跳过前面32位 是长度
            s := mload(add(_sig, 64)) //跳过r的长度32+r的数据32  所以就跳过64
            v := byte(0, mload(add(_sig, 96))) //取第0位的字节
        }
    }
}
