#ifndef POKEHEARTGOLD_CONSTANTS_BATTLE_H
#define POKEHEARTGOLD_CONSTANTS_BATTLE_H

//Battler IDs
#define BATTLER_NONE    0xFF
#define BATTLER_PLAYER  0
#define BATTLER_ENEMY   1
#define BATTLER_PLAYER2 2
#define BATTLER_ENEMY2  3
#define BATTLER_MAX     4

#ifndef PM_ASM
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

typedef enum Terrain {
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
    TERRAIN_END,
    //Special terrains
    TERRAIN_ELITE_4_WILL,
    TERRAIN_ELITE_4_KOGA,
    TERRAIN_ELITE_4_BRUNO,
    TERRAIN_ELITE_4_KAREN,
    TERRAIN_CHAMPION_LANCE,
    TERRAIN_17,
    TERRAIN_TOWER,
    TERRAIN_ARCADE,
    TERRAIN_CASTLE,
    TERRAIN_22,
    TERRAIN_MAX
} Terrain;
#endif //PM_ASM

// Battle outcome
// Used with BattleSetup::winFlag
#define BATTLE_OUTCOME_WIN                  1
#define BATTLE_OUTCOME_LOSE                 2
#define BATTLE_OUTCOME_DRAW                 3
#define BATTLE_OUTCOME_MON_CAUGHT           4
#define BATTLE_OUTCOME_PLAYER_FLED          5
#define BATTLE_OUTCOME_FOE_FLED             6

//Battle Type
#define BATTLE_TYPE_TRAINER                 (1 << 0)
#define BATTLE_TYPE_DOUBLES                 (1 << 1)
#define BATTLE_TYPE_LINK                    (1 << 2)
#define BATTLE_TYPE_MULTI                   (1 << 3)
#define BATTLE_TYPE_INGAME_PARTNER          (1 << 4)
#define BATTLE_TYPE_SAFARI                  (1 << 5)
#define BATTLE_TYPE_6                       (1 << 6)
#define BATTLE_TYPE_TOWER                   (1 << 7)
#define BATTLE_TYPE_8                       (1 << 8)
#define BATTLE_TYPE_PAL_PARK                (1 << 9)
#define BATTLE_TYPE_TUTORIAL                (1 << 10)
#define BATTLE_TYPE_11                      (1 << 11)
#define BATTLE_TYPE_BUG_CONTEST             (1 << 12)
#define BATTLE_TYPE_DEBUG                   (1 << 31)

#define BATTLE_TYPE_NO_EXP                  (BATTLE_TYPE_LINK | BATTLE_TYPE_SAFARI | BATTLE_TYPE_TOWER | BATTLE_TYPE_PAL_PARK)

//Battle Special Flags
#define BATTLE_SPECIAL_FIRST_RIVAL          (1 << 0)
#define BATTLE_SPECIAL_RECORDED             (1 << 4)
#define BATTLE_SPECIAL_DISTORTION_WORLD     (1 << 7)

