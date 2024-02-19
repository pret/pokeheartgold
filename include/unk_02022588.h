#ifndef POKEHEARTGOLD_UNK_02022588_H
#define POKEHEARTGOLD_UNK_02022588_H

#include "heap.h"

typedef struct UnkStruct_02022660 {
    NNSG2dPaletteData *plttData;
    NNS_G2D_VRAM_TYPE vram;
    int plttNum;
    int id;
} UnkStruct_02022660;

void sub_02022588(int, HeapID);
void sub_02022608(void);
BOOL sub_02022660(const UnkStruct_02022660 *a0);
BOOL sub_020226A4(const UnkStruct_02022660 *a0);
void sub_020226E4(int resID, NNSG2dPaletteData *plttData);
void sub_02022638(void);
void sub_020225E4(u32, u32);
void sub_02022744(u32);
NNSG2dImagePaletteProxy *sub_020227D4(int resID, NNSG2dImageProxy *imageProxy);
NNSG2dImagePaletteProxy *sub_020227AC(int resID);

#endif //POKEHEARTGOLD_UNK_02022588_H
