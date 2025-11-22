// SPDX-License-Identifier: MIT
pragma solidity 0.8.23;

interface IERC721 {
    function transferFrom(address _from, address _to, uint _nftId) external;
}

contract EnglishAuction {
    event Start();
    event Bid(address indexed sender, uint amount);
    event Withdraw(address indexed bidder, uint amount);
    event End(address highestBidder, uint highestBid);
    //NFT相关信息
    IERC721 public immutable nft;
    uint public immutable nftId;

    //拍卖信息
    address payable public immutable seller;
    uint32 public endAt;
    bool public started;
    bool public ended;

    address public highestBidder;
    uint public highestBid;
    mapping(address => uint) public bids;

    //初始化
    constructor(address _nft, uint _nftId, uint _startingBid) {
        nft = IERC721(_nft);
        nftId = _nftId;
        seller = payable(msg.sender);
        highestBid = _startingBid;
    }

    //卖家发起拍卖
    function start() external {
        require(msg.sender == seller, "not seller");
        require(!started, "started");

        started = true;
        //180秒 3分钟 为了测试需要设置的时间不长
        endAt = uint32(block.timestamp + 180);
        nft.transferFrom(seller, address(this), nftId);
        emit Start();
    }

    //买家竞价
    function bid() external payable {
        require(started, "not started");
        require(block.timestamp < endAt, "ended");
        require(msg.value > highestBid, "value<highestBid");

        if (highestBidder != address(0)) {
            //没太明白  因为当前方法是可支付的 payable类型的 也就是说每次bid竞价时 输入的value是实实在在父到当前竞价的合约中去的
            //每个人可能会存在多次出价的情况 所以说是累加
            bids[highestBidder] += highestBid;
        }

        highestBid = msg.value;
        highestBidder = msg.sender;

        emit Bid(msg.sender, msg.value);
    }

    //买家提款
    function withdraw() external {
        uint bal = bids[msg.sender];
        bids[msg.sender] = 0;
        payable(msg.sender).transfer(bal);
        emit Withdraw(msg.sender, bal);
    }

    //结束拍卖 注意：任何人都可以调用 end()，不限于卖家！
    function end() external {
        require(started, "not started");
        require(!ended, "ended");
        require(block.timestamp >= endAt, "not ended");

        ended = true;
        if (highestBidder != address(0)) {
            nft.transferFrom(address(this), highestBidder, nftId);
            seller.transfer(highestBid);
        } else {
            nft.transferFrom(address(this), seller, nftId);
        }

        emit End(highestBidder, highestBid);
    }
}
