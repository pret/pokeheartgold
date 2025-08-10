#include "touchscreen_list_menu.h"

#include "global.h"

#include "constants/sndseq.h"

#include "data/sbox_gra.naix"

#include "font.h"
#include "gf_gfx_loader.h"
#include "palette.h"
#include "sys_task_api.h"
#include "text.h"
#include "unk_02005D10.h"

static TouchscreenListMenu *TouchscreenListMenu_CreateInternal(TouchscreenListMenuSpawner *spawner, TouchscreenListMenuHeader *header, u8 isTouch, u8 x, u8 y, u8 width, u8 selection, TouchscreenListMenuCallback callback, void *callbackArg, BOOL silent, int alignment);
static void TouchscreenListMenuSpawner_ScheduleLoadGraphicsToVram(TouchscreenListMenuSpawner *spawner, TouchscreenListMenuHeader *header, PaletteData *paletteData, HeapID heapId);
static void Task_LoadTouchscreenListMenuGraphicsToVram(SysTask *task, void *taskData);
static u8 TouchscreenListMenu_GetItemsTextMaxWidth(LISTMENUITEM *listMenuItem, u8 num, FontID fontId, u8 margin);
static void TouchscreenListMenu_CreateWindows(TouchscreenListMenu *menu);
static void TouchscreenListMenu_DeleteWindows(TouchscreenListMenu *menu);
static void TouchscreenListMenu_DrawButtons(TouchscreenListMenu *menu);
static void TouchscreenListMenu_PrintOptions(TouchscreenListMenu *menu);
static void TouchscreenListMenu_ToggleButtonPalette(TouchscreenListMenu *menu, u8 index, BOOL selected);
static void TouchscreenListMenu_EraseTilemap(TouchscreenListMenu *menu);
static void TouchscreenListMenu_DrawButtonsAndTransfer(TouchscreenListMenu *menu, u8 cursorPos);
static int TouchscreenListMenu_HandleTouchInput(TouchscreenListMenu *menu, BOOL *flagRet);
static int TouchscreenListMenu_HandleKeyInput(TouchscreenListMenu *menu);
static void TouchscreenListMenu_PlaySE(TouchscreenListMenu *menu, u16 sndseq);
static void TouchscreenListMenu_InvokeCallback(TouchscreenListMenu *menu, int a1);

TouchscreenListMenuSpawner *TouchscreenListMenuSpawner_Create(HeapID heapId, PaletteData *paletteData) {
    TouchscreenListMenuSpawner *ret = AllocFromHeap(heapId, sizeof(TouchscreenListMenuSpawner));
    MI_CpuClear8(ret, sizeof(TouchscreenListMenuSpawner));
    ret->heapId = heapId;
    ret->charDataRaw = GfGfxLoader_LoadFromNarc(NARC_data_sbox_gra, NARC_sbox_gra_sbox_gra_NCGR, FALSE, heapId, FALSE);
    NNS_G2dGetUnpackedBGCharacterData(ret->charDataRaw, &ret->pCharData);
    ret->plttDataRaw = GfGfxLoader_LoadFromNarc(NARC_data_sbox_gra, NARC_sbox_gra_sbox_gra_NCLR, FALSE, heapId, FALSE);
    NNS_G2dGetUnpackedPaletteData(ret->plttDataRaw, &ret->pPlttData);
    ret->paletteData = paletteData;
    return ret;
}

void TouchscreenListMenuSpawner_Destroy(TouchscreenListMenuSpawner *spawner) {
    Heap_Free(spawner->plttDataRaw);
    Heap_Free(spawner->charDataRaw);
    MI_CpuFill8(spawner, 0, sizeof(TouchscreenListMenuSpawner));
    Heap_Free(spawner);
}

