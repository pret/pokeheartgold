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

#define SND_HANDLE_FIELD            0                                    
#define SND_HANDLE_PMVOICE          1                                        
#define SND_HANDLE_ME               2                                
#define SND_HANDLE_SE_1             3                                
#define SND_HANDLE_SE_2             4                                
#define SND_HANDLE_SE_3             5                                
#define SND_HANDLE_SE_4             6                                
#define SND_HANDLE_BGM              7                                    
#define SND_HANDLE_CHORUS           8                                    
#define SND_HANDLE_MAX              9

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

void GF_SetCtrlBgmFlag(u8 flag);
u8 GF_GetCntrlBgmFlag(void);
void GF_SetCurrentPlayingBGM(u16 no);
u16 GF_GetCurrentPlayingBGM(void);
void GF_SetNextBGM(u16 no);
void GF_SetUNK_58(u16 unkA);
void GF_SetZoneBGM(u16 unkA);
void GF_SetSndScene(u8 scene);
void GF_SetSndSubScene(u8 scene);
void GF_ClearHeapAndSndSubScene(void);
int GF_Snd_LoadGroupByScene(u8 scene);
BOOL sub_02004EB4(u16 unkA);
BOOL GF_SetDataByScene(u8 scene, u16 no, int flag);
void GF_SetDataSub(u8 scene);
void GF_SetFieldData(u16 no, int flag);
static void GF_SetFieldData_StartPauseOff( u16, u16 );
void GF_SetFieldDataSub(u16 no, u16 old_bank_no);
static void GF_SetBattleData(u16, int);
void GF_SetP2PData(u16 no, int unused);
void GF_SetContestData(u16, int);
void GF_SetConImageData(u16, int);
static void GF_SndAddSceneData(u8);
static void GF_SetDemoData(u8, u16, int);
void BGM_SaveStateAndPlayNew(u16 no);
void GF_ClearHeap(void);
int GF_GetHeapSaveLv(int type);
void GF_SndPause(u8 player, BOOL flag);
void GF_ClearPauseFlags();
void GF_SndHandleMoveVolume(u8 handle_no, int target_volume, int frames);
void GF_SndHandleSetInitialVolume(int handle_no, int vol);
void GF_SndSetVChatVolBySeqNo(int seq_no);
void GF_SndSetVChatVol(int seq_no, int handle_no);
u8 GF_GetVolumeBySeqNo(int seq_no);
void GF_SetVolumeBySeqNo(u16 seq_no, int vol);
int GF_SndPlayerCountPlayingSeqByPlayerNo(int player_no);
u8 GF_GetPlayerNoBySeq(u16 no);
int GF_NNS_SndPlayerGetSeqNo(int player_no);
const NNSSndArcBankInfo* GF_GetBankInfoBySeqNo(int no);
u16 GF_GetBankBySeqNo(int no);
BOOL SndWorkMicCounterFull(void);
MICResult GF_MIC_StartAutoSampling(MICAutoParam* p);
MICResult GF_MIC_StopAutoSampling(void);
void GF_MicPauseOnLidClose(void);
void GF_MicResumeOnLidOpen(void);
NNSSndWaveOutHandle* Snd_WaveOutHandleGet( u32 no ); 
BOOL GF_AllocWaveOutChannel(u32 no);
void GF_FreeWaveOutChannel(u32 no);
BOOL GF_WaveOutStart(WAVEOUT_WORK* p, u32 ch);
void GF_WaveOutStop(u32 no);
BOOL GF_WaveOutIsPlaying(u32 no);
void GF_SetWaveOutPan(u32 no, u8 pan);
void GF_SetWaveOutSpeed(u32 no, u32 spd);
void GF_SetWaveOutVolume(u32 no, int vol);
BOOL GF_WaveOutStartReverse(u16 no, int vol, int pan, u32 ch, int heap_id);
void GF_SndBufReverse(u8* p, u32 size);
void GF_WaveOutStopReverse(u32 no);
BOOL GF_SndCaptureIsActive(void);
NNSSndCaptureType GF_GetCaptureType(void);
void GF_SndCaptureStopReverb(int frame);
void GF_SndHandleSetTrackPitch(int handle_no, u16 bitmask, int pitch);
void GF_SetHandleTrackBySeqNo(u16 no, u16 bitmask, int pitch);
void GF_SetHandleTrackByPlayerNo(u8 player_no, u16 bitmask, int pitch);
void GF_SndHandleSetTrackPan(int handle_no, u16 bitmask, int pan);
void GF_SndHandleSetTempoRatio(int handle_no, int tempo);
void GF_SndSetMonoFlag(BOOL flag);
void GF_SetFadeCount(int frame);
void GF_SetNextWait(int frame);
int GF_SndGetAfterFadeDelayTimer(void);
void GF_SetMasterVolume(int vol);
s8* GF_GetWaveBufAdrs(void);
void GF_SetSndBankFlag(int flag);
BOOL GF_NowStartMusicId(u16 no, int frame, int next_wait, u8 flag, void* adrs);
BOOL Snd_FadeOutNextPlaySet(u8 scene, u16 no, int frame, int next_wait, u8 flag, void* adrs);
BOOL GF_FadeStartMusicId(u16 no, int frame, int next_wait, int next_frame, u8 flag, void* adrs);
BOOL Snd_FadeOutNextFadeInSet(u8 scene, u16 no, int frame, int next_wait, int next_frame, u8 flag, void* adrs);
static void Snd_FadeCommonSet(u8 scene, u16 no, int frame, int next_wait, u8 flag, void* adrs);
void GF_SndSetAllocatableChannelForBGMPlayer(int channel);
void GF_SndSetBgmChannelAndReverb(int flag);
void Snd_FieldPauseOrStop(void);
void GF_SndHandleSetPlayerVolume(int player_no, int vol);
void Snd_SetPVDoubleFlag(u8 flag);
void Snd_SetBattleRecFlag(u8 flag);
BOOL GF_SndPlayerReadVariableBySeq(u16 seq_no, u16 varNo, s16* var);
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

