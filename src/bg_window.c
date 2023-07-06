#include "bg_window.h"
#include "global.h"
#include "math_util.h"

static u8 TranslateGFBgModePairToGXScreenSize(enum GFBgScreenSize size, enum GFBgType type);
static void GetBgScreenDimensions(u32 screenSize, u8 *widthPtr, u8 *heightPtr);
static void Bg_SetPosText(Background *bg, enum BgPosAdjustOp op, fx32 value);
static void BgAffineReset(BgConfig *bgConfig, u8 bgId);
static void CopyOrUncompressTilemapData(const void *src, void *dest, u32 size);
static void LoadBgVramScr(u8 bgId, const void *data, u32 offset, u32 size);
static void BG_LoadCharPixelData(BgConfig *bgConfig, u8 bgId, const void *buffer, u32 size, u32 offset);
static void LoadBgVramChar(u8 bgId, const void *data, u32 offset, u32 size);
static u16 GetTileMapIndexFromCoords(u8 x, u8 y, u8 size, u8 mode);
static u16 GetSrcTileMapIndexFromCoords(u8 x, u8 y, u8 width, u8 height);
static void CopyToBgTilemapRectText(Background *bg, u8 destX, u8 destY, u8 destWidth, u8 destHeight, const u16 *buffer, u8 srcX, u8 srcY, u8 srcWidth, u8 srcHeight, u8 mode);
static void CopyBgTilemapRectAffine(Background *bg, u8 destX, u8 destY, u8 destWidth, u8 destHeight, const u8 *buffer, u8 srcX, u8 srcY, u8 srcWidth, u8 srcHeight, u8 mode);
static void FillBgTilemapRectText(Background *bg, u16 fillValue, u8 x, u8 y, u8 width, u8 height, u8 mode);
static void FillBgTilemapRectAffine(Background *bg, u8 fillValue, u8 x, u8 y, u8 width, u8 height);
static void BgClearTilemapBufferAndSchedule(BgConfig *bgConfig, u8 bgId);
static void Convert4bppTo8bppInternal(u8 *src4bpp, u32 size, u8 *dest8bpp, u8 paletteNum);
static fx32 GetBgVOffset(BgConfig *bgConfig, u8 bgId);
static u16 GetBgRotation(BgConfig *bgConfig, u8 bgId);
static void BlitBitmapRect8Bit(const Bitmap *src, const Bitmap *dest, u16 srcX, u16 srcY, u16 destX, u16 destY, u16 width, u16 height, u16 colorKey);
static void FillBitmapRect4bit(const Bitmap *surface, u16 x, u16 y, u16 width, u16 height, u8 fillValue);
static void FillBitmapRect8bit(const Bitmap *surface, u16 x, u16 y, u16 width, u16 height, u8 fillValue);
static void PutWindowTilemap_TextMode(Window *window);
static void PutWindowTilemap_AffineMode(Window *window);
static void ClearWindowTilemapText(Window *window);
static void ClearWindowTilemapAffine(Window *window);
static void CopyWindowToVram_TextMode(Window *window);
static void ScheduleWindowCopyToVram_TextMode(Window *window);
static void CopyWindowToVram_AffineMode(Window *window);
static void ScheduleWindowCopyToVram_AffineMode(Window *window);
static void ClearWindowTilemapAndCopyToVram_TextMode(Window *window);
static void ClearWindowTilemapAndScheduleTransfer_TextMode(Window *window);
static void ClearWindowTilemapAndCopyToVram_AffineMode(Window *window);
static void ClearWindowTilemapAndScheduleTransfer_AffineMode(Window *window);
static void ScrollWindow4bpp(Window *window, u8 direction, u8 y, u8 fillValue);
static void ScrollWindow8bpp(Window *window, u8 direction, u8 y, u8 fillValue);
static void BgConfig_HandleScheduledBufferTransfers(BgConfig *bgConfig);
static void BgConfig_HandleScheduledScrolls(BgConfig *bgConfig);
static void Bg_SetAffineScale(Background *bg, enum BgPosAdjustOp op, fx32 value);
static void ApplyFlipFlagsToTile(BgConfig *bgConfig, u8 flags, u8 *tile);

static const u8 sTilemapWidthByBufferSize[] = {
    [GF_BG_SCR_SIZE_128x128]   = 0x10,
    [GF_BG_SCR_SIZE_256x256]   = 0x20,
    [GF_BG_SCR_SIZE_256x512]   = 0x20,
    [GF_BG_SCR_SIZE_512x256]   = 0x20,
    [GF_BG_SCR_SIZE_512x512]   = 0x20,
    [GF_BG_SCR_SIZE_1024x1024] = 0x20,
};

static void (*const sScheduleWindowCopyToVramFuncs[])(Window *window) = {
    ScheduleWindowCopyToVram_TextMode,
    ScheduleWindowCopyToVram_AffineMode,
    ScheduleWindowCopyToVram_TextMode,
};

static void (*const sClearWindowTilemapAndCopyToVramFuncs[])(Window *) = {
    ClearWindowTilemapAndCopyToVram_TextMode,
    ClearWindowTilemapAndCopyToVram_AffineMode,
    ClearWindowTilemapAndCopyToVram_TextMode,
};

static void (*const sClearWindowTilemapAndScheduleTransferFuncs[])(Window *) = {
    ClearWindowTilemapAndScheduleTransfer_TextMode,
    ClearWindowTilemapAndScheduleTransfer_AffineMode,
    ClearWindowTilemapAndScheduleTransfer_TextMode,
};

static void (*const sPutWindowTilemapFuncs[GF_BG_TYPE_MAX])(Window *window) = {
    PutWindowTilemap_TextMode,
    PutWindowTilemap_AffineMode,
    PutWindowTilemap_TextMode,
};

static void (*const sCopyWindowToVramFuncs[GF_BG_TYPE_MAX])(Window *window) = {
    CopyWindowToVram_TextMode,
    CopyWindowToVram_AffineMode,
    CopyWindowToVram_TextMode,
};

static void (*const sClearWindowTilemapFuncs[GF_BG_TYPE_MAX])(Window *window) = {
    ClearWindowTilemapText,
    ClearWindowTilemapAffine,
    ClearWindowTilemapText,
};

// Make a new BgConfig object, which manages the
// eight background layers (four on each screen).
BgConfig *BgConfig_Alloc(HeapID heapId) {
    BgConfig *ret = AllocFromHeap(heapId, sizeof(BgConfig));
    memset(ret, 0, sizeof(BgConfig));
    ret->heapId = heapId;
    ret->scrollScheduled = 0;         // redundant to above memset
    ret->bufferTransferScheduled = 0; // redundant to above memset
    return ret;
}

HeapID BgConfig_GetHeapId(BgConfig *bgConfig) {
    return bgConfig->heapId;
}

void SetBothScreensModesAndDisable(const GraphicsModes *modes) {
    GX_SetGraphicsMode(modes->dispMode, modes->bgMode, modes->_2d3dMode);
    GXS_SetGraphicsMode(modes->subMode);
    GX_SetBGScrOffset(GX_BGSCROFFSET_0x00000);
    GX_SetBGCharOffset(GX_BGCHAROFFSET_0x00000);

    GX_DisableEngineALayers();
    GX_DisableEngineBLayers();
}

void SetScreenModeAndDisable(const struct GraphicsModes *gfxModes, enum GFScreen screen) {
    if (screen == SCREEN_MAIN) {
        GX_SetGraphicsMode(gfxModes->dispMode, gfxModes->bgMode, gfxModes->_2d3dMode);
        GX_DisableEngineALayers();
    } else {
        GXS_SetGraphicsMode(gfxModes->subMode);
        GX_DisableEngineBLayers();
    }
}

void InitBgFromTemplateEx(BgConfig *bgConfig, u8 bgId, const BgTemplate *template, u8 bgMode, GXLayerToggle enable) {
    u8 screenSize = TranslateGFBgModePairToGXScreenSize((enum GFBgScreenSize)template->size, (enum GFBgType)bgMode);

    switch (bgId) {
        case GF_BG_LYR_MAIN_0:
            GX_EngineAToggleLayers(GF_BG_LYR_MAIN_0_F, enable);
            G2_SetBG0Control((GXBGScrSizeText)screenSize, (GXBGColorMode)template->colorMode, (GXBGScrBase)template->screenBase, (GXBGCharBase)template->charBase, (GXBGExtPltt)template->bgExtPltt);
            G2_SetBG0Priority(template->priority);
            G2_BG0Mosaic(template->mosaic);
            break;

        case GF_BG_LYR_MAIN_1:
            GX_EngineAToggleLayers(GF_BG_LYR_MAIN_1_F, enable);
            G2_SetBG1Control((GXBGScrSizeText)screenSize, (GXBGColorMode)template->colorMode, (GXBGScrBase)template->screenBase, (GXBGCharBase)template->charBase, (GXBGExtPltt)template->bgExtPltt);
            G2_SetBG1Priority(template->priority);
            G2_BG1Mosaic(template->mosaic);
            break;

        case GF_BG_LYR_MAIN_2:
            GX_EngineAToggleLayers(GF_BG_LYR_MAIN_2_F, enable);
            switch (bgMode) {
                default:
                case GF_BG_TYPE_TEXT:
                    G2_SetBG2ControlText((GXBGScrSizeText)screenSize, (GXBGColorMode)template->colorMode, (GXBGScrBase)template->screenBase, (GXBGCharBase)template->charBase);
                    break;
                case GF_BG_TYPE_AFFINE:
                    G2_SetBG2ControlAffine((GXBGScrSizeAffine)screenSize, (GXBGAreaOver)template->areaOver, (GXBGScrBase)template->screenBase, (GXBGCharBase)template->charBase);
                    break;
                case GF_BG_TYPE_256x16PLTT:
                    G2_SetBG2Control256x16Pltt((GXBGScrSize256x16Pltt)screenSize, (GXBGAreaOver)template->areaOver, (GXBGScrBase)template->screenBase, (GXBGCharBase)template->charBase);
                    break;
            }
            G2_SetBG2Priority(template->priority);
            G2_BG2Mosaic(template->mosaic);
            break;

        case GF_BG_LYR_MAIN_3:
            GX_EngineAToggleLayers(GF_BG_LYR_MAIN_3_F, enable);
            switch (bgMode) {
                default:
                case GF_BG_TYPE_TEXT:
                    G2_SetBG3ControlText((GXBGScrSizeText)screenSize, (GXBGColorMode)template->colorMode, (GXBGScrBase)template->screenBase, (GXBGCharBase)template->charBase);
                    break;
                case GF_BG_TYPE_AFFINE:
                    G2_SetBG3ControlAffine((GXBGScrSizeAffine)screenSize, (GXBGAreaOver)template->areaOver, (GXBGScrBase)template->screenBase, (GXBGCharBase)template->charBase);
                    break;
                case GF_BG_TYPE_256x16PLTT:
                    G2_SetBG3Control256x16Pltt((GXBGScrSize256x16Pltt)screenSize, (GXBGAreaOver)template->areaOver, (GXBGScrBase)template->screenBase, (GXBGCharBase)template->charBase);
                    break;
            }
            G2_SetBG3Priority(template->priority);
            G2_BG3Mosaic(template->mosaic);
            break;

        case GF_BG_LYR_SUB_0:
            GX_EngineBToggleLayers(GF_BG_LYR_SUB_0_F, enable);
            G2S_SetBG0Control((GXBGScrSizeText)screenSize, (GXBGColorMode)template->colorMode, (GXBGScrBase)template->screenBase, (GXBGCharBase)template->charBase, (GXBGExtPltt)template->bgExtPltt);
            G2S_SetBG0Priority(template->priority);
            G2S_BG0Mosaic(template->mosaic);
            break;

        case GF_BG_LYR_SUB_1:
            GX_EngineBToggleLayers(GF_BG_LYR_SUB_1_F, enable);
            G2S_SetBG1Control((GXBGScrSizeText)screenSize, (GXBGColorMode)template->colorMode, (GXBGScrBase)template->screenBase, (GXBGCharBase)template->charBase, (GXBGExtPltt)template->bgExtPltt);
            G2S_SetBG1Priority(template->priority);
            G2S_BG1Mosaic(template->mosaic);
            break;

        case GF_BG_LYR_SUB_2:
            GX_EngineBToggleLayers(GF_BG_LYR_SUB_2_F, enable);
            switch (bgMode) {
                default:
                case GF_BG_TYPE_TEXT:
                    G2S_SetBG2ControlText((GXBGScrSizeText)screenSize, (GXBGColorMode)template->colorMode, (GXBGScrBase)template->screenBase, (GXBGCharBase)template->charBase);
                    break;
                case GF_BG_TYPE_AFFINE:
                    G2S_SetBG2ControlAffine((GXBGScrSizeAffine)screenSize, (GXBGAreaOver)template->areaOver, (GXBGScrBase)template->screenBase, (GXBGCharBase)template->charBase);
                    break;
                case GF_BG_TYPE_256x16PLTT:
                    G2S_SetBG2Control256x16Pltt((GXBGScrSize256x16Pltt)screenSize, (GXBGAreaOver)template->areaOver, (GXBGScrBase)template->screenBase, (GXBGCharBase)template->charBase);
                    break;
            }
            G2S_SetBG2Priority(template->priority);
            G2S_BG2Mosaic(template->mosaic);
            break;

        case GF_BG_LYR_SUB_3:
            GX_EngineBToggleLayers(GF_BG_LYR_SUB_3_F, enable);
            switch (bgMode) {
                default:
                case GF_BG_TYPE_TEXT:
                    G2S_SetBG3ControlText((GXBGScrSizeText)screenSize, (GXBGColorMode)template->colorMode, (GXBGScrBase)template->screenBase, (GXBGCharBase)template->charBase);
                    break;
                case GF_BG_TYPE_AFFINE:
                    G2S_SetBG3ControlAffine((GXBGScrSizeAffine)screenSize, (GXBGAreaOver)template->areaOver, (GXBGScrBase)template->screenBase, (GXBGCharBase)template->charBase);
                    break;
                case GF_BG_TYPE_256x16PLTT:
                    G2S_SetBG3Control256x16Pltt((GXBGScrSize256x16Pltt)screenSize, (GXBGAreaOver)template->areaOver, (GXBGScrBase)template->screenBase, (GXBGCharBase)template->charBase);
                    break;
            }
            G2S_SetBG3Priority(template->priority);
            G2S_BG3Mosaic(template->mosaic);
            break;
    }

    bgConfig->bgs[bgId].rotation = 0;
    bgConfig->bgs[bgId].xScale = FX32_ONE;
    bgConfig->bgs[bgId].yScale = FX32_ONE;
    bgConfig->bgs[bgId].centerX = 0;
    bgConfig->bgs[bgId].centerY = 0;

    if (template->bufferSize != 0) {
        bgConfig->bgs[bgId].tilemapBuffer = AllocFromHeap(bgConfig->heapId, template->bufferSize);

        MI_CpuClear16(bgConfig->bgs[bgId].tilemapBuffer, template->bufferSize);

        bgConfig->bgs[bgId].bufferSize = template->bufferSize;
        bgConfig->bgs[bgId].baseTile = template->baseTile;
    } else {
        bgConfig->bgs[bgId].tilemapBuffer = NULL;
        bgConfig->bgs[bgId].bufferSize = 0;
        bgConfig->bgs[bgId].baseTile = 0;
    }

    bgConfig->bgs[bgId].size = template->size;
    bgConfig->bgs[bgId].mode = bgMode;
    bgConfig->bgs[bgId].colorMode = template->colorMode;

    if (bgMode == GF_BG_TYPE_TEXT && template->colorMode == GX_BG_COLORMODE_16) {
        bgConfig->bgs[bgId].tileSize = 0x20;
    } else {
        bgConfig->bgs[bgId].tileSize = 0x40;
    }

    BgSetPosTextAndCommit(bgConfig, bgId, BG_POS_OP_SET_X, template->x);
    BgSetPosTextAndCommit(bgConfig, bgId, BG_POS_OP_SET_Y, template->y);
}