static TouchscreenListMenu *TouchscreenListMenu_CreateInternal(TouchscreenListMenuSpawner *spawner, TouchscreenListMenuHeader *header, u8 isTouch, u8 x, u8 y, u8 width, u8 selection, TouchscreenListMenuCallback callback, void *callbackArg, BOOL silent, int alignment) {
    TouchscreenListMenu *ret = AllocFromHeap(spawner->heapId, sizeof(TouchscreenListMenu));
    MI_CpuClear8(ret, sizeof(TouchscreenListMenu));
    MI_CpuCopy8(header, &ret->header, sizeof(TouchscreenListMenuHeader));
    ret->spawner = spawner;
    if (selection < ret->header.numWindows) {
        ret->cursorPos = selection;
    }
    ret->animActive = 0;
    ret->heapId = spawner->heapId;
    ret->y = y;
    ret->cursorPos = selection;
    ret->isTouch = isTouch;
    ret->callback = callback;
    ret->callbackArg = callbackArg;
    ret->silent = silent;
    if (width == 0) {
        ret->width = TouchscreenListMenu_GetItemsTextMaxWidth(header->listMenuItems, ret->header.numWindows, 4, ret->header.template.xOffset);
    } else {
        ret->width = width;
    }
    switch (alignment) {
    default:
        GF_ASSERT(FALSE);
    case 0:
        ret->x = x;
        break;
    case 1:
        ret->width = (ret->width + 1) & ~1;
        if (x - (ret->width + 2) / 2 < 0) {
            ret->x = 0;
        } else {
            ret->x = x - (ret->width + 2) / 2;
        }
        break;
    case 2:
        if (x - (ret->width + 2) < 0) {
            ret->x = 0;
        } else {
            ret->x = x - (ret->width + 2);
        }
        break;
    }
    TouchscreenListMenu_CreateWindows(ret);
    TouchscreenListMenuSpawner_ScheduleLoadGraphicsToVram(spawner, &ret->header, ret->spawner->paletteData, ret->heapId);
    TouchscreenListMenu_DrawButtons(ret);
    TouchscreenListMenu_PrintOptions(ret);
    TouchscreenListMenu_DrawButtonsAndTransfer(ret, ret->cursorPos);
    TouchscreenListMenu_PlaySE(ret, SEQ_SE_DP_SELECT);
    TouchscreenListMenu_InvokeCallback(ret, 0);
    return ret;
}

TouchscreenListMenu *TouchscreenListMenu_Create(TouchscreenListMenuSpawner *spawner, TouchscreenListMenuHeader *header, u8 isTouch, u8 x, u8 y, u8 width, u8 selection) {
    return TouchscreenListMenu_CreateInternal(spawner, header, isTouch, x, y, width, selection, NULL, NULL, FALSE, 0);
}

TouchscreenListMenu *TouchscreenListMenu_CreateWithAlignment(TouchscreenListMenuSpawner *spawner, TouchscreenListMenuHeader *header, u8 isTouch, u8 x, u8 y, u8 width, u8 selection, int alignment) {
    return TouchscreenListMenu_CreateInternal(spawner, header, isTouch, x, y, width, selection, NULL, NULL, FALSE, alignment);
}

TouchscreenListMenu *TouchscreenListMenu_CreateWithCallback(TouchscreenListMenuSpawner *spawner, TouchscreenListMenuHeader *header, u8 isTouch, u8 x, u8 y, u8 width, u8 selection, TouchscreenListMenuCallback callback, void *callbackArg, BOOL silent) {
    return TouchscreenListMenu_CreateInternal(spawner, header, isTouch, x, y, width, selection, callback, callbackArg, silent, 0);
}

u8 TouchscreenListMenu_WasLastInputTouch(TouchscreenListMenu *menu) {
    return menu->isTouch;
}

void TouchscreenListMenu_Destroy(TouchscreenListMenu *menu) {
    MI_CpuClear8(menu, sizeof(TouchscreenListMenu));
    Heap_Free(menu);
}

void TouchscreenListMenu_DestroyButtons(TouchscreenListMenu *menu) {
    TouchscreenListMenu_EraseTilemap(menu);
    TouchscreenListMenu_DeleteWindows(menu);
}

