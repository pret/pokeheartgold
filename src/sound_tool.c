#include "constants/snd_misc.h"
#include "constants/snd_system.h"
#include "constants/snd_def.h"
#include "sound.h"
#include "sound_tool.h"

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

extern u8 _020F5710[8][4];

extern volatile u16 GS_SeqPairs[136][2];

void GF_SetCtrlBgmFlag(u8 flag) {
    *(u8*) GF_SdatGetAttrPtr(SND_W_ID_CTRL_BGM_FLAG) = flag;
}

u8 GF_GetCntrlBgmFlag(void) {
    return *(u8*) GF_SdatGetAttrPtr(SND_W_ID_CTRL_BGM_FLAG);
}

void GF_SetCurrentPlayingBGM(u16 no) {
    u16* cur_bgm = (u16*) GF_SdatGetAttrPtr(SND_W_ID_CUR_BGM_NO);
    if (no > SEQ_GS_P_START) {
        GF_SetUNK_58(no);
        *cur_bgm = GBSounds_GetDSSeqNoByGBSeqNo(no);
    }
    else {
        *cur_bgm = no;
    }
    GF_SetNextBGM(0);
}

u16 GF_GetCurrentPlayingBGM(void) {
    return *(u16*) GF_SdatGetAttrPtr(SND_W_ID_CUR_BGM_NO);
}

void GF_SetNextBGM(u16 no) {
    *(u16*) GF_SdatGetAttrPtr(SND_W_ID_NEXT_BGM_NO) = no;
}

u16 GF_GetNextBGM(void) {
    return *(u16*) GF_SdatGetAttrPtr(SND_W_ID_NEXT_BGM_NO);
}

void GF_SetUNK_58(u16 unkA) {
    *(u16*) GF_SdatGetAttrPtr(SND_W_ID_UNK_58) = unkA;
}

void GF_SetZoneBGM(u16 unkA) {
    *(u16*) GF_SdatGetAttrPtr(SND_W_ID_ZONE_BGM) = unkA;
}

void GF_SetSndScene(u8 scene) {
    u8* scene_main = (u8*) GF_SdatGetAttrPtr(SND_W_ID_SCENE_MAIN);
    u8* scene_sub = (u8*) GF_SdatGetAttrPtr(SND_W_ID_SCENE_SUB);
    if (scene < SND_SCENE_SUB) {
        *scene_main = scene;
        *scene_sub = SND_SCENE_DUMMY;
        return;
    }
    *scene_sub = scene;
}

void GF_SetSndSubScene(u8 scene) {
    GF_SdatGetAttrPtr(SND_W_ID_SCENE_MAIN);
    *(u8*) GF_SdatGetAttrPtr(SND_W_ID_SCENE_SUB) = scene;
}

void GF_ClearHeapAndSndSubScene(void) {
    u8* sub = GF_SdatGetAttrPtr(SND_W_ID_SCENE_SUB);
    GF_ClearHeap();
    *sub = 0;
}

