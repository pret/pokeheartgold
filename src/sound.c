#include "global.h"
#include "sound.h"
#include "sound_chatot.h"
#include "options.h"
#include "main.h"

#define ASM_EXTERN extern

struct SND_WORK {
    /* 0x00000 */ NNSSndArc arc;
    /* 0x00094 */ NNSSndHeapHandle heap;
    /* 0x00098 */ u8 heap_buf[0xBEAE0];
    /* 0xBEB78 */ u8 unk_BEB78[0x1C];
    /* 0xBEB94 */ NNSSndHandle unk_BEB94;
    /* 0xBEB98 */ u8 unk_BEB98[0x58];
    /* 0xBEBF0 */ s32 unk_BEBF0;
    /* 0xBEBF4 */ u8 unk_BEBF4[0x48];
    /* 0xBEC3C */ SOUND_CHATOT *chatot;
    /* 0xBEC40 */ u8 unk_BEC40[0x10];
    /* 0xBEC50 */ u32 unk_BEC50[2];
    /* 0xBEC58 */ u32 unk_BEC58[2];
    /* 0xBEC60 */ u32 unk_BEC60[2];
    /* 0xBEC68 */ u32 unk_BEC68[2];
    /* 0xBEC70 */ u16 unk_BEC70[2];
    /* 0xBEC74 */ u8 unk_BEC74[2];
    /* 0xBEC76 */ u8 padding_BEC76[10];
    /* 0xBEC80 */ u32 unk_BEC80_00:1;
    /* 0xBEC80 */ u32 unk_BEC80_01:31;
    /* 0xBEC84 */ u8 padding_BEC84[4];
}; // size: 0xBEC88

SND_WORK sSoundWork;
u32 _0211194C;
u32 _02111950;
u32 sSndHeapFreeSize;

void GF_SoundDataInit(SND_WORK *work);
void GF_InitMic(SND_WORK *work);
void sub_0200498C(NNSSndHeapHandle *heap_p);
void GF_SndHandleInitAll(SND_WORK *work);
void sub_02004898(struct SND_WORK *work);
void sub_02004300(void);
BOOL sub_020043CC(void);
BOOL sub_02004924(void);

void InitSoundData(SOUND_CHATOT *chatot, OPTIONS *options) {
    SND_WORK *work = GetSoundDataPointer();
    NNS_SndInit();
    GF_SoundDataInit(work);
    GF_InitMic(work);
    work->heap = NNS_SndHeapCreate(work->heap_buf, sizeof(work->heap_buf));
    NNS_SndArcInit(&work->arc, "data/sound/gs_sound_data.sdat", work->heap, FALSE);
    NNS_SndArcPlayerSetup(work->heap);
    sub_0200498C(&work->heap);
    GF_SndHandleInitAll(work);
    sSndHeapFreeSize = NNS_SndHeapGetSize(work->heap);
    GF_SndHeapGetFreeSize();
    sub_02004898(work);
    _02111950 = 0;
    work->chatot = chatot;
    GF_SndSetMonoFlag(options->soundMethod);
    (void)_0211194C;
}

void DoSoundUpdateFrame(void) {
    SND_WORK *work;
    int i;
    SNDChannelInfo sp24;
    SNDTrackInfo sp8;
    void *stripped_0;
    void *stripped_1;

    work = GetSoundDataPointer();
    stripped_0 = GF_SdatGetAttrPtr(18);
    stripped_1 = GF_SdatGetAttrPtr(32);
    if (!sub_020043CC()) {
        if (work->unk_BEBF0 > 0) {
            work->unk_BEBF0--;
        }
        sub_02004300();
    }
    NNS_SndUpdateDriverInfo();
    if (gMain.newKeys & 0x2000) {
        for (i = 0; i < 16; i++) {
            NNS_SndPlayerReadDriverTrackInfo(&work->unk_BEB94, i, &sp8);
            NNS_SndReadDriverChannelInfo(i, &sp24);
        }
    }
    ChatotSoundMain();
    for (i = 0; i < 2; i++) {
        if (work->unk_BEC74[i] != 0) {
            work->unk_BEC74[i]--;
            if (work->unk_BEC74[i] == 0) {
                sub_020063A4(work->unk_BEC50[i], work->unk_BEC70[i], work->unk_BEC58[i], work->unk_BEC60[i], work->unk_BEC68[i], 0);
            }
        }
    }
    if (work->unk_BEC80_00 && !sub_02004924()) {
        work->unk_BEC80_01++;
    }
    NNS_SndMain();
}
