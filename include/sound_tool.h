#ifndef POKEHEARTGOLD_SOUND_TOOL_H
#define POKEHEARTGOLD_SOUND_TOOL_H
                   
#define SND_BANK_FLAG_CONTINUE           0                        
#define SND_BANK_FLAG_CHANGE             1                                      

#define SND_VCHAT_VOL_LV                 5    

#define WAVEOUT_CHANNEL_NORMAL          14
#define WAVEOUT_CHANNEL_CHORUS          15

#define BGM_CHANNEL_NORMAL          0xa7fe

typedef struct{
    NNSSndWaveOutHandle* handle;    
    NNSSndWaveFormat format;                
    const void* dataaddr;            
    BOOL loopFlag;            
    int loopStartSample;    
    int samples;    
    int sampleRate;    
    int volume;    
    int speed;    
    int pan;                
} WAVEOUT_WORK;

void Snd_SetCntrlBGMFlag(u8 flag);
u8 Snd_GetCntrlBGMFlag(void);
void Snd_SetCurrentlyPlayingBGM(u16 no);
u16 Snd_GetCurrentlyPlayingBGM(void);
void Snd_SetNextBGM(u16 no);
void Snd_SetUNK_58(u16 unkA);
void Snd_SetZoneBGM(u16 unkA);
void Snd_SetScene(u8 scene);
void Snd_ClearBGMHeapAndSubscene(void);
int Snd_LoadGroupByScene(u8 scene);
BOOL sub_02004EB4(u16 unkA);
BOOL Snd_SetDataByScene(u8 scene, u16 no, int flag);
void Snd_SetFieldSubData(u16 no, u16 old_bank_no);
void BGM_SaveStateAndPlayBGM(u16 no);
void Snd_ClearBGMHeap(void);
int Snd_GetSaveHeap(int type);
void SndPause(u8 player, BOOL flag);
void Snd_ClearPauseFlags();
void Snd_HandleMoveVolume(u8 handle_no, int target_volume, int frames);
void Snd_HandleSetInitialVolume(int handle_no, int vol);
void Snd_SetVChatVolBySeqNo(int seq_no);
void Snd_SetVChatVol(int seq_no, int handle_no);
u8 Snd_GetVol(int seq_no);
void Snd_SetVol(u16 seq_no, int vol);
int GF_SndPlayerCountPlayingSeqByPlayerNo(int player_no);
u8 Snd_GetPlayerNo(u16 no);
int GF_SndPlayerGetSeqNo(int player_no);
const NNSSndArcBankInfo* Snd_GetBankInfo(int no);
u16 Snd_GetBank(int no);
BOOL IsWorkMicCounterFull(void);
MICResult GF_MicStartAutoSampling(MICAutoParam* p);
MICResult GF_MicStopAutoSampling(void);
void MicPauseOnLidClose(void);
void MicResumeOnLidOpen(void);
NNSSndWaveOutHandle* GetWaveoutHandle( u32 no ); 
BOOL AllocWaveoutChannel(u32 no);
void FreeWaveoutChannel(u32 no);
BOOL WaveoutStart(WAVEOUT_WORK* p, u32 ch);
void WaveoutStop(u32 no);
BOOL WaveoutIsPlaying(u32 no);
void SetWaveoutPan(u32 no, u8 pan);
void SetWaveoutSpeed(u32 no, u32 spd);
void SetWaveoutVol(u32 no, int vol);
BOOL WaveoutStartReverse(u16 no, int vol, int pan, u32 ch, int heap_id);
void WaveoutStopReverse(u32 no);
void GF_SndHandleSetTrackPitch(int handle_no, u16 bitmask, int pitch);
void Snd_SetHandleTrack(u16 no, u16 bitmask, int pitch);
void GF_SetHandleTrackByPlayerNo(u8 player_no, u16 bitmask, int pitch);
void Snd_SetHandleTrackPan(int handle_no, u16 bitmask, int pan);
void GF_SndHandleSetTempoRatio(int handle_no, int tempo);
void GF_SndSetMonoFlag(BOOL flag);
void Snd_SetFadeCount(int frame);
int Snd_GetAfterFadeDelayTimer(void);
void GF_SndSetMasterVolume(int vol);
s8* Snd_GetWaveBufferAdrs(void);
void Snd_SetBankFlag(int flag);
BOOL StartMusic(u16 no, int frame, int next_wait, u8 flag, void* adrs);
BOOL StartFadeInMusic(u16 no, int frame, int next_wait, int next_frame, u8 flag, void* adrs);
BOOL MusicFadeOutAndFadeInNext(u8 scene, u16 no, int frame, int next_wait, int next_frame, u8 flag, void* adrs);
void Snd_SetBGMAndReverb(int flag);
void GF_SndHandleSetPlayerVolume(int player_no, int vol);
void Snd_SetPVDoubleFlag(u8 flag);
void Snd_SetBattleRecFlag(u8 flag);
BOOL Snd_ReadPlayerVariable(u16 seq_no, u16 varNo, s16* var);
void sub_02005BA8(u16 seq_no);
void Snd_SetUNK_56(u8 unk);
u8 Snd_GetUNK_56(void);
u8 SoundSys_GetGBSoundsState(void);
void SoundSys_ToggleGBSounds(void);
u16 GBSounds_GetGBSeqNoByDSSeqNo(u16 seq_no);
void GBSounds_SetAllocatableChannels(void);
void sub_02005CF4(u32 unkA);
void sub_02005D00(void);

#endif //POKEHEARTGOLD_SOUND_TOOL_H

