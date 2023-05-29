#include "sound.h"
#include "sound_chatot.h"
#include "sound_02004A44.h"
#include "options.h"
#include "system.h"
#include "constants/sndseq.h"

#define ASM_EXTERN extern

struct SND_WORK {
    /* 0x00000 */ NNSSndArc arc;
    /* 0x00094 */ NNSSndHeapHandle heap;
    /* 0x00098 */ u8 heap_buf[SND_HEAP_SIZE];
    /* 0xBEB78 */ NNSSndHandle unk_BEB78[SND_HANDLE_MAX];
    /* 0xBEB9C */ u32 unk_BEB9C;
    /* 0xBEBA0 */ u32 unk_BEBA0;
    /* 0xBEBA4 */ u32 unk_BEBA4;
    /* 0xBEBA8 */ u8 unk_BEBA8[0x18];
    /* 0xBEBC0 */ u8 unk_BEBC0[16];
    /* 0xBEBD0 */ u8 unk_BEBD0[28];
    /* 0xBEBEC */ u16 unk_BEBEC;
    /* 0xBEBEE */ u8 unk_BEBEE;
    /* 0xBEBEF */ u8 unk_BEBEF;
    /* 0xBEBF0 */ int fadeTimer;
    /* 0xBEBF4 */ int unk_BEBF4;
    /* 0xBEBF8 */ int queuedSeqFadeInDuration;
    /* 0xBEBFC */ u16 currentSeqNo;
    /* 0xBEBFE */ u16 queuedSeqNo;
    /* 0xBEC00 */ u8 unk_BEC00;
    /* 0xBEBC1 */ u8 unk_BEC01;
    /* 0xBEC02 */ u16 afterFanfareWaitTimer;
    /* 0xBEC04 */ u8 unk_BEC04;
    /* 0xBEC05 */ u8 unk_BEC05;
    /* 0xBEC06 */ u8 unk_BEC06;
    /* 0xBEC07 */ u8 unk_BEC07;
    /* 0xBEC08 */ u8 unk_BEC08;
    /* 0xBEC09 */ u8 unk_BEC09;
    /* 0xBEC0A */ u8 unk_BEC0A;
    /* 0xBEC0B */ u8 unk_BEC0B;
    /* 0xBEC0C */ int stateSaveDepth[7];
    /* 0xBEC28 */ u8 unk_BEC28;
    /* 0xBEC29 */ u8 unk_BEC29;
    /* 0xBEC2A */ u16 unk_BEC2A;
    /* 0xBEC2C */ u32 unk_BEC2C;
    /* 0xBEC30 */ u8 unk_BEC30[8];
    /* 0xBEC38 */ u32 unk_BEC38;
    /* 0xBEC3C */ SOUND_CHATOT *myChatot;
    /* 0xBEC40 */ SOUND_CHATOT *otherChatots[4];
    /* 0xBEC50 */ u32 cryPattern[2];
    /* 0xBEC58 */ u32 cryPan[2];
    /* 0xBEC60 */ u32 cryVolume[2];
    /* 0xBEC68 */ u32 cryHeapId[2];
    /* 0xBEC70 */ u16 cryNo[2];
    /* 0xBEC74 */ u8 cryDelayTimer[2];
    /* 0xBEC76 */ u8 unk_BEC76;
    /* 0xBEC77 */ u8 unk_BEC77;
    /* 0xBEC78 */ u8 unk_BEC78;
    /* 0xBEC79 */ u8 unk_BEC79;
    /* 0xBEC7A */ u16 unk_BEC7A;
    /* 0xBEC7C */ u32 unk_BEC7C;
    /* 0xBEC80 */ u32 micInitDone:1;
    /* 0xBEC80 */ u32 micCounter:31;
    /* 0xBEC84 */ u32 gbSoundsVolume;
}; // size: 0xBEC88

SND_WORK sSoundWork;
u32 _0211194C;
u32 _02111950;
u32 sSndHeapFreeSize;

void GF_SoundDataInit(SND_WORK *work);
void GF_InitMic(SND_WORK *work);
void SndRadio_Init(NNSSndHeapHandle *heap_p);
void GF_SndHandleInitAll(SND_WORK *work);
void sub_02004898(struct SND_WORK *work);
void GF_SndCallback(void);
BOOL GF_SndIsFanfarePlaying(void);
BOOL GF_SndWorkMicCounterFull(void);

