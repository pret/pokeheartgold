#ifndef POKEHEARTGOLD_FASHION_CASE_H
#define POKEHEARTGOLD_FASHION_CASE_H

#include "mail_message.h"

typedef struct SaveDressupDataSub {
    u8 filler_00[0x40];
    MAIL_MESSAGE mailMessage;
    u8 filler_48[0x2C];
} SaveDressupDataSub; // size=0x74

typedef struct SaveDressupDataSub3FC {
    u8 filler_00[0x98];
} SaveDressupDataSub3FC; // size=0x98

typedef struct FashionCase {
    u32 unk_00[40 / sizeof(u32)];
    u32 unk_28[18 / sizeof(u32)];
    u8 padding_3C[4];
} FashionCase;

typedef struct SaveDressupData {
    SaveDressupDataSub unk_000[11]; // 000
    SaveDressupDataSub3FC unk_3FC[5]; // 3FC
    FashionCase fashionCase; // 7F4
} SaveDressupData; // size=0x834

SaveDressupData *Save_DressupData_get(SAVEDATA *saveData);
FashionCase *SaveDressupData_GetFashionCase(SaveDressupData *unk);
u32 FashionCase_CountAccessories(FashionCase *unksub);
u32 FashionCase_CountWallpapers(FashionCase *unksub);
BOOL sub_0202B9EC(SaveDressupData *dressupData, int a1);
BOOL sub_0202BA08(SaveDressupData *dressupData, int a1);
SaveDressupDataSub *sub_0202B9B8(SaveDressupData *dressupData, int a1);
void sub_0202BD7C(SaveDressupDataSub *dressupDataSub, int a1);
void sub_0202BB08(FashionCase *a0, int a1, int a2);
int sub_0202BA2C(FashionCase *a0, int a1, int a2);
u32 sub_0202BA70(FashionCase *a0, int a1);
void sub_0202BBD8(FashionCase *a0, int a1);
int sub_0202BA5C(FashionCase *a0, int a1);
void sub_0202BB7C(FashionCase *a0, int a1, int a2);

#endif //POKEHEARTGOLD_FASHION_CASE_H
