#include "constants/snd_misc.h"
#include "constants/snd_system.h"
#include "constants/snd_def.h"
#include "sound.h"
#include "sound_tool.h"
#include "unk_02005D10.h"
#include "unk_02035900.h"

static u16 Snd_GetNextBGM(void);
static void Snd_SetSubscene(u8 scene);
static void Snd_SetSubData(u8 scene);
static void Snd_SetFieldData(u16 no, int flag);
static void Snd_SetFieldDataWithoutDelay(u16, u16);
static void Snd_SetBattleData(u16 no, int flag);
static void Snd_SetP2PData(u16 no, int unused);
static void Snd_SetContestData(u16, int);
static void Snd_SetContestImageData(u16, int);
static void Snd_AddSceneData(u8);
static void Snd_SetDemoData(u8, u16, int);
static void Snd_ReverseBuffer(u8 *p, u32 size);
static BOOL Snd_CaptureIsActive(void);
static NNSSndCaptureType GF_SndCaptureGetCaptureType(void);
static void GF_SndCaptureStopReverb(int frame);
static void Snd_SetNextWait(int frame);
static BOOL MusicFadeOutAndPlayNext(u8 scene, u16 no, int frame, int next_wait, u8 flag, void *adrs);
static void SetFadeCommon(u8 scene, u16 no, int frame, int next_wait, u8 flag, void *adrs);
static void GF_SndSetAllocatableChannelForBGMPlayer(int channel);
static void Snd_FieldPauseOrStop(void);
static void Snd_SetGBSoundsState(u8 val);
static u16 GBSounds_GetDSSeqNoByGBSeqNo(u16 seq_no);

static u8 auto_sample_flag;
static u32 unk4;
 
typedef struct UnkMicStruct {
    BOOL mono_flag;
    u32 unkc;
} UNK_MICSTRUCT;

static UNK_MICSTRUCT _021D05E8; 

extern MICAutoParam _021D05F8;

#define SWAVE_BUFFER_SIZE 2000
extern s8 sWaveBuffer[SWAVE_BUFFER_SIZE];

extern const u8 _020F5710[8][4];

extern const u16 GS_SeqPairs[136][2];

void Snd_SetCntrlBGMFlag(u8 flag) {
    *(u8 *)GF_SdatGetAttrPtr(SOUND_WORK_CTRL_BGM_FLAG) = flag;
}

u8 Snd_GetCntrlBGMFlag(void) {
    return *(u8 *)GF_SdatGetAttrPtr(SOUND_WORK_CTRL_BGM_FLAG);
}

void Snd_SetCurrentlyPlayingBGM(u16 no) {
    u16 *cur_bgm = (u16 *)GF_SdatGetAttrPtr(SOUND_WORK_CUR_BGM_NO);
    if (no > SEQ_GS_P_START) {
        Snd_SetUNK_58(no);
        *cur_bgm = GBSounds_GetDSSeqNoByGBSeqNo(no);
    } else {
        *cur_bgm = no;
    }
    Snd_SetNextBGM(0);
}

u16 Snd_GetCurrentlyPlayingBGM(void) {
    return *(u16 *)GF_SdatGetAttrPtr(SOUND_WORK_CUR_BGM_NO);
}

void Snd_SetNextBGM(u16 no) {
    *(u16 *)GF_SdatGetAttrPtr(SOUND_WORK_NEXT_BGM_NO) = no;
}

static u16 Snd_GetNextBGM(void) {
    return *(u16 *)GF_SdatGetAttrPtr(SOUND_WORK_NEXT_BGM_NO);
}

void Snd_SetUNK_58(u16 unkA) {
    *(u16 *)GF_SdatGetAttrPtr(SOUND_WORK_UNK_58) = unkA;
}

void Snd_SetMapMusic(u16 no) {
    *(u16 *)GF_SdatGetAttrPtr(SOUND_WORK_MAP_MUSIC) = no;
}

void Snd_SetScene(u8 scene) {
    u8 *scene_main = (u8 *)GF_SdatGetAttrPtr(SOUND_WORK_SCENE_MAIN);
    u8 *scene_sub = (u8 *)GF_SdatGetAttrPtr(SOUND_WORK_SCENE_SUB);
    if (scene < SOUND_SUB) {
        *scene_main = scene;
        *scene_sub = SOUND_MAIN_DUMMY;
        return;
    }
    *scene_sub = scene;
}

static void Snd_SetSubscene(u8 scene) {
    GF_SdatGetAttrPtr(SOUND_WORK_SCENE_MAIN);
    *(u8 *)GF_SdatGetAttrPtr(SOUND_WORK_SCENE_SUB) = scene;
}

void Snd_ClearBGMHeapAndSubscene(void) {
    u8 *sub = GF_SdatGetAttrPtr(SOUND_WORK_SCENE_SUB);
    Snd_ClearBGMHeap();
    *sub = 0;
}

