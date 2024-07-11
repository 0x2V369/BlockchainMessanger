//SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

/// @author 0x2V
/// @title A simple contract to serve

contract BlockchainMessenger{

    address public immutable owner;
    uint256 public counter;
    string public lastMessage;

    event MessageUpdated(address indexed owner, string newMessage, uint256 timestamp);

    constructor(){
        owner = msg.sender;
    }

     /**
     * @dev Updates the last message stored in the contract.
     * Requirements:
     * - The caller must be the contract owner.
     * - The new message must be different from the current message.
     * @param _newMessage The new message to store.
     */

    function updateLastMessage(string memory _newMessage) public {
        require(msg.sender == owner, "You must be the contract owner");
        require(bytes(_newMessage).length != bytes(lastMessage).length || keccak256(abi.encodePacked(_newMessage)) != keccak256(abi.encodePacked(lastMessage)),
                "Message matches current message on chain!");

        lastMessage = _newMessage;
        counter++;

        emit MessageUpdated(owner, _newMessage, block.timestamp);
    }

}
