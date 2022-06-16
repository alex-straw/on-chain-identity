// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;


import "./Identity.sol";


/**
 * @title Owner
 * @dev Set & change owner
 */
contract IdentityFactory { 

    event CreateIdentity(
        address indexed owner_,
        address indexed identityAddress,
        string indexed email_
    );

    mapping(string => address) public identityMap;

    function create(string memory email_, bytes32 hashedPassword_) public {
        Identity identity = new Identity(
            msg.sender,
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
}