int Snd_LoadGroupByScene(u8 scene) {
    int ret;
    switch (scene) {
    case SOUND_MAIN_TITLE:
    case SOUND_MAIN_AGB:
    case SOUND_MAIN_MYSTERY_GIFT:
    case SOUND_MAIN_EMAIL:
    case SOUND_MAIN_WIFI_LOBBY_PARADE:
    case SOUND_MAIN_WIFI_WORLD_TRADE:
        ret = GF_Snd_LoadGroup(GROUP_SE_FIELD);
        break;
    case SOUND_MAIN_WIFI_LOBBY_GAME:
        ret = GF_Snd_LoadGroup(GROUP_SE_FIELD);

        GF_Snd_LoadSeqEx(SEQ_SE_PL_BALLOON02, NNS_SND_ARC_LOAD_SEQ);    
        GF_Snd_LoadSeqEx(SEQ_SE_PL_BALLOON03_2, NNS_SND_ARC_LOAD_SEQ);    
        GF_Snd_LoadSeqEx(SEQ_SE_PL_BALLOON05, NNS_SND_ARC_LOAD_SEQ);    

        GF_Snd_LoadSeqEx(SEQ_SE_PL_BALLOON01, NNS_SND_ARC_LOAD_SEQ);    
        GF_Snd_LoadSeqEx(SEQ_SE_PL_BALLOON07, NNS_SND_ARC_LOAD_SEQ);    
        GF_Snd_LoadSeqEx(SEQ_SE_PL_ALERT4, NNS_SND_ARC_LOAD_SEQ);        

        GF_Snd_LoadSeqEx(SEQ_SE_DP_FW104, NNS_SND_ARC_LOAD_SEQ);    
        GF_Snd_LoadSeqEx(SEQ_SE_PL_NOMI02, NNS_SND_ARC_LOAD_SEQ);    
        GF_Snd_LoadSeqEx(SEQ_SE_DP_023, NNS_SND_ARC_LOAD_SEQ);        

        GF_Snd_LoadSeqEx(SEQ_SE_PL_POINT1, NNS_SND_ARC_LOAD_SEQ);    
        GF_Snd_LoadSeqEx(SEQ_SE_PL_POINT2, NNS_SND_ARC_LOAD_SEQ);    
        GF_Snd_LoadSeqEx(SEQ_SE_PL_POINT3, NNS_SND_ARC_LOAD_SEQ);    
        GF_Snd_LoadSeqEx(SEQ_SE_PL_BALLOON05_2, NNS_SND_ARC_LOAD_SEQ);    

        GF_Snd_LoadSeqEx(SEQ_SE_DP_HAMARU,    NNS_SND_ARC_LOAD_SEQ);    
        GF_Snd_LoadSeqEx(SEQ_SE_DP_CON_016,NNS_SND_ARC_LOAD_SEQ);    

        GF_Snd_LoadSeqEx(SEQ_SE_PL_KIRAKIRA, NNS_SND_ARC_LOAD_SEQ);    

        GF_Snd_LoadSeqEx(SEQ_SE_PL_FCALL, NNS_SND_ARC_LOAD_SEQ);    
        
        break;
    case SOUND_MAIN_ENDING:
        ret = GF_Snd_LoadGroup(GROUP_SE_POFFIN);    
        break;
    case SOUND_MAIN_OPENING:
    case SOUND_MAIN_EGG:
        ret = GF_Snd_LoadGroup(GROUP_SE_BATTLE);        //This is because battle scene sounds are needed!
        break;
    case SOUND_MAIN_WIFI_LOBBY_PLAZA:
        ret = GF_Snd_LoadBank(BANK_SE_PLAZA);        
        ret = GF_Snd_LoadWaveArc(WAVE_ARC_SE_PLAZA);    
        break;
    case SOUND_MAIN_TRADE:
        ret = GF_Snd_LoadGroup(GROUP_SE_TRADE);
        break;
    case SOUND_MAIN_FIELD:
    case SOUND_MAIN_DEMO01:
        ret = GF_Snd_LoadGroup(GROUP_SE_FIELD);
        break;
    case SOUND_MAIN_BATTLE:
        ret = GF_Snd_LoadGroup(GROUP_SE_BATTLE);
        break;
    case SOUND_MAIN_P2P:
        ret = GF_Snd_LoadGroup(GROUP_SE_FIELD);
        break;
    case SOUND_MAIN_CONTEST:
        ret = GF_Snd_LoadGroup(GROUP_SE_CONTEST);
        break;
    case SOUND_MAIN_HALL_OF_FAME:
        ret = GF_Snd_LoadGroup(GROUP_SE_FIELD);    
        break;
    case SOUND_MAIN_POFFIN:
        ret = GF_Snd_LoadGroup(GROUP_SE_POFFIN);
        break;
    case SOUND_MAIN_BCT:
        ret = GF_Snd_LoadGroup(GROUP_SE_FIELD);        
        ret = GF_Snd_LoadGroup(GROUP_SE_DIG);        
        break;
    case SOUND_MAIN_SPIN_TRADE:
        ret = GF_Snd_LoadGroup(GROUP_SE_FIELD);
        break;
    case SOUND_MAIN_THLON:
        GF_Snd_LoadBank(BANK_SE_THLON);
        ret = GF_Snd_LoadWaveArc(WAVE_ARC_SE_THLON);
        break;
    case SOUND_MAIN_THLON_OPED:
        GF_Snd_LoadBank(BANK_SE_THLON_OPED);
        ret = GF_Snd_LoadWaveArc(WAVE_ARC_SE_THLON_OPED);
        break;
    case SOUND_SUB_BAG:
        ret = GF_Snd_LoadGroup(GROUP_SE_BAG);
        break;
    case SOUND_SUB_SLOT:
        ret = GF_Snd_LoadGroup(GROUP_SE_SLOT);
        break;
    case SOUND_SUB_NAMEIN:
    case SOUND_SUB_UNK_67:
        ret = GF_Snd_LoadGroup(GROUP_SE_NAMEIN);
        break;
    case SOUND_MAIN_CON_IMAGE:
    case SOUND_SUB_IMAGE:
        ret = GF_Snd_LoadGroup(GROUP_SE_IMAGE);
        break;
    case SOUND_SUB_POKEDEX:
        ret = GF_Snd_LoadGroup(GROUP_SE_POKEDEX);
        break;
    case SOUND_SUB_TOWNMAP:
    case SOUND_SUB_FNOTE:
        ret = GF_Snd_LoadBank(BANK_SE_TOWNMAP);            
        ret = GF_Snd_LoadWaveArc(WAVE_ARC_SE_TOWNMAP);    
        break;
    case SOUND_SUB_TRCARD:
        ret = GF_Snd_LoadGroup(GROUP_SE_TRCARD);
        break;
    case SOUND_SUB_POKELIST:
        ret = GF_Snd_LoadGroup(GROUP_SE_POKELIST);
        break;
    case SOUND_SUB_DIG:
        ret = GF_Snd_LoadGroup(GROUP_SE_DIG);
        break;
    case SOUND_SUB_CUSTOM:
        ret = GF_Snd_LoadGroup(GROUP_SE_CUSTOM);
        break;
    case SOUND_SUB_CHOOSE_STARTER:
        ret = GF_Snd_LoadGroup(GROUP_SE_BAG);    
        break;
    case SOUND_SUB_PST:
        ret = GF_Snd_LoadGroup(GROUP_SE_NAMEIN);    
        break;
    case SOUND_SUB_PMS:
        ret = GF_Snd_LoadGroup(GROUP_SE_CUSTOM);
        break;
    case SOUND_SUB_CLIMAX:
        ret = GF_Snd_LoadGroup(GROUP_SE_CLIMAX);
        break;
    case SOUND_SUB_SCRATCH:
        ret = GF_Snd_LoadBank(BANK_SE_SCRATCH);    
        ret = GF_Snd_LoadWaveArc(WAVE_ARC_SE_SCRATCH);
        break;
    case SOUND_SUB_PLANTER:
        GF_Snd_LoadBank(BANK_SE_PLANTER);
        ret = GF_Snd_LoadWaveArc(WAVE_ARC_SE_PLANTER);
        break;
    case SOUND_SUB_LINEAR:
        GF_Snd_LoadBank(BANK_SE_LINEAR);
        ret = GF_Snd_LoadWaveArc(WAVE_ARC_SE_LINEAR);
        break;
    case SOUND_SUB_COIN:
        GF_Snd_LoadBank(BANK_SE_COIN);
        ret = GF_Snd_LoadWaveArc(WAVE_ARC_SE_COIN);
        break;
    case SOUND_SUB_HALL_OF_FAME:
        GF_Snd_LoadBank(BANK_SE_HALL_OF_FAME);
        ret = GF_Snd_LoadWaveArc(WAVE_ARC_SE_HALL_OF_FAME);
        break;
    case SOUND_SUB_JUICE:
        GF_Snd_LoadBank(BANK_SE_JUICE);
        ret = GF_Snd_LoadWaveArc(WAVE_ARC_SE_JUICE);
        break;
    case SOUND_SUB_PHC:
        GF_Snd_LoadBank(BANK_SE_PHC);
        ret = GF_Snd_LoadWaveArc(WAVE_ARC_SE_PHC);
        break;
    case SOUND_SUB_SEKIBAN:
        GF_Snd_LoadBank(BANK_SE_SEKIBAN);
        ret = GF_Snd_LoadWaveArc(WAVE_ARC_SE_SEKIBAN);
        break;
    case SOUND_SUB_EVENT:
        GF_Snd_LoadBank(BANK_SE_EVENT);
        ret = GF_Snd_LoadWaveArc(WAVE_ARC_SE_EVENT);
        break;
    default:
        GF_ASSERT(FALSE);
        ret = FALSE;
        break;
    }
    return ret;
}

