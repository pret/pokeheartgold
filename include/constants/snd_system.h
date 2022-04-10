#ifndef POKEHEARTGOLD_SND_SYSTEM_H
#define POKEHEARTGOLD_SND_SYSTEM_H


//Heap definitions
#define SOUND_SAVE_HEAP_START                 0
#define SOUND_SAVE_HEAP_GLOBAL                1            
#define SOUND_SAVE_HEAP_BGM_BANK              2            
#define SOUND_SAVE_HEAP_SE                    3            
#define SOUND_SAVE_HEAP_BGM                   4                    
#define SOUND_SAVE_HEAP_SUB_SE                5                    
#define SOUND_SAVE_HEAP_ME                    6                    
#define SOUND_SAVE_HEAP_MAX                   7                    

//Sound Work constants
#define SOUND_WORK_WAVEOUT_HANDLE_NORMAL      0         
#define SOUND_WORK_WAVEOUT_HANDLE_CHORUS      1        
#define SOUND_WORK_BANK_INFO                  2        
#define SOUND_WORK_CAPTURE_BUF                3        
#define SOUND_WORK_CALLBACK_INFO              4        
#define SOUND_WORK_CTRL_BGM_FLAG              5        
#define SOUND_WORK_PV_WAIT_WORK               6        
#define SOUND_WORK_FADE_COUNT                 7        
#define SOUND_WORK_NEXT_WAIT                  8        
#define SOUND_WORK_NEXT_FRAME                 9        
#define SOUND_WORK_CUR_BGM_NO                10        
#define SOUND_WORK_NEXT_BGM_NO               11        
#define SOUND_WORK_FIELD_PAUSE_FLAG          12    
#define SOUND_WORK_BGM_PAUSE_FLAG            13     
#define SOUND_WORK_ME_WAIT                   14      
#define SOUND_WORK_REVERSE_FLAG              15       
#define SOUND_WORK_WAVEOUT_CH_NORMAL_FLAG    16     
#define SOUND_WORK_WAVEOUT_CH_CHORUS_FLAG    17     
#define SOUND_WORK_CHORUS_FLAG               18      
#define SOUND_WORK_BANK_FLAG                 19        
#define SOUND_WORK_FILTER_SIZE               20     
#define SOUND_WORK_SCENE_MAIN                21  
#define SOUND_WORK_SCENE_SUB                 22       
#define SOUND_WORK_HEAP_SAVE_START           23      
#define SOUND_WORK_HEAP_SAVE_GLOBAL          24   
#define SOUND_WORK_HEAP_SAVE_BGM_BANK        25     
#define SOUND_WORK_HEAP_SAVE_SE              26     
#define SOUND_WORK_HEAP_SAVE_BGM             27     
#define SOUND_WORK_HEAP_SAVE_SUB_SE          28     
#define SOUND_WORK_HEAP_SAVE_ME              29     
#define SOUND_WORK_CHATOT_PLAY_FLAG           30      
#define SOUND_WORK_CHATOT_DEFAULT_FLAG        31     
#define SOUND_WORK_ZONE_BGM                  32       
#define SOUND_WORK_WAVE_DATA                 33       
#define SOUND_WORK_REVERSE_BUF               34    
#define SOUND_WORK_LENGTH_TCB                35    
#define SOUND_WORK_MY_CHATOT_PTR              36    
#define SOUND_WORK_CHATOT_PTR1                37    
#define SOUND_WORK_CHATOT_PTR2                38    
#define SOUND_WORK_CHATOT_PTR3                39    
#define SOUND_WORK_CHATOT_PTR4                40     
#define SOUND_WORK_PV_PTN                    41    
#define SOUND_WORK_PV_PAN                    42    
#define SOUND_WORK_VOLUME                    43   
#define SOUND_WORK_PV_HEAP_ID                44   
#define SOUND_WORK_PV_NO                     45    
#define SOUND_WORK_PV_WAIT                   46     
#define SOUND_WORK_PV_PTN_2                  47    
#define SOUND_WORK_PV_PAN_2                  48    
#define SOUND_WORK_VOLUME_2                  49    
#define SOUND_WORK_PV_HEAP_ID_2              50    
#define SOUND_WORK_PV_NO_2                   51   
#define SOUND_WORK_PV_WAIT_2                 52    
#define SOUND_WORK_PV_DOUBLE_FLAG            53   
#define SOUND_WORK_BATTLE_REC_FLAG           54     
#define SOUND_WORK_UNK_55                    55
#define SOUND_WORK_UNK_56                    56                
#define SOUND_WORK_UNK_57                    57
#define SOUND_WORK_UNK_58                    58            
#define SOUND_WORK_MAX                       59

//Sound Scenes
#define SOUND_MAIN_DUMMY                     0                 
#define SOUND_MAIN_MAIN                      1 
#define SOUND_MAIN_TITLE                     1 
#define SOUND_MAIN_OPENING                   2 
#define SOUND_MAIN_TRADE                     3 
#define SOUND_MAIN_FIELD                     4 
#define SOUND_MAIN_BATTLE                    5 
#define SOUND_MAIN_CONTEST                   6 
#define SOUND_MAIN_CON_IMAGE                 7 
#define SOUND_MAIN_HALL_OF_FAME              8 
#define SOUND_MAIN_AGB                       9 
#define SOUND_MAIN_MYSTERY_GIFT             10 
#define SOUND_MAIN_P2P                      11 
#define SOUND_MAIN_POFFIN                   12 
#define SOUND_MAIN_EGG                      13 
#define SOUND_MAIN_ENDING                   14 
#define SOUND_MAIN_SPIN_TRADE               15 
#define SOUND_MAIN_BCT                      16 
#define SOUND_MAIN_EMAIL                    17 
#define SOUND_MAIN_GIRA                     18  
#define SOUND_MAIN_WIFI_LOBBY_GAME          19 
#define SOUND_MAIN_WIFI_LOBBY_PARADE        20 
#define SOUND_MAIN_WIFI_LOBBY_PLAZA         21 
#define SOUND_MAIN_DEMO01                   22 
#define SOUND_MAIN_WIFI_WORLD_TRADE         23 
#define SOUND_MAIN_THLON                    24 
#define SOUND_MAIN_THLON_OPED               25

//Sub sounds
#define SOUND_SUB                           51 
#define SOUND_SUB_BAG                       51 
#define SOUND_SUB_NAMEIN                    52 
#define SOUND_SUB_IMAGE                     53 
#define SOUND_SUB_POKEDEX                   54 
#define SOUND_SUB_TOWNMAP                   55 
#define SOUND_SUB_TRCARD                    56 
#define SOUND_SUB_POKELIST                  57 
#define SOUND_SUB_DIG                       58 
#define SOUND_SUB_CUSTOM                    59 
#define SOUND_SUB_CHOOSE_STARTER            60 
#define SOUND_SUB_PST                       61 
#define SOUND_SUB_PMS                       62 
#define SOUND_SUB_CLIMAX                    63 
#define SOUND_SUB_SLOT                      64 
#define SOUND_SUB_FNOTE                     65 
#define SOUND_SUB_SCRATCH                   66 
#define SOUND_SUB_UNK_67                    67
#define SOUND_SUB_LINEAR                    68
#define SOUND_SUB_PLANTER                   69
#define SOUND_SUB_COIN                      70
#define SOUND_SUB_HALL_OF_FAME              71
#define SOUND_SUB_JUICE                     72
#define SOUND_SUB_PHC                       73
#define SOUND_SUB_SEKIBAN                   74
#define SOUND_SUB_EVENT                     75

#endif

