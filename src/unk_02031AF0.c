#include "unk_02031AF0.h"

#include "global.h"

#include "save.h"

u32 sub_02031AF0(void) {
    return sizeof(PokeathlonSave_FriendshipRecords);
}

void sub_02031AF4(PokeathlonSave_FriendshipRecords *unk) {
    MI_CpuClear8(unk, sizeof(PokeathlonSave_FriendshipRecords));
}

PokeathlonSave_FriendshipRecords *sub_02031B00(SaveData *saveData) {
    return SaveArray_Get(saveData, SAVE_POKEATHLON_FRIENDSHIP_RECORDS);
}