int GF_Snd_LoadGroupByScene(u8 scene) {
    int ret;
    switch (scene) {
    case SND_SCENE_TITLE:
    case SND_SCENE_AGB:
    case SND_SCENE_MYSTERY_GIFT:
    case SND_SCENE_EMAIL:
    case SND_SCENE_WIFI_LOBBY_PARADE:
    case SND_SCENE_WIFI_WORLD_TRADE:
        ret = GF_Snd_LoadGroup(GROUP_SE_FIELD);
        break;
    case SND_SCENE_WIFI_LOBBY_GAME:
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
    case SND_SCENE_ENDING:
        ret = GF_Snd_LoadGroup(GROUP_SE_NUTMIXER);    
        break;
    case SND_SCENE_OPENING:
    case SND_SCENE_EGG:
        ret = GF_Snd_LoadGroup(GROUP_SE_BATTLE);        //This is because battle scene sounds are needed!
        break;
    case SND_SCENE_WIFI_LOBBY_HIROBA:
        ret = GF_Snd_LoadBank(BANK_SE_HIROBA);        
        ret = GF_Snd_LoadWaveArc(WAVE_ARC_SE_HIROBA);    
        break;
    case SND_SCENE_TRADE:
        ret = GF_Snd_LoadGroup(GROUP_SE_TRADE);
        break;
    case SND_SCENE_FIELD:
    case SND_SCENE_DEMO01:
        ret = GF_Snd_LoadGroup(GROUP_SE_FIELD);
        break;
    case SND_SCENE_BATTLE:
        ret = GF_Snd_LoadGroup(GROUP_SE_BATTLE);
        break;
    case SND_SCENE_P2P:
        ret = GF_Snd_LoadGroup(GROUP_SE_FIELD);
        break;
    case SND_SCENE_CONTEST:
        ret = GF_Snd_LoadGroup(GROUP_SE_CONTEST);
        break;
    case SND_SCENE_HALL_OF_FAME:
        ret = GF_Snd_LoadGroup(GROUP_SE_FIELD);    
        break;
    case SND_SCENE_NUTMIXER:
        ret = GF_Snd_LoadGroup(GROUP_SE_NUTMIXER);
        break;
    case SND_SCENE_BCT:
        ret = GF_Snd_LoadGroup(GROUP_SE_FIELD);        
        ret = GF_Snd_LoadGroup(GROUP_SE_DIG);        
        break;
    case SND_SCENE_SPIN_TRADE:
        ret = GF_Snd_LoadGroup(GROUP_SE_FIELD);
        break;
    case SND_SCENE_THLON:
        GF_Snd_LoadBank(BANK_SE_THLON);
        ret = GF_Snd_LoadWaveArc(WAVE_ARC_SE_THLON);
        break;
    case SND_SCENE_THLON_OPED:
        GF_Snd_LoadBank(BANK_SE_THLON_OPED);
        ret = GF_Snd_LoadWaveArc(WAVE_ARC_SE_THLON_OPED);
        break;
    case SND_SCENE_SUB_BAG:
        ret = GF_Snd_LoadGroup(GROUP_SE_BAG);
        break;
    case SND_SCENE_SUB_SLOT:
        ret = GF_Snd_LoadGroup(GROUP_SE_SLOT);
        break;
    case SND_SCENE_SUB_NAMEIN:
    case SND_SCENE_SUB_UNK_67:
        ret = GF_Snd_LoadGroup(GROUP_SE_NAMEIN);
        break;
    case SND_SCENE_CON_IMAGE:
    case SND_SCENE_SUB_IMAGE:
        ret = GF_Snd_LoadGroup(GROUP_SE_IMAGE);
        break;
    case SND_SCENE_SUB_ZUKAN:
        ret = GF_Snd_LoadGroup(GROUP_SE_ZUKAN);
        break;
    case SND_SCENE_SUB_TOWNMAP:
    case SND_SCENE_SUB_FNOTE:
        ret = GF_Snd_LoadBank(BANK_SE_TOWNMAP);            
        ret = GF_Snd_LoadWaveArc(WAVE_ARC_SE_TOWNMAP);    
        break;
    case SND_SCENE_SUB_TRCARD:
        ret = GF_Snd_LoadGroup(GROUP_SE_TRCARD);
        break;
    case SND_SCENE_SUB_POKELIST:
        ret = GF_Snd_LoadGroup(GROUP_SE_POKELIST);
        break;
    case SND_SCENE_SUB_DIG:
        ret = GF_Snd_LoadGroup(GROUP_SE_DIG);
        break;
    case SND_SCENE_SUB_CUSTOM:
        ret = GF_Snd_LoadGroup(GROUP_SE_CUSTOM);
        break;
    case SND_SCENE_SUB_FIRSTPOKE:
        ret = GF_Snd_LoadGroup(GROUP_SE_BAG);    
        break;
    case SND_SCENE_SUB_PST:
        ret = GF_Snd_LoadGroup(GROUP_SE_NAMEIN);    
        break;
    case SND_SCENE_SUB_PMS:
        ret = GF_Snd_LoadGroup(GROUP_SE_CUSTOM);
        break;
    case SND_SCENE_SUB_CLIMAX:
        ret = GF_Snd_LoadGroup(GROUP_SE_CLIMAX);
        break;
    case SND_SCENE_SUB_SCRATCH:
        ret = GF_Snd_LoadBank(BANK_SE_SCRATCH);    
        ret = GF_Snd_LoadWaveArc(WAVE_ARC_SE_SCRATCH);
        break;
    case SND_SCENE_SUB_PLANTER:
        GF_Snd_LoadBank(BANK_SE_PLANTER);
        ret = GF_Snd_LoadWaveArc(WAVE_ARC_SE_PLANTER);
        break;
    case SND_SCENE_SUB_LINEAR:
        GF_Snd_LoadBank(BANK_SE_LINEAR);
        ret = GF_Snd_LoadWaveArc(WAVE_ARC_SE_LINEAR);
        break;
    case SND_SCENE_SUB_COIN:
        GF_Snd_LoadBank(BANK_SE_COIN);
        ret = GF_Snd_LoadWaveArc(WAVE_ARC_SE_COIN);
        break;
    case SND_SCENE_SUB_DENDO:
        GF_Snd_LoadBank(BANK_SE_DENDO);
        ret = GF_Snd_LoadWaveArc(WAVE_ARC_SE_DENDO);
        break;
    case SND_SCENE_SUB_JUICE:
        GF_Snd_LoadBank(BANK_SE_JUICE);
        ret = GF_Snd_LoadWaveArc(WAVE_ARC_SE_JUICE);
        break;
    case SND_SCENE_SUB_PHC:
        GF_Snd_LoadBank(BANK_SE_PHC);
        ret = GF_Snd_LoadWaveArc(WAVE_ARC_SE_PHC);
        break;
    case SND_SCENE_SUB_SEKIBAN:
        GF_Snd_LoadBank(BANK_SE_SEKIBAN);
        ret = GF_Snd_LoadWaveArc(WAVE_ARC_SE_SEKIBAN);
        break;
    case SND_SCENE_SUB_EVENT:
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
    return GF_SetDataByScene(SND_SCENE_FIELD, unkA, 1);
}

BOOL GF_SetDataByScene(u8 scene, u16 no, int flag) {
    u8* scene_main = GF_SdatGetAttrPtr(SND_W_ID_SCENE_MAIN);
    u8* scene_sub = GF_SdatGetAttrPtr(SND_W_ID_SCENE_SUB);
    u16* me_wait = GF_SdatGetAttrPtr(SND_W_ID_ME_WAIT);

    if (scene < SND_SCENE_SUB) {
        if (*scene_main == scene) {    
            return FALSE;
        }
    }
    else if (*scene_sub == scene) {
        return FALSE;    
    }

    GF_SetSndScene(scene);

    switch (scene) {
    case SND_SCENE_FIELD:
        GF_SndSetBgmChannelAndReverb(0);    
        GF_SetFieldData(no, flag);
        (*me_wait) = 0;    
        break;
    case SND_SCENE_BATTLE:
        GF_SetBattleData(no, flag);
        break;
    case SND_SCENE_P2P:
        GF_SetP2PData(no, flag);
        break;
    case SND_SCENE_CONTEST:
        GF_SetContestData(no, flag);
        break;
    case SND_SCENE_CON_IMAGE:
        GF_SetConImageData(no, flag);
        break;
    case SND_SCENE_SUB_BAG:
    case SND_SCENE_SUB_NAMEIN:
    case SND_SCENE_SUB_IMAGE:
    case SND_SCENE_SUB_ZUKAN:
    case SND_SCENE_SUB_TOWNMAP:
    case SND_SCENE_SUB_TRCARD:
    case SND_SCENE_SUB_POKELIST:
    case SND_SCENE_SUB_DIG:
    case SND_SCENE_SUB_CUSTOM:
    case SND_SCENE_SUB_FIRSTPOKE:
    case SND_SCENE_SUB_PST:
    case SND_SCENE_SUB_PMS:
    case SND_SCENE_SUB_CLIMAX:
    case SND_SCENE_SUB_SLOT:
    case SND_SCENE_SUB_FNOTE:
    case SND_SCENE_SUB_SCRATCH:
    case SND_SCENE_SUB_UNK_67:
    case SND_SCENE_SUB_PLANTER:
    case SND_SCENE_SUB_COIN:
    case SND_SCENE_SUB_DENDO:
    case SND_SCENE_SUB_JUICE:
    case SND_SCENE_SUB_SEKIBAN:
        GF_SndAddSceneData(scene);
        break;
    case SND_SCENE_SUB_LINEAR:
        GF_SndAddSceneData(scene);
        PlayBGM(no);
        break;
    case SND_SCENE_TITLE:
        GF_SndSetBgmChannelAndReverb(1);    
        GF_SetDemoData(scene, no, flag);
        break;
    case SND_SCENE_ENDING:
        GF_SndSetBgmChannelAndReverb(2);    
        GF_SetDemoData(scene, no, flag);
        break;
    case SND_SCENE_OPENING:
        GF_SndSetBgmChannelAndReverb(0);    
        GF_SetDemoData(scene, no, flag);
        break;
    case SND_SCENE_TRADE:
    case SND_SCENE_HALL_OF_FAME:
    case SND_SCENE_AGB:
    case SND_SCENE_MYSTERY_GIFT:
    case SND_SCENE_NUTMIXER:
    case SND_SCENE_EGG:
    case SND_SCENE_SPIN_TRADE:
    case SND_SCENE_BCT:
    case SND_SCENE_EMAIL:
    case SND_SCENE_GIRA:
    case SND_SCENE_WIFI_LOBBY_GAME:
    case SND_SCENE_WIFI_LOBBY_PARADE:
    case SND_SCENE_WIFI_LOBBY_HIROBA:
    case SND_SCENE_WIFI_WORLD_TRADE:
    case SND_SCENE_THLON:
    case SND_SCENE_THLON_OPED:
    case SND_SCENE_SUB_PHC:
        GF_SetDemoData(scene, no, flag);
        break;
    case SND_SCENE_DEMO01:
        GF_SetDemoData(scene, no, flag);
        break;
    default:
        return FALSE;
    };

    return TRUE;    
} 

void GF_SetDataSub(u8 scene) {
    int* heap_save_global = GF_SdatGetAttrPtr(SND_W_ID_HEAP_SAVE_GLOBAL);

    GF_Snd_LoadState(*heap_save_global); 

    GF_Snd_SaveState(GF_SdatGetAttrPtr(SND_W_ID_HEAP_SAVE_BGM_BANK));   

    GF_Snd_LoadGroupByScene(scene); 
    GF_Snd_SaveState(GF_SdatGetAttrPtr(SND_W_ID_HEAP_SAVE_SE));   
}

void GF_SetFieldData(u16 no, int flag) {
    int temp;

    u8* field_pause_flag = GF_SdatGetAttrPtr(SND_W_ID_FIELD_PAUSE_FLAG);
    int* heap_save_global = GF_SdatGetAttrPtr(SND_W_ID_HEAP_SAVE_GLOBAL);
    u16* zone_bgm = GF_SdatGetAttrPtr(SND_W_ID_ZONE_BGM);

    temp = GF_NNS_SndPlayerGetSeqNo(GF_GetSoundHandle(SND_W_ID_WAVEOUT_HANDLE_NORMAL));

    u16 player_seq_no = (u16) temp;

    if (temp > SEQ_GS_P_START) {
        player_seq_no = GBSounds_GetDSSeqNoByGBSeqNo(player_seq_no);
    }

    if (*field_pause_flag == 0) {
        if (player_seq_no == no) {
            if (GF_GetNextBGM() != SEQ_GS_BICYCLE) { 
                return;
            }
        }
    }

    GF_SetSndBankFlag(1);  

    if (_021D05E8.unkc == 0 || unk4 == 0) {
        sub_02005FD8();
        unk4 = 1;
    }                                    

    if (player_seq_no != no) {
        GF_SndPause(PLAYER_FIELD, FALSE);      
        sub_02005FA0();
    }

    if (*field_pause_flag == 1) {

        GF_Snd_LoadState(GF_GetHeapSaveLv(SND_HEAP_SAVE_BGM_BANK));

        GF_Snd_LoadGroupByScene(SND_SCENE_FIELD);                     
        GF_Snd_SaveState(GF_SdatGetAttrPtr(SND_W_ID_HEAP_SAVE_SE));  

        if (player_seq_no != no) {
            GF_SndPause(PLAYER_FIELD, FALSE);              
        }

        GF_SetFieldData_StartPauseOff(no, temp);
        return;
    }

    PlayBGM(no);
}

static void GF_SetFieldData_StartPauseOff(u16 no, u16 unused) {
    u16* zone_bgm = GF_SdatGetAttrPtr(SND_W_ID_ZONE_BGM);
    u32 tmp_bank_no = GF_GetBankBySeqNo(*zone_bgm);   

    if (tmp_bank_no == BANK_BASIC) {
        GF_Snd_LoadSeqEx(no, NNS_SND_ARC_LOAD_WAVE);   
        GF_ASSERT(FALSE);
    }
    else {
        GF_Snd_LoadSeqEx(*zone_bgm, NNS_SND_ARC_LOAD_WAVE | NNS_SND_ARC_LOAD_BANK);
    }

    GF_Snd_SaveState(GF_SdatGetAttrPtr(SND_W_ID_HEAP_SAVE_BGM));
    
    GF_SndPause(PLAYER_FIELD, FALSE);               
    GF_SndStartFadeInBGM(BGM_VOL_MAX, 40, BGM_FADEIN_START_VOL_MIN);  

    GF_SetSndBankFlag(SND_BANK_CONTINUE);          
}  

void GF_SetFieldDataSub(u16 no, u16 old_bank_no) {
    u32 tmp_bank_no;
    u8* bank_flag    = GF_SdatGetAttrPtr(SND_W_ID_BANK_FLAG);
    u16* zone_bgm    = GF_SdatGetAttrPtr(SND_W_ID_ZONE_BGM);

    if ((*bank_flag == SND_BANK_CHANGE) || (old_bank_no == 0)) {
        GF_Snd_LoadState(GF_GetHeapSaveLv(SND_HEAP_SAVE_GLOBAL));  

        GF_SetSndSubScene(SND_SCENE_DUMMY);

        GF_Snd_LoadSeqEx(*zone_bgm, NNS_SND_ARC_LOAD_BANK);  
        GF_Snd_SaveState(GF_SdatGetAttrPtr(SND_W_ID_HEAP_SAVE_BGM_BANK));
    
        GF_Snd_LoadGroupByScene(SND_SCENE_FIELD); 
        GF_Snd_SaveState(GF_SdatGetAttrPtr(SND_W_ID_HEAP_SAVE_SE));  

        tmp_bank_no = GF_GetBankBySeqNo(*zone_bgm); 
        if ((tmp_bank_no == BANK_BASIC)) {
            GF_Snd_LoadSeqEx(no, NNS_SND_ARC_LOAD_WAVE);  
            GF_ASSERT(FALSE);
        }
        else {
            GF_Snd_LoadSeqEx(*zone_bgm, NNS_SND_ARC_LOAD_WAVE);  
        }

        GF_Snd_SaveState(GF_SdatGetAttrPtr(SND_W_ID_HEAP_SAVE_BGM));
    }
}

static void GF_SetBattleData(u16 no, int flag) {
    int* heap_save_global = GF_SdatGetAttrPtr(SND_W_ID_HEAP_SAVE_GLOBAL);

    Snd_FieldPauseOrStop();

    GF_Snd_LoadState(GF_GetHeapSaveLv(SND_HEAP_SAVE_BGM_BANK));  

    GF_Snd_LoadGroupByScene(SND_SCENE_BATTLE);  
    GF_Snd_SaveState(GF_SdatGetAttrPtr(SND_W_ID_HEAP_SAVE_SE));  

    GF_SetSndBankFlag(SND_BANK_CHANGE);     
    PlayBGM(no); 
}

void GF_SetP2PData(u16 no, int unused) {
    int* heap_save_global = GF_SdatGetAttrPtr(SND_W_ID_HEAP_SAVE_GLOBAL);

    sub_02005FA0();   

    GF_ClearPauseFlags();

    GF_SetDataSub(SND_SCENE_FIELD);

    PlayBGM(no);        
}

void GF_SetContestData(u16 no, int flag) {
    int* heap_save_global = GF_SdatGetAttrPtr(SND_W_ID_HEAP_SAVE_GLOBAL);

    sub_02005FA0();  

    GF_SetDataSub(SND_SCENE_CONTEST);

    GF_SetSndBankFlag(SND_BANK_CHANGE);  
    PlayBGM(no);    
}

void GF_SetConImageData(u16 no, int flag) {
    int* heap_save_global = GF_SdatGetAttrPtr(SND_W_ID_HEAP_SAVE_GLOBAL);

    sub_02005FA0(); 

    GF_SetDataSub(SND_SCENE_CON_IMAGE);

    GF_SetSndBankFlag(SND_BANK_CHANGE); 
    PlayBGM(no); 
}

static void GF_SndAddSceneData(u8 scene) {
    GF_ClearHeap();
    GF_Snd_LoadGroupByScene(scene);  
    GF_Snd_SaveState(GF_SdatGetAttrPtr(SND_W_ID_HEAP_SAVE_SUB_SE));
}

static void GF_SetDemoData(u8 scene, u16 bgm, int flag) {
    int* heap_save_global = GF_SdatGetAttrPtr(SND_W_ID_HEAP_SAVE_GLOBAL);

    sub_02005FA0(); 
    GF_SetDataSub(scene);
    PlayBGM(bgm); 
}

void BGM_SaveStateAndPlayNew(u16 no) {
    int ret;
    SND_WORK* wk = GetSoundDataPointer();

    Snd_FieldPauseOrStop();
    
    PlayBGM(no);    
}

void GF_ClearHeap(void) {
    GF_Snd_LoadState(GF_GetHeapSaveLv(4));
}

int GF_GetHeapSaveLv(int type) {
    SND_WORK* work = GetSoundDataPointer();
    int* heap_save;

    if (type >= SND_HEAP_SAVE_MAX) {
        GF_ASSERT(FALSE);
        heap_save = GF_SdatGetAttrPtr(SND_W_ID_HEAP_SAVE_BGM);
        return *heap_save;
    }

    switch (type) {
    case SND_HEAP_SAVE_START:
        heap_save = GF_SdatGetAttrPtr(SND_W_ID_HEAP_SAVE_START);
        break;
    case SND_HEAP_SAVE_GLOBAL:
        heap_save = GF_SdatGetAttrPtr(SND_W_ID_HEAP_SAVE_GLOBAL);
        break;
    case SND_HEAP_SAVE_BGM_BANK:
        heap_save = GF_SdatGetAttrPtr(SND_W_ID_HEAP_SAVE_BGM_BANK);
        break;
    case SND_HEAP_SAVE_SE:
        heap_save = GF_SdatGetAttrPtr(SND_W_ID_HEAP_SAVE_SE);
        break;
    case SND_HEAP_SAVE_BGM:
        heap_save = GF_SdatGetAttrPtr(SND_W_ID_HEAP_SAVE_BGM);
        break;
    case SND_HEAP_SAVE_SUB_SE:
        heap_save = GF_SdatGetAttrPtr(SND_W_ID_HEAP_SAVE_SUB_SE);
        break;
    case SND_HEAP_SAVE_ME:
        heap_save = GF_SdatGetAttrPtr(SND_W_ID_HEAP_SAVE_ME);
        break;
    }
    return *heap_save;
}

void GF_SndPause(u8 player, BOOL flag) {
    u8 handle_no;
    u8* pause_flag;

    if (player == PLAYER_FIELD) {
        pause_flag = GF_SdatGetAttrPtr(SND_W_ID_FIELD_PAUSE_FLAG);
        handle_no = SND_HANDLE_FIELD;

    }
    else if (player == PLAYER_BGM) {
        pause_flag = GF_SdatGetAttrPtr(SND_W_ID_BGM_PAUSE_FLAG);
        handle_no = SND_HANDLE_BGM;

    }
    else {
        return;
    }

    if (flag == FALSE) {
        GF_SetCurrentPlayingBGM(GF_NNS_SndPlayerGetSeqNo(GF_GetSoundHandle(handle_no)));
    }

    NNS_SndPlayerPause(GF_GetSoundHandle(handle_no), flag);
    *pause_flag = flag;  
}

void GF_ClearPauseFlags() {
    u8* field_pause_flag = GF_SdatGetAttrPtr(SND_W_ID_FIELD_PAUSE_FLAG);
    u8* bgm_pause_flag = GF_SdatGetAttrPtr(SND_W_ID_BGM_PAUSE_FLAG);
    *field_pause_flag = 0;
    *bgm_pause_flag = 0;
}

void GF_SndHandleMoveVolume(u8 handle_no, int target_volume, int frames) {
    NNS_SndPlayerMoveVolume(GF_GetSoundHandle(handle_no), target_volume, frames);
    if (handle_no == SND_HANDLE_FIELD) {
        GF_SndWorkSetGbSoundsVolume(target_volume);
    }
}

void GF_SndHandleSetInitialVolume(int handle_no, int vol) {
    if (vol < 0) {
        vol = 0;
    }

    if (vol > 127) {
        vol = 127;
    }

    NNS_SndPlayerSetInitialVolume(GF_GetSoundHandle(handle_no), vol);
}

void GF_SndSetVChatVolBySeqNo(int seq_no) {
    u8 player_no = GF_GetPlayerNoBySeq(seq_no);  
    int type = GF_GetSndHandleByPlayerNo(player_no); 
    GF_SndSetVChatVol(seq_no, type);
}

void GF_SndSetVChatVol(int seq_no, int handle_no) {
    u8 vol;
    const NNSSndSeqParam* p = NNS_SndArcGetSeqParam(seq_no);

    switch (handle_no) {
    case SND_HANDLE_PMVOICE:
    case SND_HANDLE_CHORUS:
        vol = PV_VOL_MAX;
        break;
    default:
        if (p == NULL) {
            return;
        }
        vol = p->volume;
        break;
    };

    if (sub_020378CC() == TRUE) {
        GF_SndHandleSetInitialVolume(handle_no, (vol / SND_VCHAT_VOL_LV));    //音量半分(06.07.20)
    }
}

u8 GF_GetVolumeBySeqNo(int seq_no) {
    NNSSndSeqParam* param = NNS_SndArcGetSeqParam(seq_no);
    if (param == 0) {
        return 0;
    }
    return param->volume;
}

void GF_SetVolumeBySeqNo(u16 seq_no, int vol) {
    u8 player_no = GF_GetPlayerNoBySeq(seq_no); 
    int type = GF_GetSndHandleByPlayerNo(player_no);
    GF_SndHandleSetInitialVolume(type, vol);
}

int GF_SndPlayerCountPlayingSeqByPlayerNo(int player_no) {
    if (player_no < 0) {
        GF_ASSERT(FALSE);
    }
    return NNS_SndPlayerCountPlayingSeqByPlayerNo(player_no);
}

u8 GF_GetPlayerNoBySeq(u16 no) {
    const NNSSndSeqParam* param;
    if (no == 0) {
        return 0xff; 
    }

    param = NNS_SndArcGetSeqParam(no);

    if (param == NULL) {
        return 0xff;
    }

    return param->playerNo;
}

int GF_NNS_SndPlayerGetSeqNo(int player_no) {
    return NNS_SndPlayerGetSeqNo(player_no);
}

const NNSSndArcBankInfo* GF_GetBankInfoBySeqNo(int no) {
    return NNS_SndArcGetBankInfo(GF_GetBankBySeqNo(no));
}

u16 GF_GetBankBySeqNo(int no) {
    const NNSSndSeqParam* param;
    
    param = NNS_SndArcGetSeqParam(no);
    if (param == NULL) {
        return 0;
    }

    return param->bankNo;
}

BOOL SndWorkMicCounterFull(void) {
    return GF_SndWorkMicCounterFull();
}

MICResult GF_MIC_StartAutoSampling(MICAutoParam* p) {
    MICResult ret = MIC_StartAutoSampling(p);

    auto_sample_flag = 1;

    _021D05F8 = *p;

    return ret;
}

MICResult GF_MIC_StopAutoSampling(void) {
    MICResult ret;
    SND_WORK* wk = GetSoundDataPointer();

    auto_sample_flag = 0;

    MIC_StopAutoSampling();
}

void GF_MicPauseOnLidClose(void) {
    if (auto_sample_flag) {
        if (MIC_StopAutoSampling()) {
            GF_ASSERT(FALSE);
        }
    }
}

void GF_MicResumeOnLidOpen(void) {
    if (auto_sample_flag) {
        if (MIC_StartAutoSampling(&_021D05F8)) {
            GF_ASSERT(FALSE);
        }
    }
    GF_SndWorkMicCounterReset();
}

NNSSndWaveOutHandle* Snd_WaveOutHandleGet(u32 no) {
    SND_WORK* wk = GetSoundDataPointer();
    u8* ch_normal_flag = GF_SdatGetAttrPtr(SND_W_ID_WAVEOUT_CH_NORMAL_FLAG);
    u8* ch_chorus_flag = GF_SdatGetAttrPtr(SND_W_ID_WAVEOUT_CH_CHORUS_FLAG);

    if ((no != WAVEOUT_CH_NORMAL) && (no != WAVEOUT_CH_CHORUS)) {
        GF_ASSERT(FALSE);
    }

    if ((no == WAVEOUT_CH_NORMAL) && (*ch_normal_flag == 0)) {   
        GF_ASSERT(FALSE);
    }

    if ((no == WAVEOUT_CH_CHORUS) && (*ch_chorus_flag == 0)) {  
        GF_ASSERT(FALSE);
    }

    if (no == WAVEOUT_CH_NORMAL) {
        return GF_SdatGetAttrPtr(SND_W_ID_WAVEOUT_HANDLE_NORMAL);
    }
    else {
        return GF_SdatGetAttrPtr(SND_W_ID_WAVEOUT_HANDLE_CHORUS);
    }
}

BOOL GF_AllocWaveOutChannel(u32 no) {
    u8* ch_normal_flag;
    u8* ch_chorus_flag;
    NNSSndWaveOutHandle* wave_handle;
    SND_WORK* wk = GetSoundDataPointer();

    ch_normal_flag = GF_SdatGetAttrPtr(SND_W_ID_WAVEOUT_CH_NORMAL_FLAG);
    ch_chorus_flag = GF_SdatGetAttrPtr(SND_W_ID_WAVEOUT_CH_CHORUS_FLAG);

    if ((no != WAVEOUT_CH_NORMAL) && (no != WAVEOUT_CH_CHORUS)) {
        GF_ASSERT(FALSE);
    }
    if (no == WAVEOUT_CH_NORMAL) {
        if (*ch_normal_flag == 0) { 
            wave_handle = GF_SdatGetAttrPtr(SND_W_ID_WAVEOUT_HANDLE_NORMAL);
            *wave_handle = NNS_SndWaveOutAllocChannel(no);  

            if (*wave_handle == NNS_SND_WAVEOUT_INVALID_HANDLE) {
                return FALSE;  
            }
            *ch_normal_flag = 1; 
        }
        else {
            GF_ASSERT(FALSE);
        }
    }
    else {
        if (*ch_chorus_flag == 0) { 
            wave_handle = GF_SdatGetAttrPtr(SND_W_ID_WAVEOUT_HANDLE_CHORUS);
            *wave_handle = NNS_SndWaveOutAllocChannel(no); 
            if (*wave_handle == NNS_SND_WAVEOUT_INVALID_HANDLE) {
                return FALSE; 
            }
            *ch_chorus_flag = 1;   
        }
        else {
            GF_ASSERT(FALSE);
        }
    }

    return TRUE;
}

void GF_FreeWaveOutChannel(u32 no) {
    NNSSndWaveOutHandle* wave_handle;
    SND_WORK* wk = GetSoundDataPointer();
    u8* ch_normal_flag = GF_SdatGetAttrPtr(SND_W_ID_WAVEOUT_CH_NORMAL_FLAG);
    u8* ch_chorus_flag = GF_SdatGetAttrPtr(SND_W_ID_WAVEOUT_CH_CHORUS_FLAG);

    if ((no != WAVEOUT_CH_NORMAL) && (no != WAVEOUT_CH_CHORUS)) {
        GF_ASSERT(FALSE);
        return;
    }

    if (no == WAVEOUT_CH_NORMAL) {
        if (*ch_normal_flag == 1) {  
            wave_handle = Snd_WaveOutHandleGet(no);
            NNS_SndWaveOutFreeChannel(*wave_handle);
            *ch_normal_flag = 0; 

        }
        else {
            GF_ASSERT(FALSE);
        }
    }
    else {
        if (*ch_chorus_flag == 1) {  
            wave_handle = Snd_WaveOutHandleGet(no);
            NNS_SndWaveOutFreeChannel(*wave_handle);
            *ch_chorus_flag = 0; 

        }
        else {
            GF_ASSERT(FALSE);
        }
    }

    return;
}

BOOL GF_WaveOutStart(WAVEOUT_WORK* p, u32 ch) {
    int ret;
    ret = NNS_SndWaveOutStart(*p->handle, p->format, p->dataaddr, p->loopFlag, p->loopStartSample,
                                p->samples, p->sampleRate, p->volume, p->speed, p->pan);

    if (ret == FALSE) {
        GF_FreeWaveOutChannel(ch);
    }

    return ret;
}

void GF_WaveOutStop(u32 no) {
    NNS_SndWaveOutStop(*Snd_WaveOutHandleGet(no));
    return;
}

BOOL GF_WaveOutIsPlaying(u32 no) {
    return NNS_SndWaveOutIsPlaying(*Snd_WaveOutHandleGet(no));
}

void GF_SetWaveOutPan(u32 no, u8 pan) {
    u8 set_pan;

    if (pan > 127) {
        set_pan = 127;
    }
    else {
        set_pan = pan;
    }

    NNS_SndWaveOutSetPan(*Snd_WaveOutHandleGet(no), set_pan);
}

void GF_SetWaveOutSpeed(u32 no, u32 spd) {
    NNS_SndWaveOutSetSpeed(*Snd_WaveOutHandleGet(no), spd);
}

void GF_SetWaveOutVolume(u32 no, int vol) {
    if (sub_020378CC() == TRUE) {
        NNS_SndWaveOutSetVolume(*Snd_WaveOutHandleGet(no), (vol/SND_VCHAT_VOL_LV));    //音量操作
    }
    else {
        NNS_SndWaveOutSetVolume(*Snd_WaveOutHandleGet(no), vol);
    }
}

BOOL GF_WaveOutStartReverse(u16 no, int vol, int pan, u32 ch, int heap_id) {
    u8* reverse_flag;
    const NNSSndArcWaveArcInfo* info;
    u32 size;
    int size2,ret;
    SND_WORK* wk = GetSoundDataPointer();
    void** reverse_buf = GF_SdatGetAttrPtr(SND_W_ID_REVERSE_BUF);

    if ((ch != WAVEOUT_CH_NORMAL) && (ch != WAVEOUT_CH_CHORUS)) {
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

    if (ch == WAVEOUT_CH_NORMAL) {
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
        GF_SndBufReverse(*reverse_buf, size);
    }

    {
        WAVEOUT_WORK waveout_wk;
        waveout_wk.handle = Snd_WaveOutHandleGet(ch);  
        waveout_wk.format = NNS_SND_WAVE_FORMAT_PCM8;  
        waveout_wk.dataaddr = *reverse_buf;        
        waveout_wk.loopFlag = FALSE;               
        waveout_wk.loopStartSample = 0;           
        waveout_wk.samples = size;                 
        waveout_wk.sampleRate = 13379;     
        waveout_wk.volume = vol;                
        waveout_wk.speed = 24576;             
        waveout_wk.pan = pan;         

        ret = GF_WaveOutStart(&waveout_wk, ch);

        GF_SetWaveOutVolume(ch, vol);
    }

    reverse_flag = GF_SdatGetAttrPtr(SND_W_ID_REVERSE_FLAG);
    *reverse_flag = 1;

    return ret;
}

void GF_SndBufReverse(u8* p, u32 size) {
    int i;
    u8 temp;

    for (i=0; i < (size / 2) ;i++) {
        temp = p[i];    
        p[i] = p[size-1-i];
        p[size-1-i] = temp;
    }
}

void GF_WaveOutStopReverse(u32 no) {
    SND_WORK* wk = GetSoundDataPointer();
    u8* reverse_flag = GF_SdatGetAttrPtr(SND_W_ID_REVERSE_FLAG);
    void** reverse_buf = GF_SdatGetAttrPtr(SND_W_ID_REVERSE_BUF);

    if ((no != WAVEOUT_CH_NORMAL) && (no != WAVEOUT_CH_CHORUS)) {
        GF_ASSERT(FALSE);
    }

    GF_WaveOutStop(no);          

    if (*reverse_flag == 1) {     
        *reverse_flag = 0; 
        FreeToHeap(*reverse_buf);   
    }
}

BOOL GF_SndCaptureIsActive(void) {
    BOOL active = NNS_SndCaptureIsActive();
    if (active == TRUE) {
        GF_GetCaptureType();
    }
    return active;
}


NNSSndCaptureType GF_GetCaptureType(void) {
    return NNS_SndCaptureGetCaptureType();
}

void GF_SndCaptureStopReverb(int frame) {
    NNS_SndCaptureStopReverb(frame);
}

void GF_SndHandleSetTrackPitch(int handle_no, u16 bitmask, int pitch) {
    NNS_SndPlayerSetTrackPitch(GF_GetSoundHandle(handle_no), bitmask, pitch);
}

void GF_SetHandleTrackBySeqNo(u16 no, u16 bitmask, int pitch) {
    u8 player_no = GF_GetPlayerNoBySeq(no); 
    int type = GF_GetSndHandleByPlayerNo(player_no);
    GF_SndHandleSetTrackPitch(type, bitmask, pitch);
}

void GF_SetHandleTrackByPlayerNo(u8 player_no, u16 bitmask, int pitch) {
    int type = GF_GetSndHandleByPlayerNo(player_no);
    GF_SndHandleSetTrackPitch(type, bitmask, pitch);
}

void GF_SndHandleSetTrackPan(int handle_no, u16 bitmask, int pan) {
    NNS_SndPlayerSetTrackPan(GF_GetSoundHandle(handle_no), bitmask, pan);
}

void GF_SndHandleSetTempoRatio(int handle_no, int tempo) {
    NNS_SndPlayerSetTempoRatio(GF_GetSoundHandle(handle_no), tempo);
}

void GF_SndSetMonoFlag(BOOL flag) {
    NNS_SndSetMonoFlag(flag);
    _021D05E8.mono_flag = flag;
}

void GF_SetFadeCount(int frame) {
    int* fade_count = GF_SdatGetAttrPtr(SND_W_ID_FADE_COUNT);
    *fade_count = frame;
}

void GF_SetNextWait(int frame) {
    int* next_wait = GF_SdatGetAttrPtr(SND_W_ID_NEXT_WAIT);
    *next_wait = frame;
}

int GF_SndGetAfterFadeDelayTimer(void) {
    u16* next_wait = GF_SdatGetAttrPtr(SND_W_ID_NEXT_WAIT);

    if (*next_wait <= 0) {
        *next_wait = 0;
        return 0;
    }

    (*next_wait)--;
    return *next_wait;
}

void GF_SetMasterVolume(int vol) {
    NNS_SndSetMasterVolume(vol);
}

s8* GF_GetWaveBufAdrs(void) {
    return sWaveBuffer;
}

void GF_SetSndBankFlag(int flag) {
    *(u8*) GF_SdatGetAttrPtr(SND_W_ID_BANK_FLAG) = flag;
}

BOOL GF_NowStartMusicId(u16 no, int frame, int next_wait, u8 flag, void* adrs) {
    return Snd_FadeOutNextPlaySet(SND_W_ID_CALLBACK_INFO, no, frame, next_wait, flag, adrs);
}

BOOL Snd_FadeOutNextPlaySet(u8 scene, u16 no, int frame, int next_wait, u8 flag, void* adrs) {
    u8* scene_sub = GF_SdatGetAttrPtr(SND_W_ID_SCENE_SUB);

    Snd_FadeCommonSet(scene, no, frame, next_wait, flag, adrs);

    *scene_sub = SND_SCENE_DUMMY;

    GF_SndSetState(5); //SND_STATUS_FADEOUT_NEXT_PLAY
    return TRUE;
}

BOOL GF_FadeStartMusicId(u16 no, int frame, int next_wait, int next_frame, u8 flag, void* adrs) {
    return Snd_FadeOutNextFadeInSet(4, no, frame, next_wait, next_frame, flag, adrs);
}

BOOL Snd_FadeOutNextFadeInSet(u8 scene, u16 no, int frame, int next_wait, int next_frame, u8 flag, void* adrs) {
    int* next_frame_wk = GF_SdatGetAttrPtr(SND_W_ID_NEXT_FRAME);

    Snd_FadeCommonSet(scene, no, frame, next_wait, flag, adrs);
    
    *next_frame_wk = next_frame;  

    GF_SndSetState(6); //SND_STATUS_FADEOUT_NEXT_FADEIN
    return TRUE;
}

static void Snd_FadeCommonSet(u8 scene, u16 no, int frame, int next_wait, u8 flag, void* adrs) {
    const NNSSndArcBankInfo** info = GF_SdatGetAttrPtr(SND_W_ID_BANK_INFO);

    GF_SndStartFadeOutBGM(0, frame); //BGM_VOL_MIN

    GF_SetCurrentPlayingBGM(0);   

    GF_SetNextBGM(no);    
    GF_SetNextWait(next_wait);       

    *info = GF_GetBankInfoBySeqNo(no); 

    GF_SetSndBankFlag(flag);
}

void GF_SndSetAllocatableChannelForBGMPlayer(int channel) {
    NNS_SndPlayerSetAllocatableChannel(7, channel);
}

void GF_SndSetBgmChannelAndReverb(int flag) {
    if (flag == 0) {
        GF_SndSetAllocatableChannelForBGMPlayer(PLAYER_BGM_NORMAL_CH);    //PLAYER_GMの使用チャンネルを元に戻す
        GF_SndCaptureStopReverb(0);
    } 
    else {
        GF_SndSetAllocatableChannelForBGMPlayer(0x00003FFF);
    }

    GF_SndCaptureIsActive();
}

void Snd_FieldPauseOrStop(void) {
    if ((GF_SndGetFadeTimer() == 0) && 
        (GF_NNS_SndPlayerGetSeqNo(GF_GetSoundHandle(SND_HANDLE_FIELD)) != -1)) {

        sub_02005FD8(); 
        GF_SndPause(PLAYER_FIELD, TRUE);  

    }
    else {
        sub_02005FA0();                                
    }
}

void GF_SndHandleSetPlayerVolume(int player_no, int vol) {
    NNS_SndPlayerSetPlayerVolume(player_no, vol);
}

void Snd_SetPVDoubleFlag(u8 flag) {
    *(u8*) GF_SdatGetAttrPtr(SND_W_ID_PV_DOUBLE_FLAG) = flag;
}

void Snd_SetBattleRecFlag(u8 flag) {
    *(u8*) GF_SdatGetAttrPtr(SND_W_ID_BATTLE_REC_FLAG) = flag;
}

BOOL GF_SndPlayerReadVariableBySeq(u16 seq_no, u16 varNo, s16* var) {
    if (var == NULL) {
        GF_ASSERT(FALSE);
    }
    if (varNo > 15) {
        GF_ASSERT(FALSE);
    }
    int player_no = GF_GetPlayerNoBySeq(seq_no);
    int type = GF_GetSndHandleByPlayerNo(player_no);
    return NNS_SndPlayerReadVariable(GF_GetSoundHandle(type), varNo, var);
}

void sub_02005BA8(u16 no) {
    u8* index = (u8*) GF_SdatGetAttrPtr(SND_W_ID_UNK_55);
    GF_SetVolumeBySeqNo(no, _020F5710[*index][1]);
    GF_SndHandleSetTrackPitch(4, 0x0000FFFF, _020F5710[*index][0]);
    if (index[1] >= 8) {
        index[1] = 0;
    }
}

void Snd_SetUNK_56(u8 unk) {
    *(u8*) GF_SdatGetAttrPtr(SND_W_ID_UNK_56) = unk;
}

u8 Snd_GetUNK_56(void) {
    return *(u8*) GF_SdatGetAttrPtr(SND_W_ID_UNK_56);
}

void Snd_SetGBSoundsState(u8 val) {
    *(u8*) GF_SdatGetAttrPtr(SND_W_ID_UNK_57) = val;
}

u8 SoundSys_GetGBSoundsState(void) {
    return *(u8*) GF_SdatGetAttrPtr(SND_W_ID_UNK_57);
}

void SoundSys_ToggleGBSounds(void) {
    u8 state = SoundSys_GetGBSoundsState();
    if (state == 0) {
        Snd_SetGBSoundsState(1);
    }
    else {
        Snd_SetGBSoundsState(0);
    }
    if (GF_GetNextBGM() == 0) {
        u16 bgm = GF_GetCurrentPlayingBGM();
        int vol = GF_SndWorkGetGbSoundsVolume();
        if (bgm != GBSounds_GetGBSeqNoByDSSeqNo(bgm)) {
            PlayBGM(bgm);
        }
        GF_SndHandleMoveVolume(0, vol, 0);
    }
}

u16 GBSounds_GetGBSeqNoByDSSeqNo(u16 seq_no) {
    for (u16 c = 0; c < 136; c++) {
        if (seq_no == GS_SeqPairs[c][0]) {
            return GS_SeqPairs[c][1];
        }
    }
    return seq_no;
}

u16 GBSounds_GetDSSeqNoByGBSeqNo(u16 seq_no) {
    for (u16 c = 0; c < 136; c++) {
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
