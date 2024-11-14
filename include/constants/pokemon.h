#ifndef POKEHEARTGOLD_CONSTANTS_POKEMON_H
#define POKEHEARTGOLD_CONSTANTS_POKEMON_H

// Value and data limits
#define MAX_LEVEL         100
#define MAX_MON_MOVES     4
#define MAX_EV            100
#define MAX_EV_SUM        510
#define MAX_LEARNED_MOVES 22

#define NUM_BOXES       18
#define MONS_PER_BOX    30
#define BOX_NAME_LENGTH 20

// Pokemon types
#define TYPE_NONE           255
#define TYPE_NORMAL         0
#define TYPE_FIGHTING       1
#define TYPE_FLYING         2
#define TYPE_POISON         3
#define TYPE_GROUND         4
#define TYPE_ROCK           5
#define TYPE_BUG            6
#define TYPE_GHOST          7
#define TYPE_STEEL          8
#define TYPE_MYSTERY        9
#define TYPE_FIRE           10
#define TYPE_WATER          11
#define TYPE_GRASS          12
#define TYPE_ELECTRIC       13
#define TYPE_PSYCHIC        14
#define TYPE_ICE            15
#define TYPE_DRAGON         16
#define TYPE_DARK           17
#define NUMBER_OF_MON_TYPES 18

// Type effectiveness
#define TYPE_MUL_NO_EFFECT       0
#define TYPE_MUL_NOT_EFFECTIVE   5
#define TYPE_MUL_NORMAL          10
#define TYPE_MUL_SUPER_EFFECTIVE 20

// Special type table IDs
#define TYPE_FORESIGHT 0xFE
#define TYPE_ENDTABLE  0xFF

// Contest types
#define COOL   0
#define BEAUTY 1
#define CUTE   2
#define SMART  3
#define TOUGH  4

// Pokemon egg groups
#define EGG_GROUP_NONE         0
#define EGG_GROUP_MONSTER      1
#define EGG_GROUP_WATER_1      2
#define EGG_GROUP_BUG          3
#define EGG_GROUP_FLYING       4
#define EGG_GROUP_FIELD        5
#define EGG_GROUP_FAIRY        6
#define EGG_GROUP_GRASS        7
#define EGG_GROUP_HUMAN_LIKE   8
#define EGG_GROUP_WATER_3      9
#define EGG_GROUP_MINERAL      10
#define EGG_GROUP_AMORPHOUS    11
#define EGG_GROUP_WATER_2      12
#define EGG_GROUP_DITTO        13
#define EGG_GROUP_DRAGON       14
#define EGG_GROUP_UNDISCOVERED 15

#define EGG_GROUPS_PER_MON 2

#define MON_STATUS_SLP_MASK  0x7
#define MON_STATUS_SLP_SHIFT 0
#define MON_STATUS_PSN_MASK  0x8
#define MON_STATUS_PSN_SHIFT 3
#define MON_STATUS_TOX_MASK  0x80
#define MON_STATUS_TOX_SHIFT 7
#define MON_STATUS_BRN_MASK  0x10
#define MON_STATUS_BRN_SHIFT 4
#define MON_STATUS_FRZ_MASK  0x20
#define MON_STATUS_FRZ_SHIFT 5
#define MON_STATUS_PRZ_MASK  0x40
#define MON_STATUS_PRZ_SHIFT 6

// Pokemon natures
#define NATURE_HARDY   0
#define NATURE_LONELY  1
#define NATURE_BRAVE   2
#define NATURE_ADAMANT 3
#define NATURE_NAUGHTY 4
#define NATURE_BOLD    5
#define NATURE_DOCILE  6
#define NATURE_RELAXED 7
#define NATURE_IMPISH  8
#define NATURE_LAX     9
#define NATURE_TIMID   10
#define NATURE_HASTY   11
#define NATURE_SERIOUS 12
#define NATURE_JOLLY   13
#define NATURE_NAIVE   14
#define NATURE_MODEST  15
#define NATURE_MILD    16
#define NATURE_QUIET   17
#define NATURE_BASHFUL 18
#define NATURE_RASH    19
#define NATURE_CALM    20
#define NATURE_GENTLE  21
#define NATURE_SASSY   22
#define NATURE_CAREFUL 23
#define NATURE_QUIRKY  24

