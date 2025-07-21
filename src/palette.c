#include "palette.h"

#include "global.h"

#include "gf_gfx_loader.h"
#include "sys_task_api.h"
#include "unk_02026E84.h"

static u8 IsPaletteSelected(u16 toSelect, u16 bufferID);
static void PaletteData_SetTransparentBit(PaletteData *data, u16 bufferID);
static void MaskOpaqueBit(PaletteBufferId bufferID, PaletteBuffer *buffer, u16 *opaqueBit);
static void SelectedPaletteData_SetTimedFadeParams(SelectedPaletteData *selectedBit, u16 opaqueBit, s8 wait, u8 cur, u8 end, u16 nextRGB);
static void SysTask_TimedPaletteFade(SysTask *task, void *taskData);
static void PaletteData_TryApplyScheduledBlendStepToStdBuffersHandleDelay(PaletteData *data);
static void PaletteData_TryApplyScheduledBlendStepToExBuffersHandleDelay(PaletteData *data);
static void PaletteData_TryApplyScheduledBlendStepToSingleBufferHandleDelay(PaletteData *data, u16 bufferID, u16 size);
static void PaletteData_ApplyScheduledBlendStepToSingleBuffer(PaletteData *data, u16 bufferID, u16 size);
static void ApplyScheduledBlendStepToSinglePalette(u16 *opaque, u16 *transparent, SelectedPaletteData *selectedBit, u16 size);
static void PaletteData_AdvanceSelectedBitCur(PaletteData *data, u8 bufferID, SelectedPaletteData *selectedBit);
static void FadePaletteTowardsColorStep(const u16 *src, u16 *dest, int denom, int numer, int rTarget, int gTarget, int bTarget);

PaletteData *PaletteData_Init(HeapID heapId) {
    PaletteData *ret = AllocFromHeap(heapId, sizeof(PaletteData));
    MI_CpuFill8(ret, 0, sizeof(PaletteData));
    return ret;
}

void PaletteData_Free(PaletteData *plttData) {
    Heap_Free(plttData);
}

void PaletteData_SetBuffers(PaletteData *data, PaletteBufferId bufferID, u16 *opaque, u16 *transparent, u32 size) {
    data->buffers[bufferID].opaque = opaque;
    data->buffers[bufferID].transparent = transparent;
    data->buffers[bufferID].size = size;
}

void PaletteData_AllocBuffers(PaletteData *data, PaletteBufferId bufferID, u32 size, HeapID heapID) {
    PaletteData_SetBuffers(data, bufferID, AllocFromHeap(heapID, size), AllocFromHeap(heapID, size), size);
}

void PaletteData_FreeBuffers(PaletteData *data, PaletteBufferId bufferID) {
    Heap_Free(data->buffers[bufferID].opaque);
    Heap_Free(data->buffers[bufferID].transparent);
}

void PaletteData_LoadPalette(PaletteData *data, const u16 *src, PaletteBufferId bufferID, u16 pos, u16 size) {
    MI_CpuCopy16(src, data->buffers[bufferID].opaque + pos, size);
    MI_CpuCopy16(src, data->buffers[bufferID].transparent + pos, size);
}

void PaletteData_LoadFromNarc(PaletteData *data, NarcId narcID, s32 memberNo, HeapID heapID, PaletteBufferId bufferID, u32 size, u16 pos, u16 readPos) {
    void *rawPtr;
    NNSG2dPaletteData *plttData;

    rawPtr = GfGfxLoader_GetPlttData(narcID, memberNo, &plttData, heapID);
    GF_ASSERT(rawPtr != NULL);
    if (size == 0) {
        size = plttData->szByte;
    }
    GF_ASSERT(pos * sizeof(pos) + size <= data->buffers[bufferID].size);
    PaletteData_LoadPalette(data, (const u16 *)plttData->pRawData + readPos, bufferID, pos, size);
    Heap_Free(rawPtr);
}