//Move Effects Flags
#define MOVE_EFFECT_FLAG_LEECH_SEED_BATTLER      (3 << 0)
#define MOVE_EFFECT_FLAG_LEECH_SEED              (1 << 2)
#define MOVE_EFFECT_FLAG_LOCK_ON                 (3 << 3)
#define MOVE_EFFECT_FLAG_LOCK_ON_SET             (1 << 4)
#define MOVE_EFFECT_FLAG_PERISH_SONG             (1 << 5)
#define MOVE_EFFECT_FLAG_6                       (1 << 6)
#define MOVE_EFFECT_FLAG_7                       (1 << 7)
#define MOVE_EFFECT_FLAG_8                       (1 << 8)
#define MOVE_EFFECT_FLAG_CHARGE                  (1 << 9)
#define MOVE_EFFECT_FLAG_INGRAIN                 (1 << 10)
#define MOVE_EFFECT_FLAG_YAWN                    (3 << 11)
#define MOVE_EFFECT_FLAG_IMPRISON_USER           (1 << 13)
#define MOVE_EFFECT_FLAG_GRUDGE                  (1 << 14)
#define MOVE_EFFECT_FLAG_LUCKY_CHANT             (1 << 15) 
#define MOVE_EFFECT_FLAG_MUD_SPORT               (1 << 16)
#define MOVE_EFFECT_FLAG_WATER_SPORT             (1 << 17)
#define MOVE_EFFECT_FLAG_DIVE                    (1 << 18)
#define MOVE_EFFECT_FLAG_INTIMIDATE              (1 << 19) //unclear why this is a move effect
#define MOVE_EFFECT_FLAG_ROLE_PLAY               (1 << 20)
#define MOVE_EFFECT_FLAG_GASTRO_ACID             (1 << 21)
#define MOVE_EFFECT_FLAG_MIRACLE_EYE             (1 << 22)
#define MOVE_EFFECT_FLAG_POWER_TRICK             (1 << 23)
#define MOVE_EFFECT_FLAG_AQUA_RING               (1 << 24)
#define MOVE_EFFECT_FLAG_HEAL_BLOCK              (1 << 25)
#define MOVE_EFFECT_FLAG_EMBARGO                 (1 << 26)
#define MOVE_EFFECT_FLAG_MAGNET_RISE             (1 << 27)
#define MOVE_EFFECT_FLAG_CAMOFLAUGE              (1 << 28)    
#define MOVE_EFFECT_FLAG_PHANTOM_FORCE           (1 << 29)
#define MOVE_EFFECT_FLAG_IMPRISON                (1 << 30)

#define MOVE_EFFECT_FLAG_BATON_PASSABLE          (MOVE_EFFECT_FLAG_LEECH_SEED_BATTLER | MOVE_EFFECT_FLAG_LEECH_SEED | MOVE_EFFECT_FLAG_LOCK_ON | MOVE_EFFECT_FLAG_PERISH_SONG | MOVE_EFFECT_FLAG_INGRAIN | MOVE_EFFECT_FLAG_LUCKY_CHANT | MOVE_EFFECT_FLAG_MUD_SPORT | MOVE_EFFECT_FLAG_WATER_SPORT | MOVE_EFFECT_FLAG_GASTRO_ACID | MOVE_EFFECT_FLAG_POWER_TRICK | MOVE_EFFECT_FLAG_AQUA_RING | MOVE_EFFECT_FLAG_HEAL_BLOCK | MOVE_EFFECT_FLAG_EMBARGO | MOVE_EFFECT_FLAG_MAGNET_RISE)    
#define MOVE_EFFECT_FLAG_HIDE_SUBSTITUTE         (MOVE_EFFECT_FLAG_6 | MOVE_EFFECT_FLAG_7 | MOVE_EFFECT_FLAG_DIVE | MOVE_EFFECT_FLAG_PHANTOM_FORCE)

#define MOVE_EFFECT_FLAG_LOCK_ON_SHIFT          3
#define MOVE_EFFECT_FLAG_YAWN_SHIFT             11

//Move status
#define MOVE_STATUS_MISS                    (1 << 0)
#define MOVE_STATUS_SUPER_EFFECTIVE         (1 << 1) 
#define MOVE_STATUS_NOT_VERY_EFFECTIVE      (1 << 2)
#define MOVE_STATUS_NO_EFFECT               (1 << 3) 
#define MOVE_STATUS_4                       (1 << 4)
#define MOVE_STATUS_5                       (1 << 5)
#define MOVE_STATUS_6                       (1 << 6)
#define MOVE_STATUS_7                       (1 << 7)
#define MOVE_STATUS_8                       (1 << 8)
#define MOVE_STATUS_9                       (1 << 9)
#define MOVE_STATUS_10                      (1 << 10)
#define MOVE_STATUS_LEVITATE_IMMUNE         (1 << 11)
#define MOVE_STATUS_12                      (1 << 12)
#define MOVE_STATUS_13                      (1 << 13)
#define MOVE_STATUS_14                      (1 << 14)
#define MOVE_STATUS_15                      (1 << 15)
#define MOVE_STATUS_16                      (1 << 16)
#define MOVE_STATUS_17                      (1 << 17)
#define MOVE_STATUS_WONDER_GUARD_IMMUNE     (1 << 18) 
#define MOVE_STATUS_19                      (1 << 19)
#define MOVE_STATUS_MAGNET_RISE_IMMUNE      (1 << 20)
#define MOVE_STATUS_31                      (1 << 31)

