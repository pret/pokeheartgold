#ifndef POKEHEARTGOLD_SOUND_H
#define POKEHEARTGOLD_SOUND_H

typedef struct SND_WORK SND_WORK;

#define SND_HEAP_SIZE      0xBEAE0
#define SND_PLAYER_COUNT         9

SND_WORK *GetSoundDataPointer(void);
void GF_SndHeapGetFreeSize(void);
void GF_SndSetMonoFlag(int flag);
void DoSoundUpdateFrame(void);
void *GF_SdatGetAttrPtr(u32 attr);
void sub_020043B0(u32 state);
BOOL sub_02005F88(void);
BOOL sub_020059B0(void);
void sub_020048F0(void);
void PlayBGM(u16 seqno);
void sub_02005F10(u32, u32, u32);
u32 GF_SndPlayerCountPlayingSeqByPlayerNo(u32 playerno);

#endif //POKEHEARTGOLD_SOUND_H
