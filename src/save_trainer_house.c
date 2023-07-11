#include "global.h"
#include "save_trainer_house.h"
#include "string_util.h"
#include "constants/species.h"

u32 Save_TrainerHouse_sizeof(void) {
    return sizeof(TrainerHouseSave);
}

TrainerHouseSave *Save_TrainerHouse_Get(SaveData *saveData) {
    return SaveArray_Get(saveData, SAVE_TRAINER_HOUSE);
}

void Save_TrainerHouse_Init(TrainerHouseSave *th) {
    int i;

    MI_CpuClear8(th, sizeof(TrainerHouseSave));
    for (i = 0; i < TRAINER_HALL_SET_MAX; i++) {
        TrainerHouseSet_SetZero(&th->sets[i]);
    }
}

void TrainerHouseMon_SetZero(TrainerHouseMon *mon) {
    MI_CpuClear8(mon, sizeof(TrainerHouseMon));
    StringFillEOS(mon->nickname, POKEMON_NAME_LENGTH);
}

void TrainerHouseTrainer_SetZero(TrainerHouseTrainer *trainer) {
    MI_CpuClear8(trainer, sizeof(TrainerHouseTrainer));
    StringFillEOS(trainer->otName, PLAYER_NAME_LENGTH + 1);
}

void TrainerHouseSet_SetZero(TrainerHouseSet *set) {
    int i;

    TrainerHouseTrainer_SetZero(&set->trainer);
    for (i = 0; i < PARTY_SIZE; i++) {
        TrainerHouseMon_SetZero(&set->party[i]);
    }
}

BOOL TrainerHouseSet_CheckHasData(const TrainerHouseSet *set) {
    return set->party[0].species != SPECIES_NONE;
}

BOOL TrainerHouseTrainer_Compare(const TrainerHouseTrainer *a, const TrainerHouseTrainer *b) {
    if (a->id != b->id || a->version != b->version || a->language != b->language || a->unk7 != b->unk7) {
        return FALSE;
    }
    return !StringNotEqual(a->otName, b->otName);
}
