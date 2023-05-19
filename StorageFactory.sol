// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./SimpleStorage.sol";

contract StorageFactory {
    //simpleStorage variable is a contract type
    //So default value is 0x000.......
    SimpleStorage[] public simpleStorage;

    function createSimpleContract() public {
        simpleStorage.push(new SimpleStorage());
    }

    function sfStore(uint256 _storageIndex, uint256 storageNumber) public {
        simpleStorage[_storageIndex].store(storageNumber);
    }

    function sfRetrieve(uint256 _storageIndex) public view returns (uint256){
        return simpleStorage[_storageIndex].retrieve();
    }
}