void InitSoundData(SOUND_CHATOT *chatot, OPTIONS *options) {
    SND_WORK *work = GetSoundDataPointer();
    NNS_SndInit();
    GF_SoundDataInit(work);
    GF_InitMic(work);
    work->heap = NNS_SndHeapCreate(work->heap_buf, sizeof(work->heap_buf));
    NNS_SndArcInit(&work->arc, "data/sound/gs_sound_data.sdat", work->heap, FALSE);
    NNS_SndArcPlayerSetup(work->heap);
    SndRadio_Init(&work->heap);
    GF_SndHandleInitAll(work);
    sSndHeapFreeSize = NNS_SndHeapGetSize(work->heap);
    GF_SndHeapGetFreeSize();
    sub_02004898(work);
    _02111950 = 0;
    work->myChatot = chatot;
    GF_SndSetMonoFlag(options->soundMethod);
}

void DoSoundUpdateFrame(void) {
    int i;

    SND_WORK *work = GetSoundDataPointer();

    // debug stuff left in
    void *stripped_0 = GF_SdatGetAttrPtr(18);
    void *stripped_1 = GF_SdatGetAttrPtr(32);

    // Only handle fade transitions if fanfare not playing
    if (!GF_SndIsFanfarePlaying()) {
        if (work->fadeTimer > 0) {
            work->fadeTimer--;
        }
        GF_SndCallback();
    }

    // debug stuff left in
    NNS_SndUpdateDriverInfo();
    if (gSystem.newKeys & PAD_BUTTON_DEBUG) {
        SNDChannelInfo sp24;
        SNDTrackInfo sp8;
        for (i = 0; i < 16; i++) {
            NNS_SndPlayerReadDriverTrackInfo(&work->unk_BEB78[SND_HANDLE_BGM], i, &sp8);
            NNS_SndReadDriverChannelInfo(i, &sp24);
        }
    }

    ChatotSoundMain();

    // Up to two Pokemon cries can be queued.
    for (i = 0; i < 2; i++) {
        if (work->cryDelayTimer[i] != 0) {
            work->cryDelayTimer[i]--;
            if (work->cryDelayTimer[i] == 0) {
                PlayCryEx(work->cryPattern[i], work->cryNo[i], work->cryPan[i], work->cryVolume[i], work->cryHeapId[i], 0);
            }
        }
    }

    // New to HG/SS
    if (work->micInitDone && !GF_SndWorkMicCounterFull()) {
        work->micCounter++;
    }
    NNS_SndMain();
}

void GF_SndCallback(void) {
    SND_WORK *work;

    work = GetSoundDataPointer();
    switch (_0211194C) {
    case 1:
        GF_SndSetState(2);
        break;
    case 3:
        if (!GF_SndGetFadeTimer()) {
            GF_SndSetState(2);
        }
        break;
    case 4:
        if (!GF_SndGetFadeTimer()) {
            GF_SndSetState(2);
        }
        break;
    case 5:
        if (!GF_SndGetFadeTimer() && !GF_SndGetAfterFadeDelayTimer()) {
            GF_SndStopPlayerBgm();
            if (work->queuedSeqNo != 0) {
                PlayBGM(work->queuedSeqNo);
            }
        }
        break;
    case 6:
        if (!GF_SndGetFadeTimer() && !GF_SndGetAfterFadeDelayTimer()) {
            GF_SndStopPlayerBgm();
            if (work->queuedSeqNo != 0) {
                PlayBGM(work->queuedSeqNo);
            }
            GF_SndStartFadeInBGM(0x7F, work->queuedSeqFadeInDuration, 0);
        }
        break;
    }
}

void GF_SndSetState(u32 state) {
    SND_WORK *work;

    work = GetSoundDataPointer();
    work->unk_BEBEC = 0;
    _0211194C = state;
}

BOOL GF_SndIsFanfarePlaying(void) {
    SND_WORK *work;

    work = GetSoundDataPointer();
    if (GF_SndPlayerCountPlayingSeqByPlayerNo(PLAYER_ME) != 0) {
        return TRUE;
    }
    if (work->afterFanfareWaitTimer != 0) {
        return TRUE;
    }
    return FALSE;
}

SND_WORK *GetSoundDataPointer(void) {
    return &sSoundWork;
}

