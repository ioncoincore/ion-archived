# Multi masternode config

Table of Contents
-----------------
- [Multi masternode config](#multi-masternode-config)
    - [Example](#example)
        - [Explanation of the example](#explanation-of-the-example)
        - [Supported RPC commands:](#supported-rpc-commands)

The multi masternode config allows you to control multiple masternodes from a single wallet. The wallet needs to have a valid collateral output of 20000 coins for each masternode. To use this, place a file named masternode.conf in the data directory of your install:
- Windows: %APPDATA%\ioncoin\
- Mac OS: ~/Library/Application Support/ioncoin/
- Unix/Linux: ~/.ion/

The new masternode.conf format consists of a space seperated text file. Each line consisting of an alias, IP address followed by port, masternode private key, collateral output transaction id, collateral output index, donation address and donation percentage (the latter two are optional and should be in format "address:percentage").

## Example
```
mn1 127.0.0.2:12700 69xbMUHFizFGBr9bK2bbvCcBbBPuLS4BC6XH8XCjAAXp8p2ZHHU 94ca8a6d8c7dc65ff531877f409680563f4ff4bff2fa299007fbee6f49a6b23e 0
mn2 127.0.0.3:12700 6A928GJ6dD7vUXiAX5dn2r8Sfw1ExjbgdkFfRhvcLY3TCT3JFwK 85174f18468e76e4b4ef938b1df8450a59342e038809eaf71fa2eb00753fd347 0 infbibgA1apJk9uV9PvZxmWyr5VHrCLEQb:33
mn3 127.0.0.4:12700 68YjJR41H2xp96i4spjjVwqeCpBPdD2gUirYUiChoEyY7zsbmqb 5145e6dad1c36fc6c2c3fb6bdcb504961e76c9218bbc8ad659efa8ccb645390e 1 infbibgA1apJk9uV9PvZxmWyr5VHrCLEQb
```

### Explanation of the example
- the collateral for mn1 consists of transaction 94ca8a6d8c7dc65ff531877f409680563f4ff4bff2fa299007fbee6f49a6b23e, output index 0 has amount 20000
- masternode 2 will donate 33% of its income
- masternode 3 will donate 100% of its income


### Supported RPC commands:
| Command      | Description |
 ------------: | :---------- |
  count        | Print count information of all known masternodes |
  current      | Print info on current masternode winner |
  debug        | Print masternode status |
  genkey       | Generate new masternodeprivkey |
  outputs      | Print masternode compatible outputs |
  start        | Start masternode configured in ioncoin.conf |
  start-alias  | Start single masternode by assigned alias configured in masternode.conf |
  start-<mode> | Start masternodes configured in masternode.conf (<mode>: 'all', 'missing', 'disabled') |
  status       | Print masternode status information |
  list         | Print list of all known masternodes (see masternodelist for more info) |
  list-conf    | Print masternode.conf in JSON format |
  winners      | Print list of masternode winners |- outputs: list available collateral output transaction ids and corresponding collateral output indexes

When using the multi masternode setup, it is advised to run the wallet with 'masternode=0' as it is not needed anymore.