BOOL sub_02004EB4(u16 unkA) {
    return Snd_SetDataByScene(SOUND_MAIN_FIELD, unkA, 1);
}

BOOL Snd_SetDataByScene(u8 scene, u16 no, int flag) {
    u8 *scene_main = GF_SdatGetAttrPtr(SOUND_WORK_SCENE_MAIN);
    u8 *scene_sub = GF_SdatGetAttrPtr(SOUND_WORK_SCENE_SUB);
    u16 *me_wait = GF_SdatGetAttrPtr(SOUND_WORK_ME_WAIT);

    if (scene < SOUND_SUB) {
        if (*scene_main == scene) {    
            return FALSE;
        }
    } else if (*scene_sub == scene) {
        return FALSE;    
    }

    Snd_SetScene(scene);

    switch (scene) {
    case SOUND_MAIN_FIELD:
        Snd_SetBGMAndReverb(0);    
        Snd_SetFieldData(no, flag);
        (*me_wait) = 0;    
        break;
    case SOUND_MAIN_BATTLE:
        Snd_SetBattleData(no, flag);
        break;
    case SOUND_MAIN_P2P:
        Snd_SetP2PData(no, flag);
        break;
    case SOUND_MAIN_CONTEST:
        Snd_SetContestData(no, flag);
        break;
    case SOUND_MAIN_CON_IMAGE:
        Snd_SetContestImageData(no, flag);
        break;
    case SOUND_SUB_BAG:
    case SOUND_SUB_NAMEIN:
    case SOUND_SUB_IMAGE:
    case SOUND_SUB_POKEDEX:
    case SOUND_SUB_TOWNMAP:
    case SOUND_SUB_TRCARD:
    case SOUND_SUB_POKELIST:
    case SOUND_SUB_DIG:
    case SOUND_SUB_CUSTOM:
    case SOUND_SUB_CHOOSE_STARTER:
    case SOUND_SUB_PST:
    case SOUND_SUB_PMS:
    case SOUND_SUB_CLIMAX:
    case SOUND_SUB_SLOT:
    case SOUND_SUB_FNOTE:
    case SOUND_SUB_SCRATCH:
    case SOUND_SUB_UNK_67:
    case SOUND_SUB_PLANTER:
    case SOUND_SUB_COIN:
    case SOUND_SUB_HALL_OF_FAME:
    case SOUND_SUB_JUICE:
    case SOUND_SUB_SEKIBAN:
        Snd_AddSceneData(scene);
        break;
    case SOUND_SUB_LINEAR:
        Snd_AddSceneData(scene);
        PlayBGM(no);
        break;
    case SOUND_MAIN_TITLE:
        Snd_SetBGMAndReverb(1);    
        Snd_SetDemoData(scene, no, flag);
        break;
    case SOUND_MAIN_ENDING:
        Snd_SetBGMAndReverb(2);    
        Snd_SetDemoData(scene, no, flag);
        break;
    case SOUND_MAIN_OPENING:
        Snd_SetBGMAndReverb(0);    
        Snd_SetDemoData(scene, no, flag);
        break;
    case SOUND_MAIN_TRADE:
    case SOUND_MAIN_HALL_OF_FAME:
    case SOUND_MAIN_AGB:
    case SOUND_MAIN_MYSTERY_GIFT:
    case SOUND_MAIN_POFFIN:
    case SOUND_MAIN_EGG:
    case SOUND_MAIN_SPIN_TRADE:
    case SOUND_MAIN_BCT:
    case SOUND_MAIN_EMAIL:
    case SOUND_MAIN_GIRA:
    case SOUND_MAIN_WIFI_LOBBY_GAME:
    case SOUND_MAIN_WIFI_LOBBY_PARADE:
    case SOUND_MAIN_WIFI_LOBBY_PLAZA:
    case SOUND_MAIN_WIFI_WORLD_TRADE:
    case SOUND_MAIN_THLON:
    case SOUND_MAIN_THLON_OPED:
    case SOUND_SUB_PHC:
        Snd_SetDemoData(scene, no, flag);
        break;
    case SOUND_MAIN_DEMO01:
        Snd_SetDemoData(scene, no, flag);
        break;
    default:
        return FALSE;
    }

    return TRUE;    
} 

static void Snd_SetSubData(u8 scene) {
    int *heap_save_global = GF_SdatGetAttrPtr(SOUND_WORK_HEAP_SAVE_GLOBAL);

    GF_Snd_LoadState(*heap_save_global); 

    GF_Snd_SaveState(GF_SdatGetAttrPtr(SOUND_WORK_HEAP_SAVE_BGM_BANK));   

    Snd_LoadGroupByScene(scene); 
    GF_Snd_SaveState(GF_SdatGetAttrPtr(SOUND_WORK_HEAP_SAVE_SE));   
}

