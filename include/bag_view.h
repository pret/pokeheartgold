#ifndef POKEHEARTGOLD_BAG_VIEW_H
#define POKEHEARTGOLD_BAG_VIEW_H

#include "item.h"
#include "save.h"
#include "player_data.h"

// for GetItemUseErrorMessage
enum ItemUseError {
    ITEMUSEERROR_OAKSWORDS  = 0,
    ITEMUSEERROR_NODISMOUNT = 1,
    ITEMUSEERROR_NOFOLLOWER = 2,
    ITEMUSEERROR_NOTNOW     = 3,
};

typedef struct BAG_CURSOR BAG_CURSOR;

typedef struct BAG_VIEW_POCKET {
    ITEM_SLOT *slots;
    u8 padding[4];
    u8 pocketId;
    u8 padding2[3];
} BAG_VIEW_POCKET;

typedef struct BAG_VIEW {
    SAVEDATA *saveData;
    BAG_VIEW_POCKET pockets[8];
    u8 unk_64;
    u8 unk_65;
    u16 unk_66;
    u16 unk_68;
    u8 filler_6A[2];
    BAG_CURSOR *unk_6C;
    void *unk_70;
    u8 unk_74;
    u8 unk_75;
    u16 unk_76_0:1;
    u16 unk_76_1:15;
    u32 unk_78;
} BAG_VIEW; // size: 0x7C

BAG_VIEW *BagView_New(u8 heap_id);
u32 BagView_sizeof(void);
void sub_02077894(BAG_VIEW *a0, u8 a1);
void sub_0207789C(BAG_VIEW *a0, SAVEDATA *a1, u8 a2, BAG_CURSOR *a3, u32 a4);
void BagView_SetItem(BAG_VIEW *bagView, ITEM_SLOT *slots, u8 pocketId, u8 position);
void sub_020778C8(BAG_VIEW *bagView);
void sub_020778DC(BAG_VIEW *bagView, void *a1);
void sub_020778E0(BAG_VIEW *bagView, u8 a1);
void sub_020778E8(BAG_VIEW *bagView, u16 a1);
u16 sub_02077904(BAG_VIEW *bagView);
u16 sub_0207790C(BAG_VIEW *bagView);
u8 sub_02077914(BAG_VIEW *bagView);
u8 sub_0207791C(BAG_VIEW *bagView);
BOOL TryFormatRegisteredKeyItemUseMessage(SAVEDATA *saveData, STRING *dest, u16 itemId, u32 heap_id);
void GetItemUseErrorMessage(PLAYERDATA *playerData, STRING *dest, u32 unused, int code, u32 heap_id);

#endif //POKEHEARTGOLD_BAG_VIEW_H