#define NATURE_NUM 25

#define FLAVOR_SPICY  0
#define FLAVOR_DRY    1
#define FLAVOR_SWEET  2
#define FLAVOR_BITTER 3
#define FLAVOR_SOUR   4

#define FLAVOR_START FLAVOR_SPICY
#define FLAVOR_MAX   5

#define PERFORMANCE_MIN     0u
#define PERFORMANCE_POWER   0u
#define PERFORMANCE_SKILL   1u
#define PERFORMANCE_SPEED   2u
#define PERFORMANCE_JUMP    3u
#define PERFORMANCE_STAMINA 4u
#define PERFORMANCE_MAX     5u

// for some reason the order is different in performance.narc
#define ARCPERF_POWER   0
#define ARCPERF_STAMINA 1
#define ARCPERF_JUMP    2
#define ARCPERF_SKILL   3
#define ARCPERF_SPEED   4

#define STARS_AT_BASE    0
#define STARS_ABOVE_BASE 1
#define STARS_BELOW_BASE 2

// Pokemon Stats
#define STAT_HP      0
#define STAT_ATK     1
#define STAT_DEF     2
#define STAT_SPEED   3
#define STAT_SPATK   4
#define STAT_SPDEF   5
#define STAT_ACC     6 // Only in battles.
#define STAT_EVASION 7 // Only in battles.

#define NUM_STATS        6
#define NUM_EV_STATS     (NUM_STATS - 1) // excludes HP
#define NUM_BATTLE_STATS (NUM_STATS + 2) // includes Accuracy and Evasion

// Shiny odds
#define SHINY_ODDS 8 // Actual probability is SHINY_ODDS/65536

