#include "unk_020318C8.h"

#include <nitro/mi/memory.h>

#include "global.h"

#include "save.h"

u32 sub_020318C8(void) {
    return sizeof(UnkStruct_020318C8);
}

void sub_020318CC(UnkStruct_020318C8 *a0) {
    MIi_CpuClear32(0, (void *)a0, sub_020318C8());
    a0->unk_0 = -1;
}

UnkStruct_020318C8 *sub_020318E8(SaveData *saveData) {
    return SaveArray_Get(saveData, SAVE_UNK_32);
}

u32 sub_020318F4(UnkStruct_020318C8 *a0) {
    return a0->unk_0;
}

u32 sub_020318F8(UnkStruct_020318C8 *a0) {
    return a0->unk_4;
}

void sub_020318FC(UnkStruct_020318C8 *a0, u32 a1) {
    a0->unk_0 = a1;
}

void sub_02031900(UnkStruct_020318C8 *a0, u32 a1) {
    a0->unk_4 = a1;
}
