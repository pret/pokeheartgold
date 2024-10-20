#include "unk_02018424.h"

#include "global.h"

#include "constants/sndseq.h"

#include "font.h"
#include "gf_gfx_loader.h"
#include "palette.h"
#include "sys_task_api.h"
#include "text.h"
#include "unk_02005D10.h"

UnkStruct_020185FC *sub_02018498(UnkStruct_02018424 *a0, Ov122_021E7488 *a1, u8 a2, u8 a3, u8 a4, u8 a5, u8 a6, UnkFunc_020185FC a7, void *a8, BOOL a9, int a10);
void sub_02018744(UnkStruct_02018424 *a0, Ov122_021E7488 *a1, PaletteData *paletteData, HeapID heapId);
void sub_020187C0(SysTask *task, void *taskData);
u8 sub_0201881C(LISTMENUITEM *listMenuItem, u8 a1, FontID a2, u8 a3);
void sub_02018890(UnkStruct_020185FC *a0);
void sub_02018998(UnkStruct_020185FC *a0);
void sub_020189AC(UnkStruct_020185FC *a0);
void sub_02018C90(UnkStruct_020185FC *a0);
void sub_02018D0C(UnkStruct_020185FC *a0, u8 a1, BOOL a2);
void sub_02018D90(UnkStruct_020185FC *a0);
void sub_02018DF4(UnkStruct_020185FC *a0, int a1);
int sub_02018E08(UnkStruct_020185FC *a0, BOOL *a1);
int sub_02018E8C(UnkStruct_020185FC *a0);
void sub_02018FE8(UnkStruct_020185FC *a0, u16 a1);
void sub_02018FFC(UnkStruct_020185FC *a0, int a1);

UnkStruct_02018424 *sub_02018424(HeapID heapId, PaletteData *a1) {
    UnkStruct_02018424 *ret = AllocFromHeap(heapId, sizeof(UnkStruct_02018424));
    MI_CpuClear8(ret, sizeof(UnkStruct_02018424));
    ret->heapId      = heapId;
    ret->charDataRaw = GfGfxLoader_LoadFromNarc(NARC_a_1_6_5, 1, FALSE, heapId, FALSE);
    NNS_G2dGetUnpackedBGCharacterData(ret->charDataRaw, &ret->pCharData);
    ret->plttDataRaw = GfGfxLoader_LoadFromNarc(NARC_a_1_6_5, 0, FALSE, heapId, FALSE);
    NNS_G2dGetUnpackedPaletteData(ret->plttDataRaw, &ret->pPlttData);
    ret->paletteData = a1;
    return ret;
}

void sub_02018474(UnkStruct_02018424 *a0) {
    FreeToHeap(a0->plttDataRaw);
    FreeToHeap(a0->charDataRaw);
    MI_CpuFill8(a0, 0, sizeof(UnkStruct_02018424));
    FreeToHeap(a0);
}

UnkStruct_020185FC *sub_02018498(UnkStruct_02018424 *a0, Ov122_021E7488 *a1, u8 a2, u8 a3, u8 a4, u8 a5, u8 a6, UnkFunc_020185FC a7, void *a8, BOOL a9, int a10) {
    UnkStruct_020185FC *ret = AllocFromHeap(a0->heapId, sizeof(UnkStruct_020185FC));
    MI_CpuClear8(ret, sizeof(UnkStruct_020185FC));
    MI_CpuCopy8(a1, &ret->unk_04, sizeof(Ov122_021E7488));
    ret->unk_00 = a0;
    if (a6 < ret->unk_04.numWindows) {
        ret->unk_24 = a6;
    }
    ret->unk_25      = 0;
    ret->heapId      = a0->heapId;
    ret->y           = a4;
    ret->unk_24      = a6;
    ret->unk_27_1    = a2;
    ret->callback    = a7;
    ret->callbackArg = a8;
    ret->unk_27_0    = a9;
    if (a5 == 0) {
        ret->width = sub_0201881C(a1->listMenuItems, ret->unk_04.numWindows, 4, ret->unk_04.unk0.unk1);
    } else {
        ret->width = a5;
    }
    switch (a10) {
    default:
        GF_ASSERT(FALSE);
    case 0:
        ret->x = a3;
        break;
    case 1:
        ret->width = (ret->width + 1) & ~1;
        if (a3 - (ret->width + 2) / 2 < 0) {
            ret->x = 0;
        } else {
            ret->x = a3 - (ret->width + 2) / 2;
        }
        break;
    case 2:
        if (a3 - (ret->width + 2) < 0) {
            ret->x = 0;
        } else {
            ret->x = a3 - (ret->width + 2);
        }
        break;
    }
    sub_02018890(ret);
    sub_02018744(a0, &ret->unk_04, ret->unk_00->paletteData, ret->heapId);
    sub_020189AC(ret);
    sub_02018C90(ret);
    sub_02018DF4(ret, ret->unk_24);
    sub_02018FE8(ret, SEQ_SE_DP_SELECT);
    sub_02018FFC(ret, 0);
    return ret;
}

