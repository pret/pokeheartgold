#ifndef POKEHEARTGOLD_FASHION_CASE_H
#define POKEHEARTGOLD_FASHION_CASE_H

#include "mail_message.h"

typedef struct SaveFashionDataSub {
    u8 filler_00[0x40];
    MailMessage mailMessage;
    u8 filler_48[0x2C];
} SaveFashionDataSub; // size=0x74

typedef struct SaveFashionDataSub3FC {
    u8 filler_00[0x98];
} SaveFashionDataSub3FC; // size=0x98

typedef struct FashionCase {
    u32 smallAccessoryQuantities[CEILDIV(61, 2 * sizeof(u32))]; // 61 accessories; quantities stored as nybbles
    u32 largeAccessoryQuantities[CEILDIV(39, 8 * sizeof(u32))]; // 39 accessories; quantities stored as bits
    u32 unk_28[CEILDIV(18, sizeof(u32))];
} FashionCase;

typedef struct SaveFashionData {      // todo: rename to SaveFashionData
    SaveFashionDataSub unk_000[11];   // 000
    SaveFashionDataSub3FC unk_3FC[5]; // 3FC
    FashionCase fashionCase;          // 7F4
} SaveFashionData;                    // size=0x834

SaveFashionData *Save_FashionData_Get(SaveData *saveData);
FashionCase *Save_FashionData_GetFashionCase(SaveFashionData *unk);
u32 FashionCase_CountAccessories(FashionCase *fashionCase);
u32 FashionCase_CountWallpapers(FashionCase *fashionCase);
BOOL sub_0202B9EC(SaveFashionData *fashionData, int a1);
BOOL sub_0202BA08(SaveFashionData *fashionData, int a1);
SaveFashionDataSub *sub_0202B9B8(SaveFashionData *fashionData, int a1);
void sub_0202BD7C(SaveFashionDataSub *fashionDataSub, int a1);
void FashionCase_GiveFashionItem(FashionCase *fashionCase, int id, int quantity);
int FashionCase_HasSpaceForAccessory(FashionCase *fashionCase, int id, int quantity);
u32 FashionCase_GetAccessoryQuantity(FashionCase *fashionCase, int id);
void FashionCase_GiveContestBackground(FashionCase *fashionCase, int id);
int FashionCase_HasSpaceForBackground(FashionCase *fashionCase, int id);
void sub_0202BB7C(FashionCase *fashionCase, int a1, int a2);

#endif // POKEHEARTGOLD_FASHION_CASE_H
