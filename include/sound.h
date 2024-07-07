#ifndef POKEHEARTGOLD_SOUND_H
#define POKEHEARTGOLD_SOUND_H

#include "constants/sndseq.h"

#include "options.h"
#include "sound_chatot.h"

#define PLAYER_RADIO 9

typedef struct SND_WORK SND_WORK;

#define SND_HEAP_SIZE 0xBEAE0

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
void GF_SndStopPlayerBgm(void);
void GF_SndStopPlayerField(void);
void PlayBGM(u16 seqno);
void GF_SndStartFadeInBGM(u32, u32, u32);
u32 GF_SndPlayerCountPlayingSeqByPlayerNo(u32 playerno);
void InitSoundData(SOUND_CHATOT *chatot, Options *options);
void GF_SndCallback(void);
BOOL GF_SndIsFanfarePlaying(void);
int GF_Snd_SaveState(int *level_p);
void GF_Snd_LoadState(int level);
BOOL GF_Snd_LoadGroup(int groupNo);
BOOL GF_Snd_LoadSeq(int seqNo);
BOOL GF_Snd_LoadSeqEx(int seqNo, u32 loadFlag);
BOOL GF_Snd_LoadWaveArc(int waveArcNo);
BOOL GF_Snd_LoadBank(int bankNo);
enum SoundHandleNo GF_GetSndHandleByPlayerNo(int playerNo);
void GF_SoundDataInit(SND_WORK *work);
void GF_SndHandleInitAll(struct SND_WORK *work);
void sub_02004898(SND_WORK *work);
void GF_InitMic(SND_WORK *work);
void sub_02004920(u16 unk);
BOOL GF_SndWorkMicCounterFull(void);
void GF_SndWorkMicCounterReset(void);
void GF_SndWorkSetGbSoundsVolume(u8 a0);
u8 GF_SndWorkGetGbSoundsVolume(void);
void GF_SndStartFadeOutBGM(u16 seqno, u16 length);
NNSSndHandle *GF_GetSoundHandle(int playerNo);

#endif // POKEHEARTGOLD_SOUND_H
