#ifndef POKEHEARTGOLD_FASHION_CASE_H
#define POKEHEARTGOLD_FASHION_CASE_H

#include "mail_message.h"

typedef struct SaveDressupDataSub {
    u8 filler_00[0x40];
    MAIL_MESSAGE mailMessage;
    u8 filler_48[0x2C];
} SaveDressupDataSub; // size=0x74

typedef struct FashionCase {
    u8 filler_00[0x98];
} FashionCase; // size=0x98

typedef struct SaveDressupDataSub7F4 {
    u8 filler_00[0x28];
    u32 unk_28[18 / sizeof(u32)];
    u8 padding_3C[4];
} SaveDressupDataSub7F4;

typedef struct SaveDressupData {
    SaveDressupDataSub unk_000[11]; // 000
    FashionCase fashionCase[5]; // 3FC
    SaveDressupDataSub7F4 unk_7F4; // 7F4
} SaveDressupData; // size=0x834

void *Save_DressupData_get(SAVEDATA *saveData);
void *SaveDressupData_GetFashionCase(void *unk);
u32 FashionCase_CountAccessories(void *unksub);
u32 FashionCase_CountWallpapers(void *unksub);
BOOL sub_0202B9EC(SaveDressupData *dressupData, int a1);
BOOL sub_0202BA08(SaveDressupData *dressupData, int a1);
SaveDressupDataSub *sub_0202B9B8(SaveDressupData *dressupData, int a1);
void sub_0202BD7C(SaveDressupDataSub *dressupDataSub, int a1);

#endif //POKEHEARTGOLD_FASHION_CASE_H
