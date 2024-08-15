#include "global.h"
#include "unk_0202CA24.h"

struct SaveUnk26 {
    int unk_000;  // unused but type needed for alignment
    u8 unk_004;
    u8 unk_005;
    u8 unk_006;
    u8 unk_007[255 * 16];  // does not match as a 2d array
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

void sub_0202CA58(SaveUnk26 *saveUnk26, int a1, int a2) {
    GF_ASSERT(a1 < 256);
    GF_ASSERT(a2 < 64);
    saveUnk26->unk_005 = a1;
    saveUnk26->unk_006 = a2;
    sub_0202CAE4(saveUnk26, a1, a2, 3);
    SaveSubstruct_UpdateCRC(SAVE_UNK_26);
}

u8 sub_0202CA8C(SaveUnk26 *saveUnk26) {
    return saveUnk26->unk_005;
}

u8 sub_0202CA90(SaveUnk26 *saveUnk26) {
    return saveUnk26->unk_006;
}

int sub_0202CA94(SaveUnk26 *saveUnk26, int a1, int a2) {
    GF_ASSERT(a1 < 256);
    GF_ASSERT(a2 < 64);
    if (a1 == 0) {
        return 0;
    }

    return (saveUnk26->unk_007[(a1 - 1) * 16 + a2 / 4] >> ((a2 % 4) * 2)) & 3;
}

void sub_0202CAE4(SaveUnk26 *saveUnk26, int a1, int a2, int a3) {
    GF_ASSERT(a3 < 4);
    GF_ASSERT(a1 < 256);
    GF_ASSERT(a2 < 64);
    if (a1 != 0) {
        u8 *pVal = &saveUnk26->unk_007[(a1 - 1) * 16 + a2 / 4];
        *pVal &= (3 << ((a2 % 4) * 2)) ^ 0xFF;
        *pVal |= a3 << ((a2 % 4) * 2);
        if (a1 != 103) {
            sub_0202CB60(saveUnk26, 1);
        }
        SaveSubstruct_UpdateCRC(SAVE_UNK_26);
    }
}

u8 sub_0202CB5C(SaveUnk26 *saveUnk26) {
    return saveUnk26->unk_004;
}

void sub_0202CB60(SaveUnk26 *saveUnk26, int a1) {
    saveUnk26->unk_004 = a1;
    SaveSubstruct_UpdateCRC(SAVE_UNK_26);
}

void sub_0202CB6C(SaveUnk26 *saveUnk26) {
    int i;
    int j;
    u8 r2;
    for (i = 0; i < 255 * 16; ++i) {
        r2 = saveUnk26->unk_007[i];
        for (j = 0; j < 8; j += 2) {
            if (((r2 >> j) & 3) == 1) {
                r2 &= (3 << j) ^ 0xFF;
                r2 |= (2 << j);
            }
        }
        saveUnk26->unk_007[i] = r2;
    }
    SaveSubstruct_UpdateCRC(SAVE_UNK_26);
}
