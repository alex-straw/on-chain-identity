// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/*
This is an identity contract. It is used to prove that an EOA owns a particular email address.
If genuine, a mapping of the email address to this contract address will be found by querying
the 'identityFactory.sol' contract.
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