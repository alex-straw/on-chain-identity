const { expect } = require('chai');
const { ethers } = require("hardhat");

let _email = "as17163@bristol.ac.uk"
let _password = "testing"
let _hashed_password = ethers.utils.keccak256(ethers.utils.toUtf8Bytes(_password))

describe("TEST: Identity Contract Deployment and Initialisation", function () {
    
    before(async function () {
        Identity = await ethers.getContractFactory('Identity');
        identity = await Identity.deploy(
            _email,
            _hashed_password,
        );

        await identity.deployed();
    });

    it("Should be unverified", async function() {
        let verified_state = await identity.verified.call();
        expect(verified_state).to.be.false;
    });

    it("Should have the correct email address", async function() {
        let email = await identity.email.call();
        expect(email).to.equal(_email);
    });

});