#ifndef POKEHEARTGOLD_CONSTANTS_BATTLE_H
#define POKEHEARTGOLD_CONSTANTS_BATTLE_H

//Battler IDs
#define BATTLER_PLAYER  0
#define BATTLER_ENEMY   1
#define BATTLER_PLAYER2 2
#define BATTLER_ENEMY2  3

enum BattleSide {
    B_SIDE_ALL,
    B_SIDE_1,
    B_SIDE_2,
    B_SIDE_PLAYER,
    B_SIDE_OPPONENT,
    B_SIDE_5,
    B_SIDE_6,
    B_SIDE_7,
    B_SIDE_8,
    B_SIDE_9,
    B_SIDE_10,
    B_SIDE_11,
    B_SIDE_12,
    B_SIDE_13,
    B_SIDE_14,
    B_SIDE_15,
    B_SIDE_16,
    B_SIDE_17,
    B_SIDE_18
};

enum Terrain {
    TERRAIN_PLAIN,
    TERRAIN_SAND,
    TERRAIN_GRASS,
    TERRAIN_PUDDLE,
    TERRAIN_ROCKS,
    TERRAIN_CAVE,
    TERRAIN_SNOW,
    TERRAIN_WATER,
    TERRAIN_ICE,
    TERRAIN_BUILDING,
    TERRAIN_MARSH,
    TERRAIN_BRIDGE,
    TERRAIN_LINK,
    TERRAIN_MAX
};

//Battle Type
#define BATTLE_TYPE_TRAINER                 (1 << 0)
#define BATTLE_TYPE_DOUBLES                 (1 << 1)
#define BATTLE_TYPE_2                       (1 << 2)
#define BATTLE_TYPE_MULTI                   (1 << 3)
#define BATTLE_TYPE_INGAME_PARTNER          (1 << 4)
#define BATTLE_TYPE_5                       (1 << 5)
#define BATTLE_TYPE_6                       (1 << 6)
#define BATTLE_TYPE_7                       (1 << 7)
#define BATTLE_TYPE_9                       (1 << 9)
#define BATTLE_TYPE_TUTORIAL                (1 << 10)

//Move Effects
#define MOVE_EFFECT_0                       (1 << 0)
#define MOVE_EFFECT_1                       (1 << 1)
#define MOVE_EFFECT_LEECH_SEED              (1 << 2)
#define MOVE_EFFECT_LOCK_ON                 (3 << 3)
#define MOVE_EFFECT_PERISH_SONG             (1 << 5)
#define MOVE_EFFECT_6                       (1 << 6)
#define MOVE_EFFECT_7                       (1 << 7)
#define MOVE_EFFECT_8                       (1 << 8)
#define MOVE_EFFECT_9                       (1 << 9)
#define MOVE_EFFECT_10                      (1 << 10)
#define MOVE_EFFECT_11                      (1 << 11)
#define MOVE_EFFECT_YAWN                    (1 << 12)
#define MOVE_EFFECT_IMPRISON_USER           (1 << 13)
#define MOVE_EFFECT_GRUDGE                  (1 << 14)
#define MOVE_EFFECT_LUCKY_CHANT             (1 << 15) 
#define MOVE_EFFECT_MUD_SPORT               (1 << 16)
#define MOVE_EFFECT_WATER_SPORT             (1 << 17)
#define MOVE_EFFECT_DIVE                    (1 << 18)
#define MOVE_EFFECT_INTIMIDATE              (1 << 19) //unclear why this is a move effect
#define MOVE_EFFECT_ROLE_PLAY               (1 << 20)
#define MOVE_EFFECT_GASTRO_ACID             (1 << 21)
#define MOVE_EFFECT_MIRACLE_EYE             (1 << 22)
#define MOVE_EFFECT_POWER_TRICK             (1 << 23)
#define MOVE_EFFECT_AQUA_RING               (1 << 24)
#define MOVE_EFFECT_HEAL_BLOCK              (1 << 25)
#define MOVE_EFECT_26                       (1 << 26)
#define MOVE_EFFECT_MAGNET_RISE             (1 << 27)
#define MOVE_EFFECT_CAMOFLAUGE              (1 << 28)    
#define MOVE_EFFECT_PHANTOM_FORCE           (1 << 29)
#define MOVE_EFFECT_IMPRISON                (1 << 30)

