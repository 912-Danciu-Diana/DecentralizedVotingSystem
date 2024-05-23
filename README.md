# Voting DApp
## Step-by-Step Guide
1. Open the Truffle console:
    ```bash
    truffle console
    ```

2. Get the deployed instance and accounts:
    ```javascript
    let votingInstance;
    Voting.deployed().then(instance => votingInstance = instance);

    let accounts;
    web3.eth.getAccounts().then(acc => accounts = acc);
    ```

3. Check the number of candidates:
    ```javascript
    votingInstance.getCandidateCount().then(count => console.log(count.toString()));
    ```

4. Retrieve each candidate:
    ```javascript
    votingInstance.candidates(0).then(candidate => {
        console.log(web3.utils.hexToAscii(candidate.name), candidate.voteCount.toString());
    });

    votingInstance.candidates(1).then(candidate => {
        console.log(web3.utils.hexToAscii(candidate.name), candidate.voteCount.toString());
    });

    votingInstance.candidates(2).then(candidate => {
        console.log(web3.utils.hexToAscii(candidate.name), candidate.voteCount.toString());
    });

    votingInstance.candidates(3).then(candidate => {
        console.log(web3.utils.hexToAscii(candidate.name), candidate.voteCount.toString());
    });
    ```

5. Example interactions (voting):
    ```javascript
    let bob = accounts[1];
    votingInstance.vote(1, { from: bob });

    let carol = accounts[2];
    votingInstance.vote(0, { from: carol });

    votingInstance.candidates(0).then(candidate => {
        console.log(web3.utils.hexToAscii(candidate.name), candidate.voteCount.toString());
    });

    votingInstance.candidates(1).then(candidate => {
        console.log(web3.utils.hexToAscii(candidate.name), candidate.voteCount.toString());
    });
    ```