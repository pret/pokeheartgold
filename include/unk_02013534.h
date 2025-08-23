#ifndef POKEHEARTGOLD_UNK_02013534_H
#define POKEHEARTGOLD_UNK_02013534_H

#include "bg_window.h"
#include "heap.h"
#include "sprite.h"

typedef struct UnkStruct_02013534 UnkStruct_02013534; // size: 0x68
typedef struct UnkStruct_02013910 UnkStruct_02013910;
// TODO https://github.com/pret/pokeheartgold/issues/404: rename
typedef struct TextOBJTemplate {
    UnkStruct_02013534 *unk_00;
    Window *window;
    SpriteList *spriteList;
    NNSG2dImagePaletteProxy *plttResourceProxy;
    Sprite *sprite;
    u32 offset;
    int unk_18;
    int unk_1C;
    int unk_20;
    int unk_24;
    int unk_28;
    enum HeapID heapID;
} TextOBJTemplate;
typedef struct TextOBJ TextOBJ;

UnkStruct_02013534 *sub_02013534(int num, enum HeapID heapID);
void sub_020135AC(UnkStruct_02013534 *a0);

void sub_02013820(TextOBJ *textOBJ, int a1);
void sub_020136B4(TextOBJ *textOBJ, int a1, int a2);
void TextOBJ_SetSpritesDrawFlag(TextOBJ *textOBJ, BOOL draw);
void TextOBJ_SetPaletteNum(TextOBJ *textOBJ, int pltt);
UnkStruct_02013910 *sub_02013910(Window *window, enum HeapID heapID);
void sub_02013938(UnkStruct_02013910 *a0);
u32 sub_02013948(UnkStruct_02013910 *a0, NNS_G2D_VRAM_TYPE vramType);
TextOBJ *TextOBJ_Create(const TextOBJTemplate *template, UnkStruct_02013910 *a1);
void TextOBJ_Destroy(TextOBJ *textOBJ);
void TextOBJ_CopyFromBGWindow(TextOBJ *textOBJ, UnkStruct_02013910 *a1, Window *window, enum HeapID heapID);
void sub_02013A50(Window *window, int a1, int a2, int a3, int a4, void *charBuf);

#endif // POKEHEARTGOLD_UNK_02013534_H
