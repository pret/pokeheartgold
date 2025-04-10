#include "global.h"

#include "voltorb_flip/voltorb_flip.h"
#include "voltorb_flip/voltorb_flip_data.h"

#include "bg_window.h"
#include "gf_gfx_planes.h"
#include "sprite_system.h"

const u16 ov122_021E92A0[] = {
    0x00A0,
    0x00A1,
    0x00C0,
    0x00C1,
    0x00E0,
    0x00E1,
    0x0100,
    0x0101,
};

const struct GraphicsModes sVoltorbFlipBgModeSet = {
    GX_DISPMODE_GRAPHICS,
    GX_BGMODE_0,
    GX_BGMODE_0,
    GX_BG0_AS_2D,
};

const MsgNoList sMenuMsgNos[] = {
    { sMainMenuMsgNos, 3 },
    { sGameInfoMsgNos, 4 },
};

const u8 ov122_021E92B0[4][4] = {
    { 0x0C, 0x08, 0x05, 0x01 },
    { 0x0F, 0x0B, 0x06, 0x02 },
    { 0x0E, 0x0A, 0x07, 0x04 },
    { 0x0D, 0x09, 0x08, 0x08 },
};

const OamCharTransferParam ov122_021E92D0 = {
    0x00000000,
    0x00020000,
    0x00004000,
    GX_OBJVRAMMODE_CHAR_1D_32K,
    GX_OBJVRAMMODE_CHAR_1D_32K,
};

const SpriteResourceCountsListUnion ov122_021E92E4 = { 2, 2, 2, 2, 0, 0 };

const OamManagerParam ov122_021E92FC = { 0, 126, 0, 32, 1, 126, 0, 32 };

const GraphicsBanks sVoltorbFlipGraphicsBanks = {
    GX_VRAM_BG_128_B,
    GX_VRAM_BGEXTPLTT_NONE,
    GX_VRAM_SUB_BG_128_C,
    GX_VRAM_SUB_BGEXTPLTT_NONE,
    GX_VRAM_OBJ_128_A,
    GX_VRAM_OBJEXTPLTT_NONE,
    GX_VRAM_SUB_OBJ_16_I,
    GX_VRAM_SUB_OBJEXTPLTT_NONE,
    GX_VRAM_TEX_NONE,
    GX_VRAM_TEXPLTT_NONE,
};

const Ov122_021E6C2C ov122_021E9344[4] = {
    { 0x00, 0x00, 0x21 },
    { 0x02, 0x00, 0x22 },
    { 0x00, 0x02, 0x23 },
    { 0x02, 0x02, 0x24 },
};

const UnkTemplate_0200D748 ov122_021E93A8 = {
    0, 0, 0, 0, 0, 0xFFFF, NNS_G2D_VRAM_TYPE_2DSUB, {
                                                     1,
                                                     1,
                                                     1,
                                                     1,
                                                     0,
                                                     0,
                                                     },
    0,
    0
};

const UnkTemplate_0200D748 ov122_021E9374 = {
    0, 0, 0, 0, 0, 0xFFFF, NNS_G2D_VRAM_TYPE_2DMAIN, {
                                                      0,
                                                      0,
                                                      0,
                                                      0,
                                                      0,
                                                      0,
                                                      },
    3,
    0
};

const WindowTemplate sVoltorbFlipWindowTemplates[17] = {
    {
     .bgId = 0x03,
     .left = 0x02,
     .top = 0x13,
     .width = 0x1B,
     .height = 0x04,
     .palette = 0x0C,
     .baseTile = 0x00A2,

     },
    {
     .bgId = 0x03,
     .left = 0x02,
     .top = 0x15,
     .width = 0x1B,
     .height = 0x02,
     .palette = 0x0C,
     .baseTile = 0x00A2,

     },
    {
     .bgId = 0x01,
     .left = 0x19,
     .top = 0x04,
     .width = 0x06,
     .height = 0x06,
     .palette = 0x0E,
     .baseTile = 0x010E,

     },
    {
     .bgId = 0x01,
     .left = 0x19,
     .top = 0x15,
     .width = 0x06,
     .height = 0x02,
     .palette = 0x0E,
     .baseTile = 0x0132,

     },
    {
     .bgId = 0x05,
     .left = 0x01,
     .top = 0x01,
     .width = 0x1E,
     .height = 0x02,
     .palette = 0x0C,
     .baseTile = 0x0001,

     },
    {
     .bgId = 0x05,
     .left = 0x01,
     .top = 0x03,
     .width = 0x1E,
     .height = 0x02,
     .palette = 0x0C,
     .baseTile = 0x003D,

     },
    {
     .bgId = 0x05,
     .left = 0x0D,
     .top = 0x06,
     .width = 0x12,
     .height = 0x03,
     .palette = 0x0C,
     .baseTile = 0x0079,

     },
    {
     .bgId = 0x05,
     .left = 0x0D,
     .top = 0x0A,
     .width = 0x12,
     .height = 0x03,
     .palette = 0x0C,
     .baseTile = 0x00AF,

     },
    {
     .bgId = 0x05,
     .left = 0x01,
     .top = 0x0E,
     .width = 0x13,
     .height = 0x04,
     .palette = 0x0C,
     .baseTile = 0x00E5,

     },
    {
     .bgId = 0x05,
     .left = 0x01,
     .top = 0x13,
     .width = 0x13,
     .height = 0x04,
     .palette = 0x0C,
     .baseTile = 0x0131,

     },
    {
     .bgId = 0x05,
     .left = 0x01,
     .top = 0x0F,
     .width = 0x07,
     .height = 0x02,
     .palette = 0x0D,
     .baseTile = 0x0001,

     },
    {
     .bgId = 0x05,
     .left = 0x01,
     .top = 0x05,
     .width = 0x1E,
     .height = 0x06,
     .palette = 0x0C,
     .baseTile = 0x000F,

     },
    {
     .bgId = 0x05,
     .left = 0x0A,
     .top = 0x0E,
     .width = 0x15,
     .height = 0x04,
     .palette = 0x0C,
     .baseTile = 0x00C3,

     },
    {
     .bgId = 0x05,
     .left = 0x0A,
     .top = 0x13,
     .width = 0x15,
     .height = 0x04,
     .palette = 0x0C,
     .baseTile = 0x0117,

     },
    {
     .bgId = 0x05,
     .left = 0x01,
     .top = 0x11,
     .width = 0x1E,
     .height = 0x06,
     .palette = 0x0C,
     .baseTile = 0x0001,

     },
    {
     .bgId = 0x05,
     .left = 0x02,
     .top = 0x07,
     .width = 0x06,
     .height = 0x06,
     .palette = 0x0D,
     .baseTile = 0x0001,

     },
    {
     .bgId = 0x05,
     .left = 0x01,
     .top = 0x0F,
     .width = 0x1E,
     .height = 0x08,
     .palette = 0x0C,
     .baseTile = 0x0025,

     },
};

