#include "unk_02091054.h"

#include "global.h"

#include "constants/seals.h"

#include "msgdata/msg/msg_0015.h" // seal names
#include "msgdata/msg/msg_0434.h" // seal descriptions; stripped

typedef struct {
    u8 memberIdx;
    u8 nameIdx;
    u8 particleIndex;
    u8 unused : 2;
    u8 nonAlphabetIndex : 6;
} SealTypeValues;

static const SealTypeValues sSealTypeValues[81] = {
    [SEAL_NONE] = { 0x27, msg_0015_00000, 0x35, 1, msg_0434_00000 },
    [SEAL_HEART_A] = { 0x28, msg_0015_00001, 0x35, 1, msg_0434_00000 },
    [SEAL_HEART_B] = { 0x29, msg_0015_00002, 0x36, 1, msg_0434_00001 },
    [SEAL_HEART_C] = { 0x2a, msg_0015_00003, 0x37, 1, msg_0434_00002 },
    [SEAL_HEART_D] = { 0x2b, msg_0015_00004, 0x38, 1, msg_0434_00003 },
    [SEAL_HEART_E] = { 0x2c, msg_0015_00005, 0x39, 2, msg_0434_00004 },
    [SEAL_HEART_F] = { 0x2d, msg_0015_00006, 0x3a, 2, msg_0434_00005 },
    [SEAL_STAR_A] = { 0x2f, msg_0015_00007, 0x3b, 1, msg_0434_00006 },
    [SEAL_STAR_B] = { 0x2e, msg_0015_00008, 0x3c, 1, msg_0434_00007 },
    [SEAL_STAR_C] = { 0x31, msg_0015_00009, 0x3d, 1, msg_0434_00008 },
    [SEAL_STAR_D] = { 0x30, msg_0015_00010, 0x3e, 1, msg_0434_00009 },
    [SEAL_STAR_E] = { 0x33, msg_0015_00011, 0x3f, 2, msg_0434_00010 },
    [SEAL_STAR_F] = { 0x32, msg_0015_00012, 0x40, 2, msg_0434_00011 },
    [SEAL_LINE_A] = { 0x34, msg_0015_00013, 0x41, 2, msg_0434_00012 },
    [SEAL_LINE_B] = { 0x35, msg_0015_00014, 0x42, 2, msg_0434_00013 },
    [SEAL_LINE_C] = { 0x36, msg_0015_00015, 0x43, 2, msg_0434_00014 },
    [SEAL_LINE_D] = { 0x37, msg_0015_00016, 0x44, 2, msg_0434_00015 },
    [SEAL_SMOKE_A] = { 0x38, msg_0015_00017, 0x49, 2, msg_0434_00016 },
    [SEAL_SMOKE_B] = { 0x39, msg_0015_00018, 0x4a, 2, msg_0434_00017 },
    [SEAL_SMOKE_C] = { 0x3a, msg_0015_00019, 0x4b, 2, msg_0434_00018 },
    [SEAL_SMOKE_D] = { 0x3b, msg_0015_00020, 0x4c, 2, msg_0434_00019 },
    [SEAL_ELE_A] = { 0x3c, msg_0015_00021, 0x45, 2, msg_0434_00020 },
    [SEAL_ELE_B] = { 0x3d, msg_0015_00022, 0x46, 2, msg_0434_00021 },
    [SEAL_ELE_C] = { 0x3e, msg_0015_00023, 0x47, 2, msg_0434_00022 },
    [SEAL_ELE_D] = { 0x3f, msg_0015_00024, 0x48, 2, msg_0434_00023 },
    [SEAL_FOAMY_A] = { 0x40, msg_0015_00025, 0x4d, 1, msg_0434_00024 },
    [SEAL_FOAMY_B] = { 0x41, msg_0015_00026, 0x4e, 1, msg_0434_00025 },
    [SEAL_FOAMY_C] = { 0x42, msg_0015_00027, 0x4f, 1, msg_0434_00026 },
    [SEAL_FOAMY_D] = { 0x43, msg_0015_00028, 0x50, 1, msg_0434_00027 },
    [SEAL_FIRE_A] = { 0x44, msg_0015_00029, 0x51, 1, msg_0434_00028 },
    [SEAL_FIRE_B] = { 0x45, msg_0015_00030, 0x52, 1, msg_0434_00029 },
    [SEAL_FIRE_C] = { 0x46, msg_0015_00031, 0x53, 1, msg_0434_00030 },
    [SEAL_FIRE_D] = { 0x47, msg_0015_00032, 0x54, 1, msg_0434_00031 },
    [SEAL_PARTY_A] = { 0x48, msg_0015_00033, 0x55, 1, msg_0434_00032 },
    [SEAL_PARTY_B] = { 0x49, msg_0015_00034, 0x56, 1, msg_0434_00033 },
    [SEAL_PARTY_C] = { 0x4a, msg_0015_00035, 0x57, 2, msg_0434_00034 },
    [SEAL_PARTY_D] = { 0x4b, msg_0015_00036, 0x58, 2, msg_0434_00035 },
    [SEAL_FLORA_A] = { 0x4c, msg_0015_00037, 0x59, 1, msg_0434_00036 },
    [SEAL_FLORA_B] = { 0x4d, msg_0015_00038, 0x5a, 1, msg_0434_00037 },
    [SEAL_FLORA_C] = { 0x4e, msg_0015_00039, 0x5b, 1, msg_0434_00038 },
    [SEAL_FLORA_D] = { 0x4f, msg_0015_00040, 0x5c, 1, msg_0434_00039 },
    [SEAL_FLORA_E] = { 0x50, msg_0015_00041, 0x5d, 1, msg_0434_00040 },
    [SEAL_FLORA_F] = { 0x51, msg_0015_00042, 0x5e, 1, msg_0434_00041 },
    [SEAL_SONG_A] = { 0x52, msg_0015_00043, 0x5f, 1, msg_0434_00042 },
    [SEAL_SONG_B] = { 0x53, msg_0015_00044, 0x60, 1, msg_0434_00043 },
    [SEAL_SONG_C] = { 0x54, msg_0015_00045, 0x61, 1, msg_0434_00044 },
    [SEAL_SONG_D] = { 0x55, msg_0015_00046, 0x62, 1, msg_0434_00045 },
    [SEAL_SONG_E] = { 0x56, msg_0015_00047, 0x63, 1, msg_0434_00046 },
    [SEAL_SONG_F] = { 0x57, msg_0015_00048, 0x64, 1, msg_0434_00047 },
    [SEAL_SONG_G] = { 0x58, msg_0015_00049, 0x65, 1, msg_0434_00048 },
    [SEAL_A] = { 0x59, msg_0015_00050, 0x66, 0, msg_0434_00000 },
    [SEAL_B] = { 0x5a, msg_0015_00051, 0x67, 0, msg_0434_00000 },
    [SEAL_C] = { 0x5b, msg_0015_00052, 0x68, 0, msg_0434_00000 },
    [SEAL_D] = { 0x5c, msg_0015_00053, 0x69, 0, msg_0434_00000 },
    [SEAL_E] = { 0x5d, msg_0015_00054, 0x6a, 0, msg_0434_00000 },
    [SEAL_F] = { 0x5e, msg_0015_00055, 0x6b, 0, msg_0434_00000 },
    [SEAL_G] = { 0x5f, msg_0015_00056, 0x6c, 0, msg_0434_00000 },
    [SEAL_H] = { 0x60, msg_0015_00057, 0x6d, 0, msg_0434_00000 },
    [SEAL_I] = { 0x61, msg_0015_00058, 0x6e, 0, msg_0434_00000 },
    [SEAL_J] = { 0x62, msg_0015_00059, 0x6f, 0, msg_0434_00000 },
    [SEAL_K] = { 0x63, msg_0015_00060, 0x70, 0, msg_0434_00000 },
    [SEAL_L] = { 0x64, msg_0015_00061, 0x71, 0, msg_0434_00000 },
    [SEAL_M] = { 0x65, msg_0015_00062, 0x72, 0, msg_0434_00000 },
    [SEAL_N] = { 0x66, msg_0015_00063, 0x73, 0, msg_0434_00000 },
    [SEAL_O] = { 0x67, msg_0015_00064, 0x74, 0, msg_0434_00000 },
    [SEAL_P] = { 0x68, msg_0015_00065, 0x75, 0, msg_0434_00000 },
    [SEAL_Q] = { 0x69, msg_0015_00066, 0x76, 0, msg_0434_00000 },
    [SEAL_R] = { 0x6a, msg_0015_00067, 0x77, 0, msg_0434_00000 },
    [SEAL_S] = { 0x6b, msg_0015_00068, 0x78, 0, msg_0434_00000 },
    [SEAL_T] = { 0x6c, msg_0015_00069, 0x79, 0, msg_0434_00000 },
    [SEAL_U] = { 0x6d, msg_0015_00070, 0x7a, 0, msg_0434_00000 },
    [SEAL_V] = { 0x6e, msg_0015_00071, 0x7b, 0, msg_0434_00000 },
    [SEAL_W] = { 0x6f, msg_0015_00072, 0x7c, 0, msg_0434_00000 },
    [SEAL_X] = { 0x70, msg_0015_00073, 0x7d, 0, msg_0434_00000 },
    [SEAL_Y] = { 0x71, msg_0015_00074, 0x7e, 0, msg_0434_00000 },
    [SEAL_Z] = { 0x72, msg_0015_00075, 0x7f, 0, msg_0434_00000 },
    [SEAL_SHOCK] = { 0x73, msg_0015_00076, 0x80, 0, msg_0434_00000 },
    [SEAL_MYSTERY] = { 0x74, msg_0015_00077, 0x81, 0, msg_0434_00000 },
    [SEAL_LIQUID] = { 0x75, msg_0015_00078, 0x82, 0, msg_0434_00049 },
    [SEAL_BURST] = { 0x76, msg_0015_00079, 0x83, 0, msg_0434_00050 },
    [SEAL_TWINKLE] = { 0x77, msg_0015_00080, 0x84, 0, msg_0434_00051 },
};

u8 CapsuleMenu_GetSealMemberIdx(u32 idx) {
    GF_ASSERT(idx < NELEMS(sSealTypeValues));
    return sSealTypeValues[idx].memberIdx;
}

u8 CapsuleMenu_GetSealNameIndex(u8 idx) {
    GF_ASSERT(idx < NELEMS(sSealTypeValues));
    return sSealTypeValues[idx].nameIdx;
}

u8 CapsuleMenu_GetSealParticleIndex(u32 idx) {
    GF_ASSERT(idx < NELEMS(sSealTypeValues));
    return sSealTypeValues[idx].particleIndex;
}

BOOL CapsuleMenu_IsAlphabetSeal(u32 idx) {
    GF_ASSERT(idx < NELEMS(sSealTypeValues));
    if (idx < SEAL_A || idx > SEAL_MYSTERY) {
        return FALSE;
    }

    return TRUE;
}

u32 CapsuleMenu_GetSealNonAlphabetIndex(u8 idx) {
    GF_ASSERT(idx < NELEMS(sSealTypeValues));
    return sSealTypeValues[idx].nonAlphabetIndex;
}
