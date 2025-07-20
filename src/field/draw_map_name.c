#include "field/draw_map_name.h"

#include <nitro/gx/gx_load.h>
#include <nitro/os/cache.h>

#include "global.h"

#include "constants/map_sections.h"

#include "msgdata/msg.naix"
#include "msgdata/msg/msg_0279.h"

#include "field_system.h"
#include "gf_gfx_loader.h"
#include "overlay_01.h" // FIXME: This is included for FieldSystem_DrawMapNameAnimation, is there a way to do this properly without causing dependency issues with field_system?
#include "text.h"
#include "unk_02068F84.h"

#define POSITION_STATE_INVALID    0
#define POSITION_STATE_DESCENDING 1
#define POSITION_STATE_ASCENDING  2
#define POSITION_STATE_INPLACE    3

static void PrintMapNameOnIcon(FieldDrawMapNameInfo *info, String *name);

static void LoadAreaIconPalette(void *data, u32 size, u32 offset) {
    DC_FlushRange(data, size * 32);
    GX_LoadBGPltt(data, offset * 32, size * 32);
}

static void FieldDrawMapName_SetupWindow(FieldDrawMapNameInfo *info) {
    AddWindowParameterized(info->bgConfig, &info->window, GF_BG_LYR_MAIN_3, 0, 0, 32, 5, 11, 0x197);
}

static void LoadAreaIconGraphics(FieldDrawMapNameInfo *info, u8 layer, u32 tileStart, u8 paletteOffset, u32 unused) {
    u8 memberNum = info->areaIcon * 2;

    info->charData = GfGfxLoader_GetCharData(NARC_data_gs_areawindow, memberNum, FALSE, &info->g2dCharData, HEAP_ID_4);
    BG_LoadCharTilesData(info->bgConfig, layer, info->g2dCharData->pRawData, info->g2dCharData->szByte, tileStart);

    NNSG2dPaletteData *g2dPaletteData;
    void *paletteData = GfGfxLoader_GetPlttData(NARC_data_gs_areawindow, memberNum + 1, &g2dPaletteData, HEAP_ID_4);
    LoadAreaIconPalette(g2dPaletteData->pRawData, 1, paletteOffset);
    Heap_Free(paletteData);
}

static void DrawAreaIcon(FieldDrawMapNameInfo *info, int namePixelWidth) {
    info->nameX = ((132 - namePixelWidth) / 2) + 4;

    LoadAreaIconGraphics(info, 3, 0x2D9, 11, 0);
    FillWindowPixelBuffer(&info->window, 0x0);

    for (int i = 0; i < 68; i++) {
        BlitBitmapRectToWindow(&info->window, info->g2dCharData->pRawData, (i + 1) * 8, 0, 8, 8, (i % 17) * 8, (i / 17) * 8, 8, 8);
    }

    CopyWindowToVram(&info->window);
    Heap_Free(info->charData);
}

static void FieldDrawMapName_ResetState(FieldDrawMapNameInfo *info) {
    info->onScreen = FALSE;
    info->positionState = POSITION_STATE_INVALID;
    info->task = NULL;
    info->layerY = 0;
    info->framesFullyOnscreen = 0;
    info->gonnaDrawAnother = FALSE;
    info->mapsec = MAPSEC_MYSTERY_ZONE;
    info->bgConfig = NULL;
}

static void FieldDrawMapName_Init(FieldDrawMapNameInfo *info, BgConfig *bgConfig) {
    FieldDrawMapName_ResetState(info);
    info->bgConfig = bgConfig;
}

static void Task_MapNameAndIcon(SysTask *task, FieldDrawMapNameInfo *info) {
    switch (info->positionState) {
    case POSITION_STATE_DESCENDING:
        info->layerY -= 4;
        if (info->layerY < 0) {
            info->layerY = 0;
        }

        BgSetPosTextAndCommit(info->bgConfig, GF_BG_LYR_MAIN_3, BG_POS_OP_SET_Y, info->layerY);
        if (info->layerY == 0) {
            info->framesFullyOnscreen = 0;
            info->positionState = POSITION_STATE_INPLACE;
            return;
        }

        break;
    case POSITION_STATE_INPLACE:
        if (++info->framesFullyOnscreen >= 60) {
            info->framesFullyOnscreen = 0;
            info->positionState = POSITION_STATE_ASCENDING;
        }
        break;
    case POSITION_STATE_ASCENDING:
        info->layerY += 4;
        if (info->layerY > 38) {
            info->layerY = 38;
        }

        BgSetPosTextAndCommit(info->bgConfig, GF_BG_LYR_MAIN_3, BG_POS_OP_SET_Y, info->layerY);

        if (info->layerY == 38) {
            if (info->gonnaDrawAnother) {
                info->gonnaDrawAnother = FALSE;
                DrawAreaIcon(info, sub_02068F84(info->mapsecMsgData, info->mapsec, info->mapNameString));
                PrintMapNameOnIcon(info, info->mapNameString);
                info->positionState = POSITION_STATE_DESCENDING;
                return;
            }
            FieldDrawMapName_Reset(info);
        }

        break;
    case POSITION_STATE_INVALID:
        break;
    }
}

