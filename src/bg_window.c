#include "window.h"
#include "math_util.h"

u8 TranslateGFBgModePairToGXScreenSize(enum GFBgScreenSize size, enum GFBgType type);
void Bg_SetPosText(BG *bg, enum BgPosAdjustOp, fx32 value);
void SetBgAffine(BGCONFIG *bgConfig, u8 layer, MtxFx22 *mtx, fx32 centerX, fx32 centerY);
void BgAffineReset(BGCONFIG *bgConfig, u8 layer);

// Make a new BGCONFIG object, which manages the
// eight background layers (two on each screen).
BGCONFIG *BgConfig_Alloc(HeapID heapId) {
    BGCONFIG *ret = AllocFromHeap(heapId, sizeof(BGCONFIG));
    memset(ret, 0, sizeof(BGCONFIG));
    ret->heap_id = heapId;
    ret->scrollScheduled = 0;         // redundant to above memset
    ret->bufferTransferScheduled = 0; // redundant to above memset
    return ret;
}

HeapID BgConfig_GetHeapId(BGCONFIG *bgConfig) {
    return bgConfig->heap_id;
}

void SetBothScreensModesAndDisable(const struct GFBgModeSet *modeSet) {
    GX_SetGraphicsMode(modeSet->dispMode, modeSet->bgModeMain, modeSet->_2d3dSwitch);
    GXS_SetGraphicsMode(modeSet->bgModeSub);
    GX_SetBGScrOffset(GX_BGSCROFFSET_0x00000);
    GX_SetBGCharOffset(GX_BGCHAROFFSET_0x00000);
    GX_DisableEngineALayers();
    GX_DisableEngineBLayers();
}

void SetScreenModeAndDisable(const struct GFBgModeSet *modeSet, enum GFScreen screen) {
    if (screen == SCREEN_MAIN) {
        GX_SetGraphicsMode(modeSet->dispMode, modeSet->bgModeMain, modeSet->_2d3dSwitch);
        GX_DisableEngineALayers();
    } else {
        GXS_SetGraphicsMode(modeSet->bgModeSub);
        GX_DisableEngineBLayers();
    }
}

