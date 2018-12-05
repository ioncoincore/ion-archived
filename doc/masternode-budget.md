# Masternode Budget API
Ion now supports full decentralized budgets that are paid directly from the blockchain via superblocks once per month.

Budgets go through a series of stages before being paid.

Table of Contents
-----------------
- [Masternode Budget API](#masternode-budget-api)
    - [Prepare collateral transaction](#prepare-collateral-transaction)
        - [Example](#example)
            - [Warning](#warning)
    - [Submit proposal to network](#submit-proposal-to-network)
        - [Example](#example-1)
    - [Lobby for votes](#lobby-for-votes)
        - [Example: Zcoins-AS-proposal](#example-zcoins-as-proposal)
            - [Output](#output)
        - [Example for masternode in single mode](#example-for-masternode-in-single-mode)
        - [Example for masternode/s using masternode.conf (Multimode)](#example-for-masternodes-using-masternodeconf-multimode)
    - [Make it into the budget](#make-it-into-the-budget)
        - [Example](#example-2)
    - [Finalized budget](#finalized-budget)
    - [Get paid](#get-paid)
    - [RPC Commands](#rpc-commands)
        - [mnbudget "command"... ( "passphrase" )](#mnbudget-%22command%22--%22passphrase%22)
        - [mnfinalbudget "command"... ( "passphrase" )](#mnfinalbudget-%22command%22--%22passphrase%22)
        - [mode:The voting mode](#modethe-voting-mode)
            - [votehash: The vote hash for the proposal](#votehash-the-vote-hash-for-the-proposal)
            - [votecast: Your vote](#votecast-your-vote)
            - [alias: The MN alias to cast a vote for](#alias-the-mn-alias-to-cast-a-vote-for)

## Prepare collateral transaction
preparebudget \<proposal-name\> \<url\> \<payment_count\> \<block_start\> \<ion_address\> \<monthly_payment_ion\> [use_ix(true|false)]

### Example
```
preparebudget Zcoins-AS-proposal https://zcoin.io/zcoins-new-anti-scam-feature/ 2 907200 iZ9pJ6N3T1BJmR3mG7Qnvugqyuv7xUa71M 500 true
```

Output: `b8d28fe6b56d9bb4193dd644e94236c800357c339bcf867c003c805b96bc510c` - This is the collateral hash, copy this output for the next step

In this transaction we prepare collateral for "Zcoins-AS-proposal". This proposal will pay 5 (***Note:*** _pre 3.1.0 versions will spend 50) ION, _2_ times over the course of a year totaling _1000_ ION.

#### Warning
if you change any fields within this command, the collateral transaction will become invalid.**

## Submit proposal to network
mnbudget submit \<proposal-name\> \<url\> \<payment_count\> \<block_start\> \<ion_address\> \<monthly_payment_ion\> \<collateral_hash\>

### Example
```
submitbudget "Zcoins-AS-proposal" "https://zcoin.io/zcoins-new-anti-scam-feature/" 2 907200 "iZ9pJ6N3T1BJmR3mG7Qnvugqyuv7xUa71M" 500 b8d28fe6b56d9bb4193dd644e94236c800357c339bcf867c003c805b96bc510c
```

Output: `91f32aff95c043a66a6ff942f85542db4a731f8a25432b306c608f2a24298af1` - This is your proposal hash, which other nodes will use to vote on it

## Lobby for votes
Double check your information:

mnbudget getinfo \<proposal-name\>

### Example: Zcoins-AS-proposal
```
mnbudget getinfo Zcoins-AS-proposal
```
#### Output
```
{
    "Name": "Zcoins-AS-proposal",
    "URL": "https://zcoin.io/zcoins-new-anti-scam-feature/",
    "Hash": "91f32aff95c043a66a6ff942f85542db4a731f8a25432b306c608f2a24298af1",
    "FeeHash": "b8d28fe6b56d9bb4193dd644e94236c800357c339bcf867c003c805b96bc510c",
    "BlockStart": 907200,
    "BlockEnd": 993602,
    "TotalPaymentCount": 2,
    "RemainingPaymentCount": 1,
    "PaymentAddress": "iZ9pJ6N3T1BJmR3mG7Qnvugqyuv7xUa71M",
    "Ratio": 0.1052631578947368,
    "Yeas": 2,
    "Nays": 17,
    "Abstains": 0,
    "TotalPayment": 1000.00000000,
    "MonthlyPayment": 500.00000000,
    "IsEstablished": true,
    "IsValid": true,
    "IsValidReason": "",
    "fValid": true
  }
```

If everything looks correct, you can ask for votes from other masternodes. To vote on a proposal, load a wallet with _masternode.conf_ file. You do not need to access your cold wallet to vote for proposals.

mnbudget vote \<proposal_hash\> [yes|no]

### Example for masternode in single mode
```
mnbudgetvote 91f32aff95c043a66a6ff942f85542db4a731f8a25432b306c608f2a24298af1 no
```

Output: `Voted successfully 

### Example for masternode/s using masternode.conf (Multimode)
```
mnbudgetvote many 91f32aff95c043a66a6ff942f85542db4a731f8a25432b306c608f2a24298af1 no
```

Output: `Voted successfully 18 time(s) and failed 2 time(s).` - Shows how many votes were successfull and how many failed tue to the missing pubkey: `"error": "Can't find masternode by pubkey"`.

Output:
```
{
  "overall": "Voted successfully 18 time(s) and failed 2 time(s).",
  "detail": [
    {
      "node": "MN2",
      "result": "success",
      "error": ""
    },
    {
      "node": "MN3",
      "result": "failed",
      "error": "success"
    },
    {
      "node": "MN4",
      "result": "success",
      "error": ""
    },
    {
      "node": "MN5",
      "result": "success",
      "error": ""
    },
    {
      "node": "MN6",
      "result": "failed",
      "error": "success"
    },
    {
      "node": "MN7",
      "result": "success",
      "error": ""
    },
    {
      "node": "MN8",
      "result": "success",
      "error": ""
    },
    {
      "node": "MN9",
      "result": "success",
      "error": ""
    },
    {
      "node": "MN10",
      "result": "success",
      "error": ""
    }
  ]
}

```

## Make it into the budget
After you get enough votes, execute `mnbudget projection` to see if you made it into the budget. If you the budget was finalized at this moment which proposals would be in it. Note: Proposals must be active at least 1 day on the network and receive 10% of the masternode network in yes votes in order to qualify (E.g. if there is 2500 masternodes, you will need 250 yes votes.)

### Example
```
mnbudget projection
```

Output:
```
{
    {
        "Name": "Zcoins-AS-proposal",
        "URL": "https://zcoin.io/zcoins-new-anti-scam-feature/",
        "Hash": "91f32aff95c043a66a6ff942f85542db4a731f8a25432b306c608f2a24298af1",
        "FeeHash": "b8d28fe6b56d9bb4193dd644e94236c800357c339bcf867c003c805b96bc510c",
        "BlockStart": 907200,
        "BlockEnd": 993602,
        "TotalPaymentCount": 2,
        "RemainingPaymentCount": 1,
        "PaymentAddress": "iZ9pJ6N3T1BJmR3mG7Qnvugqyuv7xUa71M",
        "Ratio": 0.1052631578947368,
        "Yeas": 2,
        "Nays": 17,
        "Abstains": 0,
        "TotalPayment": 1000.00000000,
        "MonthlyPayment": 500.00000000,
        "IsEstablished": true,
        "IsValid": true,
        "IsValidReason": "",
        "fValid": true
	}
}
```

## Finalized budget
```
"main" : {
        "FeeTX" : "d6b8de9a4cadfe148f91e8fe8eed407199f96639b482f956ae6f539b8339f87c",
        "Hash" : "6e8bbaba5113de592f6888f200f146448440b7e606fcf62ef84e60e1d5ac7d64",
        "BlockStart" : 100000,
        "BlockEnd" : 100000,
        "Proposals" : "cool-project",
        "VoteCount" : 46,
        "Status" : "OK"
    },
```

## Get paid
When block `1000000` is reached you'll receive a payment for `1200` ION.


## RPC Commands
The following new RPC commands are supported:
- mnbudget "command"... ( "passphrase" )
  - prepare            - Prepare proposal for network by signing and creating tx
  - submit             - Submit proposal for network
  - vote-many          - Vote on a Ion initiative
  - vote-alias         - Vote on a Ion initiative
  - vote               - Vote on a Ion initiative/budget
  - getvotes           - Show current masternode budgets
  - getinfo            - Show current masternode budgets
  - show               - Show all budgets
  - projection         - Show the projection of which proposals will be paid the next cycle
  - check              - Scan proposals and remove invalid

- mnfinalbudget "command"... ( "passphrase" )
  - vote-many   - Vote on a finalized budget
  - vote        - Vote on a finalized budget
  - show        - Show existing finalized budgets
  - getvotes    - Get vote information for each finalized budget


### mnbudget "command"... ( "passphrase" )
| Command      | Description |
 ------------: | :---------- |
  `mnbudgetprepare`            | Prepare proposal for network by signing and creating tx |
  `mnbudgetsubmit`             | Submit proposal for network |
  `mnbudgetvote many`          | Vote on a Ion initiative |
  `mnbudgetvote alias`         | Vote on a Ion initiative |
  `mnbudgetvote`               | Vote on a Ion initiative/budget |
  `mnbudget getvotes`          | Show current masternode budgets |
  `mnbudget getinfo`           | Show current masternode budgets |
  `mnbudget show`              | Show all budgets |
  `mnbudget projection`        | Show the projection of which proposals will be paid the next cycle |
  `mnbudget check`             | Scan proposals and remove invalid |
  `mnbudget nextblock`         | Get next superblock for budget system |

### mnfinalbudget "command"... ( "passphrase" )
| Command  | Description |
 --------: | :---------- |
`mnbudgetvote many` | Vote on a finalized budget |
`mnbudgetvote` | Vote on a finalized budget |
`show`     | Show existing finalized budgets |
`getvotes` | Get vote information for each finalized budget |

### mode:The voting mode

| Voting mode | Description |
 --------: | :---------- |
local  | for voting directly from a masternode |
many | for voting with a MN controller and casting the same vote for each MN |
alias | for voting with a MN controller and casting a vote for a single MN |

#### votehash: The vote hash for the proposal
- "votehash"  (string, required) The vote hash for the proposal

#### votecast: Your vote
| Votecast | Description |
 --------: | :---------- |
yes | to vote for the proposal |
no | to vote against |

#### alias: The MN alias to cast a vote for
- "alias"     (string, required for 'alias' mode) The MN alias to cast a vote for.
