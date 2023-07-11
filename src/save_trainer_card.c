#include "global.h"
#include "save_trainer_card.h"

u32 Save_TrainerCard_sizeof(void) {
    return sizeof(struct SaveTrainerCard);
}

void Save_TrainerCard_Init(struct SaveTrainerCard *data) {
    int i;
    int *badges;

    memset(data, 0, sizeof(struct SaveTrainerCard));
    badges = TrainerCard_GetBadgeShininessArr(data);
    for (i = 0; i < 8; i++) {
        SetShininessOfBadgeI(i, 0x8C, badges);
    }
}

struct SaveTrainerCard *Save_TrainerCard_Get(SaveData *saveData) {
    return SaveArray_Get(saveData, SAVE_TRAINER_CARD);
}

int *TrainerCard_GetSignature(struct SaveTrainerCard *data) {
    return data->signaturePointData;
}

BOOL TrainerCard_SignatureExists(struct SaveTrainerCard *data) {
    u32 total = 0;
    int i;
    int *arr;

    for (i = 0, arr = data->signaturePointData; i < 0x180; i++) {
        total += arr[i];
    }

    return total != 0;
}

int *TrainerCard_GetBadgeShininessArr(struct SaveTrainerCard *data) {
    return data->badgeShininess;
}

int GetShininessOfBadgeI(u8 idx, int *arr) {
    return arr[idx];
}

void SetShininessOfBadgeI(u8 idx, int val, int *arr) {
    arr[idx] = val;
}
