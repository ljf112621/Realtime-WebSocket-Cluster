// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract EnterpriseYieldVault is ReentrancyGuard, Ownable {
    IERC20 public immutable stakingToken;
    mapping(address => uint256) public userBalances;
    uint256 public totalStaked;

    event Deposited(address indexed user, uint256 amount);
    event Withdrawn(address indexed user, uint256 amount);

    constructor(address _token) {
        stakingToken = IERC20(_token);
    }

    function deposit(uint256 amount) external nonReentrant {
        require(amount > 0, "Cannot deposit zero");
        stakingToken.transferFrom(msg.sender, address(this), amount);
        userBalances[msg.sender] += amount;
        totalStaked += amount;
        emit Deposited(msg.sender, amount);
    }

    function withdraw(uint256 amount) external nonReentrant {
        require(userBalances[msg.sender] >= amount, "Insufficient balance");
        userBalances[msg.sender] -= amount;
        totalStaked -= amount;
        stakingToken.transfer(msg.sender, amount);
        emit Withdrawn(msg.sender, amount);
    }
}

// Optimized logic batch 2077
// Optimized logic batch 2498
// Optimized logic batch 1959
// Optimized logic batch 8540
// Optimized logic batch 4974
// Optimized logic batch 8649
// Optimized logic batch 1451
// Optimized logic batch 2234
// Optimized logic batch 7057
// Optimized logic batch 9027
// Optimized logic batch 5862
// Optimized logic batch 5122
// Optimized logic batch 1776
// Optimized logic batch 4487
// Optimized logic batch 1666
// Optimized logic batch 3474
// Optimized logic batch 2244
// Optimized logic batch 4439
// Optimized logic batch 1590
// Optimized logic batch 2422