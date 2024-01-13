#include <stdlib.h>
#include "global.h"
#include "palette.h"
#include "gf_gfx_loader.h"
#include "unk_02026E84.h"
#include "sys_task_api.h"

u8 IsPaletteSelected(u16 toSelect, u16 bufferID);
void sub_02003574(PaletteData *data, u16 bufferID);
void sub_020035B4(int bufferID, PaletteBuffer *buffer, u16 *opaqueBit);
void sub_020035F0(SelectedPaletteData *selectedBit, u16 opaqueBit, s8 wait, u8 cur, u8 end, u16 nextRGB);
void sub_020036B0(SysTask *task, void *taskData);
void sub_02003760(PaletteData *data);
void sub_02003780(PaletteData *data);
void sub_020037A0(PaletteData *data, u16 bufferID, u16 size);
void sub_020037FC(PaletteData *data, u16 bufferID, u16 size);
void sub_02003858(u16 *opaque, u16 *transparent, SelectedPaletteData *selectedBit, u16 size);
void sub_020038E4(PaletteData *data, u8 bufferID, SelectedPaletteData *selectedBit);

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

void sub_020035F0(SelectedPaletteData *selectedBit, u16 opaqueBit, s8 wait, u8 cur, u8 end, u16 nextRGB) {
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
    selectedBit->unk6_4 = selectedBit->wait;
    if (cur < end) {
        selectedBit->sign = 0;
    } else {
        selectedBit->sign = 1;
    }
}

void sub_020036B0(SysTask *task, void *taskData) {
    PaletteData *data = (PaletteData *)taskData;

    if (data->forceExit == 1) {
        data->forceExit = 0;
        data->transparentBit = 0;
        data->selectedBuffer = 0;
        data->callbackFlag = 0;
        DestroySysTask(task);
        return;
    }

    if (data->selectedFlag == 1) {
        data->transparentBit = data->selectedBuffer;
        sub_02003760(data);
        sub_02003780(data);
        if (data->selectedBuffer == 0) {
            data->callbackFlag = 0;
            DestroySysTask(task);
            return;
        }
    }
}

void sub_0200374C(PaletteData *data) {
    if (data->selectedBuffer != 0) {
        data->forceExit = 1;
    }
}

void sub_02003760(PaletteData *data) {
    for (u8 i = 0; i < 4; ++i) {
        sub_020037A0(data, i, 0x10);
    }
}

void sub_02003780(PaletteData *data) {
    for (u8 i = 4; i < 14; ++i) {
        sub_020037A0(data, i, 0x100);
    }
}

void sub_020037A0(PaletteData *data, u16 bufferID, u16 size) {
    if (IsPaletteSelected(data->selectedBuffer, bufferID)) {
        if (data->buffers[bufferID].selected.unk6_4 < data->buffers[bufferID].selected.wait) {
            ++data->buffers[bufferID].selected.unk6_4;
        } else {
            data->buffers[bufferID].selected.unk6_4 = 0;
            sub_020037FC(data, bufferID, size);
        }
    }
}

void sub_020037FC(PaletteData *data, u16 bufferID, u16 size) {
    for (u32 i = 0; i < 16; ++i) {
        if (IsPaletteSelected(data->buffers[bufferID].selected.opaqueBit, i)) {
            sub_02003858(&data->buffers[bufferID].opaque[i * size], &data->buffers[bufferID].transparent[i * size], &data->buffers[bufferID].selected, size);
        }
    }
    sub_020038E4(data, bufferID, &data->buffers[bufferID].selected);
}

void sub_02003858(u16 *opaque, u16 *transparent, SelectedPaletteData *selectedBit, u16 size) {
    u32 i;
    u8 r, g, b;
    for (i = 0; i < size; ++i) {
        r = (opaque[i] & 0x1F) + (((selectedBit->nextRGB & 0x1F) - (opaque[i] & 0x1F)) * selectedBit->cur >> 4);
        g = ((opaque[i] >> 5) & 0x1F) + ((((selectedBit->nextRGB >> 5) & 0x1F) - ((opaque[i] >> 5) & 0x1F)) * selectedBit->cur >> 4);
        b = ((opaque[i] >> 10) & 0x1F) + ((((selectedBit->nextRGB >> 10) & 0x1F) - ((opaque[i] >> 10) & 0x1F)) * selectedBit->cur >> 4);
        transparent[i] = (b << 10) | (g << 5) | r;
    }
}

