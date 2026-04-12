#include "unk_02031904.h"

#include <nitro/mi/memory.h>

#include "global.h"

#include "assert.h"
#include "constants/save_arrays.h"
#include "save.h"

u32 Save_Pokeathlon_sizeof(void) {
    return sizeof(POKEATHLON_SAV);
}

void Save_Pokeathlon_Init(POKEATHLON_SAV *pokeathlonSave) {
    u8 i, j;

    MI_CpuFill8(pokeathlonSave, 0, sizeof(POKEATHLON_SAV));
    for (i = 0; i < 10; i++) {
        for (j = 0; j < 5; j++) {
            *(u16 *)(&pokeathlonSave->unk_2CC[i * 0x2C + j * 8]) = 0xFFFF;
            *(u16 *)(&pokeathlonSave->unk_484[i * 0xA4 + j * 8]) = 0xFFFF;
        }
    }
}

POKEATHLON_SAV *Save_Pokeathlon_Get(SaveData *saveData) {
    return SaveArray_Get(saveData, SAVE_POKEATHLON);
}

POKEATHLON_SAV *sub_02031974(POKEATHLON_SAV *pokeathlonSave) {
    return pokeathlonSave;
}

void *sub_02031978(POKEATHLON_SAV *pokeathlonSave) {
    return pokeathlonSave->unk_0DC;
}

void *sub_0203197C(POKEATHLON_SAV *pokeathlonSave) {
    return pokeathlonSave->unk_2CC;
}

void *sub_02031984(POKEATHLON_SAV *pokeathlonSave) {
    return pokeathlonSave->unk_484;
}

void *sub_02031990(POKEATHLON_SAV *pokeathlonSave) {
    return pokeathlonSave->unk_AEC;
}

Pokeathlon_UnkSubStruct_B00 *sub_0203199C(POKEATHLON_SAV *pokeathlonSave) {
    return &pokeathlonSave->unk_B00;
}

void sub_020319A4(POKEATHLON_SAV *pokeathlonSave) {
}

BOOL sub_020319A8(POKEATHLON_SAV *pokeathlonSave, int bitIdx, int pokemonIdx) {
    if (bitIdx < 0 || bitIdx > 4) {
        GF_ASSERT(FALSE);
        return 0;
    }
    if (--pokemonIdx < 0) {
        GF_ASSERT(FALSE);
        return 0;
    }
    return (pokeathlonSave->unk_0DC[pokemonIdx] >> bitIdx) & 1;
}

void *sub_020319DC(POKEATHLON_SAV *pokeathlonSave) {
    return pokeathlonSave->unk_2CC;
}

void *sub_020319E4(POKEATHLON_SAV *pokeathlonSave) {
    return pokeathlonSave->unk_484;
}

Pokeathlon_UnkSubStruct_B00 *sub_020319F0(POKEATHLON_SAV *pokeathlonSave) {
    return &pokeathlonSave->unk_B00;
}

void sub_020319F8(POKEATHLON_SAV *pokeathlonSave, u8 mask, int pokemonIdx) {
    u8 i;

    if (--pokemonIdx < 0) {
        GF_ASSERT(FALSE);
        return;
    }
    for (i = 0; i < 5; i++) {
        if ((mask >> i) & 1) {
            pokeathlonSave->unk_0DC[pokemonIdx] |= (u8)(1 << i);
        }
    }
}

void SavePokeathlon_AddAthletePoints(POKEATHLON_SAV *pokeathlonSave, u16 amount) {
    pokeathlonSave->athletePoints += amount;
    if ((s32)pokeathlonSave->athletePoints > 99999) {
        pokeathlonSave->athletePoints = 99999;
    }
}

void SavePokeathlon_SubAthletePoints(POKEATHLON_SAV *pokeathlonSave, u16 amount) {
    pokeathlonSave->athletePoints -= amount;
    if ((s32)pokeathlonSave->athletePoints < 0) {
        pokeathlonSave->athletePoints = 0;
    }
}

u32 SavePokeathlon_GetAthletePoints(POKEATHLON_SAV *pokeathlonSave) {
    return pokeathlonSave->athletePoints;
}

BOOL sub_02031A78(POKEATHLON_SAV *pokeathlonSave, int idx) {
    GF_ASSERT(idx < 27);
    return (pokeathlonSave->prizeFlags >> idx) & 1;
}

void sub_02031A98(POKEATHLON_SAV *pokeathlonSave, int idx) {
    GF_ASSERT(idx < 27);
    pokeathlonSave->prizeFlags |= (1 << idx);
}

BOOL sub_02031AB8(POKEATHLON_SAV *pokeathlonSave, int idx) {
    return (pokeathlonSave->unk_B7C >> idx) & 1;
}

void sub_02031ACC(POKEATHLON_SAV *pokeathlonSave, int idx) {
    pokeathlonSave->unk_B7C |= (1 << idx);
}

void sub_02031AE4(POKEATHLON_SAV *pokeathlonSave) {
    pokeathlonSave->unk_B7C = 0;
}
