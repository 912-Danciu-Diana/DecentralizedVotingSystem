// SPDX-License-Identifier: MIT

pragma solidity >=0.4.22 <0.9.0;


contract Voting {
    struct Voter {
        bool voted;
        uint vote;
    }

    struct Candidate {
        bytes32 name;
        uint voteCount;
    }

    address public owner;
    mapping(address => Voter) public voters;
    Candidate[] public candidates;

    constructor(bytes32[] memory candidateNames) public {
        owner = msg.sender;
        for (uint i = 0; i < candidateNames.length; i++) {
            candidates.push(Candidate({
                name: candidateNames[i],
                voteCount: 0
            }));
        }
    }

    function vote(uint candidateIndex) public {
        require(!voters[msg.sender].voted, "Already voted.");
        voters[msg.sender].voted = true;
        voters[msg.sender].vote = candidateIndex;

        candidates[candidateIndex].voteCount += 1;
    }

    function getCandidateCount() public view returns (uint) {
        return candidates.length;
    }
}
