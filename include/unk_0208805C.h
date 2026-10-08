#ifndef POKEHEARTGOLD_UNK_0208805C_H
#define POKEHEARTGOLD_UNK_0208805C_H

#include "bg_window.h"
#include "filesystem.h"
#include "heap.h"

typedef enum BgGfxAssetType {
    GF_BG_GFX_TYPE_CHAR,
    GF_BG_GFX_TYPE_SCRN,
    GF_BG_GFX_TYPE_PLTT,
} BgGfxAssetType;

u16 sub_0208805C(int a0);
u8 CalculateHpBarPixelsLength(u32 hp, u32 maxHp, u8 pixelsWide);
u8 HpBar_GetColorIdx(u32 pixelsCur, u32 pixelsWide);
u8 CalculateHpBarColor(u16 hp, u16 maxHp, u32 pixelsWide);
void App_StartScreenFade(u8 fadeOut, enum HeapID heapID);
int AdjustQuantityUsingDPad(s16 *pAmount, u16 limit);
void BgConfig_LoadAssetFromOpenNarc(BgConfig *bgConfig, enum HeapID heapID, NARC *narc, NarcId unused, int fileId, GFBgLayer layer, BgGfxAssetType kind, u32 szByte, u32 offest);

#endif