static void PrintMapNameOnIcon(FieldDrawMapNameInfo *info, String *name) {
    AddTextPrinterParameterizedWithColor(&info->window, 0, name, info->nameX, 8, TEXT_SPEED_INSTANT, MAKE_TEXT_COLOR(1, 2, 0), NULL);
}

static void FieldDrawMapName_StartAscending(FieldDrawMapNameInfo *info) {
    info->positionState = POSITION_STATE_ASCENDING;
    info->framesFullyOnscreen = 0;
}

FieldDrawMapNameInfo *FieldDrawMapNameInfo_Create(BgConfig *bgConfig) {
    FieldDrawMapNameInfo *ret = AllocFromHeap(HEAP_ID_4, sizeof(FieldDrawMapNameInfo));
    ret->mapNameString = String_New(22, HEAP_ID_4);
    FieldDrawMapName_Init(ret, bgConfig);
    FieldDrawMapName_SetupWindow(ret);
    ret->mapsecMsgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0279_bin, HEAP_ID_4);
    return ret;
}

void FieldDrawMapNameInfo_Destroy(FieldDrawMapNameInfo *info) {
    DestroyMsgData(info->mapsecMsgData);
    RemoveWindow(&info->window);
    String_Delete(info->mapNameString);
    Heap_Free(info);
}

static void FieldDrawMapName_Start(FieldDrawMapNameInfo *info, u32 mapsec, u32 areaIcon) {
    info->mapsec = mapsec;
    if (!info->onScreen) {
        info->onScreen = TRUE;
        BgSetPosTextAndCommit(info->bgConfig, GF_BG_LYR_MAIN_3, BG_POS_OP_SET_Y, 38);
        info->layerY = 38;
        info->task = SysTask_CreateOnMainQueue((SysTaskFunc)Task_MapNameAndIcon, info, 0);
        info->positionState = POSITION_STATE_DESCENDING;
        int width = sub_02068F84(info->mapsecMsgData, info->mapsec, info->mapNameString);
        info->areaIcon = areaIcon;
        DrawAreaIcon(info, width);
        PrintMapNameOnIcon(info, info->mapNameString);
    } else {
        switch (info->positionState) {
        case POSITION_STATE_DESCENDING:
        case POSITION_STATE_INPLACE:
            FieldDrawMapName_StartAscending(info);
            info->gonnaDrawAnother = TRUE;
            info->areaIcon = areaIcon;
            break;
        case POSITION_STATE_ASCENDING:
            info->gonnaDrawAnother = TRUE;
            info->areaIcon = areaIcon;
            break;
        case POSITION_STATE_INVALID:
        default:
            GF_ASSERT(FALSE);
            break;
        }
    }
}

void FieldDrawMapName_Reset(FieldDrawMapNameInfo *info) {
    if (info->task != NULL) {
        SysTask_Destroy(info->task);
    }
    ClearWindowTilemapAndCopyToVram(&info->window);
    BgSetPosTextAndCommit(info->bgConfig, GF_BG_LYR_MAIN_3, BG_POS_OP_SET_Y, 0);
    FieldDrawMapName_Init(info, info->bgConfig);
}

void FieldSystem_DrawMapNameAnimation(FieldSystem *fieldSystem) {
    if (MapHeader_GetAreaIcon(fieldSystem->location->mapId) == 0 || MapHeader_IsInBuilding(fieldSystem->location->mapId)) {
        return;
    }

    u32 mapsec = MapHeader_GetMapSec(fieldSystem->location->mapId);
    u32 areaIcon = MapHeader_GetAreaIcon(fieldSystem->location->mapId);
    if (areaIcon != 0) { // We've already checked for this
        areaIcon--;
    }

    FieldDrawMapName_Start(fieldSystem->unk4->drawMapNameInfo, mapsec, areaIcon);
}
