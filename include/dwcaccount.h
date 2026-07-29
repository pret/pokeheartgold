#ifndef POKEHEARTGOLD_DWCACCOUNT_H
#define POKEHEARTGOLD_DWCACCOUNT_H

#include "global.h"

typedef struct DWCUserData DWCUserData;

typedef struct DWCFriendData {
    u32 unk0;
    u32 unk4;
    u32 unk8;
} DWCFriendData;

BOOL DWC_CheckValidConsole(DWCUserData *userData);
BOOL DWC_CheckHasProfile(DWCUserData *userData);
int DWC_IsValidFriendData(DWCFriendData *friendData);
void DWC_CreateExchangeToken(DWCUserData*, DWCFriendData*);
void DWC_CreateFriendKeyToken(DWCFriendData *friendData, u64 a1);
int DWC_CheckFriendKey(DWCUserData *userData, u64 a1);
int DWC_GetGsProfileId(DWCUserData *userData, DWCFriendData *friendData);
void DWC_CreateUserData(DWCUserData *userData, s32 a1);
void DWC_ClearDirtyFlag(DWCUserData *userData);
int DWC_CheckUserData(DWCUserData *userData);
int DWC_Init(int);
int DWC_IsEqualFriendData(DWCFriendData *friendData0, DWCFriendData *friendData1);

#endif // POKEHEARTGOLD_DWCACCOUNT_H