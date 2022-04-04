#include "player_data.h"
#include "save.h"
#include "unk_0202CA24.h"
#include "unk_0203170C.h"
#include "math_util.h"

u32 sub_0203170C(void) {
    return sizeof(Unk0203170C);
}

void sub_02031710(Unk0203170C *a0) {
    MI_CpuClear8(a0, sizeof(Unk0203170C));
    memset(a0, 0, sizeof(a0->unk0));
    a0->unk34 = 1;
    SaveSubstruct_UpdateCRC(SAVE_UNK_31);
}

void sub_02031734(SAVEDATA *saveData) {
    sub_02031710(SavArray_get(saveData, SAVE_UNK_31));
}

BOOL sub_02031744(SAVEDATA *saveData) {
    Unk0203170C *ptr = (Unk0203170C *)(SavArray_get(saveData, SAVE_UNK_31));
    if ((s8)(ptr->unk0[0]) != 0) {
        return TRUE;
    }
    return FALSE;
}

void sub_0203175C(SAVEDATA *saveData, char *a1) {
    Unk0203170C *ptr = (Unk0203170C *)(SavArray_get(saveData, SAVE_UNK_31));
    strcpy(ptr->unk0, a1);
    SaveSubstruct_UpdateCRC(SAVE_UNK_31);
}

Unk0203170C *sub_02031774(SAVEDATA *saveData) {
    return SavArray_get(saveData, SAVE_UNK_31);
}

void sub_02031780(SAVEDATA *saveData, u32 a1, u32 a2) {
    Unk0203170C *ptr = (Unk0203170C *)(SavArray_get(saveData, SAVE_UNK_31));
    switch (a1) {
    case 0:
        ptr->unk34 = a2;
        break;
    case 1:
        ptr->unk38 = a2;
        break;
    case 2:
        ptr->unk3a = a2;
        break;
    case 3:
        ptr->unk3c = a2;
        break;
    }
    SaveSubstruct_UpdateCRC(SAVE_UNK_31);
}

u32 sub_020317BC(SAVEDATA *saveData, u32 a1) {
    Unk0203170C *ptr = (Unk0203170C *)(SavArray_get(saveData, SAVE_UNK_31));
    switch (a1) {
    case 0:
        return ptr->unk34;
    case 1:
        return ptr->unk38;
    case 2:
        return ptr->unk3a;
    case 3:
        return ptr->unk3c;
    }
    return 0;
}

static void sub_020317F4(SAVEDATA *saveData, Unk020317F4 *a1) {
    void *ptr;
    Unk0203170C *ptr2;
    PLAYERPROFILE* profile;

    ptr = sub_0202CA44(saveData);
    profile = Sav2_PlayerData_GetProfileAddr(saveData);
    ptr2 = sub_02031774(saveData);

    MI_CpuClear8(a1, sizeof(Unk020317F4));
    a1->version = GAME_VERSION;
    a1->language = GAME_LANGUAGE;
    a1->unk2 = sub_0202CA8C(ptr);
    a1->unk3 = sub_0202CA90(ptr);
    a1->otId = PlayerProfile_GetTrainerID(profile);
    CopyU16StringArray(a1->name, PlayerProfile_GetNamePtr(profile));
    a1->unk18 = 0;
    strcpy(a1->unk24, ptr2->unk0);
    a1->unk5c = sub_020317BC(saveData, 0);

    SaveSubstruct_UpdateCRC(SAVE_UNK_31);
}

s32 sub_0203186C(SAVEDATA *saveData, Unk020317F4 *a1) {
    s32 rand;

    sub_020317F4(saveData, a1);

    rand = LCRandom() % 1000;
    a1->unk60 = rand;
    a1->unk62 = 0xffff;

    SaveSubstruct_UpdateCRC(SAVE_UNK_31);
    return rand;
}

void sub_0203189C(SAVEDATA *saveData, Unk020317F4 *a1) {
    Unk0203170C *ptr = (Unk0203170C *)(SavArray_get(saveData, SAVE_UNK_31));

    sub_020317F4(saveData, a1);

    a1->unk60 = ptr->unk38;
    a1->unk62 = ptr->unk3a;

    SaveSubstruct_UpdateCRC(SAVE_UNK_31);
}
