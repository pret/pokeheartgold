#ifndef GUARD_POKEHEARTGOLD_UNK_02108424_H
#define GUARD_POKEHEARTGOLD_UNK_02108424_H

#include "bg_window.h"
#include "heap.h"
#include "list_menu_items.h"

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

typedef struct UnkStruct_02018424 {
    HeapID heapId;
    NNSG2dCharacterData *pCharData;
    NNSG2dPaletteData *pPlttData;
    void *charDataRaw;
    void *plttDataRaw;
    int unk_14;
} UnkStruct_02018424;

UnkStruct_02018424 *sub_02018424(HeapID heapId, int a1);
void sub_02018474(UnkStruct_02018424 *a0);
void *sub_020185FC(UnkStruct_02018424 *, Ov122_021E7488 *, s32, u8, u8, u8, u8);
int sub_020186A4(UnkStruct_02018424 *);
u8 sub_02018674(UnkStruct_02018424 *);
void sub_02018680(UnkStruct_02018424 *);
#endif // GUARD_POKEHEARTGOLD_UNK_02108424_H