#define MOVE_STATUS_ANY_EFFECTIVE           (MOVE_STATUS_SUPER_EFFECTIVE | MOVE_STATUS_NOT_VERY_EFFECTIVE)

#define MOVE_STATUS_FAIL                    (MOVE_STATUS_MISS | MOVE_STATUS_NO_EFFECT | MOVE_STATUS_6 | MOVE_STATUS_9 | MOVE_STATUS_LEVITATE_IMMUNE | MOVE_STATUS_12 | MOVE_STATUS_14 | MOVE_STATUS_15 | MOVE_STATUS_16 | MOVE_STATUS_17 | MOVE_STATUS_WONDER_GUARD_IMMUNE | MOVE_STATUS_19 | MOVE_STATUS_MAGNET_RISE_IMMUNE | MOVE_STATUS_31)

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
#define FIELD_CONDITION_GRAVITY             (7 << 12)
#define FIELD_CONDITION_FOG                 (1 << 15)
#define FIELD_CONDITION_TRICK_ROOM          (7 << 16)

#define FIELD_CONDITION_WEATHER_NO_SUN      (FIELD_CONDITION_RAIN_ALL | FIELD_CONDITION_SANDSTORM_ALL | FIELD_CONDITION_HAIL_ALL | FIELD_CONDITION_FOG)
#define FIELD_CONDITION_WEATHER_CASTFORM    (FIELD_CONDITION_RAIN_ALL | FIELD_CONDITION_SUN_ALL | FIELD_CONDITION_HAIL_ALL)
#define FIELD_CONDITION_WEATHER             (FIELD_CONDITION_RAIN_ALL | FIELD_CONDITION_SANDSTORM_ALL | FIELD_CONDITION_SUN_ALL | FIELD_CONDITION_HAIL_ALL | FIELD_CONDITION_FOG)
    
#define FIELD_CONDITION_GRAVITY_SHIFT       12
#define FIELD_CONDITION_TRICK_ROOM_SHIFT    16
    
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
#define SIDE_CONDITION_LUCKY_CHANT          (7 << 12)

#define SIDE_CONDITION_TAILWIND_SHIFT       8
#define SIDE_CONDITION_LUCKY_CHANT_SHIFT    12

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
#define STATUS_ALL                          (STATUS_SLEEP | STATUS_POISON | STATUS_BURN | STATUS_FREEZE | STATUS_PARALYSIS | STATUS_BAD_POISON)

#define STATUS_POISON_COUNT_SHIFT           8

//Status Conditions
#define CONDITION_NONE                      0
#define CONDITION_SLEEP                     1
#define CONDITION_POISON                    2
#define CONDITION_BURN                      3
#define CONDITION_FREEZE                    4
#define CONDITION_PARALYSIS                 5

//Status 2
#define STATUS2_CONFUSION                   (7 << 0)
#define STATUS2_FLINCH                      (1 << 3)
#define STATUS2_UPROAR                      (7 << 4)
#define STATUS2_8                           (3 << 8)
#define STATUS2_RAMPAGE_TURNS               (3 << 10)
#define STATUS2_LOCKED_INTO_MOVE            (1 << 12)
#define STATUS2_BINDING_TURNS               (7 << 13)
#define STATUS2_ATTRACT_BATTLER1            (1 << 16)
#define STATUS2_ATTRACT_BATTLER2            (1 << 17)
#define STATUS2_ATTRACT_BATTLER3            (1 << 18)
#define STATUS2_ATTRACT_BATTLER4            (1 << 19)
#define STATUS2_FOCUS_ENERGY                (1 << 20)
#define STATUS2_TRANSFORMED                 (1 << 21)
#define STATUS2_RECHARGE                    (1 << 22)
#define STATUS2_23                          (1 << 23)
#define STATUS2_SUBSTITUTE                  (1 << 24)
#define STATUS2_MEAN_LOOK                   (1 << 26)
#define STATUS2_NIGHTMARE                   (1 << 27)
#define STATUS2_CURSE                       (1 << 28)
#define STATUS2_FORESIGHT                   (1 << 29)
#define STATUS2_DEFENCE_CURL                (1 << 30)
#define STATUS2_TORMENT                     (1 << 31)

