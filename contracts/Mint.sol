pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "./Verifier.sol";

contract ZKToken is ERC20, Groth16Verifier {
    uint256 public _initialSupply = 100 * (10**18);
    address public _owner;

    constructor(string memory name_, string memory symbol_) ERC20(name_, symbol_) {
        _mint(msg.sender, _initialSupply);
        _owner = msg.sender;
    }

    function ownerMint(address to, uint256 value) public {
        require(msg.sender == _owner, "caller is not owner");
        _mint(to, value);
    }

    function setOwner(address newOwner) external {
    require(msg.sender == _owner, "not original owner");
    _owner = newOwner;
    }

    function mintWithProof(
        uint[2] calldata a,
        uint[2][2] calldata b,
        uint[2] calldata c,
        uint[1] calldata input,
        uint256 amount
    ) external {
        require(verifyProof(a, b, c, input), "Invalid ZK proof");
        address recipient = address(uint160(input[0]));
        _mint(recipient, amount);
    }
}