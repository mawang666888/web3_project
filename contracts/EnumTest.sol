// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

// 编程作业
// •
// 任务：编写⼀个Solidity智能合约，实现⼀个简单的订单处理系统。
// ◦
// 声明⼀个名为 OrderStatus 的枚举，包括状态： None , Pending , Shipped ,
// Completed , Rejected , Cancelled 。
// ◦
// 创建⼀个结构体 Order ，包含买家地址和订单状态。
// ◦
// 实现功能：
// i. 添加新订单到数组。
// ii. 更新订单状态。
// iii. 获取特定订单的状态。
// iv. 重置订单状态到默认值。
// •
// 提⽰：利⽤已学习的枚举操作和智能合约基础知识，完成作业。

contract Enum{
    
    enum OrderStatus{
        None,
        Pending,
        Shipped,
        Completed,
        Rejected,
        Cancelled
    }

    struct Order{
        address buyer;
        OrderStatus status;
    }

    Order[] public orders;
    OrderStatus public status;

    function addOrder() external {
        Order memory order1=Order(msg.sender,OrderStatus.Pending);

        Order memory order2;
        order2.buyer=address(2);
        order2.status=OrderStatus.Completed;

        Order memory order3=Order({
            buyer:address(3),
            status:OrderStatus.Rejected
        });

        orders.push(order1);
        orders.push(order2);
        orders.push(order3);
        orders.push(Order(address(4),OrderStatus.Cancelled))

    }

}