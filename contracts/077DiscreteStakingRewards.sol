// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

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

contract DiscreteStatingRewards {
    //质押Token
    IERC20 public immutable stakingToken;
    //奖励 Token
    IERC20 public immutable rewardToken;

    //用户质押的金额
    mapping(address => uint) public balanceOf;
    //合约总的质押量
    uint public totalSupply;

    //保证计算的正确性 比如说 1/2 等于0的情况
    uint private constant MULTIPLIER = 1e18;
    //全局的奖励指数
    uint private rewardIndex;
    //每个用户的奖励指数
    mapping(address => uint) private rewardIndexOf;
    //奖励金额
    mapping(address => uint) private earned;

    //初始化
    constructor(address _stakingToken, address _rewardToken) {
        stakingToken = IERC20(_stakingToken);
        rewardToken = IERC20(_rewardToken);
    }

    //更新奖励指数
    function updateRewardIndex(uint reward) external {
        rewardToken.transferFrom(msg.sender, address(this), reward);
        rewardIndex += (reward * MULTIPLIER) / totalSupply;
    }

    function _calculateRewards(address account) private view returns (uint) {
        //用户质押的数据
        uint shares = balanceOf[account];
        return (shares * (rewardIndex - rewardIndexOf[account])) / MULTIPLIER;
    }

    function calcuateRewardEarned(
        address account
    ) external view returns (uint) {
        //已经赚取的奖励+从上传更新奖励指数之后获得的奖励
        return earned[account] + _calculateRewards(account);
    }

    //更新奖励
    function _updateRewards(address account) private {
        earned[account] += _calculateRewards(account);
        rewardIndexOf[account] = rewardIndex;
    }

    function stake(uint amount) external {
        _updateRewards(msg.sender);
        balanceOf[msg.sender] += amount;
        totalSupply += amount;
        stakingToken.transferFrom(msg.sender, address(this), amount);
    }

    function unstake(uint amount) external {
        _updateRewards(msg.sender);
        balanceOf[msg.sender] -= amount;
        totalSupply -= amount;
        stakingToken.transfer(msg.sender, amount);
    }

    //给用户发奖励
    function claim() external returns (uint) {
        _updateRewards(msg.sender);

        uint reward = earned[msg.sender];
        if (reward > 0) {
            earned[msg.sender] = 0;
            rewardToken.transfer(msg.sender, reward);
        }

        return reward;
    }
}