int TouchscreenListMenu_HandleInput(TouchscreenListMenu *menu) {
    if (menu->animActive == 1) {
        if (menu->animTimer == 0) {
            TouchscreenListMenu_DestroyButtons(menu);
            return menu->header.listMenuItems[menu->selection].value;
        }
        if (menu->animTimer % 2 == 0) {
            if ((menu->animTimer / 2) % 2 == 0) {
                TouchscreenListMenu_ToggleButtonPalette(menu, menu->selection, 1);
            } else {
                TouchscreenListMenu_ToggleButtonPalette(menu, menu->selection, 0);
            }
        }
        --menu->animTimer;
        return -1;
    }

    BOOL isTouch;
    int input = TouchscreenListMenu_HandleTouchInput(menu, &isTouch);
    if (!isTouch) {
        input = TouchscreenListMenu_HandleKeyInput(menu);
    }
    if (input == LIST_CANCEL) {
        TouchscreenListMenu_DestroyButtons(menu);
        return input;
    }

    return -1;
}

typedef struct TaskData_TouchscreenListMenuGraphicsLoad {
    BgConfig *bgConfig;
    u8 bgId;
    u8 plttOffset;
    u16 charOffset;
    NNSG2dCharacterData *pCharData;
    NNSG2dPaletteData *pPlttData;
} TaskData_TouchscreenListMenuGraphicsLoad;

static void TouchscreenListMenuSpawner_ScheduleLoadGraphicsToVram(TouchscreenListMenuSpawner *spawner, TouchscreenListMenuHeader *header, PaletteData *plttData, HeapID heapId) {
    TaskData_TouchscreenListMenuGraphicsLoad *taskData = AllocFromHeapAtEnd(heapId, sizeof(TaskData_TouchscreenListMenuGraphicsLoad));
    MI_CpuClear8(taskData, sizeof(TaskData_TouchscreenListMenuGraphicsLoad));
    taskData->pCharData = spawner->pCharData;
    taskData->pPlttData = spawner->pPlttData;
    taskData->bgConfig = header->bgConfig;
    taskData->bgId = header->template.bgId;
    taskData->charOffset = header->template.charOffset;
    taskData->plttOffset = header->template.plttOffset;
    SysTask_CreateOnVWaitQueue(Task_LoadTouchscreenListMenuGraphicsToVram, taskData, 128);
    if (plttData != NULL) {
        if (header->template.bgId < GF_BG_LYR_SUB_0) {
            PaletteData_LoadPalette(plttData, taskData->pPlttData->pRawData, PLTTBUF_MAIN_BG, header->template.plttOffset * 16, 0x20);
        } else {
            PaletteData_LoadPalette(plttData, taskData->pPlttData->pRawData, PLTTBUF_SUB_BG, header->template.plttOffset * 16, 0x20);
        }
    }
}

static void Task_LoadTouchscreenListMenuGraphicsToVram(SysTask *task, void *taskData) {
    TaskData_TouchscreenListMenuGraphicsLoad *data = taskData;

    DC_FlushRange(data->pCharData->pRawData, data->pCharData->szByte);
    BG_LoadCharTilesData(data->bgConfig, data->bgId, data->pCharData->pRawData, data->pCharData->szByte, data->charOffset);

    DC_FlushRange(data->pPlttData->pRawData, 0x20);
    if (data->bgId < GF_BG_LYR_SUB_0) {
        GX_LoadBGPltt(data->pPlttData->pRawData, data->plttOffset * 32, 0x20);
    } else {
        GXS_LoadBGPltt(data->pPlttData->pRawData, data->plttOffset * 32, 0x20);
    }

    SysTask_Destroy(task);
    Heap_Free(taskData);
}

static u8 TouchscreenListMenu_GetItemsTextMaxWidth(LISTMENUITEM *listMenuItem, u8 num, FontID fontId, u8 margin) {
    u8 maxWidth = 0;
    for (int i = 0; i < num; ++i) {
        GF_ASSERT(listMenuItem[i].text != NULL);
        GF_ASSERT(listMenuItem[i].text != (void *)LIST_NOTHING_CHOSEN);
        u8 width = FontID_String_GetWidth(fontId, listMenuItem[i].text, 0);
        if (width > maxWidth) {
            maxWidth = width;
        }
    }
    maxWidth += margin * 2;
    if (maxWidth % 8 == 0) {
        return maxWidth / 8;
    } else {
        return maxWidth / 8 + 1;
    }
}

