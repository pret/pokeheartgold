#ifndef POKEHEARTGOLD_UNK_02013FDC_H
#define POKEHEARTGOLD_UNK_02013FDC_H

#include "filesystem.h"

typedef struct SpritePosSize {
    int x;
    int y;
    int w;
    int h;
} SpritePosSize;

void sub_020141C4(NarcId narcId, s32 fileId, enum HeapID heapID, int x, int y, int width, int height, void *dest);
void *sub_02014298(NarcId narcId, s32 fileId, enum HeapID heapID, int x, int y, int width, int height);
void DrawSpriteWithPosSize_Battle(NarcId narcId, s32 fileId, enum HeapID heapID, SpritePosSize *posSize, void *dest);
void DrawSprite_Battle(NarcId narcId, s32 fileId, enum HeapID heapID, void *dest);
void *sub_0201442C(NarcId narcId, s32 fileId, enum HeapID heapID);
void *sub_02014450(NarcId narcId, s32 fileId, enum HeapID heapID);
void DrawPokemonSprite(NarcId narcId, s32 fileId, enum HeapID heapID, int x, int y, int width, int height, void *dest, u32 pid, BOOL isAnimated, int whichFacing, int species);
void DrawPokemonSpriteWithPosSize_Battle(NarcId narcId, s32 fileId, enum HeapID heapID, SpritePosSize *posSize, void *dest, u32 personality, BOOL isAnimated, int whichFacing, int species);
void DrawPokemonSprite_Battle(NarcId narcId, s32 fileId, enum HeapID heapID, void *dest, u32 personality, BOOL isAnimated, int whichFacing, int species);
void *sub_0201457C(NarcId narcId, s32 fileId, enum HeapID heapID, u32 personality, BOOL isAnimated, int whichFacing, int species);
void sub_020145B4(const void *texSrc, int texDim, int x, int y, int w, int h, void *dest);

#endif // POKEHEARTGOLD_UNK_02013FDC_H
