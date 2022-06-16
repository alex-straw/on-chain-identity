On-chain-identity creation and verification.

This is part of my master's thesis which aims to use ZK-SNARKS to create an 'anonymous' messaging/broadcasting board with only verified identities being allowed to post/message.

How it works:

The PortfolioFactory.sol is used to create an identity - taking as input a particular email address, and a KECCAK-256 (bytes32) hashed password that the person who calls this function does not see. The unhashed password will be emailed to the corresponding address, and to verify the identity this must be send the 'verifyOwner' function on the identity contract. After this, the verified boolean is set to True. 
