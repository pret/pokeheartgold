#ifndef POKEHEARTGOLD_UNK_02013534_H
#define POKEHEARTGOLD_UNK_02013534_H

#include "bg_window.h"
#include "heap.h"
#include "sprite.h"

typedef struct UnkStruct_02013534 UnkStruct_02013534; // size: 0x68
typedef struct UnkStruct_02013910 UnkStruct_02013910;
typedef struct UnkTemplate_02013950 {
    UnkStruct_02013534 *unk_00;
    Window *unk_04;
    SpriteList *unk_08;
    NNSG2dImagePaletteProxy *unk_0C;
    Sprite *unk_10;
    u32 unk_14;
    int unk_18;
    int unk_1C;
    int unk_20;
    int unk_24;
    int unk_28;
    HeapID unk_2C;
} UnkTemplate_02013950;
typedef struct UnkStruct_02013950 UnkStruct_02013950;

UnkStruct_02013534 *sub_02013534(int a0, HeapID a1);
void sub_020135AC(UnkStruct_02013534 *a0);

void sub_020136B4(UnkStruct_02013950 *a0, int a1, int a2);
void sub_020137C0(UnkStruct_02013950 *a0, int a1);
void sub_02013850(UnkStruct_02013950 *a0, int a1);
UnkStruct_02013910 *sub_02013910(Window *a0, HeapID heapID);
void sub_02013938(UnkStruct_02013910 *a0);
u32 sub_02013948(UnkStruct_02013910 *a0, NNS_G2D_VRAM_TYPE a1);
UnkStruct_02013950 *sub_02013950(const UnkTemplate_02013950 *a0, UnkStruct_02013910 *a1);
void sub_020139C8(UnkStruct_02013950 *a0);
void sub_02013A50(Window *window, int a1, int a2, int a3, int a4, void *a5);

#endif // POKEHEARTGOLD_UNK_02013534_H