static void Snd_SetFieldData(u16 no, int flag) {
    int temp;

    u8 *field_pause_flag = GF_SdatGetAttrPtr(SOUND_WORK_FIELD_PAUSE_FLAG);
    int *heap_save_global = GF_SdatGetAttrPtr(SOUND_WORK_HEAP_SAVE_GLOBAL);
    u16 *zone_bgm = GF_SdatGetAttrPtr(SOUND_WORK_MAP_MUSIC);

    temp = GF_SndPlayerGetSeqNo(GF_GetSoundHandle(SOUND_WORK_WAVEOUT_HANDLE_NORMAL));

    u16 player_seq_no = (u16) temp;

    if (temp > SEQ_GS_P_START) {
        player_seq_no = GBSounds_GetDSSeqNoByGBSeqNo(player_seq_no);
    }

    if (*field_pause_flag == 0) {
        if (player_seq_no == no) {
            if (Snd_GetNextBGM() != SEQ_GS_BICYCLE) { 
                return;
            }
        }
    }

    Snd_SetBankFlag(1);  

    if (_021D05E8.unkc == 0 || unk4 == 0) {
        sub_02005FD8();
        unk4 = 1;
    }                                    

    if (player_seq_no != no) {
        SndPause(PLAYER_FIELD, FALSE);      
        sub_02005FA0();
    }

    if (*field_pause_flag == 1) {

        GF_Snd_LoadState(Snd_GetSaveHeap(SOUND_SAVE_HEAP_BGM_BANK));

        Snd_LoadGroupByScene(SOUND_MAIN_FIELD);                     
        GF_Snd_SaveState(GF_SdatGetAttrPtr(SOUND_WORK_HEAP_SAVE_SE));  

        if (player_seq_no != no) {
            SndPause(PLAYER_FIELD, FALSE);              
        }

        Snd_SetFieldDataWithoutDelay(no, temp);
        return;
    }

    PlayBGM(no);
}

static void Snd_SetFieldDataWithoutDelay(u16 no, u16 unused) {
    u16 *zone_bgm = GF_SdatGetAttrPtr(SOUND_WORK_MAP_MUSIC);
    u32 tmp_bank_no = Snd_GetBank(*zone_bgm);   

    if (tmp_bank_no == BANK_BASIC) {
        GF_Snd_LoadSeqEx(no, NNS_SND_ARC_LOAD_WAVE);   
        GF_ASSERT(FALSE);
    } else {
        GF_Snd_LoadSeqEx(*zone_bgm, NNS_SND_ARC_LOAD_WAVE | NNS_SND_ARC_LOAD_BANK);
    }

    GF_Snd_SaveState(GF_SdatGetAttrPtr(SOUND_WORK_HEAP_SAVE_BGM));
    
    SndPause(PLAYER_FIELD, FALSE);               
    GF_SndStartFadeInBGM(VOLUME_MAX, 40, VOLUME_MIN);  

    Snd_SetBankFlag(SND_BANK_FLAG_CONTINUE);          
}  

void Snd_SetFieldSubData(u16 no, u16 old_bank_no) {
    u32 tmp_bank_no;
    u8 *bank_flag = GF_SdatGetAttrPtr(SOUND_WORK_BANK_FLAG);
    u16 *zone_bgm = GF_SdatGetAttrPtr(SOUND_WORK_MAP_MUSIC);

    if ((*bank_flag == SND_BANK_FLAG_CHANGE) || (old_bank_no == 0)) {
        GF_Snd_LoadState(Snd_GetSaveHeap(SOUND_SAVE_HEAP_GLOBAL));  

        Snd_SetSubscene(SOUND_MAIN_DUMMY);

        GF_Snd_LoadSeqEx(*zone_bgm, NNS_SND_ARC_LOAD_BANK);  
        GF_Snd_SaveState(GF_SdatGetAttrPtr(SOUND_WORK_HEAP_SAVE_BGM_BANK));
    
        Snd_LoadGroupByScene(SOUND_MAIN_FIELD); 
        GF_Snd_SaveState(GF_SdatGetAttrPtr(SOUND_WORK_HEAP_SAVE_SE));  

        tmp_bank_no = Snd_GetBank(*zone_bgm); 
        if ((tmp_bank_no == BANK_BASIC)) {
            GF_Snd_LoadSeqEx(no, NNS_SND_ARC_LOAD_WAVE);  
            GF_ASSERT(FALSE);
        } else {
            GF_Snd_LoadSeqEx(*zone_bgm, NNS_SND_ARC_LOAD_WAVE);  
        }
        GF_Snd_SaveState(GF_SdatGetAttrPtr(SOUND_WORK_HEAP_SAVE_BGM));
    }
}

static void Snd_SetBattleData(u16 no, int flag) {
    int *heap_save_global = GF_SdatGetAttrPtr(SOUND_WORK_HEAP_SAVE_GLOBAL);

    Snd_FieldPauseOrStop();

    GF_Snd_LoadState(Snd_GetSaveHeap(SOUND_SAVE_HEAP_BGM_BANK));  

    Snd_LoadGroupByScene(SOUND_MAIN_BATTLE);  
    GF_Snd_SaveState(GF_SdatGetAttrPtr(SOUND_WORK_HEAP_SAVE_SE));  

    Snd_SetBankFlag(SND_BANK_FLAG_CHANGE);     
    PlayBGM(no); 
}

static void Snd_SetP2PData(u16 no, int unused) {
    int *heap_save_global = GF_SdatGetAttrPtr(SOUND_WORK_HEAP_SAVE_GLOBAL);

    sub_02005FA0();   

    Snd_ClearPauseFlags();

    Snd_SetSubData(SOUND_MAIN_FIELD);

    PlayBGM(no);        
}

static void Snd_SetContestData(u16 no, int flag) {
    int *heap_save_global = GF_SdatGetAttrPtr(SOUND_WORK_HEAP_SAVE_GLOBAL);

    sub_02005FA0();  

    Snd_SetSubData(SOUND_MAIN_CONTEST);

    Snd_SetBankFlag(SND_BANK_FLAG_CHANGE);  
    PlayBGM(no);    
}

static void Snd_SetContestImageData(u16 no, int flag) {
    int *heap_save_global = GF_SdatGetAttrPtr(SOUND_WORK_HEAP_SAVE_GLOBAL);

    sub_02005FA0(); 

    Snd_SetSubData(SOUND_MAIN_CON_IMAGE);

    Snd_SetBankFlag(SND_BANK_FLAG_CHANGE); 
    PlayBGM(no); 
}

static void Snd_AddSceneData(u8 scene) {
    Snd_ClearBGMHeap();
    Snd_LoadGroupByScene(scene);  
    GF_Snd_SaveState(GF_SdatGetAttrPtr(SOUND_WORK_HEAP_SAVE_SUB_SE));
}

