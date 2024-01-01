#include "global.h"
#include "palette.h"
#include "gf_gfx_loader.h"
#include "unk_02026E84.h"
#include "sys_task_api.h"

u8 IsPaletteSelected(u16 toSelect, u16 bufferID);
void sub_02003574(PaletteData *data, u16 bufferID);
void sub_020035B4(int bufferID, PaletteBuffer *buffer, u16 *opaqueBit);
void sub_020035F0(SelectedPaletteData *selectedBit, u16 opaqueBit, s8 wait, u8 cur, u8 end, u16 nextRGB);
void sub_020036B0(SysTask *task, void *data);
void sub_020037FC(PaletteData *data, u16 bufferID, u16 flags);

PaletteData *PaletteData_Init(HeapID heapId) {
    PaletteData *ret = AllocFromHeap(heapId, sizeof(PaletteData));
    MI_CpuFill8(ret, 0, sizeof(PaletteData));
    return ret;
}

void PaletteData_Free(PaletteData *plttData) {
    FreeToHeap(plttData);
}

void PaletteData_SetBuffers(PaletteData *data, int bufferID, u16 *opaque, u16 *transparent, u32 size) {
    data->buffers[bufferID].opaque = opaque;
    data->buffers[bufferID].transparent = transparent;
    data->buffers[bufferID].size = size;
}

void PaletteData_AllocBuffers(PaletteData *data, int bufferID, u32 size, HeapID heapID) {
    PaletteData_SetBuffers(data, bufferID, AllocFromHeap(heapID, size), AllocFromHeap(heapID, size), size);
}

void PaletteData_FreeBuffers(PaletteData *data, int bufferID) {
    FreeToHeap(data->buffers[bufferID].opaque);
    FreeToHeap(data->buffers[bufferID].transparent);
}

void PaletteData_LoadPalette(PaletteData *data, const u16 *src, int bufferID, u16 pos, u16 size) {
    MI_CpuCopy16(src, data->buffers[bufferID].opaque + pos, size);
    MI_CpuCopy16(src, data->buffers[bufferID].transparent + pos, size);
}

void PaletteData_LoadFromNarc(PaletteData *data, NarcId narcID, s32 memberNo, HeapID heapID, int bufferID, u32 size, u16 pos, u16 readPos) {
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

void PaletteData_LoadNarc(PaletteData *data, NarcId narcID, s32 memberNo, HeapID heapID, int bufferID, u32 size, u16 pos) {
    PaletteData_LoadFromNarc(data, narcID, memberNo, heapID, bufferID, size, pos, 0);
}

void PaletteData_LoadFromOpenNarc(PaletteData *data, NARC *narc, s32 memberNo, HeapID heapID, int bufferID, u32 size, u16 pos, u16 readPos) {
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

void PaletteData_LoadOpenNarc(PaletteData *data, NARC *narc, s32 memberNo, HeapID heapID, int bufferID, u32 size, u16 pos) {
    PaletteData_LoadFromOpenNarc(data, narc, memberNo, heapID, bufferID, size, pos, 0);
}

void sub_020032A4(PaletteData *data, int bufferID, u16 pos, u32 size) {
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

u16 *PaletteData_GetUnfadedBuf(PaletteData *data, int bufferID) {
    return data->buffers[bufferID].opaque;
}

u16 *PaletteData_GetFadedBuf(PaletteData *data, int bufferID) {
    return data->buffers[bufferID].transparent;
}

u8 sub_02003370(PaletteData *data, u16 toSelect, u16 opaqueBit, s8 wait, u8 cur, u8 end, u16 nextRGB) {
    u16 opaqueBitBak = opaqueBit;
    u8 r6 = FALSE;
    u8 i;

    for (i = 0; i < 14; ++i) {
        if (IsPaletteSelected(toSelect, i) == TRUE
         && IsPaletteSelected(data->selectedBuffer, i) == FALSE) {
            sub_020035B4(i, &data->buffers[i], &opaqueBit);
            sub_020035F0(&data->buffers[i].selected, opaqueBit, wait, cur, end, nextRGB);
            sub_02003574(data, i);
            if (i >= 4) {
                sub_020037FC(data, i, 0x100);
            } else {
                sub_020037FC(data, i, 0x10);
            }
            opaqueBit = opaqueBitBak;
            r6 = TRUE;
        }
    }

    if (r6 == TRUE) {
        data->selectedBuffer |= toSelect;
        if (!data->callbackFlag) {
            data->callbackFlag = TRUE;
            data->selectedFlag = 1;
            data->forceExit = FALSE;
            CreateSysTask(sub_020036B0, data, -2);
        }
    }

    return r6;
}

u8 sub_02003474(PaletteData *data, u16 toSelect, u16 opaqueBit, s8 wait, u8 cur, u8 end, u16 nextRGB) {
    u16 opaqueBitBak = opaqueBit;
    u8 r6 = FALSE;
    u8 i;

    for (i = 0; i < 14; ++i) {
        if (IsPaletteSelected(toSelect, i) == TRUE) {
            sub_020035B4(i, &data->buffers[i], &opaqueBit);
            sub_020035F0(&data->buffers[i].selected, opaqueBit, wait, cur, end, nextRGB);
            sub_02003574(data, i);
            if (i >= 4) {
                sub_020037FC(data, i, 0x100);
            } else {
                sub_020037FC(data, i, 0x10);
            }
            opaqueBit = opaqueBitBak;
            r6 = TRUE;
        }
    }

    if (r6 == TRUE) {
        data->selectedBuffer = toSelect;
        if (!data->callbackFlag) {
            data->callbackFlag = TRUE;
            data->selectedFlag = 1;
            data->forceExit = FALSE;
            CreateSysTask(sub_020036B0, data, -2);
        }
    }

    return r6;
}

u8 IsPaletteSelected(u16 selectedFlag, u16 bufferID) {
    return (selectedFlag & (1 << bufferID)) != 0;
}

void sub_02003574(PaletteData *data, u16 bufferID) {
    if (IsPaletteSelected(data->transparentBit, bufferID) != TRUE) {
        data->transparentBit |= 1 << bufferID;
    }
}

void sub_020035B4(int bufferID, PaletteBuffer *buffer, u16 *opaqueBit) {
    u8 limit;
    if (bufferID < 4) {
        limit = buffer->size >> 5;
    } else {
        limit = buffer->size >> 9;
    }
    u16 bits = 0;
    for (u8 i = 0; i < limit; ++i) {
        bits += (1 << i);
    }
    *opaqueBit &= bits;
}