UnkStruct_020185FC *sub_020185FC(UnkStruct_02018424 *a0, Ov122_021E7488 *a1, u8 a2, u8 a3, u8 a4, u8 a5, u8 a6) {
    return sub_02018498(a0, a1, a2, a3, a4, a5, a6, NULL, NULL, FALSE, 0);
}

UnkStruct_020185FC *sub_02018620(UnkStruct_02018424 *a0, Ov122_021E7488 *a1, u8 a2, u8 a3, u8 a4, u8 a5, u8 a6, int a7) {
    return sub_02018498(a0, a1, a2, a3, a4, a5, a6, NULL, NULL, FALSE, a7);
}

UnkStruct_020185FC *sub_02018648(UnkStruct_02018424 *a0, Ov122_021E7488 *a1, u8 a2, u8 a3, u8 a4, u8 a5, u8 a6, UnkFunc_020185FC a7, void *a8, BOOL a9) {
    return sub_02018498(a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, 0);
}

u8 sub_02018674(UnkStruct_020185FC *a0) {
    return a0->unk_27_1;
}

void sub_02018680(UnkStruct_020185FC *a0) {
    MI_CpuClear8(a0, sizeof(UnkStruct_020185FC));
    FreeToHeap(a0);
}

void sub_02018694(UnkStruct_020185FC *a0) {
    sub_02018D90(a0);
    sub_02018998(a0);
}

int sub_020186A4(UnkStruct_020185FC *a0) {
    if (a0->unk_25 == 1) {
        if (a0->unk_2B == 0) {
            sub_02018694(a0);
            return a0->unk_04.listMenuItems[a0->unk_2A].value;
        }
        if (a0->unk_2B % 2 == 0) {
            if ((a0->unk_2B / 2) % 2 == 0) {
                sub_02018D0C(a0, a0->unk_2A, 1);
            } else {
                sub_02018D0C(a0, a0->unk_2A, 0);
            }
        }
        --a0->unk_2B;
        return -1;
    }

    int sp0;
    int r4 = sub_02018E08(a0, &sp0);
    if (sp0 == 0) {
        r4 = sub_02018E8C(a0);
    }
    if (r4 == -2) {
        sub_02018694(a0);
        return r4;
    }

    return -1;
}

typedef struct UnkTaskData_sub_020187C0 {
    BgConfig *bgConfig;
    u8 bgId;
    u8 plttOffset;
    u16 charOffset;
    NNSG2dCharacterData *pCharData;
    NNSG2dPaletteData *pPlttData;
} UnkTaskData_sub_020187C0;

void sub_02018744(UnkStruct_02018424 *a0, Ov122_021E7488 *a1, PaletteData *plttData, HeapID heapId) {
    UnkTaskData_sub_020187C0 *taskData = AllocFromHeapAtEnd(heapId, sizeof(UnkTaskData_sub_020187C0));
    MI_CpuClear8(taskData, sizeof(UnkTaskData_sub_020187C0));
    taskData->pCharData  = a0->pCharData;
    taskData->pPlttData  = a0->pPlttData;
    taskData->bgConfig   = a1->bgConfig;
    taskData->bgId       = a1->unk0.bgId;
    taskData->charOffset = a1->unk0.charOffset;
    taskData->plttOffset = a1->unk0.plttOffset;
    SysTask_CreateOnVWaitQueue(sub_020187C0, taskData, 128);
    if (plttData != NULL) {
        if (a1->unk0.bgId < GF_BG_LYR_SUB_0) {
            PaletteData_LoadPalette(plttData, taskData->pPlttData->pRawData, PLTTBUF_MAIN_BG, a1->unk0.plttOffset * 16, 0x20);
        } else {
            PaletteData_LoadPalette(plttData, taskData->pPlttData->pRawData, PLTTBUF_SUB_BG, a1->unk0.plttOffset * 16, 0x20);
        }
    }
}

