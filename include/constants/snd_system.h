#ifndef POKEHEARTGOLD_SND_SYSTEM_H
#define POKEHEARTGOLD_SND_SYSTEM_H


#define SND_HEAP_SAVE_START                 0
#define SND_HEAP_SAVE_GLOBAL                1            
#define SND_HEAP_SAVE_BGM_BANK              2            
#define SND_HEAP_SAVE_SE                    3            
#define SND_HEAP_SAVE_BGM                   4                    
#define SND_HEAP_SAVE_SUB_SE                5                    
#define SND_HEAP_SAVE_ME                    6                    
#define SND_HEAP_SAVE_MAX                   7                    


#define SND_W_ID_WAVEOUT_HANDLE_NORMAL      0         
#define SND_W_ID_WAVEOUT_HANDLE_CHORUS      1        //波形ハンドル
#define SND_W_ID_BANK_INFO                  2        //バンク情報構造体
#define SND_W_ID_CAPTURE_BUF                3        //キャプチャバッファ
#define SND_W_ID_CALLBACK_INFO              4        //エフェクトのコールバック変数
#define SND_W_ID_CTRL_BGM_FLAG              5        //フィールドBGM固定フラグ
#define SND_W_ID_PV_WAIT_WORK               6        //2匹分のワークのどちらを使用するか
#define SND_W_ID_FADE_COUNT                 7        //フェードカウンター
#define SND_W_ID_NEXT_WAIT                  8        //次のBGMを鳴らすまでのウェイト
#define SND_W_ID_NEXT_FRAME                 9        //次のBGMのフェードインフレーム数
#define SND_W_ID_CUR_BGM_NO                10        //今のBGMナンバー(セーブする必要あり！あとで移動する)
#define SND_W_ID_NEXT_BGM_NO               11        //次のBGMナンバー(セーブする必要あり！あとで移動する)
#define SND_W_ID_FIELD_PAUSE_FLAG          12    //PLAYER_FIELDをポーズしているかフラグ
#define SND_W_ID_BGM_PAUSE_FLAG            13     //PLAYER_BGMをポーズしているかフラグ
#define SND_W_ID_ME_WAIT                   14      //MEウェイト
#define SND_W_ID_REVERSE_FLAG              15       //逆再生使用フラグ
#define SND_W_ID_WAVEOUT_CH_NORMAL_FLAG    16     //波形で使用するCHを確保したかフラグ
#define SND_W_ID_WAVEOUT_CH_CHORUS_FLAG    17     //波形で使用するCHを確保したかフラグ(CHORUS)
#define SND_W_ID_CHORUS_FLAG               18      //コーラス使用フラグ
#define SND_W_ID_BANK_FLAG                 19        //バンク切り替えるかフラグ
#define SND_W_ID_FILTER_SIZE               20      //フィルターサイズ
#define SND_W_ID_SCENE_MAIN                21    //現在のメインシーン
#define SND_W_ID_SCENE_SUB                 22        //現在のサブシーン
#define SND_W_ID_HEAP_SAVE_START           23      //サウンドヒープ階層レベル
#define SND_W_ID_HEAP_SAVE_GLOBAL          24   //Heaps are correct
#define SND_W_ID_HEAP_SAVE_BGM_BANK        25     
#define SND_W_ID_HEAP_SAVE_SE              26     
#define SND_W_ID_HEAP_SAVE_BGM             27     
#define SND_W_ID_HEAP_SAVE_SUB_SE          28     
#define SND_W_ID_HEAP_SAVE_ME              29     
#define SND_W_ID_PERAP_PLAY_FLAG           30      //ペラップの録音した鳴き声を再生しているかフラグ
#define SND_W_ID_PERAP_DEFAULT_FLAG        31     //ペラップのデフォルトの鳴き声を再生するフラグ
#define SND_W_ID_ZONE_BGM                  32       //ゾーンのBGMナンバー
#define SND_W_ID_WAVE_DATA                 33        //波形データのポインタ
#define SND_W_ID_REVERSE_BUF               34      //逆再生用のバッファのポインタ
#define SND_W_ID_LENGTH_TCB                35     //鳴き声再生時間TCB
#define SND_W_ID_MY_PERAP_PTR              36       //自分のぺラップボイスのポインタ
#define SND_W_ID_PERAP_PTR1                37     //ぺラップボイスのポインタ
#define SND_W_ID_PERAP_PTR2                38     //ぺラップボイスのポインタ
#define SND_W_ID_PERAP_PTR3                39     //ぺラップボイスのポインタ
#define SND_W_ID_PERAP_PTR4                40     //ぺラップボイスのポインタ
#define SND_W_ID_PV_PTN                    41     //パターン(snd_tool.h参照)
#define SND_W_ID_PV_PAN                    42     //-128～127
#define SND_W_ID_PV_VOL                    43     //ボリューム(0-127)
#define SND_W_ID_PV_HEAP_ID                44     //ヒープID
#define SND_W_ID_PV_NO                     45        //ポケモンナンバー
#define SND_W_ID_PV_WAIT                   46      //再生するまでのウェイト
#define SND_W_ID_PV_PTN_2                  47       //パターン(snd_tool.h参照)
#define SND_W_ID_PV_PAN_2                  48      //-128～127
#define SND_W_ID_PV_VOL_2                  49       //ボリューム(0-127)
#define SND_W_ID_PV_HEAP_ID_2              50       //ヒープID
#define SND_W_ID_PV_NO_2                   51      //ポケモンナンバー
#define SND_W_ID_PV_WAIT_2                 52        //再生するまでのウェイト
#define SND_W_ID_PV_DOUBLE_FLAG            53     //鳴き声を2つ再生出来るようにするフラグ
#define SND_W_ID_BATTLE_REC_FLAG           54      //バトル録画再生を判別するフラグ
#define SND_W_ID_UNK_55                    55
#define SND_W_ID_UNK_56                    56                
#define SND_W_ID_UNK_57                    57
#define SND_W_ID_UNK_58                    58            
#define SND_W_ID_MAX                       59