void InitBgFromTemplate(BgConfig *bgConfig, u8 bgId, const BgTemplate *template, u8 bgMode) {
    InitBgFromTemplateEx(bgConfig, bgId, template, bgMode, GX_LAYER_TOGGLE_ON);
}

void SetBgControlParam(BgConfig *config, u8 bgId, enum GFBgCntSet attr, u8 value) {
    u16 screenSize;
    if (attr == GF_BG_CNT_SET_COLOR_MODE) {
        config->bgs[bgId].colorMode = value;
        if (config->bgs[bgId].mode == GF_BG_TYPE_TEXT && config->bgs[bgId].colorMode == GX_BG_COLORMODE_16) {
            config->bgs[bgId].tileSize = 0x20;
        } else {
            config->bgs[bgId].tileSize = 0x40;
        }
    } else if (attr == GF_BG_CNT_SET_SCREEN_SIZE) {
        config->bgs[bgId].mode = value;
        screenSize = TranslateGFBgModePairToGXScreenSize((enum GFBgScreenSize)config->bgs[bgId].size, (enum GFBgType)value);
        if (value == GF_BG_TYPE_TEXT && config->bgs[bgId].colorMode == GX_BG_COLORMODE_16) {
            config->bgs[bgId].tileSize = 0x20;
        } else {
            config->bgs[bgId].tileSize = 0x40;
        }
    }

    switch (bgId) {
        case GF_BG_LYR_MAIN_0:
            GXBg01Control bg0cnt = G2_GetBG0Control();
            if (attr == GF_BG_CNT_SET_SCREEN_BASE) {
                bg0cnt.screenBase = value;
            } else if (attr == GF_BG_CNT_SET_CHAR_BASE) {
                bg0cnt.charBase = value;
            } else if (attr == GF_BG_CNT_SET_SCREEN_SIZE) {
                bg0cnt.screenSize = screenSize;
            }

            G2_SetBG0Control((GXBGScrSizeText)bg0cnt.screenSize, (GXBGColorMode)config->bgs[bgId].colorMode, (GXBGScrBase)bg0cnt.screenBase, (GXBGCharBase)bg0cnt.charBase, (GXBGExtPltt)bg0cnt.bgExtPltt);
            break;
        case GF_BG_LYR_MAIN_1:
            GXBg01Control bg1cnt = G2_GetBG1Control();
            if (attr == GF_BG_CNT_SET_SCREEN_BASE) {
                bg1cnt.screenBase = value;
            } else if (attr == GF_BG_CNT_SET_CHAR_BASE) {
                bg1cnt.charBase = value;
            } else if (attr == GF_BG_CNT_SET_SCREEN_SIZE) {
                bg1cnt.screenSize = screenSize;
            }

            G2_SetBG1Control((GXBGScrSizeText)bg1cnt.screenSize, (GXBGColorMode)config->bgs[bgId].colorMode, (GXBGScrBase)bg1cnt.screenBase, (GXBGCharBase)bg1cnt.charBase, (GXBGExtPltt)bg1cnt.bgExtPltt);
            break;
        case GF_BG_LYR_MAIN_2:
            switch (config->bgs[bgId].mode) {
                default:
                case GF_BG_TYPE_TEXT:
                    GXBg23ControlText bg2cnt_tx = G2_GetBG2ControlText();
                    if (attr == GF_BG_CNT_SET_SCREEN_BASE) {
                        bg2cnt_tx.screenBase = value;
                    } else if (attr == GF_BG_CNT_SET_CHAR_BASE) {
                        bg2cnt_tx.charBase = value;
                    } else if (attr == GF_BG_CNT_SET_SCREEN_SIZE) {
                        bg2cnt_tx.screenSize = screenSize;
                    }

                    G2_SetBG2ControlText((GXBGScrSizeText)bg2cnt_tx.screenSize, (GXBGColorMode)config->bgs[bgId].colorMode, (GXBGScrBase)bg2cnt_tx.screenBase, (GXBGCharBase)bg2cnt_tx.charBase);
                    break;
                case GF_BG_TYPE_AFFINE:
                    GXBg23ControlAffine bg2cnt_aff = G2_GetBG2ControlAffine();
                    if (attr == GF_BG_CNT_SET_SCREEN_BASE) {
                        bg2cnt_aff.screenBase = value;
                    } else if (attr == GF_BG_CNT_SET_CHAR_BASE) {
                        bg2cnt_aff.charBase = value;
                    } else if (attr == GF_BG_CNT_SET_SCREEN_SIZE) {
                        bg2cnt_aff.screenSize = screenSize;
                    }

                    G2_SetBG2ControlAffine((GXBGScrSizeAffine)bg2cnt_aff.screenSize, (GXBGAreaOver)bg2cnt_aff.areaOver, (GXBGScrBase)bg2cnt_aff.screenBase, (GXBGCharBase)bg2cnt_aff.charBase);
                    break;
                case GF_BG_TYPE_256x16PLTT:
                    GXBg23Control256x16Pltt bg2cnt_256x16pltt = G2_GetBG2Control256x16Pltt();
                    if (attr == GF_BG_CNT_SET_SCREEN_BASE) {
                        bg2cnt_256x16pltt.screenBase = value;
                    } else if (attr == GF_BG_CNT_SET_CHAR_BASE) {
                        bg2cnt_256x16pltt.charBase = value;
                    } else if (attr == GF_BG_CNT_SET_SCREEN_SIZE) {
                        bg2cnt_256x16pltt.screenSize = screenSize;
                    }

                    G2_SetBG2Control256x16Pltt((GXBGScrSize256x16Pltt)bg2cnt_256x16pltt.screenSize, (GXBGAreaOver)bg2cnt_256x16pltt.areaOver, (GXBGScrBase)bg2cnt_256x16pltt.screenBase, (GXBGCharBase)bg2cnt_256x16pltt.charBase);
                    break;
            }
            break;
        case GF_BG_LYR_MAIN_3:
            switch (config->bgs[bgId].mode) {
                default:
                case GF_BG_TYPE_TEXT:
                    GXBg23ControlText bg3cnt_tx = G2_GetBG3ControlText();
                    if (attr == GF_BG_CNT_SET_SCREEN_BASE) {
                        bg3cnt_tx.screenBase = value;
                    } else if (attr == GF_BG_CNT_SET_CHAR_BASE) {
                        bg3cnt_tx.charBase = value;
                    } else if (attr == GF_BG_CNT_SET_SCREEN_SIZE) {
                        bg3cnt_tx.screenSize = screenSize;
                    }

                    G2_SetBG3ControlText((GXBGScrSizeText)bg3cnt_tx.screenSize, (GXBGColorMode)config->bgs[bgId].colorMode, (GXBGScrBase)bg3cnt_tx.screenBase, (GXBGCharBase)bg3cnt_tx.charBase);
                    break;
                case GF_BG_TYPE_AFFINE:
                    GXBg23ControlAffine bg3cnt_aff = G2_GetBG3ControlAffine();
                    if (attr == GF_BG_CNT_SET_SCREEN_BASE) {
                        bg3cnt_aff.screenBase = value;
                    } else if (attr == GF_BG_CNT_SET_CHAR_BASE) {
                        bg3cnt_aff.charBase = value;
                    } else if (attr == GF_BG_CNT_SET_SCREEN_SIZE) {
                        bg3cnt_aff.screenSize = screenSize;
                    }

                    G2_SetBG3ControlAffine((GXBGScrSizeAffine)bg3cnt_aff.screenSize, (GXBGAreaOver)bg3cnt_aff.areaOver, (GXBGScrBase)bg3cnt_aff.screenBase, (GXBGCharBase)bg3cnt_aff.charBase);
                    break;
                case GF_BG_TYPE_256x16PLTT:
                    GXBg23Control256x16Pltt bg3cnt_256x16pltt = G2_GetBG3Control256x16Pltt();
                    if (attr == GF_BG_CNT_SET_SCREEN_BASE) {
                        bg3cnt_256x16pltt.screenBase = value;
                    } else if (attr == GF_BG_CNT_SET_CHAR_BASE) {
                        bg3cnt_256x16pltt.charBase = value;
                    } else if (attr == GF_BG_CNT_SET_SCREEN_SIZE) {
                        bg3cnt_256x16pltt.screenSize = screenSize;
                    }

                    G2_SetBG3Control256x16Pltt((GXBGScrSize256x16Pltt)bg3cnt_256x16pltt.screenSize, (GXBGAreaOver)bg3cnt_256x16pltt.areaOver, (GXBGScrBase)bg3cnt_256x16pltt.screenBase, (GXBGCharBase)bg3cnt_256x16pltt.charBase);
                    break;
            }
            break;
        case GF_BG_LYR_SUB_0:
            GXBg01Control bg0cntsub = G2S_GetBG0Control();
            if (attr == GF_BG_CNT_SET_SCREEN_BASE) {
                bg0cntsub.screenBase = value;
            } else if (attr == GF_BG_CNT_SET_CHAR_BASE) {
                bg0cntsub.charBase = value;
            } else if (attr == GF_BG_CNT_SET_SCREEN_SIZE) {
                bg0cntsub.screenSize = screenSize;
            }

            G2S_SetBG0Control((GXBGScrSizeText)bg0cntsub.screenSize, (GXBGColorMode)config->bgs[bgId].colorMode, (GXBGScrBase)bg0cntsub.screenBase, (GXBGCharBase)bg0cntsub.charBase, (GXBGExtPltt)bg0cntsub.bgExtPltt);
            break;
        case GF_BG_LYR_SUB_1:
            GXBg01Control bg1cntsub = G2S_GetBG1Control();
            if (attr == GF_BG_CNT_SET_SCREEN_BASE) {
                bg1cntsub.screenBase = value;
            } else if (attr == GF_BG_CNT_SET_CHAR_BASE) {
                bg1cntsub.charBase = value;
            } else if (attr == GF_BG_CNT_SET_SCREEN_SIZE) {
                bg1cntsub.screenSize = screenSize;
            }

            G2S_SetBG1Control((GXBGScrSizeText)bg1cntsub.screenSize, (GXBGColorMode)config->bgs[bgId].colorMode, (GXBGScrBase)bg1cntsub.screenBase, (GXBGCharBase)bg1cntsub.charBase, (GXBGExtPltt)bg1cntsub.bgExtPltt);
            break;
        case GF_BG_LYR_SUB_2:
            switch (config->bgs[bgId].mode) {
                default:
                case GF_BG_TYPE_TEXT:
                    GXBg23ControlText bg2cntsub_tx = G2S_GetBG2ControlText();
                    if (attr == GF_BG_CNT_SET_SCREEN_BASE) {
                        bg2cntsub_tx.screenBase = value;
                    } else if (attr == GF_BG_CNT_SET_CHAR_BASE) {
                        bg2cntsub_tx.charBase = value;
                    } else if (attr == GF_BG_CNT_SET_SCREEN_SIZE) {
                        bg2cntsub_tx.screenSize = screenSize;
                    }

                    G2S_SetBG2ControlText((GXBGScrSizeText)bg2cntsub_tx.screenSize, (GXBGColorMode)config->bgs[bgId].colorMode, (GXBGScrBase)bg2cntsub_tx.screenBase, (GXBGCharBase)bg2cntsub_tx.charBase);
                    break;
                case GF_BG_TYPE_AFFINE:
                    GXBg23ControlAffine bg2cntsub_aff = G2S_GetBG2ControlAffine();
                    if (attr == GF_BG_CNT_SET_SCREEN_BASE) {
                        bg2cntsub_aff.screenBase = value;
                    } else if (attr == GF_BG_CNT_SET_CHAR_BASE) {
                        bg2cntsub_aff.charBase = value;
                    } else if (attr == GF_BG_CNT_SET_SCREEN_SIZE) {
                        bg2cntsub_aff.screenSize = screenSize;
                    }

                    G2S_SetBG2ControlAffine((GXBGScrSizeAffine)bg2cntsub_aff.screenSize, (GXBGAreaOver)bg2cntsub_aff.areaOver, (GXBGScrBase)bg2cntsub_aff.screenBase, (GXBGCharBase)bg2cntsub_aff.charBase);
                    break;
                case GF_BG_TYPE_256x16PLTT:
                    GXBg23Control256x16Pltt bg2cntsub_256x16pltt = G2S_GetBG2Control256x16Pltt();
                    if (attr == GF_BG_CNT_SET_SCREEN_BASE) {
                        bg2cntsub_256x16pltt.screenBase = value;
                    } else if (attr == GF_BG_CNT_SET_CHAR_BASE) {
                        bg2cntsub_256x16pltt.charBase = value;
                    } else if (attr == GF_BG_CNT_SET_SCREEN_SIZE) {
                        bg2cntsub_256x16pltt.screenSize = screenSize;
                    }

                    G2S_SetBG2Control256x16Pltt((GXBGScrSize256x16Pltt)bg2cntsub_256x16pltt.screenSize, (GXBGAreaOver)bg2cntsub_256x16pltt.areaOver, (GXBGScrBase)bg2cntsub_256x16pltt.screenBase, (GXBGCharBase)bg2cntsub_256x16pltt.charBase);
                    break;
            }
            break;
        case GF_BG_LYR_SUB_3:
            switch (config->bgs[bgId].mode) {
                default:
                case GF_BG_TYPE_TEXT:
                    GXBg23ControlText bg3cntsub_tx = G2S_GetBG3ControlText();
                    if (attr == GF_BG_CNT_SET_SCREEN_BASE) {
                        bg3cntsub_tx.screenBase = value;
                    } else if (attr == GF_BG_CNT_SET_CHAR_BASE) {
                        bg3cntsub_tx.charBase = value;
                    } else if (attr == GF_BG_CNT_SET_SCREEN_SIZE) {
                        bg3cntsub_tx.screenSize = screenSize;
                    }

                    G2S_SetBG3ControlText((GXBGScrSizeText)bg3cntsub_tx.screenSize, (GXBGColorMode)config->bgs[bgId].colorMode, (GXBGScrBase)bg3cntsub_tx.screenBase, (GXBGCharBase)bg3cntsub_tx.charBase);
                    break;
                case GF_BG_TYPE_AFFINE:
                    GXBg23ControlAffine bg3cntsub_aff = G2S_GetBG3ControlAffine();
                    if (attr == GF_BG_CNT_SET_SCREEN_BASE) {
                        bg3cntsub_aff.screenBase = value;
                    } else if (attr == GF_BG_CNT_SET_CHAR_BASE) {
                        bg3cntsub_aff.charBase = value;
                    } else if (attr == GF_BG_CNT_SET_SCREEN_SIZE) {
                        bg3cntsub_aff.screenSize = screenSize;
                    }

                    G2S_SetBG3ControlAffine((GXBGScrSizeAffine)bg3cntsub_aff.screenSize, (GXBGAreaOver)bg3cntsub_aff.areaOver, (GXBGScrBase)bg3cntsub_aff.screenBase, (GXBGCharBase)bg3cntsub_aff.charBase);
                    break;
                case GF_BG_TYPE_256x16PLTT:
                    GXBg23Control256x16Pltt bg3cntsub_256x16pltt = G2S_GetBG3Control256x16Pltt();
                    if (attr == GF_BG_CNT_SET_SCREEN_BASE) {
                        bg3cntsub_256x16pltt.screenBase = value;
                    } else if (attr == GF_BG_CNT_SET_CHAR_BASE) {
                        bg3cntsub_256x16pltt.charBase = value;
                    } else if (attr == GF_BG_CNT_SET_SCREEN_SIZE) {
                        bg3cntsub_256x16pltt.screenSize = screenSize;
                    }

                    G2S_SetBG3Control256x16Pltt((GXBGScrSize256x16Pltt)bg3cntsub_256x16pltt.screenSize, (GXBGAreaOver)bg3cntsub_256x16pltt.areaOver, (GXBGScrBase)bg3cntsub_256x16pltt.screenBase, (GXBGCharBase)bg3cntsub_256x16pltt.charBase);
                    break;
            }
            break;
    }
}

