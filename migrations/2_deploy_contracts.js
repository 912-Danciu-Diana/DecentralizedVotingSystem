const Voting = artifacts.require("Voting");

module.exports = function (deployer) {
    const candidateNames = ["John", "Alex", "Emma", "Maria"].map(name => web3.utils.asciiToHex(name));
    deployer.deploy(Voting, candidateNames);
};
