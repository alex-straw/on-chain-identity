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
    bool verified = False;

    constructor (address _owner, string _email, bytes32 _hash_pass){
        owner = _owner;
        email = _email;
        hash_pass = _hash_pass;
    }
    
    function verify_owner(string password) is_owner public {
        require(bytes32(keccak256(abi.encode(password))) == hash_pass, "Incorrect password.")
        verified = True;
    } 

    function hash(string memory _text, uint _num, address _addr) public pure returns (bytes32) {
        return keccak256(abi.encode(_text, _num, _addr));
    }

    modifier is_owner {
        require(owner==msg.sender, "Only the owner can call this function.")
    }
}