#define MON_DATA_PERSONALITY                0
#define MON_DATA_PARTY_LOCK                 1
#define MON_DATA_BOX_LOCK                   2
#define MON_DATA_CHECKSUM_FAILED            3
#define MON_DATA_CHECKSUM                   4
#define MON_DATA_SPECIES                    5
#define MON_DATA_HELD_ITEM                  6
#define MON_DATA_OTID                       7
#define MON_DATA_EXPERIENCE                 8
#define MON_DATA_FRIENDSHIP                 9
#define MON_DATA_ABILITY                    10
#define MON_DATA_MARKINGS                   11
#define MON_DATA_GAME_LANGUAGE              12
#define MON_DATA_HP_EV                      13
#define MON_DATA_ATK_EV                     14
#define MON_DATA_DEF_EV                     15
#define MON_DATA_SPEED_EV                   16
#define MON_DATA_SPATK_EV                   17
#define MON_DATA_SPDEF_EV                   18
#define MON_DATA_COOL                       19
#define MON_DATA_BEAUTY                     20
#define MON_DATA_CUTE                       21
#define MON_DATA_SMART                      22
#define MON_DATA_TOUGH                      23
#define MON_DATA_SHEEN                      24
#define MON_DATA_SINNOH_CHAMP_RIBBON        25
#define MON_DATA_ABILITY_RIBBON             26
#define MON_DATA_GREAT_ABILITY_RIBBON       27
#define MON_DATA_DOUBLE_ABILITY_RIBBON      28
#define MON_DATA_MULTI_ABILITY_RIBBON       29
#define MON_DATA_PAIR_ABILITY_RIBBON        30
#define MON_DATA_WORLD_ABILITY_RIBBON       31
#define MON_DATA_ALERT_RIBBON               32
#define MON_DATA_SHOCK_RIBBON               33
#define MON_DATA_DOWNCAST_RIBBON            34
#define MON_DATA_CARELESS_RIBBON            35
#define MON_DATA_RELAX_RIBBON               36
#define MON_DATA_SNOOZE_RIBBON              37
#define MON_DATA_SMILE_RIBBON               38
#define MON_DATA_GORGEOUS_RIBBON            39
#define MON_DATA_ROYAL_RIBBON               40
#define MON_DATA_GORGEOUS_ROYAL_RIBBON      41
#define MON_DATA_FOOTPRINT_RIBBON           42
#define MON_DATA_RECORD_RIBBON              43
#define MON_DATA_HISTORY_RIBBON             44
#define MON_DATA_LEGEND_RIBBON              45
#define MON_DATA_RED_RIBBON                 46
#define MON_DATA_GREEN_RIBBON               47
#define MON_DATA_BLUE_RIBBON                48
#define MON_DATA_FESTIVAL_RIBBON            49
#define MON_DATA_CARNIVAL_RIBBON            50
#define MON_DATA_CLASSIC_RIBBON             51
#define MON_DATA_PREMIER_RIBBON             52
#define MON_DATA_SINNOH_RIBBON_53           53
#define MON_DATA_MOVE1                      54
#define MON_DATA_MOVE2                      55
#define MON_DATA_MOVE3                      56
#define MON_DATA_MOVE4                      57
#define MON_DATA_MOVE1PP                    58
#define MON_DATA_MOVE2PP                    59
#define MON_DATA_MOVE3PP                    60
#define MON_DATA_MOVE4PP                    61
#define MON_DATA_MOVE1PPUP                  62
#define MON_DATA_MOVE2PPUP                  63
#define MON_DATA_MOVE3PPUP                  64
#define MON_DATA_MOVE4PPUP                  65
#define MON_DATA_MOVE1MAXPP                 66
#define MON_DATA_MOVE2MAXPP                 67
#define MON_DATA_MOVE3MAXPP                 68
#define MON_DATA_MOVE4MAXPP                 69
#define MON_DATA_HP_IV                      70
#define MON_DATA_ATK_IV                     71
#define MON_DATA_DEF_IV                     72
#define MON_DATA_SPEED_IV                   73
#define MON_DATA_SPATK_IV                   74
#define MON_DATA_SPDEF_IV                   75
#define MON_DATA_IS_EGG                     76
#define MON_DATA_HAS_NICKNAME               77
#define MON_DATA_HOENN_COOL_RIBBON          78
#define MON_DATA_HOENN_COOL_RIBBON_SUPER    79
#define MON_DATA_HOENN_COOL_RIBBON_HYPER    80
#define MON_DATA_HOENN_COOL_RIBBON_MASTER   81
#define MON_DATA_HOENN_BEAUTY_RIBBON        82
#define MON_DATA_HOENN_BEAUTY_RIBBON_SUPER  83
#define MON_DATA_HOENN_BEAUTY_RIBBON_HYPER  84
#define MON_DATA_HOENN_BEAUTY_RIBBON_MASTER 85
#define MON_DATA_HOENN_CUTE_RIBBON          86
#define MON_DATA_HOENN_CUTE_RIBBON_SUPER    87
#define MON_DATA_HOENN_CUTE_RIBBON_HYPER    88
#define MON_DATA_HOENN_CUTE_RIBBON_MASTER   89
#define MON_DATA_HOENN_SMART_RIBBON         90
#define MON_DATA_HOENN_SMART_RIBBON_SUPER   91
#define MON_DATA_HOENN_SMART_RIBBON_HYPER   92
#define MON_DATA_HOENN_SMART_RIBBON_MASTER  93
#define MON_DATA_HOENN_TOUGH_RIBBON         94
#define MON_DATA_HOENN_TOUGH_RIBBON_SUPER   95
#define MON_DATA_HOENN_TOUGH_RIBBON_HYPER   96
#define MON_DATA_HOENN_TOUGH_RIBBON_MASTER  97
#define MON_DATA_HOENN_CHAMPION_RIBBON      98
#define MON_DATA_HOENN_WINNING_RIBBON       99
#define MON_DATA_HOENN_VICTORY_RIBBON       100
#define MON_DATA_HOENN_ARTIST_RIBBON        101
#define MON_DATA_HOENN_EFFORT_RIBBON        102
#define MON_DATA_HOENN_MARINE_RIBBON        103
#define MON_DATA_HOENN_LAND_RIBBON          104
#define MON_DATA_HOENN_SKY_RIBBON           105
#define MON_DATA_HOENN_COUNTRY_RIBBON       106
#define MON_DATA_HOENN_NATIONAL_RIBBON      107
#define MON_DATA_HOENN_EARTH_RIBBON         108
#define MON_DATA_HOENN_WORLD_RIBBON         109
#define MON_DATA_FATEFUL_ENCOUNTER          110
#define MON_DATA_GENDER                     111
#define MON_DATA_FORM                       112
#define MON_DATA_RESERVED_113               113 // HGSS
#define MON_DATA_RESERVED_114               114 // Plat
#define MON_DATA_HGSS_EGG_MET_LOCATION      115
#define MON_DATA_HGSS_MET_LOCATION          116
#define MON_DATA_NICKNAME_FLAT              117
#define MON_DATA_NICKNAME_FLAT_COMPARE      118
#define MON_DATA_NICKNAME_STRING            119
#define MON_DATA_NICKNAME_STRING_COMPARE    120
#define MON_DATA_UNK_121                    121
#define MON_DATA_GAME_VERSION               122
#define MON_DATA_COOL_RIBBON                123
#define MON_DATA_COOL_RIBBON_GREAT          124
#define MON_DATA_COOL_RIBBON_ULTRA          125
#define MON_DATA_COOL_RIBBON_MASTER         126
#define MON_DATA_BEAUTY_RIBBON              127
#define MON_DATA_BEAUTY_RIBBON_GREAT        128
#define MON_DATA_BEAUTY_RIBBON_ULTRA        129
#define MON_DATA_BEAUTY_RIBBON_MASTER       130
#define MON_DATA_CUTE_RIBBON                131
#define MON_DATA_CUTE_RIBBON_GREAT          132
#define MON_DATA_CUTE_RIBBON_ULTRA          133
#define MON_DATA_CUTE_RIBBON_MASTER         134
#define MON_DATA_SMART_RIBBON               135
#define MON_DATA_SMART_RIBBON_GREAT         136
#define MON_DATA_SMART_RIBBON_ULTRA         137
#define MON_DATA_SMART_RIBBON_MASTER        138
#define MON_DATA_TOUGH_RIBBON               139
#define MON_DATA_TOUGH_RIBBON_GREAT         140
#define MON_DATA_TOUGH_RIBBON_ULTRA         141
#define MON_DATA_TOUGH_RIBBON_MASTER        142
#define MON_DATA_SINNOH_RIBBON_143          143
#define MON_DATA_OT_NAME                    144
#define MON_DATA_OT_NAME_2                  145
#define MON_DATA_EGG_MET_YEAR               146
#define MON_DATA_EGG_MET_MONTH              147
#define MON_DATA_EGG_MET_DAY                148
#define MON_DATA_MET_YEAR                   149
#define MON_DATA_MET_MONTH                  150
#define MON_DATA_MET_DAY                    151
#define MON_DATA_EGG_MET_LOCATION           152
#define MON_DATA_MET_LOCATION               153
#define MON_DATA_POKERUS                    154
#define MON_DATA_POKEBALL                   155
#define MON_DATA_MET_LEVEL                  156
#define MON_DATA_MET_GENDER                 157
#define MON_DATA_ENCOUNTER_TYPE             158 // HGSS
#define MON_DATA_RESERVED_159               159
#define MON_DATA_STATUS                     160
#define MON_DATA_LEVEL                      161
#define MON_DATA_CAPSULE                    162
#define MON_DATA_HP                         163
#define MON_DATA_MAXHP                      164
#define MON_DATA_ATK                        165
#define MON_DATA_DEF                        166
#define MON_DATA_SPEED                      167
#define MON_DATA_SPATK                      168
#define MON_DATA_SPDEF                      169
#define MON_DATA_MAIL_STRUCT                170
#define MON_DATA_SEAL_COORDS                171
#define MON_DATA_SPECIES_EXISTS             172
#define MON_DATA_SANITY_IS_EGG              173
#define MON_DATA_SPECIES_OR_EGG             174 // If the Pokémon is in an Egg, return SPECIES_EGG.
#define MON_DATA_IVS_WORD                   175
#define MON_DATA_NO_PRINT_GENDER            176
#define MON_DATA_TYPE_1                     177
#define MON_DATA_TYPE_2                     178
#define MON_DATA_SPECIES_NAME               179
#define MON_DATA_DP_POKEBALL                180
#define MON_DATA_SHINY_LEAF_A               181
#define MON_DATA_SHINY_LEAF_B               182
#define MON_DATA_SHINY_LEAF_C               183
#define MON_DATA_SHINY_LEAF_D               184
#define MON_DATA_SHINY_LEAF_E               185
#define MON_DATA_SHINY_LEAF_CROWN           186
#define MON_DATA_MOOD                       187

