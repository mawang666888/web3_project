// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

// insert, update, read from array of structs
contract TodoList {
    struct ToDo {
        string taskDesc;
        bool completed;
    }

    ToDo[] public toDos;

    //原来写的是memory 可以是calldata
    function create(string calldata _taskDesc) external {
        ToDo memory todo = ToDo(_taskDesc, false);
        toDos.push(todo);
        //toDos.push(ToDo(_taskDesc,false));
        //toDos.push(ToDo({taskDesc: _taskDesc, completed: false}));
    }

    //原来是memory
    function updateText(uint _index, string calldata _taskDesc) external {

        //当一次性要更新多个变量的时候 这种更省gas费 这个是我写的
        // ToDo storage todo = toDos[_index];
        // todo.taskDesc = _taskDesc;

        //当更新的参数只有一个的时候 这种更省gas
        toDos[_index].taskDesc = _taskDesc;
    }

    function toggleCompleted(uint _index) external {
        // ToDo storage todo = toDos[_index];
        // todo.completed = true;
        toDos[_index].completed = !toDos[_index].completed;
    }

    function get(uint _index) external view returns (string memory, bool) {
        ToDo memory todo = toDos[_index];
        return (todo.taskDesc, todo.completed);
    }
}
