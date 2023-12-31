#include "global.h"
#include "palette.h"
#include "gf_gfx_loader.h"
#include "unk_02026E84.h"

PaletteData *PaletteData_Init(HeapID heapId) {
    PaletteData *ret = AllocFromHeap(heapId, sizeof(PaletteData));
    MI_CpuFill8(ret, 0, sizeof(PaletteData));
    return ret;
}

void PaletteData_Free(PaletteData *plttData) {
    FreeToHeap(plttData);
}

void PaletteData_SetBuffers(PaletteData *data, u32 bufferID, u16 *opaque, u16 *transparent, u32 size) {
    data->buffers[bufferID].opaque = opaque;
    data->buffers[bufferID].transparent = transparent;
    data->buffers[bufferID].size = size;
}

void PaletteData_AllocBuffers(PaletteData *data, u32 bufferID, u32 size, HeapID heapID) {
    PaletteData_SetBuffers(data, bufferID, AllocFromHeap(heapID, size), AllocFromHeap(heapID, size), size);
}

void PaletteData_FreeBuffers(PaletteData *data, u32 bufferID) {
    FreeToHeap(data->buffers[bufferID].opaque);
    FreeToHeap(data->buffers[bufferID].transparent);
}

void PaletteData_LoadPalette(PaletteData *data, const u16 *src, u32 bufferID, u16 pos, u16 size) {
    MI_CpuCopy16(src, data->buffers[bufferID].opaque + pos, size);
    MI_CpuCopy16(src, data->buffers[bufferID].transparent + pos, size);
}

void PaletteData_LoadFromNarc(PaletteData *data, NarcId narcID, s32 memberNo, HeapID heapID, u32 bufferID, u32 size, u16 pos, u16 readPos) {
    void *rawPtr;
    NNSG2dPaletteData *plttData;

    rawPtr = GfGfxLoader_GetPlttData(narcID, memberNo, &plttData, heapID);
    GF_ASSERT(rawPtr != NULL);
    if (size == 0) {
        size = plttData->szByte;
    }
    GF_ASSERT(pos * sizeof(pos) + size <= data->buffers[bufferID].size);
    PaletteData_LoadPalette(data, (const u16 *)plttData->pRawData + readPos, bufferID, pos, size);
    FreeToHeap(rawPtr);
}

void PaletteData_LoadNarc(PaletteData *data, NarcId narcID, s32 memberNo, HeapID heapID, u32 bufferID, u32 size, u16 pos) {
    PaletteData_LoadFromNarc(data, narcID, memberNo, heapID, bufferID, size, pos, 0);
}

void PaletteData_LoadFromOpenNarc(PaletteData *data, NARC *narc, s32 memberNo, HeapID heapID, u32 bufferID, u32 size, u16 pos, u16 readPos) {
    void *rawPtr;
    NNSG2dPaletteData *plttData;

    rawPtr = GfGfxLoader_GetPlttDataFromOpenNarc(narc, memberNo, &plttData, heapID);
    GF_ASSERT(rawPtr != NULL);
    if (size == 0) {
        size = plttData->szByte;
    }
    GF_ASSERT(pos * sizeof(pos) + size <= data->buffers[bufferID].size);
    PaletteData_LoadPalette(data, (const u16 *)plttData->pRawData + readPos, bufferID, pos, size);
    FreeToHeap(rawPtr);
}

void PaletteData_LoadOpenNarc(PaletteData *data, NARC *narc, s32 memberNo, HeapID heapID, u32 bufferID, u32 size, u16 pos) {
    PaletteData_LoadFromOpenNarc(data, narc, memberNo, heapID, bufferID, size, pos, 0);
}

void sub_020032A4(PaletteData *data, u32 bufferID, u16 pos, u32 size) {
    GF_ASSERT(pos * sizeof(pos) + size <= data->buffers[bufferID].size);

    const u16 *src;
    switch (bufferID) {
    case 0:
        src = sub_02026E84();
        break;
    case 1:
        src = sub_02026E94();
        break;
    case 2:
        src = sub_02026EA4();
        break;
    case 3:
        src = sub_02026EAC();
        break;
    default:
        GF_ASSERT(0);
        return;
    }

    PaletteData_LoadPalette(data, src + pos, bufferID, pos, size);
}

void PaletteData_CopyPalette(PaletteData *data, u32 srcBufferID, u16 srcPos, u32 destBufferID, u16 destPos, u16 size) {
    MI_CpuCopy16(data->buffers[srcBufferID].opaque + srcPos, data->buffers[destBufferID].opaque + destPos, size);
    MI_CpuCopy16(data->buffers[srcBufferID].opaque + srcPos, data->buffers[destBufferID].transparent + destPos, size);
}

u16 *PaletteData_GetUnfadedBuf(PaletteData *data, u32 bufferID) {
    return data->buffers[bufferID].opaque;
}

u16 *PaletteData_GetFadedBuf(PaletteData *data, u32 bufferID) {
    return data->buffers[bufferID].transparent;
}

