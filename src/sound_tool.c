#include "constants/snd_system.h"
#include "sound.h"
#include "sound_tool.h"


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
    u8* scene_main	= (u8*) GF_SdatGetAttrPtr(SND_W_ID_SCENE_MAIN);
	u8* scene_sub	= (u8*) GF_SdatGetAttrPtr(SND_W_ID_SCENE_SUB);
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
	case SND_SCENE_HUSIGI:
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

		GF_Snd_LoadSeqEx(SEQ_SE_DP_HAMARU,	NNS_SND_ARC_LOAD_SEQ);	
		GF_Snd_LoadSeqEx(SEQ_SE_DP_CON_016,NNS_SND_ARC_LOAD_SEQ);	

		GF_Snd_LoadSeqEx(SEQ_SE_PL_KIRAKIRA, NNS_SND_ARC_LOAD_SEQ);	

		GF_Snd_LoadSeqEx(SEQ_SE_PL_FCALL, NNS_SND_ARC_LOAD_SEQ);	
		
		break;
    case SND_SCENE_ENDING:
		ret = GF_Snd_LoadGroup(GROUP_SE_NUTMIXER);	
		break;
    case SND_SCENE_OPENING:
	case SND_SCENE_EGG:
		ret = GF_Snd_LoadGroup(GROUP_SE_BATTLE);		//This is because battle scene sounds are needed!
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
	case SND_SCENE_DENDOU:
		ret = GF_Snd_LoadGroup(GROUP_SE_FIELD);	
		break;
	case SND_SCENE_NUTMIXER:
		ret = GF_Snd_LoadGroup(GROUP_SE_NUTMIXER);
		break;
	case SND_SCENE_BCT:
		ret = GF_Snd_LoadGroup(GROUP_SE_FIELD);		
		ret = GF_Snd_LoadGroup(GROUP_SE_DIG);		
		break;
	case SND_SCENE_GURUGURU:
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
    return GF_SetDataByScene(4, unkA, 1);
}

BOOL GF_SetDataByScene(u8 scene, u16 no, int flag) {
    u8* scene_main	= GF_SdatGetAttrPtr(SND_W_ID_SCENE_MAIN);
	u8* scene_sub	= GF_SdatGetAttrPtr(SND_W_ID_SCENE_SUB);
	u16* me_wait	= GF_SdatGetAttrPtr(SND_W_ID_ME_WAIT);

	if (scene < SND_SCENE_SUB){
		if ( *scene_main == scene ) {	
			return FALSE;
		}
	}
    else {
		if ( *scene_sub == scene ) {	
			return FALSE;
		}
	}

	GF_SetSndScene( scene );

	switch ( scene ) {
	case SND_SCENE_FIELD:
		GF_SndSetBgmChannelAndReverb( 0 );	
		GF_SetFieldData( no, flag );
        (*me_wait) = 0;	
		break;
    case SND_SCENE_BATTLE:
		GF_SetBattleData( no, flag );
		break;
    case SND_SCENE_P2P:
		GF_SetP2PData( no, flag );
		break;
    case SND_SCENE_CONTEST:
		GF_SetContestData( no, flag );
		break;
    case SND_SCENE_CON_IMAGE:
		GF_SetConImageData( no, flag );
		break;
    case 51:
	case 52:
	case 53:
	case 54:
	case 55:
	case 56:
	case 57:
	case 58:
	case 59:
	case 60:
	case 61:
	case 62:
	case 63:
	case 64:
	case 65:
	case 66:
    case 67:
    case 69:
    case 70:
    case 71:
    case 72:
    case 74:
		GF_SndAddSceneData(scene);
		break;
    case 68:
        GF_SndAddSceneData(scene);
        PlayBGM(no);
        break;
    case 1:
		GF_SndSetBgmChannelAndReverb( 1 );	
		GF_SetDemoData( scene, no, flag );
		break;
    case 14:
		GF_SndSetBgmChannelAndReverb( 2 );	
		GF_SetDemoData( scene, no, flag );
		break;
    case 2:
		GF_SndSetBgmChannelAndReverb( 0 );	
		GF_SetDemoData( scene, no, flag );
		break;
    case 3:
	case 8:
	case 9:
	case 10:
	case 12:
	case 13:
	case 15:
	case 16:
	case 17:
	case 18:
	case 19:
	case 20:
	case 21:
	case 23:
    case 24:
    case 25:
    case 73:
		GF_SetDemoData( scene, no, flag );
		break;
    case 22:
		GF_SetDemoData( scene, no, flag );
		break;
    default:
		return 0;
	};

	return 1;	
} 

//static in plat leak
void GF_SetDataSub(u8 scene) {
    int* heap_save_global	= GF_SdatGetAttrPtr(SND_W_ID_HEAP_SAVE_GLOBAL);

	GF_Snd_LoadState( *heap_save_global );						//常駐以外を消す

	GF_Snd_SaveState(GF_SdatGetAttrPtr(SND_W_ID_HEAP_SAVE_BGM_BANK));	//保存(常駐,bnk,SE以外消す)

	GF_Snd_LoadGroupByScene( scene );									//SEシーケンスグループ
	GF_Snd_SaveState(GF_SdatGetAttrPtr(SND_W_ID_HEAP_SAVE_SE));	//階層保存(常駐、SE以外消す時使用)
}

typedef struct UnkMicStruct {
    u8 unk0; //is auto sampling..?
    u32 unk4;
    BOOL mono_flag; 
    u32 unkc;
    
} UNK_MICSTRUCT;

extern UNK_MICSTRUCT _021D05E8;