#define MON_DATA_NICKNAME (MON_DATA_NICKNAME_FLAT)

#define OT_ID_PLAYER_ID       0
#define OT_ID_PRESET          1
#define OT_ID_RANDOM_NO_SHINY 2

#define MON_RATIO_MALE         0
#define MON_RATIO_EIGHTH       31
#define MON_RATIO_QUARTER      63
#define MON_RATIO_HALF         127
#define MON_RATIO_THREEQUARTER 191
#define MON_RATIO_FEMALE       254
#define MON_RATIO_UNKNOWN      255

#define GENDER_RATIO(frac) ((frac) <= 1 ? (u8)((frac) * 254.75) : 255)

#define MON_MALE       0
#define MON_FEMALE     1
#define MON_GENDERLESS 2

// Constants for AdjustFriendship
#define FRIENDSHIP_EVENT_GROW_LEVEL     0
#define FRIENDSHIP_EVENT_VITAMIN        1 // unused, handled by PokemonUseItemEffects
#define FRIENDSHIP_EVENT_BATTLE_ITEM    2 // unused, handled by PokemonUseItemEffects
#define FRIENDSHIP_EVENT_LEAGUE_BATTLE  3
#define FRIENDSHIP_EVENT_LEARN_TMHM     4
#define FRIENDSHIP_EVENT_WALKING        5
#define FRIENDSHIP_EVENT_FAINT_SMALL    6
#define FRIENDSHIP_EVENT_HEAL_FIELD_PSN 7
#define FRIENDSHIP_EVENT_FAINT_LARGE    8 // If opponent was >= 30 levels higher. See AdjustFriendshipOnBattleFaint
#define FRIENDHSIP_EVENT_CONTEST_WIN    9 // Leftover from Platinum