void *GF_SdatGetAttrPtr(u32 attr) {
    SND_WORK *work;

    work = GetSoundDataPointer();
    switch (attr) {
    case 5:
        return &work->unk_BEBEE;
    case 6:
        return &work->unk_BEBEF;
    case 0:
        return &work->unk_BEB9C;
    case 1:
        return &work->unk_BEBA0;
    case 2:
        return &work->unk_BEBA4;
    case 3:
        return &work->unk_BEBC0;
    case 4:
        return &work->unk_BEBD0;
    case 7:
        return &work->fadeTimer;
    case 8:
        return &work->unk_BEBF4;
    case 9:
        return &work->queuedSeqFadeInDuration;
    case 10:
        return &work->currentSeqNo;
    case 11:
        return &work->queuedSeqNo;
    case 12:
        return &work->unk_BEC00;
    case 13:
        return &work->unk_BEC01;
    case 14:
        return &work->afterFanfareWaitTimer;
    case 15:
        return &work->unk_BEC04;
    case 16:
        return &work->unk_BEC05;
    case 17:
        return &work->unk_BEC06;
    case 18:
        return &work->unk_BEC07;
    case 19:
        return &work->unk_BEC08;
    case 20:
        return &work->unk_BEC09;
    case 21:
        return &work->unk_BEC0A;
    case 22:
        return &work->unk_BEC0B;
    case 23:
        return &work->stateSaveDepth[0];
    case 24:
        return &work->stateSaveDepth[1];
    case 25:
        return &work->stateSaveDepth[2];
    case 26:
        return &work->stateSaveDepth[3];
    case 27:
        return &work->stateSaveDepth[4];
    case 28:
        return &work->stateSaveDepth[5];
    case 29:
        return &work->stateSaveDepth[6];
    case 30:
        return &work->unk_BEC28;
    case 31:
        return &work->unk_BEC29;
    case 32:
        return &work->unk_BEC2A;
    case 33:
        return &work->unk_BEC2C;
    case 34:
        return &work->unk_BEC30;
    case 35:
        return &work->unk_BEC38;
    case 36:
        return &work->myChatot;
    case 37:
        return &work->otherChatots[0];
    case 38:
        return &work->otherChatots[1];
    case 39:
        return &work->otherChatots[2];
    case 40:
        return &work->otherChatots[3];
    case 41:
        return &work->cryPattern[0];
    case 42:
        return &work->cryPan[0];
    case 43:
        return &work->cryVolume[0];
    case 44:
        return &work->cryHeapId[0];
    case 45:
        return &work->cryNo[0];
    case 46:
        return &work->cryDelayTimer[0];
    case 47:
        return &work->cryPattern[1];
    case 48:
        return &work->cryPan[1];
    case 49:
        return &work->cryVolume[1];
    case 50:
        return &work->cryHeapId[1];
    case 51:
        return &work->cryNo[1];
    case 52:
        return &work->cryDelayTimer[1];
    case 53:
        return &work->unk_BEC76;
    case 54:
        return &work->unk_BEC77;
    case 55:
        return &work->unk_BEC78;
    case 56:
        return &work->unk_BEC79;
    case 57:
        return &work->unk_BEC7A;
    case 58:
        return &work->unk_BEC7C;
    }
    GF_ASSERT(0);
    return NULL;
}

int GF_Snd_SaveState(int *level_p) {
    SND_WORK *work;
    int level;

    work = GetSoundDataPointer();
    level = NNS_SndHeapSaveState(work->heap);
    GF_ASSERT(level != -1);
    if (level_p != NULL) {
        *level_p = level;
    }
    GF_SndHeapGetFreeSize();
    return level;
}

void GF_Snd_LoadState(int level) {
    SND_WORK *work;

    work = GetSoundDataPointer();
    NNS_SndHeapLoadState(work->heap, level);
    GF_SndHeapGetFreeSize();
}

void GF_SndHeapGetFreeSize(void) {
    SND_WORK *work;

    work = GetSoundDataPointer();
    sSndHeapFreeSize = NNS_SndHeapGetFreeSize(work->heap);
}

BOOL GF_Snd_LoadGroup(int groupNo) {
    BOOL ret;
    SND_WORK *work;

    work = GetSoundDataPointer();
    ret = NNS_SndArcLoadGroup(groupNo, work->heap);
    GF_SndHeapGetFreeSize();
    return ret;
}

BOOL GF_Snd_LoadSeq(int seqNo) {
    BOOL ret;
    SND_WORK *work;

    work = GetSoundDataPointer();
    ret = NNS_SndArcLoadSeq(seqNo, work->heap);
    GF_SndHeapGetFreeSize();
    return ret;
}

