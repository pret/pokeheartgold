#include "global.h"

#include "constants/seals.h"

#include "application/capsule_menu/capsule_menu.h"
#include "application/custom_ball/data/cb_data.naix"
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
    [SEAL_NONE] = { NARC_cb_data_00039_NCGR, msg_0015_00000, 0x35, 1, msg_0434_00000 },
    [SEAL_HEART_A] = { NARC_cb_data_00040_NCGR, msg_0015_00001, 0x35, 1, msg_0434_00000 },
    [SEAL_HEART_B] = { NARC_cb_data_00041_NCGR, msg_0015_00002, 0x36, 1, msg_0434_00001 },
    [SEAL_HEART_C] = { NARC_cb_data_00042_NCGR, msg_0015_00003, 0x37, 1, msg_0434_00002 },
    [SEAL_HEART_D] = { NARC_cb_data_00043_NCGR, msg_0015_00004, 0x38, 1, msg_0434_00003 },
    [SEAL_HEART_E] = { NARC_cb_data_00044_NCGR, msg_0015_00005, 0x39, 2, msg_0434_00004 },
    [SEAL_HEART_F] = { NARC_cb_data_00045_NCGR, msg_0015_00006, 0x3a, 2, msg_0434_00005 },
    [SEAL_STAR_A] = { NARC_cb_data_00047_NCGR, msg_0015_00007, 0x3b, 1, msg_0434_00006 },
    [SEAL_STAR_B] = { NARC_cb_data_00046_NCGR, msg_0015_00008, 0x3c, 1, msg_0434_00007 },
    [SEAL_STAR_C] = { NARC_cb_data_00049_NCGR, msg_0015_00009, 0x3d, 1, msg_0434_00008 },
    [SEAL_STAR_D] = { NARC_cb_data_00048_NCGR, msg_0015_00010, 0x3e, 1, msg_0434_00009 },
    [SEAL_STAR_E] = { NARC_cb_data_00051_NCGR, msg_0015_00011, 0x3f, 2, msg_0434_00010 },
    [SEAL_STAR_F] = { NARC_cb_data_00050_NCGR, msg_0015_00012, 0x40, 2, msg_0434_00011 },
    [SEAL_LINE_A] = { NARC_cb_data_00052_NCGR, msg_0015_00013, 0x41, 2, msg_0434_00012 },
    [SEAL_LINE_B] = { NARC_cb_data_00053_NCGR, msg_0015_00014, 0x42, 2, msg_0434_00013 },
    [SEAL_LINE_C] = { NARC_cb_data_00054_NCGR, msg_0015_00015, 0x43, 2, msg_0434_00014 },
    [SEAL_LINE_D] = { NARC_cb_data_00055_NCGR, msg_0015_00016, 0x44, 2, msg_0434_00015 },
    [SEAL_SMOKE_A] = { NARC_cb_data_00056_NCGR, msg_0015_00017, 0x49, 2, msg_0434_00016 },
    [SEAL_SMOKE_B] = { NARC_cb_data_00057_NCGR, msg_0015_00018, 0x4a, 2, msg_0434_00017 },
    [SEAL_SMOKE_C] = { NARC_cb_data_00058_NCGR, msg_0015_00019, 0x4b, 2, msg_0434_00018 },
    [SEAL_SMOKE_D] = { NARC_cb_data_00059_NCGR, msg_0015_00020, 0x4c, 2, msg_0434_00019 },
    [SEAL_ELE_A] = { NARC_cb_data_00060_NCGR, msg_0015_00021, 0x45, 2, msg_0434_00020 },
    [SEAL_ELE_B] = { NARC_cb_data_00061_NCGR, msg_0015_00022, 0x46, 2, msg_0434_00021 },
    [SEAL_ELE_C] = { NARC_cb_data_00062_NCGR, msg_0015_00023, 0x47, 2, msg_0434_00022 },
    [SEAL_ELE_D] = { NARC_cb_data_00063_NCGR, msg_0015_00024, 0x48, 2, msg_0434_00023 },
    [SEAL_FOAMY_A] = { NARC_cb_data_00064_NCGR, msg_0015_00025, 0x4d, 1, msg_0434_00024 },
    [SEAL_FOAMY_B] = { NARC_cb_data_00065_NCGR, msg_0015_00026, 0x4e, 1, msg_0434_00025 },
    [SEAL_FOAMY_C] = { NARC_cb_data_00066_NCGR, msg_0015_00027, 0x4f, 1, msg_0434_00026 },
    [SEAL_FOAMY_D] = { NARC_cb_data_00067_NCGR, msg_0015_00028, 0x50, 1, msg_0434_00027 },
    [SEAL_FIRE_A] = { NARC_cb_data_00068_NCGR, msg_0015_00029, 0x51, 1, msg_0434_00028 },
    [SEAL_FIRE_B] = { NARC_cb_data_00069_NCGR, msg_0015_00030, 0x52, 1, msg_0434_00029 },
    [SEAL_FIRE_C] = { NARC_cb_data_00070_NCGR, msg_0015_00031, 0x53, 1, msg_0434_00030 },
    [SEAL_FIRE_D] = { NARC_cb_data_00071_NCGR, msg_0015_00032, 0x54, 1, msg_0434_00031 },
    [SEAL_PARTY_A] = { NARC_cb_data_00072_NCGR, msg_0015_00033, 0x55, 1, msg_0434_00032 },
    [SEAL_PARTY_B] = { NARC_cb_data_00073_NCGR, msg_0015_00034, 0x56, 1, msg_0434_00033 },
    [SEAL_PARTY_C] = { NARC_cb_data_00074_NCGR, msg_0015_00035, 0x57, 2, msg_0434_00034 },
    [SEAL_PARTY_D] = { NARC_cb_data_00075_NCGR, msg_0015_00036, 0x58, 2, msg_0434_00035 },
    [SEAL_FLORA_A] = { NARC_cb_data_00076_NCGR, msg_0015_00037, 0x59, 1, msg_0434_00036 },
    [SEAL_FLORA_B] = { NARC_cb_data_00077_NCGR, msg_0015_00038, 0x5a, 1, msg_0434_00037 },
    [SEAL_FLORA_C] = { NARC_cb_data_00078_NCGR, msg_0015_00039, 0x5b, 1, msg_0434_00038 },
    [SEAL_FLORA_D] = { NARC_cb_data_00079_NCGR, msg_0015_00040, 0x5c, 1, msg_0434_00039 },
    [SEAL_FLORA_E] = { NARC_cb_data_00080_NCGR, msg_0015_00041, 0x5d, 1, msg_0434_00040 },
    [SEAL_FLORA_F] = { NARC_cb_data_00081_NCGR, msg_0015_00042, 0x5e, 1, msg_0434_00041 },
    [SEAL_SONG_A] = { NARC_cb_data_00082_NCGR, msg_0015_00043, 0x5f, 1, msg_0434_00042 },
    [SEAL_SONG_B] = { NARC_cb_data_00083_NCGR, msg_0015_00044, 0x60, 1, msg_0434_00043 },
    [SEAL_SONG_C] = { NARC_cb_data_00084_NCGR, msg_0015_00045, 0x61, 1, msg_0434_00044 },
    [SEAL_SONG_D] = { NARC_cb_data_00085_NCGR, msg_0015_00046, 0x62, 1, msg_0434_00045 },
    [SEAL_SONG_E] = { NARC_cb_data_00086_NCGR, msg_0015_00047, 0x63, 1, msg_0434_00046 },
    [SEAL_SONG_F] = { NARC_cb_data_00087_NCGR, msg_0015_00048, 0x64, 1, msg_0434_00047 },
    [SEAL_SONG_G] = { NARC_cb_data_00088_NCGR, msg_0015_00049, 0x65, 1, msg_0434_00048 },
    [SEAL_A] = { NARC_cb_data_00089_NCGR, msg_0015_00050, 0x66, 0, msg_0434_00000 },
    [SEAL_B] = { NARC_cb_data_00090_NCGR, msg_0015_00051, 0x67, 0, msg_0434_00000 },
    [SEAL_C] = { NARC_cb_data_00091_NCGR, msg_0015_00052, 0x68, 0, msg_0434_00000 },
    [SEAL_D] = { NARC_cb_data_00092_NCGR, msg_0015_00053, 0x69, 0, msg_0434_00000 },
    [SEAL_E] = { NARC_cb_data_00093_NCGR, msg_0015_00054, 0x6a, 0, msg_0434_00000 },
    [SEAL_F] = { NARC_cb_data_00094_NCGR, msg_0015_00055, 0x6b, 0, msg_0434_00000 },
    [SEAL_G] = { NARC_cb_data_00095_NCGR, msg_0015_00056, 0x6c, 0, msg_0434_00000 },
    [SEAL_H] = { NARC_cb_data_00096_NCGR, msg_0015_00057, 0x6d, 0, msg_0434_00000 },
    [SEAL_I] = { NARC_cb_data_00097_NCGR, msg_0015_00058, 0x6e, 0, msg_0434_00000 },
    [SEAL_J] = { NARC_cb_data_00098_NCGR, msg_0015_00059, 0x6f, 0, msg_0434_00000 },
    [SEAL_K] = { NARC_cb_data_00099_NCGR, msg_0015_00060, 0x70, 0, msg_0434_00000 },
    [SEAL_L] = { NARC_cb_data_00100_NCGR, msg_0015_00061, 0x71, 0, msg_0434_00000 },
    [SEAL_M] = { NARC_cb_data_00101_NCGR, msg_0015_00062, 0x72, 0, msg_0434_00000 },
    [SEAL_N] = { NARC_cb_data_00102_NCGR, msg_0015_00063, 0x73, 0, msg_0434_00000 },
    [SEAL_O] = { NARC_cb_data_00103_NCGR, msg_0015_00064, 0x74, 0, msg_0434_00000 },
    [SEAL_P] = { NARC_cb_data_00104_NCGR, msg_0015_00065, 0x75, 0, msg_0434_00000 },
    [SEAL_Q] = { NARC_cb_data_00105_NCGR, msg_0015_00066, 0x76, 0, msg_0434_00000 },
    [SEAL_R] = { NARC_cb_data_00106_NCGR, msg_0015_00067, 0x77, 0, msg_0434_00000 },
    [SEAL_S] = { NARC_cb_data_00107_NCGR, msg_0015_00068, 0x78, 0, msg_0434_00000 },
    [SEAL_T] = { NARC_cb_data_00108_NCGR, msg_0015_00069, 0x79, 0, msg_0434_00000 },
    [SEAL_U] = { NARC_cb_data_00109_NCGR, msg_0015_00070, 0x7a, 0, msg_0434_00000 },
    [SEAL_V] = { NARC_cb_data_00110_NCGR, msg_0015_00071, 0x7b, 0, msg_0434_00000 },
    [SEAL_W] = { NARC_cb_data_00111_NCGR, msg_0015_00072, 0x7c, 0, msg_0434_00000 },
    [SEAL_X] = { NARC_cb_data_00112_NCGR, msg_0015_00073, 0x7d, 0, msg_0434_00000 },
    [SEAL_Y] = { NARC_cb_data_00113_NCGR, msg_0015_00074, 0x7e, 0, msg_0434_00000 },
    [SEAL_Z] = { NARC_cb_data_00114_NCGR, msg_0015_00075, 0x7f, 0, msg_0434_00000 },
    [SEAL_SHOCK] = { NARC_cb_data_00115_NCGR, msg_0015_00076, 0x80, 0, msg_0434_00000 },
    [SEAL_MYSTERY] = { NARC_cb_data_00116_NCGR, msg_0015_00077, 0x81, 0, msg_0434_00000 },
    [SEAL_LIQUID] = { NARC_cb_data_00117_NCGR, msg_0015_00078, 0x82, 0, msg_0434_00049 },
    [SEAL_BURST] = { NARC_cb_data_00118_NCGR, msg_0015_00079, 0x83, 0, msg_0434_00050 },
    [SEAL_TWINKLE] = { NARC_cb_data_00119_NCGR, msg_0015_00080, 0x84, 0, msg_0434_00051 },
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
