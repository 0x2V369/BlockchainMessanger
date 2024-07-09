//SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

contract BlockchainMessanger{

    address owner;
    uint256 public counter;
    string public lastMessage;

    constructor(){
        owner = msg.sender;
    }

    /// 

    function updateLastMessage(string memory _newMessage) public {
        require(keccak256(abi.encodePacked(_newMessage)) != keccak256(abi.encodePacked(lastMessage)));
        lastMessage = _newMessage;
        counter ++;
    }

}