#ifndef POKEHEARTGOLD_HALL_OF_FAME_H
#define POKEHEARTGOLD_HALL_OF_FAME_H

#include "party.h"
#include "pm_string.h"

#define NUM_HOF_RECORDS 30

typedef struct HOFMon {
    /* 0x00 */ u16 species;
    /* 0x02 */ u8 level;
    /* 0x03 */ u8 form;
    /* 0x04 */ u32 personality;
    /* 0x08 */ u32 otid;
    /* 0x0C */ u16 nickname[POKEMON_NAME_LENGTH + 1];
    /* 0x22 */ u16 otname[PLAYER_NAME_LENGTH + 1];
    /* 0x32 */ u16 moves[4];
    /* 0x3A */ u8 padding[2];
} HOFMON;

typedef struct HOFParty {
    HOFMON party[6];
    u16 year;
    u8 month;
    u8 day;
} HOFTEAM;

typedef struct HallOfFame {
    HOFTEAM parties[NUM_HOF_RECORDS];
    u32 next_record;
    u32 num_total;
} HallOfFame;

typedef struct HofDisplayMon {
    String *nickname;
    String *otname;
    u32 personality;
    u32 otid;
    u16 species;
    u8 level;
    u8 form;
    u16 moves[4];
} SHOW_HOFMON;

u32 Save_HOF_sizeof(void);
void Save_HOF_Init(HallOfFame *hof);
void Save_HOF_RecordParty(HallOfFame *hof, Party *party, RTCDate *date);
u32 Save_HOF_GetNumRecords(const HallOfFame *hallOfFame);
int Save_HOF_TranslateRecordIdx(const HallOfFame *hallOfFame, int num);
u32 Save_HOF_RecordCountMons(HallOfFame *hallOfFame, int num);
void Save_HOF_GetMonStatsByIndexPair(HallOfFame *hallOfFame, int teamNum, int monNum, SHOW_HOFMON *dest);
void Save_HOF_GetClearDate(HallOfFame *hof, int num, RTCDate *dest);

#endif // POKEHEARTGOLD_HALL_OF_FAME_H
