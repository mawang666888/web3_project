// SPDX-License-Identifier: MIT
pragma solidity 0.8.23;

contract Factory {
    event Deploy(address indexed addr);

    function deploy(bytes32 salt) public {
        address precomputedAddress = getAddress(salt);
        MyContract _contract = new MyContract{salt: salt}(msg.sender);
        emit Deploy(address(_contract));
        require(address(_contract) == precomputedAddress, "Address mismatch!");
    }

    function getAddress(bytes32 salt) public view returns (address) {
        bytes32 bytecodeHash = keccak256(
            abi.encodePacked(
                bytes1(0xff),
                address(this),
                salt,
                keccak256(
                    abi.encodePacked(
                        type(MyContract).creationCode,
                        abi.encode(msg.sender)
                    )
                )
            )
        );
        return address(uint160(uint(bytecodeHash)));
    }
}

contract MyContract {
    address public owner;
    constructor(address _owner) {
        owner = _owner;
    }
}
