#ifndef POKEHEARTGOLD_UNK_02013534_H
#define POKEHEARTGOLD_UNK_02013534_H

#include "bg_window.h"
#include "heap.h"
#include "sprite.h"

typedef struct UnkStruct_02013534 UnkStruct_02013534; // size: 0x68
typedef struct UnkStruct_02013910 UnkStruct_02013910;
// TODO https://github.com/pret/pokeheartgold/issues/404: rename
typedef struct TextOBJTemplate {
    UnkStruct_02013534 *fontSystem;
    Window *window;
    SpriteList *spriteList;
    NNSG2dImagePaletteProxy *plttResourceProxy;
    Sprite *sprite;
    u32 offset;
    int x;
    int y;
    int unk_20;
    int unk_24;
    int vram;
    enum HeapID heapID;
} TextOBJTemplate;
typedef struct TextOBJ {
    void *unk_00;
    int unk_04;
    const Sprite *unk_08;
    int unk_0C;
    int unk_10;
} TextOBJ;

UnkStruct_02013534 *FontSystem_NewInit(int a0, enum HeapID heapId);
void sub_02013794(void *a0, u32 *a1, u32 *a2);
int sub_02013688(Window *window, NNS_G2D_VRAM_TYPE vram, int a2);
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
TextOBJ *sub_020135D8(TextOBJTemplate *textObjTemplate);
void sub_020138E0(TextOBJ *textObj, int a1);
void FontOAM_Delete(TextOBJ *textObj);

#endif // POKEHEARTGOLD_UNK_02013534_H