#define MOVE_EFFECT_BATON_PASSABLE          (MOVE_EFFECT_0 | MOVE_EFFECT_1 | MOVE_EFFECT_LEECH_SEED | MOVE_EFFECT_LOCK_ON | MOVE_EFFECT_PERISH_SONG | MOVE_EFFECT_10 | MOVE_EFFECT_LUCKY_CHANT | MOVE_EFFECT_MUD_SPORT | MOVE_EFFECT_WATER_SPORT | MOVE_EFFECT_GASTRO_ACID | MOVE_EFFECT_POWER_TRICK | MOVE_EFFECT_AQUA_RING | MOVE_EFFECT_HEAL_BLOCK | MOVE_EFECT_26 | MOVE_EFFECT_MAGNET_RISE)    

//Field Conditions
#define FIELD_CONDITION_RAIN                (1 << 0)
#define FIELD_CONDITION_RAIN_PERMANENT      (1 << 1)
#define FIELD_CONDITION_RAIN_ALL            (FIELD_CONDITION_RAIN | FIELD_CONDITION_RAIN_PERMANENT)
#define FIELD_CONDITION_SANDSTORM           (1 << 2)
#define FIELD_CONDITION_SANDSTORM_PERMANENT (1 << 3)
#define FIELD_CONDITION_SANDSTORM_ALL       (FIELD_CONDITION_SANDSTORM | FIELD_CONDITION_SANDSTORM_PERMANENT)
#define FIELD_CONDITION_SUN                 (1 << 4)
#define FIELD_CONDITION_SUN_PERMANENT       (1 << 5)
#define FIELD_CONDITION_SUN_ALL             (FIELD_CONDITION_SUN | FIELD_CONDITION_SUN_PERMANENT)
#define FIELD_CONDITION_HAIL                (1 << 6)
#define FIELD_CONDITION_HAIL_PERMANENT      (1 << 7)
#define FIELD_CONDITION_HAIL_ALL            (FIELD_CONDITION_HAIL | FIELD_CONDITION_HAIL_PERMANENT)
#define FIELD_CONDITION_FOG                 (1 << 15)
#define FIELD_CONDITION_WEATHER             (FIELD_CONDITION_RAIN_ALL | FIELD_CONDITION_SANDSTORM_ALL | FIELD_CONDITION_SUN_ALL | FIELD_CONDITION_HAIL_ALL | FIELD_CONDITION_FOG)
#define FIELD_CONDITION_TRICK_ROOM          (7 << 16)
    
//Field Side Conditions
#define SIDE_CONDITION_REFLECT              (1 << 0)
#define SIDE_CONDITION_LIGHT_SCREEN         (1 << 1)
#define SIDE_CONDITION_SPIKES               (1 << 2)
#define SIDE_CONDITION_SAFEGUARD            (1 << 3)
#define SIDE_CONDITION_FUTURE_SIGHT         (1 << 4)
#define SIDE_CONDITION_5                    (1 << 5)
#define SIDE_CONDITION_MIST                 (1 << 6)
#define SIDE_CONDITION_STEALTH_ROCKS        (1 << 7)
#define SIDE_CONDITION_TAILWIND             (3 << 8)
#define SIDE_CONDITION_TOXIC_SPIKES         (1 << 10)

//Status
#define STATUS_NONE                         0
#define STATUS_SLEEP                        (7)
#define STATUS_POISON                       (1 << 3)
#define STATUS_BURN                         (1 << 4)
#define STATUS_FREEZE                       (1 << 5)    
#define STATUS_PARALYSIS                    (1 << 6)
#define STATUS_BAD_POISON                   (1 << 7)
#define STATUS_POISON_COUNT                 (15 << 8)

#define STATUS_POISON_ALL                   (STATUS_POISON | STATUS_BAD_POISON | STATUS_POISON_COUNT)