//Scene Definitions
//Main Scenes; Copied from Plat leak so some may be changes/unused

#define SND_SCENE_DUMMY                     0                 
#define SND_SCENE_MAIN                      1 //The starting point is correct
#define SND_SCENE_TITLE                     1 //Y
#define SND_SCENE_OPENING                   2 //Y
#define SND_SCENE_TRADE                     3 //Y
#define SND_SCENE_FIELD                     4 //Y
#define SND_SCENE_BATTLE                    5 //Y
#define SND_SCENE_CONTEST                   6 //Y
#define SND_SCENE_CON_IMAGE                 7 //Y
#define SND_SCENE_DENDOU                    8 //Y
#define SND_SCENE_AGB                       9 //Y
#define SND_SCENE_HUSIGI                   10 //Y
#define SND_SCENE_P2P                      11 //Y
#define SND_SCENE_NUTMIXER                 12 //Y
#define SND_SCENE_EGG                      13 //Y
#define SND_SCENE_ENDING                   14 //Y
#define SND_SCENE_GURUGURU                 15 //Y
#define SND_SCENE_BCT                      16 //Y
#define SND_SCENE_EMAIL                    17 //Y
#define SND_SCENE_GIRA                     18    //ギラティナイベント(画面切り替え)
#define SND_SCENE_WIFI_LOBBY_GAME          19 //Y
#define SND_SCENE_WIFI_LOBBY_PARADE        20 //Y
#define SND_SCENE_WIFI_LOBBY_HIROBA        21 //Y
#define SND_SCENE_DEMO01                   22 //Y
#define SND_SCENE_WIFI_WORLD_TRADE         23 //Y
#define SND_SCENE_THLON                    24
#define SND_SCENE_THLON_OPED               25

//Subscenes (called by Main Scenes)
#define SND_SCENE_SUB                      51 //The starting point is correct
#define SND_SCENE_SUB_BAG                  51 //Y
#define SND_SCENE_SUB_NAMEIN               52 //Y
#define SND_SCENE_SUB_IMAGE                53 //Y
#define SND_SCENE_SUB_ZUKAN                54 //Y
#define SND_SCENE_SUB_TOWNMAP              55 //Y
#define SND_SCENE_SUB_TRCARD               56 //Y
#define SND_SCENE_SUB_POKELIST             57 //Y
#define SND_SCENE_SUB_DIG                  58 //Y
#define SND_SCENE_SUB_CUSTOM               59 //Y
#define SND_SCENE_SUB_FIRSTPOKE            60 //Y
#define SND_SCENE_SUB_PST                  61 //Y
#define SND_SCENE_SUB_PMS                  62 //Y
#define SND_SCENE_SUB_CLIMAX               63 //Y
#define SND_SCENE_SUB_SLOT                 64 //Y
#define SND_SCENE_SUB_FNOTE                65 //Y
#define SND_SCENE_SUB_SCRATCH              66 //Y
#define SND_SCENE_SUB_UNK_67               67
#define SND_SCENE_SUB_LINEAR               68
#define SND_SCENE_SUB_PLANTER              69
#define SND_SCENE_SUB_COIN                 70
#define SND_SCENE_SUB_DENDO                71
#define SND_SCENE_SUB_JUICE                72
#define SND_SCENE_SUB_PHC                  73
#define SND_SCENE_SUB_SEKIBAN              74
#define SND_SCENE_SUB_EVENT                75

#endif

