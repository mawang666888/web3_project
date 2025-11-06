// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

// 编程作业
// •
// 任务：编写⼀个Solidity智能合约，实现⼀个简单的订单处理系统。
// ◦
// 声明⼀个名为 OrderStatus 的枚举，包括状态： None , Pending , Shipped ,
// Completed , Rejected , Cancelled 。
// ◦
// 创建⼀个结构体 Order ，包含买家地址和订单状态。
// ◦
// 实现功能：
// i. 添加新订单到数组。
// ii. 更新订单状态。
// iii. 获取特定订单的状态。
// iv. 重置订单状态到默认值。

contract Enum {
    enum OrderStatus {
        None,
        Pending,
        Shipped,
        Completed,
        Rejected,
        Cancelled
    }

    struct Order {
        address buyer;
        OrderStatus status;
    }

    Order[] orders;

    function addOrder() external {
        Order memory order1 = Order(address(1), OrderStatus.Pending);
        Order memory order2 = Order({
            buyer: address(2),
            status: OrderStatus.Shipped
        });
        orders.push(order1);
        orders.push(order2);
        orders.push(Order(address(3), OrderStatus.Completed));
    }

    function updateOrderStatus(uint orderId, OrderStatus status) external {
        require(orderId < orders.length, "order not exist");
        orders[orderId].status = status;
    }

    function getOrderStatus(uint orderId) external view returns (OrderStatus) {
        require(orderId < orders.length, "order not exist");
        return orders[orderId].status;
    }

    function resetOrderStatus(uint orderId) external {
        require(orderId < orders.length, "order not exist");
        delete orders[orderId].status;
    }
}
