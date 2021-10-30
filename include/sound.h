#ifndef POKEHEARTGOLD_SOUND_H
#define POKEHEARTGOLD_SOUND_H

typedef struct SND_WORK SND_WORK;

SND_WORK *GetSoundDataPointer(void);
u32 GF_SndHeapGetFreeSize(void);
void GF_SndSetMonoFlag(int flag);
void DoSoundUpdateFrame(void);
void *GF_SdatGetAttrPtr(u32 attr);

#endif //POKEHEARTGOLD_SOUND_H