void InitBgFromTemplateEx(BGCONFIG *bgConfig, u8 bgId, const BGTEMPLATE *template, u8 bgMode, GX_LayerToggle enable) {
    u8 screenSize = TranslateGFBgModePairToGXScreenSize(template->size, bgMode);

    switch (bgId) {
    case GF_BG_LYR_MAIN_0:
        GX_EngineAToggleLayers(GF_BG_LYR_MAIN_0_F, enable);
        G2_SetBG0Control(screenSize, template->colorMode, template->screenBase, template->charBase, template->bgExtPltt);
        G2_SetBG0Priority(template->priority);
        G2_BG0Mosaic(template->mosaic);
        break;

    case GF_BG_LYR_MAIN_1:
        GX_EngineAToggleLayers(GF_BG_LYR_MAIN_1_F, enable);
        G2_SetBG1Control(screenSize, template->colorMode, template->screenBase, template->charBase, template->bgExtPltt);
        G2_SetBG1Priority(template->priority);
        G2_BG1Mosaic(template->mosaic);
        break;

    case GF_BG_LYR_MAIN_2:
        GX_EngineAToggleLayers(GF_BG_LYR_MAIN_2_F, enable);
        switch (bgMode) {
        default:
        case GF_BG_TYPE_TEXT:
            G2_SetBG2ControlText(screenSize, template->colorMode, template->screenBase, template->charBase);
            break;
        case GF_BG_TYPE_AFFINE:
            G2_SetBG2ControlAffine(screenSize, template->areaOver, template->screenBase, template->charBase);
            break;
        case GF_BG_TYPE_256x16PLTT:
            G2_SetBG2Control256x16Pltt(screenSize, template->areaOver, template->screenBase, template->charBase);
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
            G2_SetBG3ControlText(screenSize, template->colorMode, template->screenBase, template->charBase);
            break;
        case GF_BG_TYPE_AFFINE:
            G2_SetBG3ControlAffine(screenSize, template->areaOver, template->screenBase, template->charBase);
            break;
        case GF_BG_TYPE_256x16PLTT:
            G2_SetBG3Control256x16Pltt(screenSize, template->areaOver, template->screenBase, template->charBase);
            break;
        }
        G2_SetBG3Priority(template->priority);
        G2_BG3Mosaic(template->mosaic);
        break;

    case GF_BG_LYR_SUB_0:
        GX_EngineBToggleLayers(GF_BG_LYR_SUB_0_F, enable);
        G2S_SetBG0Control(screenSize, template->colorMode, template->screenBase, template->charBase, template->bgExtPltt);
        G2S_SetBG0Priority(template->priority);
        G2S_BG0Mosaic(template->mosaic);
        break;

    case GF_BG_LYR_SUB_1:
        GX_EngineBToggleLayers(GF_BG_LYR_SUB_1_F, enable);
        G2S_SetBG1Control(screenSize, template->colorMode, template->screenBase, template->charBase, template->bgExtPltt);
        G2S_SetBG1Priority(template->priority);
        G2S_BG1Mosaic(template->mosaic);
        break;

    case GF_BG_LYR_SUB_2:
        GX_EngineBToggleLayers(GF_BG_LYR_SUB_2_F, enable);
        switch (bgMode) {
        default:
        case GF_BG_TYPE_TEXT:
            G2S_SetBG2ControlText(screenSize, template->colorMode, template->screenBase, template->charBase);
            break;
        case GF_BG_TYPE_AFFINE:
            G2S_SetBG2ControlAffine(screenSize, template->areaOver, template->screenBase, template->charBase);
            break;
        case GF_BG_TYPE_256x16PLTT:
            G2S_SetBG2Control256x16Pltt(screenSize, template->areaOver, template->screenBase, template->charBase);
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
            G2S_SetBG3ControlText(screenSize, template->colorMode, template->screenBase, template->charBase);
            break;
        case GF_BG_TYPE_AFFINE:
            G2S_SetBG3ControlAffine(screenSize, template->areaOver, template->screenBase, template->charBase);
            break;
        case GF_BG_TYPE_256x16PLTT:
            G2S_SetBG3Control256x16Pltt(screenSize, template->areaOver, template->screenBase, template->charBase);
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
        bgConfig->bgs[bgId].tilemapBuffer = AllocFromHeap(bgConfig->heap_id, template->bufferSize);

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

void InitBgFromTemplate(BGCONFIG *bgConfig, u8 bgId, const BGTEMPLATE *template, u8 bgMode) {
    InitBgFromTemplateEx(bgConfig, bgId, template, bgMode, GX_LAYER_TOGGLE_ON);
}

void SetBgControlParam(BGCONFIG *config, u8 bgId, enum GFBgCntSet attr, u8 value) {
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
        screenSize = TranslateGFBgModePairToGXScreenSize(config->bgs[bgId].size, value);
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

        G2_SetBG0Control(bg0cnt.screenSize, config->bgs[bgId].colorMode, bg0cnt.screenBase, bg0cnt.charBase, bg0cnt.bgExtPltt);
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

        G2_SetBG1Control(bg1cnt.screenSize, config->bgs[bgId].colorMode, bg1cnt.screenBase, bg1cnt.charBase, bg1cnt.bgExtPltt);
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

            G2_SetBG2ControlText(bg2cnt_tx.screenSize, config->bgs[bgId].colorMode, bg2cnt_tx.screenBase, bg2cnt_tx.charBase);
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

            G2_SetBG2ControlAffine(bg2cnt_aff.screenSize, bg2cnt_aff.areaOver, bg2cnt_aff.screenBase,
                                   bg2cnt_aff.charBase);
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

            G2_SetBG2Control256x16Pltt(bg2cnt_256x16pltt.screenSize, bg2cnt_256x16pltt.areaOver,
                                       bg2cnt_256x16pltt.screenBase, bg2cnt_256x16pltt.charBase);
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

            G2_SetBG3ControlText(bg3cnt_tx.screenSize, config->bgs[bgId].colorMode, bg3cnt_tx.screenBase, bg3cnt_tx.charBase);
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

            G2_SetBG3ControlAffine(bg3cnt_aff.screenSize, bg3cnt_aff.areaOver, bg3cnt_aff.screenBase,
                                   bg3cnt_aff.charBase);
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

            G2_SetBG3Control256x16Pltt(bg3cnt_256x16pltt.screenSize, bg3cnt_256x16pltt.areaOver,
                                       bg3cnt_256x16pltt.screenBase, bg3cnt_256x16pltt.charBase);
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

        G2S_SetBG0Control(bg0cntsub.screenSize, config->bgs[bgId].colorMode, bg0cntsub.screenBase, bg0cntsub.charBase, bg0cntsub.bgExtPltt);
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

        G2S_SetBG1Control(bg1cntsub.screenSize, config->bgs[bgId].colorMode, bg1cntsub.screenBase, bg1cntsub.charBase, bg1cntsub.bgExtPltt);
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

            G2S_SetBG2ControlText(bg2cntsub_tx.screenSize, config->bgs[bgId].colorMode, bg2cntsub_tx.screenBase, bg2cntsub_tx.charBase);
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

            G2S_SetBG2ControlAffine(bg2cntsub_aff.screenSize, bg2cntsub_aff.areaOver, bg2cntsub_aff.screenBase,
                                    bg2cntsub_aff.charBase);
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

            G2S_SetBG2Control256x16Pltt(bg2cntsub_256x16pltt.screenSize, bg2cntsub_256x16pltt.areaOver,
                                        bg2cntsub_256x16pltt.screenBase, bg2cntsub_256x16pltt.charBase);
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

            G2S_SetBG3ControlText(bg3cntsub_tx.screenSize, config->bgs[bgId].colorMode, bg3cntsub_tx.screenBase, bg3cntsub_tx.charBase);
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

            G2S_SetBG3ControlAffine(bg3cntsub_aff.screenSize, bg3cntsub_aff.areaOver, bg3cntsub_aff.screenBase,
                                    bg3cntsub_aff.charBase);
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

            G2S_SetBG3Control256x16Pltt(bg3cntsub_256x16pltt.screenSize, bg3cntsub_256x16pltt.areaOver,
                                        bg3cntsub_256x16pltt.screenBase, bg3cntsub_256x16pltt.charBase);
            break;
        }
        break;
    }
}

u8 TranslateGFBgModePairToGXScreenSize(enum GFBgScreenSize size, enum GFBgType type) {
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

void GetBgScreenDimensions(u32 screenSize, u8 *width_p, u8 *height_p) {
    switch (screenSize) {
    case GF_BG_SCR_SIZE_128x128:
        *width_p = 0x10;
        *height_p = 0x10;
        break;
    case GF_BG_SCR_SIZE_256x256:
        *width_p = 0x20;
        *height_p = 0x20;
        break;
    case GF_BG_SCR_SIZE_256x512:
        *width_p = 0x20;
        *height_p = 0x40;
        break;
    case GF_BG_SCR_SIZE_512x256:
        *width_p = 0x40;
        *height_p = 0x20;
        break;
    case GF_BG_SCR_SIZE_512x512:
        *width_p = 0x40;
        *height_p = 0x40;
        break;
    case GF_BG_SCR_SIZE_1024x1024:
        *width_p = 0x80;
        *height_p = 0x80;
        break;
    }
}

void FreeBgTilemapBuffer(BGCONFIG *bgConfig, u8 layer) {
    if (bgConfig->bgs[layer].tilemapBuffer != NULL) {
        FreeToHeap(bgConfig->bgs[layer].tilemapBuffer);
        bgConfig->bgs[layer].tilemapBuffer = NULL;
    }
}

void SetBgPriority(u8 layer, int priority) {
    switch (layer) {
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

void ToggleBgLayer(u8 layer, u8 toggle) {
    switch (layer) {
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

void BgSetPosTextAndCommit(BGCONFIG *bgConfig, enum GFBgLayer bgId, enum BgPosAdjustOp op, fx32 val) {
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

fx32 Bg_GetXpos(const BGCONFIG *bgConfig, u8 layer) {
    return bgConfig->bgs[layer].hOffset;
}

fx32 Bg_GetYpos(const BGCONFIG *bgConfig, u8 layer) {
    return bgConfig->bgs[layer].vOffset;
}

void Bg_SetTextDimAndAffineParams(BGCONFIG *bgConfig, u8 layer, enum BgPosAdjustOp op, fx32 value, MtxFx22 *mtx, fx32 centerX, fx32 centerY) {
    Bg_SetPosText(&bgConfig->bgs[layer], op, value);
    SetBgAffine(bgConfig, layer, mtx, centerX, centerY);
}

void Bg_SetPosText(BG *bg, enum BgPosAdjustOp op, fx32 value) {
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

void SetBgAffine(BGCONFIG *bgConfig, u8 layer, MtxFx22 *mtx, fx32 centerX, fx32 centerY) {
    switch (layer) {
    case GF_BG_LYR_MAIN_0:
        break;
    case GF_BG_LYR_MAIN_1:
        break;
    case GF_BG_LYR_MAIN_2:
        G2_SetBG2Affine(mtx, centerX, centerY, bgConfig->bgs[layer].hOffset, bgConfig->bgs[layer].vOffset);
        break;
    case GF_BG_LYR_MAIN_3:
        G2_SetBG3Affine(mtx, centerX, centerY, bgConfig->bgs[layer].hOffset, bgConfig->bgs[layer].vOffset);
        break;
    case GF_BG_LYR_SUB_0:
        break;
    case GF_BG_LYR_SUB_1:
        break;
    case GF_BG_LYR_SUB_2:
        G2S_SetBG2Affine(mtx, centerX, centerY, bgConfig->bgs[layer].hOffset, bgConfig->bgs[layer].vOffset);
        break;
    case GF_BG_LYR_SUB_3:
        G2S_SetBG3Affine(mtx, centerX, centerY, bgConfig->bgs[layer].hOffset, bgConfig->bgs[layer].vOffset);
        break;
    }
}

void BgAffineReset(BGCONFIG *bgConfig, u8 layer) {
    MtxFx22 mtx;
    MTX22_2DAffine(&mtx, 0, FX32_ONE, FX32_ONE, 0);
    SetBgAffine(bgConfig, layer, &mtx, 0, 0);
}

void CopyOrUncompressTilemapData(const void *src, void *dest, u32 size) {
    if (size == 0) {
        MI_UncompressLZ8(src, dest);
    } else if ((((u32)src) % 4) == 0 && (((u32)dest) % 4) == 0 && (((u16)size) % 4) == 0) {
        MI_CpuCopy32(src, dest, size);
    } else {
        MI_CpuCopy16(src, dest, size);
    }
}