static u8 TranslateGFBgModePairToGXScreenSize(enum GFBgScreenSize size, enum GFBgType type) {
    switch (type) {
        case GF_BG_TYPE_TEXT:
            if (size == GF_BG_SCR_SIZE_256x256) {
                return GX_BG_SCRSIZE_TEXT_256x256;
            } else if (size == GF_BG_SCR_SIZE_256x512) {
                return GX_BG_SCRSIZE_TEXT_256x512;
            } else if (size == GF_BG_SCR_SIZE_512x256) {
                return GX_BG_SCRSIZE_TEXT_512x256;
            } else if (size == GF_BG_SCR_SIZE_512x512) {
                return GX_BG_SCRSIZE_TEXT_512x512;
            }
            break;

        case GF_BG_TYPE_AFFINE:
            if (size == GF_BG_SCR_SIZE_128x128) {
                return GX_BG_SCRSIZE_AFFINE_128x128;
            } else if (size == GF_BG_SCR_SIZE_256x256) {
                return GX_BG_SCRSIZE_AFFINE_256x256;
            } else if (size == GF_BG_SCR_SIZE_512x512) {
                return GX_BG_SCRSIZE_AFFINE_512x512;
            } else if (size == GF_BG_SCR_SIZE_1024x1024) {
                return GX_BG_SCRSIZE_AFFINE_1024x1024;
            }
            break;

        case GF_BG_TYPE_256x16PLTT:
            if (size == GF_BG_SCR_SIZE_128x128) {
                return GX_BG_SCRSIZE_256x16PLTT_128x128;
            } else if (size == GF_BG_SCR_SIZE_256x256) {
                return GX_BG_SCRSIZE_256x16PLTT_256x256;
            } else if (size == GF_BG_SCR_SIZE_512x512) {
                return GX_BG_SCRSIZE_256x16PLTT_512x512;
            } else if (size == GF_BG_SCR_SIZE_1024x1024) {
                return GX_BG_SCRSIZE_256x16PLTT_1024x1024;
            }
            break;
    }

    return GX_BG_SCRSIZE_TEXT_256x256; // GX_BG_SCRSIZE_AFFINE_128x128; GX_BG_SCRSIZE_256x16PLTT_128x128;
}

static void GetBgScreenDimensions(u32 screenSize, u8 *widthPtr, u8 *heightPtr) {
    switch (screenSize) {
        case GF_BG_SCR_SIZE_128x128:
            *widthPtr = 0x10;
            *heightPtr = 0x10;
            break;
        case GF_BG_SCR_SIZE_256x256:
            *widthPtr = 0x20;
            *heightPtr = 0x20;
            break;
        case GF_BG_SCR_SIZE_256x512:
            *widthPtr = 0x20;
            *heightPtr = 0x40;
            break;
        case GF_BG_SCR_SIZE_512x256:
            *widthPtr = 0x40;
            *heightPtr = 0x20;
            break;
        case GF_BG_SCR_SIZE_512x512:
            *widthPtr = 0x40;
            *heightPtr = 0x40;
            break;
        case GF_BG_SCR_SIZE_1024x1024:
            *widthPtr = 0x80;
            *heightPtr = 0x80;
            break;
    }
}

void FreeBgTilemapBuffer(BgConfig *bgConfig, u8 bgId) {
    if (bgConfig->bgs[bgId].tilemapBuffer != NULL) {
        FreeToHeap(bgConfig->bgs[bgId].tilemapBuffer);
        bgConfig->bgs[bgId].tilemapBuffer = NULL;
    }
}

void SetBgPriority(u8 bgId, u16 priority) {
    switch (bgId) {
        case GF_BG_LYR_MAIN_0:
            G2_SetBG0Priority(priority);
            break;
        case GF_BG_LYR_MAIN_1:
            G2_SetBG1Priority(priority);
            break;
        case GF_BG_LYR_MAIN_2:
            G2_SetBG2Priority(priority);
            break;
        case GF_BG_LYR_MAIN_3:
            G2_SetBG3Priority(priority);
            break;
        case GF_BG_LYR_SUB_0:
            G2S_SetBG0Priority(priority);
            break;
        case GF_BG_LYR_SUB_1:
            G2S_SetBG1Priority(priority);
            break;
        case GF_BG_LYR_SUB_2:
            G2S_SetBG2Priority(priority);
            break;
        case GF_BG_LYR_SUB_3:
            G2S_SetBG3Priority(priority);
            break;
    }
}

void ToggleBgLayer(u8 bgId, GXLayerToggle toggle) {
    switch (bgId) {
        case GF_BG_LYR_MAIN_0:
            GX_EngineAToggleLayers(GF_BG_LYR_MAIN_0_F, toggle);
            break;
        case GF_BG_LYR_MAIN_1:
            GX_EngineAToggleLayers(GF_BG_LYR_MAIN_1_F, toggle);
            break;
        case GF_BG_LYR_MAIN_2:
            GX_EngineAToggleLayers(GF_BG_LYR_MAIN_2_F, toggle);
            break;
        case GF_BG_LYR_MAIN_3:
            GX_EngineAToggleLayers(GF_BG_LYR_MAIN_3_F, toggle);
            break;
        case GF_BG_LYR_SUB_0:
            GX_EngineBToggleLayers(GF_BG_LYR_SUB_0_F, toggle);
            break;
        case GF_BG_LYR_SUB_1:
            GX_EngineBToggleLayers(GF_BG_LYR_SUB_1_F, toggle);
            break;
        case GF_BG_LYR_SUB_2:
            GX_EngineBToggleLayers(GF_BG_LYR_SUB_2_F, toggle);
            break;
        case GF_BG_LYR_SUB_3:
            GX_EngineBToggleLayers(GF_BG_LYR_SUB_3_F, toggle);
            break;
    }
}

void BgSetPosTextAndCommit(BgConfig *bgConfig, u8 bgId, enum BgPosAdjustOp op, fx32 val) {
    Bg_SetPosText(&bgConfig->bgs[bgId], op, val);

    u32 x = (u32)bgConfig->bgs[bgId].hOffset;
    u32 y = (u32)bgConfig->bgs[bgId].vOffset;
    switch (bgId) {
        case GF_BG_LYR_MAIN_0:
            G2_SetBG0Offset(x, y);
            break;
        case GF_BG_LYR_MAIN_1:
            G2_SetBG1Offset(x, y);
            break;
        case GF_BG_LYR_MAIN_2:
            if (bgConfig->bgs[GF_BG_LYR_MAIN_2].mode == 0) {
                G2_SetBG2Offset(x, y);
            } else {
                BgAffineReset(bgConfig, GF_BG_LYR_MAIN_2);
            }

            break;
        case GF_BG_LYR_MAIN_3:
            if (bgConfig->bgs[GF_BG_LYR_MAIN_3].mode == 0) {
                G2_SetBG3Offset(x, y);
            } else {
                BgAffineReset(bgConfig, GF_BG_LYR_MAIN_3);
            }
            break;
        case GF_BG_LYR_SUB_0:
            G2S_SetBG0Offset(x, y);
            break;
        case GF_BG_LYR_SUB_1:
            G2S_SetBG1Offset(x, y);
            break;
        case GF_BG_LYR_SUB_2:
            if (bgConfig->bgs[GF_BG_LYR_SUB_2].mode == 0) {
                G2S_SetBG2Offset(x, y);
            } else {
                BgAffineReset(bgConfig, GF_BG_LYR_SUB_2);
            }
            break;
        case GF_BG_LYR_SUB_3:
            if (bgConfig->bgs[GF_BG_LYR_SUB_3].mode == 0) {
                G2S_SetBG3Offset(x, y);
            } else {
                BgAffineReset(bgConfig, GF_BG_LYR_SUB_3);
            }
            break;
    }
}

fx32 Bg_GetXpos(const BgConfig *bgConfig, enum GFBgLayer bgId) {
    return bgConfig->bgs[bgId].hOffset;
}

fx32 Bg_GetYpos(const BgConfig *bgConfig, enum GFBgLayer bgId) {
    return bgConfig->bgs[bgId].vOffset;
}

void Bg_SetTextDimAndAffineParams(BgConfig *bgConfig, u8 bgId, enum BgPosAdjustOp op, fx32 value, MtxFx22 *mtx, fx32 centerX, fx32 centerY) {
    Bg_SetPosText(&bgConfig->bgs[bgId], op, value);
    SetBgAffine(bgConfig, bgId, mtx, centerX, centerY);
}

static void Bg_SetPosText(Background *bg, enum BgPosAdjustOp op, fx32 value) {
    switch (op) {
        case BG_POS_OP_SET_X:
            bg->hOffset = value;
            break;
        case BG_POS_OP_ADD_X:
            bg->hOffset += value;
            break;
        case BG_POS_OP_SUB_X:
            bg->hOffset -= value;
            break;
        case BG_POS_OP_SET_Y:
            bg->vOffset = value;
            break;
        case BG_POS_OP_ADD_Y:
            bg->vOffset += value;
            break;
        case BG_POS_OP_SUB_Y:
            bg->vOffset -= value;
            break;
    }
}

void SetBgAffine(BgConfig *bgConfig, u8 bgId, MtxFx22 *mtx, fx32 centerX, fx32 centerY) {
    switch (bgId) {
        case GF_BG_LYR_MAIN_0:
            break;
        case GF_BG_LYR_MAIN_1:
            break;
        case GF_BG_LYR_MAIN_2:
            G2_SetBG2Affine(mtx, centerX, centerY, bgConfig->bgs[bgId].hOffset, bgConfig->bgs[bgId].vOffset);
            break;
        case GF_BG_LYR_MAIN_3:
            G2_SetBG3Affine(mtx, centerX, centerY, bgConfig->bgs[bgId].hOffset, bgConfig->bgs[bgId].vOffset);
            break;
        case GF_BG_LYR_SUB_0:
            break;
        case GF_BG_LYR_SUB_1:
            break;
        case GF_BG_LYR_SUB_2:
            G2S_SetBG2Affine(mtx, centerX, centerY, bgConfig->bgs[bgId].hOffset, bgConfig->bgs[bgId].vOffset);
            break;
        case GF_BG_LYR_SUB_3:
            G2S_SetBG3Affine(mtx, centerX, centerY, bgConfig->bgs[bgId].hOffset, bgConfig->bgs[bgId].vOffset);
            break;
    }
}

static void BgAffineReset(BgConfig *bgConfig, u8 bgId) {
    MtxFx22 mtx;
    MTX22_2DAffine(&mtx, 0, FX32_ONE, FX32_ONE, 0);
    SetBgAffine(bgConfig, bgId, &mtx, 0, 0);
}

static void CopyOrUncompressTilemapData(const void *src, void *dest, u32 size) {
    if (size == 0) {
        MI_UncompressLZ8(src, dest);
        return;
    }

    if ((((u32)src) % 4) == 0 && (((u32)dest) % 4) == 0 && (((u16)size) % 4) == 0) {
        MI_CpuCopy32(src, dest, size);
        return;
    }

    MI_CpuCopy16(src, dest, size);
}

void BgCommitTilemapBufferToVram(BgConfig *bgConfig, u8 bgId) {
    BgCopyOrUncompressTilemapBufferRangeToVram(bgConfig, bgId, bgConfig->bgs[bgId].tilemapBuffer, bgConfig->bgs[bgId].bufferSize, bgConfig->bgs[bgId].baseTile);
}

void BgCopyOrUncompressTilemapBufferRangeToVram(BgConfig *bgConfig, u8 bgId, const void *buffer, u32 bufferSize, u32 baseTile) {
    if (bufferSize == 0) {
        void *tilemapBuffer = bgConfig->bgs[bgId].tilemapBuffer;
        if (tilemapBuffer != NULL) {
            CopyOrUncompressTilemapData(buffer, tilemapBuffer, bufferSize);
            LoadBgVramScr(bgId, tilemapBuffer, bgConfig->bgs[bgId].baseTile * 2, bgConfig->bgs[bgId].bufferSize);
            return;
        }
        
        u32 uncompSize = MI_GetUncompressedSize(buffer);
        void *ptr = AllocFromHeapAtEnd(bgConfig->heapId, uncompSize);
        CopyOrUncompressTilemapData(buffer, ptr, bufferSize);
        LoadBgVramScr(bgId, ptr, baseTile * 2, uncompSize);
        FreeToHeap(ptr);
        return;
    }

    LoadBgVramScr(bgId, buffer, baseTile * 2, bufferSize);
}

