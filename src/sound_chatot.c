#include "sound_chatot.h"
#include "sound.h"
#include "constants/species.h"
#include "constants/snd_system.h"
#include "math_util.h"
#include "sound_tool.h"
#include "unk_02005D10.h"

BOOL ChatotSoundMain(void) {
    u8 *r4 = GF_SdatGetAttrPtr(SOUND_WORK_WAVEOUT_CH_NORMAL_FLAG);
    u8 *r0 = GF_SdatGetAttrPtr(SOUND_WORK_CHATOT_PLAY_FLAG);


    if (*r0 == TRUE) {
        if (*r4 == TRUE) {
            if (WaveoutIsPlaying(SOUND_WORK_ME_WAIT) == 0) {
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
    u8 *r5 = GF_SdatGetAttrPtr(SOUND_WORK_CHATOT_DEFAULT_FLAG);
    u8 *r4 = GF_SdatGetAttrPtr(SOUND_WORK_BATTLE_REC_FLAG);

    if (!Chatot_exists(a0)) {
        return FALSE;
    }

    if (*r4 == TRUE) {
        return FALSE;
    }

    if (*r5 != TRUE) {
        return TRUE;
    }

    return FALSE;
}

BOOL sub_02006D04(SOUND_CHATOT *chatot, u32 unused, s32 vol, s32 pan) {
    s8 *sp0 = Snd_GetWaveBufferAdrs();
    s8 *playFlag = GF_SdatGetAttrPtr(SOUND_WORK_CHATOT_PLAY_FLAG);

    if (!Chatot_checkCry(chatot)) {
        return FALSE;
    }

    sub_02006300(0);
    sub_02006DB8();
    AllocWaveoutChannel(WAVEOUT_CHANNEL_NORMAL);
    u16 r4 = (LCRandom() % 8192);

    Chatot_Decode(sp0, Chatot_GetData(chatot));

    WAVEOUT_WORK work;

    work.handle = GetWaveoutHandle(WAVEOUT_CHANNEL_NORMAL);
    work.format = 0;
    work.dataaddr = Snd_GetWaveBufferAdrs();
    work.loopFlag = FALSE;
    work.loopStartSample = 0;
    work.samples = 2000;
    work.sampleRate = 2000;
    work.speed = (u32)(r4 + 0x8000);
    work.pan = pan / 2 + 64;
    work.volume = vol;

    BOOL ret = WaveoutStart(&work, WAVEOUT_CHANNEL_NORMAL);
    SetWaveoutVol(WAVEOUT_CHANNEL_NORMAL, vol);
    *playFlag = 1;
    sub_02006E3C(0);

    return ret;
}

void sub_02006DB8() {
    u8 *r5 = GF_SdatGetAttrPtr(SOUND_WORK_WAVEOUT_CH_NORMAL_FLAG);
    u8 *r4 = GF_SdatGetAttrPtr(SOUND_WORK_CHATOT_PLAY_FLAG);

    if (*r5 == 1) {
        WaveoutStopReverse(WAVEOUT_CHANNEL_NORMAL);
        FreeWaveoutChannel(WAVEOUT_CHANNEL_NORMAL);
    }

    *r4 = 0;
}

u32 Chatot_startRecording(void) {
    MICAutoParam st0;
    
    st0.type = MIC_SAMPLING_TYPE_SIGNED_8BIT;
    st0.buffer = Snd_GetWaveBufferAdrs();
    st0.size = 2000;
    if ((st0.size & 0x1f) != 0) {
        st0.size &= ~0x1f;
    }
    st0.rate = HW_CPU_CLOCK_ARM7 / 2000;
    st0.loop_enable = 0;
    st0.full_callback = 0;
    st0.full_arg = 0;

    return GF_MicStartAutoSampling(&st0);
}

void Chatot_stopRecording() {
    GF_MicStopAutoSampling();
}

void Chatot_saveRecording(SOUND_CHATOT *a0) {
    Chatot_Encode(a0, Snd_GetWaveBufferAdrs());
}

void sub_02006E3C(u8 a0) {
    u8 *r0 = GF_SdatGetAttrPtr(SOUND_WORK_CHATOT_DEFAULT_FLAG);
    *r0 = a0;
}

void sub_02006E4C(SOUND_CHATOT *a0, u32 a1, u32 a2, s32 a3) {
    SOUND_CHATOT **r0 = GF_SdatGetAttrPtr(SOUND_WORK_MY_CHATOT_PTR);
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
    SOUND_CHATOT **r0 = GF_SdatGetAttrPtr(SOUND_WORK_MY_CHATOT_PTR);
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