#define FRIENDSHIP_EVENT_NUM 10

#define FRIENDSHIP_TIER_LOW     0
#define FRIENDSHIP_TIER_LOW_MIN 0
#define FRIENDSHIP_TIER_MID     1
#define FRIENDSHIP_TIER_MID_MIN 100
#define FRIENDSHIP_TIER_HI      2
#define FRIENDSHIP_TIER_HI_MIN  200
#define FRIENDSHIP_TIER_NUM     3
#define FRIENDSHIP_MAX          255

#define BASE_HP               0
#define BASE_ATK              1
#define BASE_DEF              2
#define BASE_SPEED            3
#define BASE_SPATK            4
#define BASE_SPDEF            5
#define BASE_TYPE1            6
#define BASE_TYPE2            7
#define BASE_CATCH_RATE       8
#define BASE_EXP_YIELD        9
#define BASE_HP_YIELD         10
#define BASE_ATK_YIELD        11
#define BASE_DEF_YIELD        12
#define BASE_SPEED_YIELD      13
#define BASE_SPATK_YIELD      14
#define BASE_SPDEF_YIELD      15
#define BASE_ITEM_1           16
#define BASE_ITEM_2           17
#define BASE_GENDER_RATIO     18
#define BASE_EGG_CYCLES       19
#define BASE_FRIENDSHIP       20
#define BASE_GROWTH_RATE      21
#define BASE_EGG_GROUP_1      22
#define BASE_EGG_GROUP_2      23
#define BASE_ABILITY_1        24
#define BASE_ABILITY_2        25
#define BASE_GREAT_MARSH_RATE 26
#define BASE_COLOR            27
#define BASE_FLIP             28
#define BASE_TMHM_1           29
#define BASE_TMHM_2           30
#define BASE_TMHM_3           31
#define BASE_TMHM_4           32