void GF_SetFieldData(u16 no, int flag) {
    int temp;

	u8* field_pause_flag	= GF_SdatGetAttrPtr(SND_W_ID_FIELD_PAUSE_FLAG);
	int* heap_save_global	= GF_SdatGetAttrPtr(SND_W_ID_HEAP_SAVE_GLOBAL);
	u16* zone_bgm			= GF_SdatGetAttrPtr(SND_W_ID_ZONE_BGM);

	temp = GF_NNS_SndPlayerGetSeqNo( GF_GetSoundHandle(0) );

    u16 player_seq_no =  (u16) temp;

    if(temp > SEQ_GS_P_START) {
        player_seq_no = GBSounds_GetDSSeqNoByGBSeqNo(player_seq_no);
    }

	//PLAYER_FIELDをポーズしていない時
	if( *field_pause_flag == 0 ){
		//同じ曲を鳴らそうとした時
		if( player_seq_no == no ){
			if( GF_GetNextBGM() != 0x3f5 ){ //seq bicycle
				return;		//注意！
			}
		}
	}

	//ポーズ復帰の分岐にも必要！
	//波形アーカイブのロードが必要なので！
	GF_SetSndBankFlag( 1 );							//バンク切り替えるかフラグをセット

    if(_021D05E8.unkc == 0 || _021D05E8.unk4 == 0) {
        sub_02005FD8();
        _021D05E8.unk4 = 1;
    }									

	//PLAYER_FIELDをポーズしている時でも、
	//昼と夜が切り替わった時は、違う曲を鳴らすようにする！
	//その時は、ポーズフラグを落として、頭から違う曲を再生にいくようにする！(06.04.12)
	if( player_seq_no != no ){
		GF_SndPause( PLAYER_FIELD, FALSE );					//フィールドBGM再開
		sub_02005FA0();
	}

	//フィールドBGMをポーズしていたら解除する！
	if( *field_pause_flag == 1 ){

		GF_Snd_LoadState( GF_GetHeapSaveLv(SND_HEAP_SAVE_BGM_BANK) );

		GF_Snd_LoadGroupByScene( SND_SCENE_FIELD );						//SEシーケンスグループ
		GF_Snd_SaveState(GF_SdatGetAttrPtr(SND_W_ID_HEAP_SAVE_SE));	//階層保存(常駐、SE以外消す時)

		//昼と夜が切り替わって、違う曲を鳴らそうとした時は、
		//ポーズフラグを落として、頭から違う曲を再生にいくようにする！(06.04.12)
		if( player_seq_no != no ){
			GF_SndPause( PLAYER_FIELD, FALSE );					//フィールドBGM再開
		}

		GF_SetFieldData_StartPauseOff( no, temp );
		return;
        }

	//BGM再生(ステータス＝再生)
	PlayBGM( no );
}

#define BANK_BGM_FIELD 700
#define BGM_VOL_MAX 127
#define BGM_FADEIN_START_VOL_MIN 0
#define SND_BANK_CONTINUE 0


//static in plat leak
static void GF_SetFieldData_StartPauseOff(u16 no, u16 unused) {
    u16* zone_bgm	= GF_SdatGetAttrPtr(SND_W_ID_ZONE_BGM);
	u32 tmp_bank_no = GF_GetBankBySeqNo(*zone_bgm);					//不正な値が入っていないかチェック

	if( (tmp_bank_no == BANK_BGM_FIELD) ){
		GF_Snd_LoadSeqEx( no, NNS_SND_ARC_LOAD_WAVE );				//波形アーカイブロード
		GF_ASSERT(FALSE);
	}else{
		GF_Snd_LoadSeqEx( *zone_bgm, NNS_SND_ARC_LOAD_WAVE | NNS_SND_ARC_LOAD_BANK);//arc,bank
	}

	GF_Snd_SaveState( GF_SdatGetAttrPtr(SND_W_ID_HEAP_SAVE_BGM) );	//階層保存(BGMの後を消す)

	//ポーズ状態から復帰するには、バンクも再ロードする必要があるが、
	//プレイヤーヒープでバンクをロードしているので大丈夫！

	//Snd_NowBgmNoSet( Snd_GetSeqNo(Snd_HandleGet(SND_HANDLE_FIELD)) );	//今のBGMナンバーセット

	//プレイヤーヒープにBGM_FIELD_BANK(BGM_DUNGEON_BANK)が残っているのが前提！
	//これが出来ないシチュエーションがあったら、BGM_DUNGEON_BANKは廃止しないとダメ！
	
	GF_SndPause( PLAYER_FIELD, FALSE );						//フィールドBGM再開
	GF_SndStartFadeInBGM( BGM_VOL_MAX, 40, BGM_FADEIN_START_VOL_MIN );	//フェードイン

	//バンク切り替えるかフラグをリセット
	GF_SetSndBankFlag( SND_BANK_CONTINUE );					//クリア = 継続

}  

#define SND_BANK_CHANGE 1

//GF_SetFieldDataSub
void GF_SetFieldDataSub(u16 no, u16 old_bank_no) {
    u32 tmp_bank_no;
	u8* bank_flag	= GF_SdatGetAttrPtr(SND_W_ID_BANK_FLAG);
	u16* zone_bgm	= GF_SdatGetAttrPtr(SND_W_ID_ZONE_BGM);

	if( (*bank_flag == SND_BANK_CHANGE) || (old_bank_no == 0) ){

		//マップ遷移の時、バンクをロードする
		//ゾーンをまたぐ時、バンクをロードしない
		
		GF_Snd_LoadState( GF_GetHeapSaveLv(SND_HEAP_SAVE_GLOBAL) );	//常駐以外を消す
		//★サブシーンのデータも消されているのでクリア！
		//
		//演出BGMを鳴らす前にフィールドBGMを停止しているので、
		//Snd_GetSeqNo( Snd_GetBankNo(FIELD... )を取得しても、
		//old_bank_no = 0 になってしまっていた
		//
		//再度同じサブシーンを呼ぶと、SE再生失敗してしまう
		GF_SetSndSubScene( SND_SCENE_DUMMY );

		GF_Snd_LoadSeqEx( *zone_bgm, NNS_SND_ARC_LOAD_BANK );			//バンクロード
		GF_Snd_SaveState(GF_SdatGetAttrPtr(SND_W_ID_HEAP_SAVE_BGM_BANK));//保存(常駐,bnk,SE以外消す)
	
		GF_Snd_LoadGroupByScene( SND_SCENE_FIELD );							//SEシーケンスグループ
		GF_Snd_SaveState(GF_SdatGetAttrPtr(SND_W_ID_HEAP_SAVE_SE));		//保存(常駐、SE以外消す)

		tmp_bank_no = GF_GetBankBySeqNo(*zone_bgm);				//不正な値が入っていないかチェック
		if( (tmp_bank_no == BANK_BGM_FIELD) ){
			GF_Snd_LoadSeqEx( no, NNS_SND_ARC_LOAD_WAVE );				//波形アーカイブロード
			GF_ASSERT( FALSE );
		}else{
			GF_Snd_LoadSeqEx( *zone_bgm, NNS_SND_ARC_LOAD_WAVE );		//波形アーカイブロード
		}

		GF_Snd_SaveState( GF_SdatGetAttrPtr(SND_W_ID_HEAP_SAVE_BGM) );	//階層保存(BGMの後を消す)
	}
}

