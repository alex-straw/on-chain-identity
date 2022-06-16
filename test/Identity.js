const { expect } = require('chai');
const { ethers } = require("hardhat");

let _email = "as17163@bristol.ac.uk"
let _password = "testing"
let _hashedPassword = ethers.utils.keccak256(ethers.utils.toUtf8Bytes(_password))

describe("TEST: Identity Contract Deployment and Verification", function () {
    
    before(async function () {
        Identity = await ethers.getContractFactory('Identity');
        identity = await Identity.deploy(
            await ethers.signer.getAddress(),
            _email,
            _hashedPassword,
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

    describe("TEST: verifyOwner() - Incorrect Password", function () {
        it("Should fail if a password is given that does not correctly hash to the public hashed password", async function() {
            await expect(identity.verifyOwner("Incorrect password"))
            .to.be.revertedWith("Incorrect password")
        });

    });

    describe("TEST: verifyOwner() - Correct Password", function () {

        before(async function () {
            await identity.verifyOwner(_password);
        });

        it("Should be verified", async function() {
            let verified_state = await identity.verified.call();
            expect(verified_state).to.be.true;
        });
    });
});
