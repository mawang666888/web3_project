// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

// 编程作业：创建⼀个Solidity智能合约，包含⼀个名为 Vehicle 的struct，具有以下属性： make 
// (制造商，字符串类型)， year (⽣产年份，整数类型)，和 owner (所有者，地址类型)。合约应允许⽤⼾：

// 添加新的⻋辆到数组中。
// 访问和修改特定⻋辆的年份。
// 删除⻋辆记录。
contract StructTest {
    //把结构体当成其他语言的 面向对象的属性
    struct Vehicle {
        string make;
        uint year;
        address owner;
    }

    Vehicle public vehicle;
    Vehicle[] public vehicleArr;

    function addToVehicle(
        string memory _make,
        uint _year,
        address _owner
    ) public {
        //课程中的第三种方式
        Vehicle memory vs;
        vs.make = _make;
        vs.year = _year;
        vs.owner = _owner;
        vehicleArr.push(vs);
    }

    function getYear(uint _index) external view returns (uint) {
        require(_index < vehicleArr.length, "index out of bounds");
        return vehicleArr[_index].year;
    }

    function setYear(uint _index, uint _year) external {
        require(_index < vehicleArr.length, "index out of bounds");
        vehicleArr[_index].year = _year;
    }

    function getVehicle(uint _index) external view returns (Vehicle memory) {
        require(_index < vehicleArr.length, "index out of bounds");
        return vehicleArr[_index];
    }

    function deleteVehicle(uint _index) public {
        require(_index < vehicleArr.length, "index out of bounds");
        delete vehicleArr[_index];
    }

    //手动赋值 删除
    function example() external {
        //原来写的是public
        //下面注释的是之前写的 这是错误的 不能上来就索引0 因为是空的 这样写就有问题
        // vehicleArr[0].make = "bmw1";
        // vehicleArr[0].year = 2001;
        // vehicleArr[0].owner = address(1);

        vehicleArr.push(Vehicle("bmw1", 2001, address(1)));
        vehicleArr.push(Vehicle("bmw2", 2002, address(2)));

        //初始化1
        Vehicle memory bmw3 = Vehicle("bmw3", 2003, address(3));
        //初始化2
        Vehicle memory bmw4 = Vehicle({
            make: "bmw4",
            year: 2004,
            owner: address(4)
        });
        //初始化3
        Vehicle memory jeep;
        jeep.make = "Jeep";
        jeep.year = 2005;
        jeep.owner = address(5);

        vehicleArr.push(bmw3);
        vehicleArr.push(bmw4);
        vehicleArr.push(jeep);
        vehicleArr.push(Vehicle("QIRUI",2024,address(6)));

        Vehicle storage _ve = vehicleArr[4];
        _ve.year = 2026;

        //删除
        delete _ve.owner;
        delete vehicleArr[0];
    }
}
