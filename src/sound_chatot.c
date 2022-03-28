#include "sound_chatot.h"
#include "sound.h"
#include "constants/species.h"
#include "math_util.h"
#include "sound_02004A44.h"
#include "unk_02005D10.h"

BOOL ChatotSoundMain(void) {
    u8 *r4 = GF_SdatGetAttrPtr(16);
    u8 *r0 = GF_SdatGetAttrPtr(30);

    if (*r0 == 1) {
        if (*r4 == 1) {
            if (sub_02005738(14) == 0) {
                sub_02006DB8();
                return TRUE;
            }
        }
        else {
            sub_02006DB8();
            return TRUE;
        }
    }

    return FALSE;
}

BOOL Chatot_checkCry(SOUND_CHATOT *a0) {
    u8 *r5 = GF_SdatGetAttrPtr(31);
    u8 *r4 = GF_SdatGetAttrPtr(54);

    if (!Chatot_exists(a0)) {
        return FALSE;
    }

    if (*r4 == 1) {
        return FALSE;
    }

    if (*r5 != 1) {
        return TRUE;
    }

    return FALSE;
}

BOOL sub_02006D04(SOUND_CHATOT *a0, u32 a1, s32 a2, s32 a3) {
    s8 *sp0 = sub_020059D8();
    s8 *sp4 = GF_SdatGetAttrPtr(30);

    if (!Chatot_checkCry(a0)) {
        return FALSE;
    }

    sub_02006300(0);
    sub_02006DB8();
    sub_02005600(14);
    u16 r4 = (LCRandom() % 8192);

    Chatot_Decode(sp0, Chatot_GetData(a0));

    UnkStruct_02004A44_0 sp8;

    sp8.unk00 = sub_020055AC(14);
    sp8.unk04 = NNS_SND_WAVE_FORMAT_PCM8;
    sp8.unk08 = sub_020059D8();
    sp8.unk0c = 0;
    sp8.unk10 = 0;
    sp8.unk14 = 2000;
    sp8.unk18 = 2000;
    sp8.unk20 = (u32)(r4 + 0x8000);
    sp8.unk24 = a3 / 2 + 64;
    sp8.unk1c = a2;

    BOOL ret = sub_020056E8(&sp8, 14);
    sub_02005774(14, a2);
    *sp4 = 1;
    sub_02006E3C(0);

    return ret;
}

void sub_02006DB8() {
    u8 *r5 = GF_SdatGetAttrPtr(16);
    u8 *r4 = GF_SdatGetAttrPtr(30);

    if (*r5 == 1) {
        sub_020058B8(14);
        sub_02005680(14);
    }

    *r4 = 0;
}

u32 Chatot_startRecording(void) {
    MICAutoParam st0;
    
    st0.type = MIC_SAMPLING_TYPE_SIGNED_8BIT;
    st0.buffer = sub_020059D8();
    st0.size = 2000;
    if ((st0.size & 0x1f) != 0) {
        st0.size &= ~0x1f;
    }
    st0.rate = HW_CPU_CLOCK_ARM7 / 2000;
    st0.loop_enable = 0;
    st0.full_callback = 0;
    st0.full_arg = 0;

    return GF_MIC_StartAutoSampling(&st0);
}

void Chatot_stopRecording() {
    GF_MIC_StopAutoSampling();
}

void Chatot_saveRecording(SOUND_CHATOT *a0) {
    Chatot_Encode(a0, sub_020059D8());
}

void sub_02006E3C(u8 a0) {
    u8 *r0 = GF_SdatGetAttrPtr(31);
    *r0 = a0;
}

void sub_02006E4C(SOUND_CHATOT *a0, u32 a1, u32 a2, s32 a3) {
    SOUND_CHATOT **r0 = GF_SdatGetAttrPtr(36);
    BOOL ret;
    if (a0 == 0) {
        ret = sub_02006D04(*r0, a1, a2, a3);
    }
    else {
        ret = sub_02006D04(a0, a1, a2, a3);
    }

    if (ret == 0) {
        sub_02006E3C(1);
        PlayCryEx(0, SPECIES_CHATOT, a3, a2, 11, 0);
    }
}

BOOL sub_02006EA0(SOUND_CHATOT *a0, u32 a1, u32 a2, s32 a3, u8 a4) {
    SOUND_CHATOT **r0 = GF_SdatGetAttrPtr(36);
    BOOL ret;
    if (a0 == 0) {
        ret = sub_02006D04(*r0, a1, a2, a3);
    }
    else {
        ret = sub_02006D04(a0, a1, a2, a3);
    }

    if (ret == 0) {
        sub_02006E3C(1);
        sub_02006920(0, SPECIES_CHATOT, a3, a2, 11, a4, 0);
        ret = 1;
    }

    return ret;
}

u32 sub_02006EFC(SOUND_CHATOT *chatot) {
    if (!Chatot_exists(chatot)) {
        return 0;
    }

    s8 r0 = Chatot_GetData(chatot)[15];
    if (r0 < -30) {
        return 1;
    }
    else if (r0 >= 30 && r0 < 128) {
        return 2;
    }

    return 0;
}

BOOL sub_02006F30(int a0) {
    switch (a0) {
    case 0:
    case 1:
    case 5:
    case 11:
    case 12:
        return TRUE;
    default:
        return FALSE;
    }
}
