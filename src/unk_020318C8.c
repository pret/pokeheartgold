#include "unk_020318C8.h"

#include "global.h"

#include "constants/save_arrays.h"

#include "save.h"

u32 sub_020318C8(void) {
    return sizeof(struct UnkStruct_020318C8);
}

void sub_020318CC(struct UnkStruct_020318C8 *a0) {
    MI_CpuClear32(a0, sub_020318C8());
    a0->unk_0 = -1;
}

struct UnkStruct_020318C8 *sub_020318E8(SaveData *save) {
    return SaveArray_Get(save, SAVE_UNK_32);
}

u32 sub_020318F4(struct UnkStruct_020318C8 *a0) {
    return a0->unk_0;
}

u32 sub_020318F8(struct UnkStruct_020318C8 *a0) {
    return a0->unk_4;
}

void sub_020318FC(struct UnkStruct_020318C8 *a0, u32 a1) {
    a0->unk_0 = a1;
}

void sub_02031900(struct UnkStruct_020318C8 *a0, u32 a1) {
    a0->unk_4 = a1;
}
