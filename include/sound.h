#ifndef POKEHEARTGOLD_SOUND_H
#define POKEHEARTGOLD_SOUND_H

#include "constants/sndseq.h"

#define PLAYER_RADIO           9

typedef struct SND_WORK SND_WORK;

#define SND_HEAP_SIZE      0xBEAE0

enum SoundHandleNo {
    SND_HANDLE_FIELD,
    SND_HANDLE_PV,
    SND_HANDLE_ME,
    SND_HANDLE_SE_1,
    SND_HANDLE_SE_2,
    SND_HANDLE_SE_3,
    SND_HANDLE_SE_4,
    SND_HANDLE_BGM,
    SND_HANDLE_CHORUS,
    SND_HANDLE_MAX,
};

SND_WORK *GetSoundDataPointer(void);
void GF_SndHeapGetFreeSize(void);
void GF_SndSetMonoFlag(int flag);
void DoSoundUpdateFrame(void);
void *GF_SdatGetAttrPtr(u32 attr);
void GF_SndSetState(u32 state);
BOOL GF_SndGetFadeTimer(void);
BOOL GF_SndGetAfterFadeDelayTimer(void);
void GF_SndStopPlayerField(void);
void GF_SndStopPlayerBgm(void);
void PlayBGM(u16 seqno);
void GF_SndStartFadeInBGM(u32, u32, u32);
u32 GF_SndPlayerCountPlayingSeqByPlayerNo(u32 playerno);

#endif //POKEHEARTGOLD_SOUND_H
