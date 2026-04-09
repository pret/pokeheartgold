#include "pokeathlon/pokeathlon_save.h"

u32 Save_Pokeathlon_sizeof() {
    return sizeof(POKEATHLON_SAV);
}

void Save_Pokeathlon_Init(POKEATHLON_SAV *dest) {
    u8 i, j;

    MI_CpuFill8(dest, 0, sizeof(POKEATHLON_SAV));
    
    for (i = 0; i < 10; i++) {
        for (j = 0; j < 5; j++) {
            dest->unk_2CC[i].entries[j].unk_0 = 0xFFFF;
            dest->unk_484[i].entries[j].unk_0 = 0xFFFF;
        }
    }
}

POKEATHLON_SAV *Save_Pokeathlon_Get(SaveData *saveData) {
    return SaveArray_Get(saveData, 0x25);
}

POKEATHLON_SAV *Save_Pokeathlon_dummy1(POKEATHLON_SAV *pokeathlon) {
    return pokeathlon;
}

void *Save_Pokeathlon_GetUnkDC(POKEATHLON_SAV *pokeathlonSave) {
    return pokeathlonSave->unk_DC;
}

Pokeathlon_UnkSubStruct_2C *Save_Pokeathlon_GetUnk2CC(POKEATHLON_SAV *pokeathlonSave) {
    return pokeathlonSave->unk_2CC;
}

Pokeathlon_UnkSubStruct_A4 *Save_Pokeathlon_GetUnk484(POKEATHLON_SAV *pokeathlonSave) {
    return pokeathlonSave->unk_484;
}

void *Save_Pokeathlon_GetUnkAEC(POKEATHLON_SAV *pokeathlonSave) {
    return pokeathlonSave->unk_AEC;
}

Pokeathlon_UnkSubStruct_B00 *Save_Pokeathlon_GetUnkB00(POKEATHLON_SAV *pokeathlonSave) {
    return &pokeathlonSave->unk_B00;
}

POKEATHLON_SAV *Save_Pokeathlon_dummy2(POKEATHLON_SAV *pokeathlon) {
    return pokeathlon;
}

BOOL SavePokeathlon_GetUnkDC_AtIndex(POKEATHLON_SAV *pokeathlonSave, int a0, int a1) {
    if (a0 < 0 || a0 > 4) {
        GF_AssertFail();
        return 0;
    }
    int index = a1 - 1;
    if (index < 0) {
        GF_AssertFail();
        return 0;
    }
    if (!(((int)pokeathlonSave->unk_DC[index]) >> a0 & 1)) {
        return 0;
    }
    return 1;
}

Pokeathlon_UnkSubStruct_2C *Save_Pokeathlon_GetAgainUnk2CC(POKEATHLON_SAV *pokeathlonSave) {
    return pokeathlonSave->unk_2CC;
}

Pokeathlon_UnkSubStruct_A4 *Save_Pokeathlon_GetAgainUnk484(POKEATHLON_SAV *pokeathlonSave) {
    return pokeathlonSave->unk_484;
}

Pokeathlon_UnkSubStruct_B00 *Save_Pokeathlon_GetAgainUnkB00(POKEATHLON_SAV *pokeathlonSave) {
    return &pokeathlonSave->unk_B00;
}

void SavePokeathlon_SetUnkDC_AtIndex(POKEATHLON_SAV *pokeathlonSave, int a0, int a1) {
    u8 i, bit;
    int index = a1 - 1;
    if (index < 0) {
        GF_AssertFail();
        return;
    }
    for (i = 0; i < 5; i++) {
        if ((u8)((a0 >> i) & 1) != 0) {
            bit = (u8)(1 << i);
            pokeathlonSave->unk_DC[index] |= bit;
        }
    }
}

void SavePokeathlon_AddAthletePoints(POKEATHLON_SAV *pokeathlonSave, u16 amount) {
    pokeathlonSave->athletePoints += amount;
    if (pokeathlonSave->athletePoints > 99999) {
        pokeathlonSave->athletePoints = 99999;
    }
}

void SavePokeathlon_SubAthletePoints(POKEATHLON_SAV *pokeathlonSave, u16 amount) {
    pokeathlonSave->athletePoints -= amount;
    if (pokeathlonSave->athletePoints < 0) {
        pokeathlonSave->athletePoints = 0;
    }
}

u32 SavePokeathlon_GetAthletePoints(POKEATHLON_SAV *pokeathlonSave) {
    return pokeathlonSave->athletePoints;
}

BOOL SavePokeathlon_GetUnkB78_AtIndex(POKEATHLON_SAV *pokeathlon, int idx) {
    GF_ASSERT(idx < 27);
    return (pokeathlon->unk_B78 >> idx) & 1;
}

void SavePokeathlon_SetUnkB78_AtIndex(POKEATHLON_SAV *pokeathlon, int idx) {
    GF_ASSERT(idx < 27);
    pokeathlon->unk_B78 |= 1 << idx;
}
