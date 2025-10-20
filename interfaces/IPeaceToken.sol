// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/// @title IPeaceToken
/// @notice Minimal surface used by other protocol contracts (staking, pools, etc.)
interface IPeaceToken {
    /// @dev EIP-20
    function name() external view returns (string memory);
    function symbol() external view returns (string memory);
    function decimals() external view returns (uint8);
    function totalSupply() external view returns (uint256);
    function balanceOf(address a) external view returns (uint256);
    function allowance(address owner, address spender) external view returns (uint256);
    function approve(address spender, uint256 amount) external returns (bool);
    function transfer(address to, uint256 amount) external returns (bool);
    function transferFrom(address from, address to, uint256 amount) external returns (bool);

    /// @dev EIP-2612 Permit
    function nonces(address owner) external view returns (uint256);
    function DOMAIN_SEPARATOR() external view returns (bytes32);

    /// @dev OZ ERC20Votes
    function getVotes(address account) external view returns (uint256);
    function getPastVotes(address account, uint256 blockNumber) external view returns (uint256);
    function delegates(address account) external view returns (address);
    function delegate(address delegatee) external;
    function delegateBySig(address delegatee, uint256 nonce, uint256 expiry, uint8 v, bytes32 r, bytes32 s) external;

    /// @dev Protocol sugar
    function mint(address to, uint256 amount) external;
    function burn(address from, uint256 amount) external;

    /// @dev Role discovery helpers (not strictly required but handy)
    function ADMIN_ROLE() external view returns (bytes32);
    function MINTER_ROLE() external view returns (bytes32);
    function BURNER_ROLE() external view returns (bytes32);
    function PAUSER_ROLE() external view returns (bytes32);
}