void PaletteData_LoadNarc(PaletteData *data, NarcId narcID, s32 memberNo, HeapID heapID, PaletteBufferId bufferID, u32 size, u16 pos) {
    PaletteData_LoadFromNarc(data, narcID, memberNo, heapID, bufferID, size, pos, 0);
}

void PaletteData_LoadFromOpenNarc(PaletteData *data, NARC *narc, s32 memberNo, HeapID heapID, PaletteBufferId bufferID, u32 size, u16 pos, u16 readPos) {
    void *rawPtr;
    NNSG2dPaletteData *plttData;

    rawPtr = GfGfxLoader_GetPlttDataFromOpenNarc(narc, memberNo, &plttData, heapID);
    GF_ASSERT(rawPtr != NULL);
    if (size == 0) {
        size = plttData->szByte;
    }
    GF_ASSERT(pos * sizeof(pos) + size <= data->buffers[bufferID].size);
    PaletteData_LoadPalette(data, (const u16 *)plttData->pRawData + readPos, bufferID, pos, size);
    Heap_Free(rawPtr);
}

void PaletteData_LoadOpenNarc(PaletteData *data, NARC *narc, s32 memberNo, HeapID heapID, PaletteBufferId bufferID, u32 size, u16 pos) {
    PaletteData_LoadFromOpenNarc(data, narc, memberNo, heapID, bufferID, size, pos, 0);
}

void PaletteData_LoadPaletteSlotFromHardware(PaletteData *data, PaletteBufferId bufferID, u16 pos, u32 size) {
    GF_ASSERT(pos * sizeof(pos) + size <= data->buffers[bufferID].size);

    const u16 *src;
    switch (bufferID) {
    case PLTTBUF_MAIN_BG:
        src = GetMainBgPlttAddr();
        break;
    case PLTTBUF_SUB_BG:
        src = GetSubBgPlttAddr();
        break;
    case PLTTBUF_MAIN_OBJ:
        src = GetMainObjPlttAddr();
        break;
    case PLTTBUF_SUB_OBJ:
        src = GetSubObjPlttAddr();
        break;
    default:
        GF_ASSERT(FALSE);
        return;
    }

    PaletteData_LoadPalette(data, src + pos, bufferID, pos, size);
}

void PaletteData_CopyPalette(PaletteData *data, u32 srcBufferID, u16 srcPos, u32 destBufferID, u16 destPos, u16 size) {
    MI_CpuCopy16(data->buffers[srcBufferID].opaque + srcPos, data->buffers[destBufferID].opaque + destPos, size);
    MI_CpuCopy16(data->buffers[srcBufferID].opaque + srcPos, data->buffers[destBufferID].transparent + destPos, size);
}

u16 *PaletteData_GetUnfadedBuf(PaletteData *data, PaletteBufferId bufferID) {
    return data->buffers[bufferID].opaque;
}

u16 *PaletteData_GetFadedBuf(PaletteData *data, PaletteBufferId bufferID) {
    return data->buffers[bufferID].transparent;
}

u8 PaletteData_BeginPaletteFade(PaletteData *data, u16 toSelect, u16 opaqueBit, s8 wait, u8 cur, u8 end, u16 nextRGB) {
    u16 opaqueBitBak = opaqueBit;
    u8 startTask = FALSE;
    u8 i;

    for (i = 0; i < PLTTBUF_MAX; ++i) {
        if (IsPaletteSelected(toSelect, i) == TRUE && IsPaletteSelected(data->selectedBuffer, i) == FALSE) {
            MaskOpaqueBit((PaletteBufferId)i, &data->buffers[i], &opaqueBit);
            SelectedPaletteData_SetTimedFadeParams(&data->buffers[i].selected, opaqueBit, wait, cur, end, nextRGB);
            PaletteData_SetTransparentBit(data, i);
            if (i >= PLTTBUF_EX_BEGIN) {
                PaletteData_ApplyScheduledBlendStepToSingleBuffer(data, i, 0x100);
            } else {
                PaletteData_ApplyScheduledBlendStepToSingleBuffer(data, i, 0x10);
            }
            opaqueBit = opaqueBitBak;
            startTask = TRUE;
        }
    }

    if (startTask == TRUE) {
        data->selectedBuffer |= toSelect;
        if (!data->callbackFlag) {
            data->callbackFlag = TRUE;
            data->selectedFlag = 1;
            data->forceExit = FALSE;
            SysTask_CreateOnMainQueue(SysTask_TimedPaletteFade, data, -2);
        }
    }

    return startTask;
}

