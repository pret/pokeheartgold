#include "sound.h"
#include "sound_chatot.h"
#include "options.h"
#include "system.h"
#include "constants/sndseq.h"
#include "constants/snd_system.h"

#define ASM_EXTERN extern

struct SND_WORK {
    /* 0x00000 */ NNSSndArc arc;
    /* 0x00094 */ NNSSndHeapHandle heap;
    /* 0x00098 */ u8 heap_buf[SND_HEAP_SIZE];
    /* 0xBEB78 */ NNSSndHandle unk_BEB78[SND_HANDLE_MAX];
    /* 0xBEB9C */ u32 waveoutHandleNormal;
    /* 0xBEBA0 */ u32 waveoutHandleChorus;
    /* 0xBEBA4 */ u32 bankinfo;
    /* 0xBEBA8 */ u8 unk_BEBA8[0x18];
    /* 0xBEBC0 */ u8 captureBuffer[16];
    /* 0xBEBD0 */ u8 callbackinfo[28];
    /* 0xBEBEC */ u16 unk_BEBEC;
    /* 0xBEBEE */ u8 cntrlBGMFlag;
    /* 0xBEBEF */ u8 pvWait;
    /* 0xBEBF0 */ int fadeTimer;
    /* 0xBEBF4 */ int nextWait;
    /* 0xBEBF8 */ int queuedSeqFadeInDuration;
    /* 0xBEBFC */ u16 currentSeqNo;
    /* 0xBEBFE */ u16 queuedSeqNo;
    /* 0xBEC00 */ u8 fieldPauseFlag;
    /* 0xBEBC1 */ u8 pauseBGMFlag;
    /* 0xBEC02 */ u16 afterFanfareWaitTimer;
    /* 0xBEC04 */ u8 reverseFlag;
    /* 0xBEC05 */ u8 waveoutNormalFlag;
    /* 0xBEC06 */ u8 waveoutChorusFlag;
    /* 0xBEC07 */ u8 chorusFlag;
    /* 0xBEC08 */ u8 bankFlag;
    /* 0xBEC09 */ u8 filterSize;
    /* 0xBEC0A */ u8 sceneMain;
    /* 0xBEC0B */ u8 sceneSub;
    /* 0xBEC0C */ int stateSaveDepth[7];
    /* 0xBEC28 */ u8 chatotPlayFlag;
    /* 0xBEC29 */ u8 chatotDefaultFlag;
    /* 0xBEC2A */ u16 zoneBGM;
    /* 0xBEC2C */ u32 wavedata;
    /* 0xBEC30 */ u8 reverseBuffer[8];
    /* 0xBEC38 */ u32 tcbLength;
    /* 0xBEC3C */ SOUND_CHATOT *myChatot;
    /* 0xBEC40 */ SOUND_CHATOT *otherChatots[4];
    /* 0xBEC50 */ u32 cryPattern[2];
    /* 0xBEC58 */ u32 cryPan[2];
    /* 0xBEC60 */ u32 cryVolume[2];
    /* 0xBEC68 */ u32 cryHeapId[2];
    /* 0xBEC70 */ u16 cryNo[2];
    /* 0xBEC74 */ u8 cryDelayTimer[2];
    /* 0xBEC76 */ u8 pvDoubleFlag;
    /* 0xBEC77 */ u8 battleRecFlag;
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
BOOL GF_IsWorkMicCounterFull(void);

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
    void *stripped_0 = GF_SdatGetAttrPtr(SOUND_WORK_CHORUS_FLAG);
    void *stripped_1 = GF_SdatGetAttrPtr(SOUND_WORK_MAP_MUSIC);

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
    if (work->micInitDone && !GF_IsWorkMicCounterFull()) {
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
        if (!GF_SndGetFadeTimer() && !Snd_GetAfterFadeDelayTimer()) {
            GF_SndStopPlayerBgm();
            if (work->queuedSeqNo != 0) {
                PlayBGM(work->queuedSeqNo);
            }
        }
        break;
    case 6:
        if (!GF_SndGetFadeTimer() && !Snd_GetAfterFadeDelayTimer()) {
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
    if (GF_SndPlayerCountPlayingSeqByPlayerNo (PLAYER_ME) != 0) {
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
    case SOUND_WORK_CTRL_BGM_FLAG:
        return &work->cntrlBGMFlag;
    case SOUND_WORK_CRY_DELAY_WORK:
        return &work->pvWait;
    case SOUND_WORK_WAVEOUT_HANDLE_NORMAL:
        return &work->waveoutHandleNormal;
    case SOUND_WORK_WAVEOUT_HANDLE_CHORUS:
        return &work->waveoutHandleChorus;
    case SOUND_WORK_BANK_INFO:
        return &work->bankinfo;
    case SOUND_WORK_CAPTURE_BUF:
        return &work->captureBuffer;
    case SOUND_WORK_CALLBACK_INFO:
        return &work->callbackinfo;
    case SOUND_WORK_FADE_COUNT:
        return &work->fadeTimer;
    case SOUND_WORK_NEXT_WAIT:
        return &work->nextWait;
    case SOUND_WORK_NEXT_FRAME:
        return &work->queuedSeqFadeInDuration;
    case SOUND_WORK_CUR_BGM_NO:
        return &work->currentSeqNo;
    case SOUND_WORK_NEXT_BGM_NO:
        return &work->queuedSeqNo;
    case SOUND_WORK_FIELD_PAUSE_FLAG:
        return &work->fieldPauseFlag;
    case SOUND_WORK_BGM_PAUSE_FLAG:
        return &work->pauseBGMFlag;
    case SOUND_WORK_ME_WAIT:
        return &work->afterFanfareWaitTimer;
    case SOUND_WORK_REVERSE_FLAG:
        return &work->reverseFlag;
    case SOUND_WORK_WAVEOUT_CH_NORMAL_FLAG:
        return &work->waveoutNormalFlag;
    case SOUND_WORK_WAVEOUT_CH_CHORUS_FLAG:
        return &work->waveoutChorusFlag;
    case SOUND_WORK_CHORUS_FLAG:
        return &work->chorusFlag;
    case SOUND_WORK_BANK_FLAG:
        return &work->bankFlag;
    case SOUND_WORK_FILTER_SIZE:
        return &work->filterSize;
    case SOUND_WORK_SCENE_MAIN:
        return &work->sceneMain;
    case SOUND_WORK_SCENE_SUB:
        return &work->sceneSub;
    case SOUND_WORK_HEAP_SAVE_START:
        return &work->stateSaveDepth[0];
    case SOUND_WORK_HEAP_SAVE_GLOBAL:
        return &work->stateSaveDepth[1];
    case SOUND_WORK_HEAP_SAVE_BGM_BANK:
        return &work->stateSaveDepth[2];
    case SOUND_WORK_HEAP_SAVE_SE:
        return &work->stateSaveDepth[3];
    case SOUND_WORK_HEAP_SAVE_BGM:
        return &work->stateSaveDepth[4];
    case SOUND_WORK_HEAP_SAVE_SUB_SE:
        return &work->stateSaveDepth[5];
    case SOUND_WORK_HEAP_SAVE_ME:
        return &work->stateSaveDepth[6];
    case SOUND_WORK_CHATOT_PLAY_FLAG:
        return &work->chatotPlayFlag;
    case SOUND_WORK_CHATOT_DEFAULT_FLAG:
        return &work->chatotDefaultFlag;
    case SOUND_WORK_MAP_MUSIC:
        return &work->zoneBGM;
    case SOUND_WORK_WAVE_DATA:
        return &work->wavedata;
    case SOUND_WORK_REVERSE_BUF:
        return &work->reverseBuffer;
    case SOUND_WORK_LENGTH_TCB:
        return &work->tcbLength;
    case SOUND_WORK_MY_CHATOT_PTR:
        return &work->myChatot;
    case SOUND_WORK_CHATOT_PTR1:
        return &work->otherChatots[0];
    case SOUND_WORK_CHATOT_PTR2:
        return &work->otherChatots[1];
    case SOUND_WORK_CHATOT_PTR3:
        return &work->otherChatots[2];
    case SOUND_WORK_CHATOT_PTR4:
        return &work->otherChatots[3];
    case SOUND_WORK_CRY_PTR:
        return &work->cryPattern[0];
    case SOUND_WORK_CRY_PAN:
        return &work->cryPan[0];
    case SOUND_WORK_VOLUME:
        return &work->cryVolume[0];
    case SOUND_WORK_CRY_HEAP_ID:
        return &work->cryHeapId[0];
    case SOUND_WORK_CRY_NO:
        return &work->cryNo[0];
    case SOUND_WORK_CRY_DELAY:
        return &work->cryDelayTimer[0];
    case SOUND_WORK_CRY_PTR_2:
        return &work->cryPattern[1];
    case SOUND_WORK_CRY_PAN_2:
        return &work->cryPan[1];
    case SOUND_WORK_VOLUME_2:
        return &work->cryVolume[1];
    case SOUND_WORK_CRY_HEAP_ID_2:
        return &work->cryHeapId[1];
    case SOUND_WORK_CRY_NO_2:
        return &work->cryNo[1];
    case SOUND_WORK_CRY_DELAY_2:
        return &work->cryDelayTimer[1];
    case SOUND_WORK_CRY_DOUBLE_FLAG:
        return &work->pvDoubleFlag;
    case SOUND_WORK_BATTLE_REC_FLAG:
        return &work->battleRecFlag;
    case SOUND_WORK_UNK_55:
        return &work->unk_BEC78;
    case SOUND_WORK_UNK_56:
        return &work->unk_BEC79;
    case SOUND_WORK_UNK_57:
        return &work->unk_BEC7A;
    case SOUND_WORK_UNK_58:
        return &work->unk_BEC7C;
    }
    GF_ASSERT(FALSE);
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

BOOL GF_IsWorkMicCounterFull(void) {
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
