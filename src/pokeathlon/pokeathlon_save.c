#include "pokeathlon/pokeathlon_save.h"

u32 PokeathlonSave_sizeof() {
    return sizeof(PokeathlonSave);
}

void PokeathlonSave_Init(PokeathlonSave *dest) {
    u8 i, j;

    MI_CpuFill8(dest, 0, sizeof(PokeathlonSave));
    
    for (i = 0; i < 10; i++) {
        for (j = 0; j < 5; j++) {
            dest->recordsSolo[i].entries[j].unk_0 = 0xFFFF;
            dest->recordsLink[i].entries[j].unk_0 = 0xFFFF;
        }
    }
}

PokeathlonSave *Save_Pokeathlon_Get(SaveData *saveData) {
    return SaveArray_Get(saveData, SAVE_POKEATHLON);
}

PokeathlonSave *PokeathlonSave_dummy1(PokeathlonSave *pokeathlon) {
    return pokeathlon;
}

void *PokeathlonSave_GetUnkDC(PokeathlonSave *pokeathlonSave) {
    return pokeathlonSave->unk_DC;
}

Pokeathlon_RecordsSolo *PokeathlonSave_GetRecordsSolo(PokeathlonSave *pokeathlonSave) {
    return pokeathlonSave->recordsSolo;
}

Pokeathlon_RecordsLink *PokeathlonSave_GetRecordsLink(PokeathlonSave *pokeathlonSave) {
    return pokeathlonSave->recordsLink;
}

void *PokeathlonSave_GetUnkAEC(PokeathlonSave *pokeathlonSave) {
    return pokeathlonSave->unk_AEC;
}

Pokeathlon_UnkSubStruct_B00 *PokeathlonSave_GetUnkB00(PokeathlonSave *pokeathlonSave) {
    return &pokeathlonSave->unk_B00;
}

PokeathlonSave *PokeathlonSave_dummy2(PokeathlonSave *pokeathlon) {
    return pokeathlon;
}

BOOL PokeathlonSave_GetUnkDC_AtIndex(PokeathlonSave *pokeathlonSave, int shift, int index) {
    if (shift < 0 || shift > 4) {
        GF_ASSERT(FALSE);
        return FALSE;
    }
    int indexMinusOne = index - 1;
    if (indexMinusOne < 0) {
        GF_ASSERT(FALSE);
        return FALSE;
    }
    if (!(((int)pokeathlonSave->unk_DC[indexMinusOne]) >> shift & 1)) {
        return FALSE;
    }
    return TRUE;
}

Pokeathlon_RecordsSolo *PokeathlonSave_GetRecordsSolo2(PokeathlonSave *pokeathlonSave) {
    return pokeathlonSave->recordsSolo;
}

Pokeathlon_RecordsLink *PokeathlonSave_GetRecordsLink2(PokeathlonSave *pokeathlonSave) {
    return pokeathlonSave->recordsLink;
}

Pokeathlon_UnkSubStruct_B00 *PokeathlonSave_GetAgainUnkB00(PokeathlonSave *pokeathlonSave) {
    return &pokeathlonSave->unk_B00;
}

void PokeathlonSave_SetUnkDC_AtIndex(PokeathlonSave *pokeathlonSave, int shift, int index) {
    u8 i, bit;
    int indexMinusOne = index - 1;
    if (indexMinusOne < 0) {
        GF_ASSERT(FALSE);
        return;
    }
    for (i = 0; i < 5; i++) {
        if ((u8)((shift >> i) & 1) != 0) {
            bit = (u8)(1 << i);
            pokeathlonSave->unk_DC[indexMinusOne] |= bit;
        }
    }
}

void PokeathlonSave_AddAthletePoints(PokeathlonSave *pokeathlonSave, u16 amount) {
    pokeathlonSave->athletePoints += amount;
    if (pokeathlonSave->athletePoints > 99999) {
        pokeathlonSave->athletePoints = 99999;
    }
}

void PokeathlonSave_SubAthletePoints(PokeathlonSave *pokeathlonSave, u16 amount) {
    pokeathlonSave->athletePoints -= amount;
    if (pokeathlonSave->athletePoints < 0) {
        pokeathlonSave->athletePoints = 0;
    }
}

u32 PokeathlonSave_GetAthletePoints(PokeathlonSave *pokeathlonSave) {
    return pokeathlonSave->athletePoints;
}

BOOL PokeathlonSave_GetUnkB78_AtIndex(PokeathlonSave *pokeathlon, int idx) {
    GF_ASSERT(idx < 27);
    return (pokeathlon->unk_B78 >> idx) & 1;
}

void PokeathlonSave_SetUnkB78_AtIndex(PokeathlonSave *pokeathlon, int idx) {
    GF_ASSERT(idx < 27);
    pokeathlon->unk_B78 |= 1 << idx;
}

BOOL PokeathlonSave_GetUnkB7C_AtIndex(PokeathlonSave *pokeathlon, int idx) {
    return (pokeathlon->unk_B7C >> idx) & 1;
}

void PokeathlonSave_SetUnkB7C_AtIndex(PokeathlonSave *pokeathlon, int idx) {
    pokeathlon->unk_B7C |= 1 << idx;
}

void PokeathlonSave_ResetUnkB7C(PokeathlonSave *pokeathlon) {
    pokeathlon->unk_B7C = 0;
}