//GF_SetBattleData
static void GF_SetBattleData(u16 no, int flag) {
    int* heap_save_global	= GF_SdatGetAttrPtr(SND_W_ID_HEAP_SAVE_GLOBAL);

	//フィールドBGMをポーズするか、停止するかを判別して処理
	Snd_FieldPauseOrStop();

	GF_Snd_LoadState( GF_GetHeapSaveLv(SND_HEAP_SAVE_BGM_BANK) );	//常駐とfield_bnk以外消す

	GF_Snd_LoadGroupByScene( SND_SCENE_BATTLE );							//SEシーケンスグループ
	GF_Snd_SaveState(GF_SdatGetAttrPtr(SND_W_ID_HEAP_SAVE_SE));	//階層保存(常駐、SE以外消す時使用)

	//フィールドBGMのシーケンス、バンクは、プレイヤーヒープで処理しているので、
	//停止処理を呼ばないと開放されない(ポーズ状態にしている)

	GF_SetSndBankFlag( SND_BANK_CHANGE );							//バンク切り替えるかフラグをセット
	PlayBGM( no );											//BGM再生
}


//GF_SetP2PData
void GF_SetP2PData(u16 no, int unused) {
    int* heap_save_global	= GF_SdatGetAttrPtr(SND_W_ID_HEAP_SAVE_GLOBAL);

	//手順(1)
	sub_02005FA0();													//全停止

	//ポーズフラグを落とさないといけない！
	//Snd_PlayerPause( PLAYER_FIELD, FALSE );					//フィールドBGMポーズ解除
	
	//全てのポーズフラグクリア
	GF_ClearPauseFlags();

	//共通処理
	GF_SetDataSub( SND_SCENE_FIELD );

	//Snd_BankFlagSet( SND_BANK_CONTINUE );						//バンクそのまま継続
	PlayBGM( no );		
}

void GF_SetContestData(u16 no, int flag) {
    int* heap_save_global	= GF_SdatGetAttrPtr(SND_W_ID_HEAP_SAVE_GLOBAL);

	//手順(1)
	sub_02005FA0();													//全停止

	//共通処理
	GF_SetDataSub( SND_SCENE_CONTEST );

	GF_SetSndBankFlag( SND_BANK_CHANGE );							//バンク切り替えるかフラグをセット
	PlayBGM( no );	
}

void GF_SetConImageData(u16 no, int flag) {
	int* heap_save_global	= GF_SdatGetAttrPtr(SND_W_ID_HEAP_SAVE_GLOBAL);

	//手順(1)
	sub_02005FA0();													//全停止

	//共通処理
	GF_SetDataSub( SND_SCENE_CON_IMAGE );

	GF_SetSndBankFlag( SND_BANK_CHANGE );							//バンク切り替えるかフラグをセット
	PlayBGM( no );											//BGM再生
}

static void GF_SndAddSceneData(u8 scene) {
    GF_ClearHeap(); //delete heap after bgm										//BGMの後ろを消す
	GF_Snd_LoadGroupByScene( scene );										//SEシーケンスグループ
	GF_Snd_SaveState(GF_SdatGetAttrPtr(SND_W_ID_HEAP_SAVE_SUB_SE));	//階層保存(サブ画面の上を消す)
}

//GF_SetDemoData
static void GF_SetDemoData(u8 scene, u16 bgm, int flag) {
    int* heap_save_global	= GF_SdatGetAttrPtr(SND_W_ID_HEAP_SAVE_GLOBAL); //unused
    
    sub_02005FA0();		//Snd_Stop or GF_SndStop() to stay consistent		 
	GF_SetDataSub( scene );
	PlayBGM( bgm );											//BGM再生
}

void BGM_SaveStateAndPlayNew(u16 no) {
    int ret;
	SND_WORK* wk	= GetSoundDataPointer();

	//BattleDataSetでシーンのセットをするので、
	//このタイミングでシーンをセットする必要はない！

	//フィールドBGMをポーズするか、停止するかを判別して処理
	Snd_FieldPauseOrStop();

	//Snd_BankFlagSet( SND_BANK_CONTINUE );						//バンクそのまま継続
	PlayBGM( no );	
}

//GF_ClearHeap
void GF_ClearHeap(void) {
	GF_Snd_LoadState(GF_GetHeapSaveLv(4));
}

//GF_GetHeapSaveLv
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

	if( player == PLAYER_FIELD ){
		pause_flag	= GF_SdatGetAttrPtr( SND_W_ID_FIELD_PAUSE_FLAG );
		handle_no	= SND_HANDLE_FIELD;

	}else if( player == PLAYER_BGM ){
		pause_flag	= GF_SdatGetAttrPtr( SND_W_ID_BGM_PAUSE_FLAG );
		handle_no	= SND_HANDLE_BGM;

	}else{
		return;			//何もしない
	}

	//再開させるので、今のBGMナンバーにセットしなおす
	if( flag == FALSE ){
		GF_SetCurrentPlayingBGM((u16) GF_NNS_SndPlayerGetSeqNo(GF_GetSoundHandle(handle_no)) );
	}

	NNS_SndPlayerPause( GF_GetSoundHandle(handle_no), flag );
	*pause_flag = flag;	//ポーズしているかフラグ
}

