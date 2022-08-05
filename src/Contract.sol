// SPDX-License-Identifier: UNLICENSED

/**
 * @title Ivan Mamani
 * @dev Set & change owner
 */

pragma solidity ^0.8.13;

contract Contract {

    uint256 private _counter;

    constructor(){
        assembly{
            let slot := _counter.slot
            sstore(_counter.slot, 0)
        }
    }

    function increment() external{
        
        assembly{
            let _counterValue := sload(_counter.slot)
            mstore(0x0, _counterValue)
            let res := mload(0x0)
            let result := add(res, 1)
            sstore(0x0, result)
        }
    }

    function decrement() external{
        assembly{
            let _counterValue := sload(_counter.slot)
            mstore(0x0, _counterValue)
            let res := mload(0x0)
            let result := sub(res, 1)
            sstore(0x0, result)
        }
    }

    function getCounterValue() external view returns(uint256) {
        assembly{
            let _counterValue := sload(_counter.slot)
            mstore(0x0, _counterValue)
            return(0x0, 0x20)
        }
    }
}
