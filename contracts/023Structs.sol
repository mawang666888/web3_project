// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract Structs {
    struct Car {
        string model;
        uint year;
        address owner;
    }

    Car public car;
    Car[] public cars;
    mapping(address => Car[]) public carsByOwner; //一个人可能有很多car

    function examples() external {
        //下面是3种初始化方式
        //初始化1 直接传递参数
        Car memory toyota = Car("Toyota", 1990, msg.sender);
        //初始化2 使⽤键值对，顺序可以不同
        Car memory lambo = Car({
            year: 1980,
            model: "Lamborghini",
            owner: msg.sender
        });
        //初始化3 model是空值  year是0  owner 是 address(0)  使⽤默认值，然后单独设置属性
        Car memory tesla;
        tesla.model = "Tesla";
        tesla.year = 2008;
        tesla.owner = msg.sender;

        //由于刚刚的3种车 执行完就不存在了  所以把它们放到cars中
        cars.push(toyota);
        cars.push(lambo);
        cars.push(tesla);

        //也是直接把一种车push进去
        cars.push(Car("Ferrari", 2025, msg.sender));

        //还要修改值 就不能用memory了 内存中修改的 是不会保留在区块链上的
        Car storage _car = cars[0];
        _car.year = 2000;

        //删除 变成了address(0)了
        delete _car.owner;
        delete cars[1];//不是说删除了  只是说把下标为1的 结构体 都置空 初始化了
    }
}