BOOL GF_Snd_LoadSeqEx(int seqNo, u32 loadFlag) {
    BOOL ret;
    SND_WORK *work;

    work = GetSoundDataPointer();
    ret = NNS_SndArcLoadSeqEx(seqNo, loadFlag, work->heap);
    GF_SndHeapGetFreeSize();
    return ret;
}

BOOL GF_Snd_LoadWaveArc(int waveArcNo) {
    BOOL ret;
    SND_WORK *work;

    work = GetSoundDataPointer();
    ret = NNS_SndArcLoadWaveArc(waveArcNo, work->heap);
    GF_SndHeapGetFreeSize();
    return ret;
}

BOOL GF_Snd_LoadBank(int bankNo) {
    BOOL ret;
    SND_WORK *work;

    work = GetSoundDataPointer();
    ret = NNS_SndArcLoadBank(bankNo, work->heap);
    GF_SndHeapGetFreeSize();
    return ret;
}

NNSSndHandle *GF_GetSoundHandle(int playerNo) {
    SND_WORK *work;

    work = GetSoundDataPointer();
    if (playerNo >= SND_HANDLE_MAX) {
        GF_ASSERT(0);
        playerNo = 0;
    }
    return &work->unk_BEB78[playerNo];
}

enum SoundHandleNo GF_GetSndHandleByPlayerNo(int playerNo) {
    switch (playerNo) {
    case PLAYER_FIELD:
        return SND_HANDLE_FIELD;
    case PLAYER_PV:
        return SND_HANDLE_PV;
    case PLAYER_ME:
        return SND_HANDLE_ME;
    case PLAYER_SE_1:
        return SND_HANDLE_SE_1;
    case PLAYER_SE_2:
        return SND_HANDLE_SE_2;
    case PLAYER_SE_3:
        return SND_HANDLE_SE_3;
    case PLAYER_SE_4:
        return SND_HANDLE_SE_4;
    case PLAYER_BGM:
        return SND_HANDLE_BGM;
    default:
        GF_ASSERT(0);
        return SND_HANDLE_SE_1;
    }
}

void GF_SoundDataInit(SND_WORK *work) {
    int i;

    memset(work, 0, sizeof(SND_WORK));
    for (i = 0; i < 7; i++) {
        work->stateSaveDepth[i] = i + 1;
    }
}

void GF_SndHandleInitAll(struct SND_WORK *work) {
    int i;

    for (i = 0; i < SND_HANDLE_MAX; i++) {
        NNS_SndHandleInit(&work->unk_BEB78[i]);
    }
}

void sub_02004898(SND_WORK *work) {
    GF_Snd_SaveState(&work->stateSaveDepth[0]);
    GF_Snd_LoadGroup(GROUP_GLOBAL);
    GF_Snd_LoadBank(BANK_GAMEBOY);
    GF_Snd_SaveState(&work->stateSaveDepth[1]);
}

void GF_InitMic(SND_WORK *work) {
    MIC_Init();
    PM_SetAmp(PM_AMP_ON);
    PM_SetAmpGain(PM_AMPGAIN_80);
    work->micInitDone = TRUE;
}

void GF_SndStopPlayerBgm(void) {
    NNS_SndPlayerStopSeqByPlayerNo(PLAYER_BGM, 0);
    NNS_SndHandleReleaseSeq(GF_GetSoundHandle(SND_HANDLE_BGM));
}

void GF_SndStopPlayerField(void) {
    NNS_SndPlayerStopSeqByPlayerNo(PLAYER_FIELD, 0);
    NNS_SndHandleReleaseSeq(GF_GetSoundHandle(SND_HANDLE_FIELD));
}

void sub_02004920(u16 unk) {
#pragma unused(unk)
}

BOOL GF_SndWorkMicCounterFull(void) {
    SND_WORK *work;

    work = GetSoundDataPointer();
    return (work->micCounter > 90) ? TRUE : FALSE;
}

void GF_SndWorkMicCounterReset(void) {
    SND_WORK *work;

    work = GetSoundDataPointer();
    work->micCounter = 0;
}

void GF_SndWorkSetGbSoundsVolume(u8 a0) {
    SND_WORK *work;

    work = GetSoundDataPointer();
    work->gbSoundsVolume = a0;
}

u8 GF_SndWorkGetGbSoundsVolume(void) {
    SND_WORK *work;

    work = GetSoundDataPointer();
    return work->gbSoundsVolume;
}