static void LoadBgVramScr(u8 bgId, const void *data, u32 offset, u32 size) {
    DC_FlushRange(data, size);
    switch (bgId) {
        case GF_BG_LYR_MAIN_0:
            GX_LoadBG0Scr(data, offset, size);
            break;
        case GF_BG_LYR_MAIN_1:
            GX_LoadBG1Scr(data, offset, size);
            break;
        case GF_BG_LYR_MAIN_2:
            GX_LoadBG2Scr(data, offset, size);
            break;
        case GF_BG_LYR_MAIN_3:
            GX_LoadBG3Scr(data, offset, size);
            break;
        case GF_BG_LYR_SUB_0:
            GXS_LoadBG0Scr(data, offset, size);
            break;
        case GF_BG_LYR_SUB_1:
            GXS_LoadBG1Scr(data, offset, size);
            break;
        case GF_BG_LYR_SUB_2:
            GXS_LoadBG2Scr(data, offset, size);
            break;
        case GF_BG_LYR_SUB_3:
            GXS_LoadBG3Scr(data, offset, size);
            break;
    }
}

void BG_LoadScreenTilemapData(BgConfig *bgConfig, u8 bgId, const void *data, u32 size) {
    CopyOrUncompressTilemapData(data, bgConfig->bgs[bgId].tilemapBuffer, size);
}

void BG_LoadCharTilesData(BgConfig *bgConfig, u8 bgId, const void *data, u32 size, u32 tileStart) {
    if (bgConfig->bgs[bgId].colorMode == GX_BG_COLORMODE_16) {
        BG_LoadCharPixelData(bgConfig, bgId, data, size, tileStart * TILE_SIZE_4BPP);
        return;
    }
    BG_LoadCharPixelData(bgConfig, bgId, data, size, tileStart * TILE_SIZE_8BPP);
}

static void BG_LoadCharPixelData(BgConfig *bgConfig, u8 bgId, const void *buffer, u32 size, u32 offset) {
    if (size == 0) {
        u32 uncompressedSize = MI_GetUncompressedSize(buffer);
        void *uncompressedBuffer = AllocFromHeapAtEnd(bgConfig->heapId, uncompressedSize);
        CopyOrUncompressTilemapData(buffer, uncompressedBuffer, size);
        LoadBgVramChar(bgId, uncompressedBuffer, offset, uncompressedSize);
        FreeToHeap(uncompressedBuffer);
        return;
    }

    LoadBgVramChar(bgId, buffer, offset, size);
}

static void LoadBgVramChar(u8 bgId, const void *data, u32 offset, u32 size) {
    DC_FlushRange(data, size);
    switch (bgId) {
        case GF_BG_LYR_MAIN_0:
            GX_LoadBG0Char(data, offset, size);
            break;
        case GF_BG_LYR_MAIN_1:
            GX_LoadBG1Char(data, offset, size);
            break;
        case GF_BG_LYR_MAIN_2:
            GX_LoadBG2Char(data, offset, size);
            break;
        case GF_BG_LYR_MAIN_3:
            GX_LoadBG3Char(data, offset, size);
            break;
        case GF_BG_LYR_SUB_0:
            GXS_LoadBG0Char(data, offset, size);
            break;
        case GF_BG_LYR_SUB_1:
            GXS_LoadBG1Char(data, offset, size);
            break;
        case GF_BG_LYR_SUB_2:
            GXS_LoadBG2Char(data, offset, size);
            break;
        case GF_BG_LYR_SUB_3:
            GXS_LoadBG3Char(data, offset, size);
            break;
    }
}

void BG_ClearCharDataRange(u8 bgId, u32 size, u32 offset, HeapID heapId) {
    void *buffer = AllocFromHeapAtEnd(heapId, size);
    memset(buffer, 0, size);

    LoadBgVramChar(bgId, buffer, offset, size);
    FreeToHeapExplicit(heapId, buffer);
}

void BG_FillCharDataRange(BgConfig *bgConfig, enum GFBgLayer bgId, u32 fillValue, u32 ntiles, u32 offset) {
    void *buffer;
    u32 size = ntiles * bgConfig->bgs[bgId].tileSize;
    u32 value = fillValue;
    buffer = AllocFromHeapAtEnd(bgConfig->heapId, size);

    if (bgConfig->bgs[bgId].tileSize == TILE_SIZE_4BPP) {
        value = (value << 12) | (value << 8) | (value << 4) | (value << 0);
        value |= value << 16;
    } else {
        value = (value << 24) | (value << 16) | (value << 8) | (value << 0);
    }

    MI_CpuFillFast(buffer, value, size);

    LoadBgVramChar((u8)bgId, buffer, bgConfig->bgs[bgId].tileSize * offset, size);
    FreeToHeap(buffer);
}

void BG_LoadPlttData(u32 location, const void *plttData, u32 size, enum GFPalSlotOffset offset) {
    DC_FlushRange(plttData, size);
    if (location < GF_PAL_LOCATION_SUB_BG) {
        GX_LoadBGPltt(plttData, offset, size);
        return;
    }

    GXS_LoadBGPltt(plttData, offset, size);
}

void BG_LoadBlankPltt(u32 location, u32 size, enum GFPalSlotOffset offset, HeapID heapId) {
    void *plttData = AllocFromHeapAtEnd(heapId, size);
    memset(plttData, 0, size);
    DC_FlushRange(plttData, size);
    if (location < GF_PAL_LOCATION_SUB_BG) {
        GX_LoadBGPltt(plttData, offset, size);
    } else {
        GXS_LoadBGPltt(plttData, offset, size);
    }
    FreeToHeapExplicit(heapId, plttData);
}

void BG_SetMaskColor(u8 bgId, u16 value) {
    BG_LoadPlttData(bgId, &value, sizeof(u16), GF_PAL_SLOT_OFFSET_0);
}

static u16 GetTileMapIndexFromCoords(u8 x, u8 y, u8 size, u8 mode) {
    u16 ret;
    switch (size) {
        case GF_BG_SCR_SIZE_128x128:
            GF_ASSERT(x < 16);
            GF_ASSERT(y < 16);
            ret = y * 16 + x;
            break;
        case GF_BG_SCR_SIZE_256x256:
            GF_ASSERT(x < 32);
            GF_ASSERT(y < 32);
            ret = y * 32 + x;
            break;
        case GF_BG_SCR_SIZE_256x512:
            GF_ASSERT(x < 32);
            GF_ASSERT(y < 64);
            ret = y * 32 + x;
            break;
        case GF_BG_SCR_SIZE_512x256:
            GF_ASSERT(x < 64);
            GF_ASSERT(y < 32);
            ret = ((x >> 5) * 32 + y) * 32 + (x & 0x1F);
            break;
        case GF_BG_SCR_SIZE_512x512:
            GF_ASSERT(x < 64);
            GF_ASSERT(y < 64);
           if (mode == GF_BG_TYPE_TEXT) {
                ret = (x >> 5) + (y >> 5) * 2;
                ret *= 1024;
                ret += (y & 0x1F) * 32 + (x & 0x1F);
            } else {
                ret = x + 64 * y;
            }
            break;
        case GF_BG_SCR_SIZE_1024x1024:
            GF_ASSERT(x < 128);
            GF_ASSERT(y < 128);
            ret = y * 128 + x;
            break;
    }

    return ret;
}

static u16 GetSrcTileMapIndexFromCoords(u8 x, u8 y, u8 width, u8 height) {
    u8 coordType = 0;
    u16 tilemapIndex = 0;
    s16 adjustedWidth = width - 32;
    s16 adjustedHeight = height - 32;

    if (x / 32) {
        coordType++;
    }

    if (y / 32) {
        coordType += 2;
    }

    switch (coordType) {
        case 0:
            if (adjustedWidth >= 0) {
                tilemapIndex += y * 32 + x;
            } else {
                tilemapIndex += y * width + x;
            }
            break;
        case 1:
            if (adjustedHeight >= 0) {
                tilemapIndex += 1024;
            } else {
                tilemapIndex += height * 32;
            }
            tilemapIndex += y * adjustedWidth + (x & 0x1f);
            break;
        case 2:
            tilemapIndex += width * 32;
            if (adjustedWidth >= 0) {
                tilemapIndex += (y & 0x1f) * 32 + x;
            } else {
                tilemapIndex += (y & 0x1f) * width + x;
            }
            break;
        case 3:
            tilemapIndex += width * 32 + adjustedHeight * 32;
            tilemapIndex += (y & 0x1f) * adjustedWidth + (x & 0x1f);
            break;
    }

    return tilemapIndex;
}

void LoadRectToBgTilemapRect(BgConfig *bgConfig, u8 bgId, const void *buffer, u8 destX, u8 destY, u8 width, u8 height) {
    CopyToBgTilemapRect(bgConfig, bgId, destX, destY, width, height, buffer, 0, 0, width, height);
}

void CopyToBgTilemapRect(BgConfig *bgConfig, u8 bgId, u8 destX, u8 destY, u8 destWidth, u8 destHeight, const void *buffer, u8 srcX, u8 srcY, u8 srcWidth, u8 srcHeight) {
    if (bgConfig->bgs[bgId].mode != GF_BG_TYPE_AFFINE) {
        CopyToBgTilemapRectText(&bgConfig->bgs[bgId], destX, destY, destWidth, destHeight, buffer, srcX, srcY, srcWidth, srcHeight, TILEMAP_COPY_SRC_FLAT);
    } else {
        CopyBgTilemapRectAffine(&bgConfig->bgs[bgId], destX, destY, destWidth, destHeight, buffer, srcX, srcY, srcWidth, srcHeight, TILEMAP_COPY_SRC_FLAT);
    }
}

void CopyRectToBgTilemapRect(BgConfig *bgConfig, u8 bgId, u8 destX, u8 destY, u8 destWidth, u8 destHeight, const void *buffer, u8 srcX, u8 srcY, u8 srcWidth, u8 srcHeight) {
    if (bgConfig->bgs[bgId].mode != GF_BG_TYPE_AFFINE) {
        CopyToBgTilemapRectText(&bgConfig->bgs[bgId], destX, destY, destWidth, destHeight, buffer, srcX, srcY, srcWidth, srcHeight, TILEMAP_COPY_SRC_RECT);
    } else {
        CopyBgTilemapRectAffine(&bgConfig->bgs[bgId], destX, destY, destWidth, destHeight, buffer, srcX, srcY, srcWidth, srcHeight, TILEMAP_COPY_SRC_RECT);
    }
}

static void CopyToBgTilemapRectText(Background *bg, u8 destX, u8 destY, u8 destWidth, u8 destHeight, const u16 *buffer, u8 srcX, u8 srcY, u8 srcWidth, u8 srcHeight, u8 mode) {
    u16 *tilemapBuffer = bg->tilemapBuffer;
    
    if (tilemapBuffer == NULL) {
        return;
    }

    u8 screenWidth;
    u8 screenHeight;
    GetBgScreenDimensions(bg->size, &screenWidth, &screenHeight);

    u8 i;
    u8 j;
    if (mode == TILEMAP_COPY_SRC_FLAT) {
        for (i = 0; i < destHeight; i++) {
            if (destY + i >= screenHeight || srcY + i >= srcHeight) {
                break;
            }
            for (j = 0; j < destWidth; j++) {
                if (destX + j >= screenWidth || srcX + j >= srcWidth) {
                    break;
                }
                tilemapBuffer[GetTileMapIndexFromCoords(destX + j, destY + i, bg->size, bg->mode)] = buffer[(srcY + i) * srcWidth + srcX + j];
            }
        }
    } else {
        for (i = 0; i < destHeight; i++) {
            if (destY + i >= screenHeight || srcY + i >= srcHeight) {
                break;
            }
            for (j = 0; j < destWidth; j++) {
                if (destX + j >= screenWidth || srcX + j >= srcWidth) {
                    break;
                }
                tilemapBuffer[GetTileMapIndexFromCoords(destX + j, destY + i, bg->size, bg->mode)] = buffer[GetSrcTileMapIndexFromCoords(srcX + j, srcY + i, srcWidth, srcHeight)];
            }
        }
    }
}

static void CopyBgTilemapRectAffine(Background *bg, u8 destX, u8 destY, u8 destWidth, u8 destHeight, const u8 *buffer, u8 srcX, u8 srcY, u8 srcWidth, u8 srcHeight, u8 mode) {
    u8 *tilemapBuffer = bg->tilemapBuffer;

    if (tilemapBuffer == NULL) {
        return;
    }

    u8 screenWidth;
    u8 screenHeight;
    GetBgScreenDimensions(bg->size, &screenWidth, &screenHeight);

    u8 i;
    u8 j;
    if (mode == TILEMAP_COPY_SRC_FLAT) {
        for (i = 0; i < destHeight; i++) {
            if (destY + i >= screenHeight || srcY + i >= srcHeight) {
                break;
            }
            for (j = 0; j < destWidth; j++) {
                if (destX + j >= screenWidth || srcX + j >= srcWidth) {
                    break;
                }
                tilemapBuffer[GetTileMapIndexFromCoords(destX + j, destY + i, bg->size, bg->mode)] = buffer[(srcY + i) * srcWidth + srcX + j];
            }
        }
    } else {
        for (i = 0; i < destHeight; i++) {
            if (destY + i >= screenHeight || srcY + i >= srcHeight) {
                break;
            }
            for (j = 0; j < destWidth; j++) {
                if (destX + j >= screenWidth || srcX + j >= srcWidth) {
                    break;
                }
                tilemapBuffer[GetTileMapIndexFromCoords(destX + j, destY + i, bg->size, bg->mode)] = buffer[GetSrcTileMapIndexFromCoords(srcX + j, srcY + i, srcWidth, srcHeight)];
            }
        }
    }
}

void FillBgTilemapRect(BgConfig *bgConfig, u8 bgId, u16 fillValue, u8 x, u8 y, u8 width, u8 height, u8 mode) {
    if (bgConfig->bgs[bgId].mode != GF_BG_TYPE_AFFINE) {
        FillBgTilemapRectText(&bgConfig->bgs[bgId], fillValue, x, y, width, height, mode);
    } else {
        FillBgTilemapRectAffine(&bgConfig->bgs[bgId], fillValue, x, y, width, height);
    }
}