u8 PaletteData_ForceBeginPaletteFade(PaletteData *data, u16 toSelect, u16 opaqueBit, s8 wait, u8 cur, u8 end, u16 nextRGB) {
    u16 opaqueBitBak = opaqueBit;
    u8 startTask = FALSE;
    u8 i;

    for (i = 0; i < PLTTBUF_MAX; ++i) {
        if (IsPaletteSelected(toSelect, i) == TRUE) {
            MaskOpaqueBit((PaletteBufferId)i, &data->buffers[i], &opaqueBit);
            SelectedPaletteData_SetTimedFadeParams(&data->buffers[i].selected, opaqueBit, wait, cur, end, nextRGB);
            PaletteData_SetTransparentBit(data, i);
            if (i >= PLTTBUF_EX_BEGIN) {
                PaletteData_ApplyScheduledBlendStepToSingleBuffer(data, i, 0x100);
            } else {
                PaletteData_ApplyScheduledBlendStepToSingleBuffer(data, i, 0x10);
            }
            opaqueBit = opaqueBitBak;
            startTask = TRUE;
        }
    }

    if (startTask == TRUE) {
        data->selectedBuffer = toSelect;
        if (!data->callbackFlag) {
            data->callbackFlag = TRUE;
            data->selectedFlag = 1;
            data->forceExit = FALSE;
            SysTask_CreateOnMainQueue(SysTask_TimedPaletteFade, data, -2);
        }
    }

    return startTask;
}

static u8 IsPaletteSelected(u16 selectedFlag, u16 bufferID) {
    return (selectedFlag & (1 << bufferID)) != 0;
}

static void PaletteData_SetTransparentBit(PaletteData *data, u16 bufferID) {
    if (IsPaletteSelected(data->transparentBit, bufferID) != TRUE) {
        data->transparentBit |= 1 << bufferID;
    }
}