//GF_ClearPauseFlags
void GF_ClearPauseFlags() {
    u8* field_pause_flag	= GF_SdatGetAttrPtr( SND_W_ID_FIELD_PAUSE_FLAG );
	u8* bgm_pause_flag		= GF_SdatGetAttrPtr( SND_W_ID_BGM_PAUSE_FLAG );

	//追加された時の対応忘れを考えると配列で持っていたほうがよさそう
	//これ以上は増えないはずだが。。。
	
	*field_pause_flag = 0;
	*bgm_pause_flag = 0;
}

void GF_SndHandleMoveVolume(u8 handle_no, int target_volume, int frames) {
    NNS_SndPlayerMoveVolume(GF_GetSoundHandle(handle_no), target_volume, frames);
    if(handle_no == 0) {
        GF_SndWorkSetGbSoundsVolume(target_volume);
    }
}

void GF_SndHandleSetInitialVolume(int handle_no, int vol) {
    if( vol < 0 ){
		vol = 0;
	}

	if( vol > 127 ){
		vol = 127;
	}

	//この関数は、NNS_SndArcPlayerStartSeq*関数と NNS_SndArcPlayerStartSeqArc*関数内で
	//呼びだされています。再度、この関数を呼びだすと、設定した値が上書きされます。
	//上書きしたくない場合は、 NNS_SndPlayerSetVolume関数などを使ってください。
	NNS_SndPlayerSetInitialVolume( GF_GetSoundHandle(handle_no), vol );
}

void GF_SndSetVChatVolBySeqNo(int seq_no) {
    u8 player_no= GF_GetPlayerNoBySeq(seq_no);				//seqナンバーから、プレイヤーナンバーを取得
	int type	= GF_GetSndHandleByPlayerNo(player_no);	//playerナンバーから、ハンドルナンバーを取得
	GF_SndSetVChatVol( seq_no, type );
}

#define SND_HANDLE_PMVOICE 1
#define PV_VOL_MAX 127
#define SND_VCHAT_VOL_LV 5