//Status Conditions
#define CONDITION_NONE                      0
#define CONDITION_SLEEP                     1
#define CONDITION_POISON                    2
#define CONDITION_BURN                      3
#define CONDITION_FREEZE                    4
#define CONDITION_PARALYSIS                 5

//Status 2
#define STATUS2_0                           (1 << 0)
#define STATUS2_1                           (1 << 1)
#define STATUS2_2                           (1 << 2)
#define STATUS2_FLINCH                      (1 << 3)
#define STATUS2_4                           (1 << 4)
#define STATUS2_RAGE                        (3 << 10)
#define STATUS2_LOCKED_INTO_MOVE            (1 << 12)
#define STATUS2_13                          (1 << 13)
#define STATUS2_14                          (1 << 14)
#define STATUS2_15                          (1 << 15)
#define STATUS2_ATTRACT_BATTLER1            (1 << 16)
#define STATUS2_ATTRACT_BATTLER2            (1 << 17)
#define STATUS2_ATTRACT_BATTLER3            (1 << 18)
#define STATUS2_ATTRACT_BATTLER4            (1 << 19)
#define STATUS2_FOCUS_ENERGY                (1 << 20)
#define STATUS2_TRANSFORMED                 (1 << 21)
#define STATUS2_RECHARGE                    (1 << 22)
#define STATUS2_24                          (1 << 24)
#define STATUS2_MEAN_LOOK                   (1 << 26)
#define STATUS2_27                          (1 << 27)
#define STATUS2_28                          (1 << 28)
#define STATUS2_DEFENCE_CURL                (1 << 30)

#define STATUS2_BINDING_ALL                 (STATUS2_13 | STATUS2_14 | STATUS2_15)
#define STATUS2_ATTRACT_ALL                 (STATUS2_ATTRACT_BATTLER1 | STATUS2_ATTRACT_BATTLER2 | STATUS2_ATTRACT_BATTLER3 | STATUS2_ATTRACT_BATTLER4)

#define STATUS2_ATTRACT_SHIFT               16    

#define STATUS2_BATON_PASSABLE              (STATUS2_0 | STATUS2_1 | STATUS2_2 | STATUS2_FOCUS_ENERGY | STATUS2_24 | STATUS2_MEAN_LOOK | STATUS2_28)