static void TouchscreenListMenu_CreateWindows(TouchscreenListMenu *menu) {
    int i;
    u16 tilesPerWindow;
    menu->windows = AllocWindows(menu->heapId, menu->header.numWindows);
    menu->touchscreenHitboxes = AllocFromHeap(menu->heapId, (menu->header.numWindows + 1) * sizeof(TouchscreenHitbox));
    MI_CpuClear8(menu->touchscreenHitboxes, (menu->header.numWindows + 1) * sizeof(TouchscreenHitbox));
    tilesPerWindow = menu->width * 2;
    for (i = 0; i < menu->header.numWindows; ++i) {
        AddWindowParameterized(menu->header.bgConfig, &menu->windows[i], menu->header.template.bgId, menu->x + 1, menu->y + 1 + 3 * i, menu->width, 2, menu->header.template.plttOffset, menu->header.template.baseTile + tilesPerWindow * i);
        FillWindowPixelBuffer(&menu->windows[i], 3);
        menu->touchscreenHitboxes[i].rect.top = (menu->y + 1) * 8 + 24 * i;
        menu->touchscreenHitboxes[i].rect.bottom = menu->touchscreenHitboxes[i].rect.top + 16;
        menu->touchscreenHitboxes[i].rect.left = (menu->x + 1) * 8;
        menu->touchscreenHitboxes[i].rect.right = menu->touchscreenHitboxes[i].rect.left + menu->width * 8;
    }
    menu->touchscreenHitboxes[i].rect.top = TOUCHSCREEN_RECTLIST_END;
}

static void TouchscreenListMenu_DeleteWindows(TouchscreenListMenu *menu) {
    Heap_Free(menu->touchscreenHitboxes);
    WindowArray_Delete(menu->windows, menu->header.numWindows);
}

static void TouchscreenListMenu_DrawButtons(TouchscreenListMenu *menu) {
    int i;
    int tileNum;
    int lastIndex;

    lastIndex = menu->header.numWindows - 1;

    // top row
    tileNum = menu->header.template.charOffset;
    if (menu->cursorPos == 0) {
        tileNum += 12;
    }
    FillBgTilemapRect(menu->header.bgConfig, menu->header.template.bgId, tileNum, menu->x, menu->y, 1, 1, menu->header.template.plttOffset);
    FillBgTilemapRect(menu->header.bgConfig, menu->header.template.bgId, tileNum + 1, menu->x + 1, menu->y, menu->width, 1, menu->header.template.plttOffset);
    FillBgTilemapRect(menu->header.bgConfig, menu->header.template.bgId, tileNum + 2, menu->x + menu->width + 1, menu->y, 1, 1, menu->header.template.plttOffset);

    // bottom row
    tileNum = menu->header.template.charOffset + 9;
    if (menu->cursorPos == lastIndex) {
        tileNum += 12;
    }
    FillBgTilemapRect(menu->header.bgConfig, menu->header.template.bgId, tileNum, menu->x, menu->y + menu->header.numWindows * 3, 1, 1, menu->header.template.plttOffset);
    FillBgTilemapRect(menu->header.bgConfig, menu->header.template.bgId, tileNum + 1, menu->x + 1, menu->y + menu->header.numWindows * 3, menu->width, 1, menu->header.template.plttOffset);
    FillBgTilemapRect(menu->header.bgConfig, menu->header.template.bgId, tileNum + 2, menu->x + menu->width + 1, menu->y + menu->header.numWindows * 3, 1, 1, menu->header.template.plttOffset);

    // between each button
    for (i = 0; i < menu->header.numWindows - 1; ++i) {
        tileNum = menu->header.template.charOffset + 6;
        if ((menu->cursorPos == 0 && i == 0) || menu->cursorPos == i) {
            tileNum += 12;
        } else if ((menu->cursorPos == lastIndex && i == lastIndex - 1) || menu->cursorPos == i + 1) {
            tileNum += 18;
        }
        FillBgTilemapRect(menu->header.bgConfig, menu->header.template.bgId, tileNum, menu->x, menu->y + i * 3 + 3, 1, 1, menu->header.template.plttOffset);
        FillBgTilemapRect(menu->header.bgConfig, menu->header.template.bgId, tileNum + 1, menu->x + 1, menu->y + i * 3 + 3, menu->width, 1, menu->header.template.plttOffset);
        FillBgTilemapRect(menu->header.bgConfig, menu->header.template.bgId, tileNum + 2, menu->x + menu->width + 1, menu->y + i * 3 + 3, 1, 1, menu->header.template.plttOffset);
    }

    // left and right borders
    for (i = 0; i < menu->header.numWindows; ++i) {
        tileNum = menu->header.template.charOffset + 3;
        if (menu->cursorPos == i) {
            tileNum += 12;
        }
        FillBgTilemapRect(menu->header.bgConfig, menu->header.template.bgId, tileNum, menu->x, menu->y + i * 3 + 1, 1, 2, menu->header.template.plttOffset);
        FillBgTilemapRect(menu->header.bgConfig, menu->header.template.bgId, tileNum + 2, menu->x + menu->width + 1, menu->y + i * 3 + 1, 1, 2, menu->header.template.plttOffset);
    }
}

