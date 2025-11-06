// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

//Data locations  --storage  memory and calldata
contract DataLocation {
    //定义结构体
    struct MyStruct {
        uint256 fool;
        string text;
    }

    mapping(address => MyStruct) myStructs;

    //添加公共变量 存储返回结果
    MyStruct public lastReturnStruct;
    uint[] public lastReturnedArray;
    string public lastAction;

    function examples() external returns (MyStruct memory) {
        myStructs[address(1)] = MyStruct(123, "pig");
        lastAction = "examples called";

        //获取结构体数据 storage 修改的数据可上链
        MyStruct storage myStruct = myStructs[address(1)];
        myStruct.text = "chicken";

        //仅仅在函数内部修改 函数执行完 fool还是原来的123
        MyStruct memory readOnly = myStructs[address(1)];
        readOnly.fool = 456;

        //保存返回结果到状态变量
        lastReturnStruct = readOnly;

        return readOnly;
    }

    //入参中 存储类型是calldata  这里的数据是不能被修改的
    function examples2(uint[] calldata y) external returns (uint[] memory) {
        //返回值类型是uint类型的数组
        myStructs[address(2)] = MyStruct(789, "dog");
        lastAction = "examples2 called";

        //获取结构体数据 storage 修改的数据可上链
        MyStruct storage myStruct = myStructs[address(2)];
        myStruct.text = "sheep";

        //仅仅在函数内部修改 函数执行完 fool还是原来的123
        MyStruct memory readOnly = myStructs[address(2)];
        readOnly.fool = 996;

        //调用下面的方法
        _internal(y);

        //内存中初始化数组的语法
        uint[] memory memArr = new uint[](3);
        memArr[0] = 567;
        memArr[1] = 789;

        lastReturnedArray = memArr;

        lastReturnStruct = readOnly;

        return memArr;
    }

    //若这里的传参是memory 那就会把数据逐一复制一份到内存。使用calldata就少了一次复制的过程，所以相对节省gas费
    function _internal(uint[] calldata y) private pure returns (uint) {
        uint x = y[0];
        return x;
    }

    function getStruct(address _addr) external view returns (MyStruct memory) {
        MyStruct memory s = myStructs[_addr];
        return s;
    }

    function getAddress2Struct() external view returns (MyStruct memory) {
        MyStruct memory s = myStructs[address(2)];
        return s;
    }

    function getAddress1Struct() external view returns (MyStruct memory) {
        MyStruct memory s = myStructs[address(1)];
        return s;
    }
}