static void Snd_SetDemoData(u8 scene, u16 bgm, int flag) {
    int *heap_save_global = GF_SdatGetAttrPtr(SOUND_WORK_HEAP_SAVE_GLOBAL);

    sub_02005FA0(); 
    Snd_SetSubData(scene);
    PlayBGM(bgm); 
}

void BGM_SaveStateAndPlayBGM(u16 no) {
    SND_WORK *wk = GetSoundDataPointer();

    Snd_FieldPauseOrStop();
    
    PlayBGM(no);    
}

void Snd_ClearBGMHeap(void) {
    GF_Snd_LoadState(Snd_GetSaveHeap(SOUND_SAVE_HEAP_BGM));
}

int Snd_GetSaveHeap(int type) {
    SND_WORK *work = GetSoundDataPointer();
    int *heap_save;

    if (type >= SOUND_SAVE_HEAP_MAX) {
        GF_ASSERT(FALSE);
        heap_save = GF_SdatGetAttrPtr(SOUND_WORK_HEAP_SAVE_BGM);
        return *heap_save;
    }

    switch (type) {
    case SOUND_SAVE_HEAP_START:
        heap_save = GF_SdatGetAttrPtr(SOUND_WORK_HEAP_SAVE_START);
        break;
    case SOUND_SAVE_HEAP_GLOBAL:
        heap_save = GF_SdatGetAttrPtr(SOUND_WORK_HEAP_SAVE_GLOBAL);
        break;
    case SOUND_SAVE_HEAP_BGM_BANK:
        heap_save = GF_SdatGetAttrPtr(SOUND_WORK_HEAP_SAVE_BGM_BANK);
        break;
    case SOUND_SAVE_HEAP_SE:
        heap_save = GF_SdatGetAttrPtr(SOUND_WORK_HEAP_SAVE_SE);
        break;
    case SOUND_SAVE_HEAP_BGM:
        heap_save = GF_SdatGetAttrPtr(SOUND_WORK_HEAP_SAVE_BGM);
        break;
    case SOUND_SAVE_HEAP_SUB_SE:
        heap_save = GF_SdatGetAttrPtr(SOUND_WORK_HEAP_SAVE_SUB_SE);
        break;
    case SOUND_SAVE_HEAP_ME:
        heap_save = GF_SdatGetAttrPtr(SOUND_WORK_HEAP_SAVE_ME);
        break;
    }
    return *heap_save;
}

void SndPause(u8 player, BOOL flag) {
    u8 handle_no;
    u8 *pause_flag;

    if (player == PLAYER_FIELD) {
        pause_flag = GF_SdatGetAttrPtr(SOUND_WORK_FIELD_PAUSE_FLAG);
        handle_no = SND_HANDLE_FIELD;
    } else if (player == PLAYER_BGM) {
        pause_flag = GF_SdatGetAttrPtr(SOUND_WORK_BGM_PAUSE_FLAG);
        handle_no = SND_HANDLE_BGM;
    } else {
        return;
    }
    
    if (flag == FALSE) {
        Snd_SetCurrentlyPlayingBGM(GF_SndPlayerGetSeqNo(GF_GetSoundHandle(handle_no)));
    }

    NNS_SndPlayerPause(GF_GetSoundHandle(handle_no), flag);
    *pause_flag = flag;  
}

void Snd_ClearPauseFlags() {
    u8 *field_pause_flag = GF_SdatGetAttrPtr(SOUND_WORK_FIELD_PAUSE_FLAG);
    u8 *bgm_pause_flag = GF_SdatGetAttrPtr(SOUND_WORK_BGM_PAUSE_FLAG);
    *field_pause_flag = 0;
    *bgm_pause_flag = 0;
}

void Snd_HandleMoveVolume(u8 handle_no, int target_volume, int frames) {
    NNS_SndPlayerMoveVolume(GF_GetSoundHandle(handle_no), target_volume, frames);
    if (handle_no == SND_HANDLE_FIELD) {
        GF_SndWorkSetGbSoundsVolume(target_volume);
    }
}

void Snd_HandleSetInitialVolume(int handle_no, int vol) {
    if (vol < VOLUME_MIN) {
        vol = VOLUME_MIN;
    }
    if (vol > VOLUME_MAX) {
        vol = VOLUME_MAX;
    }

    NNS_SndPlayerSetInitialVolume(GF_GetSoundHandle(handle_no), vol);
}

void Snd_SetVChatVolBySeqNo(int seq_no) {
    u8 player_no = Snd_GetPlayerNo(seq_no);  
    int type = GF_GetSndHandleByPlayerNo(player_no); 
    Snd_SetVChatVol(seq_no, type);
}

void Snd_SetVChatVol(int seq_no, int handle_no) {
    u8 vol;
    const NNSSndSeqParam *p = NNS_SndArcGetSeqParam(seq_no);

    switch (handle_no) {
    case SND_HANDLE_CRY:
    case SND_HANDLE_CHORUS:
        vol = VOLUME_MAX;
        break;
    default:
        if (p == NULL) {
            return;
        }
        vol = p->volume;
        break;
    }

    if (sub_020378CC() == TRUE) {
        Snd_HandleSetInitialVolume(handle_no, (vol / SND_VCHAT_VOL_LV));
    }
}

u8 Snd_GetVol(int seq_no) {
    NNSSndSeqParam *param = NNS_SndArcGetSeqParam(seq_no);
    if (param == 0) {
        return 0;
    }
    return param->volume;
}

void Snd_SetVol(u16 seq_no, int vol) {
    u8 player_no = Snd_GetPlayerNo(seq_no); 
    int type = GF_GetSndHandleByPlayerNo(player_no);
    Snd_HandleSetInitialVolume(type, vol);
}

int GF_SndPlayerCountPlayingSeqByPlayerNo(int player_no) {
    if (player_no < 0) {
        GF_ASSERT(FALSE);
    }
    return NNS_SndPlayerCountPlayingSeqByPlayerNo(player_no);
}

u8 Snd_GetPlayerNo(u16 no) {
    const NNSSndSeqParam *param;
    if (no == 0) {
        return 0xff; 
    }

    param = NNS_SndArcGetSeqParam(no);

    if (param == NULL) {
        return 0xff;
    }

    return param->playerNo;
}

int GF_SndPlayerGetSeqNo(int player_no) {
    return NNS_SndPlayerGetSeqNo(player_no);
}

const NNSSndArcBankInfo *Snd_GetBankInfo(int no) {
    return NNS_SndArcGetBankInfo(Snd_GetBank(no));
}

u16 Snd_GetBank(int no) {
    const NNSSndSeqParam *param;
    
    param = NNS_SndArcGetSeqParam(no);
    if (param == NULL) {
        return 0;
    }
    return param->bankNo;
}