void sub_020187C0(SysTask *task, void *taskData) {
    UnkTaskData_sub_020187C0 *data = taskData;

    DC_FlushRange(data->pCharData->pRawData, data->pCharData->szByte);
    BG_LoadCharTilesData(data->bgConfig, data->bgId, data->pCharData->pRawData, data->pCharData->szByte, data->charOffset);

    DC_FlushRange(data->pPlttData->pRawData, 0x20);
    if (data->bgId < GF_BG_LYR_SUB_0) {
        GX_LoadBGPltt(data->pPlttData->pRawData, data->plttOffset * 32, 0x20);
    } else {
        GXS_LoadBGPltt(data->pPlttData->pRawData, data->plttOffset * 32, 0x20);
    }

    SysTask_Destroy(task);
    FreeToHeap(taskData);
}

u8 sub_0201881C(LISTMENUITEM *listMenuItem, u8 a1, FontID a2, u8 a3) {
    u8 maxWidth = 0;
    for (int i = 0; i < a1; ++i) {
        GF_ASSERT(listMenuItem[i].text != NULL);
        GF_ASSERT(listMenuItem[i].text != (void *)LIST_NOTHING_CHOSEN);
        u8 width = FontID_String_GetWidth(a2, listMenuItem[i].text, 0);
        if (width > maxWidth) {
            maxWidth = width;
        }
    }
    maxWidth += a3 * 2;
    if (maxWidth % 8 == 0) {
        return maxWidth / 8;
    } else {
        return maxWidth / 8 + 1;
    }
}

void sub_02018890(UnkStruct_020185FC *a0) {
    int i;
    u16 tilesPerWindow;
    a0->windows             = AllocWindows(a0->heapId, a0->unk_04.numWindows);
    a0->touchscreenHitboxes = AllocFromHeap(a0->heapId, (a0->unk_04.numWindows + 1) * sizeof(TouchscreenHitbox));
    MI_CpuClear8(a0->touchscreenHitboxes, (a0->unk_04.numWindows + 1) * sizeof(TouchscreenHitbox));
    tilesPerWindow = a0->width * 2;
    for (i = 0; i < a0->unk_04.numWindows; ++i) {
        AddWindowParameterized(a0->unk_04.bgConfig, &a0->windows[i], a0->unk_04.unk0.bgId, a0->x + 1, a0->y + 1 + 3 * i, a0->width, 2, a0->unk_04.unk0.plttOffset, a0->unk_04.unk0.baseTile + tilesPerWindow * i);
        FillWindowPixelBuffer(&a0->windows[i], 3);
        a0->touchscreenHitboxes[i].rect.top    = (a0->y + 1) * 8 + 24 * i;
        a0->touchscreenHitboxes[i].rect.bottom = a0->touchscreenHitboxes[i].rect.top + 16;
        a0->touchscreenHitboxes[i].rect.left   = (a0->x + 1) * 8;
        a0->touchscreenHitboxes[i].rect.right  = a0->touchscreenHitboxes[i].rect.left + a0->width * 8;
    }
    a0->touchscreenHitboxes[i].rect.top = TOUCHSCREEN_RECTLIST_END;
}

void sub_02018998(UnkStruct_020185FC *a0) {
    FreeToHeap(a0->touchscreenHitboxes);
    WindowArray_Delete(a0->windows, a0->unk_04.numWindows);
}

