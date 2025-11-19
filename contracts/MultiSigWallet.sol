// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

// 编程作业
// 请根据课程内容，编写⼀个基本的多签名钱包合约。要求：
// 1. 定义事件 Deposit 、 Submit 、 Approve 、 Execute 和 Revoke 。
// 2. 定义状态变量 owners 、 isOwner 、 required 、 transactions 和 approve 。
// 3. 编写构造函数，初始化所有者数组和所需批准数。
// 4. 实现 receive 函数接收以太币。
// 5. 编写 submit 函数提交新交易。
// 6. 实现 approve 函数批准交易。
// 7. 编写 execute 函数执⾏交易。
// 8. 实现 revoke 函数撤销批准。
contract MultiSigWallet {
    //写的owenr
    event Deposit(address indexed sender, uint value);
    //多了owner
    event Submit(uint txId);
    event Approve(address indexed owner, uint txId);
    //多了owenr
    event Execute(uint txId);
    event Revoke(address indexed owner, uint txId);

    struct Transaction {
        address _to;
        uint _value;
        bytes _data;
        bool executed;
    }

    address[] public owners;
    mapping(address => bool) public isOwner;
    uint public required;
    Transaction[] public transactions;
    mapping(uint => mapping(address => bool)) public approved;

    modifier onlyOwner() {
        require(isOwner[msg.sender], "not owner");
        _;
    }

    modifier isExist(uint _txId) {
        require(_txId < transactions.length, "tx not exist");
        _;
    }

    modifier notExecute(uint _txId) {
        // Transaction storage transaction = transactions[_txId];
        // require(!transaction.executed, "already execute");
        require(!transactions[_txId].executed, "tx already executed");
        _;
    }

    modifier notApprove(uint _txId) {
        require(!approved[_txId][msg.sender], "already approve");
        _;
    }

    //少传owners
    constructor(address[] memory _owners, uint _required) {
        //这个少了的
        require(_owners.length > 0, " owners require");
        //少个等于
        require(
            _required > 0 && _required <= owners.length,
            "required is not normal"
        );

        for (uint i = 0; i < _owners.length; i++) {
            address owner = _owners[i];
            //少了的
            require(owner != address(0), "invalid owner");
            require(!isOwner[owner], "not uniqued");

            isOwner[owner] = true;
            owners.push(owner);
        }
        //之前写在for前面了
        required = _required;
    }

    receive() external payable {
        emit Deposit(msg.sender, msg.value);
    }

    //之前写的public
    function submit(
        address owner,
        uint value,
        bytes calldata data
    ) external onlyOwner {
        //多的
        // require(owner != address(0), "owner is wrong");
        transactions.push(
            Transaction({
                _to: owner,
                _value: value,
                _data: data,
                executed: false
            })
        );

        emit Submit(transactions.length - 1);
    }

    //传参多了个owner 写成了public
    function approve(
        uint _txId
    ) external onlyOwner isExist(_txId) notApprove(_txId) notExecute(_txId) {
        approved[_txId][msg.sender] = true;
        emit Approve(msg.sender, _txId);
    }

    //这个当时没理解太好 一个交易是需要多人批准的
    function _getApprovalCount(uint _txId) private view returns (uint count) {
        for (uint i = 0; i < owners.length; i++) {
            if (approved[_txId][owners[i]]) {
                count += 1;
            }
        }
    }

    //多写了notApprove
    function execute(
        uint _txId
    ) public onlyOwner isExist(_txId) notExecute(_txId) {
        // require(required <= owners.length, "required error");
        require(_getApprovalCount(_txId) >= required, "approvals < required");
        Transaction storage transaction = transactions[_txId];
        transaction.executed = true;
        (bool success, ) = transaction._to.call{value: transaction._value}(
            transaction._data
        );
        require(success, "tx failed");
        emit Execute(_txId);
    }

    //多了 owner  撤销是针对取消授权的 不是取消执行的
    // function revoke(
    //     uint _txId
    // ) public onlyOwner isExist(_txId) notExecute(_txId) {
    //     Transaction storage transaction = transactions[_txId];
    //     require(!transaction.executed, "not executed");
    //     transaction.executed = false;
    //     emit Revoke(owner, _txId);
    // }

    function revoke(uint _txId) external onlyOwner isExist(_txId) {
        require(approved[_txId][msg.sender], "tx not approved ");
        approved[_txId][msg.sender] = false;
        emit Revoke(msg.sender, _txId);
    }
}
