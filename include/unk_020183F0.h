#ifndef POKEHEARTGOLD_UNK_020183F0_H
#define POKEHEARTGOLD_UNK_020183F0_H

#include "heap.h"
#include "list_menu_items.h"
#include "bg_window.h"

typedef struct Ov122_021E9282 {
    u16 unk0;
    u16 unk2;
    u16 unk4;
    u16 unk6;
    u16 unk8;
    u16 unkA;
} Ov122_021E9282;

typedef struct Ov122_021E7488 {
    Ov122_021E9282 unk0;
    LISTMENUITEM *unkC;
    BgConfig *unk10;
    u8 unk14;
    u8 unk15[0x3];
} Ov122_021E7488;

int sub_020183F0(u32 *);
void sub_02018410(u32 *a0);
void *sub_02018424(HeapID, int);
void sub_02018474(void *);
void *sub_020185FC(void *, Ov122_021E7488 *, s32, u8, u8, u8, u8);
int sub_020186A4(void *);
u8 sub_02018674(void *);
void sub_02018680(void *);

#endif //POKEHEARTGOLD_UNK_020183F0_H
