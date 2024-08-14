#include "global.h"
#include "unk_0202CA24.h"

struct SaveUnk26 {
    u8 filler_000[5];
    u8 unk_005;
    u8 unk_006;
    u8 filler_007[0xFF1];
};  // size: 0xFF8

u32 sub_0202CA24(void) {
    return sizeof(SaveUnk26);
}

void sub_0202CA2C(SaveUnk26 *saveUnk26) {
    MI_CpuClear32(saveUnk26, sizeof(SaveUnk26));
    SaveSubstruct_UpdateCRC(SAVE_UNK_26);
}

SaveUnk26 *sub_0202CA44(SaveData *saveData) {
    SaveSubstruct_AssertCRC(SAVE_UNK_26);
    return (SaveUnk26 *)SaveArray_Get(saveData, SAVE_UNK_26);
}

void sub_0202CA58(SaveUnk26 *a0, int a1, int a2) {
    GF_ASSERT(a1 < 256);
    GF_ASSERT(a2 < 64);
    a0->unk_005 = a1;
    a0->unk_006 = a2;
    sub_0202CAE4(a0, a1, a2, 3);
    SaveSubstruct_UpdateCRC(SAVE_UNK_26);
}

u8 sub_0202CA8C(SaveUnk26 *saveUnk26) {
    return saveUnk26->unk_005;
}

u8 sub_0202CA90(SaveUnk26 *saveUnk26) {
    return saveUnk26->unk_006;
}