// Forms used in asm files
#define SHAYMIN_LAND     0
#define SHAYMIN_SKY      1
#define SHAYMIN_FORM_MAX 2

// Pic facing
#define MON_PIC_FACING_BACK  0
#define MON_PIC_FACING_FRONT 2

#ifndef PM_ASM
typedef enum {
    EGG = 0,
    EVENT = 0,
    HATCHED = 0,
    PAL_PARK = 0,
    TALL_GRASS = 2,
    DIALGA_GAME_EVENT = 4,
    PALKIA_GAME_EVENT = 4,
    CAVE = 5,
    HALL_OF_ORIGIN = 5,
    SURFING = 7,
    FISHING = 7,
    BUILDING = 9,
    SAFARI_ZONE = 10,
    STARTER = 12,
    FOSSIL = 12,
    GIFT_EEVEE = 12
} EncounterType;

typedef int OriginLanguage;

typedef enum {
    ARCEUS_NORMAL = 0,
    ARCEUS_FIST = 1,
    ARCEUS_SKY = 2,
    ARCEUS_TOXIC = 3,
    ARCEUS_EARTH = 4,
    ARCEUS_STONE = 5,
    ARCEUS_INSECT = 6,
    ARCEUS_SPOOKY = 7,
    ARCEUS_IRON = 8,
    ARCEUS_MYSTERY = 9,
    ARCEUS_FLAME = 10,
    ARCEUS_SPLASH = 11,
    ARCEUS_MEADOW = 12,
    ARCEUS_ZAP = 13,
    ARCEUS_MIND = 14,
    ARCEUS_ICICLE = 15,
    ARCEUS_DRACO = 16,
    ARCEUS_DREAD = 17,
    ARCEUS_FORM_MAX = 18,

    BURMY_PLANT = 0,
    BURMY_SANDY = 1,
    BURMY_TRASH = 2,
    BURMY_FORM_MAX = 3,

    WORMADAM_PLANT = 0,
    WORMADAM_SANDY = 1,
    WORMADAM_TRASH = 2,
    WORMADAM_FORM_MAX = 3,

    DEOXYS_NORMAL = 0,
    DEOXYS_ATTACK = 1,
    DEOXYS_DEFENSE = 2,
    DEOXYS_SPEED = 3,
    DEOXYS_FORM_MAX = 4,

    GIRATINA_ALTERED = 0,
    GIRATINA_ORIGIN = 1,
    GIRATINA_FORM_MAX = 2,

    ROTOM_NORMAL = 0,
    ROTOM_HEAT = 1,
    ROTOM_WASH = 2,
    ROTOM_FROST = 3,
    ROTOM_FAN = 4,
    ROTOM_MOW = 5,
    ROTOM_FORM_MAX = 6,

    SHELLOS_WEST = 0,
    SHELLOS_EAST = 1,
    SHELLOS_FORM_MAX = 2,

    GASTRODON_WEST = 0,
    GASTRODON_EAST = 1,
    GASTRODON_FORM_MAX = 2,

    CASTFORM_NORMAL = 0,
    CASTFORM_SUNNY = 1,
    CASTFORM_RAINY = 2,
    CASTFORM_SNOWY = 3,
    CASTFORM_FORM_MAX = 4,

    CHERRIM_CLOUDY = 0,
    CHERRIM_SUNNY = 1,
    CHERRIM_FORM_MAX = 2,

    UNOWN_A = 0,
    UNOWN_B = 1,
    UNOWN_C = 2,
    UNOWN_D = 3,
    UNOWN_E = 4,
    UNOWN_F = 5,
    UNOWN_G = 6,
    UNOWN_H = 7,
    UNOWN_I = 8,
    UNOWN_J = 9,
    UNOWN_K = 10,
    UNOWN_L = 11,
    UNOWN_M = 12,
    UNOWN_N = 13,
    UNOWN_O = 14,
    UNOWN_P = 15,
    UNOWN_Q = 16,
    UNOWN_R = 17,
    UNOWN_S = 18,
    UNOWN_T = 19,
    UNOWN_U = 20,
    UNOWN_V = 21,
    UNOWN_W = 22,
    UNOWN_X = 23,
    UNOWN_Y = 24,
    UNOWN_Z = 25,
    UNOWN_EXCLAMATION_MARK = 26,
    UNOWN_QUESTION_MARK = 27,
    UNOWN_FORM_MAX = 28,

    PICHU_NORMAL = 0,
    PICHU_SPIKY_EAR = 1,
    PICHU_FORM_MAX = 2,

    EGG_STANDARD = 0,
    EGG_MANAPHY = 1,
    EGG_FORM_MAX = 2,
} AlternateForms;

