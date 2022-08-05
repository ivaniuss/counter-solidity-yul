// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Contract.sol";


contract ContractTest is Test {
    Contract contractTest;
    function setUp() external {
        contractTest = new Contract();
    }

    function testIncrement() external {
        contractTest.increment();
        assertEq(contractTest.getCounterValue(), 1);
    }

    function testDecrement() external {
        contractTest.increment();
        contractTest.decrement();
        assertEq(contractTest.getCounterValue(), 0);
    }
}
