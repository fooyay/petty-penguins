// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {PenguinStorage} from "./PenguinStorage.sol";

contract PenguinStorageFactory {

    PenguinStorage[] public listOfPenguinStorageContracts;

    function createPenguinStorageContract() public {
        PenguinStorage newPenguinStorage = new PenguinStorage();
        listOfPenguinStorageContracts.push(newPenguinStorage);
    }

    function psfStore(uint256 _penguinStorageIndex, uint256 _newPenguinStorageNumber) public {
        PenguinStorage myPenguinStorage = listOfPenguinStorageContracts[_penguinStorageIndex];
        myPenguinStorage.store(_newPenguinStorageNumber);
    }

    function psfGet(uint256 _penguinStorageIndex) public view returns(uint256) {
        return listOfPenguinStorageContracts[_penguinStorageIndex].retrieve();
    }
}