static void FillBgTilemapRectText(Background *bg, u16 fillValue, u8 x, u8 y, u8 width, u8 height, u8 mode) {
    u16 *tilemapBuffer = bg->tilemapBuffer;

    if (tilemapBuffer == NULL) {
        return;
    }

    u8 screenWidth;
    u8 screenHeight;
    GetBgScreenDimensions(bg->size, &screenWidth, &screenHeight);

    u8 i;
    u8 j;
    for (i = y; i < y + height; i++) {
        if (i >= screenHeight) {
            break;
        }
        for (j = x; j < x + width; j++) {
            if (j >= screenWidth) {
                break;
            }
            u16 pos = GetTileMapIndexFromCoords(j, i, bg->size, bg->mode);
            if (mode == TILEMAP_FILL_OVWT_PAL) {
                tilemapBuffer[pos] = fillValue;
            } else if (mode == TILEMAP_FILL_KEEP_PAL) {
                tilemapBuffer[pos] = (tilemapBuffer[pos] & 0xF000) + (fillValue & 0xFFF);
            } else {
                tilemapBuffer[pos] = (mode << 12) + (fillValue & 0xFFF);
            }
        }
    }
}

static void FillBgTilemapRectAffine(Background *bg, u8 fillValue, u8 x, u8 y, u8 width, u8 height) {
    u8 *tilemapBuffer = bg->tilemapBuffer;

    if (tilemapBuffer == NULL) {
        return;
    }

    u8 screenWidth;
    u8 screenHeight;
    GetBgScreenDimensions(bg->size, &screenWidth, &screenHeight);

    u8 i;
    u8 j;
    for (i = y; i < y + height; i++) {
        if (i >= screenHeight) {
            break;
        }
        for (j = x; j < x + width; j++) {
            if (j >= screenWidth) {
                break;
            }
            tilemapBuffer[GetTileMapIndexFromCoords(j, i, bg->size, bg->mode)] = fillValue;
        }
    }
}

void BgTilemapRectChangePalette(BgConfig *bgConfig, u8 bgId, u8 x, u8 y, u8 width, u8 height, u8 palette) {
    u16 *tilemapBuffer = bgConfig->bgs[bgId].tilemapBuffer;

    if (tilemapBuffer == NULL) {
        return;
    }

    u8 screenWidth;
    u8 screenHeight;
    GetBgScreenDimensions(bgConfig->bgs[bgId].size, &screenWidth, &screenHeight);

    u8 i;
    u8 j;
    for (i = y; i < y + height; i++) {
        if (i >= screenHeight) {
            break;
        }
        for (j = x; j < x + width; j++) {
            if (j >= screenWidth) {
                break;
            }
            u16 pos = GetTileMapIndexFromCoords(j, i, bgConfig->bgs[bgId].size, bgConfig->bgs[bgId].mode);
            tilemapBuffer[pos] = (tilemapBuffer[pos] & 0xFFF) | (palette << 12);
        }
    }
}

void BgClearTilemapBufferAndCommit(BgConfig *bgConfig, u8 bgId) {
    if (bgConfig->bgs[bgId].tilemapBuffer != NULL) {
        MI_CpuClear16(bgConfig->bgs[bgId].tilemapBuffer, bgConfig->bgs[bgId].bufferSize);
        BgCommitTilemapBufferToVram(bgConfig, bgId);
    }
}

static void BgClearTilemapBufferAndSchedule(BgConfig *bgConfig, u8 bgId) {
    if (bgConfig->bgs[bgId].tilemapBuffer != NULL) {
        MI_CpuClear16(bgConfig->bgs[bgId].tilemapBuffer, bgConfig->bgs[bgId].bufferSize);
        ScheduleBgTilemapBufferTransfer(bgConfig, bgId);
    }
}

void BgFillTilemapBufferAndCommit(BgConfig *bgConfig, u8 bgId, u16 fillValue) {
    if (bgConfig->bgs[bgId].tilemapBuffer != NULL) {
        MI_CpuFill16(bgConfig->bgs[bgId].tilemapBuffer, fillValue, bgConfig->bgs[bgId].bufferSize);
        BgCommitTilemapBufferToVram(bgConfig, bgId);
    }
}

void BgFillTilemapBufferAndSchedule(BgConfig *bgConfig, u8 bgId, u16 fillValue) {
    if (bgConfig->bgs[bgId].tilemapBuffer != NULL) {
        MI_CpuFill16(bgConfig->bgs[bgId].tilemapBuffer, fillValue, bgConfig->bgs[bgId].bufferSize);
        ScheduleBgTilemapBufferTransfer(bgConfig, bgId);
    }
}

void *BgGetCharPtr(u8 bgId) {
    switch (bgId) {
        case GF_BG_LYR_MAIN_0:
            return G2_GetBG0CharPtr();
        case GF_BG_LYR_MAIN_1:
            return G2_GetBG1CharPtr();
        case GF_BG_LYR_MAIN_2:
            return G2_GetBG2CharPtr();
        case GF_BG_LYR_MAIN_3:
            return G2_GetBG3CharPtr();
        case GF_BG_LYR_SUB_0:
            return G2S_GetBG0CharPtr();
        case GF_BG_LYR_SUB_1:
            return G2S_GetBG1CharPtr();
        case GF_BG_LYR_SUB_2:
            return G2S_GetBG2CharPtr();
        case GF_BG_LYR_SUB_3:
            return G2S_GetBG3CharPtr();
    }

    return NULL;
}

static void Convert4bppTo8bppInternal(u8 *src4bpp, u32 size, u8 *dest8bpp, u8 paletteNum) {
    paletteNum <<= 4;
    for (u32 i = 0; i < size; i++) {
        dest8bpp[i * 2 + 0] = (u8)(src4bpp[i] & 0xf);
        if (dest8bpp[i * 2 + 0] != 0) {
            dest8bpp[i * 2 + 0] += paletteNum;
        }

        dest8bpp[i * 2 + 1] = (u8)((src4bpp[i] >> 4) & 0xf);
        if (dest8bpp[i * 2 + 1] != 0) {
            dest8bpp[i * 2 + 1] += paletteNum;
        }
    }
}

u8 *Convert4bppTo8bpp(u8 *src4Bpp, u32 size, u8 paletteNum, HeapID heapId) {
    u8 *ptr = (u8*)AllocFromHeap(heapId, size * 2);

    Convert4bppTo8bppInternal(src4Bpp, size, ptr, paletteNum);

    return ptr;
}

void *GetBgTilemapBuffer(BgConfig *bgConfig, u8 bgId) {
    return bgConfig->bgs[bgId].tilemapBuffer;
}

fx32 GetBgHOffset(BgConfig *bgConfig, u8 bgId) {
    return bgConfig->bgs[bgId].hOffset;
}

static fx32 GetBgVOffset(BgConfig *bgConfig, u8 bgId) {
    return bgConfig->bgs[bgId].vOffset;
}

static u16 GetBgRotation(BgConfig *bgConfig, u8 bgId) {
    return bgConfig->bgs[bgId].rotation;
}

u8 GetBgColorMode(BgConfig *bgConfig, u8 bgId) {
    return bgConfig->bgs[bgId].colorMode;
}

u8 GetBgPriority(BgConfig *bgConfig, u8 bgId) {
    switch (bgId) {
        case GF_BG_LYR_MAIN_0:
            return G2_GetBG0Control().priority;
        case GF_BG_LYR_MAIN_1:
            return G2_GetBG1Control().priority;
        case GF_BG_LYR_MAIN_2:
            switch (bgConfig->bgs[bgId].mode) {
                default:
                case GF_BG_TYPE_TEXT:
                    return G2_GetBG2ControlText().priority;
                case GF_BG_TYPE_AFFINE:
                    return G2_GetBG2ControlAffine().priority;
                case GF_BG_TYPE_256x16PLTT:
                    return G2_GetBG2Control256x16Pltt().priority;
            }
            break;
        case GF_BG_LYR_MAIN_3:
            switch (bgConfig->bgs[bgId].mode) {
                default:
                case GF_BG_TYPE_TEXT:
                    return G2_GetBG3ControlText().priority;
                case GF_BG_TYPE_AFFINE:
                    return G2_GetBG3ControlAffine().priority;
                case GF_BG_TYPE_256x16PLTT:
                    return G2_GetBG3Control256x16Pltt().priority;
            }
            break;
        case GF_BG_LYR_SUB_0:
            return G2S_GetBG0Control().priority;
        case GF_BG_LYR_SUB_1:
            return G2S_GetBG1Control().priority;
        case GF_BG_LYR_SUB_2:
            switch (bgConfig->bgs[bgId].mode) {
                default:
                case GF_BG_TYPE_TEXT:
                    return G2S_GetBG2ControlText().priority;
                case GF_BG_TYPE_AFFINE:
                    return G2S_GetBG2ControlAffine().priority;
                case GF_BG_TYPE_256x16PLTT:
                    return G2S_GetBG2Control256x16Pltt().priority;
            }
            break;
        case GF_BG_LYR_SUB_3:
            switch (bgConfig->bgs[bgId].mode) {
                default:
                case GF_BG_TYPE_TEXT:
                    return G2S_GetBG3ControlText().priority;
                case GF_BG_TYPE_AFFINE:
                    return G2S_GetBG3ControlAffine().priority;
                case GF_BG_TYPE_256x16PLTT:
                    return G2S_GetBG3Control256x16Pltt().priority;
            }
            break;
    }

    return 0;
}

#define GetPixelAddressFromBlit4bpp(ptr, x, y, width) ((u8 *)((ptr) + (((x) >> 1) & 3) + (((x) << 2) & 0x3FE0) + ((((y) << 2) & 0x3FE0) * (width)) + (((u32)(((y) << 2) & 0x1C)))))
#define GetPixelAddressFromBlit8bpp(ptr, x, y, width) ((u8 *)((ptr) + ((x) & 7) + (((x) << 3) & 0x7FC0) + ((((y) << 3) & 0x7FC0) * (width)) + (((u32)(((y) << 3) & 0x38)))))
#define ConvertPixelsToTiles(x)    (((x) + ((x) & 7)) >> 3)

void BlitBitmapRect4Bit(const Bitmap *src, const Bitmap *dest, u16 srcX, u16 srcY, u16 destX, u16 destY, u16 width, u16 height, u16 colorKey) {
    int xEnd, yEnd;
    int multiplierSrcY, multiplierDestY;
    int loopSrcY, loopDestY;
    int loopSrcX, loopDestX;
    int toOrr, toShift;
    u8 *pixelsSrc, *pixelsDest;

    if (dest->width - destX < width) {
        xEnd = dest->width - destX + srcX;
    } else {
        xEnd = width + srcX;
    }
    if (dest->height - destY < height) {
        yEnd = dest->height - destY + srcY;
    } else {
        yEnd = height + srcY;
    }
    multiplierSrcY = ConvertPixelsToTiles(src->width);
    multiplierDestY = ConvertPixelsToTiles(dest->width);

    if (colorKey == 0xFFFF) {
        for (loopSrcY = srcY, loopDestY = destY; loopSrcY < yEnd; loopSrcY++, loopDestY++) {
            for (loopSrcX = srcX, loopDestX = destX; loopSrcX < xEnd; loopSrcX++, loopDestX++) {
                pixelsSrc = GetPixelAddressFromBlit4bpp(src->pixels, loopSrcX, loopSrcY, multiplierSrcY);
                pixelsDest = GetPixelAddressFromBlit4bpp(dest->pixels, loopDestX, loopDestY, multiplierDestY);

                toOrr = (*pixelsSrc >> ((loopSrcX & 1) * 4)) & 0xF;
                toShift = (loopDestX & 1) * 4;
                *pixelsDest = ((toOrr << toShift) | (*pixelsDest & (0xF0 >> toShift)));
            }
        }
    } else {
        for (loopSrcY = srcY, loopDestY = destY; loopSrcY < yEnd; loopSrcY++, loopDestY++) {
            for (loopSrcX = srcX, loopDestX = destX; loopSrcX < xEnd; loopSrcX++, loopDestX++) {
                pixelsSrc = GetPixelAddressFromBlit4bpp(src->pixels, loopSrcX, loopSrcY, multiplierSrcY);
                pixelsDest = GetPixelAddressFromBlit4bpp(dest->pixels, loopDestX, loopDestY, multiplierDestY);

                toOrr = (*pixelsSrc >> ((loopSrcX & 1) * 4)) & 0xF;
                if (toOrr != colorKey) {
                    toShift = (loopDestX & 1) * 4;
                    *pixelsDest = (u8) ((toOrr << toShift) | (*pixelsDest & (0xF0 >> toShift)));
                }
            }
        }
    }
}

static void BlitBitmapRect8Bit(const Bitmap *src, const Bitmap *dest, u16 srcX, u16 srcY, u16 destX, u16 destY, u16 width, u16 height, u16 colorKey) {
    int xEnd, yEnd;
    int multiplierSrcY, multiplierDestY;
    int loopSrcY, loopDestY;
    int loopSrcX, loopDestX;
    u8 *pixelsSrc, *pixelsDest;

    if (dest->width - destX < width) {
        xEnd = dest->width - destX + srcX;
    } else {
        xEnd = width + srcX;
    }
    if (dest->height - destY < height) {
        yEnd = dest->height - destY + srcY;
    } else {
        yEnd = height + srcY;
    }
    multiplierSrcY = ConvertPixelsToTiles(src->width);
    multiplierDestY = ConvertPixelsToTiles(dest->width);

    if (colorKey == 0xFFFF) {
        for (loopSrcY = srcY, loopDestY = destY; loopSrcY < yEnd; loopSrcY++, loopDestY++) {
            for (loopSrcX = srcX, loopDestX = destX; loopSrcX < xEnd; loopSrcX++, loopDestX++) {
                pixelsSrc = GetPixelAddressFromBlit8bpp(src->pixels, loopSrcX, loopSrcY, multiplierSrcY);
                pixelsDest = GetPixelAddressFromBlit8bpp(dest->pixels, loopDestX, loopDestY, multiplierDestY);

                *pixelsDest = *pixelsSrc;
            }
        }
    } else {
        for (loopSrcY = srcY, loopDestY = destY; loopSrcY < yEnd; loopSrcY++, loopDestY++) {
            for (loopSrcX = srcX, loopDestX = destX; loopSrcX < xEnd; loopSrcX++, loopDestX++) {
                pixelsSrc = GetPixelAddressFromBlit8bpp(src->pixels, loopSrcX, loopSrcY, multiplierSrcY);
                pixelsDest = GetPixelAddressFromBlit8bpp(dest->pixels, loopDestX, loopDestY, multiplierDestY);

                if (*pixelsSrc != colorKey) {
                    *pixelsDest = *pixelsSrc;
                }
            }
        }
    }
}

static void FillBitmapRect4bit(const Bitmap *surface, u16 x, u16 y, u16 width, u16 height, u8 fillValue) {
    int xEnd = x + width;
    if (xEnd > surface->width) {
        xEnd = surface->width;
    }

    int yEnd = y + height;
    if (yEnd > surface->height) {
        yEnd = surface->height;
    }

    int blitWidth = ConvertPixelsToTiles(surface->width);

    for (int i = y; i < yEnd; i++) {
        for (int j = x; j < xEnd; j++) {
            u8 *pixels = GetPixelAddressFromBlit4bpp(surface->pixels, j, i, blitWidth);

            if ((j & 1) != 0) {
                *pixels &= 0xf;
                *pixels |= (fillValue << 4);
            } else {
                *pixels &= 0xf0;
                *pixels |= fillValue;
            }
        }
    }
}

