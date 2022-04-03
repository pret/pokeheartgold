#ifndef POKEHEARTGOLD_SND_SYSTEM_H
#define POKEHEARTGOLD_SND_SYSTEM_H


//Heap definitions
#define SND_HEAP_SAVE_START                 0
#define SND_HEAP_SAVE_GLOBAL                1            
#define SND_HEAP_SAVE_BGM_BANK              2            
#define SND_HEAP_SAVE_SE                    3            
#define SND_HEAP_SAVE_BGM                   4                    
#define SND_HEAP_SAVE_SUB_SE                5                    
#define SND_HEAP_SAVE_ME                    6                    
#define SND_HEAP_SAVE_MAX                   7                    

//Sound W IDs
#define SND_W_ID_WAVEOUT_HANDLE_NORMAL      0         
#define SND_W_ID_WAVEOUT_HANDLE_CHORUS      1        
#define SND_W_ID_BANK_INFO                  2        
#define SND_W_ID_CAPTURE_BUF                3        
#define SND_W_ID_CALLBACK_INFO              4        
#define SND_W_ID_CTRL_BGM_FLAG              5        
#define SND_W_ID_PV_WAIT_WORK               6        
#define SND_W_ID_FADE_COUNT                 7        
#define SND_W_ID_NEXT_WAIT                  8        
#define SND_W_ID_NEXT_FRAME                 9        
#define SND_W_ID_CUR_BGM_NO                10        
#define SND_W_ID_NEXT_BGM_NO               11        
#define SND_W_ID_FIELD_PAUSE_FLAG          12    
#define SND_W_ID_BGM_PAUSE_FLAG            13     
#define SND_W_ID_ME_WAIT                   14      
#define SND_W_ID_REVERSE_FLAG              15       
#define SND_W_ID_WAVEOUT_CH_NORMAL_FLAG    16     
#define SND_W_ID_WAVEOUT_CH_CHORUS_FLAG    17     
#define SND_W_ID_CHORUS_FLAG               18      
#define SND_W_ID_BANK_FLAG                 19        
#define SND_W_ID_FILTER_SIZE               20     
#define SND_W_ID_SCENE_MAIN                21  
#define SND_W_ID_SCENE_SUB                 22       
#define SND_W_ID_HEAP_SAVE_START           23      
#define SND_W_ID_HEAP_SAVE_GLOBAL          24   
#define SND_W_ID_HEAP_SAVE_BGM_BANK        25     
#define SND_W_ID_HEAP_SAVE_SE              26     
#define SND_W_ID_HEAP_SAVE_BGM             27     
#define SND_W_ID_HEAP_SAVE_SUB_SE          28     
#define SND_W_ID_HEAP_SAVE_ME              29     
#define SND_W_ID_CHATOT_PLAY_FLAG           30      
#define SND_W_ID_CHATOT_DEFAULT_FLAG        31     
#define SND_W_ID_ZONE_BGM                  32       
#define SND_W_ID_WAVE_DATA                 33       
#define SND_W_ID_REVERSE_BUF               34    
#define SND_W_ID_LENGTH_TCB                35    
#define SND_W_ID_MY_CHATOT_PTR              36    
#define SND_W_ID_CHATOT_PTR1                37    
#define SND_W_ID_CHATOT_PTR2                38    
#define SND_W_ID_CHATOT_PTR3                39    
#define SND_W_ID_CHATOT_PTR4                40     
#define SND_W_ID_PV_PTN                    41    
#define SND_W_ID_PV_PAN                    42    
#define SND_W_ID_PV_VOL                    43   
#define SND_W_ID_PV_HEAP_ID                44   
#define SND_W_ID_PV_NO                     45    
#define SND_W_ID_PV_WAIT                   46     
#define SND_W_ID_PV_PTN_2                  47    
#define SND_W_ID_PV_PAN_2                  48    
#define SND_W_ID_PV_VOL_2                  49    
#define SND_W_ID_PV_HEAP_ID_2              50    
#define SND_W_ID_PV_NO_2                   51   
#define SND_W_ID_PV_WAIT_2                 52    
#define SND_W_ID_PV_DOUBLE_FLAG            53   
#define SND_W_ID_BATTLE_REC_FLAG           54     
#define SND_W_ID_UNK_55                    55
#define SND_W_ID_UNK_56                    56                
#define SND_W_ID_UNK_57                    57
#define SND_W_ID_UNK_58                    58            
#define SND_W_ID_MAX                       59

//Sound Scenes
#define SND_SCENE_DUMMY                     0                 
#define SND_SCENE_MAIN                      1 
#define SND_SCENE_TITLE                     1 
#define SND_SCENE_OPENING                   2 
#define SND_SCENE_TRADE                     3 
#define SND_SCENE_FIELD                     4 
#define SND_SCENE_BATTLE                    5 
#define SND_SCENE_CONTEST                   6 
#define SND_SCENE_CON_IMAGE                 7 
#define SND_SCENE_HALL_OF_FAME              8 
#define SND_SCENE_AGB                       9 
#define SND_SCENE_MYSTERY_GIFT             10 
#define SND_SCENE_P2P                      11 
#define SND_SCENE_NUTMIXER                 12 
#define SND_SCENE_EGG                      13 
#define SND_SCENE_ENDING                   14 
#define SND_SCENE_SPIN_TRADE               15 
#define SND_SCENE_BCT                      16 
#define SND_SCENE_EMAIL                    17 
#define SND_SCENE_GIRA                     18  
#define SND_SCENE_WIFI_LOBBY_GAME          19 
#define SND_SCENE_WIFI_LOBBY_PARADE        20 
#define SND_SCENE_WIFI_LOBBY_HIROBA        21 
#define SND_SCENE_DEMO01                   22 
#define SND_SCENE_WIFI_WORLD_TRADE         23 
#define SND_SCENE_THLON                    24 //THLON = Pokeathlon
#define SND_SCENE_THLON_OPED               25

//Sound sub-scenes
#define SND_SCENE_SUB                      51 
#define SND_SCENE_SUB_BAG                  51 
#define SND_SCENE_SUB_NAMEIN               52 
#define SND_SCENE_SUB_IMAGE                53 
#define SND_SCENE_SUB_ZUKAN                54 
#define SND_SCENE_SUB_TOWNMAP              55 
#define SND_SCENE_SUB_TRCARD               56 
#define SND_SCENE_SUB_POKELIST             57 
#define SND_SCENE_SUB_DIG                  58 
#define SND_SCENE_SUB_CUSTOM               59 
#define SND_SCENE_SUB_FIRSTPOKE            60 
#define SND_SCENE_SUB_PST                  61 
#define SND_SCENE_SUB_PMS                  62 
#define SND_SCENE_SUB_CLIMAX               63 
#define SND_SCENE_SUB_SLOT                 64 
#define SND_SCENE_SUB_FNOTE                65 
#define SND_SCENE_SUB_SCRATCH              66 
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

