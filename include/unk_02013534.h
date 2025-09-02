#ifndef POKEHEARTGOLD_UNK_02013534_H
#define POKEHEARTGOLD_UNK_02013534_H

#include "bg_window.h"
#include "heap.h"

typedef struct FontOAMInitData {
    void *fontSystem;
    const Window *window;
    SpriteList *spriteList;
    const NNSG2dImagePaletteProxy *imagePaletteProxy;
    const Sprite *unk_10;
    int offset;
    int x;
    int y;
    int unk_20;
    int unk_24;
    int vram;
    int unk_2C;
} FontOAMInitData;

typedef struct FontOAM {
    void *unk_00;
    int unk_04;
    const Sprite *unk_08;
    int unk_0C;
    int unk_10;
} FontOAM;

void *FontSystem_NewInit(int, HeapID);
void sub_02013A50(Window *window, int a1, int a2, int a3, int a4, void *a5);
void sub_020135AC(void *a0);
void sub_02013794(void *a0, u32 *a1, u32 *a2);
void FontOAM_SetDrawFlag(void *a0, int a1);
int sub_02013688(Window *window, NNS_G2D_VRAM_TYPE vram, int a2);
FontOAM *sub_020135D8(FontOAMInitData *init);
void sub_020138E0(FontOAM *fontOAM, int a1);
void sub_020136B4(FontOAM *fontOAM, int x, int y);
void FontOAM_Delete(FontOAM *fontOAM);

#endif // POKEHEARTGOLD_UNK_02013534_H
