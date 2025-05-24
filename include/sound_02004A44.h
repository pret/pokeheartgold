#ifndef POKEHEARTGOLD_SOUND_02004A44_H
#define POKEHEARTGOLD_SOUND_02004A44_H

#include <nitro.h>
#include <nnsys.h>

typedef struct UnkStruct_02004A44_0 {
    NNSSndWaveOutHandle *unk00;
    NNSSndWaveFormat unk04;
    void *unk08;
    u32 unk0c;
    u32 unk10;
    u32 unk14;
    u32 unk18;
    s32 unk1c;
    u32 unk20;
    s32 unk24;
} UnkStruct_02004A44_0;

void sub_02004B10(void);
void GF_SndHandleMoveVolume(int, int, int);

void Sound_SetMasterVolume(int a0);
void sub_02005D00(void);
void GF_MicPauseOnLidClose(void);
void GF_MicResumeOnLidOpen(void);
BOOL SoundSys_GetGBSoundsState(void);
void SoundSys_ToggleGBSounds(void);
BOOL sub_02005738(int a0);
s8 *sub_020059D8(void);
void sub_02005600(int);
void sub_020058B8(int);
void sub_02005680(int);
NNSSndWaveOutHandle *sub_020055AC(int);
BOOL sub_020056E8(UnkStruct_02004A44_0 *wavParam, int);
void sub_02005774(int, int);
BOOL GF_MIC_StartAutoSampling(MICAutoParam *param);
void GF_MIC_StopAutoSampling(void);
void PlayCryEx(int, int, int, int, int, int);
void sub_02004B24(int);
void BGM_SaveStateAndPlayNew(int a0);
u16 GF_GetCurrentPlayingBGM(void);
void sub_020053A8(u8 a0, u8 a1);
void GF_SND_BGM_DisableSet(u8 a0);
BOOL sub_02005518(void);
void Sound_SetSceneAndPlayBGM(u8 scene, u16 bgmID, int unused);
void GF_SetVolumeBySeqNo(u16 a0, u16 a1);
void GF_SndHandleSetPlayerVolume(u32 a0, u32 a1);

void sub_02004AD8(int a0);
void sub_02005BEC(BOOL);

#endif // POKEHEARTGOLD_SOUND_02004A44_H