const BgTemplates sVoltorbFlipBgTemplates = {
    {
     {
            .x = 0,
            .y = 0,
            .bufferSize = 0x0800,
            .baseTile = 0,
            .size = GF_BG_SCR_SIZE_256x256,
            .colorMode = GX_BG_COLORMODE_16,
            .screenBase = GX_BG_SCRBASE_0x0000,
            .charBase = GX_BG_CHARBASE_0x04000,
            .bgExtPltt = GX_BG_EXTPLTT_01,
            .priority = 3,
            .areaOver = GX_BG_AREAOVER_XLU,
            .dummy = 0,
            .mosaic = FALSE,
        },
     {
            .x = 0,
            .y = 0,
            .bufferSize = 0x0800,
            .baseTile = 0,
            .size = GF_BG_SCR_SIZE_256x256,
            .colorMode = GX_BG_COLORMODE_16,
            .screenBase = GX_BG_SCRBASE_0x0800,
            .charBase = GX_BG_CHARBASE_0x08000,
            .bgExtPltt = GX_BG_EXTPLTT_01,
            .priority = 2,
            .areaOver = GX_BG_AREAOVER_XLU,
            .dummy = 0,
            .mosaic = FALSE,
        },
     {
            .x = 0,
            .y = 0,
            .bufferSize = 0x0800,
            .baseTile = 0,
            .size = GF_BG_SCR_SIZE_256x256,
            .colorMode = GX_BG_COLORMODE_16,
            .screenBase = GX_BG_SCRBASE_0x1000,
            .charBase = GX_BG_CHARBASE_0x0c000,
            .bgExtPltt = GX_BG_EXTPLTT_01,
            .priority = 1,
            .areaOver = GX_BG_AREAOVER_XLU,
            .dummy = 0,
            .mosaic = FALSE,
        },
     {
            .x = 0,
            .y = 0,
            .bufferSize = 0x0800,
            .baseTile = 0,
            .size = GF_BG_SCR_SIZE_256x256,
            .colorMode = GX_BG_COLORMODE_16,
            .screenBase = GX_BG_SCRBASE_0x1800,
            .charBase = GX_BG_CHARBASE_0x10000,
            .bgExtPltt = GX_BG_EXTPLTT_01,
            .priority = 0,
            .areaOver = GX_BG_AREAOVER_XLU,
            .dummy = 0,
            .mosaic = FALSE,
        },
     {
            .x = 0,
            .y = 0,
            .bufferSize = 0x0800,
            .baseTile = 0,
            .size = GF_BG_SCR_SIZE_256x256,
            .colorMode = GX_BG_COLORMODE_16,
            .screenBase = GX_BG_SCRBASE_0x0000,
            .charBase = GX_BG_CHARBASE_0x04000,
            .bgExtPltt = GX_BG_EXTPLTT_01,
            .priority = 1,
            .areaOver = GX_BG_AREAOVER_XLU,
            .dummy = 0,
            .mosaic = FALSE,
        },
     {
            .x = 0,
            .y = 0,
            .bufferSize = 0x0800,
            .baseTile = 0,
            .size = GF_BG_SCR_SIZE_256x256,
            .colorMode = GX_BG_COLORMODE_16,
            .screenBase = GX_BG_SCRBASE_0x0800,
            .charBase = GX_BG_CHARBASE_0x08000,
            .bgExtPltt = GX_BG_EXTPLTT_01,
            .priority = 0,
            .areaOver = GX_BG_AREAOVER_XLU,
            .dummy = 0,
            .mosaic = FALSE,
        },
     }
};
