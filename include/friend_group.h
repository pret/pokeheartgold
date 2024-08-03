#ifndef POKEHEARTGOLD_FRIEND_GROUP_H
#define POKEHEARTGOLD_FRIEND_GROUP_H

#include "pm_string.h"
#include "save.h"

// Hey, you wanna join a GROUP?

#define FGRP_MAX (6)

typedef struct FriendGroup {
    u16 unk_0[8];
    u16 unk_10[8];
    u8 unk_20;
    u8 unk_21;
    u32 unk_24;
    u32 unk_28;
} FRIEND_GROUP;

typedef struct SaveFriendGroup {
    FRIEND_GROUP groups[FGRP_MAX];
} SAV_FRIEND_GRP;

u32 Save_FriendGroup_sizeof(void);
void Save_FriendGroup_Init(SAV_FRIEND_GRP *savFriendGrp);
SAV_FRIEND_GRP *Save_FriendGroup_Get(SaveData *saveData);
u8 sub_0202C830(SAV_FRIEND_GRP *savFriendGrp, int grpno);
u8 sub_0202C83C(SAV_FRIEND_GRP *savFriendGrp, int grpno);
u16 *sub_0202C7E0(SAV_FRIEND_GRP *savFriendGrp, int grpno, int nameType);
u32 sub_0202C7DC(SAV_FRIEND_GRP *savFriendGrp);

#endif // POKEHEARTGOLD_FRIEND_GROUP_H
