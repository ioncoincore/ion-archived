# start-many Setup Guide

Table of Contents
-----------------
- [start-many Setup Guide](#start-many-setup-guide)
    - [Two Options for Setting up your Wallet](#two-options-for-setting-up-your-wallet)
    - [Option 1. Importing an existing wallet](#option-1-importing-an-existing-wallet)
        - [From your single-instance MasterNode Wallet](#from-your-single-instance-masternode-wallet)
                    - [Dump the private key from your MasterNode's pulic key.](#dump-the-private-key-from-your-masternodes-pulic-key)
        - [From your multi-instance MasterNode Wallet](#from-your-multi-instance-masternode-wallet)
                    - [Import the private key from the step above.](#import-the-private-key-from-the-step-above)
    - [Option 2. Starting with a new wallet](#option-2-starting-with-a-new-wallet)
        - [Create New Wallet Addresses](#create-new-wallet-addresses)
        - [Send 20,000 ION to New Addresses](#send-20000-ion-to-new-addresses)
        - [Create New Masternode Private Keys](#create-new-masternode-private-keys)
    - [<a name="masternodeconf"></a>Create masternode.conf file](#a-name%22masternodeconf%22acreate-masternodeconf-file)
        - [Get the collateral output](#get-the-collateral-output)
        - [Enter your MasterNode details into your masternode.conf file](#enter-your-masternode-details-into-your-masternodeconf-file)
    - [What about the ioncoin.conf file?](#what-about-the-ioncoinconf-file)
    - [Update ioncoin.conf on server](#update-ioncoinconf-on-server)
        - [Edit the masternodeprivkey](#edit-the-masternodeprivkey)
    - [Start your MasterNodes](#start-your-masternodes)
        - [Remote](#remote)
        - [Local](#local)
            - [Open up your QT Wallet](#open-up-your-qt-wallet)

## Two Options for Setting up your Wallet
There are many ways to setup a wallet to support start-many. This guide will walk through two of them.

1. [Importing an existing wallet (recommended if you are consolidating wallets).](#option-1-importing-an-existing-wallet)
2. [Sending 20,000 ION to new wallet addresses.](#option-2-starting-with-a-new-wallet)

## Option 1. Importing an existing wallet

This is the way to go if you are consolidating multiple wallets into one that supports start-many. 

### From your single-instance MasterNode Wallet

Open your QT Wallet and go to console (from the menu select Tools => Debug Console)

###### Dump the private key from your MasterNode's pulic key.

```
walletpassphrase [your_wallet_passphrase] 600
dumpprivkey [mn_public_key]
```

Copy the resulting priviate key. You'll use it in the next step.

### From your multi-instance MasterNode Wallet

Open your QT Wallet and go to console (from the menu select Tools => Debug Console)

###### Import the private key from the step above.

```
walletpassphrase [your_wallet_passphrase] 600
importprivkey [single_instance_private_key]
```

The wallet will re-scan and you will see your available balance increase by the amount that was in the imported wallet.

[Skip Option 2. and go to Create masternode.conf file](#masternodeconf)

## Option 2. Starting with a new wallet
[If you used Option 1 above, then you can skip down to Create masternode.conf file.](#masternodeconf)

### Create New Wallet Addresses

1. Open the QT Wallet.
2. Click the Receive tab. 
   ![](https://raw.githubusercontent.com/wiki/ioncoincore/ion/assets/images/sources/receive-3.1.0.png)
3. Fill in the form to request a payment.
    * Label: `mn01`
    * Amount (optional): `20000`
    * Message (optional): `Create a new MasterNode mn1`
    * Click *Request payment*
4. Click the *Copy Address* button

Create a new wallet address for each MasterNode.

![](https://raw.githubusercontent.com/wiki/ioncoincore/ion/assets/images/sources/request-payment-mn1.png)
![](https://raw.githubusercontent.com/wiki/ioncoincore/ion/assets/images/sources/request-payment-mn1-paymentinfo.png)

Close your QT Wallet.

### Send 20,000 ION to New Addresses

Just like setting up a standard MN. Send exactly 20,000 ION to each new address created above.

### Create New Masternode Private Keys

Open your QT Wallet and go to console (from the menu select Tools => Debug Console)

Issue the following:

```masternode genkey```

*Note: A masternode private key will need to be created for each MasterNode you run. You should not use the same masternode private key for multiple MasterNodes.*

Close your QT Wallet.

## <a name="masternodeconf"></a>Create masternode.conf file

Remember... this is local. Make sure your QT is not running.

Create the masternode.conf file in the same directory as your wallet.dat.

Copy the masternode private key and correspondig collateral output transaction that holds the 20K ION.

The masternode private key may be an existing key from [Option 1](#option-1-importing-an-existing-wallet), or a newly generated key from [Option 2](#option-2-starting-with-a-new-wallet). 

*Please note, the masternode priviate key is not the same as a wallet private key. Never put your wallet private key in the masternode.conf file. That is equivalent to putting your 20,000 ION on the remote server and defeats the purpose of a hot/cold setup.*

### Get the collateral output

Open your QT Wallet and go to console (from the menu select Tools => Debug Console)

Issue the following:

```masternode outputs```

Make note of the hash (which is your collaterla_output) and index.

### Enter your MasterNode details into your masternode.conf file
[From the ion github repo](masternode_conf.md)

The new masternode.conf format consists of a space seperated text file. Each line consisting of an alias, IP address followed by port, masternode private key, collateral output transaction id and collateral output index, donation address and donation percentage (the latter two are optional and should be in format "address:percentage").

```
alias ipaddress:port masternode_private_key collateral_output collateral_output_index donationin_address:donation_percentage
```



Example:

```
mn01 127.0.0.1:12700 93HaYBVUCYjEMeeH1Y4sBGLALQZE1Yc1K64xiqgX37tGBDQL8Xg 94ca8a6d8c7dc65ff531877f409680563f4ff4bff2fa299007fbee6f49a6b23e 0
mn02 127.0.0.2:12700 93WaAb3htPJEV8E9aQcN23Jt97bPex7YvWfgMDTUdWJvzmrMqey aa9f1034d973377a5e733272c3d0eced1de22555ad45d6b24abadff8087948d4 0 ihARP34UTohBaEqNqnfwtDY9USM9hZ86Px:25
```

## What about the ioncoin.conf file?

If you are using a masternode.conf file you no longer need the ioncoin.conf file. The exception is if you need custom settings (thanks oblox). 

## Update ioncoin.conf on server

If you generated a new masternode private key, you will need to update the remote ioncoin.conf files.

Shut down the daemon and then edit the file.

```sudo nano .ioncoin/ioncoin.conf```

### Edit the masternodeprivkey
If you generated a new masternode private key, you will need to update the masternodeprivkey value in your remote ioncoin.conf file.

## Start your MasterNodes

### Remote

If your remote server is not running, start your remote daemon as you normally would. 

I usually confirm that remote is on the correct block by issuing:

```iond getinfo```

And compare with the block explorer at http://ioncore.xyz/explorer/ (Chainz)

### Local

Finally... time to start from local.

#### Open up your QT Wallet

From the menu select Tools => Debug Console

If you want to review your masternode.conf setting before starting the MasterNodes, issue the following in the Debug Console:

```masternode list-conf```

Give it the eye-ball test. If satisfied, you can start your nodes one of two ways.

1. masternode start-alias [alias_from_masternode.conf]. Example ```startmasternode alias mn01```
2. masternodestart many
