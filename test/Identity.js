const { expect } = require("chai");


describe("Identity Contract", function () {

    before(async function () {

        Identity = await ethers.getContractFactory('Identity');
        identity = await Identity.deploy(
            _owner,
            _email,
            _hashpass,
        );

        await identity.deployed();
    });

});