void sub_020189AC(UnkStruct_020185FC *a0) {
    int i;
    int r4;
    int sp10;

    sp10 = a0->unk_04.numWindows - 1;

    // top row
    r4 = a0->unk_04.unk0.charOffset;
    if (a0->unk_24 == 0) {
        r4 += 12;
    }
    FillBgTilemapRect(a0->unk_04.bgConfig, a0->unk_04.unk0.bgId, r4, a0->x, a0->y, 1, 1, a0->unk_04.unk0.plttOffset);
    FillBgTilemapRect(a0->unk_04.bgConfig, a0->unk_04.unk0.bgId, r4 + 1, a0->x + 1, a0->y, a0->width, 1, a0->unk_04.unk0.plttOffset);
    FillBgTilemapRect(a0->unk_04.bgConfig, a0->unk_04.unk0.bgId, r4 + 2, a0->x + a0->width + 1, a0->y, 1, 1, a0->unk_04.unk0.plttOffset);

    // bottom row
    r4 = a0->unk_04.unk0.charOffset + 9;
    if (a0->unk_24 == sp10) {
        r4 += 12;
    }
    FillBgTilemapRect(a0->unk_04.bgConfig, a0->unk_04.unk0.bgId, r4, a0->x, a0->y + a0->unk_04.numWindows * 3, 1, 1, a0->unk_04.unk0.plttOffset);
    FillBgTilemapRect(a0->unk_04.bgConfig, a0->unk_04.unk0.bgId, r4 + 1, a0->x + 1, a0->y + a0->unk_04.numWindows * 3, a0->width, 1, a0->unk_04.unk0.plttOffset);
    FillBgTilemapRect(a0->unk_04.bgConfig, a0->unk_04.unk0.bgId, r4 + 2, a0->x + a0->width + 1, a0->y + a0->unk_04.numWindows * 3, 1, 1, a0->unk_04.unk0.plttOffset);

    // between each button
    for (i = 0; i < a0->unk_04.numWindows - 1; ++i) {
        r4 = a0->unk_04.unk0.charOffset + 6;
        if ((a0->unk_24 == 0 && i == 0) || a0->unk_24 == i) {
            r4 += 12;
        } else if ((a0->unk_24 == sp10 && i == sp10 - 1) || a0->unk_24 == i + 1) {
            r4 += 18;
        }
        FillBgTilemapRect(a0->unk_04.bgConfig, a0->unk_04.unk0.bgId, r4, a0->x, a0->y + i * 3 + 3, 1, 1, a0->unk_04.unk0.plttOffset);
        FillBgTilemapRect(a0->unk_04.bgConfig, a0->unk_04.unk0.bgId, r4 + 1, a0->x + 1, a0->y + i * 3 + 3, a0->width, 1, a0->unk_04.unk0.plttOffset);
        FillBgTilemapRect(a0->unk_04.bgConfig, a0->unk_04.unk0.bgId, r4 + 2, a0->x + a0->width + 1, a0->y + i * 3 + 3, 1, 1, a0->unk_04.unk0.plttOffset);
    }

    // left and right borders
    for (i = 0; i < a0->unk_04.numWindows; ++i) {
        r4 = a0->unk_04.unk0.charOffset + 3;
        if (a0->unk_24 == i) {
            r4 += 12;
        }
        FillBgTilemapRect(a0->unk_04.bgConfig, a0->unk_04.unk0.bgId, r4, a0->x, a0->y + i * 3 + 1, 1, 2, a0->unk_04.unk0.plttOffset);
        FillBgTilemapRect(a0->unk_04.bgConfig, a0->unk_04.unk0.bgId, r4 + 2, a0->x + a0->width + 1, a0->y + i * 3 + 1, 1, 2, a0->unk_04.unk0.plttOffset);
    }
}

void sub_02018C90(UnkStruct_020185FC *a0) {
    int i;
    u32 x;
    u32 width;

    width = a0->width * 8;
    for (i = 0; i < a0->unk_04.numWindows; ++i) {
        if (a0->unk_04.unk0.unk0_1 == 0) {
            x = a0->unk_04.unk0.unk1;
        } else {
            x = (width - FontID_String_GetWidth(4, a0->unk_04.listMenuItems[i].text, 0)) / 2;
        }
        AddTextPrinterParameterizedWithColor(&a0->windows[i], 4, a0->unk_04.listMenuItems[i].text, x, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(1, 2, 3), NULL);
        ScheduleWindowCopyToVram(&a0->windows[i]);
    }
    ScheduleBgTilemapBufferTransfer(a0->unk_04.bgConfig, a0->unk_04.unk0.bgId);
}

void sub_02018D0C(UnkStruct_020185FC *a0, u8 a1, BOOL a2) {
    u32 x;
    u32 width;
    u32 textColor;
    u8 fillValue;
    if (a2) {
        textColor = MAKE_TEXT_COLOR(4, 5, 6);
        fillValue = 6;
    } else {
        textColor = MAKE_TEXT_COLOR(1, 2, 3);
        fillValue = 3;
    }

    width = a0->width * 8;
    if (a0->unk_04.unk0.unk0_1 == 0) {
        x = a0->unk_04.unk0.unk1;
    } else {
        x = (width - FontID_String_GetWidth(4, a0->unk_04.listMenuItems[a1].text, 0)) / 2;
    }
    FillWindowPixelBuffer(&a0->windows[a1], fillValue);
    AddTextPrinterParameterizedWithColor(&a0->windows[a1], 4, a0->unk_04.listMenuItems[a1].text, x, 0, TEXT_SPEED_NOTRANSFER, textColor, NULL);
    ScheduleWindowCopyToVram(&a0->windows[a1]);
}

