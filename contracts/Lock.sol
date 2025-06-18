pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract Lock {
    IERC20 public token;
    address public admin;

    event Locked(address indexed user, uint256 amount);

    constructor(address _token) {
        token = IERC20(_token);
        admin = msg.sender;
    }

    function lock(uint256 amount) external {
        require(amount > 0, "Amount must be > 0");
        require(token.transferFrom(msg.sender, address(this), amount), "Transfer failed");

        emit Locked(msg.sender, amount);
    }
}