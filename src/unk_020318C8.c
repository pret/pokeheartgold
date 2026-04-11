#include "unk_020318C8.h"

#include <nitro/mi/memory.h>

#include "global.h"

#include "save.h"

u32 UnkStruct_020318C8_Sizeof(void) {
    return sizeof(UnkStruct_020318C8);
}

void UnkStruct_020318C8_Init(UnkStruct_020318C8 *a0) {
    MIi_CpuClear32(0, (void *)a0, UnkStruct_020318C8_Sizeof());
    a0->unk_0 = -1;
}

UnkStruct_020318C8 *UnkStruct_020318C8_Get(SaveData *saveData) {
    return SaveArray_Get(saveData, SAVE_UNK_32);
}

u32 UnkStruct_020318C8_GetUnk0(UnkStruct_020318C8 *a0) {
    return a0->unk_0;
}

u32 UnkStruct_020318C8_GetUnk4(UnkStruct_020318C8 *a0) {
    return a0->unk_4;
}

void UnkStruct_020318C8_SetUnk0(UnkStruct_020318C8 *a0, u32 a1) {
    a0->unk_0 = a1;
}

void UnkStruct_020318C8_SetUnk4(UnkStruct_020318C8 *a0, u32 a1) {
    a0->unk_4 = a1;
}
