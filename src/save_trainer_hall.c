#include "save_trainer_hall.h"
#include "string_util.h"
#include "constants/species.h"

u32 Save_TrainerHall_sizeof(void) {
    return sizeof(TrainerHallSave);
}

TrainerHallSave *Save_TrainerHall_get(SAVEDATA *saveData) {
    return SavArray_get(saveData, SAVE_TRAINER_HALL);
}

void Save_TrainerHall_init(TrainerHallSave *th) {
    int i;

    MI_CpuClear8(th, sizeof(TrainerHallSave));
    for (i = 0; i < TRAINER_HALL_SET_MAX; i++) {
        TrainerHallSet_SetZero(&th->sets[i]);
    }
}

void TrainerHallMon_SetZero(TrainerHallMon *mon) {
    MI_CpuClear8(mon, sizeof(TrainerHallMon));
    StringFillEOS(mon->nickname, POKEMON_NAME_LENGTH);
}

void TrainerHallTrainer_SetZero(TrainerHallTrainer *trainer) {
    MI_CpuClear8(trainer, sizeof(TrainerHallTrainer));
    StringFillEOS(trainer->otName, OT_NAME_LENGTH + 1);
}

void TrainerHallSet_SetZero(TrainerHallSet *set) {
    int i;

    TrainerHallTrainer_SetZero(&set->trainer);
    for (i = 0; i < PARTY_SIZE; i++) {
        TrainerHallMon_SetZero(&set->party[i]);
    }
}

BOOL TrainerHallSet_CheckHasData(const TrainerHallSet *set) {
    return set->party[0].species != SPECIES_NONE;
}

BOOL TrainerHallTrainer_Compare(const TrainerHallTrainer *a, const TrainerHallTrainer *b) {
    if (a->id != b->id || a->version != b->version || a->language != b->language || a->unk7 != b->unk7) {
        return FALSE;
    }
    return !StringNotEqual(a->otName, b->otName);
}
