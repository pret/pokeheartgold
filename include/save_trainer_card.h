#ifndef POKEHEARTGOLD_SAVE_TRAINER_CARD_H
#define POKEHEARTGOLD_SAVE_TRAINER_CARD_H

#include "save.h"

struct SaveTrainerCard {
    int badgeShininess[8];
    int signaturePointData[0x180];
}; // size=0x620

u32 Save_TrainerCard_sizeof(void);
void Save_TrainerCard_Init(struct SaveTrainerCard *data);
struct SaveTrainerCard *Save_TrainerCard_Get(SaveData *saveData);
int *TrainerCard_GetSignature(struct SaveTrainerCard *data);
BOOL TrainerCard_SignatureExists(struct SaveTrainerCard *data);
int *TrainerCard_GetBadgeShininessArr(struct SaveTrainerCard *data);
int GetShininessOfBadgeI(u8 idx, int *arr);
void SetShininessOfBadgeI(u8 idx, int val, int *arr);

#endif // POKEHEARTGOLD_SAVE_TRAINER_CARD_H
