//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Web3RSVP {
  struct CreateEvent {
    bytes32 eventId;
    string eventDataCID;
    address eventOwner;
    uint256 eventTimestamp;
    uint256 deposit;
    uint256 maxCapacity;
    address[] confirmedRSVPs;
    address[] claimedRSVPs;
    bool paidOut;
  }

  mapping(bytes32 => CreateEvent) public idToEvent;
}

function createNewEvent (
  uint256 eventTimestamp,
  uint256 deposit,
  uint256 maxCapacity,
  string calldata eventDataCID
) external {
		bytes32 eventId = keccak256(
			abi.encodePacked(
				msg.sender,
				address(this),
				eventTimestamp,
				deposit,
				maxCapacity
			)
		);

		address[] memory confirmedRSVPs;
		address[] memory claimedRSVPs;	

		idToEvent[eventId] = CreateEvent(
			eventId,
			eventDataCID,
			msg.sender,
			eventTimestamp,
			deposit,
			maxCapacity,
			confirmedRSVPs,
			claimedRVSPs,
			false
		);	
}