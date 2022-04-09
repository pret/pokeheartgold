#ifndef POKEHEARTGOLD_SND_TOOL_H
#define POKEHEARTGOLD_SND_TOOL_H

#include <nnsys/snd/waveout.h>
#include <nnsys/snd/capture.h>

#define BGM_FADEIN_START_VOL_MIN    0                        
#define BGM_FADEIN_START_VOL_NOW    1            

#define PV_PTN_PARAM_NONE       0x1ff                    

#define SND_BANK_CONTINUE           0                        
#define SND_BANK_CHANGE             1                        

#define SND_HALF_PITCH             64                    

#define SND_VCHAT_VOL_LV            5    

#define WAVEOUT_CH_NORMAL          14
#define WAVEOUT_CH_CHORUS          15

#define PLAYER_BGM_NORMAL_CH   0xa7fe

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
void Snd_SetSubscene(u8 scene);
void Snd_ClearHeapAndSubscene(void);
int Snd_LoadGroupByScene(u8 scene);
BOOL sub_02004EB4(u16 unkA);
BOOL Snd_SetDataByScene(u8 scene, u16 no, int flag);
void Snd_SetDataSub(u8 scene);
void Snd_SetFieldData(u16 no, int flag);
static void Snd_SetFieldData_StartPauseOff( u16, u16 );
void Snd_SetFieldDataSub(u16 no, u16 old_bank_no);
static void Snd_SetBattleData(u16, int);
void Snd_SetP2PData(u16 no, int unused);
void Snd_SetContestData(u16, int);
void Snd_SetContestImageData(u16, int);
static void Snd_AddSceneData(u8);
static void Snd_SetDemoData(u8, u16, int);
void BGM_SaveStateAndPlayNew(u16 no);
void Snd_ClearHeap(void);
int Snd_GetSaveLv(int type);
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
int GF_NNS_SndPlayerGetSeqNo(int player_no);
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
void Snd_BufferReverse(u8* p, u32 size);
void WaveoutStopReverse(u32 no);
BOOL Snd_CaptureIsActive(void);
NNSSndCaptureType GF_SndCaptureGetCaptureType(void);
void GF_SndCaptureStopReverb(int frame);
void GF_SndHandleSetTrackPitch(int handle_no, u16 bitmask, int pitch);
void Snd_SetHandleTrack(u16 no, u16 bitmask, int pitch);
void GF_SetHandleTrackByPlayerNo(u8 player_no, u16 bitmask, int pitch);
void Snd_SetHandleTrackPan(int handle_no, u16 bitmask, int pan);
void GF_SndHandleSetTempoRatio(int handle_no, int tempo);
void GF_SndSetMonoFlag(BOOL flag);
void Snd_SetFadeCount(int frame);
void Snd_SetNextWait(int frame);
int Snd_GetAfterFadeDelayTimer(void);
void GF_SndSetMasterVolume(int vol);
s8* Snd_GetWaveBufferAdrs(void);
void Snd_SetBankFlag(int flag);
BOOL StartMusic(u16 no, int frame, int next_wait, u8 flag, void* adrs);
BOOL MusicFadeOutAndPlayNext(u8 scene, u16 no, int frame, int next_wait, u8 flag, void* adrs);
BOOL StartFadeInMusic(u16 no, int frame, int next_wait, int next_frame, u8 flag, void* adrs);
BOOL MusicFadeOutAndFadeInNext(u8 scene, u16 no, int frame, int next_wait, int next_frame, u8 flag, void* adrs);
static void SetFadeCommon(u8 scene, u16 no, int frame, int next_wait, u8 flag, void* adrs);
void GF_SndSetAllocatableChannelForBGMPlayer(int channel);
void Snd_SetBGMAndReverb(int flag);
void Snd_FieldPauseOrStop(void);
void GF_SndHandleSetPlayerVolume(int player_no, int vol);
void Snd_SetPVDoubleFlag(u8 flag);
void Snd_SetBattleRecFlag(u8 flag);
BOOL Snd_ReadPlayerVariable(u16 seq_no, u16 varNo, s16* var);
void sub_02005BA8(u16 seq_no);
void Snd_SetUNK_56(u8 unk);
u8 Snd_GetUNK_56(void);
void Snd_SetGBSoundsState(u8 val);
u8 SoundSys_GetGBSoundsState(void);
void SoundSys_ToggleGBSounds(void);
u16 GBSounds_GetGBSeqNoByDSSeqNo(u16 seq_no);
u16 GBSounds_GetDSSeqNoByGBSeqNo(u16 seq_no);
void GBSounds_SetAllocatableChannels(void);
void sub_02005CF4(u32 unkA);
void sub_02005D00(void);

#endif //POKEHEARTGOLD_SND_TOOL_H

