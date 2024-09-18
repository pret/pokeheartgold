#ifndef POKEHEARTGOLD_UNK_0202C730_H
#define POKEHEARTGOLD_UNK_0202C730_H

#include "friend_group.h"

void sub_0202C7C0(SAV_FRIEND_GRP *saveGrp, u32 grpIdx, u32 a2);
void sub_0202C78C(SAV_FRIEND_GRP *saveGrp, int a1);
BOOL sub_0202C860(SAV_FRIEND_GRP *group, u16 a1);
BOOL sub_0202C878(SAV_FRIEND_GRP *group, u16 a1);
void sub_0202C738(SAV_FRIEND_GRP *group, u16 a1, int a2);

// return group->groups[a1].unk_24;
u8 Save_FriendGroup_GetGroupId(SAV_FRIEND_GRP *group, int a1);
void sub_0202C7F8(SAV_FRIEND_GRP *group, int a1, int a2, String *str);
void sub_0202C824(SAV_FRIEND_GRP *group, int a1, u32 gender);
void sub_0202C848(SAV_FRIEND_GRP *group, int a1, int a2);
BOOL sub_0202C88C(SAV_FRIEND_GRP *group, u16 *a1);

#endif // POKEHEARTGOLD_UNK_0202C730_H
