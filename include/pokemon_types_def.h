#ifndef POKEHEARTGOLD_POKEMON_TYPES_DEF_H
#define POKEHEARTGOLD_POKEMON_TYPES_DEF_H

#include "constants/pokemon.h"

#include "filesystem.h"
#include "seal_case.h"

typedef struct BaseStats {
    /* 0x00 */ u8 hp;
    /* 0x01 */ u8 atk;
    /* 0x02 */ u8 def;
    /* 0x03 */ u8 speed;
    /* 0x04 */ u8 spatk;
    /* 0x05 */ u8 spdef;
    /* 0x06 */ u8 types[2];
    /* 0x08 */ u8 catchRate;
    /* 0x09 */ u8 expYield;
    /* 0x0A */ u16 hp_yield : 2;
    u16 atk_yield : 2;
    u16 def_yield : 2;
    u16 speed_yield : 2;
    /* 0x0B */ u16 spatk_yield : 2;
    u16 spdef_yield : 2;
    u16 padding_B_4 : 4;
    /* 0x0C */ u16 item1;
    /* 0x0E */ u16 item2;
    /* 0x10 */ u8 genderRatio;
    /* 0x11 */ u8 eggCycles;
    /* 0x12 */ u8 friendship;
    /* 0x13 */ u8 growthRate;
    /* 0x14 */ u8 eggGroups[2];
    /* 0x16 */ u8 abilities[2];
    /* 0x18 */ u8 greatMarshRate;
    /* 0x19 */ u8 color : 7;
    u8 flip : 1;
    u8 padding_1A[2];
    /* 0x1C */ u32 tmhm_1;
    /* 0x20 */ u32 tmhm_2;
    /* 0x24 */ u32 tmhm_3;
    /* 0x28 */ u32 tmhm_4;
} BASE_STATS;

// Structs

/**
 * @brief Block A of the BoxPokemon data structure
 */
typedef struct {
    /* 0x00 */ u16 species;
    /* 0x02 */ u16 heldItem;

    /* 0x04 */ u32 otID;
    /* 0x08 */ u32 exp;

    /* 0x0C */ u8 friendship;
    /* 0x0D */ u8 ability;
    /* 0x0E */ u8 markings;
    /* 0x0F */ u8 originLanguage;

    /* 0x10 */ u8 hpEV;
    /* 0x11 */ u8 atkEV;
    /* 0x12 */ u8 defEV;
    /* 0x13 */ u8 speedEV;
    /* 0x14 */ u8 spAtkEV;
    /* 0x15 */ u8 spDefEV;

    /* 0x16 */ u8 cool;
    /* 0x17 */ u8 beauty;
    /* 0x18 */ u8 cute;
    /* 0x19 */ u8 smart;
    /* 0x1A */ u8 tough;
    /* 0x1B */ u8 sheen;

    /* 0x1C */ u32 ribbonsDS1; //!< A bitmask of non-Super Contest ribbons introduced in Generation 4. Sinnoh Champ, Ability, Great Ability, Double Ability, Multi Ability, Pair Ability, World Ability, Alert, Shock, Downcast, Careless, Relax, Snooze, Smile, Gorgeous, Royal, Gorgeous Royal, Footprint, Record, History, Legend, Red, Green, Blue, Festival, Carnival, Classic and Premier Ribbons.
} PokemonDataBlockA;

/**
 * @brief Block B of the BoxPokemon data structure
 */
typedef struct {
    /* 0x00 */ u16 moves[MAX_MON_MOVES];
    /* 0x08 */ u8 moveCurrentPPs[MAX_MON_MOVES];
    /* 0x0C */ u8 movePPUps[MAX_MON_MOVES];

    /* 0x10 */ u32 hpIV : 5;
    u32 atkIV : 5;
    u32 defIV : 5;
    u32 speedIV : 5;
    u32 spAtkIV : 5;
    u32 spDefIV : 5;
    u32 isEgg : 1;
    u32 hasNickname : 1;

    /* 0x14 */ u32 ribbonsGBA; //!< A bitmask of ribbons introduced in Generation 3. Cool, Beauty, Cute, Smart, Tough, Champion, Winning, Victory, Artist, Effort, Marine, Land, Sky, Country, National, Earth and World Ribbons.
    /* 0x18 */ u8 fatefulEncounter : 1;
    u8 gender : 2;
    u8 form : 5;
    /* 0x19 */ u8 HGSS_shinyLeaves : 6;
    u8 unused1 : 2;
    /* 0x1A */ u16 unused2;

    /* 0x1C */ u16 EggLocation_PtHGSS;
    /* 0x1E */ u16 MetLocation_PtHGSS;
} PokemonDataBlockB;

