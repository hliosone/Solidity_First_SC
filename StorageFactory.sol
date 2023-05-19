// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./SimpleStorage.sol";

contract StorageFactory {
    //simpleStorage variable is a contract type
    //So default value is 0x000.......
    SimpleStorage[] public simpleStorage;

    //push the address of new SCs in our array
    function createSimpleContract() public {
        simpleStorage.push(new SimpleStorage());
    }

    //store a number using function from other SC in a contract
    function sfStore(uint256 _storageIndex, uint256 storageNumber) public {
        simpleStorage[_storageIndex].store(storageNumber);
    }

    //getter for a stored number in a contract
    function sfRetrieve(uint256 _storageIndex) public view returns (uint256){
        return simpleStorage[_storageIndex].retrieve();
    }
}