static void TouchscreenListMenu_PrintOptions(TouchscreenListMenu *menu) {
    int i;
    u32 x;
    u32 width;

    width = menu->width * 8;
    for (i = 0; i < menu->header.numWindows; ++i) {
        if (menu->header.template.centered == 0) {
            x = menu->header.template.xOffset;
        } else {
            x = (width - FontID_String_GetWidth(4, menu->header.listMenuItems[i].text, 0)) / 2;
        }
        AddTextPrinterParameterizedWithColor(&menu->windows[i], 4, menu->header.listMenuItems[i].text, x, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(1, 2, 3), NULL);
        ScheduleWindowCopyToVram(&menu->windows[i]);
    }
    ScheduleBgTilemapBufferTransfer(menu->header.bgConfig, menu->header.template.bgId);
}

static void TouchscreenListMenu_ToggleButtonPalette(TouchscreenListMenu *menu, u8 index, BOOL selected) {
    u32 x;
    u32 width;
    u32 textColor;
    u8 fillValue;
    if (selected) {
        textColor = MAKE_TEXT_COLOR(4, 5, 6);
        fillValue = 6;
    } else {
        textColor = MAKE_TEXT_COLOR(1, 2, 3);
        fillValue = 3;
    }

    width = menu->width * 8;
    if (menu->header.template.centered == 0) {
        x = menu->header.template.xOffset;
    } else {
        x = (width - FontID_String_GetWidth(4, menu->header.listMenuItems[index].text, 0)) / 2;
    }
    FillWindowPixelBuffer(&menu->windows[index], fillValue);
    AddTextPrinterParameterizedWithColor(&menu->windows[index], 4, menu->header.listMenuItems[index].text, x, 0, TEXT_SPEED_NOTRANSFER, textColor, NULL);
    ScheduleWindowCopyToVram(&menu->windows[index]);
}

static void TouchscreenListMenu_EraseTilemap(TouchscreenListMenu *menu) {
    for (int i = 0; i < menu->header.numWindows; ++i) {
        ClearWindowTilemapAndScheduleTransfer(&menu->windows[i]);
    }
    FillBgTilemapRect(menu->header.bgConfig, menu->header.template.bgId, 0, menu->x, menu->y, menu->width + 2, menu->header.numWindows * 3 + 1, menu->header.template.plttOffset);
    ScheduleBgTilemapBufferTransfer(menu->header.bgConfig, menu->header.template.bgId);
}

static void TouchscreenListMenu_DrawButtonsAndTransfer(TouchscreenListMenu *menu, u8 cursorPos) {
    TouchscreenListMenu_DrawButtons(menu);
    ScheduleBgTilemapBufferTransfer(menu->header.bgConfig, menu->header.template.bgId);
}

