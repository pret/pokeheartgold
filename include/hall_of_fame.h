#ifndef POKEHEARTGOLD_HALL_OF_FAME_H
#define POKEHEARTGOLD_HALL_OF_FAME_H

#include "sys/string.h"

#define NUM_HOF_RECORDS 30

typedef struct HOFMon
{
    /* 0x00 */ u16 species;
    /* 0x02 */ u8 level;
    /* 0x03 */ u8 forme;
    /* 0x04 */ u32 personality;
    /* 0x08 */ u32 otid;
    /* 0x0C */ u16 nickname[POKEMON_NAME_LENGTH + 1];
    /* 0x22 */ u16 otname[OT_NAME_LENGTH + 1];
    /* 0x32 */ u16 moves[4];
    /* 0x3A */ u8 padding[2];
} HOFMON;

typedef struct HOFParty
{
    HOFMON party[6];
    u16 year;
    u8 month;
    u8 day;
} HOFTEAM;

typedef struct HallOfFame
{
    HOFTEAM parties[NUM_HOF_RECORDS];
    u32 next_record;
    u32 num_total;
} HALL_OF_FAME;

typedef struct HofDisplayMon
{
    STRING * nickname;
    STRING * otname;
    u32 personality;
    u32 otid;
    u16 species;
    u8 level;
    u8 forme;
    u16 moves[4];
} SHOW_HOFMON;


#endif //POKEHEARTGOLD_HALL_OF_FAME_H
