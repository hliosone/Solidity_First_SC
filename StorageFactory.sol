// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./SimpleStorage.sol";

contract StorageFactory {
    //simpleStorage variable is a contract type
    //So default value is 0x000.......
    SimpleStorage public simpleStorage;

    function createSimpleContract() public {
        simpleStorage = new SimpleStorage();
    }
}