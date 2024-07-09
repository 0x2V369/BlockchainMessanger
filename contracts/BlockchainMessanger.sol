//SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

/// @author 0x2V
/// @title A simple contract to serve

contract BlockchainMessanger{

    address owner;
    uint256 public counter;
    string public lastMessage;


    constructor(){
        owner = msg.sender;
    }

    /// Store '_newMessage' in state variable lastMessage
    /// @dev first checks that the message sender is the owner of the contract
    /// @dev then checks if the message is not the same as the message already stored
    /// @dev if first two checks are passed, variable 'lastMessage' is updated
    /// @dev if message updated counter is increased by 1

    function updateLastMessage(string memory _newMessage) public {
        require(msg.sender == owner, "You must be the contract owner");
        require(keccak256(abi.encodePacked(_newMessage)) != keccak256(abi.encodePacked(lastMessage)),
                "Message matches current message on chain!");
        lastMessage = _newMessage;
        counter ++;
    }

}