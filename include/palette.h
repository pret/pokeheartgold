#ifndef POKEHEARTGOLD_PALETTE_H
#define POKEHEARTGOLD_PALETTE_H

#include "filesystem.h"
#include "heap.h"

typedef struct RgbColor {
    u16 r : 5;
    u16 g : 5;
    u16 b : 5;
    u16 dummy : 1;
} RgbColor;

#define PaletteBlend(source, target, frac) ((source) + (((target) - (source)) * (frac) >> 4))

typedef struct SelectedPaletteData {
    u16 opaqueBit;
    u16 wait:6;
    u16 cur:5;
    u16 end:5;
    u16 nextRGB:15;
    u16 sign:1; //0 - increase, 1 - decrease
    u16 step:4;
    u16 unk6_4:6;
    u16 unk6_10:6;
} SelectedPaletteData;

typedef struct PaletteBuffer {
    u16 *opaque;
    u16 *transparent;
    u32 size;
    SelectedPaletteData selected;
} PaletteBuffer;

typedef struct PaletteData {
    PaletteBuffer buffers[14];
    u16 selectedFlag:2;
    u16 selectedBuffer:14;
    u16 transparentBit:14;
    u16 callbackFlag:1;
    u16 autoTransparent:1;
    u8 forceExit;
    u8 unused[3];
} PaletteData;

PaletteData *PaletteData_Init(HeapID heapId);
void PaletteData_Free(PaletteData *data);
void PaletteData_SetBuffers(PaletteData *data, int bufferID, u16 *opaque, u16 *transparent, u32 size);
void PaletteData_AllocBuffers(PaletteData *data, int bufferID, u32 size, HeapID heapID);
void PaletteData_FreeBuffers(PaletteData *data, int bufferID);
void PaletteData_LoadPalette(PaletteData *data, const u16 *src, int bufferID, u16 offset, u16 size);
void PaletteData_LoadFromNarc(PaletteData *data, NarcId narcID, s32 memberNo, HeapID heapID, int bufferID, u32 size, u16 pos, u16 readPos);
void PaletteData_LoadNarc(PaletteData *data, NarcId narcID, s32 memberNo, HeapID heapID, int bufferID, u32 size, u16 pos);
void PaletteData_LoadFromOpenNarc(PaletteData *data, NARC *narc, s32 memberNo, HeapID heapID, int bufferID, u32 size, u16 pos, u16 readPos);
void PaletteData_LoadOpenNarc(PaletteData *data, NARC *narc, s32 memberNo, HeapID heapID, int bufferID, u32 size, u16 pos);
void sub_020032A4(PaletteData *data, int bufferID, u16 pos, u32 size);
void PaletteData_CopyPalette(PaletteData *data, u32 srcBufferID, u16 srcPos, u32 destBufferID, u16 destPos, u16 size);
u16 *PaletteData_GetUnfadedBuf(PaletteData *data, int bufferID);
u16 *PaletteData_GetFadedBuf(PaletteData *data, int bufferID);
u8 sub_02003370(PaletteData *data, u16 toSelect, u16 opaqueBit, s8 wait, u8 cur, u8 end, u16 nextRGB);
u8 sub_02003474(PaletteData *data, u16 toSelect, u16 opaqueBit, s8 wait, u8 cur, u8 end, u16 nextRGB);
void sub_0200374C(PaletteData *data);
void PaletteData_PushTransparentBuffers(PaletteData *data);
u16 sub_02003B44(PaletteData *data);
void PaletteData_SetAutoTransparent(PaletteData *data, BOOL autoTransparent);
void sub_02003B74(PaletteData *plttData, BOOL a1);
void sub_02003BA8(u16 selectedBuffer, HeapID heapId);
void sub_02003D5C(PaletteData *plttData, int a1, int a2, u16 a3, u16 a4, u16 a5);
u16 sub_02003DBC(PaletteData *plttData, int a1, int a2, u16 a3);
void sub_02003DE8(const u16 *src, u16 *dest, u16 size, u8 cur, u16 target);
void sub_02003E5C(PaletteData *data, int bufferID, u16 offset, u16 size, u8 cur, u16 target);
void sub_02003EA4(PaletteData *data, int bufferID, u16 selectedBuffer, u8 cur, u16 target);
void TintPalette_GrayScale(u16 *palette, int count);
void TintPalette_CustomTone(u16 *palette, int count, int rTone, int gTone, int bTone);
void sub_02003FC8(PaletteData *data, NarcId narcId, s32 memberNo, HeapID heapId, u32 bufferID, u32 size, u16 pos, int rTone, int gTone, int bTone);

#endif //POKEHEARTGOLD_PALETTE_H