void sub_020038E4(PaletteData *data, u8 bufferID, SelectedPaletteData *selectedBit) {
    s16 r4;

    if (selectedBit->cur == selectedBit->end) {
        if (data->selectedBuffer & (1 << bufferID)) {
            data->selectedBuffer ^= (1 << bufferID);
        }
    } else if (!selectedBit->sign) {
        r4 = selectedBit->cur;
        r4 += selectedBit->step;
        if (r4 > selectedBit->end) {
            r4 = selectedBit->end;
        }
        selectedBit->cur = r4;
    } else {
        r4 = selectedBit->cur;
        r4 -= selectedBit->step;
        if (r4 < selectedBit->end) {
            r4 = selectedBit->end;
        }
        selectedBit->cur = r4;
    }
}

void PaletteData_PushTransparentBuffers(PaletteData *plttData) {
    int i;
    if (plttData->autoTransparent || plttData->selectedFlag == 1) {
        for (i = 0; i < 14; ++i) {
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
            case 0:
                GX_LoadBGPltt(plttData->buffers[i].transparent, 0, plttData->buffers[i].size);
                break;
            case 1:
                GXS_LoadBGPltt(plttData->buffers[i].transparent, 0, plttData->buffers[i].size);
                break;
            case 2:
                GX_LoadOBJPltt(plttData->buffers[i].transparent, 0, plttData->buffers[i].size);
                break;
            case 3:
                GXS_LoadOBJPltt(plttData->buffers[i].transparent, 0, plttData->buffers[i].size);
                break;
            case 4:
                GX_BeginLoadBGExtPltt();
                GX_LoadBGExtPltt(plttData->buffers[i].transparent, 0, plttData->buffers[i].size);
                GX_EndLoadBGExtPltt();
                break;
            case 5:
                GX_BeginLoadBGExtPltt();
                GX_LoadBGExtPltt(plttData->buffers[i].transparent, 0x2000, plttData->buffers[i].size);
                GX_EndLoadBGExtPltt();
                break;
            case 6:
                GX_BeginLoadBGExtPltt();
                GX_LoadBGExtPltt(plttData->buffers[i].transparent, 0x4000, plttData->buffers[i].size);
                GX_EndLoadBGExtPltt();
                break;
            case 7:
                GX_BeginLoadBGExtPltt();
                GX_LoadBGExtPltt(plttData->buffers[i].transparent, 0x6000, plttData->buffers[i].size);
                GX_EndLoadBGExtPltt();
                break;
            case 8:
                GXS_BeginLoadBGExtPltt();
                GXS_LoadBGExtPltt(plttData->buffers[i].transparent, 0, plttData->buffers[i].size);
                GXS_EndLoadBGExtPltt();
                break;
            case 9:
                GXS_BeginLoadBGExtPltt();
                GXS_LoadBGExtPltt(plttData->buffers[i].transparent, 0x2000, plttData->buffers[i].size);
                GXS_EndLoadBGExtPltt();
                break;
            case 10:
                GXS_BeginLoadBGExtPltt();
                GXS_LoadBGExtPltt(plttData->buffers[i].transparent, 0x4000, plttData->buffers[i].size);
                GXS_EndLoadBGExtPltt();
                break;
            case 11:
                GXS_BeginLoadBGExtPltt();
                GXS_LoadBGExtPltt(plttData->buffers[i].transparent, 0x6000, plttData->buffers[i].size);
                GXS_EndLoadBGExtPltt();
                break;
            case 12:
                GX_BeginLoadOBJExtPltt();
                GX_LoadOBJExtPltt(plttData->buffers[i].transparent, 0, plttData->buffers[i].size);
                GX_EndLoadOBJExtPltt();
                break;
            case 13:
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


u16 sub_02003B44(PaletteData *plttData) {
    return plttData->selectedBuffer;
}

void PaletteData_SetAutoTransparent(PaletteData *plttData, BOOL autoTransparent) {
    plttData->autoTransparent = autoTransparent;
}

void sub_02003B74(PaletteData *plttData, BOOL a1) {
    plttData->selectedFlag = a1 & 1;
    plttData->selectedBuffer = 0x3FFF;
}

void sub_02003BA8(u16 selectedBuffer, HeapID heapId) {
    void *tmp;

    tmp = AllocFromHeap(heapId, 0x200);
    memset(tmp, 0, 0x200);
    DC_FlushRange(tmp, 0x200);

    if (selectedBuffer & (1 << 0)) {
        GX_LoadBGPltt(tmp, 0, 0x200);
    }
    if (selectedBuffer & (1 << 1)) {
        GXS_LoadBGPltt(tmp, 0, 0x200);
    }
    if (selectedBuffer & (1 << 2)) {
        GX_LoadOBJPltt(tmp, 0, 0x200);
    }
    if (selectedBuffer & (1 << 3)) {
        GXS_LoadOBJPltt(tmp, 0, 0x200);
    }

    FreeToHeapExplicit(heapId, tmp);

    tmp = AllocFromHeap(heapId, 0x2000);
    memset(tmp, 0, 0x2000);
    DC_FlushRange(tmp, 0x2000);

    if (selectedBuffer & (1 << 4)) {
        GX_BeginLoadBGExtPltt();
        GX_LoadBGExtPltt(tmp, 0, 0x2000);
        GX_EndLoadBGExtPltt();
    }
    if (selectedBuffer & (1 << 5)) {
        GX_BeginLoadBGExtPltt();
        GX_LoadBGExtPltt(tmp, 0x2000, 0x2000);
        GX_EndLoadBGExtPltt();
    }
    if (selectedBuffer & (1 << 6)) {
        GX_BeginLoadBGExtPltt();
        GX_LoadBGExtPltt(tmp, 0x4000, 0x2000);
        GX_EndLoadBGExtPltt();
    }
    if (selectedBuffer & (1 << 7)) {
        GX_BeginLoadBGExtPltt();
        GX_LoadBGExtPltt(tmp, 0x6000, 0x2000);
        GX_EndLoadBGExtPltt();
    }
    if (selectedBuffer & (1 << 8)) {
        GXS_BeginLoadBGExtPltt();
        GXS_LoadBGExtPltt(tmp, 0, 0x2000);
        GXS_EndLoadBGExtPltt();
    }
    if (selectedBuffer & (1 << 9)) {
        GXS_BeginLoadBGExtPltt();
        GXS_LoadBGExtPltt(tmp, 0x2000, 0x2000);
        GXS_EndLoadBGExtPltt();
    }
    if (selectedBuffer & (1 << 10)) {
        GXS_BeginLoadBGExtPltt();
        GXS_LoadBGExtPltt(tmp, 0x4000, 0x2000);
        GXS_EndLoadBGExtPltt();
    }
    if (selectedBuffer & (1 << 11)) {
        GXS_BeginLoadBGExtPltt();
        GXS_LoadBGExtPltt(tmp, 0x6000, 0x2000);
        GXS_EndLoadBGExtPltt();
    }
    if (selectedBuffer & (1 << 12)) {
        GX_BeginLoadOBJExtPltt();
        GX_LoadOBJExtPltt(tmp, 0, 0x2000);
        GX_EndLoadOBJExtPltt();
    }
    if (selectedBuffer & (1 << 13)) {
        GXS_BeginLoadOBJExtPltt();
        GXS_LoadOBJExtPltt(tmp, 0, 0x2000);
        GXS_EndLoadOBJExtPltt();
    }

    FreeToHeapExplicit(heapId, tmp);
}
