#ifndef POKEHEARTGOLD_PALETTE_H
#define POKEHEARTGOLD_PALETTE_H

#include "filesystem.h"
#include "heap.h"

typedef enum PaletteBufferId {
    PLTTBUF_MAIN_BG,
    PLTTBUF_SUB_BG,
    PLTTBUF_MAIN_OBJ,
    PLTTBUF_SUB_OBJ,
    PLTTBUF_EX_BEGIN,
    PLTTBUF_MAIN_EX_BG_0 = PLTTBUF_EX_BEGIN,
    PLTTBUF_MAIN_EX_BG_1,
    PLTTBUF_MAIN_EX_BG_2,
    PLTTBUF_MAIN_EX_BG_3,
    PLTTBUF_SUB_EX_BG_0,
    PLTTBUF_SUB_EX_BG_1,
    PLTTBUF_SUB_EX_BG_2,
    PLTTBUF_SUB_EX_BG_3,
    PLTTBUF_MAIN_EX_OBJ,
    PLTTBUF_SUB_EX_OBJ,
    PLTTBUF_MAX,
} PaletteBufferId;

#define PLTTBUF_MAIN_BG_F      (1 << PLTTBUF_MAIN_BG)
#define PLTTBUF_SUB_BG_F       (1 << PLTTBUF_SUB_BG)
#define PLTTBUF_MAIN_OBJ_F     (1 << PLTTBUF_MAIN_OBJ)
#define PLTTBUF_SUB_OBJ_F      (1 << PLTTBUF_SUB_OBJ)
#define PLTTBUF_MAIN_EX_BG_0_F (1 << PLTTBUF_MAIN_EX_BG_0)
#define PLTTBUF_MAIN_EX_BG_1_F (1 << PLTTBUF_MAIN_EX_BG_1)
#define PLTTBUF_MAIN_EX_BG_2_F (1 << PLTTBUF_MAIN_EX_BG_2)
#define PLTTBUF_MAIN_EX_BG_3_F (1 << PLTTBUF_MAIN_EX_BG_3)
#define PLTTBUF_SUB_EX_BG_0_F  (1 << PLTTBUF_SUB_EX_BG_0)
#define PLTTBUF_SUB_EX_BG_1_F  (1 << PLTTBUF_SUB_EX_BG_1)
#define PLTTBUF_SUB_EX_BG_2_F  (1 << PLTTBUF_SUB_EX_BG_2)
#define PLTTBUF_SUB_EX_BG_3_F  (1 << PLTTBUF_SUB_EX_BG_3)
#define PLTTBUF_MAIN_EX_OBJ_F  (1 << PLTTBUF_MAIN_EX_OBJ)
#define PLTTBUF_SUB_EX_OBJ_F   (1 << PLTTBUF_SUB_EX_OBJ)
#define PLTTBUF_ALL_F          ((1 << PLTTBUF_MAX) - 1)

typedef enum PaletteSelector {
    PLTTSEL_TRANSPARENT,
    PLTTSEL_OPAQUE,
    PLTTSEL_BOTH,
} PaletteSelector;

typedef struct RgbColor {
    u16 r : 5;
    u16 g : 5;
    u16 b : 5;
    u16 dummy : 1;
} RgbColor;

#define BlendColor(source, target, frac) ((source) + (((target) - (source)) * (frac) >> 4))

typedef struct SelectedPaletteData {
    u16 opaqueBit;
    u16 wait : 6;
    u16 cur : 5;
    u16 end : 5;
    u16 nextRGB : 15;
    u16 sign : 1; // 0 - increase, 1 - decrease
    u16 step : 4;
    u16 waitStep : 6;
    u16 unk6_10 : 6;
} SelectedPaletteData;

typedef struct PaletteBuffer {
    u16 *opaque;
    u16 *transparent;
    u32 size;
    SelectedPaletteData selected;
} PaletteBuffer;

typedef struct PaletteData {
    PaletteBuffer buffers[PLTTBUF_MAX];
    u16 selectedFlag : 2;
    u16 selectedBuffer : PLTTBUF_MAX;
    u16 transparentBit : PLTTBUF_MAX;
    u16 callbackFlag : 1;
    u16 autoTransparent : 1;
    u8 forceExit;
    u8 unused[3];
} PaletteData;

