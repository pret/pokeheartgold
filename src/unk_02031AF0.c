#include "unk_02031AF0.h"

#include "global.h"

#include "save.h"

u32 sub_02031AF0(void) {
    return sizeof(PokeathlonSaveFriendshipRecords);
}

void sub_02031AF4(PokeathlonSaveFriendshipRecords *unk) {
    MI_CpuClear8(unk, sizeof(PokeathlonSaveFriendshipRecords));
}

PokeathlonSaveFriendshipRecords *sub_02031B00(SaveData *saveData) {
    return SaveArray_Get(saveData, SAVE_POKEATHLON_FRIENDSHIP_RECORDS);
}
