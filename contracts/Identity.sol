// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/**
 * @title Owner
 * @dev Set & change owner
 */
contract Identity {

    address public owner;
    string public email;
    bytes32 private hashedPassword;
    bool public verified = false;

    constructor (string memory _email, bytes32 _hashedPassword){
        owner = msg.sender;
        email = _email;
        hashedPassword = _hashedPassword;
    }
    
    function verifyOwner(string memory password) onlyOwner public {
        require(keccak256(abi.encodePacked(password)) == hashedPassword, "Incorrect password");
        verified = true;
    } 

    modifier onlyOwner {
        require(msg.sender == owner, "Only the owner can call this function");
            _;
    }
}