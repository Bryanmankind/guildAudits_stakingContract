// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/guildAudits_stakingContract.sol";

contract StakingTest is Test {
    Staking staking;

    function setUp() public {
        staking = new Staking();
    }

    function invariantTotalStaked() public {
        uint256 total = 0;
        for (uint256 i = 0; i < 10; i++) {
            address user = address(uint160(i));
            total += staking.stakes(user);
        }
        assertEq(total, staking.totalStaked());
    }

    function testStake() public {
        vm.deal(address(this), 1 ether);
        staking.stake{value: 1 ether}();
        assertEq(staking.stakes(address(this)), 1 ether);
        assertEq(staking.totalStaked(), 1 ether);
    }

    function testUnstake() public {
        vm.deal(address(this), 1 ether);
        staking.stake{value: 1 ether}();
        staking.unstake(1 ether);
        assertEq(staking.stakes(address(this)), 0);
        assertEq(staking.totalStaked(), 0);
    }

    function invariantNoNegativeStakes() public {
        for (uint256 i = 0; i < 10; i++) {
            address user = address(uint160(i));
            assert(staking.stakes(user) >= 0);
        }
    }
}