/**
 * @brief Block C of the BoxPokemon data structure
 */
typedef struct {
    /* 0x00 */ u16 nickname[11];

    /* 0x16 */ u8 unused;
    /* 0x17 */ u8 originGame;

    /* 0x18 */ u64 ribbonsDS2;
} PokemonDataBlockC;

/**
 * @brief Block D of the BoxPokemon data structure
 */
typedef struct {
    /* 0x00 */ u16 otName[PLAYER_NAME_LENGTH + 1];

    /* 0x10 */ u8 eggYear;
    /* 0x11 */ u8 eggMonth;
    /* 0x12 */ u8 eggDay;

    /* 0x13 */ u8 metYear;
    /* 0x14 */ u8 metMonth;
    /* 0x15 */ u8 metDay;

    /* 0x16 */ u16 EggLocation_DP;
    /* 0x18 */ u16 MetLocation_DP;

    /* 0x1A */ u8 pokerus;
    /* 0x1B */ u8 pokeball;
    /* 0x1C */ u8 metLevel : 7;
    u8 otGender : 1;
    /* 0x1D */ u8 metTerrain;
    /* 0x1E */ u8 HGSS_Pokeball;
    /* 0x1F */ s8 mood;
} PokemonDataBlockD;

typedef union {
    PokemonDataBlockA blockA;
    PokemonDataBlockB blockB;
    PokemonDataBlockC blockC;
    PokemonDataBlockD blockD;
} PokemonDataBlock;

/**
 * @brief Boxed Pokemon data structure
 */
typedef struct BoxPokemon {
    /* 0x000 */ u32 personality;
    /* 0x004 */ u16 partyDecrypted : 1;
    u16 boxDecrypted : 1;
    u16 checksumFailed : 1;
    u16 unused : 13;
    /* 0x006 */ u16 checksum;
    /* 0x008 */ PokemonDataBlock dataBlocks[4];
} BoxPokemon;

union MailPatternData {
    u16 raw;
    struct {
        u16 icon : 12;
        u16 pal : 4;
    };
};

#define MAILMSG_BANK_NONE  (0xFFFF)
#define MAILMSG_FIELDS_MAX (2)

typedef struct MailMessage {
    u16 msg_bank;
    u16 msg_no;
    u16 fields[MAILMSG_FIELDS_MAX];
} MailMessage;

typedef struct Mail {
    u32 author_otId;
    u8 author_gender;
    u8 author_language;
    u8 author_version;
    u8 mail_type;
    u16 author_name[PLAYER_NAME_LENGTH + 1];
    union MailPatternData mon_icons[3];
    u16 form_flags; // bitfield of three 5-bit values
    MailMessage unk_20[3];
} Mail;

/**
 * @brief Party Pokemon data structure
 *  This is used to store stats for a pokemon while it is in the players party.
 *  Rather than recalculating stats after each battle, they're stored here.
 */
typedef struct PartyPokemon {
    /* 0x088 */ u32 status; // slp:3, psn:1, brn:1, frz:1, prz:1, tox:1, ...
    /* 0x08C */ u8 level;   //!< The Pokemon's current level, as computed from its total EXP value and its species' level curve.
    /* 0x08D */ u8 ballCapsuleID; //!< The ID of the ball capsule attached to the Pokemon.
    /* 0x08E */ u16 hp;           //!< The Pokemon's current HP.
    /* 0x090 */ u16 maxHP;        //!< The Pokemon's maximum HP.
    /* 0x092 */ u16 atk;          //!< The Pokemon's Attack stat.
    /* 0x094 */ u16 def;          //!< The Pokemon's Defense stat.
    /* 0x096 */ u16 speed;        //!< The Pokemon's Speed stat.
    /* 0x098 */ u16 spatk;        //!< The Pokemon's Special Attack stat.
    /* 0x09A */ u16 spdef;        //!< The Pokemon's Special Defense stat.
    /* 0x09C */ Mail mail;
    /* 0x0D4 */ CAPSULE sealCoords; // seal coords
} PartyPokemon;

typedef struct {
    /* 0x000 */ BoxPokemon box;
    /* 0x088 */ PartyPokemon party;
} Pokemon; // size: 0xEC

