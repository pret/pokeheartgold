#ifndef POKEHEARTGOLD_SAVE_TRAINER_HOUSE_H
#define POKEHEARTGOLD_SAVE_TRAINER_HOUSE_H

#include "save.h"
#include "constants/pokemon.h"
#include "global.h"

#define TRAINER_HALL_SET_MAX           10

typedef struct TrainerHouseTrainer {
    u32 id;
    u8 unk_04;
    u8 language;
    u8 version;
    u8 unk7;
    u16 otName[PLAYER_NAME_LENGTH + 1];
    u8 filler_18[0x18];
} TrainerHouseTrainer; // size=0x30

typedef struct TrainerHouseMon {
    u16 species:11;
    u16 form:5;
    u16 item;
    u16 moves[MAX_MON_MOVES];
    u32 pid;
    u32 otid;
    u32 hpIv:5;
    u32 atkIv:5;
    u32 defIv:5;
    u32 spdIv:5;
    u32 spAtkIv:5;
    u32 spDefIv:5;
    u32 dummy:2;
    u8 hpEv;
    u8 atkEv;
    u8 defEv;
    u8 spdEv;
    u8 spAtkEv;
    u8 spDefEv;
    u8 unk_1E[6];
    u16 nickname[POKEMON_NAME_LENGTH];
} TrainerHouseMon; // size=0x38

typedef struct TrainerHouseSet {
    TrainerHouseTrainer trainer;
    TrainerHouseMon party[PARTY_SIZE];
} TrainerHouseSet;

typedef struct TrainerHouseSave {
    TrainerHouseSet sets[TRAINER_HALL_SET_MAX];
} TrainerHouseSave; // size=0xF00

u32 Save_TrainerHouse_sizeof(void);
TrainerHouseSave *Save_TrainerHouse_Get(SaveData *saveData);
void Save_TrainerHouse_Init(TrainerHouseSave *th);
void TrainerHouseMon_SetZero(TrainerHouseMon *mon);
void TrainerHouseTrainer_SetZero(TrainerHouseTrainer *trainer);
void TrainerHouseSet_SetZero(TrainerHouseSet *set);
BOOL TrainerHouseSet_CheckHasData(const TrainerHouseSet *set);
BOOL TrainerHouseTrainer_Compare(const TrainerHouseTrainer *a, const TrainerHouseTrainer *b);

#endif //POKEHEARTGOLD_SAVE_TRAINER_HOUSE_H