void sub_02018D90(UnkStruct_020185FC *a0) {
    for (int i = 0; i < a0->unk_04.numWindows; ++i) {
        ClearWindowTilemapAndScheduleTransfer(&a0->windows[i]);
    }
    FillBgTilemapRect(a0->unk_04.bgConfig, a0->unk_04.unk0.bgId, 0, a0->x, a0->y, a0->width + 2, a0->unk_04.numWindows * 3 + 1, a0->unk_04.unk0.plttOffset);
    ScheduleBgTilemapBufferTransfer(a0->unk_04.bgConfig, a0->unk_04.unk0.bgId);
}

void sub_02018DF4(UnkStruct_020185FC *a0, int a1) {
    sub_020189AC(a0);
    ScheduleBgTilemapBufferTransfer(a0->unk_04.bgConfig, a0->unk_04.unk0.bgId);
}

int sub_02018E08(UnkStruct_020185FC *a0, BOOL *a1) {
    int hitbox = TouchscreenHitbox_FindRectAtTouchNew(a0->touchscreenHitboxes);
    if (hitbox == -1) {
        *a1 = FALSE;
        return -1;
    }
    *a1        = TRUE;
    a0->unk_24 = hitbox;
    sub_02018D0C(a0, hitbox, TRUE);
    sub_020189AC(a0);
    ScheduleBgTilemapBufferTransfer(a0->unk_04.bgConfig, a0->unk_04.unk0.bgId);
    a0->unk_25   = 1;
    a0->unk_2B   = 8;
    a0->unk_2A   = hitbox;
    a0->unk_27_1 = 1;
    sub_02018FE8(a0, SEQ_SE_DP_SELECT);
    sub_02018FFC(a0, 2);
    return -1;
}

int sub_02018E8C(UnkStruct_020185FC *a0) {
    u8 prev;

    if (gSystem.newKeys & (PAD_BUTTON_X | PAD_BUTTON_Y | PAD_KEY_UP | PAD_KEY_DOWN | PAD_KEY_LEFT | PAD_KEY_RIGHT | PAD_BUTTON_A | PAD_BUTTON_B)) {
        a0->unk_27_1 = 0;
    }
    if (gSystem.newKeys & PAD_BUTTON_B) {
        sub_02018FE8(a0, SEQ_SE_DP_SELECT);
        sub_02018FFC(a0, 3);
        return -2;
    }
    if (gSystem.newKeys & PAD_BUTTON_A) {
        sub_02018D0C(a0, a0->unk_24, TRUE);
        a0->unk_25 = 1;
        a0->unk_2B = 8;
        a0->unk_2A = a0->unk_24;
        sub_02018FE8(a0, SEQ_SE_DP_SELECT);
        sub_02018FFC(a0, 2);
        return -1;
    }
    prev = a0->unk_24;
    if (gSystem.newKeys & PAD_KEY_UP) {
        if (a0->unk_04.unk0.unk0_0) {
            a0->unk_24 = (a0->unk_24 + (a0->unk_04.numWindows - 1)) % a0->unk_04.numWindows;
        } else if (a0->unk_24 > 0) {
            --a0->unk_24;
        }
        if (prev != a0->unk_24) {
            sub_02018FE8(a0, SEQ_SE_DP_SELECT);
            sub_02018FFC(a0, 1);
            sub_02018DF4(a0, a0->unk_24);
        }
    }
    if (gSystem.newKeys & PAD_KEY_DOWN) {
        if (a0->unk_04.unk0.unk0_0) {
            a0->unk_24 = (a0->unk_24 + 1) % a0->unk_04.numWindows;
        } else if (a0->unk_24 < a0->unk_04.numWindows - 1) {
            ++a0->unk_24;
        }
        if (prev != a0->unk_24) {
            sub_02018FE8(a0, SEQ_SE_DP_SELECT);
            sub_02018FFC(a0, 1);
            sub_02018DF4(a0, a0->unk_24);
        }
    }

    return -1;
}

void sub_02018FE8(UnkStruct_020185FC *a0, u16 a1) {
    if (!a0->unk_27_0) {
        PlaySE(a1);
    }
}

void sub_02018FFC(UnkStruct_020185FC *a0, int a1) {
    if (a0->callback != NULL) {
        a0->callback(a0, a0->unk_24, a0->callbackArg, a1);
    }
}
