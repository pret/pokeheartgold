#ifndef POKEHEARTGOLD_SAVE_TRAINER_HOUSE_H
#define POKEHEARTGOLD_SAVE_TRAINER_HOUSE_H

#include "global.h"

#include "constants/pokemon.h"

#include "pokemon_types_def.h"
#include "save.h"

#define MAX_NUM_TRAINER_HOUSE_SETS 10

typedef struct TrainerHouseTrainer {
    u32 id;
    u8 sprite;
    u8 language;
    u8 version;
    u8 gender;
    u16 otName[PLAYER_NAME_LENGTH + 1];
    MailMessage introMessage;
    MailMessage winMessage;
    MailMessage loseMessage;
} TrainerHouseTrainer;

typedef struct TrainerHouseMon {
    u16 species : 11;
    u16 form : 5;
    u16 item;
    u16 moves[MAX_MON_MOVES];
    u32 otid;
    u32 pid;
    union {
        struct {
            u32 hpIv : 5;
            u32 atkIv : 5;
            u32 defIv : 5;
            u32 spdIv : 5;
            u32 spAtkIv : 5;
            u32 spDefIv : 5;
            u32 dummy : 2;
        };
        u32 ivsWord;
    };
    u8 hpEv;
    u8 atkEv;
    u8 defEv;
    u8 spdEv;
    u8 spAtkEv;
    u8 spDefEv;
    u8 ppUp;
    u8 language;
    u8 ability;
    u8 friendship;
    u8 level;
    u16 nickname[POKEMON_NAME_LENGTH];
} TrainerHouseMon;

typedef struct TrainerHouseSet {
    TrainerHouseTrainer trainer;
    TrainerHouseMon party[PARTY_SIZE];
} TrainerHouseSet;

typedef struct TrainerHouse {
    TrainerHouseSet sets[MAX_NUM_TRAINER_HOUSE_SETS];
} TrainerHouse;

u32 Save_TrainerHouse_sizeof(void);
TrainerHouse *Save_TrainerHouse_Get(SaveData *saveData);
void Save_TrainerHouse_Init(TrainerHouse *th);
void TrainerHouseMon_SetZero(TrainerHouseMon *mon);
void TrainerHouseTrainer_SetZero(TrainerHouseTrainer *trainer);
void TrainerHouseSet_SetZero(TrainerHouseSet *set);
BOOL TrainerHouseSet_CheckHasData(const TrainerHouseSet *set);
BOOL TrainerHouseTrainer_Compare(const TrainerHouseTrainer *a, const TrainerHouseTrainer *b);

#endif // POKEHEARTGOLD_SAVE_TRAINER_HOUSE_H
