//SPDX-License-Identifier: MIT

pragma solidity 0.8.14;

contract ExampleConstructor{

    address public owner;
    string public a;

    constructor(address _owner,string memory _a){
        owner = _owner;
        a = _a;
    }



}