void GF_SndSetVChatVol(int seq_no, int handle_no) {
    u8 vol;
	const NNSSndSeqParam* p = NNS_SndArcGetSeqParam( seq_no );	//シーケンスパラメータ取得

	switch ( handle_no ) {

	//鳴き声
	case SND_HANDLE_PMVOICE:
	case SND_HANDLE_CHORUS:
		vol = PV_VOL_MAX;
		break;

	//鳴き声以外
	default:
		//エラー回避
		if( p == NULL ){
			return;
		}

		vol = p->volume;
		break;
	};

	//ボイスチャット中かチェック
	if( sub_020378CC() == TRUE ){
		GF_SndHandleSetInitialVolume( handle_no, (vol / SND_VCHAT_VOL_LV) );	//音量半分(06.07.20)
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
    u8 player_no = GF_GetPlayerNoBySeq(seq_no);				//seqナンバーから、プレイヤーナンバーを取得
	int type = GF_GetSndHandleByPlayerNo(player_no);//playerナンバーから、ハンドルナンバーを取得
	GF_SndHandleSetInitialVolume( type, vol );
}

int GF_SndPlayerCountPlayingSeqByPlayerNo(int player_no) {
    if (player_no < 0){
		GF_ASSERT(FALSE);
	}
	return NNS_SndPlayerCountPlayingSeqByPlayerNo(player_no);
}

u8 GF_GetPlayerNoBySeq(u16 no) {
    const NNSSndSeqParam* param;
	
	if( no == 0 ){
		//GF_ASSERT( (0) && "シーケンスナンバーが不正なのでプレイヤーナンバー取得失敗！" );
		return 0xff;	//エラー
	}

	//サウンドアーカイブ中の各シーケンスに対する、シーケンスパラメータ構造体を取得
	param = NNS_SndArcGetSeqParam( no );
	//OS_Printf( "プレイヤーナンバー = %d\n", param->playerNo );

	if( param == NULL ){
		return 0xff;	//エラー
	}

	return param->playerNo;
}

int GF_NNS_SndPlayerGetSeqNo(int player_no) {
	return NNS_SndPlayerGetSeqNo( player_no );
}

const NNSSndArcBankInfo* GF_GetBankInfoBySeqNo(int no) {
	return NNS_SndArcGetBankInfo( GF_GetBankBySeqNo(no) );
}

u16 GF_GetBankBySeqNo(int no) {
    const NNSSndSeqParam* param;
	
	//サウンドアーカイブ中の各シーケンスに対する、シーケンスパラメータ構造体を取得
	param = NNS_SndArcGetSeqParam( no );
	if( param == NULL ){
		OS_Printf( "バンクナンバーが取得出来ませんでした。\n" );
		OS_Printf( "渡されたシーケンスナンバーは %d です。\n", no );
		return 0;
	}

	return param->bankNo;
}


BOOL SndWorkMicCounterFull(void) {
    return GF_SndWorkMicCounterFull();
}

extern MICAutoParam _021D05F8;

MICResult GF_MIC_StartAutoSampling(MICAutoParam* p) {
    MICResult ret = MIC_StartAutoSampling( p );

    _021D05E8.unk0 = 1;

    _021D05F8 = *p;

	return ret;
}

MICResult GF_MIC_StopAutoSampling(void) {
    MICResult ret;
	SND_WORK* wk = GetSoundDataPointer();

    _021D05E8.unk0 = 0;

	MIC_StopAutoSampling();
}

void GF_MicPauseOnLidClose(void) {
    if(_021D05E8.unk0) {
        if(MIC_StopAutoSampling()) {
            GF_ASSERT(FALSE);
        }
    }
}

void GF_MicResumeOnLidOpen(void) {
    if(_021D05E8.unk0) {
        if(MIC_StartAutoSampling(&_021D05F8)) {
            GF_ASSERT(FALSE);
        }
    }
    GF_SndWorkMicCounterReset();
}

#define WAVEOUT_CH_NORMAL 14
#define WAVEOUT_CH_CHORUS 15


NNSSndWaveOutHandle* Snd_WaveOutHandleGet( u32 no ) {
	SND_WORK* wk = GetSoundDataPointer();
	u8* ch_normal_flag = GF_SdatGetAttrPtr(SND_W_ID_WAVEOUT_CH_NORMAL_FLAG);
	u8* ch_chorus_flag = GF_SdatGetAttrPtr(SND_W_ID_WAVEOUT_CH_CHORUS_FLAG);

	if( (no != WAVEOUT_CH_NORMAL) && (no != WAVEOUT_CH_CHORUS) ){
		GF_ASSERT( FALSE );
	}

	if( (no == WAVEOUT_CH_NORMAL) && (*ch_normal_flag == 0) ){	//確保フラグがOFFだったら
		GF_ASSERT(FALSE);
	}

	if( (no == WAVEOUT_CH_CHORUS) && (*ch_chorus_flag == 0) ){	//確保フラグがOFFだったら
		GF_ASSERT( FALSE );
	}

	if( no == WAVEOUT_CH_NORMAL ){
		return GF_SdatGetAttrPtr(SND_W_ID_WAVEOUT_HANDLE_NORMAL);
	}else{
		return GF_SdatGetAttrPtr(SND_W_ID_WAVEOUT_HANDLE_CHORUS);
	}
}

#define NNS_SND_WAVEOUT_INVALID_HANDLE 0

BOOL GF_AllocWaveOutChannel(u32 no) {
    u8* ch_normal_flag;
	u8* ch_chorus_flag;
	NNSSndWaveOutHandle* wave_handle;
	SND_WORK* wk = GetSoundDataPointer();

	ch_normal_flag = GF_SdatGetAttrPtr(SND_W_ID_WAVEOUT_CH_NORMAL_FLAG);
	ch_chorus_flag = GF_SdatGetAttrPtr(SND_W_ID_WAVEOUT_CH_CHORUS_FLAG);

	if( (no != WAVEOUT_CH_NORMAL) && (no != WAVEOUT_CH_CHORUS) ){
		GF_ASSERT( FALSE );
	}

	if( no == WAVEOUT_CH_NORMAL ){

		if( *ch_normal_flag == 0 ){		//確保フラグがOFFだったら

			//波形ハンドルのアドレス取得
			wave_handle = GF_SdatGetAttrPtr(SND_W_ID_WAVEOUT_HANDLE_NORMAL);
			*wave_handle = NNS_SndWaveOutAllocChannel( no );			//CH確保

			if ( *wave_handle == NNS_SND_WAVEOUT_INVALID_HANDLE ) {
				OS_Printf("NNS_SndWaveOutAllocChannel is Failed\n");
				return FALSE;			//失敗
			}
			*ch_normal_flag = 1;		//確保フラグON
		}else{
			GF_ASSERT( (0) && "チャンネルを開放していないのに、確保しようとしています！" );
		}

	}else{

		if( *ch_chorus_flag == 0 ){		//確保フラグがOFFだったら

			wave_handle = GF_SdatGetAttrPtr(SND_W_ID_WAVEOUT_HANDLE_CHORUS);
			*wave_handle = NNS_SndWaveOutAllocChannel( no );			//CH確保

			if ( *wave_handle == NNS_SND_WAVEOUT_INVALID_HANDLE ) {
				OS_Printf("NNS_SndWaveOutAllocChannel is Failed\n");
				return FALSE;			//失敗
			}
			*ch_chorus_flag = 1;		//確保フラグON
		}else{
			GF_ASSERT( (0) && "チャンネルを開放していないのに、確保しようとしています！" );
		}
	}

	return TRUE;		//成功
}

//GF_FreeWaveOutChannel
void GF_FreeWaveOutChannel(u32 no) {
    NNSSndWaveOutHandle* wave_handle;
	SND_WORK* wk		= GetSoundDataPointer();
	u8* ch_normal_flag	= GF_SdatGetAttrPtr(SND_W_ID_WAVEOUT_CH_NORMAL_FLAG);
	u8* ch_chorus_flag	= GF_SdatGetAttrPtr(SND_W_ID_WAVEOUT_CH_CHORUS_FLAG);

	if( (no != WAVEOUT_CH_NORMAL) && (no != WAVEOUT_CH_CHORUS) ){
		GF_ASSERT( (0) && "チャンネルナンバーが不正です！" );
		return;
	}

	if( no == WAVEOUT_CH_NORMAL ){
		if( *ch_normal_flag == 1 ){	//確保フラグがONだったら

			wave_handle = Snd_WaveOutHandleGet(no);
			NNS_SndWaveOutFreeChannel( *wave_handle );
			*ch_normal_flag = 0;	//確保フラグOFF

		}else{
			GF_ASSERT( (0) && "確保されていないチャンネルを開放しようとしています！" );
		}
	}else{
		if( *ch_chorus_flag == 1 ){	//確保フラグがONだったら

			wave_handle = Snd_WaveOutHandleGet(no);
			NNS_SndWaveOutFreeChannel( *wave_handle );
			*ch_chorus_flag = 0;	//確保フラグOFF

		}else{
			GF_ASSERT( (0) && "確保されていないチャンネルを開放しようとしています！" );
		}
	}

	return;
}

BOOL GF_WaveOutStart(WAVEOUT_WORK* p, u32 ch) {
    int ret;

	ret = NNS_SndWaveOutStart( *p->handle, p->format, p->dataaddr, p->loopFlag, p->loopStartSample,
								p->samples, p->sampleRate, p->volume, p->speed, p->pan );

	if( ret == FALSE ){
		OS_Printf( "波形再生失敗！\n" );

		//この関数が呼ばれる時は、必ずチャンネル確保しているはずなので、
		//再生に失敗した時は、開放処理を入れるようにする！
		GF_FreeWaveOutChannel( ch );
	}

	return ret;
}

//GF_WaveOutStop
void GF_WaveOutStop(u32 no) {
    NNS_SndWaveOutStop( *Snd_WaveOutHandleGet(no) );
	return;
}

//GF_WaveOutIsPlaying
BOOL GF_WaveOutIsPlaying(u32 no) {
    return NNS_SndWaveOutIsPlaying( *Snd_WaveOutHandleGet(no) );
}

//GF_SetWaveOutPan
void GF_SetWaveOutPan(u32 no, u8 pan) {
    u8 set_pan;

	if( pan > 127 ){
		set_pan = 127;
	}else{
		set_pan = pan;
	}

	NNS_SndWaveOutSetPan( *Snd_WaveOutHandleGet(no), set_pan );
}

//GF_SetWaveOutSpeed
void GF_SetWaveOutSpeed(u32 no, u32 spd) {
    NNS_SndWaveOutSetSpeed( *Snd_WaveOutHandleGet(no), spd );
}

//GF_SetWaveOutVolume
void GF_SetWaveOutVolume(u32 no, int vol) {
    if( sub_020378CC() == TRUE ){
		NNS_SndWaveOutSetVolume( *Snd_WaveOutHandleGet(no), (vol/SND_VCHAT_VOL_LV) );	//音量操作
	}
    else{
		NNS_SndWaveOutSetVolume( *Snd_WaveOutHandleGet(no), vol );
	}
}

BOOL GF_WaveOutStartReverse(u16 no, int vol, int pan, u32 ch, int heap_id) {
    u8* reverse_flag;
	const NNSSndArcWaveArcInfo* info;
	u32 size;
	int size2,ret;
	SND_WORK* wk = GetSoundDataPointer();
	void** reverse_buf = GF_SdatGetAttrPtr(SND_W_ID_REVERSE_BUF);

	if( (ch != WAVEOUT_CH_NORMAL) && (ch != WAVEOUT_CH_CHORUS) ){
		GF_ASSERT( (0) && "チャンネルナンバーが不正です！" );
	}

	//波形アーカイブ情報構造体NNSSndArcWaveArcInfoのポインタを返します。
	//info =  NNS_SndArcGetWaveArcInfo( WAVE_ARC_PV001 );
	info = NNS_SndArcGetWaveArcInfo( no );
	if( info == NULL ){
		GF_ASSERT( (0) && "無効な波形アーカイブ番号が指定されました！" );
		return FALSE;
	}

	//ファイルサイズ取得
	size = NNS_SndArcGetFileSize( info->fileId );
	if( size == 0 ){
		GF_ASSERT( (0) && "ファイルIDが無効です！" );
		return FALSE;
	}
	OS_Printf( "ファイルサイズ = %d\n", size );	//.smapと比較してみる

	//通常の逆再生だったら
	if( ch == WAVEOUT_CH_NORMAL ){
		//バッファ確保
		*reverse_buf = AllocFromHeap( heap_id, size );
		if( *reverse_buf == NULL ){
			GF_ASSERT( (0) && "メモリ確保に失敗しました！" );
			return FALSE;
		}
		memset( *reverse_buf, 0, size );

		//サウンドアーカイブ中のファイルを読み込む
		size2 = NNS_SndArcReadFile( info->fileId, *reverse_buf, size, 0 );
		if( size2 == -1 ){
			GF_ASSERT( (0) && "読み込みに失敗しました！" );
			return FALSE;
		}

		//データを入れ替える
		GF_SndBufReverse( *reverse_buf, size );
	}

	//WAVEOUT_WORK型にパラメータセット
	{
		WAVEOUT_WORK waveout_wk;
		waveout_wk.handle			= Snd_WaveOutHandleGet(ch);	//波形再生ハンドル
		waveout_wk.format			= NNS_SND_WAVE_FORMAT_PCM8;	//波形データフォーマット
		waveout_wk.dataaddr			= *reverse_buf;				//波形データの先頭アドレス
		waveout_wk.loopFlag			= FALSE;					//ループフラグ
		waveout_wk.loopStartSample	= 0;						//ループ開始サンプル位置
		waveout_wk.samples			= size;						//波形データのサンプル数
		waveout_wk.sampleRate		= 13379;					//波形データのサンプリングレート
		waveout_wk.volume			= vol;						//音量
		waveout_wk.speed			= 24576;					//再生スピード
		waveout_wk.pan				= pan;						//パン(0-127)

		//波形再生
		ret = GF_WaveOutStart( &waveout_wk, ch );

		//ボイスチャットの音量対応
		GF_SetWaveOutVolume( ch, vol );

		//BANKの設定を"PCM8"にするとうまくいく
	}

	reverse_flag = GF_SdatGetAttrPtr( SND_W_ID_REVERSE_FLAG );
	*reverse_flag = 1;	//逆再生使用フラグON

    return ret;
}

void GF_SndBufReverse(u8* p, u32 size) {
    	int i;
	u8 temp;

	//データを入れ替える( [0]-[MAX]、[1]-[MAX-1]... )
	for( i=0; i < (size / 2) ;i++ ){
		temp		= p[i];			//退避
		p[i]		= p[size-1-i];
		p[size-1-i]	= temp;
	}
}

void GF_WaveOutStopReverse(u32 no) {
    SND_WORK* wk		= GetSoundDataPointer();
	u8* reverse_flag	= GF_SdatGetAttrPtr(SND_W_ID_REVERSE_FLAG);
	void** reverse_buf	= GF_SdatGetAttrPtr(SND_W_ID_REVERSE_BUF);

	if( (no != WAVEOUT_CH_NORMAL) && (no != WAVEOUT_CH_CHORUS) ){
		GF_ASSERT( (0) && "チャンネルナンバーが不正です！" );
	}

	GF_WaveOutStop( no );										//鳴き声停止

	//逆再生使用フラグ
	if( *reverse_flag == 1 ){									//逆再生使用フラグが立っていたら
		*reverse_flag = 0;										//逆再生使用フラグOFF
		FreeToHeap( *reverse_buf );						//バッファ開放
	}
}

BOOL GF_SndCaptureIsActive(void) {
    BOOL active = NNS_SndCaptureIsActive(  );
    if(active == TRUE) {
        GF_GetCaptureType();
    }
    return active;
}


//GF_GetCaptureType
NNSSndCaptureType GF_GetCaptureType(void) {
    return NNS_SndCaptureGetCaptureType();
}

//GF_SndCaptureStopReverb
void GF_SndCaptureStopReverb(int frame) {
    NNS_SndCaptureStopReverb( frame );
}

void GF_SndHandleSetTrackPitch(int handle_no, u16 bitmask, int pitch) {
    NNS_SndPlayerSetTrackPitch( GF_GetSoundHandle(handle_no), bitmask, pitch );
}

//GF_SetHandleTrackBySeqNo
void GF_SetHandleTrackBySeqNo(u16 no, u16 bitmask, int pitch) {
    u8 player_no = GF_GetPlayerNoBySeq(no);				//seqナンバーから、プレイヤーナンバーを取得
	int type = GF_GetSndHandleByPlayerNo(player_no);//playerナンバーから、ハンドルナンバーを取得
	GF_SndHandleSetTrackPitch( type, bitmask, pitch );
}

//GF_SetHandleTrackByPlayerNo
void GF_SetHandleTrackByPlayerNo(u8 player_no, u16 bitmask, int pitch) {
    int type = GF_GetSndHandleByPlayerNo(player_no);
    GF_SndHandleSetTrackPitch(type, bitmask, pitch);
}

void GF_SndHandleSetTrackPan(int handle_no, u16 bitmask, int pan) {
    NNS_SndPlayerSetTrackPan( GF_GetSoundHandle(handle_no), bitmask, pan );
}

void GF_SndHandleSetTempoRatio(int handle_no, int tempo) {
    NNS_SndPlayerSetTempoRatio( GF_GetSoundHandle(handle_no), tempo );
}

void GF_SndSetMonoFlag(BOOL flag) {
    NNS_SndSetMonoFlag( flag );
	_021D05E8.mono_flag = flag;
}

//GF_SetFadeCount
void GF_SetFadeCount(int frame) {
    int* fade_count = GF_SdatGetAttrPtr(SND_W_ID_FADE_COUNT);
	*fade_count = frame;
}

//GF_SetNextWait
void GF_SetNextWait(int frame) {
    int* next_wait = GF_SdatGetAttrPtr(SND_W_ID_NEXT_WAIT);
	*next_wait = frame;
}

int GF_SndGetAfterFadeDelayTimer(void) {
    u16* next_wait = GF_SdatGetAttrPtr(SND_W_ID_NEXT_WAIT);

	if( *next_wait <= 0 ){
		*next_wait = 0;
		return 0;
	}

	(*next_wait)--;
	return *next_wait;
}

//GF_SetMasterVolume
void GF_SetMasterVolume(int vol) {
    NNS_SndSetMasterVolume( vol );
}

#define SWAVE_BUFFER_SIZE 2000
extern s8 sWaveBuffer[SWAVE_BUFFER_SIZE];

//GF_GetWaveBufAdrs
s8* GF_GetWaveBufAdrs(void) {
    return sWaveBuffer;
}

//GF_SetSndBankFlag
void GF_SetSndBankFlag(int flag) {
    *(u8*) GF_SdatGetAttrPtr(SND_W_ID_BANK_FLAG) = flag;
}

BOOL GF_NowStartMusicId(u16 no, int frame, int next_wait, u8 flag, void* adrs) {
	return Snd_FadeOutNextPlaySet( 4, no, frame, next_wait, flag, adrs );
}

//Snd_FadeOutNextPlaySet
BOOL Snd_FadeOutNextPlaySet(u8 scene, u16 no, int frame, int next_wait, u8 flag, void* adrs) {
    u8* scene_sub	= GF_SdatGetAttrPtr(SND_W_ID_SCENE_SUB);

	//フェード共通処理
	Snd_FadeCommonSet( scene, no, frame, next_wait, flag, adrs );
	
	//サブシーンをクリア
	*scene_sub = SND_SCENE_DUMMY;

	//ステータスを再セット
	GF_SndSetState( 5 );	//ステータス(フェードアウト→再生)//SND_STATUS_FADEOUT_NEXT_PLAY
	return 1;
}

BOOL GF_FadeStartMusicId(u16 no, int frame, int next_wait, int next_frame, u8 flag, void* adrs) {
    return Snd_FadeOutNextFadeInSet(4, no, frame, next_wait, next_frame, flag, adrs);
}

//Snd_FadeOutNextFadeInSet
BOOL Snd_FadeOutNextFadeInSet(u8 scene, u16 no, int frame, int next_wait, int next_frame, u8 flag, void* adrs) {
    int* next_frame_wk = GF_SdatGetAttrPtr(SND_W_ID_NEXT_FRAME);

	//フェード共通処理
	Snd_FadeCommonSet( scene, no, frame, next_wait, flag, adrs );
	
	*next_frame_wk = next_frame;						//次のBGMのフェードインフラーム数セット

	//ステータスを再セット
	GF_SndSetState( 6 );	//ステータス(フェードアウト→フェードイン)//SND_STATUS_FADEOUT_NEXT_FADEIN
    return 1;
}

//Snd_FadeCommonSet
static void Snd_FadeCommonSet(u8 scene, u16 no, int frame, int next_wait, u8 flag, void* adrs ) {
    const NNSSndArcBankInfo** info		= GF_SdatGetAttrPtr(SND_W_ID_BANK_INFO);

	//フェードアウト開始(ステータス＝フェードアウト)
	GF_SndStartFadeOutBGM( 0, frame ); //BGM_VOL_MIN

	//フェードアウト中の"今のBGMナンバー"は、必ず0が入っているようにする！
	
	//再度ゾーン切り替え処理が呼ばれるように、今のBGMナンバーをクリアする！
	GF_SetCurrentPlayingBGM( 0 );							//今のBGMナンバーセット

	//次の(ゾーン)BGMナンバーをセットしておく
	GF_SetNextBGM( no );							//次のBGMナンバーセット
	GF_SetNextWait( next_wait );					//次のBGMを鳴らすまでのウェイトセット

	//06.01.25削除
	//Snd_SceneSet( scene );						//変更するシーンセット
	
	*info = GF_GetBankInfoBySeqNo( no );			//バンク情報構造体セット

	GF_SetSndBankFlag( flag );
}

void GF_SndSetAllocatableChannelForBGMPlayer(int channel) {
    NNS_SndPlayerSetAllocatableChannel(7, channel);
}


#define PLAYER_BGM_NORMAL_CH 0x0000a7fe

void GF_SndSetBgmChannelAndReverb(int flag) {
    if( flag == 0 ){
		GF_SndSetAllocatableChannelForBGMPlayer( PLAYER_BGM_NORMAL_CH );	//PLAYER_GMの使用チャンネルを元に戻す
		GF_SndCaptureStopReverb( 0 );							//リバーブ停止
		//OS_Printf( "\n**********\nOP,ED リバーブ停止！\n*********\n" );
	} 
    else {
        GF_SndSetAllocatableChannelForBGMPlayer(0x00003FFF);
    }

	GF_SndCaptureIsActive();
}

//Snd_FieldPauseOrStop
void Snd_FieldPauseOrStop(void) {
    if( (GF_SndGetFadeTimer() == 0) && 
		(GF_NNS_SndPlayerGetSeqNo(GF_GetSoundHandle(SND_HANDLE_FIELD)) != -1) ){

		sub_02005FD8();											//フィールドBGMを抜かして全停止
		GF_SndPause( PLAYER_FIELD, TRUE );					//フィールドBGMポーズ

	}
    else{
		sub_02005FA0();												//全停止
	}
}

void GF_SndHandleSetPlayerVolume(int player_no, int vol) {
    NNS_SndPlayerSetPlayerVolume(player_no, vol);
}

//Snd_SetPVDoubleFlag
void Snd_SetPVDoubleFlag(u8 flag) {
    *(u8*) GF_SdatGetAttrPtr(53) = flag;
}

//Snd_SetBattleRecFlag
void Snd_SetBattleRecFlag(u8 flag) {
    *(u8*) GF_SdatGetAttrPtr(54) = flag;
}

//GF_SndPlayerReadVariableBySeq
BOOL GF_SndPlayerReadVariableBySeq(u16 seq_no, u16 varNo, s16* var) {
    if(var == NULL) {
        GF_ASSERT(FALSE);
    }
    if(varNo > 15) {
        GF_ASSERT(FALSE);
    }
    int player_no = GF_GetPlayerNoBySeq(seq_no);
    int type = GF_GetSndHandleByPlayerNo(player_no);
    return NNS_SndPlayerReadVariable(GF_GetSoundHandle(type), varNo, var);
}


extern const u8 _020F5710[4][2];

void sub_02005BA8(u16 no) {
    u8* index = (u8*) GF_SdatGetAttrPtr(55);
    GF_SetVolumeBySeqNo(no, _020F5710[*index << 1][1]);
    GF_SndHandleSetTrackPitch(4, 0x0000FFFF, _020F5710[*index << 1][0]);
    if(index[1] >= 8) {
        index[1] = 0;
    }
}

//Snd_SetUNK_56
void Snd_SetUNK_56(u8 unk) {
    *(u8*) GF_SdatGetAttrPtr(56) = unk;
}

//Snd_GetUNK_56
u8 Snd_GetUNK_56(void) {
    return *(u8*) GF_SdatGetAttrPtr(56);
}

//Snd_SetGBSoundsState
void Snd_SetGBSoundsState(u8 val) {
    *(u8*) GF_SdatGetAttrPtr(57) = val;
}


u8 SoundSys_GetGBSoundsState(void) {
    return *(u8*) GF_SdatGetAttrPtr(57);
}

void SoundSys_ToggleGBSounds(void) {
    u8 state = SoundSys_GetGBSoundsState();
    if(state == 0) {
        Snd_SetGBSoundsState(1);
    }
    else {
        Snd_SetGBSoundsState(0);
    }
    if(GF_GetNextBGM() == 0) {
        u16 bgm = GF_GetCurrentPlayingBGM();
        int vol = GF_SndWorkGetGbSoundsVolume();
        if(bgm != GBSounds_GetGBSeqNoByDSSeqNo(bgm)) {
            PlayBGM(bgm);
        }
        GF_SndHandleMoveVolume(0, vol, 0);
    }
}

extern volatile u16 GS_SeqPairs[136][2];

u16 GBSounds_GetGBSeqNoByDSSeqNo(u16 seq_no) {
    for(u16 c = 0; c < 136; c++) {
        if(seq_no == GS_SeqPairs[c][0]) {
            return GS_SeqPairs[c][1];
        }
    }
    return seq_no;
}


u16 GBSounds_GetDSSeqNoByGBSeqNo(u16 seq_no) {
    for(u16 c = 0; c < 136; c++) {
        if(seq_no == GS_SeqPairs[c][1]) {
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
    _021D05E8.unk4 = 0;
}
