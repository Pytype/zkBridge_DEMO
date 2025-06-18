pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyERC20 is ERC20 {
    uint256 public _initialSupply = 100 * (10**18);
    address public _owner;

    constructor(string memory name_, string memory symbol_) ERC20(name_, symbol_) {
        _mint(_msgSender(), _initialSupply);
        _owner = _msgSender();
    }

    function mint(address to, uint256 value) public {
        require(_owner == _msgSender(), "caller is not owner");
        _mint(to, value);
    }
}