static void FillBitmapRect8bit(const Bitmap *surface, u16 x, u16 y, u16 width, u16 height, u8 fillValue) {
    int xEnd = x + width;
    if (xEnd > surface->width) {
        xEnd = surface->width;
    }

    int yEnd = y + height;
    if (yEnd > surface->height) {
        yEnd = surface->height;
    }

    int blitWidth = ConvertPixelsToTiles(surface->width);

    for (int i = y; i < yEnd; i++) {
        for (int j = x; j < xEnd; j++) {
            u8 *pixels = GetPixelAddressFromBlit8bpp(surface->pixels, j, i, blitWidth);
            *pixels = fillValue;
        }
    }
}

Window *AllocWindows(HeapID heapId, s32 num) {
    Window *ret = AllocFromHeap(heapId, num * sizeof(Window));
    for (u16 i = 0; i < num; i++) {
        InitWindow(&ret[i]);
    }
    return ret;
}

void InitWindow(Window *window) {
    window->bgConfig = NULL;
    window->bgId = GF_BG_LYR_UNALLOC;
    window->tilemapLeft = 0;
    window->tilemapTop = 0;
    window->width = 0;
    window->height = 0;
    window->paletteNum = 0;
    window->baseTile = 0;
    window->pixelBuffer = NULL;
    window->colorMode = GF_BG_CLR_4BPP;
}

BOOL WindowIsInUse(const Window *window) {
    if (window->bgConfig == NULL || window->bgId == 0xFF || window->pixelBuffer == NULL) {
        return FALSE;
    }
    
    return TRUE;
}

void AddWindowParameterized(BgConfig *bgConfig, Window *window, u8 bgId, u8 x, u8 y, u8 width, u8 height, u8 paletteNum, u16 baseTile) {
    if (bgConfig->bgs[bgId].tilemapBuffer == NULL) {
        return;
    }

    void * buffer = AllocFromHeap(bgConfig->heapId, width * height * bgConfig->bgs[bgId].tileSize);

    if (buffer == NULL) {
        return;
    }
    window->bgConfig = bgConfig;
    window->bgId = bgId;
    window->tilemapLeft = x;
    window->tilemapTop = y;
    window->width = width;
    window->height = height;
    window->paletteNum = paletteNum;
    window->baseTile = baseTile;
    window->pixelBuffer = buffer;
    window->colorMode = bgConfig->bgs[bgId].colorMode == GX_BG_COLORMODE_16 ? GF_BG_CLR_4BPP : GF_BG_CLR_8BPP;
}

void AddTextWindowTopLeftCorner(BgConfig *bgConfig, Window *window, u8 width, u8 height, u16 baseTile, u8 paletteNum) {
    u32 size = width * height * 32;

    void *ptr = AllocFromHeap(bgConfig->heapId, size);

    paletteNum |= (paletteNum* 16);
    memset(ptr, paletteNum, size); // could cause a data protection abort if below is true

    if (ptr != NULL) {
        window->bgConfig = bgConfig;
        window->width = width;
        window->height = height;
        window->baseTile = baseTile;
        window->pixelBuffer = ptr;
        window->colorMode = GF_BG_CLR_4BPP;
    }
}

void AddWindow(BgConfig *bgConfig, Window *window, const WindowTemplate *template) {
    AddWindowParameterized(bgConfig, window, template->bgId, template->left, template->top, template->width, template->height, template->palette, template->baseTile);
}

void RemoveWindow(Window* window) {
    FreeToHeap(window->pixelBuffer);

    window->bgConfig = NULL;
    window->bgId = GF_BG_LYR_UNALLOC;
    window->tilemapLeft = 0;
    window->tilemapTop = 0;
    window->width = 0;
    window->height = 0;
    window->paletteNum = 0;
    window->baseTile = 0;
    window->pixelBuffer = NULL;
}

void WindowArray_Delete(Window *windows, s32 count) {
    for (u16 i = 0; i < count; i++) {
        if (windows[i].pixelBuffer != NULL) {
            FreeToHeap(windows[i].pixelBuffer);
        }
    }

    FreeToHeap(windows);
}

void CopyWindowToVram(Window *window) {
    GF_ASSERT(window != NULL);
    GF_ASSERT(window->bgConfig != NULL);
    GF_ASSERT(window->bgId < GF_BG_LYR_MAX);
    GF_ASSERT(window->bgConfig->bgs[window->bgId].mode < GF_BG_TYPE_MAX);
    sCopyWindowToVramFuncs[window->bgConfig->bgs[window->bgId].mode](window);
}

void ScheduleWindowCopyToVram(Window *window) {
    GF_ASSERT(window != NULL);
    GF_ASSERT(window->bgConfig != NULL);
    GF_ASSERT(window->bgId < GF_BG_LYR_MAX);
    GF_ASSERT(window->bgConfig->bgs[window->bgId].mode < GF_BG_TYPE_MAX);
    sScheduleWindowCopyToVramFuncs[window->bgConfig->bgs[window->bgId].mode](window);
}

void PutWindowTilemap(Window *window) {
    sPutWindowTilemapFuncs[window->bgConfig->bgs[window->bgId].mode](window);
}

void ClearWindowTilemap(Window *window) {
    sClearWindowTilemapFuncs[window->bgConfig->bgs[window->bgId].mode](window);
}

static void PutWindowTilemap_TextMode(Window *window) {
    u32 i, j;
    u32 tile;
    u32 tilemapBottom, tilemapRight;
    u16 *tilemap = window->bgConfig->bgs[window->bgId].tilemapBuffer;

    if (tilemap == NULL) {
        return;
    }

    tile = window->baseTile;
    tilemapRight = window->tilemapLeft + window->width;
    tilemapBottom = window->tilemapTop + window->height;

    for (i = window->tilemapTop; i < tilemapBottom; i++) {
        for (j = window->tilemapLeft; j < tilemapRight; j++) {
            tilemap[GetTileMapIndexFromCoords(j, i, window->bgConfig->bgs[window->bgId].size, window->bgConfig->bgs[window->bgId].mode)] = tile | (window->paletteNum << 12);
            tile++;
        }
    }
}

static void PutWindowTilemap_AffineMode(Window *window) {
    int j, i;
    u8 *tilemap;

    int tile;
    int tilemapWidth;

    if (window->bgConfig->bgs[window->bgId].tilemapBuffer == NULL) {
        return;
    }
    
    tilemapWidth = sTilemapWidthByBufferSize[window->bgConfig->bgs[window->bgId].size];

    tilemap = window->bgConfig->bgs[window->bgId].tilemapBuffer + window->tilemapTop * tilemapWidth + window->tilemapLeft;
    tile = window->baseTile;

    for (i = 0; i < window->height; i++) {
        for (j = 0; j < window->width; j++) {
            tilemap[j] = tile++;
        }
        tilemap += tilemapWidth;
    }
}

static void ClearWindowTilemapText(Window *window) {
    u32 i, j;
    u32 tilemapBottom, tilemapRight;
    u16 *tilemap;

    if (window->bgConfig->bgs[window->bgId].tilemapBuffer == NULL) {
        return;
    }
    tilemap = window->bgConfig->bgs[window->bgId].tilemapBuffer;
    tilemapRight = window->tilemapLeft + window->width;
    tilemapBottom = window->tilemapTop + window->height;
    for (i = window->tilemapTop; i < tilemapBottom; i++) {
        for (j = window->tilemapLeft; j < tilemapRight; j++) {
            tilemap[GetTileMapIndexFromCoords(j, i, window->bgConfig->bgs[window->bgId].size, window->bgConfig->bgs[window->bgId].mode)] = 0;
        }
    }
}

static void ClearWindowTilemapAffine(Window *window) {
    int j, i;
    u8 *tilemap;
    int tilemapWidth;

    if (window->bgConfig->bgs[window->bgId].tilemapBuffer == NULL) {
        return;
    }

    tilemapWidth = sTilemapWidthByBufferSize[window->bgConfig->bgs[window->bgId].size];
    tilemap = window->bgConfig->bgs[window->bgId].tilemapBuffer + window->tilemapTop * tilemapWidth + window->tilemapLeft;
    for (i = 0; i < window->height; i++) {
        for (j = 0; j < window->width; j++) {
            tilemap[j] = 0;
        }
        tilemap += tilemapWidth;
    }
}

static void CopyWindowToVram_TextMode(Window *window) {
    PutWindowTilemap_TextMode(window);
    CopyWindowPixelsToVram_TextMode(window);
    BgCopyOrUncompressTilemapBufferRangeToVram(window->bgConfig, window->bgId, window->bgConfig->bgs[window->bgId].tilemapBuffer, window->bgConfig->bgs[window->bgId].bufferSize, window->bgConfig->bgs[window->bgId].baseTile);
}

static void ScheduleWindowCopyToVram_TextMode(Window *window) {
    PutWindowTilemap_TextMode(window);
    ScheduleBgTilemapBufferTransfer(window->bgConfig, window->bgId);
    CopyWindowPixelsToVram_TextMode(window);
}

static void CopyWindowToVram_AffineMode(Window *window) {
    PutWindowTilemap_AffineMode(window);
    BgCopyOrUncompressTilemapBufferRangeToVram(window->bgConfig, window->bgId, window->bgConfig->bgs[window->bgId].tilemapBuffer, window->bgConfig->bgs[window->bgId].bufferSize, window->bgConfig->bgs[window->bgId].baseTile);
    BG_LoadCharTilesData(window->bgConfig, window->bgId, window->pixelBuffer, window->width * window->height * TILE_SIZE_8BPP, window->baseTile);
}

static void ScheduleWindowCopyToVram_AffineMode(Window *window) {
    PutWindowTilemap_AffineMode(window);
    ScheduleBgTilemapBufferTransfer(window->bgConfig, window->bgId);
    BG_LoadCharTilesData(window->bgConfig, window->bgId, window->pixelBuffer, window->width * window->height * TILE_SIZE_8BPP, window->baseTile);
}

void CopyWindowPixelsToVram_TextMode(Window *window) {
    BG_LoadCharTilesData(window->bgConfig, window->bgId, window->pixelBuffer, window->width * window->height * window->bgConfig->bgs[window->bgId].tileSize, window->baseTile);
}

void ClearWindowTilemapAndCopyToVram(Window *window) {
    sClearWindowTilemapAndCopyToVramFuncs[window->bgConfig->bgs[window->bgId].mode](window);
}

void ClearWindowTilemapAndScheduleTransfer(Window *window) {
    sClearWindowTilemapAndScheduleTransferFuncs[window->bgConfig->bgs[window->bgId].mode](window);
}

static void ClearWindowTilemapAndCopyToVram_TextMode(Window *window) {
    ClearWindowTilemapText(window);
    BgCopyOrUncompressTilemapBufferRangeToVram(window->bgConfig, window->bgId, window->bgConfig->bgs[window->bgId].tilemapBuffer, window->bgConfig->bgs[window->bgId].bufferSize, window->bgConfig->bgs[window->bgId].baseTile);
}

static void ClearWindowTilemapAndScheduleTransfer_TextMode(Window *window) {
    ClearWindowTilemapText(window);
    ScheduleBgTilemapBufferTransfer(window->bgConfig, window->bgId);
}

static void ClearWindowTilemapAndCopyToVram_AffineMode(Window *window) {
    ClearWindowTilemapAffine(window);
    BgCopyOrUncompressTilemapBufferRangeToVram(window->bgConfig, window->bgId, window->bgConfig->bgs[window->bgId].tilemapBuffer, window->bgConfig->bgs[window->bgId].bufferSize, window->bgConfig->bgs[window->bgId].baseTile);
}

static void ClearWindowTilemapAndScheduleTransfer_AffineMode(Window *window) {
    ClearWindowTilemapAffine(window);
    ScheduleBgTilemapBufferTransfer(window->bgConfig, window->bgId);
}

void FillWindowPixelBuffer(Window *window, u8 fillValue) {
    if (window->bgConfig->bgs[window->bgId].tileSize == 0x20) {
        fillValue |= fillValue << 4;
    }
    MI_CpuFillFast(window->pixelBuffer, ((fillValue << 24) | (fillValue << 16) | (fillValue << 8) | (fillValue << 0)), window->bgConfig->bgs[window->bgId].tileSize * window->width * window->height);
}

void FillWindowPixelBufferText_AssumeTileSize32(Window *window, u8 fillValue) {
    fillValue |= fillValue << 4;
    MI_CpuFillFast(window->pixelBuffer, ((fillValue << 24) | (fillValue << 16) | (fillValue << 8) | (fillValue << 0)), 32 * window->width * window->height);
}

void BlitBitmapRectToWindow(Window *window, void *src, u16 srcX, u16 srcY, u16 srcWidth, u16 srcHeight, u16 destX, u16 destY, u16 destWidth, u16 destHeight) {
    BlitBitmapRect(window, src, srcX, srcY, srcWidth, srcHeight, destX, destY, destWidth, destHeight, 0);
}

void BlitBitmapRect(Window *window, void *src, u16 srcX, u16 srcY, u16 srcWidth, u16 srcHeight, u16 destX, u16 destY, u16 destWidth, u16 destHeight, u16 colorKey) {
    Bitmap bmpSrc, bmpDest;

    bmpSrc.pixels = src;
    bmpSrc.width = srcWidth;
    bmpSrc.height = srcHeight;

    bmpDest.pixels = window->pixelBuffer;
    bmpDest.width = window->width * 8;
    bmpDest.height = window->height * 8;

    if (window->bgConfig->bgs[window->bgId].colorMode == GF_BG_CLR_4BPP) {
        BlitBitmapRect4Bit(&bmpSrc, &bmpDest, srcX, srcY, destX, destY, destWidth, destHeight, colorKey);
    } else {
        BlitBitmapRect8Bit(&bmpSrc, &bmpDest, srcX, srcY, destX, destY, destWidth, destHeight, colorKey);
    }
}

void FillWindowPixelRect(Window *window, u8 fillValue, u16 x, u16 y, u16 width, u16 height) {
    Bitmap bmp;

    bmp.pixels = window->pixelBuffer;
    bmp.width = window->width * 8;
    bmp.height = window->height * 8;

    if (window->bgConfig->bgs[window->bgId].colorMode == GF_BG_CLR_4BPP) {
        FillBitmapRect4bit(&bmp, x, y, width, height, fillValue);
    } else {
        FillBitmapRect8bit(&bmp, x, y, width, height, fillValue);
    }
}

