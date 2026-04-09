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

POKEATHLON_SAV *sub_02031974(POKEATHLON_SAV *pokeathlon) {
    return pokeathlon;
}

void *sub_02031978(POKEATHLON_SAV *pokeathlonSave) {
    return pokeathlonSave->unk_DC;
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

POKEATHLON_SAV *sub_020319A4(POKEATHLON_SAV *pokeathlon) {
    return pokeathlon;
}
