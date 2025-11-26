// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

interface IERC20 {
    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function transfer(
        address recipient,
        uint256 amount
    ) external returns (bool);
    function allowance(
        address owner,
        address spender
    ) external view returns (uint256);
    function approve(address spender, uint256 amount) external returns (bool);
    function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) external returns (bool);
}

contract ERC20 is IERC20 {
    event Trransfer(address from, address to, uint256 value);
    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 value
    );
    uint public override totalSupply;
    mapping(address => uint) public override balanceOf;

    mapping(address => mapping(address => uint)) public override allowance;

    string public name = "Test";
    string public symbol = "Test";
    uint8 public decimals = 18;

    function transfer(
        address recipient,
        uint256 amount
    ) external override returns (bool) {
        balanceOf[msg.sender] -= amount;
        balanceOf[recipient] += amount;
        emit Trransfer(msg.sender, recipient, amount);
        return true;
    }

    function approve(
        address spender,
        uint256 amount
    ) external override returns (bool) {
        allowance[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender, amount);
        return true;
    }

    function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) external override returns (bool) {
        allowance[sender][msg.sender] -= amount;
        balanceOf[sender] -= amount;
        balanceOf[recipient] += amount;
        emit Trransfer(sender, recipient, amount);
        return true;
    }

    function mint(uint amount) internal {
        balanceOf[msg.sender] += amount;
        totalSupply += amount;
        emit Trransfer(address(0), msg.sender, amount);
    }

    function burn(uint amount) internal {
        balanceOf[msg.sender] -= amount;
        totalSupply -= amount;
        emit Trransfer(msg.sender, address(0), amount);
    }
}

contract WETH is ERC20 {
    //存款事件
    event Deposit(address indexed account, uint amount);
    //取款事件
    event Withdraw(address indexed account, uint amount);

    fallback() external payable {
        deposit();
    }

    // 取消注释并修正语法
    constructor() {
        name = "Wrapped Ether";
        symbol = "WETH";
    }

    function deposit() public payable {
        mint(msg.value);
        emit Deposit(msg.sender, msg.value);
    }

    function withdraw(uint _amount) external {
        burn(_amount);
        payable(msg.sender).transfer(_amount);
        emit Withdraw(msg.sender, _amount);
    }
}