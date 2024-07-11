# BlockchainMessenger Smart Contract

BlockchainMessenger is a simple and secure smart contract designed to allow only the contract owner to update and store messages on the Ethereum blockchain. This contract ensures that messages are securely stored and can be tracked transparently through events.

## Features

- **Owner-exclusive Message Updates**: Only the contract owner can update and store messages.
- **Event Logging**: Logs every message update with details like the owner, new message, and timestamp for transparency and auditing purposes.

## Smart Contract

```solidity
// SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

/**
 * @title BlockchainMessenger
 * @dev A simple contract to allow the owner to update and store messages on-chain.
 */
contract BlockchainMessenger {

    address public immutable owner;
    uint256 public counter;
    string public lastMessage;

    event MessageUpdated(address indexed owner, string newMessage, uint256 timestamp);

    /**
     * @dev Constructor sets the contract deployer as the owner.
     */
    constructor() {
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
```

## Getting Started

### Prerequisites

To deploy and interact with this contract, you need:

- [Node.js](https://nodejs.org/)
- [npm](https://www.npmjs.com/) or [yarn](https://yarnpkg.com/)
- [Hardhat](https://hardhat.org/) (for development and testing)
- [MetaMask](https://metamask.io/) (or any other Ethereum wallet)

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/BlockchainMessenger.git
   cd BlockchainMessenger
   ```

2. Install dependencies:
   ```bash
   npm install
   ```

3. Compile the smart contract:
   ```bash
   npx hardhat compile
   ```

### Deployment

1. Configure your network settings in `hardhat.config.js`.
2. Deploy the contract:
   ```bash
   npx hardhat run scripts/deploy.js --network yournetwork
   ```

### Interacting with the Contract

You can interact with the contract using Hardhat scripts, or through a web interface like [Remix](https://remix.ethereum.org/) or a custom DApp.

## Security Considerations

- **Owner-exclusive Access**: Ensures that only the contract owner can update the stored message.
- **Event Logging**: Provides transparency by logging every message update on-chain.
- **Gas Optimization**: Includes basic optimizations such as checking message length before hashing to save gas.

## Contributing

Contributions are welcome! Please open an issue or submit a pull request to contribute.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Acknowledgements

- [OpenZeppelin](https://openzeppelin.com/) for their secure smart contract patterns.
- [Hardhat](https://hardhat.org/) for providing a robust development environment.