typedef enum EvoMethod {
    EVO_NONE = 0,
    EVO_FRIENDSHIP,
    EVO_FRIENDSHIP_DAY,
    EVO_FRIENDSHIP_NIGHT,
    EVO_LEVEL,
    EVO_TRADE,
    EVO_TRADE_ITEM,
    EVO_STONE,
    EVO_LEVEL_ATK_GT_DEF,
    EVO_LEVEL_ATK_EQ_DEF,
    EVO_LEVEL_ATK_LT_DEF,
    EVO_LEVEL_PID_LO,
    EVO_LEVEL_PID_HI,
    EVO_LEVEL_NINJASK,
    EVO_LEVEL_SHEDINJA,
    EVO_BEAUTY,
    EVO_STONE_MALE,
    EVO_STONE_FEMALE,
    EVO_ITEM_DAY,
    EVO_ITEM_NIGHT,
    EVO_HAS_MOVE,
    EVO_OTHER_PARTY_MON,
    EVO_LEVEL_MALE,
    EVO_LEVEL_FEMALE,
    EVO_CORONET,
    EVO_ETERNA,
    EVO_ROUTE217,
} EvoMethod;

typedef enum {
    EVOCTX_LEVELUP,
    EVOCTX_TRADE,
    EVOCTX_ITEM_CHECK,
    EVOCTX_ITEM_USE,
} EvolveContext;

#endif // PM_ASM

#define GROWTH_MEDIUM_FAST 0
#define GROWTH_ERRATIC     1
#define GROWTH_FLUCTUATING 2
#define GROWTH_MEDIUM_SLOW 3
#define GROWTH_FAST        4
#define GROWTH_SLOW        5
#define GROWTH_UNUSED_6    6
#define GROWTH_UNUSED_7    7

#endif // POKEHEARTGOLD_CONSTANTS_POKEMON_H
