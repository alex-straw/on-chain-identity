const { expect } = require('chai');
const { ethers } = require("hardhat");

let _owner = "0xF1C37BC188643DF4Bf15Fd437096Eb654d30abc1"
let _email = "as17163@bristol.ac.uk"
let _password = "testing"
let _hashed = ethers.utils.keccak256(ethers.utils.toUtf8Bytes(_password))

describe("Identity Contract", function () {
    
    before(async function () {

        Identity = await ethers.getContractFactory('Identity');
        identity = await Identity.deploy(
            _owner,
            _email,
            _hashed,
        );

        await identity.deployed();
    });

    it("Should have the correct owner", async function() {
        let owner = await identity.owner.call();
        expect(owner).to.equal(_owner);
    });

    it("Should be unverified")

});