BOOL IsWorkMicCounterFull(void) {
    return GF_IsWorkMicCounterFull();
}

MICResult GF_MicStartAutoSampling(MICAutoParam *p) {
    MICResult ret = MIC_StartAutoSampling(p);

    auto_sample_flag = 1;

    _021D05F8 = *p;

    return ret;
}

MICResult GF_MicStopAutoSampling(void) {
    MICResult ret;
    SND_WORK *wk = GetSoundDataPointer();

    auto_sample_flag = 0;

    MIC_StopAutoSampling();
}

void MicPauseOnLidClose(void) {
    if (auto_sample_flag) {
        if (MIC_StopAutoSampling()) {
            GF_ASSERT(FALSE);
        }
    }
}

void MicResumeOnLidOpen(void) {
    if (auto_sample_flag) {
        if (MIC_StartAutoSampling(&_021D05F8)) {
            GF_ASSERT(FALSE);
        }
    }
    GF_SndWorkMicCounterReset();
}

NNSSndWaveOutHandle *GetWaveoutHandle(u32 no) {
    SND_WORK *wk = GetSoundDataPointer();
    u8 *ch_normal_flag = GF_SdatGetAttrPtr(SOUND_WORK_WAVEOUT_CH_NORMAL_FLAG);
    u8 *ch_chorus_flag = GF_SdatGetAttrPtr(SOUND_WORK_WAVEOUT_CH_CHORUS_FLAG);

    if ((no != WAVEOUT_CHANNEL_NORMAL) && (no != WAVEOUT_CHANNEL_CHORUS)) {
        GF_ASSERT(FALSE);
    }

    if ((no == WAVEOUT_CHANNEL_NORMAL) && (*ch_normal_flag == 0)) {   
        GF_ASSERT(FALSE);
    }

    if ((no == WAVEOUT_CHANNEL_CHORUS) && (*ch_chorus_flag == 0)) {  
        GF_ASSERT(FALSE);
    }

    if (no == WAVEOUT_CHANNEL_NORMAL) {
        return GF_SdatGetAttrPtr(SOUND_WORK_WAVEOUT_HANDLE_NORMAL);
    } else {
        return GF_SdatGetAttrPtr(SOUND_WORK_WAVEOUT_HANDLE_CHORUS);
    }
}

BOOL AllocWaveoutChannel(u32 no) {
    u8 *ch_normal_flag;
    u8 *ch_chorus_flag;
    NNSSndWaveOutHandle *wave_handle;
    SND_WORK *wk = GetSoundDataPointer();

    ch_normal_flag = GF_SdatGetAttrPtr(SOUND_WORK_WAVEOUT_CH_NORMAL_FLAG);
    ch_chorus_flag = GF_SdatGetAttrPtr(SOUND_WORK_WAVEOUT_CH_CHORUS_FLAG);

    if ((no != WAVEOUT_CHANNEL_NORMAL) && (no != WAVEOUT_CHANNEL_CHORUS)) {
        GF_ASSERT(FALSE);
    }
    if (no == WAVEOUT_CHANNEL_NORMAL) {
        if (*ch_normal_flag == 0) { 
            wave_handle = GF_SdatGetAttrPtr(SOUND_WORK_WAVEOUT_HANDLE_NORMAL);
            *wave_handle = NNS_SndWaveOutAllocChannel(no);  

            if (*wave_handle == NNS_SND_WAVEOUT_INVALID_HANDLE) {
                return FALSE;  
            }
            *ch_normal_flag = 1; 
        } else {
            GF_ASSERT(FALSE);
        }
    } else {
        if (*ch_chorus_flag == 0) { 
            wave_handle = GF_SdatGetAttrPtr(SOUND_WORK_WAVEOUT_HANDLE_CHORUS);
            *wave_handle = NNS_SndWaveOutAllocChannel(no); 
            if (*wave_handle == NNS_SND_WAVEOUT_INVALID_HANDLE) {
                return FALSE; 
            }
            *ch_chorus_flag = 1;   
        } else {
            GF_ASSERT(FALSE);
        }
    }

    return TRUE;
}

void FreeWaveoutChannel(u32 no) {
    NNSSndWaveOutHandle *wave_handle;
    SND_WORK *wk = GetSoundDataPointer();
    u8 *ch_normal_flag = GF_SdatGetAttrPtr(SOUND_WORK_WAVEOUT_CH_NORMAL_FLAG);
    u8 *ch_chorus_flag = GF_SdatGetAttrPtr(SOUND_WORK_WAVEOUT_CH_CHORUS_FLAG);

    if ((no != WAVEOUT_CHANNEL_NORMAL) && (no != WAVEOUT_CHANNEL_CHORUS)) {
        GF_ASSERT(FALSE);
        return;
    }

    if (no == WAVEOUT_CHANNEL_NORMAL) {
        if (*ch_normal_flag == 1) {  
            wave_handle = GetWaveoutHandle(no);
            NNS_SndWaveOutFreeChannel(*wave_handle);
            *ch_normal_flag = 0; 

        } else {
            GF_ASSERT(FALSE);
        }
    } else {
        if (*ch_chorus_flag == 1) {  
            wave_handle = GetWaveoutHandle(no);
            NNS_SndWaveOutFreeChannel(*wave_handle);
            *ch_chorus_flag = 0; 

        } else {
            GF_ASSERT(FALSE);
        }
    }

    return;
}

BOOL WaveoutStart(WAVEOUT_WORK *p, u32 ch) {
    int ret;
    ret = NNS_SndWaveOutStart(*p->handle, p->format, p->dataaddr, p->loopFlag, p->loopStartSample,
                                p->samples, p->sampleRate, p->volume, p->speed, p->pan);

    if (ret == FALSE) {
        FreeWaveoutChannel(ch);
    }

    return ret;
}

void WaveoutStop(u32 no) {
    NNS_SndWaveOutStop(*GetWaveoutHandle(no));
    return;
}

BOOL WaveoutIsPlaying(u32 no) {
    return NNS_SndWaveOutIsPlaying(*GetWaveoutHandle(no));
}

void SetWaveoutPan(u32 no, u8 pan) {
    u8 set_pan;

    if (pan > 127) {
        set_pan = 127;
    } else {
        set_pan = pan;
    }

    NNS_SndWaveOutSetPan(*GetWaveoutHandle(no), set_pan);
}

void SetWaveoutSpeed(u32 no, u32 spd) {
    NNS_SndWaveOutSetSpeed(*GetWaveoutHandle(no), spd);
}