static void MaskOpaqueBit(PaletteBufferId bufferID, PaletteBuffer *buffer, u16 *opaqueBit) {
    u8 limit;
    if (bufferID < PLTTBUF_EX_BEGIN) {
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

static void SelectedPaletteData_SetTimedFadeParams(SelectedPaletteData *selectedBit, u16 opaqueBit, s8 wait, u8 cur, u8 end, u16 nextRGB) {
    if (wait < 0) {
        selectedBit->step = abs(wait) + 2;
        selectedBit->wait = 0;
    } else {
        selectedBit->step = 2;
        selectedBit->wait = wait;
    }
    selectedBit->opaqueBit = opaqueBit;
    selectedBit->cur = cur;
    selectedBit->end = end;
    selectedBit->nextRGB = nextRGB;
    selectedBit->waitStep = selectedBit->wait;
    if (cur < end) {
        selectedBit->sign = 0;
    } else {
        selectedBit->sign = 1;
    }
}

static void SysTask_TimedPaletteFade(SysTask *task, void *taskData) {
    PaletteData *data = (PaletteData *)taskData;

    if (data->forceExit == 1) {
        data->forceExit = 0;
        data->transparentBit = 0;
        data->selectedBuffer = 0;
        data->callbackFlag = 0;
        SysTask_Destroy(task);
        return;
    }

    if (data->selectedFlag == 1) {
        data->transparentBit = data->selectedBuffer;
        PaletteData_TryApplyScheduledBlendStepToStdBuffersHandleDelay(data);
        PaletteData_TryApplyScheduledBlendStepToExBuffersHandleDelay(data);
        if (data->selectedBuffer == 0) {
            data->callbackFlag = 0;
            SysTask_Destroy(task);
            return;
        }
    }
}

void PaletteData_ScheduleFadeTaskEndIfNoSelectedBuffers(PaletteData *data) {
    if (data->selectedBuffer != 0) {
        data->forceExit = 1;
    }
}

static void PaletteData_TryApplyScheduledBlendStepToStdBuffersHandleDelay(PaletteData *data) {
    for (u8 i = 0; i < PLTTBUF_EX_BEGIN; ++i) {
        PaletteData_TryApplyScheduledBlendStepToSingleBufferHandleDelay(data, i, 0x10);
    }
}

static void PaletteData_TryApplyScheduledBlendStepToExBuffersHandleDelay(PaletteData *data) {
    for (u8 i = PLTTBUF_EX_BEGIN; i < PLTTBUF_MAX; ++i) {
        PaletteData_TryApplyScheduledBlendStepToSingleBufferHandleDelay(data, i, 0x100);
    }
}

static void PaletteData_TryApplyScheduledBlendStepToSingleBufferHandleDelay(PaletteData *data, u16 bufferID, u16 size) {
    if (IsPaletteSelected(data->selectedBuffer, bufferID)) {
        if (data->buffers[bufferID].selected.waitStep < data->buffers[bufferID].selected.wait) {
            ++data->buffers[bufferID].selected.waitStep;
        } else {
            data->buffers[bufferID].selected.waitStep = 0;
            PaletteData_ApplyScheduledBlendStepToSingleBuffer(data, bufferID, size);
        }
    }
}

static void PaletteData_ApplyScheduledBlendStepToSingleBuffer(PaletteData *data, u16 bufferID, u16 size) {
    for (u32 i = 0; i < 16; ++i) {
        if (IsPaletteSelected(data->buffers[bufferID].selected.opaqueBit, i)) {
            ApplyScheduledBlendStepToSinglePalette(&data->buffers[bufferID].opaque[i * size], &data->buffers[bufferID].transparent[i * size], &data->buffers[bufferID].selected, size);
        }
    }
    PaletteData_AdvanceSelectedBitCur(data, bufferID, &data->buffers[bufferID].selected);
}

static void ApplyScheduledBlendStepToSinglePalette(u16 *opaque, u16 *transparent, SelectedPaletteData *selectedBit, u16 size) {
    u32 i;
    u8 r, g, b;
    for (i = 0; i < size; ++i) {
        r = BlendColor(opaque[i] & 0x1F, selectedBit->nextRGB & 0x1F, selectedBit->cur);
        g = BlendColor((opaque[i] >> 5) & 0x1F, (selectedBit->nextRGB >> 5) & 0x1F, selectedBit->cur);
        b = BlendColor((opaque[i] >> 10) & 0x1F, (selectedBit->nextRGB >> 10) & 0x1F, selectedBit->cur);
        transparent[i] = (b << 10) | (g << 5) | r;
    }
}

static void PaletteData_AdvanceSelectedBitCur(PaletteData *data, u8 bufferID, SelectedPaletteData *selectedBit) {
    s16 next;

    if (selectedBit->cur == selectedBit->end) {
        if (data->selectedBuffer & (1 << bufferID)) {
            data->selectedBuffer ^= (1 << bufferID);
        }
    } else if (!selectedBit->sign) {
        next = selectedBit->cur;
        next += selectedBit->step;
        if (next > selectedBit->end) {
            next = selectedBit->end;
        }
        selectedBit->cur = next;
    } else {
        next = selectedBit->cur;
        next -= selectedBit->step;
        if (next < selectedBit->end) {
            next = selectedBit->end;
        }
        selectedBit->cur = next;
    }
}

void PaletteData_PushTransparentBuffers(PaletteData *plttData) {
    int i;
    if (plttData->autoTransparent || plttData->selectedFlag == 1) {
        for (i = 0; i < PLTTBUF_MAX; ++i) {
            if (!plttData->autoTransparent) {
                if (plttData->buffers[i].transparent == NULL) {
                    continue;
                }
                if (!IsPaletteSelected(plttData->transparentBit, i)) {
                    continue;
                }
            }
            DC_FlushRange(plttData->buffers[i].transparent, plttData->buffers[i].size);
            switch (i) {
            case PLTTBUF_MAIN_BG:
                GX_LoadBGPltt(plttData->buffers[i].transparent, 0, plttData->buffers[i].size);
                break;
            case PLTTBUF_SUB_BG:
                GXS_LoadBGPltt(plttData->buffers[i].transparent, 0, plttData->buffers[i].size);
                break;
            case PLTTBUF_MAIN_OBJ:
                GX_LoadOBJPltt(plttData->buffers[i].transparent, 0, plttData->buffers[i].size);
                break;
            case PLTTBUF_SUB_OBJ:
                GXS_LoadOBJPltt(plttData->buffers[i].transparent, 0, plttData->buffers[i].size);
                break;
            case PLTTBUF_MAIN_EX_BG_0:
                GX_BeginLoadBGExtPltt();
                GX_LoadBGExtPltt(plttData->buffers[i].transparent, 0, plttData->buffers[i].size);
                GX_EndLoadBGExtPltt();
                break;
            case PLTTBUF_MAIN_EX_BG_1:
                GX_BeginLoadBGExtPltt();
                GX_LoadBGExtPltt(plttData->buffers[i].transparent, 0x2000, plttData->buffers[i].size);
                GX_EndLoadBGExtPltt();
                break;
            case PLTTBUF_MAIN_EX_BG_2:
                GX_BeginLoadBGExtPltt();
                GX_LoadBGExtPltt(plttData->buffers[i].transparent, 0x4000, plttData->buffers[i].size);
                GX_EndLoadBGExtPltt();
                break;
            case PLTTBUF_MAIN_EX_BG_3:
                GX_BeginLoadBGExtPltt();
                GX_LoadBGExtPltt(plttData->buffers[i].transparent, 0x6000, plttData->buffers[i].size);
                GX_EndLoadBGExtPltt();
                break;
            case PLTTBUF_SUB_EX_BG_0:
                GXS_BeginLoadBGExtPltt();
                GXS_LoadBGExtPltt(plttData->buffers[i].transparent, 0, plttData->buffers[i].size);
                GXS_EndLoadBGExtPltt();
                break;
            case PLTTBUF_SUB_EX_BG_1:
                GXS_BeginLoadBGExtPltt();
                GXS_LoadBGExtPltt(plttData->buffers[i].transparent, 0x2000, plttData->buffers[i].size);
                GXS_EndLoadBGExtPltt();
                break;
            case PLTTBUF_SUB_EX_BG_2:
                GXS_BeginLoadBGExtPltt();
                GXS_LoadBGExtPltt(plttData->buffers[i].transparent, 0x4000, plttData->buffers[i].size);
                GXS_EndLoadBGExtPltt();
                break;
            case PLTTBUF_SUB_EX_BG_3:
                GXS_BeginLoadBGExtPltt();
                GXS_LoadBGExtPltt(plttData->buffers[i].transparent, 0x6000, plttData->buffers[i].size);
                GXS_EndLoadBGExtPltt();
                break;
            case PLTTBUF_MAIN_EX_OBJ:
                GX_BeginLoadOBJExtPltt();
                GX_LoadOBJExtPltt(plttData->buffers[i].transparent, 0, plttData->buffers[i].size);
                GX_EndLoadOBJExtPltt();
                break;
            case PLTTBUF_SUB_EX_OBJ:
                GXS_BeginLoadOBJExtPltt();
                GXS_LoadOBJExtPltt(plttData->buffers[i].transparent, 0, plttData->buffers[i].size);
                GXS_EndLoadOBJExtPltt();
                break;
            }
        }
        plttData->transparentBit = plttData->selectedBuffer;
        if (plttData->transparentBit == 0) {
            plttData->selectedFlag = 0;
        }
    }
}

u16 PaletteData_GetSelectedBuffersBitmask(PaletteData *plttData) {
    return plttData->selectedBuffer;
}

void PaletteData_SetAutoTransparent(PaletteData *plttData, BOOL autoTransparent) {
    plttData->autoTransparent = autoTransparent;
}

void PaletteData_SetSelectedBufferAll(PaletteData *plttData, BOOL a1) {
    plttData->selectedFlag = a1 & 1;
    plttData->selectedBuffer = PLTTBUF_ALL_F;
}

void ZeroPalettesByBitmask(u16 selectedBuffer, HeapID heapId) {
    void *tmp;

    tmp = AllocFromHeap(heapId, 0x200);
    memset(tmp, 0, 0x200);
    DC_FlushRange(tmp, 0x200);

    if (selectedBuffer & PLTTBUF_MAIN_BG_F) {
        GX_LoadBGPltt(tmp, 0, 0x200);
    }
    if (selectedBuffer & PLTTBUF_SUB_BG_F) {
        GXS_LoadBGPltt(tmp, 0, 0x200);
    }
    if (selectedBuffer & PLTTBUF_MAIN_OBJ_F) {
        GX_LoadOBJPltt(tmp, 0, 0x200);
    }
    if (selectedBuffer & PLTTBUF_SUB_OBJ_F) {
        GXS_LoadOBJPltt(tmp, 0, 0x200);
    }

    Heap_FreeExplicit(heapId, tmp);

    tmp = AllocFromHeap(heapId, 0x2000);
    memset(tmp, 0, 0x2000);
    DC_FlushRange(tmp, 0x2000);

    if (selectedBuffer & PLTTBUF_MAIN_EX_BG_0_F) {
        GX_BeginLoadBGExtPltt();
        GX_LoadBGExtPltt(tmp, 0, 0x2000);
        GX_EndLoadBGExtPltt();
    }
    if (selectedBuffer & PLTTBUF_MAIN_EX_BG_1_F) {
        GX_BeginLoadBGExtPltt();
        GX_LoadBGExtPltt(tmp, 0x2000, 0x2000);
        GX_EndLoadBGExtPltt();
    }
    if (selectedBuffer & PLTTBUF_MAIN_EX_BG_2_F) {
        GX_BeginLoadBGExtPltt();
        GX_LoadBGExtPltt(tmp, 0x4000, 0x2000);
        GX_EndLoadBGExtPltt();
    }
    if (selectedBuffer & PLTTBUF_MAIN_EX_BG_3_F) {
        GX_BeginLoadBGExtPltt();
        GX_LoadBGExtPltt(tmp, 0x6000, 0x2000);
        GX_EndLoadBGExtPltt();
    }
    if (selectedBuffer & PLTTBUF_SUB_EX_BG_0_F) {
        GXS_BeginLoadBGExtPltt();
        GXS_LoadBGExtPltt(tmp, 0, 0x2000);
        GXS_EndLoadBGExtPltt();
    }
    if (selectedBuffer & PLTTBUF_SUB_EX_BG_1_F) {
        GXS_BeginLoadBGExtPltt();
        GXS_LoadBGExtPltt(tmp, 0x2000, 0x2000);
        GXS_EndLoadBGExtPltt();
    }
    if (selectedBuffer & PLTTBUF_SUB_EX_BG_2_F) {
        GXS_BeginLoadBGExtPltt();
        GXS_LoadBGExtPltt(tmp, 0x4000, 0x2000);
        GXS_EndLoadBGExtPltt();
    }
    if (selectedBuffer & PLTTBUF_SUB_EX_BG_3_F) {
        GXS_BeginLoadBGExtPltt();
        GXS_LoadBGExtPltt(tmp, 0x6000, 0x2000);
        GXS_EndLoadBGExtPltt();
    }
    if (selectedBuffer & PLTTBUF_MAIN_EX_OBJ_F) {
        GX_BeginLoadOBJExtPltt();
        GX_LoadOBJExtPltt(tmp, 0, 0x2000);
        GX_EndLoadOBJExtPltt();
    }
    if (selectedBuffer & PLTTBUF_SUB_EX_OBJ_F) {
        GXS_BeginLoadOBJExtPltt();
        GXS_LoadOBJExtPltt(tmp, 0, 0x2000);
        GXS_EndLoadOBJExtPltt();
    }

    Heap_FreeExplicit(heapId, tmp);
}

void PaletteData_FillPaletteInBuffer(PaletteData *plttData, PaletteBufferId bufferID, PaletteSelector which, u16 value, u16 begin, u16 end) {
    GF_ASSERT(end * sizeof(u16) <= plttData->buffers[bufferID].size);
    if (which == PLTTSEL_OPAQUE || which == PLTTSEL_BOTH) {
        MI_CpuFill16(&plttData->buffers[bufferID].opaque[begin], value, (end - begin) * sizeof(u16));
    }
    if (which == PLTTSEL_TRANSPARENT || which == PLTTSEL_BOTH) {
        MI_CpuFill16(&plttData->buffers[bufferID].transparent[begin], value, (end - begin) * sizeof(u16));
    }
}

u16 PaletteData_GetBufferColorAtIndex(PaletteData *plttData, PaletteBufferId bufferID, PaletteSelector which, u16 palIdx) {
    if (which == PLTTSEL_OPAQUE) {
        return plttData->buffers[bufferID].opaque[palIdx];
    } else if (which == PLTTSEL_TRANSPARENT) {
        return plttData->buffers[bufferID].transparent[palIdx];
    } else {
        GF_ASSERT(FALSE);
        return 0;
    }
}

void BlendPalette(const u16 *src, u16 *dest, u16 size, u8 cur, u16 target) {
    u16 i;
    int r1, g1, b1;
    int r2, g2, b2;

    r2 = ((RgbColor *)&target)->r;
    g2 = ((RgbColor *)&target)->g;
    b2 = ((RgbColor *)&target)->b;

    for (i = 0; i < size; ++i) {
        r1 = ((RgbColor *)&src[i])->r;
        g1 = ((RgbColor *)&src[i])->g;
        b1 = ((RgbColor *)&src[i])->b;
        dest[i] = BlendColor(r1, r2, cur) | (BlendColor(g1, g2, cur) << 5) | (BlendColor(b1, b2, cur) << 10);
    }
}

void PaletteData_BlendPalette(PaletteData *data, PaletteBufferId bufferID, u16 offset, u16 size, u8 cur, u16 target) {
    GF_ASSERT(data->buffers[bufferID].opaque != NULL && data->buffers[bufferID].transparent != NULL);
    BlendPalette(&data->buffers[bufferID].opaque[offset], &data->buffers[bufferID].transparent[offset], size, cur, target);
}

void PaletteData_BlendPalettes(PaletteData *data, PaletteBufferId bufferID, u16 selectedBuffer, u8 cur, u16 target) {
    int i = 0;

    GF_ASSERT(data->buffers[bufferID].opaque != NULL && data->buffers[bufferID].transparent != NULL);
    while (selectedBuffer) {
        if (selectedBuffer & 1) {
            PaletteData_BlendPalette(data, bufferID, i, 0x10, cur, target);
        }
        selectedBuffer >>= 1;
        i += 0x10;
    }
}

void TintPalette_GrayScale(u16 *palette, int count) {
    int i, r, g, b;
    u32 gray;
    for (i = 0; i < count; ++i) {
        r = *palette & 0x1F;
        g = (*palette >> 5) & 0x1F;
        b = (*palette >> 10) & 0x1F;
        // 0.3 * red + 0.59 * g + 0.1133 * b
        gray = (76 * r + 151 * g + 29 * b) >> 8;
        *palette++ = (gray << 10) | (gray << 5) | gray;
    }
}

void TintPalette_CustomTone(u16 *palette, int count, int rTone, int gTone, int bTone) {
    int i, r, g, b;
    u32 gray;
    for (i = 0; i < count; ++i) {
        r = *palette & 0x1F;
        g = (*palette >> 5) & 0x1F;
        b = (*palette >> 10) & 0x1F;
        // 0.3 * red + 0.59 * g + 0.1133 * b
        gray = (76 * r + 151 * g + 29 * b) >> 8;
        r = (u16)(rTone * gray) >> 8;
        g = (u16)(gTone * gray) >> 8;
        b = (u16)(bTone * gray) >> 8;

        if (r > 31) {
            r = 31;
        }
        if (g > 31) {
            g = 31;
        }
        if (b > 31) {
            b = 31;
        }

        *palette++ = (b << 10) | (g << 5) | r;
    }
}

void PaletteData_LoadNarc_CustomTint(PaletteData *data, NarcId narcId, s32 memberNo, HeapID heapId, PaletteBufferId bufferID, u32 size, u16 pos, int rTone, int gTone, int bTone) {
    NNSG2dPaletteData *pPlttData;
    void *rawBuf = GfGfxLoader_GetPlttData(narcId, memberNo, &pPlttData, heapId);
    GF_ASSERT(rawBuf != NULL);
    if (size == 0) {
        size = pPlttData->szByte;
    }
    TintPalette_CustomTone(pPlttData->pRawData, 0x10, rTone, gTone, bTone);
    PaletteData_LoadPalette(data, pPlttData->pRawData, bufferID, pos, size);
    Heap_Free(rawBuf);
}

static void FadePaletteTowardsColorStep(const u16 *src, u16 *dest, int duration, int step, int rTarget, int gTarget, int bTarget) {
    int i, r, g, b;

    for (i = 0; i < 16; ++i) {
        r = *src & 0x1F;
        g = (*src >> 5) & 0x1F;
        b = (*src >> 10) & 0x1F;

        r += (rTarget - r) * step / duration;
        g += (gTarget - g) * step / duration;
        b += (bTarget - b) * step / duration;

        *dest = (b << 10) | (g << 5) | r;

        ++src;
        ++dest;
    }
}

void PaletteData_FadePalettesTowardsColorStep(PaletteData *plttData, int transparentBit, int opaqueBit, int duration, int step, u16 target) {
    int i, j, r, g, b;

    plttData->selectedFlag = 1;
    plttData->transparentBit = transparentBit;

    r = target & 0x1F;
    g = (target >> 5) & 0x1F;
    b = (target >> 10) & 0x1F;

    for (i = 0; i < PLTTBUF_MAX; ++i) {
        if (plttData->buffers[i].transparent != NULL && (transparentBit >> i) & 1) {
            plttData->buffers[i].selected.opaqueBit = opaqueBit;
            plttData->buffers[i].size = 0x200;
            for (j = 0; j < 16; ++j) {
                if ((opaqueBit >> j) & 1) {
                    FadePaletteTowardsColorStep(&plttData->buffers[i].opaque[j * 16], &plttData->buffers[i].transparent[j * 16], duration, step, r, g, b);
                } else {
                    MI_CpuCopyFast(&plttData->buffers[i].opaque[j * 16], &plttData->buffers[i].transparent[j * 16], 0x20);
                }
            }
        }
    }
}
