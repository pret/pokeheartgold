#ifndef POKEHEARTGOLD_UNK_02031AF0_H
#define POKEHEARTGOLD_UNK_02031AF0_H

#include "save.h"

typedef struct PokeathlonFriendshipRoomStatueData {
    u16 species;
    u8 gender;
    u8 form;
} PokeathlonFriendshipRoomStatueData;

typedef struct PokeathlonSave_FriendshipRecords {
    PokeathlonFriendshipRoomStatueData friendshipRoomStatues[3];
    u8 unk[0x1C];
} PokeathlonSave_FriendshipRecords;

u32 sub_02031AF0(void);
void sub_02031AF4(PokeathlonSave_FriendshipRecords *unk);
PokeathlonSave_FriendshipRecords *sub_02031B00(SaveData *saveData);

#endif // POKEHEARTGOLD_UNK_02031AF0_H