void SetWaveoutVol(u32 no, int vol) {
    if (sub_020378CC() == TRUE) {
        NNS_SndWaveOutSetVolume(*GetWaveoutHandle(no), (vol/SND_VCHAT_VOL_LV)); 
    } else {
        NNS_SndWaveOutSetVolume(*GetWaveoutHandle(no), vol);
    }
}

BOOL WaveoutStartReverse(u16 no, int vol, int pan, u32 ch, int heap_id) {
    u8 *reverse_flag;
    const NNSSndArcWaveArcInfo *info;
    u32 size;
    int size2,ret;
    SND_WORK *wk = GetSoundDataPointer();
    void* *reverse_buf = GF_SdatGetAttrPtr(SOUND_WORK_REVERSE_BUF);

    if ((ch != WAVEOUT_CHANNEL_NORMAL) && (ch != WAVEOUT_CHANNEL_CHORUS)) {
        GF_ASSERT(FALSE);
    }

    info = NNS_SndArcGetWaveArcInfo(no);
    if (info == NULL) {
        GF_ASSERT(FALSE);
        return FALSE;
    }

    size = NNS_SndArcGetFileSize(info->fileId);
    if (size == 0) {
        GF_ASSERT(FALSE);
        return FALSE;
    }

    if (ch == WAVEOUT_CHANNEL_NORMAL) {
        *reverse_buf = AllocFromHeap(heap_id, size);
        if (*reverse_buf == NULL) {
            GF_ASSERT(FALSE);
            return FALSE;
        }
        memset(*reverse_buf, 0, size);

        size2 = NNS_SndArcReadFile(info->fileId, *reverse_buf, size, 0);
        if (size2 == -1) {
            GF_ASSERT(FALSE);
            return FALSE;
        }
        Snd_ReverseBuffer(*reverse_buf, size);
    }

    {
        WAVEOUT_WORK waveout_wk;
        waveout_wk.handle = GetWaveoutHandle(ch);  
        waveout_wk.format = NNS_SND_WAVE_FORMAT_PCM8;  
        waveout_wk.dataaddr = *reverse_buf;        
        waveout_wk.loopFlag = FALSE;               
        waveout_wk.loopStartSample = 0;           
        waveout_wk.samples = size;                 
        waveout_wk.sampleRate = 13379;     
        waveout_wk.volume = vol;                
        waveout_wk.speed = 24576;             
        waveout_wk.pan = pan;         

        ret = WaveoutStart(&waveout_wk, ch);

        SetWaveoutVol(ch, vol);
    }

    reverse_flag = GF_SdatGetAttrPtr(SOUND_WORK_REVERSE_FLAG);
    *reverse_flag = 1;

    return ret;
}

static void Snd_ReverseBuffer(u8 *p, u32 size) {
    int i;
    u8 temp;

    for (i = 0; i < (size / 2); i++) {
        temp = p[i];    
        p[i] = p[size-1-i];
        p[size-1-i] = temp;
    }
}

void WaveoutStopReverse(u32 no) {
    SND_WORK *wk = GetSoundDataPointer();
    u8 *reverse_flag = GF_SdatGetAttrPtr(SOUND_WORK_REVERSE_FLAG);
    void* *reverse_buf = GF_SdatGetAttrPtr(SOUND_WORK_REVERSE_BUF);

    if ((no != WAVEOUT_CHANNEL_NORMAL) && (no != WAVEOUT_CHANNEL_CHORUS)) {
        GF_ASSERT(FALSE);
    }

    WaveoutStop(no);          

    if (*reverse_flag == 1) {     
        *reverse_flag = 0; 
        FreeToHeap(*reverse_buf);   
    }
}

static BOOL Snd_CaptureIsActive(void) {
    BOOL active = NNS_SndCaptureIsActive();
    if (active == TRUE) {
        GF_SndCaptureGetCaptureType();
    }
    return active;
}


static NNSSndCaptureType GF_SndCaptureGetCaptureType(void) {
    return NNS_SndCaptureGetCaptureType();
}

static void GF_SndCaptureStopReverb(int frame) {
    NNS_SndCaptureStopReverb(frame);
}

void GF_SndHandleSetTrackPitch(int handle_no, u16 bitmask, int pitch) {
    NNS_SndPlayerSetTrackPitch(GF_GetSoundHandle(handle_no), bitmask, pitch);
}

void Snd_SetHandleTrack(u16 no, u16 bitmask, int pitch) {
    u8 player_no = Snd_GetPlayerNo(no); 
    int type = GF_GetSndHandleByPlayerNo(player_no);
    GF_SndHandleSetTrackPitch(type, bitmask, pitch);
}

void GF_SetHandleTrackByPlayerNo(u8 player_no, u16 bitmask, int pitch) {
    int type = GF_GetSndHandleByPlayerNo(player_no);
    GF_SndHandleSetTrackPitch(type, bitmask, pitch);
}

void Snd_SetHandleTrackPan(int handle_no, u16 bitmask, int pan) {
    NNS_SndPlayerSetTrackPan(GF_GetSoundHandle(handle_no), bitmask, pan);
}

void GF_SndHandleSetTempoRatio(int handle_no, int tempo) {
    NNS_SndPlayerSetTempoRatio(GF_GetSoundHandle(handle_no), tempo);
}

void GF_SndSetMonoFlag(BOOL flag) {
    NNS_SndSetMonoFlag(flag);
    _021D05E8.mono_flag = flag;
}

void Snd_SetFadeCount(int frame) {
    int *fade_count = GF_SdatGetAttrPtr(SOUND_WORK_FADE_COUNT);
    *fade_count = frame;
}

static void Snd_SetNextWait(int frame) {
    int *next_wait = GF_SdatGetAttrPtr(SOUND_WORK_NEXT_WAIT);
    *next_wait = frame;
}

int Snd_GetAfterFadeDelayTimer(void) {
    u16 *next_wait = GF_SdatGetAttrPtr(SOUND_WORK_NEXT_WAIT);

    if (*next_wait <= 0) {
        *next_wait = 0;
        return 0;
    }

    (*next_wait)--;
    return *next_wait;
}

void GF_SndSetMasterVolume(int vol) {
    NNS_SndSetMasterVolume(vol);
}

s8 *Snd_GetWaveBufferAdrs(void) {
    return sWaveBuffer;
}

void Snd_SetBankFlag(int flag) {
    *(u8 *)GF_SdatGetAttrPtr(SOUND_WORK_BANK_FLAG) = flag;
}

BOOL StartMusic(u16 no, int frame, int next_wait, u8 flag, void *adrs) {
    return MusicFadeOutAndPlayNext(SOUND_WORK_CALLBACK_INFO, no, frame, next_wait, flag, adrs);
}

