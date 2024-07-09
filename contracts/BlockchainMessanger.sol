//SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

contract BlockchainMessanger{

    // can store a string on blockchain - readable for everyone
    // message can only be changed by the person who wrote the contract
    // counter for how many times the message was updated

    address owner;
    uint256 public counter;
    string public lastMessage;

    constructor(){
        owner = msg.sender;
    }

    function updateLastMessage(string memory _newMessage) public {
        require(keccak256(abi.encodePacked(_newMessage)) != keccak256(abi.encodePacked(lastMessage)));
        lastMessage = _newMessage;
        counter ++;
    }

}