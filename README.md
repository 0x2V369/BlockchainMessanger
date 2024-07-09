# BlockchainMessenger

> [!NOTE]
> This is stil work in progress


## BlockchainMessenger.sol 
  ### messenger idea:
  - A simple project to create a 'blockchain messenger' (note, couldnt really call it a messenger since only the owner of the contract can update the message)
  - contract has 3 state variables, owner, msgCounter, lastMessage
    - owner - address type, that is assigned to contract deployer address
    - msgCounter - pretty self explanatory
    - lastMessage - last valid message sent to contract

 ### Logic:
   - During the deployment of contract var 'owner' is assigned to address that deployed the contract
   - when BlockchainMessenger.updateLastMessage() is called:
    - input string is provided as the new "last message"
     - function checks if the message sender is the owner
     - function checks if the "new" message is not the same as the message that is currently stored on-chain
       - if both checks are passed:
         - state var 'lastMessage' is updated
         - 'msgCounter' increased by 1

    
   
### Improvement ideas:
  - see what is more gas effective, constructor or directly assigning owner an address value
  - require replaced with assert
  - streamline the contract for gas costs were possible


