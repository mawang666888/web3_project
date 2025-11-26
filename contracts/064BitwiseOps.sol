// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

contract BitwiseOps {
    //与 有1个为0就是0、都是1才是1
    //x  = 1110=8+4+2+0=14
    //y  = 1011=8+0+2+1=11
    //x&y= 1010=8+0+2+0=10
    function and(uint256 x, uint256 y) external pure returns (uint256) {
        return x & y;
    }

    //有个为1就为1  都为0才是0
    //x    =  1100=8+4+0+0=12
    //y    =  1001=8+0+0+1=9
    //x | y=  1101=8+4+0+1=13
    function or(uint256 x, uint256 y) external pure returns (uint256) {
        return x | y;
    }

    //当前位是1和0组合 返回1、否则都是1或都是0 返回0
    //x    =  1100=8+4+0+0=12
    //y    =  0101=0+4+0+1=5
    //x ^ y=  1001=8+0+0+1=9
    function xor(uint256 x, uint256 y) external pure returns (uint256) {
        return x ^ y;
    }

    //非运算 按位取反
    //x=00001100=0+0+0+0+8+4+0+0=12
    //~x=11110011=128+64+32+16+0+0+2+1=243
    //2*2*2*2*2*2*2=128
    function not(uint8 x) external pure returns (uint8) {
        return ~x;
    }

    //1 << 0 = 0001-->0001=1
    //1 << 1 = 0001-->0010=2
    //1 << 2 = 0001-->0100=4
    //1 << 3 = 0001-->1000=8
    //3 <<2  = 0011-->1100=12
    //左移
    function shiftLeft(
        uint256 x,
        uint256 bits
    ) external pure returns (uint256) {
        return x << bits;
    }

    //右移
    //8 ==> 0 = 1000 --> 1000 = 8
    //8 ==> 1 = 1000 --> 0100 = 4
    //8 ==> 2 = 1000 --> 0010 = 2
    //8 ==> 3 = 1000 --> 0001 = 1
    //8 ==> 4 = 1000 --> 0000 = 0
    //12 ==> 1= 1100 --> 0110 = 6
    function shiftRight(
        uint256 x,
        uint256 bits
    ) external pure returns (uint256) {
        return x >> bits;
    }

    //Get last n bits from x
    //Example,last 3 bits
    //x=        1101=13
    //mask  =0111
    //output =  0101=4+1=5
    function getLastNbits(
        uint256 x,
        uint256 n
    ) external pure returns (uint256) {
        //1-->1000 -1 -->0111
        uint mask = (1 << n) - 1;
        return x & mask;
    }

    function getLastNBitUsingMod(
        uint x,
        uint n
    ) external pure returns (uint256) {
        return x % (1 << n);
    }
}