//Battle Mon Data
#define BMON_DATA_SPECIES                    0
#define BMON_DATA_ATK                        1
#define BMON_DATA_DEF                        2
#define BMON_DATA_SPEED                      3
#define BMON_DATA_SPATK                      4    
#define BMON_DATA_SPDEF                      5
#define BMON_DATA_MOVE1                      6
#define BMON_DATA_MOVE2                      7
#define BMON_DATA_MOVE3                      8
#define BMON_DATA_MOVE4                      9
#define BMON_DATA_HP_IV                     10
#define BMON_DATA_ATK_IV                    11
#define BMON_DATA_DEF_IV                    12
#define BMON_DATA_SPEED_IV                  13
#define BMON_DATA_SPATK_IV                  14
#define BMON_DATA_SPDEF_IV                  15
#define BMON_DATA_IS_EGG                    16
#define BMON_DATA_HAS_NICKNAME              17
#define BMON_DATA_STAT_CHANGE_HP            18
#define BMON_DATA_STAT_CHANGE_ATK           19
#define BMON_DATA_STAT_CHANGE_DEF           20
#define BMON_DATA_STAT_CHANGE_SPEED         21
#define BMON_DATA_STAT_CHANGE_SPATK         22
#define BMON_DATA_STAT_CHANGE_SPDEF         23
#define BMON_DATA_STAT_CHANGE_ACC           24
#define BMON_DATA_STAT_CHANGE_EVASION       25
#define BMON_DATA_ABILITY                   26
#define BMON_DATA_TYPE_1                    27
#define BMON_DATA_TYPE_2                    28
#define BMON_DATA_GENDER                    29
#define BMON_DATA_IS_SHINY                  30
#define BMON_DATA_MOVE1PP                   31
#define BMON_DATA_MOVE2PP                   32
#define BMON_DATA_MOVE3PP                   33
#define BMON_DATA_MOVE4PP                   34
#define BMON_DATA_MOVE1PPCUR                35
#define BMON_DATA_MOVE2PPCUR                36
#define BMON_DATA_MOVE3PPCUR                37
#define BMON_DATA_MOVE4PPCUR                38
#define BMON_DATA_MOVE1MAXPP                39
#define BMON_DATA_MOVE2MAXPP                40
#define BMON_DATA_MOVE3MAXPP                41
#define BMON_DATA_MOVE4MAXPP                42
#define BMON_DATA_LEVEL                     43
#define BMON_DATA_FRIENDSHIP                44
#define BMON_DATA_NICKNAME                  45
#define BMON_DATA_NICKNAME2                 46 //this gets the nickname in a slightly different way
#define BMON_DATA_HP                        47
#define BMON_DATA_MAXHP                     48
#define BMON_DATA_OT_NAME                   49
#define BMON_DATA_EXP                       50
#define BMON_DATA_PERSONALITY               51
#define BMON_DATA_STATUS                    52
#define BMON_DATA_STATUS2                   53
#define BMON_DATA_OT_ID                     54 
#define BMON_DATA_HELD_ITEM                 55
#define BMON_DATA_56                        56
#define BMON_DATA_MSG_FLAG                  57
#define BMON_DATA_OT_GENDER                 58
#define BMON_DATA_MOVE_EFFECT               59
#define BMON_DATA_MOVE_EFFECT_TEMP          60
#define BMON_DATA_DISABLED_TURNS            61
#define BMON_DATA_ENCORED_TURNS             62
#define BMON_DATA_IS_CHARGED                63
#define BMON_DATA_TAUNT_TURNS               64
#define BMON_DATA_PROTECT_SUCCESS_COUNT     65
#define BMON_DATA_PERISH_SONG_TURNS         66
#define BMON_DATA_ROLLOUT_TURNS             67
#define BMON_DATA_FURY_CUTTER_TURNS         68
#define BMON_DATA_STOCKPILE_COUNT           69
#define BMON_DATA_STOCKPILE_DEF_BOOSTS      70
#define BMON_DATA_STOCKPILE_SPDEF_BOOSTS    71
#define BMON_DATA_TRUANT_FLAG               72
#define BMON_DATA_FLASH_FIRE_ACTIVE         73
#define BMON_DATA_LOCKED_ON_BATTLER         74
#define BMON_DATA_MIMICED_MOVE              75
#define BMON_DATA_BINDED_BATTLER            76 
#define BMON_DATA_MEAN_LOOK_BATTLER         77 //might be wrong
#define BMON_DATA_LAST_RESORT_COUNT         78
#define BMON_DATA_MAGNET_RISE               79
#define BMON_DATA_HEAL_BLOCK                80
#define BMON_DATA_81                        81
#define BMON_DATA_ITEM_KNOCKED_OFF          82
#define BMON_DATA_METRONOME                 83
#define BMON_DATA_84                        84
#define BMON_DATA_CUSTAP_FLAG               85
#define BMON_DATA_QUICK_CLAW_FLAG           86
#define BMON_DATA_RECHARGE                  87
#define BMON_DATA_FAKE_OUT                  88
#define BMON_DATA_SLOW_START_COUNT          89
#define BMON_DATA_SUBSTITUTE_HP             90
#define BMON_DATA_TRANSFORM_PERSONALITY     91
#define BMON_DATA_DISABLED_MOVE_NO          92
#define BMON_DATA_ENCORED_MOVE_NO           93
#define BMON_DATA_BINDING_MOVE_NO           94
#define BMON_DATA_HELD_ITEM_RESTORE_HP      95
#define BMON_DATA_SLOW_START_FLAG           96
#define BMON_DATA_SLOW_START_END            97
#define BMON_DATA_FORME                     98
#define BMON_DATA_99                        99 //unused
#define BMON_DATA_100                      100

#endif
