#include "pokeathlon/pokeathlon_save.h"

u32 PokeathlonSave_sizeof() {
    return sizeof(POKEATHLON_SAV);
}

void PokeathlonSave_Init(POKEATHLON_SAV *dest) {
    u8 i, j;

    MI_CpuFill8(dest, 0, sizeof(POKEATHLON_SAV));
    
    for (i = 0; i < 10; i++) {
        for (j = 0; j < 5; j++) {
            dest->recordsSolo[i].entries[j].unk_0 = 0xFFFF;
            dest->recordsLink[i].entries[j].unk_0 = 0xFFFF;
        }
    }
}

POKEATHLON_SAV *PokeathlonSave_Get(SaveData *saveData) {
    return SaveArray_Get(saveData, SAVE_POKEATHLON);
}

POKEATHLON_SAV *PokeathlonSave_dummy1(POKEATHLON_SAV *pokeathlon) {
    return pokeathlon;
}

void *PokeathlonSave_GetUnkDC(POKEATHLON_SAV *pokeathlonSave) {
    return pokeathlonSave->unk_DC;
}

Pokeathlon_RecordsSolo *PokeathlonSave_GetRecordsSolo(POKEATHLON_SAV *pokeathlonSave) {
    return pokeathlonSave->recordsSolo;
}

Pokeathlon_RecordsLink *PokeathlonSave_GetRecordsLink(POKEATHLON_SAV *pokeathlonSave) {
    return pokeathlonSave->recordsLink;
}

void *PokeathlonSave_GetUnkAEC(POKEATHLON_SAV *pokeathlonSave) {
    return pokeathlonSave->unk_AEC;
}

Pokeathlon_UnkSubStruct_B00 *PokeathlonSave_GetUnkB00(POKEATHLON_SAV *pokeathlonSave) {
    return &pokeathlonSave->unk_B00;
}

POKEATHLON_SAV *PokeathlonSave_dummy2(POKEATHLON_SAV *pokeathlon) {
    return pokeathlon;
}

BOOL PokeathlonSave_GetUnkDC_AtIndex(POKEATHLON_SAV *pokeathlonSave, int a0, int a1) {
    if (a0 < 0 || a0 > 4) {
        GF_ASSERT(FALSE);
        return 0;
    }
    int index = a1 - 1;
    if (index < 0) {
        GF_ASSERT(FALSE);
        return 0;
    }
    if (!(((int)pokeathlonSave->unk_DC[index]) >> a0 & 1)) {
        return 0;
    }
    return 1;
}

Pokeathlon_RecordsSolo *PokeathlonSave_GetRecordsSolo2(POKEATHLON_SAV *pokeathlonSave) {
    return pokeathlonSave->recordsSolo;
}

Pokeathlon_RecordsLink *PokeathlonSave_GetRecordsLink2(POKEATHLON_SAV *pokeathlonSave) {
    return pokeathlonSave->recordsLink;
}

Pokeathlon_UnkSubStruct_B00 *PokeathlonSave_GetAgainUnkB00(POKEATHLON_SAV *pokeathlonSave) {
    return &pokeathlonSave->unk_B00;
}

void PokeathlonSave_SetUnkDC_AtIndex(POKEATHLON_SAV *pokeathlonSave, int a0, int a1) {
    u8 i, bit;
    int index = a1 - 1;
    if (index < 0) {
        GF_ASSERT(FALSE);
        return;
    }
    for (i = 0; i < 5; i++) {
        if ((u8)((a0 >> i) & 1) != 0) {
            bit = (u8)(1 << i);
            pokeathlonSave->unk_DC[index] |= bit;
        }
    }
}

void PokeathlonSave_AddAthletePoints(POKEATHLON_SAV *pokeathlonSave, u16 amount) {
    pokeathlonSave->athletePoints += amount;
    if (pokeathlonSave->athletePoints > 99999) {
        pokeathlonSave->athletePoints = 99999;
    }
}

void PokeathlonSave_SubAthletePoints(POKEATHLON_SAV *pokeathlonSave, u16 amount) {
    pokeathlonSave->athletePoints -= amount;
    if (pokeathlonSave->athletePoints < 0) {
        pokeathlonSave->athletePoints = 0;
    }
}

u32 PokeathlonSave_GetAthletePoints(POKEATHLON_SAV *pokeathlonSave) {
    return pokeathlonSave->athletePoints;
}

BOOL PokeathlonSave_GetUnkB78_AtIndex(POKEATHLON_SAV *pokeathlon, int idx) {
    GF_ASSERT(idx < 27);
    return (pokeathlon->unk_B78 >> idx) & 1;
}

void PokeathlonSave_SetUnkB78_AtIndex(POKEATHLON_SAV *pokeathlon, int idx) {
    GF_ASSERT(idx < 27);
    pokeathlon->unk_B78 |= 1 << idx;
}

BOOL PokeathlonSave_GetUnkB7C_AtIndex(POKEATHLON_SAV *pokeathlon, int idx) {
    return (pokeathlon->unk_B7C >> idx) & 1;
}

void PokeathlonSave_SetUnkB7C_AtIndex(POKEATHLON_SAV *pokeathlon, int idx) {
    pokeathlon->unk_B7C |= 1 << idx;
}

void PokeathlonSave_ResetUnkB7C(POKEATHLON_SAV *pokeathlon) {
    pokeathlon->unk_B7C = 0;
}
