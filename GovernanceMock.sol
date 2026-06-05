// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GovernanceMock {
    uint256 public proposalCount;
    mapping(uint256 => uint256) public votes;

    event ProposalCreated(uint256 id, string title);
    event Voted(uint256 proposalId, address voter);

    function createProposal(string memory title) public {
        proposalCount += 1;
        emit ProposalCreated(proposalCount, title);
    }

    function vote(uint256 proposalId) public {
        votes[proposalId] += 1;
        emit Voted(proposalId, msg.sender);
    }

    function voteMultiple(uint256 proposalId, uint256 times) public {
        for (uint256 i = 0; i < times; i++) {
            vote(proposalId);
        }
    }
}