#define GLYPH_COPY_4BPP(glyphPixels, srcX, srcY, srcWidth, srcHeight, windowPixels, destX, destY, destWidth, table) { \
    int srcJ, destJ, srcI, destI, bits;                                                                                 \
    u8 toOrr;                                                                                                         \
    u8 tableFlag;                                                                                                     \
    u8 tableBit;                                                                                                      \
    u8 *dest;                                                                                                         \
    const u8 *src;                                                                                                    \
    u32 pixelData;                                                                                                    \
                                                                                                                      \
    src = glyphPixels + (srcY / 8 * 64) + (srcX / 8 * 32);                                                            \
    if (srcY == 0) {                                                                                                  \
        destI = destY + srcY;                                                                                          \
        tableBit = table & 0xFF;                                                                                      \
    } else {                                                                                                          \
        destI = destY + srcY;                                                                                          \
        for (srcI = 0; srcI < 8; srcI++) {                                                                            \
            if (((table >> srcI) & 1) != 0) {                                                                         \
                destI++;                                                                                               \
            }                                                                                                         \
        }                                                                                                             \
        tableBit = table >> 8;                                                                                        \
    }                                                                                                                 \
    for (srcI = 0; srcI < srcHeight; srcI++) {                                                                        \
        pixelData = *(u32 *)src;                                                                                      \
        tableFlag = (tableBit >> srcI) & 1;                                                                           \
        for (srcJ = 0, destJ = destX + srcX; srcJ < srcWidth; srcJ++, destJ++) {                                        \
            dest = GetPixelAddressFromBlit4bpp(windowPixels, destJ, destI, destWidth);                                  \
            toOrr = (pixelData >> (srcJ * 4)) & 0xF;                                                                  \
            if (toOrr != 0) {                                                                                         \
                bits = (destJ & 1) * 4;                                                                                \
                toOrr = (toOrr << bits) | (*dest & (0xF0 >> bits));                                                   \
                *dest = toOrr;                                                                                        \
                if (tableFlag) {                                                                                      \
                    dest = GetPixelAddressFromBlit4bpp(windowPixels, destJ, destI + 1, destWidth);                      \
                    *dest = toOrr;                                                                                    \
                }                                                                                                     \
            }                                                                                                         \
        }                                                                                                             \
        if (tableFlag) {                                                                                              \
            destI += 2;                                                                                                \
        } else {                                                                                                      \
            destI += 1;                                                                                                \
        }                                                                                                             \
        src += 4;                                                                                                     \
    }                                                                                                                 \
}

#define GLYPH_COPY_8BPP(glyphPixels, srcX, srcY, srcWidth, srcHeight, windowPixels, destX, destY, destWidth, table) { \
    int srcJ, destJ, srcI, destI;                                                                                       \
    u8 toOrr;                                                                                                         \
    u8 tableFlag;                                                                                                     \
    u8 tableBit;                                                                                                      \
    u8 *dest;                                                                                                         \
    const u8 *src;                                                                                                    \
    u8 *pixelData;                                                                                                    \
                                                                                                                      \
    src = glyphPixels + (srcY / 8 * 128) + (srcX / 8 * 64);                                                           \
    if (srcY == 0) {                                                                                                  \
        destI = destY + srcY;                                                                                          \
        tableBit = table & 0xFF;                                                                                      \
    } else {                                                                                                          \
        destI = destY + srcY;                                                                                          \
        for (srcI = 0; srcI < 8; srcI++) {                                                                            \
            if (((table >> srcI) & 1) != 0) {                                                                         \
                destI++;                                                                                               \
            }                                                                                                         \
        }                                                                                                             \
        tableBit = table >> 8;                                                                                        \
    }                                                                                                                 \
    for (srcI = 0; srcI < srcHeight; srcI++) {                                                                        \
        pixelData = (u8 *)src;                                                                                        \
        tableFlag = (tableBit >> srcI) & 1;                                                                           \
        for (srcJ = 0, destJ = destX + srcX; srcJ < srcWidth; srcJ++, destJ++) {                                        \
            dest = GetPixelAddressFromBlit8bpp(windowPixels, destJ, destI, destWidth);                                  \
            toOrr = pixelData[srcJ];                                                                                  \
            if (toOrr != 0) {                                                                                         \
                *dest = toOrr;                                                                                        \
                if (tableFlag) {                                                                                      \
                    dest = GetPixelAddressFromBlit8bpp(windowPixels, destJ, destI + 1, destWidth);                      \
                    *dest = toOrr;                                                                                    \
                }                                                                                                     \
            }                                                                                                         \
        }                                                                                                             \
        if (tableFlag) {                                                                                              \
            destI += 2;                                                                                                \
        } else {                                                                                                      \
            destI += 1;                                                                                                \
        }                                                                                                             \
        src += 8;                                                                                                     \
    }                                                                                                                 \
}

void CopyGlyphToWindow(Window *window, u8 *glyphPixels, u16 srcWidth, u16 srcHeight, u16 destX, u16 destY, u16 table) {
    u8 *windowPixels;
    u16 destWidth, destHeight;
    int srcRight, srcBottom;
    u8 glyphSizeParam;

    windowPixels = (u8 *)window->pixelBuffer;
    destWidth = (u16)(window->width * 8);
    destHeight = (u16)(window->height * 8);

    // Don't overflow the window
    if (destWidth - destX < srcWidth) {
        srcRight = destWidth - destX;
    } else {
        srcRight = srcWidth;
    }
    if (destHeight - destY < srcHeight) {
        srcBottom = destHeight - destY;
    } else {
        srcBottom = srcHeight;
    }

    // Get the max glyph dimensions
    // Default: 1x1
    glyphSizeParam = 0;
    if (srcRight > 8) {
        glyphSizeParam |= 1; // 2 wide
    }
    if (srcBottom > 8) {
        glyphSizeParam |= 2; // 2 high
    }

    if (window->colorMode == GF_BG_CLR_4BPP) {
        switch (glyphSizeParam) {
            case 0: // 1x1
                GLYPH_COPY_4BPP(glyphPixels, 0, 0, srcRight, srcBottom, windowPixels, destX, destY, ConvertPixelsToTiles(destWidth), table);
                return;

            case 1: // 2x1
                GLYPH_COPY_4BPP(glyphPixels, 0, 0, 8, srcBottom, windowPixels, destX, destY, ConvertPixelsToTiles(destWidth), table);
                GLYPH_COPY_4BPP(glyphPixels, 8, 0, srcRight - 8, srcBottom, windowPixels, destX, destY, ConvertPixelsToTiles(destWidth), table);
                return;

            case 2: // 1x2
                GLYPH_COPY_4BPP(glyphPixels, 0, 0, srcRight, 8, windowPixels, destX, destY, ConvertPixelsToTiles(destWidth), table);
                GLYPH_COPY_4BPP(glyphPixels, 0, 8, srcRight, srcBottom - 8, windowPixels, destX, destY, ConvertPixelsToTiles(destWidth), table);
                return;

            case 3: // 2x2
                GLYPH_COPY_4BPP(glyphPixels, 0, 0, 8, 8, windowPixels, destX, destY, ConvertPixelsToTiles(destWidth), table);
                GLYPH_COPY_4BPP(glyphPixels, 8, 0, srcRight - 8, 8, windowPixels, destX, destY, ConvertPixelsToTiles(destWidth), table);
                GLYPH_COPY_4BPP(glyphPixels, 0, 8, 8, srcBottom - 8, windowPixels, destX, destY, ConvertPixelsToTiles(destWidth), table);
                GLYPH_COPY_4BPP(glyphPixels, 8, 8, srcRight - 8, srcBottom - 8, windowPixels, destX, destY, ConvertPixelsToTiles(destWidth), table);
                return;
        }
    } else { // 8bpp
        u8 *convertedSrc;
        convertedSrc = Convert4bppTo8bpp(glyphPixels, srcWidth * 4 * srcHeight * 8, window->paletteNum, window->bgConfig->heapId);
        switch (glyphSizeParam) {
            case 0: // 1x1
                GLYPH_COPY_8BPP(convertedSrc, 0, 0, srcRight, srcBottom, windowPixels, destX, destY, ConvertPixelsToTiles(destWidth), table);
                break;

            case 1: // 2x1
                GLYPH_COPY_8BPP(convertedSrc, 0, 0, 8, srcBottom, windowPixels, destX, destY, ConvertPixelsToTiles(destWidth), table);
                GLYPH_COPY_8BPP(convertedSrc, 8, 0, srcRight - 8, srcBottom, windowPixels, destX, destY, ConvertPixelsToTiles(destWidth), table);
                break;

            case 2: // 1x2
                GLYPH_COPY_8BPP(convertedSrc, 0, 0, srcRight, 8, windowPixels, destX, destY, ConvertPixelsToTiles(destWidth), table);
                GLYPH_COPY_8BPP(convertedSrc, 0, 8, srcRight, srcBottom - 8, windowPixels, destX, destY, ConvertPixelsToTiles(destWidth), table);
                break;

            case 3: // 2x2
                GLYPH_COPY_8BPP(convertedSrc, 0, 0, 8, 8, windowPixels, destX, destY, ConvertPixelsToTiles(destWidth), table);
                GLYPH_COPY_8BPP(convertedSrc, 8, 0, srcRight - 8, 8, windowPixels, destX, destY, ConvertPixelsToTiles(destWidth), table);
                GLYPH_COPY_8BPP(convertedSrc, 0, 8, 8, srcBottom - 8, windowPixels, destX, destY, ConvertPixelsToTiles(destWidth), table);
                GLYPH_COPY_8BPP(convertedSrc, 8, 8, srcRight - 8, srcBottom - 8, windowPixels, destX, destY, ConvertPixelsToTiles(destWidth), table);
                break;
        }
        FreeToHeap(convertedSrc);
    }
}

void ScrollWindow(Window *window, u8 direction, u8 y, u8 fillValue) {
    if (window->bgConfig->bgs[window->bgId].colorMode == GF_BG_CLR_4BPP) {
        ScrollWindow4bpp(window, direction, y, fillValue);
    } else {
        ScrollWindow8bpp(window, direction, y, fillValue);
    }
}

static void ScrollWindow4bpp(Window *window, u8 direction, u8 y, u8 fillValue) {
    u8 *pixelBuffer;
    int y0, y1, y2;
    int fillWord, size;
    u32 width;
    int i, j;

    pixelBuffer = window->pixelBuffer;
    fillWord = (fillValue << 24) | (fillValue << 16) | (fillValue << 8) | (fillValue << 0);
    size = window->height * window->width * TILE_SIZE_4BPP;
    width = window->width;

    switch (direction) {
        case 0: // up
            for (i = 0; i < size; i += TILE_SIZE_4BPP) {
                y0 = y;
                for (j = 0; j < 8; j++) {
                    y1 = i + (j << 2);
                    y2 = i + (((width * (y0 & ~7)) | (y0 & 7)) << 2);
                    if (y2 < size) {
                        *(u32 *)(pixelBuffer + y1) = *(u32 *)(pixelBuffer + y2);
                    } else {
                        *(u32 *)(pixelBuffer + y1) = fillWord;
                    }
                    y0++;
                }
            }
            break;
        case 1: // down
            pixelBuffer += size - 4;
            for (i = 0; i < size; i += TILE_SIZE_4BPP) {
                y0 = y;
                for (j = 0; j < 8; j++) {
                    y1 = i + (j << 2);
                    y2 = i + (((width * (y0 & ~7)) | (y0 & 7)) << 2);
                    if (y2 < size) {
                        *(u32 *)(pixelBuffer - y1) = *(u32 *)(pixelBuffer - y2);
                    } else {
                        *(u32 *)(pixelBuffer - y1) = fillWord;
                    }
                    y0++;
                }
            }
            break;
        case 2: // left
        case 3: // right
            break;
    }
}

static void ScrollWindow8bpp(Window *window, u8 direction, u8 y, u8 fillValue) {
    u8 *pixelBuffer;
    int y0, y1, y2;
    int fillWord, size;
    u32 width;
    int i, j;

    pixelBuffer = window->pixelBuffer;
    fillWord = (fillValue << 24) | (fillValue << 16) | (fillValue << 8) | (fillValue << 0);
    size = window->height * window->width * TILE_SIZE_8BPP;
    width = window->width;

    switch (direction) {
        case 0: // up
            for (i = 0; i < size; i += TILE_SIZE_8BPP) {
                y0 = y;
                for (j = 0; j < 8; j++) {
                    y1 = i + (j << 3);
                    y2 = i + (((width * (y0 & ~7)) | (y0 & 7)) << 3);
                    if (y2 < size) {
                        *(u32 *)(pixelBuffer + y1) = *(u32 *)(pixelBuffer + y2);
                    } else {
                        *(u32 *)(pixelBuffer + y1) = fillWord;
                    }
                    y1 += 4;
                    y2 += 4;
                    if (y2 < size + 4) {
                        *(u32 *)(pixelBuffer + y1) = *(u32 *)(pixelBuffer + y2);
                    } else {
                        *(u32 *)(pixelBuffer + y1) = fillWord;
                    }
                    y0++;
                }
            }
            break;
        case 1: // down
            pixelBuffer += size - 8;
            for (i = 0; i < size; i += TILE_SIZE_8BPP) {
                y0 = y;
                for (j = 0; j < 8; j++) {
                    y1 = i + (j << 3);
                    y2 = i + (((width * (y0 & ~7)) | (y0 & 7)) << 3);
                    if (y2 < size) {
                        *(u32 *)(pixelBuffer - y1) = *(u32 *)(pixelBuffer - y2);
                    } else {
                        *(u32 *)(pixelBuffer - y1) = fillWord;
                    }
                    y1 -= 4;
                    y2 -= 4;
                    if (y2 < size - 4) {
                        *(u32 *)(pixelBuffer - y1) = *(u32 *)(pixelBuffer - y2);
                    } else {
                        *(u32 *)(pixelBuffer - y1) = fillWord;
                    }
                    y0++;
                }
            }
            break;
        case 2: // left
        case 3: // right
            break;
    }
}

BgConfig *GetWindowBgConfig(Window *window) {
    return window->bgConfig;
}

u8 GetWindowBgId(Window *window) {
    return window->bgId;
}

u8 GetWindowWidth(Window *window) {
    return window->width;
}

u8 GetWindowHeight(Window *window) {
    return window->height;
}

u8 GetWindowX(Window *window) {
    return window->tilemapLeft;
}

u8 GetWindowY(Window *window) {
    return window->tilemapTop;
}

u16 GetWindowBaseTile(Window *window) {
    return window->baseTile;
}

void SetWindowX(Window *window, u8 x) {
    window->tilemapLeft = x;
}

void SetWindowY(Window *window, u8 y) {
    window->tilemapTop = y;
}

