#ifndef GUARD_POKEHEARTGOLD_UNK_02108424_H
#define GUARD_POKEHEARTGOLD_UNK_02108424_H

#include "bg_window.h"
#include "heap.h"
#include "list_menu_items.h"
#include "palette.h"
#include "touchscreen.h"

typedef struct Ov122_021E9282 {
    u8 unk0_0 : 1;
    u8 unk0_1 : 7;
    u8 unk1;
    u8 bgId;
    u8 plttOffset;
    u8 unk4;
    u8 unk5;
    u16 baseTile;
    u16 charOffset;
    u16 unkA;
} Ov122_021E9282;

typedef struct Ov122_021E7488 {
    Ov122_021E9282 unk0;
    LISTMENUITEM *listMenuItems;
    BgConfig *bgConfig;
    u8 numWindows;
    u8 unk15[0x3];
} Ov122_021E7488;

typedef struct UnkStruct_02018424 {
    HeapID heapId;
    NNSG2dCharacterData *pCharData;
    NNSG2dPaletteData *pPlttData;
    void *charDataRaw;
    void *plttDataRaw;
    PaletteData *paletteData;
} UnkStruct_02018424;

typedef struct UnkStruct_020185FC UnkStruct_020185FC;

typedef void (*UnkFunc_020185FC)(UnkStruct_020185FC *a0, u8 a1, void *a2, int a3);

struct UnkStruct_020185FC {
    UnkStruct_02018424 *unk_00;
    Ov122_021E7488 unk_04;
    Window *windows;
    TouchscreenHitbox *touchscreenHitboxes;
    u8 unk_24;
    u8 unk_25;
    u8 width;
    u8 unk_27_0 : 1;
    u8 unk_27_1 : 7;
    u8 x;
    u8 y;
    u8 unk_2A;
    u8 unk_2B;
    HeapID heapId;
    UnkFunc_020185FC callback;
    void *callbackArg;
};

UnkStruct_02018424 *sub_02018424(HeapID heapId, PaletteData *a1);
void sub_02018474(UnkStruct_02018424 *a0);
UnkStruct_020185FC *sub_020185FC(UnkStruct_02018424 *a0, Ov122_021E7488 *a1, u8 a2, u8 a3, u8 a4, u8 a5, u8 a6);
UnkStruct_020185FC *sub_02018620(UnkStruct_02018424 *a0, Ov122_021E7488 *a1, u8 a2, u8 a3, u8 a4, u8 a5, u8 a6, int a7);
UnkStruct_020185FC *sub_02018648(UnkStruct_02018424 *a0, Ov122_021E7488 *a1, u8 a2, u8 a3, u8 a4, u8 a5, u8 a6, UnkFunc_020185FC a7, void *a8, BOOL a9);
void sub_02018694(UnkStruct_020185FC *a0);
u8 sub_02018674(UnkStruct_020185FC *a0);
void sub_02018680(UnkStruct_020185FC *a0);
int sub_020186A4(UnkStruct_020185FC *a0);

#endif // GUARD_POKEHEARTGOLD_UNK_02108424_H
