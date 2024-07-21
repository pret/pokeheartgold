#include "global.h"
#include "save.h"
#include "string_util.h"
#include "unk_0202E4B0.h"

struct UnkStruct_0202E4B0_sub {
    int unk_00;
    int unk_04;
    u16 unk_08[8];
};

struct UnkStruct_0202E4B0 {
    UnkStruct_0202E4B0_sub unk_000[26][6];
};

void sub_0202E4C8(UnkStruct_0202E4B0_sub *a0);
BOOL sub_0202E4E0(UnkStruct_0202E4B0_sub *a0);

static const u8 _020F684C[][2] = {
    {  6,  0 },
    {  4,  6 },
    {  3, 10 },
};

u8 sub_0202E4B0(int a0) {
    return _020F684C[a0][0];
}

u8 sub_0202E4BC(int a0) {
    return _020F684C[a0][1];
}

void sub_0202E4C8(UnkStruct_0202E4B0_sub *a0) {
    a0->unk_00 = 0;
    a0->unk_04 = 0;
    StringFillEOS(a0->unk_08, 8);
    SaveSubstruct_UpdateCRC(SAVE_UNK_24);
}

BOOL sub_0202E4E0(UnkStruct_0202E4B0_sub *a0) {
    return StringLength(a0->unk_08) != 0;
}

u32 sub_0202E4F4(void) {
    return sizeof(UnkStruct_0202E4B0);
}

void sub_0202E4FC(UnkStruct_0202E4B0 *a0) {
    MI_CpuClear8(a0, sizeof(UnkStruct_0202E4B0));
    for (int i = 0; i < 26; ++i) {
        for (int j = 0; j < 6; ++j) {
            sub_0202E4C8(&a0->unk_000[i][j]);
        }
    }
    SaveSubstruct_UpdateCRC(SAVE_UNK_24);
}

UnkStruct_0202E4B0 *sub_0202E530(SaveData *saveData) {
    SaveSubstruct_AssertCRC(SAVE_UNK_24);
    return SaveArray_Get(saveData, SAVE_UNK_24);
}

void sub_0202E544(UnkStruct_0202E4B0 *a0, int a1, u32 a2) {
    if (a2 >= 6) {
        GF_ASSERT(a2 < 6);
        return;
    }
    UnkStruct_0202E4B0_sub *r6 = a0->unk_000[a1];
    for (int i = a2; i < 5; ++i) {
        r6[i] = r6[i + 1];
    }
    sub_0202E4C8(&r6[5]);
    SaveSubstruct_UpdateCRC(SAVE_UNK_24);
}

u32 sub_0202E58C(void) {
    return 0x138;  // TODO: what is this?
}
