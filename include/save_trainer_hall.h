#ifndef POKEHEARTGOLD_SAVE_TRAINER_HALL_H
#define POKEHEARTGOLD_SAVE_TRAINER_HALL_H

#include "save.h"
#include "constants/pokemon.h"

#define TRAINER_HALL_SET_MAX           10

typedef struct TrainerHallTrainer {
    u32 id;
    u8 unk_04;
    u8 language;
    u8 version;
    u8 unk7;
    u16 otName[OT_NAME_LENGTH + 1];
    u8 filler_18[0x18];
} TrainerHallTrainer; // size=0x30

typedef struct TrainerHallMon {
    u16 species:11;
    u16 forme:5;
    u16 item;
    u16 moves[MON_MOVES];
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
} TrainerHallMon; // size=0x38

typedef struct TrainerHallSet {
    TrainerHallTrainer trainer;
    TrainerHallMon party[PARTY_SIZE];
} TrainerHallSet;

typedef struct TrainerHallSave {
    TrainerHallSet sets[TRAINER_HALL_SET_MAX];
} TrainerHallSave; // size=0xF00

u32 Save_TrainerHall_sizeof(void);
TrainerHallSave *Save_TrainerHall_get(SAVEDATA *saveData);
void Save_TrainerHall_init(TrainerHallSave *th);
void TrainerHallMon_SetZero(TrainerHallMon *mon);
void TrainerHallTrainer_SetZero(TrainerHallTrainer *trainer);
void TrainerHallSet_SetZero(TrainerHallSet *set);
BOOL TrainerHallSet_CheckHasData(const TrainerHallSet *set);
BOOL TrainerHallTrainer_Compare(const TrainerHallTrainer *a, const TrainerHallTrainer *b);

#endif //POKEHEARTGOLD_SAVE_TRAINER_HALL_H
