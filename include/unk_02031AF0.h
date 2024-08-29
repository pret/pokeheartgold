#ifndef POKEHEARTGOLD_UNK_02031AF0_H
#define POKEHEARTGOLD_UNK_02031AF0_H

#include "save.h"

typedef struct {
    u16 species;
    u8 gender;
    u8 form;
} PokeathlonFriendshipRoomStatueData;

typedef struct {
    PokeathlonFriendshipRoomStatueData friendshipRoomStatues[3];
    u8 unk[0x1C];
} SavePokeathlonFriendshipRecords;

u32 sub_02031AF0(void);
void sub_02031AF4(SavePokeathlonFriendshipRecords *unk);
SavePokeathlonFriendshipRecords *sub_02031B00(SaveData *saveData);

#endif // POKEHEARTGOLD_UNK_02031AF0_H
