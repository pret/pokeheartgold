#ifndef POKEHEARTGOLD_PALETTE_H
#define POKEHEARTGOLD_PALETTE_H

#include "filesystem.h"
#include "heap.h"

typedef struct SelectedPaletteData {
    u16 unkC;
    u16 wait:6;
    u16 cur:5;
    u16 end:5;
    u16 nextRGB:15;
    u16 sign:1; //0 - increase, 1 - decrease
    u16 unk12;
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
void PaletteData_SetBuffers(PaletteData *data, u32 bufferID, u16 *a2, u16 *a3, u32 size);
void PaletteData_AllocBuffers(PaletteData *data, u32 bufferID, u32 size, HeapID heapID);
void PaletteData_FreeBuffers(PaletteData *data, u32 bufferID);
void PaletteData_LoadFromNarc(PaletteData *data, NarcId narcID, s32 memberNo, HeapID heapID, u32 bufferID, u32 size, u16 pos, u16 readPos);
void PaletteData_LoadNarc(PaletteData *data, NarcId narcID, s32 memberNo, HeapID heapID, u32 bufferID, u32 size, u16 pos);
void sub_02003220(PaletteData *data, NARC *narc, u32 memberNo, HeapID heapID, u32 bufferID, u32 size, u16 pos, u16 readPos);
void sub_02003284(PaletteData *data, NARC *narc, u32 memberNo, HeapID heapID, u32 bufferID, u32 size, u16 pos);
void sub_020032A4(PaletteData *data, u32 bufferID, u16 pos, u32 size);
void PaletteData_CopyPalette(PaletteData *data, u32 srcBufferID, u16 srcPos, u32 destBufferID, u16 destPos, u16 size);
u16 *PaletteData_GetUnfadedBuf(PaletteData *data, u32 bufferID);
u8 sub_02003370(PaletteData *data, u16 bufferID, u16 opaqueBit, s8 wait, u8 cur, u8 end, u16 nextRGB);

void sub_0200398C(void*);
void PaletteData_LoadPalette(PaletteData *data, const u16 *a1, u32 a2, u32 a3, u32 a4);

#endif //POKEHEARTGOLD_PALETTE_H