struct UnkPokemonStruct_02072A98 {
    /* 0x00 */ u32 personality;
    /* 0x04 */ u16 partyDecrypted : 1;
    u16 boxDecrypted : 1;
    u16 checksumFailed : 1;
    /* 0x06 */ u16 species;
    /* 0x08 */ u16 heldItem;
    /* 0x0C */ u32 otID;
    /* 0x10 */ u32 exp;
    /* 0x14 */ u8 friendship;
    /* 0x15 */ u8 ability;
    /* 0x16 */ u8 hpEV;
    /* 0x17 */ u8 atkEV;
    /* 0x18 */ u8 defEV;
    /* 0x19 */ u8 speedEV;
    /* 0x1A */ u8 spAtkEV;
    /* 0x1B */ u8 spDefEV;
    /* 0x1C */ u16 moves[MAX_MON_MOVES];
    /* 0x24 */ u8 moveCurrentPPs[MAX_MON_MOVES];
    /* 0x28 */ u8 movePPUps[MAX_MON_MOVES];
    /* 0x2C */ u32 hpIV : 5;
    u32 atkIV : 5;
    u32 defIV : 5;
    u32 speedIV : 5;
    u32 spAtkIV : 5;
    u32 spDefIV : 5;
    u32 isEgg : 1;
    u32 hasNickname : 1;
    /* 0x30 */ u8 fatefulEncounter : 1;
    u8 gender : 2;
    u8 form : 5;
    /* 0x32 */ u16 nickname[POKEMON_NAME_LENGTH + 1];
    /* 0x48 */ u16 otName[PLAYER_NAME_LENGTH + 1];
    /* 0x58 */ u8 pokeball;
    /* 0x59 */ u8 originLanguage;
    /* 0x5C */ u32 status;
    /* 0x60 */ u8 level;
    /* 0x61 */ u8 ballCapsuleID;
    /* 0x62 */ u16 hp;
    /* 0x64 */ u16 maxHP;
    /* 0x66 */ u16 atk;
    /* 0x68 */ u16 def;
    /* 0x6A */ u16 speed;
    /* 0x6C */ u16 spatk;
    /* 0x6E */ u16 spdef;
};

typedef struct PokepicTemplate {
    u16 narcID;
    u16 charDataID;
    u16 palDataID;
    u16 species;
    u8 isAnimated;
    u8 filler_9[3];
    u32 personality;
} PokepicTemplate;

struct PokeanmSub {
    s8 unk0;
    u8 unk1;
};

struct Pokeanm {
    struct PokeanmSub unk0[4];
    u8 unk8[20];
};

struct UnkStruct_02069038 {
    u16 unk0;
    u16 unk2;
    u8 unk4;
    u8 padding;
    struct Pokeanm anim;
};

typedef struct UnkStruct_02070D3C {
    NarcId narcId;
    s32 ncgr_id;
    s32 nclr_id;
    s32 ncer_id;
    s32 nanr_id;
    s32 ncbr_id;
} UnkStruct_02070D3C;

struct Evolution {
    u16 method;
    u16 param;
    u16 target;
};
#define MAX_EVOS_PER_POKE 7

typedef struct PartyCore {
    int maxCount;
    int curCount;
    Pokemon mons[PARTY_SIZE];
} PartyCore;

typedef struct PartyExtraSub {
    u8 unk_00[PERFORMANCE_MAX];
} PartyExtraSub;

typedef struct PartyExtra {
    PartyExtraSub aprijuiceModifiers[PARTY_SIZE];
} PartyExtra;

typedef struct Party {
    PartyCore core;
    PartyExtra extra;
} Party;

struct PokeathlonBasePerformance {
    u8 base[PERFORMANCE_MAX];
    u8 dummy[4];
    u8 minmax[PERFORMANCE_MAX][2];
    u8 dummy2;
};

struct TodayPerformanceStat {
    u16 base : 3;
    u16 hi : 3;
    u16 lo : 3;
    u16 dummy : 7;
    s16 dailyMod;
};

struct PokeathlonTodayPerformance {
    struct TodayPerformanceStat stats[PERFORMANCE_MAX];
};

struct PokeathlonPerformanceStars {
    u16 stars;
    u8 color[PERFORMANCE_MAX];
    u8 dummy;
};

#endif // POKEHEARTGOLD_POKEMON_TYPES_DEF_H
