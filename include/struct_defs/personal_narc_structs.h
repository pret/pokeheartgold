#ifndef POKEHEARTGOLD_STRUCT_DEFS_PERSONAL_NARC_STRUCTS
#define POKEHEARTGOLD_STRUCT_DEFS_PERSONAL_NARC_STRUCTS

#include <nitro/types.h>

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

struct Evolution {
    u16 method;
    u16 param;
    u16 target;
};
#define MAX_EVOS_PER_POKE 7

#endif