static BOOL MusicFadeOutAndPlayNext(u8 scene, u16 no, int frame, int next_wait, u8 flag, void *adrs) {
    u8 *scene_sub = GF_SdatGetAttrPtr(SOUND_WORK_SCENE_SUB);

    SetFadeCommon(scene, no, frame, next_wait, flag, adrs);

    *scene_sub = SOUND_MAIN_DUMMY;

    GF_SndSetState(5);
    return TRUE;
}

BOOL StartFadeInMusic(u16 no, int frame, int next_wait, int next_frame, u8 flag, void *adrs) {
    return MusicFadeOutAndFadeInNext(4, no, frame, next_wait, next_frame, flag, adrs);
}

BOOL MusicFadeOutAndFadeInNext(u8 scene, u16 no, int frame, int next_wait, int next_frame, u8 flag, void *adrs) {
    int *next_frame_wk = GF_SdatGetAttrPtr(SOUND_WORK_NEXT_FRAME);

    SetFadeCommon(scene, no, frame, next_wait, flag, adrs);
    
    *next_frame_wk = next_frame;  

    GF_SndSetState(6); 
    return TRUE;
}

static void SetFadeCommon(u8 scene, u16 no, int frame, int next_wait, u8 flag, void *adrs) {
    const NNSSndArcBankInfo* *info = GF_SdatGetAttrPtr(SOUND_WORK_BANK_INFO);

    GF_SndStartFadeOutBGM(VOLUME_MIN, frame); 

    Snd_SetCurrentlyPlayingBGM(0);   

    Snd_SetNextBGM(no);    
    Snd_SetNextWait(next_wait);       

    *info = Snd_GetBankInfo(no); 

    Snd_SetBankFlag(flag);
}

static void GF_SndSetAllocatableChannelForBGMPlayer(int channel) {
    NNS_SndPlayerSetAllocatableChannel(7, channel);
}

void Snd_SetBGMAndReverb(int flag) {
    if (flag == 0) {
        GF_SndSetAllocatableChannelForBGMPlayer(BGM_CHANNEL_NORMAL);
        GF_SndCaptureStopReverb(0);
    } else {
        GF_SndSetAllocatableChannelForBGMPlayer(0x00003FFF);
    }
    Snd_CaptureIsActive();
}

static void Snd_FieldPauseOrStop(void) {
    if ((GF_SndGetFadeTimer() == 0) && 
        (GF_SndPlayerGetSeqNo(GF_GetSoundHandle(SND_HANDLE_FIELD)) != -1)) {
        sub_02005FD8(); 
        SndPause(PLAYER_FIELD, TRUE);  
    } else {
        sub_02005FA0();                                
    }
}

void GF_SndHandleSetPlayerVolume(int player_no, int vol) {
    NNS_SndPlayerSetPlayerVolume(player_no, vol);
}

void Snd_SetPVDoubleFlag(u8 flag) {
    *(u8 *)GF_SdatGetAttrPtr(SOUND_WORK_CRY_DOUBLE_FLAG) = flag;
}

void Snd_SetBattleRecFlag(u8 flag) {
    *(u8 *)GF_SdatGetAttrPtr(SOUND_WORK_BATTLE_REC_FLAG) = flag;
}

BOOL Snd_ReadPlayerVariable(u16 seq_no, u16 varNo, s16 *var) {
    if (var == NULL) {
        GF_ASSERT(FALSE);
    }
    if (varNo > 15) {
        GF_ASSERT(FALSE);
    }
    int player_no = Snd_GetPlayerNo(seq_no);
    int type = GF_GetSndHandleByPlayerNo(player_no);
    return NNS_SndPlayerReadVariable(GF_GetSoundHandle(type), varNo, var);
}

void sub_02005BA8(u16 no) {
    u8 *index = (u8 *)GF_SdatGetAttrPtr(SOUND_WORK_UNK_55);
    Snd_SetVol(no, _020F5710[*index][1]);
    GF_SndHandleSetTrackPitch(4, 0x0000FFFF, _020F5710[*index][0]);
    if (index[1] >= 8) {
        index[1] = 0;
    }
}

void Snd_SetUNK_56(u8 unk) {
    *(u8 *)GF_SdatGetAttrPtr(SOUND_WORK_UNK_56) = unk;
}

u8 Snd_GetUNK_56(void) {
    return *(u8 *)GF_SdatGetAttrPtr(SOUND_WORK_UNK_56);
}

static void Snd_SetGBSoundsState(u8 val) {
    *(u8 *)GF_SdatGetAttrPtr(SOUND_WORK_UNK_57) = val;
}

u8 SoundSys_GetGBSoundsState(void) {
    return *(u8 *)GF_SdatGetAttrPtr(SOUND_WORK_UNK_57);
}

void SoundSys_ToggleGBSounds(void) {
    u8 state = SoundSys_GetGBSoundsState();
    if (state == 0) {
        Snd_SetGBSoundsState(1);
    } else {
        Snd_SetGBSoundsState(0);
    }
    if (Snd_GetNextBGM() == 0) {
        u16 bgm = Snd_GetCurrentlyPlayingBGM();
        int vol = GF_SndWorkGetGbSoundsVolume();
        if (bgm != GBSounds_GetGBSeqNoByDSSeqNo(bgm)) {
            PlayBGM(bgm);
        }
        Snd_HandleMoveVolume(0, vol, 0);
    }
}

u16 GBSounds_GetGBSeqNoByDSSeqNo(u16 seq_no) {
    u16 c;
    for (c = 0; c < 136; c++) {
        if (seq_no == GS_SeqPairs[c][0]) {
            return GS_SeqPairs[c][1];
        }
    }
    return seq_no;
}

static u16 GBSounds_GetDSSeqNoByGBSeqNo(u16 seq_no) {
    u16 c;
    for (c = 0; c < 136; c++) {
        if (seq_no == GS_SeqPairs[c][1]) {
            return GS_SeqPairs[c][0];
        }
    }
    return seq_no;
}

void GBSounds_SetAllocatableChannels(void) {
    NNS_SndPlayerSetTrackAllocatableChannel(GF_GetSoundHandle(0), 15, 43006);
    NNS_SndPlayerSetTrackAllocatableChannel(GF_GetSoundHandle(7), 15, 43006);
    NNS_SndPlayerSetTrackAllocatableChannel(GF_GetSoundHandle(2), 15, 43006);
}

void sub_02005CF4(u32 unkA) {
    _021D05E8.unkc = unkA;
}

void sub_02005D00(void) {
    _021D05E8.unkc = 0;
    unk4 = 0;
}