#define STATUS2_ATTRACT_ALL                 (STATUS2_ATTRACT_BATTLER1 | STATUS2_ATTRACT_BATTLER2 | STATUS2_ATTRACT_BATTLER3 | STATUS2_ATTRACT_BATTLER4)

#define STATUS2_UPROAR_SHIFT                4
#define STATUS2_RAMPAGE_SHIFT               10
#define STATUS2_BINDING_SHIFT               13
#define STATUS2_ATTRACT_SHIFT               16    

#define STATUS2_BATON_PASSABLE              (STATUS2_CONFUSION | STATUS2_FOCUS_ENERGY | STATUS2_SUBSTITUTE | STATUS2_MEAN_LOOK | STATUS2_CURSE)

//Struggle Checks
#define STRUGGLE_CHECK_NO_MOVES             (1 << 0)
#define STRUGGLE_CHECK_NO_PP                (1 << 1)
#define STRUGGLE_CHECK_DISABLED             (1 << 2)
#define STRUGGLE_CHECK_TORMENT              (1 << 3)
#define STRUGGLE_CHECK_TAUNT                (1 << 4)
#define STRUGGLE_CHECK_IMPRISON             (1 << 5)
#define STRUGGLE_CHECK_GRAVITY              (1 << 6)
#define STRUGGLE_CHECK_HEAL_BLOCK           (1 << 7)
#define STRUGGLE_CHECK_ENCORE               (1 << 8) //unused because they straight up forgot
#define STRUGGLE_CHECK_CHOICED              (1 << 9)
    
//Ability Checks
#define CHECK_ABILITY_SAME_SIDE             0
#define CHECK_ABILITY_SAME_SIDE_HP          1
#define CHECK_ABILITY_OPPOSING_SIDE         2
#define CHECK_ABILITY_OPPOSING_SIDE_HP      3
#define CHECK_ABILITY_OPPOSING_SIDE_HP_RET  4
#define CHECK_ABILITY_ALL                   5
#define CHECK_ABILITY_ALL_NOT_USER          6
#define CHECK_ABILITY_ALL_NOT_USER_RET      7
#define CHECK_ABILITY_ALL_HP                8
#define CHECK_ABILITY_ALL_HP_NOT_USER       9

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
#define BMON_DATA_FORM                      98
#define BMON_DATA_99                        99 //unused
#define BMON_DATA_100                      100

//Battle Status
#define BATTLE_STATUS_NO_ATTACK_MESSAGE             (1 << 0)
#define BATTLE_STATUS_NO_DOUBLE_CHECK               (1 << 1)
#define BATTLE_STATUS_HIT_FLY                       (1 << 2)
#define BATTLE_STATUS_HIT_DIG                       (1 << 3)     
#define BATTLE_STATUS_HIT_DIVE                      (1 << 4)
#define BATTLE_STATUS_CHARGE_TURN                   (1 << 5)
#define BATTLE_STATUS_NO_BLINK                      (1 << 6)
#define BATTLE_STATUS_SYNCRONIZE                    (1 << 7)
#define BATTLE_STATUS_BATON_PASS                    (1 << 8)
#define BATTLE_STATUS_CHARGE_MOVE_HIT               (1 << 9)
#define BATTLE_STATUS_FLAT_HIT_RATE                 (1 << 10)
#define BATTLE_STATUS_IGNORE_TYPE_EFFECTIVENESS     (1 << 11)  
#define BATTLE_STATUS_CRASH_DAMAGE                  (1 << 12)
#define BATTLE_STATUS_MOVE_SUCCESSFUL               (1 << 13)
#define BATTLE_STATUS_MOVE_ANIMATIONS_OFF           (1 << 14)
#define BATTLE_STATUS_IGNORE_TYPE_IMMUNITY          (1 << 15)
#define BATTLE_STATUS_MULTI_HIT_IGNORE_MESSAGE      (1 << 16)
#define BATTLE_STATUS_NO_MESSAGE_BETWEEN            (1 << 17)
#define BATTLE_STATUS_MISS_MESSAGE                  (1 << 18)
#define BATTLE_STATUS_SHADOW_FORCE                  (1 << 19)
#define BATTLE_STATUS_NO_MOVE_SET                   (1 << 20)
#define BATTLE_STATUS_MESSAGES_OFF                  (1 << 21)
#define BATTLE_STATUS_22                            (1 << 22)
#define BATTLE_STATUS_MOLD_BREAKER                  (1 << 23)

