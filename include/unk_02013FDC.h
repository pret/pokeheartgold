#ifndef POKEHEARTGOLD_UNK_02013FDC_H
#define POKEHEARTGOLD_UNK_02013FDC_H

#include "filesystem.h"

typedef struct TileRegion {
    int x;
    int y;
    int w;
    int h;
} TileRegion;

void sub_020141C4(NarcId narcId, s32 fileId, enum HeapID heapID, int x, int y, int width, int height, void *dest);
void *sub_02014298(NarcId narcId, s32 fileId, enum HeapID heapID, int x, int y, int width, int height);
void CharacterSprite_LoadSpriteRegion(NarcId narcId, s32 fileId, enum HeapID heapID, TileRegion *tileRegion, void *dest);
void sub_02014400(NarcId narcId, s32 fileId, enum HeapID heapID, void *dest);
void *sub_0201442C(NarcId narcId, s32 fileId, enum HeapID heapID);
void *CharacterSprite_LoadPalette(NarcId narcId, s32 fileId, enum HeapID heapID);
void sub_02014494(NarcId narcId, s32 fileId, enum HeapID heapID, int x, int y, int width, int height, void *dest, u32 pid, BOOL isAnimated, int whichFacing, int species);
void sub_02014510(NarcId narcId, s32 fileId, enum HeapID heapID, TileRegion *a3, void *dest, u32 personality, BOOL isAnimated, int whichFacing, int species);
void sub_02014540(NarcId narcId, s32 fileId, enum HeapID heapID, void *dest, u32 personality, BOOL isAnimated, int whichFacing, int species);
void *sub_0201457C(NarcId narcId, s32 fileId, enum HeapID heapID, u32 personality, BOOL isAnimated, int whichFacing, int species);
void sub_020145B4(const void *texSrc, int texDim, int x, int y, int w, int h, void *dest);

#endif // POKEHEARTGOLD_UNK_02013FDC_H