static int TouchscreenListMenu_HandleTouchInput(TouchscreenListMenu *menu, BOOL *flagRet) {
    int hitbox = TouchscreenHitbox_FindRectAtTouchNew(menu->touchscreenHitboxes);
    if (hitbox == -1) {
        *flagRet = FALSE;
        return -1;
    }
    *flagRet = TRUE;
    menu->cursorPos = hitbox;
    TouchscreenListMenu_ToggleButtonPalette(menu, hitbox, TRUE);
    TouchscreenListMenu_DrawButtons(menu);
    ScheduleBgTilemapBufferTransfer(menu->header.bgConfig, menu->header.template.bgId);
    menu->animActive = 1;
    menu->animTimer = 8;
    menu->selection = hitbox;
    menu->isTouch = 1;
    TouchscreenListMenu_PlaySE(menu, SEQ_SE_DP_SELECT);
    TouchscreenListMenu_InvokeCallback(menu, 2);
    return -1;
}

static int TouchscreenListMenu_HandleKeyInput(TouchscreenListMenu *menu) {
    u8 prev;

    if (gSystem.newKeys & (PAD_BUTTON_X | PAD_BUTTON_Y | PAD_KEY_UP | PAD_KEY_DOWN | PAD_KEY_LEFT | PAD_KEY_RIGHT | PAD_BUTTON_A | PAD_BUTTON_B)) {
        menu->isTouch = 0;
    }
    if (gSystem.newKeys & PAD_BUTTON_B) {
        TouchscreenListMenu_PlaySE(menu, SEQ_SE_DP_SELECT);
        TouchscreenListMenu_InvokeCallback(menu, 3);
        return LIST_CANCEL;
    }
    if (gSystem.newKeys & PAD_BUTTON_A) {
        TouchscreenListMenu_ToggleButtonPalette(menu, menu->cursorPos, TRUE);
        menu->animActive = 1;
        menu->animTimer = 8;
        menu->selection = menu->cursorPos;
        TouchscreenListMenu_PlaySE(menu, SEQ_SE_DP_SELECT);
        TouchscreenListMenu_InvokeCallback(menu, 2);
        return -1;
    }
    prev = menu->cursorPos;
    if (gSystem.newKeys & PAD_KEY_UP) {
        if (menu->header.template.wrapAround) {
            menu->cursorPos = (menu->cursorPos + (menu->header.numWindows - 1)) % menu->header.numWindows;
        } else if (menu->cursorPos > 0) {
            --menu->cursorPos;
        }
        if (prev != menu->cursorPos) {
            TouchscreenListMenu_PlaySE(menu, SEQ_SE_DP_SELECT);
            TouchscreenListMenu_InvokeCallback(menu, 1);
            TouchscreenListMenu_DrawButtonsAndTransfer(menu, menu->cursorPos);
        }
    }
    if (gSystem.newKeys & PAD_KEY_DOWN) {
        if (menu->header.template.wrapAround) {
            menu->cursorPos = (menu->cursorPos + 1) % menu->header.numWindows;
        } else if (menu->cursorPos < menu->header.numWindows - 1) {
            ++menu->cursorPos;
        }
        if (prev != menu->cursorPos) {
            TouchscreenListMenu_PlaySE(menu, SEQ_SE_DP_SELECT);
            TouchscreenListMenu_InvokeCallback(menu, 1);
            TouchscreenListMenu_DrawButtonsAndTransfer(menu, menu->cursorPos);
        }
    }

    return -1;
}

static void TouchscreenListMenu_PlaySE(TouchscreenListMenu *menu, u16 sndseq) {
    if (!menu->silent) {
        PlaySE(sndseq);
    }
}

static void TouchscreenListMenu_InvokeCallback(TouchscreenListMenu *menu, int event) {
    if (menu->callback != NULL) {
        menu->callback(menu, menu->cursorPos, menu->callbackArg, event);
    }
}