void SetWindowPaletteNum(Window *window, u8 paletteNum) {
    window->paletteNum = paletteNum;
}

void DoScheduledBgGpuUpdates(BgConfig *bgConfig) {
    BgConfig_HandleScheduledScrolls(bgConfig);
    BgConfig_HandleScheduledBufferTransfers(bgConfig);
    bgConfig->scrollScheduled = 0;
    bgConfig->bufferTransferScheduled = 0;
}

static void BgConfig_HandleScheduledBufferTransfers(BgConfig *bgConfig) {
    if (bgConfig->bufferTransferScheduled & (1 << GF_BG_LYR_MAIN_0)) {
        LoadBgVramScr(GF_BG_LYR_MAIN_0, bgConfig->bgs[GF_BG_LYR_MAIN_0].tilemapBuffer, bgConfig->bgs[GF_BG_LYR_MAIN_0].baseTile * 2, bgConfig->bgs[GF_BG_LYR_MAIN_0].bufferSize);
    }
    if (bgConfig->bufferTransferScheduled & (1 << GF_BG_LYR_MAIN_1)) {
        LoadBgVramScr(GF_BG_LYR_MAIN_1, bgConfig->bgs[GF_BG_LYR_MAIN_1].tilemapBuffer, bgConfig->bgs[GF_BG_LYR_MAIN_1].baseTile * 2, bgConfig->bgs[GF_BG_LYR_MAIN_1].bufferSize);
    }
    if (bgConfig->bufferTransferScheduled & (1 << GF_BG_LYR_MAIN_2)) {
        LoadBgVramScr(GF_BG_LYR_MAIN_2, bgConfig->bgs[GF_BG_LYR_MAIN_2].tilemapBuffer, bgConfig->bgs[GF_BG_LYR_MAIN_2].baseTile * 2, bgConfig->bgs[GF_BG_LYR_MAIN_2].bufferSize);
    }
    if (bgConfig->bufferTransferScheduled & (1 << GF_BG_LYR_MAIN_3)) {
        LoadBgVramScr(GF_BG_LYR_MAIN_3, bgConfig->bgs[GF_BG_LYR_MAIN_3].tilemapBuffer, bgConfig->bgs[GF_BG_LYR_MAIN_3].baseTile * 2, bgConfig->bgs[GF_BG_LYR_MAIN_3].bufferSize);
    }
    if (bgConfig->bufferTransferScheduled & (1 << GF_BG_LYR_SUB_0)) {
        LoadBgVramScr(GF_BG_LYR_SUB_0, bgConfig->bgs[GF_BG_LYR_SUB_0].tilemapBuffer, bgConfig->bgs[GF_BG_LYR_SUB_0].baseTile * 2, bgConfig->bgs[GF_BG_LYR_SUB_0].bufferSize);
    }
    if (bgConfig->bufferTransferScheduled & (1 << GF_BG_LYR_SUB_1)) {
        LoadBgVramScr(GF_BG_LYR_SUB_1, bgConfig->bgs[GF_BG_LYR_SUB_1].tilemapBuffer, bgConfig->bgs[GF_BG_LYR_SUB_1].baseTile * 2, bgConfig->bgs[GF_BG_LYR_SUB_1].bufferSize);
    }
    if (bgConfig->bufferTransferScheduled & (1 << GF_BG_LYR_SUB_2)) {
        LoadBgVramScr(GF_BG_LYR_SUB_2, bgConfig->bgs[GF_BG_LYR_SUB_2].tilemapBuffer, bgConfig->bgs[GF_BG_LYR_SUB_2].baseTile * 2, bgConfig->bgs[GF_BG_LYR_SUB_2].bufferSize);
    }
    if (bgConfig->bufferTransferScheduled & (1 << GF_BG_LYR_SUB_3)) {
        LoadBgVramScr(GF_BG_LYR_SUB_3, bgConfig->bgs[GF_BG_LYR_SUB_3].tilemapBuffer, bgConfig->bgs[GF_BG_LYR_SUB_3].baseTile * 2, bgConfig->bgs[GF_BG_LYR_SUB_3].bufferSize);
    }
}

void ScheduleBgTilemapBufferTransfer(BgConfig *bgConfig, u8 bgId) {
    bgConfig->bufferTransferScheduled |= 1 << bgId;
}

static void BgConfig_HandleScheduledScrolls(BgConfig *bgConfig) {
    if (bgConfig->scrollScheduled & (1 << GF_BG_LYR_MAIN_0)) {
        G2_SetBG0Offset(bgConfig->bgs[GF_BG_LYR_MAIN_0].hOffset, bgConfig->bgs[GF_BG_LYR_MAIN_0].vOffset);
    }
    if (bgConfig->scrollScheduled & (1 << GF_BG_LYR_MAIN_1)) {
        G2_SetBG1Offset(bgConfig->bgs[GF_BG_LYR_MAIN_1].hOffset, bgConfig->bgs[GF_BG_LYR_MAIN_1].vOffset);
    }
    if (bgConfig->scrollScheduled & (1 << GF_BG_LYR_MAIN_2)) {
        if (bgConfig->bgs[GF_BG_LYR_MAIN_2].mode == GF_BG_TYPE_TEXT) {
            G2_SetBG2Offset(bgConfig->bgs[GF_BG_LYR_MAIN_2].hOffset, bgConfig->bgs[GF_BG_LYR_MAIN_2].vOffset);
        } else {
            MtxFx22 mtx;
            MTX22_2DAffine(&mtx, bgConfig->bgs[GF_BG_LYR_MAIN_2].rotation, bgConfig->bgs[GF_BG_LYR_MAIN_2].xScale, bgConfig->bgs[GF_BG_LYR_MAIN_2].yScale, 2);
            G2_SetBG2Affine(&mtx, bgConfig->bgs[GF_BG_LYR_MAIN_2].centerX, bgConfig->bgs[GF_BG_LYR_MAIN_2].centerY, bgConfig->bgs[GF_BG_LYR_MAIN_2].hOffset, bgConfig->bgs[GF_BG_LYR_MAIN_2].vOffset);
        }
    }
    if (bgConfig->scrollScheduled & (1 << GF_BG_LYR_MAIN_3)) {
        if (bgConfig->bgs[GF_BG_LYR_MAIN_3].mode == GF_BG_TYPE_TEXT) {
            G2_SetBG3Offset(bgConfig->bgs[GF_BG_LYR_MAIN_3].hOffset, bgConfig->bgs[GF_BG_LYR_MAIN_3].vOffset);
        } else {
            MtxFx22 mtx;
            MTX22_2DAffine(&mtx, bgConfig->bgs[GF_BG_LYR_MAIN_3].rotation, bgConfig->bgs[GF_BG_LYR_MAIN_3].xScale, bgConfig->bgs[GF_BG_LYR_MAIN_3].yScale, 2);
            G2_SetBG3Affine(&mtx, bgConfig->bgs[GF_BG_LYR_MAIN_3].centerX, bgConfig->bgs[GF_BG_LYR_MAIN_3].centerY, bgConfig->bgs[GF_BG_LYR_MAIN_3].hOffset, bgConfig->bgs[GF_BG_LYR_MAIN_3].vOffset);
        }
    }
    if (bgConfig->scrollScheduled & (1 << GF_BG_LYR_SUB_0)) {
        G2S_SetBG0Offset(bgConfig->bgs[GF_BG_LYR_SUB_0].hOffset, bgConfig->bgs[GF_BG_LYR_SUB_0].vOffset);
    }
    if (bgConfig->scrollScheduled & (1 << GF_BG_LYR_SUB_1)) {
        G2S_SetBG1Offset(bgConfig->bgs[GF_BG_LYR_SUB_1].hOffset, bgConfig->bgs[GF_BG_LYR_SUB_1].vOffset);
    }
    if (bgConfig->scrollScheduled & (1 << GF_BG_LYR_SUB_2)) {
        if (bgConfig->bgs[GF_BG_LYR_SUB_2].mode == GF_BG_TYPE_TEXT) {
            G2S_SetBG2Offset(bgConfig->bgs[GF_BG_LYR_SUB_2].hOffset, bgConfig->bgs[GF_BG_LYR_SUB_2].vOffset);
        } else {
            MtxFx22 mtx;
            MTX22_2DAffine(&mtx, bgConfig->bgs[GF_BG_LYR_SUB_2].rotation, bgConfig->bgs[GF_BG_LYR_SUB_2].xScale, bgConfig->bgs[GF_BG_LYR_SUB_2].yScale, 2);
            G2S_SetBG2Affine(&mtx, bgConfig->bgs[GF_BG_LYR_SUB_2].centerX, bgConfig->bgs[GF_BG_LYR_SUB_2].centerY, bgConfig->bgs[GF_BG_LYR_SUB_2].hOffset, bgConfig->bgs[GF_BG_LYR_SUB_2].vOffset);
        }
    }
    if (bgConfig->scrollScheduled & (1 << GF_BG_LYR_SUB_3)) {
        if (bgConfig->bgs[GF_BG_LYR_SUB_3].mode == GF_BG_TYPE_TEXT) {
            G2S_SetBG3Offset(bgConfig->bgs[GF_BG_LYR_SUB_3].hOffset, bgConfig->bgs[GF_BG_LYR_SUB_3].vOffset);
        } else {
            MtxFx22 mtx;
            MTX22_2DAffine(&mtx, bgConfig->bgs[GF_BG_LYR_SUB_3].rotation, bgConfig->bgs[GF_BG_LYR_SUB_3].xScale, bgConfig->bgs[GF_BG_LYR_SUB_3].yScale, 2);
            G2S_SetBG3Affine(&mtx, bgConfig->bgs[GF_BG_LYR_SUB_3].centerX, bgConfig->bgs[GF_BG_LYR_SUB_3].centerY, bgConfig->bgs[GF_BG_LYR_SUB_3].hOffset, bgConfig->bgs[GF_BG_LYR_SUB_3].vOffset);
        }
    }
}

void ScheduleSetBgPosText(BgConfig *bgConfig, u8 bgId, enum BgPosAdjustOp op, fx32 value) {
    Bg_SetPosText(&bgConfig->bgs[bgId], op, value);
    bgConfig->scrollScheduled |= 1 << bgId;
}

void ScheduleSetBgAffineScale(BgConfig *bgConfig, u8 bgId, enum BgPosAdjustOp op, fx32 value) {
    Bg_SetAffineScale(&bgConfig->bgs[bgId], op, value);
    bgConfig->scrollScheduled |= 1 << bgId;
}

static void Bg_SetAffineScale(Background *bg, enum BgPosAdjustOp op, fx32 value) {
    switch (op) {
        case BG_POS_OP_SET_XSCALE:
            bg->xScale = value;
            break;
        case BG_POS_OP_ADD_XSCALE:
            bg->xScale += value;
            break;
        case BG_POS_OP_SUB_XSCALE:
            bg->xScale -= value;
            break;
        case BG_POS_OP_SET_YSCALE:
            bg->yScale = value;
            break;
        case BG_POS_OP_ADD_YSCALE:
            bg->yScale += value;
            break;
        case BG_POS_OP_SUB_YSCALE:
            bg->yScale -= value;
            break;
    }
}

BOOL DoesPixelAtScreenXYMatchPtrVal(BgConfig *bgConfig, u8 bgId, u8 x, u8 y, u16 *src) {
    u8 *bgCharPtr;
    u16 tilemapIdx;
    u8 xPixOffs;
    u8 yPixOffs;
    u8 pixelValue;
    u8 i;
    if (bgConfig->bgs[bgId].tilemapBuffer == NULL) {
        return FALSE;
    }

    tilemapIdx = GetTileMapIndexFromCoords(x >> 3, y >> 3, bgConfig->bgs[bgId].size, bgConfig->bgs[bgId].mode);
    bgCharPtr = BgGetCharPtr(bgId);
    xPixOffs = x & 7;
    yPixOffs = y & 7;
    if (bgConfig->bgs[bgId].colorMode == GX_BG_COLORMODE_16) {
        u16 *tilemapBuffer = bgConfig->bgs[bgId].tilemapBuffer;
        u8 *tile = AllocFromHeapAtEnd(bgConfig->heapId, 0x40);

        bgCharPtr += (tilemapBuffer[tilemapIdx] & 0x3FF) * TILE_SIZE_4BPP;
        for (i = 0; i < TILE_SIZE_4BPP; i++) {
            tile[i * 2] = bgCharPtr[i] & 0xF;
            tile[i * 2 + 1] = bgCharPtr[i] >> 4;
        }
        ApplyFlipFlagsToTile(bgConfig, (tilemapBuffer[tilemapIdx] >> 10) & 3, tile);
        pixelValue = tile[xPixOffs + yPixOffs * 8];
        FreeToHeap(tile);
        if ((src[0] & (1 << pixelValue)) != 0) {
            return TRUE;
        }
    } else {
        if (bgConfig->bgs[bgId].mode != GF_BG_TYPE_AFFINE) {
            u16 *tilemapBuffer = bgConfig->bgs[bgId].tilemapBuffer;
            u8 *tile = AllocFromHeapAtEnd(bgConfig->heapId, 0x40);

            memcpy(tile, bgCharPtr + (tilemapBuffer[tilemapIdx] & 0x3FF) * TILE_SIZE_8BPP, TILE_SIZE_8BPP);
            ApplyFlipFlagsToTile(bgConfig, (tilemapBuffer[tilemapIdx] >> 10) & 3, tile);
            pixelValue = tile[xPixOffs + yPixOffs * 8];
            FreeToHeap(tile);
        } else {
            pixelValue = bgCharPtr[((u8 *)bgConfig->bgs[bgId].tilemapBuffer)[tilemapIdx] * TILE_SIZE_8BPP + xPixOffs + yPixOffs * 8];
        }
        // BUG: Infinite loop
        while (TRUE) {
            if (src[0] == 0xFFFF) {
                break;
            }
            if (pixelValue == (u8)(src[0])) {
                return TRUE;
            }
        }
    }
    return FALSE;
}

static void ApplyFlipFlagsToTile(BgConfig *bgConfig, u8 flags, u8 *tile) {
    u8 i, j;
    if (flags != 0) {
        u8 *buffer = AllocFromHeapAtEnd(bgConfig->heapId, 0x40);
        if ((flags & 1) != 0) { // hflip
            for (i = 0; i < 8; i++) {
                for (j = 0; j < 8; j++) {
                    buffer[i * 8 + j] = tile[i * 8 + (7 - j)];
                }
            }
            memcpy(tile, buffer, 0x40);
        }
        if ((flags & 2) != 0) { // vflip
            for (i = 0; i < 8; i++) {
                memcpy(&buffer[i * 8], &tile[(7 - i) * 8], 8);
            }
            memcpy(tile, buffer, 0x40);
        }
        FreeToHeap(buffer);
    }
}
