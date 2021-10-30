#include "global.h"
#include "sound.h"
#include "sound_chatot.h"
#include "options.h"

#define ASM_EXTERN extern

struct SND_WORK {
    /* 0x00000 */ NNSSndArc arc;
    /* 0x00094 */ NNSSndHeapHandle heap;
    /* 0x00098 */ u8 heap_buf[0xBEAE0];
    /* 0xBEB78 */ u8 unk_BEB78[0xC4];
    /* 0xBEC3C */ SOUND_CHATOT *chatot;
    /* 0xBEC40 */ u8 unk_BEC40[0x48];
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
