// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;


import "./Identity.sol";

/**
This contract is used to create new identities. Only email addresses with non 0x00...
mappings are genuine identities.
 */
 
contract IdentityFactory { 

    address public admin;

    constructor () {
        admin = msg.sender;
    }

    event CreateIdentity(
        address indexed owner_,
        address indexed identityAddress,
        string indexed email_
    );

    mapping(string => address) public identityMap;

    function create(address owner_, string memory email_, bytes32 hashedPassword_) onlyAdmin public {
        Identity identity = new Identity(
            owner_,
            email_,
            hashedPassword_
        );
        emit CreateIdentity(
            msg.sender,
            address(identity),
            email_
        );
        identityMap[email_] = address(identity);
    }

    modifier onlyAdmin {
        require(msg.sender == admin, "Only the admin can call this function");
            _;
    }
}