#define BATTLE_STATUS_FAINTED_SHIFT                 24

//Battle Status 2
#define BATTLE_STATUS2_NO_EXP_GAINED                (1 << 0)
#define BATTLE_STATUS2_UPDATE_STAT_STAGES           (1 << 1)
#define BATTLE_STATUS2_DISPLAY_ATTACK_MESSAGE       (1 << 2)
#define BATTLE_STATUS2_MAGIC_COAT                   (1 << 3)
#define BATTLE_STATUS2_4                            (1 << 4)
#define BATTLE_STATUS2_5                            (1 << 5)
#define BATTLE_STATUS2_26                           (1 << 26)

#define BATTLE_STATUS2_EXP_GAIN_SHIFT               28

//Stat Changes
#define STAT_DOWN_6          0
#define STAT_DOWN_5          1
#define STAT_DOWN_4          2
#define STAT_DOWN_3          3
#define STAT_DOWN_2          4
#define STAT_DOWN_1          5
#define STAT_NEUTRAL         6
#define STAT_UP_1            7
#define STAT_UP_2            8
#define STAT_UP_3            9
#define STAT_UP_4           10
#define STAT_UP_5           11
#define STAT_UP_6           12

//Battle Controller Commands
#ifndef PM_ASM
typedef enum ControllerCommand {
    CONTROLLER_COMMAND_GET_BATTLE_MON,
    CONTROLLER_COMMAND_START_ENCOUNTER,
    CONTROLLER_COMMAND_TRAINER_MESSAGE,
    CONTROLLER_COMMAND_SEND_OUT,
    CONTROLLER_COMMAND_SELECTION_SCREEN_INIT,
    CONTROLLER_COMMAND_SELECTION_SCREEN_INPUT,
    CONTROLLER_COMMAND_6,
    CONTROLLER_COMMAND_7,
    CONTROLLER_COMMAND_8,
    CONTROLLER_COMMAND_UPDATE_FIELD_CONDITION,
    CONTROLLER_COMMAND_10,
    CONTROLLER_COMMAND_11,
    CONTROLLER_COMMAND_12,
    CONTROLLER_COMMAND_13,
    CONTROLLER_COMMAND_14,
    CONTROLLER_COMMAND_15,
    CONTROLLER_COMMAND_16,
    CONTROLLER_COMMAND_17,
    CONTROLLER_COMMAND_18,
    CONTROLLER_COMMAND_19,
    CONTROLLER_COMMAND_20,
    CONTROLLER_COMMAND_21,
    CONTROLLER_COMMAND_RUN_SCRIPT,
    CONTROLLER_COMMAND_23,
    CONTROLLER_COMMAND_24,
    CONTROLLER_COMMAND_25,
    CONTROLLER_COMMAND_26,
    CONTROLLER_COMMAND_27,
    CONTROLLER_COMMAND_28,
    CONTROLLER_COMMAND_29,
    CONTROLLER_COMMAND_30,
    CONTROLLER_COMMAND_31,
    CONTROLLER_COMMAND_32,
    CONTROLLER_COMMAND_33,
    CONTROLLER_COMMAND_34,
    CONTROLLER_COMMAND_35,
    CONTROLLER_COMMAND_36,
    CONTROLLER_COMMAND_37,
    CONTROLLER_COMMAND_38,
    CONTROLLER_COMMAND_39,
    CONTROLLER_COMMAND_40,
    CONTROLLER_COMMAND_41,
    CONTROLLER_COMMAND_42,
    CONTROLLER_COMMAND_43,
    CONTROLLER_COMMAND_44,
    CONTROLLER_COMMAND_45,
    CONTROLLER_COMMAND_MAX
} ControllerCommand;
#endif //PM_ASM
#endif //POKEHEARTGOLD_CONSTANTS_BATTLE_H