PaletteData *PaletteData_Init(HeapID heapId);
void PaletteData_Free(PaletteData *data);
void PaletteData_SetBuffers(PaletteData *data, PaletteBufferId bufferID, u16 *opaque, u16 *transparent, u32 size);
void PaletteData_AllocBuffers(PaletteData *data, PaletteBufferId bufferID, u32 size, HeapID heapID);
void PaletteData_FreeBuffers(PaletteData *data, PaletteBufferId bufferID);
void PaletteData_LoadPalette(PaletteData *data, const u16 *src, PaletteBufferId bufferID, u16 offset, u16 size);
void PaletteData_LoadFromNarc(PaletteData *data, NarcId narcID, s32 memberNo, HeapID heapID, PaletteBufferId bufferID, u32 size, u16 pos, u16 readPos);
void PaletteData_LoadNarc(PaletteData *data, NarcId narcID, s32 memberNo, HeapID heapID, PaletteBufferId bufferID, u32 size, u16 pos);
void PaletteData_LoadFromOpenNarc(PaletteData *data, NARC *narc, s32 memberNo, HeapID heapID, PaletteBufferId bufferID, u32 size, u16 pos, u16 readPos);
void PaletteData_LoadOpenNarc(PaletteData *data, NARC *narc, s32 memberNo, HeapID heapID, PaletteBufferId bufferID, u32 size, u16 pos);
void PaletteData_LoadPaletteSlotFromHardware(PaletteData *data, PaletteBufferId bufferID, u16 pos, u32 size);
void PaletteData_CopyPalette(PaletteData *data, u32 srcBufferID, u16 srcPos, u32 destBufferID, u16 destPos, u16 size);
u16 *PaletteData_GetUnfadedBuf(PaletteData *data, PaletteBufferId bufferID);
u16 *PaletteData_GetFadedBuf(PaletteData *data, PaletteBufferId bufferID);
u8 PaletteData_BeginPaletteFade(PaletteData *data, u16 toSelect, u16 opaqueBit, s8 wait, u8 cur, u8 end, u16 nextRGB);
u8 PaletteData_ForceBeginPaletteFade(PaletteData *data, u16 toSelect, u16 opaqueBit, s8 wait, u8 cur, u8 end, u16 nextRGB);
void PaletteData_ScheduleFadeTaskEndIfNoSelectedBuffers(PaletteData *data);
void PaletteData_PushTransparentBuffers(PaletteData *data);
u16 PaletteData_GetSelectedBuffersBitmask(PaletteData *data);
void PaletteData_SetAutoTransparent(PaletteData *data, BOOL autoTransparent);
void PaletteData_SetSelectedBufferAll(PaletteData *plttData, BOOL a1);
void ZeroPalettesByBitmask(u16 selectedBuffer, HeapID heapId);
void PaletteData_FillPaletteInBuffer(PaletteData *plttData, PaletteBufferId bufferID, PaletteSelector which, u16 value, u16 begin, u16 end);
u16 PaletteData_GetBufferColorAtIndex(PaletteData *plttData, PaletteBufferId bufferID, PaletteSelector which, u16 palIdx);
void BlendPalette(const u16 *src, u16 *dest, u16 size, u8 cur, u16 target);
void PaletteData_BlendPalette(PaletteData *data, PaletteBufferId bufferID, u16 offset, u16 size, u8 cur, u16 target);
void PaletteData_BlendPalettes(PaletteData *data, PaletteBufferId bufferID, u16 selectedBuffer, u8 cur, u16 target);
void TintPalette_GrayScale(u16 *palette, int count);
void TintPalette_CustomTone(u16 *palette, int count, int rTone, int gTone, int bTone);
void PaletteData_LoadNarc_CustomTint(PaletteData *data, NarcId narcId, s32 memberNo, HeapID heapId, PaletteBufferId bufferID, u32 size, u16 pos, int rTone, int gTone, int bTone);
void PaletteData_FadePalettesTowardsColorStep(PaletteData *plttData, int transparentBit, int opaqueBit, int duration, int step, u16 target);

#endif // POKEHEARTGOLD_PALETTE_H
