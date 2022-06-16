// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/**
 * @title Owner
 * @dev Set & change owner
 */
contract Identity {

    address public owner;
    string public email;
    bytes32 private hash_pass;
    bool public verified = false;

    constructor (string memory _email, bytes32 _hash_pass){
        owner = msg.sender;
        email = _email;
        hash_pass = _hash_pass;
    }
    
    function verify_owner(string memory password) onlyOwner public {
        require(keccak256(abi.encodePacked(password)) == hash_pass, "Incorrect password.");
        verified = true;
    } 

    modifier onlyOwner {
        require(msg.sender == owner, "Only the owner can call this function.");
            _;
    }
}