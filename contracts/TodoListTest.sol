// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

// 编程作业
// •
// 任务：编写⼀个Solidity程序，实现⼀个简单的待办事项列表。
// •
// 要求：
// a. 定义⼀个 ToDo 结构体，包含 text （任务描述）和 completed （是否完成）。
// b. 创建⼀个 ToDo[] 数组来存储多个任务。
// c. 实现 create , updateText ,和 toggleCompleted 函数。
// d. 部署合约到测试⽹络，并通过界⾯或命令⾏测试各个函数的功能。

contract TodoListTest {
    struct ToDo {
        string text;
        bool completed;
    }

    ToDo[] public todos;

    function create(string calldata _text, bool _completed) external {
        todos.push(ToDo(_text, _completed));
        //todos.push(ToDo({text: _text, completed: _completed}));
    }

    function updateText(uint _index, string calldata _text) external {
        todos[_index].text = _text;
    }

    //切换状态
    function toggleCompleted(uint _index) external {
        todos[_index].completed = !todos[_index].completed;
    }
}
