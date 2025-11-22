// SPDX-License-Identifier: MIT
pragma solidity 0.8.23;

contract TestMultiCall {
    function func1() external view returns (uint, uint) {
        return (1, block.timestamp);
    }

    function func2() external view returns (uint, uint) {
        return (2, block.timestamp);
    }

    function getData1() external pure returns(bytes memory){
        //方式一
        //return abi.encodeWithSignature("func1()");
        return abi.encodeWithSelector(this.func1.selector);
    }

    function getData2() external pure returns(bytes memory){
        //方式一
        //return abi.encodeWithSignature("func2()");
        return abi.encodeWithSelector(this.func2.selector);
    }

    
}

contract MultiCall {
    /* //calldata：特殊数据位置，只读且 Gas 成本最低 
    //适合作为函数参数，不需要修改的情况
    //targets 是 2个 TestMultiCall 一样的部署合约的地址
    //data 是getData1和getData2 返回的数据 组合成数组 */
    function mutiCall(
        address[] calldata targets,
        bytes[] calldata data
    ) external view returns (bytes[] memory) {
        require(targets.length == data.length, "target length != data length");

        bytes[] memory results = new bytes[](data.length);

        for (uint i = 0; i < targets.length; i++) {
            //只读 不修改
            (bool success, bytes memory result) = targets[i].staticcall(
                data[i]
            );
            require(success, "tx failed");
            results[i] = result;
        }

        return results;
    }
}
