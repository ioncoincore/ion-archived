// Copyright (c) 2014-2016 The Dash developers
// Copyright (c) 2016-2018 The PIVX developers
// Copyright (c) 2018-2019 The Ion developers
// Distributed under the MIT/X11 software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef SPORK_H
#define SPORK_H

#include "base58.h"
#include "key.h"
#include "main.h"
#include "net.h"
#include "sync.h"
#include "util.h"

#include "obfuscation.h"
#include "protocol.h"

using namespace std;
using namespace boost;

/*
    Don't ever reuse these IDs for other sporks
    - This would result in old clients getting confused about which spork is for what
*/
#define SPORK_START 10001
#define SPORK_END 10009

#define SPORK_1_SWIFTTX 10001
#define SPORK_2_SWIFTTX_BLOCK_FILTERING 10002
#define SPORK_3_SWIFTTX_MAX_VALUE 10003
#define SPORK_4_MASTERNODE_PAYMENT_ENFORCEMENT 10004
#define SPORK_5_MASTERNODE_BUDGET_ENFORCEMENT 10005
#define SPORK_6_MASTERNODE_ENABLE_SUPERBLOCKS 10006
#define SPORK_7_MASTERNODE_PAY_UPDATED_NODES 10007
#define SPORK_8_NEW_PROTOCOL_ENFORCEMENT 10008
#define SPORK_9_ZEROCOIN_MAINTENANCE_MODE 10009

#define SPORK_1_SWIFTTX_DEFAULT 978307200                         //2001-1-1
#define SPORK_2_SWIFTTX_BLOCK_FILTERING_DEFAULT 1424217600        //2015-2-18
#define SPORK_3_SWIFTTX_MAX_VALUE_DEFAULT 1000                            //1000 ION
#define SPORK_4_MASTERNODE_PAYMENT_ENFORCEMENT_DEFAULT 1521851265 //OFF
#define SPORK_5_MASTERNODE_BUDGET_ENFORCEMENT_DEFAULT 4070908800  //OFF
#define SPORK_6_MASTERNODE_ENABLE_SUPERBLOCKS_DEFAULT 4070908800  //OFF
#define SPORK_7_MASTERNODE_PAY_UPDATED_NODES_DEFAULT 1521851265   //GMT: Saturday, March 24, 2018 12:27:45 AM (OFF 4070908800)
#define SPORK_8_NEW_PROTOCOL_ENFORCEMENT_DEFAULT 1521851265       //GMT: Saturday, March 24, 2018 12:27:45 AM (OFF 4070908800)
#define SPORK_9_ZEROCOIN_MAINTENANCE_MODE_DEFAULT 4070908800      //OFF

class CSporkMessage;
class CSporkManager;

extern std::map<uint256, CSporkMessage> mapSporks;
extern std::map<int, CSporkMessage> mapSporksActive;
extern CSporkManager sporkManager;

void LoadSporksFromDB();
void ProcessSpork(CNode* pfrom, std::string& strCommand, CDataStream& vRecv);
int64_t GetSporkValue(int nSporkID);
bool IsSporkActive(int nSporkID);
void ReprocessBlocks(int nBlocks);

//
// Spork Class
// Keeps track of all of the network spork settings
//

class CSporkMessage
{
public:
    std::vector<unsigned char> vchSig;
    int nSporkID;
    int64_t nValue;
    int64_t nTimeSigned;

    uint256 GetHash()
    {
        uint256 n = HashQuark(BEGIN(nSporkID), END(nTimeSigned));
        return n;
    }

    ADD_SERIALIZE_METHODS;

    template <typename Stream, typename Operation>
    inline void SerializationOp(Stream& s, Operation ser_action, int nType, int nVersion)
    {
        READWRITE(nSporkID);
        READWRITE(nValue);
        READWRITE(nTimeSigned);
        READWRITE(vchSig);
    }
};


class CSporkManager
{
private:
    std::vector<unsigned char> vchSig;
    std::string strMasterPrivKey;

public:
    CSporkManager()
    {
    }

    std::string GetSporkNameByID(int id);
    int GetSporkIDByName(std::string strName);
    bool UpdateSpork(int nSporkID, int64_t nValue);
    bool SetPrivKey(std::string strPrivKey);
    bool CheckSignature(CSporkMessage& spork, bool fCheckSigner = false);
    bool Sign(CSporkMessage& spork);
    void Relay(CSporkMessage& msg);
};

#endif
