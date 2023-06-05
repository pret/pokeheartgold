#include "unk_02031AF0.h"
#include "save.h"

u32 sub_02031AF0(void) {
    return sizeof(SavePokeathlonFriendshipRecords);
}

void sub_02031AF4(SavePokeathlonFriendshipRecords* unk) {
    MI_CpuClear8(unk, sizeof(SavePokeathlonFriendshipRecords));
}

SavePokeathlonFriendshipRecords* sub_02031B00(SAVEDATA* savedata) {
    return SaveArray_get(savedata, SAVE_POKEATHLON_FRIENDSHIP_RECORDS);
}
