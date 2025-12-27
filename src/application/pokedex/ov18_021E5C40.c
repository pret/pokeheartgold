#include "constants/maps.h"

#include "application/pokedex/pokedex_internal.h"
#include "msgdata/msg.naix"

#include "dex_mon_measures.h"
#include "gf_gfx_loader.h"
#include "pokedex_util.h"
#include "sprite_system.h"
#include "unk_02005D10.h"
#include "unk_02091278.h"
#include "unk_020912AC.h"

void ov18_021E5C40(void *cb_arg);
void ov18_021E5FA4(void);
void ov18_021E5FE8(void);
void ov18_021E602C(void);
void ov18_021E6070(void);
void ov18_021E60B4(void);
void ov18_021E60F8(void);
void ov18_021E6868(PokedexAppData *pokedexApp);
void ov18_021E6A98(u16 *a0, u16 a1, u16 a2);
void ov18_021E7048(PokedexAppData *pokedexApp);
void ov18_021E7448(PokedexAppData *pokedexApp, const UnkStruct_ov18_021F9780 *a1, BOOL a2);
void ov18_021E7490(PokedexAppData *pokedexApp, const UnkStruct_ov18_021F9780 *a1, int *a2, int a3);
void ov18_021E7564(PokedexAppData *pokedexApp);
void ov18_021E7628(PokedexAppData *pokedexApp, u32 a1, BOOL a2);
void ov18_021E76A4(PokedexAppData *pokedexApp, u32 a1, BOOL a2);
void ov18_021E7A3C(PokedexAppData *pokedexApp);
void ov18_021E7BD0(PokedexAppData *pokedexApp);
void ov18_021E7D90(PokedexAppData *pokedexApp);
void ov18_021E7ED8(PokedexAppData *pokedexApp);
void ov18_021E800C(PokedexAppData *pokedexApp);
u8 ov18_021E83D0(PokedexAppData *pokedexApp, u8 a1);
void ov18_021E8698(PokedexAppData_UnkSub18DC_0 *a0, u16 a1, int a2);
void ov18_021E8714(PokedexAppData *pokedexApp, PokedexAppData_UnkSub18DC_0 *a1, int a2, int a3);
void ov18_021E8878(PokedexAppData *pokedexApp, PokedexAppData_UnkSub18DC_0 *a1, int a2, int a3, int a4);
u32 ov18_021E89DC(u32 a0);
void ov18_021E8A00(PokedexAppData *pokedexApp);
BOOL ov18_021E8AB0(PokedexAppData *pokedexApp, u32 a1);
u32 ov18_021E8ACC(PokedexAppData *pokedexApp, u32 a1, u32 a2);
u32 ov18_021E8AE0(PokedexAppData *pokedexApp, u32 a1);
u32 ov18_021E8B0C(u32 a0);
u32 ov18_021E8B18(u32 a0);
u32 ov18_021E8B40(void);
u32 ov18_021E8B78(void);

static const u16 ov18_021F9954[70] = {
    0xFFFF,
    0x003C,
    0x0021,
    0x0043,
    0x0022,
    0x0023,
    0x0049,
    0x0024,
    0x0025,
    0x0026,
    0x0027,
    0x0028,
    0x0029,
    0x004E,
    0x002A,
    0x002B,
    0x004D,
    0x005E,
    0x005F,
    0x004B,
    0x002C,
    0x002D,
    0x0058,
    0x002E,
    0x0059,
    0x002F,
    0x0030,
    0x0097,
    0x005A,
    0x0014,
    0x005B,
    0x005C,
    0x0031,
    0x0032,
    0x0034,
    0x0036,
    0x0037,
    0x0038,
    0x0039,
    0x0098,
    0x001E,
    0x001F,
    0x0020,
    0x0009,
    0x000A,
    0x000B,
    0x000C,
    0x000D,
    0x000E,
    0x000F,
    0x0010,
    0x0011,
    0x0012,
    0x0013,
    0x0015,
    0x0016,
    0x0017,
    0x01A6,
    0x0019,
    0x001A,
    0x005D,
    0x001B,
    0x001C,
    0x001D,
    0x019E,
    0x0033,
    0x004A,
    0x00AE,
    0x0018,
    0xFFFF,
};

static const u16 ov18_021F98D8[] = {
    0xFFFF,
    0x009B,
    0x0071,
    0x0063,
    0x00B1,
    0x0075,
    0x0060,
    0x0007,
    0x014C,
    0x0079,
    0x0077,
    0x0078,
    0x00FD,
    0x00B0,
    0x01C1,
    0x0092,
    0x01CE,
    0x0117,
    0x0156,
    0x00F0,
    0x006C,
    0x007C,
    0x007E,
    0x006A,
    0x0093,
    0x0091,
};

static const int ov18_021F99E0[142] = {
    0x00000009,
    0x0000000A,
    0x0000019E,
    0x0000000B,
    0x0000000C,
    0x0000000D,
    0x0000000E,
    0x0000000F,
    0x00000010,
    0x00000011,
    0x00000012,
    0x00000013,
    0x00000014,
    0x00000015,
    0x00000016,
    0x00000017,
    0x000001A6,
    0x00000018,
    0x00000019,
    0x0000001A,
    0x0000005B,
    0x0000005C,
    0x0000005D,
    0x0000001B,
    0x0000001C,
    0x0000001D,
    0x0000001E,
    0x0000001F,
    0x00000020,
    0x00000021,
    0x00000022,
    0x00000023,
    0x00000024,
    0x00000025,
    0x00000026,
    0x00000027,
    0x00000028,
    0x00000029,
    0x0000002A,
    0x0000002B,
    0x0000005E,
    0x0000005F,
    0x0000002C,
    0x0000002D,
    0x0000002E,
    0x0000002F,
    0x00000030,
    0x00000097,
    0x00000098,
    0x0000004A,
    0x0000014C,
    0x0000014D,
    0x0000014E,
    0x0000014F,
    0x00000150,
    0x00000151,
    0x00000152,
    0x00000153,
    0x00000155,
    0x00000059,
    0x00000007,
    0x000000D9,
    0x00000037,
    0x00000091,
    0x000001C2,
    0x000001C3,
    0x00000034,
    0x00000043,
    0x0000004B,
    0x00000039,
    0x00000156,
    0x00000117,
    0x0000006A,
    0x0000007B,
    0x000000B0,
    0x000000FD,
    0x0000004E,
    0x00000038,
    0x00000078,
    0x000000ED,
    0x000000EE,
    0x000000EF,
    0x00000075,
    0x00000058,
    0x0000006B,
    0x000001C0,
    0x000001C1,
    0x00000201,
    0x00000077,
    0x000000FA,
    0x000000FB,
    0x000000FC,
    0x0000005A,
    0x0000007A,
    0x000001CB,
    0x000001CC,
    0x000001CD,
    0x000001CE,
    0x000001CF,
    0x000001D0,
    0x00000060,
    0x000001E7,
    0x0000003C,
    0x000000F0,
    0x0000004D,
    0x00000031,
    0x00000033,
    0x0000006C,
    0x000001C4,
    0x00000071,
    0x0000013B,
    0x000001EA,
    0x000001EB,
    0x000001EC,
    0x000000B1,
    0x000000B5,
    0x00000165,
    0x000000AE,
    0x00000092,
    0x000001C5,
    0x000001C6,
    0x000001C7,
    0x000001C8,
    0x0000009B,
    0x0000009C,
    0x0000007E,
    0x0000012A,
    0x00000063,
    0x00000099,
    0x0000009A,
    0x00000036,
    0x0000007C,
    0x000000B2,
    0x000000B3,
    0x00000049,
    0x00000032,
    0x00000093,
    0x00000079,
    0x000000F2,
    0x000000F3,
    0x000001E6,
    0x000000F4,
};

static const GraphicsBanks ov18_021F98B0 = {
    .bg = GX_VRAM_BG_128_B,
    .bgextpltt = GX_VRAM_BGEXTPLTT_NONE,
    .subbg = GX_VRAM_SUB_BG_128_C,
    .subbgextpltt = GX_VRAM_SUB_BGEXTPLTT_NONE,
    .obj = GX_VRAM_OBJ_64_E,
    .objextpltt = GX_VRAM_OBJEXTPLTT_NONE,
    .subobj = GX_VRAM_SUB_OBJ_16_I,
    .subobjextpltt = GX_VRAM_SUB_OBJEXTPLTT_NONE,
    .tex = GX_VRAM_TEX_0_A,
    .texpltt = GX_VRAM_TEXPLTT_01_FG,
};

static const u8 ov18_021F9C18[6] = {
    1,
    2,
    3,
    4,
    5,
    7,
};

static const UnkStruct_ov18_021F9780 ov18_021F9780[] = {
    { 3,  6,  11, 2 },
    { 18, 6,  11, 2 },
    { 3,  10, 11, 2 },
    { 18, 10, 11, 2 },
    { 3,  14, 11, 2 },
    { 18, 14, 11, 2 },
};

static const UnkStruct_ov18_021F9780 ov18_021F990C[18] = {
    { 0,  5,  8, 2 },
    { 8,  5,  8, 2 },
    { 16, 5,  8, 2 },
    { 24, 5,  8, 2 },
    { 0,  8,  8, 2 },
    { 8,  8,  8, 2 },
    { 16, 8,  8, 2 },
    { 24, 8,  8, 2 },
    { 0,  11, 8, 2 },
    { 8,  11, 8, 2 },
    { 16, 11, 8, 2 },
    { 24, 11, 8, 2 },
    { 0,  14, 8, 2 },
    { 8,  14, 8, 2 },
    { 16, 14, 8, 2 },
    { 24, 14, 8, 2 },
    { 0,  17, 8, 2 },
    { 8,  17, 8, 2 },
};

static const UnkStruct_ov18_021F9780 ov18_021F9770[] = {
    { 6,  8,  7, 2 },
    { 19, 8,  7, 2 },
    { 6,  15, 7, 2 },
    { 19, 15, 7, 2 },
};

static const u8 ov18_021F9C20[] = {
    0x00,
    0x01,
    0x02,
    0x03,
    0x04,
    0x05,
    0x06,
    0x07,
    0x08,
    0x09,
    0x0A,
    0x0B,
    0x0C,
    0x0D,
    0x0E,
    0x0F,
    0x10,
    0x11,
    0x12,
    0x13,
    0x14,
    0x15,
    0x16,
    0x17,
    0x18,
    0x19,
    0x1B,
};

void ov18_021E5C40(void *cb_arg) {
    PokedexAppData *pokedexApp = cb_arg;

    PaletteData_PushTransparentBuffers(pokedexApp->unk_0850);
    ov18_021E7A3C(pokedexApp);
    DoScheduledBgGpuUpdates(pokedexApp->unk_0004);
    SpriteSystem_TransferOam();
    OS_SetIrqCheckFlag(OS_IE_V_BLANK);
}

void ov18_021E5C74(void) {
    GfGfx_SetBanks(&ov18_021F98B0);
}

void ov18_021E5C84(PokedexAppData *pokedexApp) {
    pokedexApp->unk_0004 = BgConfig_Alloc(HEAP_ID_37);

    {
        GraphicsModes graphicsModes = {
            GX_DISPMODE_GRAPHICS,
            GX_BGMODE_0,
            GX_BGMODE_0,
            GX_BG0_AS_2D,
        };

        SetBothScreensModesAndDisable(&graphicsModes);
    }

    {
        BgTemplate bgTemplate = {
            .x = 0,
            .y = 0,
            .bufferSize = GF_BG_BUF_SIZE_512x256_4BPP,
            .baseTile = 0,
            .size = GF_BG_SCR_SIZE_512x256,
            .colorMode = GX_BG_COLORMODE_16,
            .screenBase = GX_BG_SCRBASE_0xf000,
            .charBase = GX_BG_CHARBASE_0x00000,
            .bgExtPltt = GX_BG_EXTPLTT_01,
            .priority = 2,
            .areaOver = GX_BG_AREAOVER_XLU,
            .dummy = 0,
            .mosaic = 0,
        };

        InitBgFromTemplate(pokedexApp->unk_0004, GF_BG_LYR_MAIN_0, &bgTemplate, GF_BG_TYPE_TEXT);
        ov18_021E613C(pokedexApp, GF_BG_LYR_MAIN_0);
        BG_ClearCharDataRange(GF_BG_LYR_MAIN_0, 0x20, 0, HEAP_ID_37);
    }

    {
        BgTemplate bgTemplate = {
            .x = 0,
            .y = 0,
            .bufferSize = GF_BG_BUF_SIZE_256x256_4BPP,
            .baseTile = 0,
            .size = GF_BG_SCR_SIZE_256x256,
            .colorMode = GX_BG_COLORMODE_16,
            .screenBase = GX_BG_SCRBASE_0xe800,
            .charBase = GX_BG_CHARBASE_0x10000,
            .bgExtPltt = GX_BG_EXTPLTT_01,
            .priority = 0,
            .areaOver = GX_BG_AREAOVER_XLU,
            .dummy = 0,
            .mosaic = 0,
        };

        InitBgFromTemplate(pokedexApp->unk_0004, GF_BG_LYR_MAIN_1, &bgTemplate, GF_BG_TYPE_TEXT);
        ov18_021E613C(pokedexApp, GF_BG_LYR_MAIN_1);
        BG_ClearCharDataRange(GF_BG_LYR_MAIN_1, 0x20, 0, HEAP_ID_37);
    }

    {
        BgTemplate bgTemplate = {
            .x = 0,
            .y = 0,
            .bufferSize = GF_BG_BUF_SIZE_256x256_4BPP,
            .baseTile = 0,
            .size = GF_BG_SCR_SIZE_256x256,
            .colorMode = GX_BG_COLORMODE_16,
            .screenBase = GX_BG_SCRBASE_0xe000,
            .charBase = GX_BG_CHARBASE_0x14000,
            .bgExtPltt = GX_BG_EXTPLTT_01,
            .priority = 1,
            .areaOver = GX_BG_AREAOVER_XLU,
            .dummy = 0,
            .mosaic = 0,
        };

        InitBgFromTemplate(pokedexApp->unk_0004, GF_BG_LYR_MAIN_2, &bgTemplate, GF_BG_TYPE_TEXT);
        ov18_021E613C(pokedexApp, GF_BG_LYR_MAIN_2);
        BG_ClearCharDataRange(GF_BG_LYR_MAIN_2, 0x20, 0, HEAP_ID_37);
    }

    {
        BgTemplate bgTemplate = {
            .x = 0,
            .y = 0,
            .bufferSize = GF_BG_BUF_SIZE_256x256_4BPP,
            .baseTile = 0,
            .size = GF_BG_SCR_SIZE_256x256,
            .colorMode = GX_BG_COLORMODE_16,
            .screenBase = GX_BG_SCRBASE_0xd800,
            .charBase = GX_BG_CHARBASE_0x18000,
            .bgExtPltt = GX_BG_EXTPLTT_01,
            .priority = 3,
            .areaOver = GX_BG_AREAOVER_XLU,
            .dummy = 0,
            .mosaic = 0,
        };

        InitBgFromTemplate(pokedexApp->unk_0004, GF_BG_LYR_MAIN_3, &bgTemplate, GF_BG_TYPE_TEXT);
        ov18_021E613C(pokedexApp, GF_BG_LYR_MAIN_3);
        BG_ClearCharDataRange(GF_BG_LYR_MAIN_3, 0x20, 0, HEAP_ID_37);
    }

    {
        BgTemplate bgTemplate = {
            .x = 0,
            .y = 0,
            .bufferSize = GF_BG_BUF_SIZE_512x256_4BPP,
            .baseTile = 0,
            .size = GF_BG_SCR_SIZE_512x256,
            .colorMode = GX_BG_COLORMODE_16,
            .screenBase = GX_BG_SCRBASE_0xf000,
            .charBase = GX_BG_CHARBASE_0x10000,
            .bgExtPltt = GX_BG_EXTPLTT_01,
            .priority = 0,
            .areaOver = GX_BG_AREAOVER_XLU,
            .dummy = 0,
            .mosaic = 0,
        };

        InitBgFromTemplate(pokedexApp->unk_0004, GF_BG_LYR_SUB_0, &bgTemplate, GF_BG_TYPE_TEXT);
        ov18_021E613C(pokedexApp, GF_BG_LYR_SUB_0);
        BG_ClearCharDataRange(GF_BG_LYR_SUB_0, 0x20, 0, HEAP_ID_37);
    }

    {
        BgTemplate bgTemplate = {
            .x = 0,
            .y = 0,
            .bufferSize = GF_BG_BUF_SIZE_256x256_4BPP,
            .baseTile = 0,
            .size = GF_BG_SCR_SIZE_256x256,
            .colorMode = GX_BG_COLORMODE_16,
            .screenBase = GX_BG_SCRBASE_0xe800,
            .charBase = GX_BG_CHARBASE_0x00000,
            .bgExtPltt = GX_BG_EXTPLTT_01,
            .priority = 1,
            .areaOver = GX_BG_AREAOVER_XLU,
            .dummy = 0,
            .mosaic = 0,
        };

        InitBgFromTemplate(pokedexApp->unk_0004, GF_BG_LYR_SUB_1, &bgTemplate, GF_BG_TYPE_TEXT);
        ov18_021E613C(pokedexApp, GF_BG_LYR_SUB_1);
        BG_ClearCharDataRange(GF_BG_LYR_SUB_1, 0x20, 0, HEAP_ID_37);
    }

    {
        BgTemplate bgTemplate = {
            .x = 0,
            .y = 0,
            .bufferSize = GF_BG_BUF_SIZE_256x256_4BPP,
            .baseTile = 0,
            .size = GF_BG_SCR_SIZE_256x256,
            .colorMode = GX_BG_COLORMODE_16,
            .screenBase = GX_BG_SCRBASE_0xe000,
            .charBase = GX_BG_CHARBASE_0x14000,
            .bgExtPltt = GX_BG_EXTPLTT_01,
            .priority = 2,
            .areaOver = GX_BG_AREAOVER_XLU,
            .dummy = 0,
            .mosaic = 0,
        };

        InitBgFromTemplate(pokedexApp->unk_0004, GF_BG_LYR_SUB_2, &bgTemplate, GF_BG_TYPE_TEXT);
        ov18_021E613C(pokedexApp, GF_BG_LYR_SUB_2);
        BG_ClearCharDataRange(GF_BG_LYR_SUB_2, 0x20, 0, HEAP_ID_37);
    }

    {
        BgTemplate bgTemplate = {
            .x = 0,
            .y = 0,
            .bufferSize = GF_BG_BUF_SIZE_256x256_4BPP,
            .baseTile = 0,
            .size = GF_BG_SCR_SIZE_256x256,
            .colorMode = GX_BG_COLORMODE_16,
            .screenBase = GX_BG_SCRBASE_0xd800,
            .charBase = GX_BG_CHARBASE_0x18000,
            .bgExtPltt = GX_BG_EXTPLTT_01,
            .priority = 3,
            .areaOver = GX_BG_AREAOVER_XLU,
            .dummy = 0,
            .mosaic = 0,
        };

        InitBgFromTemplate(pokedexApp->unk_0004, GF_BG_LYR_SUB_3, &bgTemplate, GF_BG_TYPE_TEXT);
        ov18_021E613C(pokedexApp, GF_BG_LYR_SUB_3);
        BG_ClearCharDataRange(GF_BG_LYR_SUB_3, 0x20, 0, HEAP_ID_37);
    }
}

void ov18_021E5E70(PokedexAppData *pokedexApp, BOOL a1) {
    FreeBgTilemapBuffer(pokedexApp->unk_0004, GF_BG_LYR_SUB_3);
    if (!a1) {
        {
            GraphicsModes graphicsModes = {
                GX_DISPMODE_GRAPHICS,
                GX_BGMODE_0,
                GX_BGMODE_0,
                GX_BG0_AS_2D,
            };

            SetScreenModeAndDisable(&graphicsModes, SCREEN_SUB);
        }

        {
            BgTemplate bgTemplate = {
                .x = 0,
                .y = 0,
                .bufferSize = GF_BG_BUF_SIZE_256x256_4BPP,
                .baseTile = 0,
                .size = GF_BG_SCR_SIZE_256x256,
                .colorMode = GX_BG_COLORMODE_16,
                .screenBase = GX_BG_SCRBASE_0xd800,
                .charBase = GX_BG_CHARBASE_0x18000,
                .bgExtPltt = GX_BG_EXTPLTT_01,
                .priority = 3,
                .areaOver = GX_BG_AREAOVER_XLU,
                .dummy = 0,
                .mosaic = 0,
            };

            InitBgFromTemplate(pokedexApp->unk_0004, GF_BG_LYR_SUB_3, &bgTemplate, GF_BG_TYPE_TEXT);
            ov18_021E613C(pokedexApp, GF_BG_LYR_SUB_3);
            BG_ClearCharDataRange(GF_BG_LYR_SUB_3, 0x20, 0, HEAP_ID_37);
        }
    } else {
        {
            GraphicsModes graphicsModes = {
                GX_DISPMODE_GRAPHICS,
                GX_BGMODE_0,
                GX_BGMODE_1,
                GX_BG0_AS_2D,
            };

            SetScreenModeAndDisable(&graphicsModes, SCREEN_SUB);
        }

        {
            BgTemplate bgTemplate = {
                .x = 0,
                .y = 0,
                .bufferSize = GF_BG_BUF_SIZE_256x256_8BPP,
                .baseTile = 0,
                .size = GF_BG_SCR_SIZE_256x256,
                .colorMode = GX_BG_COLORMODE_256,
                .screenBase = GX_BG_SCRBASE_0xd800,
                .charBase = GX_BG_CHARBASE_0x18000,
                .bgExtPltt = GX_BG_EXTPLTT_01,
                .priority = 2,
                .areaOver = GX_BG_AREAOVER_XLU,
                .dummy = 0,
                .mosaic = 0,
            };

            InitBgFromTemplate(pokedexApp->unk_0004, GF_BG_LYR_SUB_3, &bgTemplate, GF_BG_TYPE_AFFINE);
            ov18_021E613C(pokedexApp, GF_BG_LYR_SUB_3);
            BG_ClearCharDataRange(GF_BG_LYR_SUB_3, 0x40, 0, HEAP_ID_37);
        }
    }

    GfGfx_EngineBTogglePlanes(GX_PLANEMASK_BG0, GF_PLANE_TOGGLE_ON);
    GfGfx_EngineBTogglePlanes(GX_PLANEMASK_BG1, GF_PLANE_TOGGLE_ON);
    GfGfx_EngineBTogglePlanes(GX_PLANEMASK_BG2, GF_PLANE_TOGGLE_ON);
    GfGfx_EngineBTogglePlanes(GX_PLANEMASK_BG3, GF_PLANE_TOGGLE_ON);
    GfGfx_EngineBTogglePlanes(GX_PLANEMASK_OBJ, GF_PLANE_TOGGLE_ON);
}

void ov18_021E5F58(PokedexAppData *pokedexApp) {
    FreeBgTilemapBuffer(pokedexApp->unk_0004, GF_BG_LYR_SUB_3);
    FreeBgTilemapBuffer(pokedexApp->unk_0004, GF_BG_LYR_SUB_2);
    FreeBgTilemapBuffer(pokedexApp->unk_0004, GF_BG_LYR_SUB_1);
    FreeBgTilemapBuffer(pokedexApp->unk_0004, GF_BG_LYR_SUB_0);
    FreeBgTilemapBuffer(pokedexApp->unk_0004, GF_BG_LYR_MAIN_3);
    FreeBgTilemapBuffer(pokedexApp->unk_0004, GF_BG_LYR_MAIN_2);
    FreeBgTilemapBuffer(pokedexApp->unk_0004, GF_BG_LYR_MAIN_1);
    FreeBgTilemapBuffer(pokedexApp->unk_0004, GF_BG_LYR_MAIN_0);
    Heap_Free(pokedexApp->unk_0004);
}

void ov18_021E5FA4(void) {
    // main bg
    SetBgPriority(GF_BG_LYR_MAIN_0, 2);
    SetBgPriority(GF_BG_LYR_MAIN_1, 0);
    SetBgPriority(GF_BG_LYR_MAIN_2, 1);
    SetBgPriority(GF_BG_LYR_MAIN_3, 3);

    // sub bg
    SetBgPriority(GF_BG_LYR_SUB_0, 0);
    SetBgPriority(GF_BG_LYR_SUB_1, 1);
    SetBgPriority(GF_BG_LYR_SUB_2, 2);
    SetBgPriority(GF_BG_LYR_SUB_3, 3);
}

void ov18_021E5FE8(void) {
    // main bg
    SetBgPriority(GF_BG_LYR_MAIN_0, 1);
    SetBgPriority(GF_BG_LYR_MAIN_1, 0);
    SetBgPriority(GF_BG_LYR_MAIN_2, 2);
    SetBgPriority(GF_BG_LYR_MAIN_3, 3);

    // sub bg
    SetBgPriority(GF_BG_LYR_SUB_0, 0);
    SetBgPriority(GF_BG_LYR_SUB_1, 1);
    SetBgPriority(GF_BG_LYR_SUB_2, 2);
    SetBgPriority(GF_BG_LYR_SUB_3, 3);
}

void ov18_021E602C(void) {
    // main bg
    SetBgPriority(GF_BG_LYR_MAIN_0, 1);
    SetBgPriority(GF_BG_LYR_MAIN_1, 0);
    SetBgPriority(GF_BG_LYR_MAIN_2, 2);
    SetBgPriority(GF_BG_LYR_MAIN_3, 3);

    // sub bg
    SetBgPriority(GF_BG_LYR_SUB_0, 0);
    SetBgPriority(GF_BG_LYR_SUB_1, 1);
    SetBgPriority(GF_BG_LYR_SUB_2, 2);
    SetBgPriority(GF_BG_LYR_SUB_3, 3);
}

void ov18_021E6070(void) {
    // main bg
    SetBgPriority(GF_BG_LYR_MAIN_0, 1);
    SetBgPriority(GF_BG_LYR_MAIN_1, 0);
    SetBgPriority(GF_BG_LYR_MAIN_2, 2);
    SetBgPriority(GF_BG_LYR_MAIN_3, 3);

    // sub bg
    SetBgPriority(GF_BG_LYR_SUB_0, 3);
    SetBgPriority(GF_BG_LYR_SUB_1, 0);
    SetBgPriority(GF_BG_LYR_SUB_2, 1);
    SetBgPriority(GF_BG_LYR_SUB_3, 2);
}

void ov18_021E60B4(void) {
    // main bg
    SetBgPriority(GF_BG_LYR_MAIN_0, 1);
    SetBgPriority(GF_BG_LYR_MAIN_1, 0);
    SetBgPriority(GF_BG_LYR_MAIN_2, 2);
    SetBgPriority(GF_BG_LYR_MAIN_3, 3);

    // sub bg
    SetBgPriority(GF_BG_LYR_SUB_0, 0);
    SetBgPriority(GF_BG_LYR_SUB_1, 1);
    SetBgPriority(GF_BG_LYR_SUB_2, 3);
    SetBgPriority(GF_BG_LYR_SUB_3, 2);
}

void ov18_021E60F8(void) {
    // main bg
    SetBgPriority(GF_BG_LYR_MAIN_0, 1);
    SetBgPriority(GF_BG_LYR_MAIN_1, 0);
    SetBgPriority(GF_BG_LYR_MAIN_2, 2);
    SetBgPriority(GF_BG_LYR_MAIN_3, 3);

    // sub bg
    SetBgPriority(GF_BG_LYR_SUB_0, 0);
    SetBgPriority(GF_BG_LYR_SUB_1, 1);
    SetBgPriority(GF_BG_LYR_SUB_2, 3);
    SetBgPriority(GF_BG_LYR_SUB_3, 2);
}

void ov18_021E613C(PokedexAppData *pokedexApp, u8 bgId) {
    u8 width;

    if (bgId == GF_BG_LYR_MAIN_0 || bgId == GF_BG_LYR_SUB_0) {
        width = 0x40;
    } else {
        width = 0x20;
    }

    FillBgTilemapRect(pokedexApp->unk_0004, bgId, 0, 0, 0, width, 0x20, 0);
    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, bgId);
}

void ov18_021E6174(void) {
    G2_SetBlendAlpha(0, GX_PLANEMASK_BG0 | GX_PLANEMASK_BG1 | GX_PLANEMASK_BG2 | GX_PLANEMASK_BG3, 6, 10);
}

void ov18_021E618C(int ev1, int ev2) {
    G2_SetBlendAlpha(GX_PLANEMASK_BG2, GX_PLANEMASK_BG3, ev1, ev2);
}

void ov18_021E61A4(PokedexAppData *pokedexApp) {
    pokedexApp->unk_0850 = PaletteData_Init(HEAP_ID_37);
    ZeroPalettesByBitmask(PLTTBUF_MAIN_BG_F | PLTTBUF_SUB_BG_F | PLTTBUF_MAIN_OBJ_F | PLTTBUF_SUB_OBJ_F, HEAP_ID_37);
    PaletteData_AllocBuffers(pokedexApp->unk_0850, PLTTBUF_MAIN_BG, 0x200, HEAP_ID_37);
    PaletteData_AllocBuffers(pokedexApp->unk_0850, PLTTBUF_SUB_BG, 0x200, HEAP_ID_37);
    PaletteData_AllocBuffers(pokedexApp->unk_0850, PLTTBUF_MAIN_OBJ, 0x200, HEAP_ID_37);
    PaletteData_AllocBuffers(pokedexApp->unk_0850, PLTTBUF_SUB_OBJ, 0x200, HEAP_ID_37);
}

void ov18_021E6204(PokedexAppData *pokedexApp) {
    PaletteData_FreeBuffers(pokedexApp->unk_0850, PLTTBUF_SUB_OBJ);
    PaletteData_FreeBuffers(pokedexApp->unk_0850, PLTTBUF_MAIN_OBJ);
    PaletteData_FreeBuffers(pokedexApp->unk_0850, PLTTBUF_SUB_BG);
    PaletteData_FreeBuffers(pokedexApp->unk_0850, PLTTBUF_MAIN_BG);
    PaletteData_Free(pokedexApp->unk_0850);
}

void ov18_021E6244(PokedexAppData *pokedexApp) {
    pokedexApp->unk_065C = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, NARC_msg_msg_0802_bin, HEAP_ID_37);
    pokedexApp->unk_0660 = MessageFormat_New(HEAP_ID_37);
    pokedexApp->unk_0664 = String_New(0x400, HEAP_ID_37);
}

void ov18_021E6280(PokedexAppData *pokedexApp) {
    String_Delete(pokedexApp->unk_0664);
    MessageFormat_Delete(pokedexApp->unk_0660);
    DestroyMsgData(pokedexApp->unk_065C);
}

void ov18_021E62A8(PokedexAppData *pokedexApp) {
    NARC *narc = NARC_New(NARC_a_0_7_5, HEAP_ID_37);
    pokedexApp->unk_1850 = GfGfxLoader_LoadFromOpenNarc(narc, 0, FALSE, HEAP_ID_37, FALSE);
    pokedexApp->unk_1854 = GfGfxLoader_LoadFromOpenNarc(narc, 1, FALSE, HEAP_ID_37, FALSE);
    NARC_Delete(narc);
}

void ov18_021E62E8(PokedexAppData *pokedexApp) {
    Heap_Free(pokedexApp->unk_1854);
    Heap_Free(pokedexApp->unk_1850);
}

void ov18_021E6308(PokedexAppData *pokedexApp) {
    pokedexApp->unk_0008 = sub_0201956C(pokedexApp->unk_0004, 2, 24, HEAP_ID_37);
    sub_020195F4(pokedexApp->unk_0008, 0, 2, 32, 5);
    sub_020195F4(pokedexApp->unk_0008, 1, 2, 32, 5);
    sub_020195F4(pokedexApp->unk_0008, 2, 0, 22, 4);
    sub_020195F4(pokedexApp->unk_0008, 3, 0, 22, 4);
    sub_020195F4(pokedexApp->unk_0008, 4, 2, 32, 4);
    sub_020195F4(pokedexApp->unk_0008, 5, 3, 32, 5);
    sub_020195F4(pokedexApp->unk_0008, 6, 1, 32, 4);
    sub_020195F4(pokedexApp->unk_0008, 7, 1, 32, 4);
    sub_020195F4(pokedexApp->unk_0008, 8, 2, 32, 5);
    sub_020195F4(pokedexApp->unk_0008, 9, 0, 32, 24);
    sub_020195F4(pokedexApp->unk_0008, 10, 2, 32, 24);
    sub_020195F4(pokedexApp->unk_0008, 11, 5, 32, 24);
    sub_020195F4(pokedexApp->unk_0008, 12, 6, 32, 24);
    sub_020195F4(pokedexApp->unk_0008, 13, 4, 32, 24);
    sub_020195F4(pokedexApp->unk_0008, 15, 0, 32, 24);
    sub_020195F4(pokedexApp->unk_0008, 14, 0, 3, 24);
    sub_020195F4(pokedexApp->unk_0008, 16, 1, 32, 4);
    sub_020195F4(pokedexApp->unk_0008, 23, 7, 20, 4);
    sub_020196B8(pokedexApp->unk_0008, 0, pokedexApp->unk_0854, 5, 1);
    sub_020196B8(pokedexApp->unk_0008, 1, pokedexApp->unk_0854, 6, 1);
    sub_020196B8(pokedexApp->unk_0008, 2, pokedexApp->unk_0854, 7, 1);
    sub_020196B8(pokedexApp->unk_0008, 3, pokedexApp->unk_0854, 8, 1);
    sub_020196B8(pokedexApp->unk_0008, 4, pokedexApp->unk_0854, 9, 1);
    sub_020196B8(pokedexApp->unk_0008, 5, pokedexApp->unk_0854, 10, 1);
    sub_020196B8(pokedexApp->unk_0008, 6, pokedexApp->unk_0854, 69, 1);
    sub_020196B8(pokedexApp->unk_0008, 7, pokedexApp->unk_0854, 70, 1);
    sub_020196B8(pokedexApp->unk_0008, 8, pokedexApp->unk_0854, 71, 1);
    sub_020196B8(pokedexApp->unk_0008, 13, pokedexApp->unk_0854, 16, 1);
    sub_020196B8(pokedexApp->unk_0008, 16, pokedexApp->unk_0854, 11, 1);
    sub_020196B8(pokedexApp->unk_0008, 23, pokedexApp->unk_0854, 88, 1);
    sub_02019B70(pokedexApp->unk_0008, 11, 0, 32, 0, 19);
    sub_02019B70(pokedexApp->unk_0008, 12, 0, 32, 0, 19);
    ov18_021F0168(pokedexApp);
}

void ov18_021E6540(PokedexAppData *pokedexApp) {
    sub_020195C0(pokedexApp->unk_0008);
}

void ov18_021E654C(PokedexAppData *pokedexApp) {
    sub_020196E8(pokedexApp->unk_0008, 0, 0, 24);
    sub_020198FC(pokedexApp->unk_0008, 0, 0, -1, 5);
}

void ov18_021E6574(PokedexAppData *pokedexApp) {
    sub_020196E8(pokedexApp->unk_0008, 0, 0, 19);
    sub_020198FC(pokedexApp->unk_0008, 0, 0, 1, 5);
}

void ov18_021E659C(PokedexAppData *pokedexApp) {
    sub_020196E8(pokedexApp->unk_0008, 4, 0, 15);
}

void ov18_021E65AC(PokedexAppData *pokedexApp) {
    sub_020196E8(pokedexApp->unk_0008, 1, 0, 24);
    sub_020198FC(pokedexApp->unk_0008, 1, 0, -1, 5);
}

void ov18_021E65D4(PokedexAppData *pokedexApp) {
    sub_020196E8(pokedexApp->unk_0008, 1, 0, 19);
    sub_020198FC(pokedexApp->unk_0008, 1, 0, 1, 5);
}

void ov18_021E65FC(PokedexAppData *pokedexApp) {
    sub_020196E8(pokedexApp->unk_0008, 6, 0, 24);
    sub_020198FC(pokedexApp->unk_0008, 6, 0, -1, 4);
}

void ov18_021E6624(PokedexAppData *pokedexApp) {
    sub_020196E8(pokedexApp->unk_0008, 6, 0, 20);
    sub_020198FC(pokedexApp->unk_0008, 6, 0, 1, 4);
}

void ov18_021E664C(PokedexAppData *pokedexApp) {
    sub_020196E8(pokedexApp->unk_0008, 7, 0, 24);
    sub_020198FC(pokedexApp->unk_0008, 7, 0, -1, 4);
}

void ov18_021E6674(PokedexAppData *pokedexApp) {
    sub_020196E8(pokedexApp->unk_0008, 7, 0, 20);
    sub_020198FC(pokedexApp->unk_0008, 7, 0, 1, 4);
}

void ov18_021E669C(PokedexAppData *pokedexApp) {
    sub_020196E8(pokedexApp->unk_0008, 8, 0, 24);
    sub_020198FC(pokedexApp->unk_0008, 8, 0, -1, 5);
}

void ov18_021E66C4(PokedexAppData *pokedexApp) {
    sub_020196E8(pokedexApp->unk_0008, 8, 0, 19);
    sub_020198FC(pokedexApp->unk_0008, 8, 0, 1, 5);
}

void ov18_021E66EC(PokedexAppData *pokedexApp) {
    sub_020196E8(pokedexApp->unk_0008, 16, 0, 24);
    sub_020198FC(pokedexApp->unk_0008, 16, 0, -1, 4);
}

void ov18_021E6714(PokedexAppData *pokedexApp) {
    sub_020196E8(pokedexApp->unk_0008, 16, 0, 20);
    sub_020198FC(pokedexApp->unk_0008, 16, 0, 1, 4);
}

void ov18_021E673C(PokedexAppData *pokedexApp) {
    u16 *r4 = sub_02019B08(pokedexApp->unk_0008, 16);
    u16 r5;

    if (Pokedex_CheckMonCaughtFlag(pokedexApp->unk_0000->pokedex, pokedexApp->unk_18A2)) {
        r5 = 0;
    } else {
        r5 = 0xB000;
    }
    for (u32 i = 0; i < 4; ++i) {
        for (u32 j = 8; j < 16; ++j) {
            r4[32 * i + j] = (r4[32 * i + j] & 0xFFF) | r5;
        }
    }
}

void ov18_021E6794(PokedexAppData *pokedexApp) {
    sub_020196E8(pokedexApp->unk_0008, 23, 10, 11);
    ScheduleWindowCopyToVram(&pokedexApp->unk_003C);
}

void ov18_021E67B0(PokedexAppData *pokedexApp) {
    sub_0201980C(pokedexApp->unk_0008, 23);
    ClearWindowTilemapAndScheduleTransfer(&pokedexApp->unk_003C);
}

void ov18_021E67C8(PokedexAppData *pokedexApp, int a1) {
    switch (a1) {
    case 0:
        ov18_021E6868(pokedexApp);
        ov18_021E5FA4();
        ov18_021EE3FC(pokedexApp);
        ov18_021F2880(pokedexApp);
        break;
    case 1:
        ov18_021E7BD0(pokedexApp);
        ov18_021E6070();
        ov18_021F021C(pokedexApp);
        ov18_021F3D98(pokedexApp);
        break;
    case 2:
        ov18_021E7D90(pokedexApp);
        ov18_021E60B4();
        ov18_021F05E8(pokedexApp);
        ov18_021F49F8(pokedexApp);
        break;
    case 3:
        ov18_021E800C(pokedexApp);
        ov18_021E602C();
        ov18_021F0900(pokedexApp);
        ov18_021F5DC0(pokedexApp);
        break;
    case 4:
        ov18_021E7ED8(pokedexApp);
        ov18_021E60F8();
        ov18_021F0858(pokedexApp);
        break;
    case 5:
        ov18_021E7048(pokedexApp);
        ov18_021E5FE8();
        ov18_021EEE58(pokedexApp);
        ov18_021F2F3C(pokedexApp);
        break;
    }
}

void ov18_021E6868(PokedexAppData *pokedexApp) {
    ov18_021E613C(pokedexApp, GF_BG_LYR_MAIN_1);
    ov18_021E613C(pokedexApp, GF_BG_LYR_MAIN_2);
    ov18_021E613C(pokedexApp, GF_BG_LYR_MAIN_3);
    ov18_021E613C(pokedexApp, GF_BG_LYR_SUB_0);
    ov18_021E613C(pokedexApp, GF_BG_LYR_SUB_1);
    ov18_021E613C(pokedexApp, GF_BG_LYR_SUB_2);

    GfGfxLoader_LoadCharDataFromOpenNarc(pokedexApp->unk_0854, 1, pokedexApp->unk_0004, GF_BG_LYR_MAIN_0, 0, 0, TRUE, HEAP_ID_37);
    {
        NNSG2dScreenData *sp10;
        void *r5 = GfGfxLoader_GetScrnDataFromOpenNarc(pokedexApp->unk_0854, 0, TRUE, &sp10, HEAP_ID_37);
        BG_LoadScreenTilemapData(pokedexApp->unk_0004, GF_BG_LYR_MAIN_0, sp10->rawData, 0x1000);
        Heap_Free(r5);
    }
    GfGfxLoader_LoadCharDataFromOpenNarc(pokedexApp->unk_0854, 4, pokedexApp->unk_0004, GF_BG_LYR_MAIN_2, 0, 0, TRUE, HEAP_ID_37);
    GfGfxLoader_LoadCharDataFromOpenNarc(pokedexApp->unk_0854, 3, pokedexApp->unk_0004, GF_BG_LYR_MAIN_3, 0, 0, TRUE, HEAP_ID_37);
    PaletteData_LoadOpenNarc(pokedexApp->unk_0850, pokedexApp->unk_0854, 2, HEAP_ID_37, PLTTBUF_MAIN_BG, 0, 0);
    GfGfxLoader_LoadCharDataFromOpenNarc(pokedexApp->unk_0854, 17, pokedexApp->unk_0004, GF_BG_LYR_SUB_0, 0, 0, TRUE, HEAP_ID_37);
    GfGfxLoader_LoadScrnDataFromOpenNarc(pokedexApp->unk_0854, 16, pokedexApp->unk_0004, GF_BG_LYR_SUB_0, 0, 0, TRUE, HEAP_ID_37);
    GfGfxLoader_LoadCharDataFromOpenNarc(pokedexApp->unk_0854, 19, pokedexApp->unk_0004, GF_BG_LYR_SUB_3, 0, 0, TRUE, HEAP_ID_37);
    if (pokedexApp->unk_185C == 2) {
        GfGfxLoader_LoadScrnDataFromOpenNarc(pokedexApp->unk_0854, 20, pokedexApp->unk_0004, GF_BG_LYR_SUB_3, 0, 0, TRUE, HEAP_ID_37);
    } else {
        GfGfxLoader_LoadScrnDataFromOpenNarc(pokedexApp->unk_0854, 21, pokedexApp->unk_0004, GF_BG_LYR_SUB_3, 0, 0, TRUE, HEAP_ID_37);
    }
    PaletteData_LoadOpenNarc(pokedexApp->unk_0850, pokedexApp->unk_0854, 18, HEAP_ID_37, PLTTBUF_SUB_BG, 0, 0);
    if (!pokedexApp->unk_1860) {
        FillBgTilemapRect(pokedexApp->unk_0004, GF_BG_LYR_MAIN_0, 0x16, 3, 15, 26, 2, TILEMAP_FILL_KEEP_PAL);
    }
    ov18_021E6A70(pokedexApp);
    sub_020196E8(pokedexApp->unk_0008, 0, 0, 19);
    ov18_021E6C98(pokedexApp);
    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_MAIN_0);
    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_MAIN_1);
    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_MAIN_2);
    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_MAIN_3);
    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_SUB_0);
    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_SUB_1);
    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_SUB_2);
    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_SUB_3);
}

void ov18_021E6A70(PokedexAppData *pokedexApp) {
    if (pokedexApp->unk_1858 == 0) {
        sub_020196E8(pokedexApp->unk_0008, 2, 5, 3);
    } else {
        sub_020196E8(pokedexApp->unk_0008, 3, 5, 3);
    }
}

void ov18_021E6A98(u16 *a0, u16 a1, u16 a2) {
    u8 sp4[3] = { 100, 10, 1 };

    for (u8 i = 0; i < 3; ++i) {
        a0[i] = (a2 + (a1 / sp4[i])) | 0x1000;
        a1 %= sp4[i];
    }
}

u16 *ov18_021E6AEC(PokedexAppData *pokedexApp, u32 a1) {
    u16 *ret = Heap_AllocAtEnd(HEAP_ID_37, 160 * 10 * sizeof(u16));
    u16 *sp14 = sub_02019B08(pokedexApp->unk_0008, 5);
    u32 sp10 = ov18_021F891C(pokedexApp, TRUE);

    for (u16 i = 0; i < 10; ++i) {
        MI_CpuCopy16(sp14, &ret[160 * i], 160 * sizeof(u16));
        for (u16 j = 0; j < 5; ++j) {
            u32 r1 = a1 + 5 * i + j;
            if (r1 >= sp10) {
                break;
            }
            if (pokedexApp->unk_1030[r1].unk_2 == 2) {
                ret[160 * i + 36 + 5 * j] = 0x1002;
                ov18_021E6A98(&ret[160 * i + 37 + 5 * j], r1 + 1, 3);
            } else {
                ov18_021E6A98(&ret[160 * i + 37 + 5 * j], r1 + 1, 14);
            }
        }
    }

    return ret;
}

u16 *ov18_021E6BB8(PokedexAppData *pokedexApp, u32 a1) {
    u16 *ret = Heap_AllocAtEnd(HEAP_ID_37, 160 * 10 * sizeof(u16));
    u16 *sp14 = sub_02019B08(pokedexApp->unk_0008, 5);

    for (u16 i = 0; i < 10; ++i) {
        MI_CpuCopy16(sp14, &ret[160 * i], 160 * sizeof(u16));
        for (u16 j = 0; j < 5; ++j) {
            u32 sp4 = a1 + 5 * i + j;
            if (pokedexApp->unk_1030[sp4].unk_0 == SPECIES_NONE) {
                continue;
            }
            u32 r1 = Pokedex_ConvertToCurrentDexNo(pokedexApp->unk_1858, pokedexApp->unk_1030[sp4].unk_0);
            if (pokedexApp->unk_1030[sp4].unk_2 == 2) {
                ret[160 * i + 36 + 5 * j] = 0x1002;
                ov18_021E6A98(&ret[160 * i + 37 + 5 * j], r1, 3);
            } else {
                ov18_021E6A98(&ret[160 * i + 37 + 5 * j], r1, 14);
            }
        }
    }

    return ret;
}

void ov18_021E6C90(u16 *a0) {
    Heap_Free(a0);
}

void ov18_021E6C98(PokedexAppData *pokedexApp) {
    u16 *r5 = ov18_021E6AEC(pokedexApp, 15 * pokedexApp->unk_1859);
    ov18_021E6CE8(pokedexApp, r5);
    ov18_021E6C90(r5);
}

void ov18_021E6CC0(PokedexAppData *pokedexApp) {
    u16 *r5 = ov18_021E6BB8(pokedexApp, 15 * pokedexApp->unk_1859);
    ov18_021E6CE8(pokedexApp, r5);
    ov18_021E6C90(r5);
}

void ov18_021E6CE8(PokedexAppData *pokedexApp, u16 *a1) {
    LoadRectToBgTilemapRect(pokedexApp->unk_0004, GF_BG_LYR_MAIN_3, a1, 0, 0, 32, 24);
    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_MAIN_3);
}

BOOL ov18_021E6D10(PokedexAppData *pokedexApp, u16 species, u16 language) {
    // explicit comparison to FALSE required to match
    if (Pokedex_GetInternationalViewFlag(pokedexApp->unk_0000->pokedex) == FALSE) {
        return FALSE;
    }

    return Pokedex_HasCaughtMonWithLanguage(pokedexApp->unk_0000->pokedex, species, language);
}

BOOL ov18_021E6D38(PokedexAppData *pokedexApp, u16 species) {
    for (int i = 0; i < NELEMS(ov18_021F9C18); ++i) {
        if (ov18_021F9C18[i] != GAME_LANGUAGE && ov18_021E6D10(pokedexApp, species, ov18_021F9C18[i]) == TRUE) {
            return TRUE;
        }
    }

    return FALSE;
}

void ov18_021E6D68(PokedexAppData *pokedexApp, u16 species, s16 a2) {
    if (Pokedex_GetInternationalViewFlag(pokedexApp->unk_0000->pokedex) == FALSE) {
        return;
    }

    s16 r7 = LanguageToDexFlag(pokedexApp->unk_185C);
    for (u32 i = 0; i < 6; ++i) {
        r7 = sub_020912D0(r7, a2);
        s16 r4 = sub_02091294(r7);
        if (r4 == pokedexApp->unk_185C) {
            return;
        }
        if (ov18_021E6D10(pokedexApp, species, r4) == TRUE || r4 == GAME_LANGUAGE) {
            int r6 = ov18_021F8824(pokedexApp);
            pokedexApp->unk_185C = r4;
            ov18_021EE638(pokedexApp, species, 6);
            ov18_021E6F6C(pokedexApp->unk_0004, GF_BG_LYR_SUB_3, pokedexApp->unk_185C, pokedexApp->unk_0854, HEAP_ID_37);
            ov18_021EE8B8(pokedexApp, species, r6);
            ov18_021F24E0(pokedexApp, species, 8);
            ov18_021F2530(pokedexApp, species, 18);
            ov18_021F209C(pokedexApp, species, r6, 14);
            ov18_021F1DE4(pokedexApp, species, r6, 13);
            ov18_021F2EC8(pokedexApp, r6, 9);
            PlaySE(SEQ_SE_GS_ZKN03);
            return;
        }
    }
}

void ov18_021E6E44(PokedexAppData *pokedexApp) {
    u32 r6 = ov18_021F8824(pokedexApp);
    u16 species = ov18_021F8838(pokedexApp);

    if (species == 0) {
        ov18_021F2A2C(pokedexApp, 6, 0);
        ov18_021F2A84(pokedexApp, 8, 0);
    } else {
        if (ov18_021E6D38(pokedexApp, species) == TRUE) {
            ov18_021F2A2C(pokedexApp, 6, 1);
        } else {
            ov18_021F2A2C(pokedexApp, 6, 0);
        }
        ov18_021F2A84(pokedexApp, 8, 1);
    }
    if (!ov18_021E6D10(pokedexApp, species, pokedexApp->unk_185C)) {
        pokedexApp->unk_185C = GAME_LANGUAGE;
    }
    ov18_021EE638(pokedexApp, species, 6);
    ov18_021EE6BC(pokedexApp, species, r6);
    ov18_021EE8B8(pokedexApp, species, r6);
    ov18_021F1CAC(pokedexApp, species, 11, 10);
    ov18_021F24E0(pokedexApp, species, 8);
    ov18_021F2530(pokedexApp, species, 18);
    ov18_021F209C(pokedexApp, species, r6, 14);
    ov18_021F1DE4(pokedexApp, species, r6, 13);
    ov18_021F2EC8(pokedexApp, r6, 9);
    if (r6 >= ov18_021F891C(pokedexApp, TRUE)) {
        ov18_021E6FB8(pokedexApp->unk_0004, GF_BG_LYR_SUB_3, pokedexApp->unk_0854, HEAP_ID_37);
        ClearWindowTilemapAndScheduleTransfer(&pokedexApp->unk_007C);
        ov18_021F11C0(pokedexApp, 10, 0);
    } else {
        ov18_021E6F6C(pokedexApp->unk_0004, GF_BG_LYR_SUB_3, pokedexApp->unk_185C, pokedexApp->unk_0854, HEAP_ID_37);
        ScheduleWindowCopyToVram(&pokedexApp->unk_007C);
    }
}

void ov18_021E6F6C(BgConfig *bgConfig, u8 bgId, u8 language, NARC *narc, enum HeapID heapId) {
    NNSG2dScreenData *spC;

    void *r6 = GfGfxLoader_GetScrnDataFromOpenNarc(narc, language == GAME_LANGUAGE ? 20 : 21, TRUE, &spC, heapId);
    LoadRectToBgTilemapRect(bgConfig, bgId, spC->rawData, 0, 0, 32, 24);
    ScheduleBgTilemapBufferTransfer(bgConfig, bgId);
    Heap_Free(r6);
}

void ov18_021E6FB8(BgConfig *bgConfig, u8 bgId, NARC *narc, enum HeapID heapId) {
    NNSG2dScreenData *spC;

    void *r6 = GfGfxLoader_GetScrnDataFromOpenNarc(narc, 22, TRUE, &spC, heapId);
    LoadRectToBgTilemapRect(bgConfig, bgId, spC->rawData, 0, 0, 32, 24);
    ScheduleBgTilemapBufferTransfer(bgConfig, bgId);
    Heap_Free(r6);
}

void ov18_021E6FFC(PokedexAppData *pokedexApp) {
    pokedexApp->unk_1868 = 0;
    pokedexApp->unk_186C = 0x1A;
    pokedexApp->unk_1870 = 0x11;
    pokedexApp->unk_1874 = 0x11;
    pokedexApp->unk_1878 = 0;
    pokedexApp->unk_187C = 0x98;
    pokedexApp->unk_1880 = 0;
    pokedexApp->unk_1884 = 0x98;
    pokedexApp->unk_1888 = 3;
    pokedexApp->unk_188C = 14;
}

void ov18_021E7048(PokedexAppData *pokedexApp) {
    ov18_021E613C(pokedexApp, GF_BG_LYR_MAIN_0);
    ov18_021E613C(pokedexApp, GF_BG_LYR_MAIN_1);
    ov18_021E613C(pokedexApp, GF_BG_LYR_MAIN_3);
    ov18_021E613C(pokedexApp, GF_BG_LYR_SUB_0);
    ov18_021E613C(pokedexApp, GF_BG_LYR_SUB_1);

    GfGfxLoader_LoadCharDataFromOpenNarc(pokedexApp->unk_0854, 4, pokedexApp->unk_0004, GF_BG_LYR_MAIN_1, 0, 0, TRUE, HEAP_ID_37);
    GfGfxLoader_LoadCharDataFromOpenNarc(pokedexApp->unk_0854, 3, pokedexApp->unk_0004, GF_BG_LYR_MAIN_3, 0, 0, TRUE, HEAP_ID_37);
    GfGfxLoader_LoadCharDataFromOpenNarc(pokedexApp->unk_0854, 58, pokedexApp->unk_0004, GF_BG_LYR_MAIN_2, 0, 0, TRUE, HEAP_ID_37);
    GfGfxLoader_LoadScrnDataFromOpenNarc(pokedexApp->unk_0854, 57, pokedexApp->unk_0004, GF_BG_LYR_MAIN_2, 0, 0, TRUE, HEAP_ID_37);
    PaletteData_LoadOpenNarc(pokedexApp->unk_0850, pokedexApp->unk_0854, 2, HEAP_ID_37, PLTTBUF_MAIN_BG, 0, 0);

    GfGfxLoader_LoadCharDataFromOpenNarc(pokedexApp->unk_0854, 58, pokedexApp->unk_0004, GF_BG_LYR_SUB_2, 0, 0, TRUE, HEAP_ID_37);
    GfGfxLoader_LoadCharDataFromOpenNarc(pokedexApp->unk_0854, 58, pokedexApp->unk_0004, GF_BG_LYR_SUB_3, 0, 0, TRUE, HEAP_ID_37);
    GfGfxLoader_LoadScrnDataFromOpenNarc(pokedexApp->unk_0854, 59, pokedexApp->unk_0004, GF_BG_LYR_SUB_3, 0, 0, TRUE, HEAP_ID_37);
    GfGfxLoader_LoadScrnDataFromOpenNarc(pokedexApp->unk_0854, 60, pokedexApp->unk_0004, GF_BG_LYR_SUB_2, 0, 0, TRUE, HEAP_ID_37);
    PaletteData_LoadOpenNarc(pokedexApp->unk_0850, pokedexApp->unk_0854, 18, HEAP_ID_37, PLTTBUF_SUB_BG, 0, 0);

    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_MAIN_0);
    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_MAIN_1);
    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_MAIN_2);
    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_MAIN_3);
    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_SUB_0);
    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_SUB_1);
    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_SUB_2);
    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_SUB_3);
}

void ov18_021E71D0(PokedexAppData *pokedexApp, int a1, int a2) {
    switch (a1) {
    case 0:
        GfGfxLoader_LoadScrnDataFromOpenNarc(pokedexApp->unk_0854, 57, pokedexApp->unk_0004, GF_BG_LYR_MAIN_2, 0, 0, TRUE, HEAP_ID_37);
        ov18_021F6DE0(pokedexApp, a2);
        ov18_021EEED0(pokedexApp, 0);
        ov18_021EF45C(pokedexApp);
        ov18_021EF528(pokedexApp);
        ov18_021F3618(pokedexApp, 0);
        break;
    case 1:
        GfGfxLoader_LoadScrnDataFromOpenNarc(pokedexApp->unk_0854, 62, pokedexApp->unk_0004, GF_BG_LYR_MAIN_2, 0, 0, TRUE, HEAP_ID_37);
        ov18_021E7448(pokedexApp, &ov18_021F9780[pokedexApp->unk_1868], TRUE);
        ov18_021F6EC0(pokedexApp);
        ov18_021EEED0(pokedexApp, 2);
        ov18_021EF5D8(pokedexApp);
        ov18_021F3618(pokedexApp, 4);
        break;
    case 2:
        GfGfxLoader_LoadScrnDataFromOpenNarc(pokedexApp->unk_0854, 63, pokedexApp->unk_0004, GF_BG_LYR_MAIN_2, 0, 0, TRUE, HEAP_ID_37);
        ov18_021E76A4(pokedexApp, pokedexApp->unk_186C, 1);
        ov18_021F6FA0(pokedexApp);
        ov18_021EEED0(pokedexApp, 3);
        ov18_021EF764(pokedexApp);
        ov18_021F3618(pokedexApp, 4);
        break;
    case 3:
        GfGfxLoader_LoadScrnDataFromOpenNarc(pokedexApp->unk_0854, 64, pokedexApp->unk_0004, GF_BG_LYR_MAIN_2, 0, 0, TRUE, HEAP_ID_37);
        ov18_021E74E4(pokedexApp);
        ov18_021F7124(pokedexApp);
        ov18_021EEED0(pokedexApp, 4);
        ov18_021EF848(pokedexApp);
        ov18_021F3618(pokedexApp, 4);
        break;
    case 4:
        GfGfxLoader_LoadScrnDataFromOpenNarc(pokedexApp->unk_0854, 65, pokedexApp->unk_0004, GF_BG_LYR_MAIN_2, 0, 0, TRUE, HEAP_ID_37);
        ov18_021F7354(pokedexApp);
        ov18_021EEED0(pokedexApp, 5);
        ov18_021EF91C(pokedexApp);
        ov18_021F3618(pokedexApp, 2);
        break;
    case 5:
        GfGfxLoader_LoadScrnDataFromOpenNarc(pokedexApp->unk_0854, 66, pokedexApp->unk_0004, GF_BG_LYR_MAIN_2, 0, 0, TRUE, HEAP_ID_37);
        ov18_021F74D8(pokedexApp);
        ov18_021EEED0(pokedexApp, 6);
        ov18_021EF9B4(pokedexApp);
        ov18_021F3618(pokedexApp, 3);
        break;
    case 6:
        GfGfxLoader_LoadScrnDataFromOpenNarc(pokedexApp->unk_0854, 67, pokedexApp->unk_0004, GF_BG_LYR_MAIN_2, 0, 0, TRUE, HEAP_ID_37);
        ov18_021E7448(pokedexApp, &ov18_021F9770[pokedexApp->unk_1888], TRUE);
        ov18_021F7668(pokedexApp);
        ov18_021EEED0(pokedexApp, 7);
        ov18_021EFA50(pokedexApp);
        ov18_021F3618(pokedexApp, 4);
        ov18_021E7564(pokedexApp);
        break;
    case 7:
        GfGfxLoader_LoadScrnDataFromOpenNarc(pokedexApp->unk_0854, 68, pokedexApp->unk_0004, GF_BG_LYR_MAIN_2, 0, 0, TRUE, HEAP_ID_37);
        ov18_021E7628(pokedexApp, pokedexApp->unk_188C, TRUE);
        ov18_021F7748(pokedexApp);
        ov18_021EEED0(pokedexApp, 8);
        ov18_021EFB88(pokedexApp);
        ov18_021F3618(pokedexApp, 1);
        break;
    }
}

void ov18_021E7448(PokedexAppData *pokedexApp, const UnkStruct_ov18_021F9780 *a1, BOOL a2) {
    if (a2 == TRUE) {
        BgTilemapRectChangePalette(pokedexApp->unk_0004, GF_BG_LYR_MAIN_2, a1->x, a1->y, a1->width, a1->height, 3);
    } else {
        BgTilemapRectChangePalette(pokedexApp->unk_0004, GF_BG_LYR_MAIN_2, a1->x, a1->y, a1->width, a1->height, 2);
    }
    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_MAIN_2);
}

void ov18_021E7490(PokedexAppData *pokedexApp, const UnkStruct_ov18_021F9780 *a1, int *a2, int a3) {
    ov18_021E7448(pokedexApp, &a1[*a2], FALSE);
    *a2 = a3;
    ov18_021E7448(pokedexApp, &a1[a3], TRUE);
}

void ov18_021E74B8(PokedexAppData *pokedexApp, int a1) {
    ov18_021E7490(pokedexApp, ov18_021F9780, &pokedexApp->unk_1868, a1);
    ov18_021EFBE8(pokedexApp, 37);
    ScheduleWindowCopyToVram(&pokedexApp->unk_025C);
}

void ov18_021E74E4(PokedexAppData *pokedexApp) {
    for (int i = 0; i < NELEMS(ov18_021F990C); ++i) {
        ov18_021E7448(pokedexApp, &ov18_021F990C[i], FALSE);
    }
    ov18_021E7448(pokedexApp, &ov18_021F990C[pokedexApp->unk_1870], TRUE);
    ov18_021E7448(pokedexApp, &ov18_021F990C[pokedexApp->unk_1874], TRUE);
}

void ov18_021E7534(PokedexAppData *pokedexApp, int a1) {
    ov18_021E7490(pokedexApp, ov18_021F9770, &pokedexApp->unk_1888, a1);
    ov18_021EFE70(pokedexApp, 75);
    ScheduleWindowCopyToVram(&pokedexApp->unk_04BC);
}

void ov18_021E7564(PokedexAppData *pokedexApp) {
    if (pokedexApp->unk_1860 == 1) {
        return;
    }
    GridInputHandler_ClearEnabledFlag(pokedexApp->unk_1864, 1);

    const UnkStruct_ov18_021F9780 *r5 = &ov18_021F9770[1];
    u16 *r4 = GetBgTilemapBuffer(pokedexApp->unk_0004, GF_BG_LYR_MAIN_2);
    MI_CpuCopy16(
        &r4[32 * (r5->y - 2) + (r5->x - 1)],
        &r4[32 * (r5->y - 1) + (r5->x - 1)],
        sizeof(u16) * (r5->width + 2));
    MI_CpuCopy16(
        &r4[32 * (r5->y - 2) + (r5->x - 1)],
        &r4[32 * (r5->y) + (r5->x - 1)],
        sizeof(u16) * (r5->width + 2));
    MI_CpuCopy16(
        &r4[32 * (r5->y - 2) + (r5->x - 1)],
        &r4[32 * (r5->y + 1) + (r5->x - 1)],
        sizeof(u16) * (r5->width + 2));
    MI_CpuCopy16(
        &r4[32 * (r5->y - 3) + (r5->x - 1)],
        &r4[32 * (r5->y + 2) + (r5->x - 1)],
        sizeof(u16) * (r5->width + 2));
    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_MAIN_2);
}

void ov18_021E7628(PokedexAppData *pokedexApp, u32 a1, BOOL a2) {
    UnkStruct_ov18_021F9780 sp0;

    sp0.width = 4;
    sp0.height = 4;
    sp0.x = 6 * (a1 % 5) + 2;
    sp0.y = 5 * (a1 / 5 + 1);

    ov18_021E7448(pokedexApp, &sp0, a2);
}

void ov18_021E766C(PokedexAppData *pokedexApp, u32 a1) {
    ov18_021E7628(pokedexApp, pokedexApp->unk_188C, FALSE);
    pokedexApp->unk_188C = a1;
    ov18_021E7628(pokedexApp, pokedexApp->unk_188C, TRUE);
    ov18_021F3494(pokedexApp);
}

u8 ov18_021E7698(int a0) {
    return ov18_021F9C20[a0];
}

void ov18_021E76A4(PokedexAppData *pokedexApp, u32 a1, BOOL a2) {
    UnkStruct_ov18_021F9780 sp0;

    sp0.width = 2;
    sp0.height = 2;
    sp0.x = 4 * (ov18_021F9C20[a1] % 7) + 3;
    sp0.y = 4 * (ov18_021F9C20[a1] / 7) + 5;

    ov18_021E7448(pokedexApp, &sp0, a2);
}

void ov18_021E76EC(PokedexAppData *pokedexApp, u32 a1) {
    ov18_021E76A4(pokedexApp, pokedexApp->unk_186C, FALSE);
    pokedexApp->unk_186C = a1;
    ov18_021E76A4(pokedexApp, pokedexApp->unk_186C, TRUE);
    ov18_021EFC3C(pokedexApp, 66);
    ScheduleWindowCopyToVram(&pokedexApp->unk_042C);
}

void ov18_021E7724(PokedexAppData *pokedexApp) {
    NNSG2dScreenData *sp1C;
    void *sp14;
    u16 *r4;
    u16 *r5;
    u16 *sp10;
    u16 sp1A;
    u16 sp18;
    u32 i;
    u32 j;

    r4 = sub_02019B08(pokedexApp->unk_0008, 15);
    r5 = sub_02019B08(pokedexApp->unk_0008, 14);

    sp14 = GfGfxLoader_GetScrnDataFromOpenNarc(pokedexApp->unk_0854, 0, TRUE, &sp1C, HEAP_ID_37);
    sp10 = (u16 *)sp1C->rawData;
    for (i = 0; i < 24; ++i) {
        memcpy(&r4[32 * i], &sp10[32 * i], 32 * sizeof(u16));
        memcpy(&r5[3 * i], &sp10[32 * i + 0x400], 3 * sizeof(u16));
    }
    Heap_Free(sp14);

    if (pokedexApp->unk_1860 == 0) {
        for (i = 0; i < 2; ++i) {
            for (j = 0; j < 26; ++j) {
                sp10 = &r4[(i + 15) * 32 + 3 + j];
                *sp10 = (*sp10 & 0xF000) | 0x16;
            }
        }
    }

    if (pokedexApp->unk_1858 == 0) {
        r5 = sub_02019B08(pokedexApp->unk_0008, 2);
        sub_02019B44(pokedexApp->unk_0008, 2, &sp1A, &sp18);
        for (i = 0; i < sp18; ++i) {
            for (j = 0; j < sp1A; ++j) {
                r4[32 * (i + 3) + j + 5] = r5[i * sp1A + j];
            }
        }
    } else {
        r5 = sub_02019B08(pokedexApp->unk_0008, 3);
        sub_02019B44(pokedexApp->unk_0008, 2, &sp1A, &sp18); // typo? should be 3 not 2
        for (i = 0; i < sp18; ++i) {
            for (j = 0; j < sp1A; ++j) {
                r4[32 * (i + 3) + j + 5] = r5[i * sp1A + j];
            }
        }
    }

    ov18_021EFFEC(pokedexApp);
}

void ov18_021E78AC(PokedexAppData *pokedexApp) {
    int r6 = ov18_021F8824(pokedexApp);
    if (r6 == 0) {
        ov18_021F2A2C(pokedexApp, 22, 0);
        ov18_021F2A84(pokedexApp, 24, 0);
        ov18_021F3B60(pokedexApp, 0);
        ov18_021EE638(pokedexApp, SPECIES_NONE, 94);
        ov18_021F014C(pokedexApp);
        ov18_021F0118(pokedexApp, 1);
        ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_SUB_1);
        pokedexApp->unk_1898 = 1;
    } else {
        ov18_021F0118(pokedexApp, 0);
        u16 species = ov18_021F8838(pokedexApp);
        if (!ov18_021E6D10(pokedexApp, species, pokedexApp->unk_185C)) {
            pokedexApp->unk_185C = GAME_LANGUAGE;
        }
        ov18_021EE638(pokedexApp, species, 94);
        ov18_021EE6EC(pokedexApp, species, r6);
        ov18_021EED70(pokedexApp, species, r6);
        ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_SUB_3);
        ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_SUB_1);
        pokedexApp->unk_1898 = 2;
        ov18_021F3B60(pokedexApp, 1);
        ov18_021F1CAC(pokedexApp, species, 46, 45);
        ov18_021F24E0(pokedexApp, species, 24);
        ov18_021F2530(pokedexApp, species, 53);
        ov18_021F209C(pokedexApp, species, r6, 49);
        ov18_021F1DE4(pokedexApp, species, r6, 48);
        ov18_021F2EC8(pokedexApp, r6, 44);
        if (species == SPECIES_NONE) {
            ov18_021F2A2C(pokedexApp, 22, 0);
            ov18_021F2A84(pokedexApp, 24, 0);
            ov18_021E6FB8(pokedexApp->unk_0004, GF_BG_LYR_SUB_3, pokedexApp->unk_0854, HEAP_ID_37);
            ClearWindowTilemapAndScheduleTransfer(&pokedexApp->unk_051C);

            ov18_021F11C0(pokedexApp, 45, 0);
        } else {
            if (ov18_021E6D38(pokedexApp, species) == TRUE) {
                ov18_021F2A2C(pokedexApp, 22, 1);
            } else {
                ov18_021F2A2C(pokedexApp, 22, 0);
            }
            ov18_021F2A84(pokedexApp, 24, 1);
            ov18_021E6F6C(pokedexApp->unk_0004, GF_BG_LYR_SUB_3, pokedexApp->unk_185C, pokedexApp->unk_0854, HEAP_ID_37);
            ScheduleWindowCopyToVram(&pokedexApp->unk_051C);
        }
    }
}

void ov18_021E7A3C(PokedexAppData *pokedexApp) {
    switch (pokedexApp->unk_1898) {
    case 0:
        return;
    case 1:
        SetBgPriority(GF_BG_LYR_SUB_2, 2);
        SetBgPriority(GF_BG_LYR_SUB_3, 3);
        break;
    case 2:
        SetBgPriority(GF_BG_LYR_SUB_2, 3);
        SetBgPriority(GF_BG_LYR_SUB_3, 2);
        break;
    }
    pokedexApp->unk_1898 = 0;
}

void ov18_021E7A80(PokedexAppData *pokedexApp, u16 species, u16 a2) {
    if (!Pokedex_GetInternationalViewFlag(pokedexApp->unk_0000->pokedex)) {
        return;
    }

    int spC = ov18_021F8824(pokedexApp);
    if (spC == 0) {
        return;
    }

    s16 dexLangFlag = LanguageToDexFlag(pokedexApp->unk_185C);
    for (int i = 0; i < 6u; ++i) {
        dexLangFlag += a2;
        if (dexLangFlag < 0) {
            dexLangFlag = 5;
        } else if (dexLangFlag >= 6) {
            dexLangFlag = 0;
        }
        s16 language = sub_02091294(dexLangFlag);
        if (language == pokedexApp->unk_185C) {
            break;
        }
        if (ov18_021E6D10(pokedexApp, species, language) == TRUE || language == GAME_LANGUAGE) {
            pokedexApp->unk_185C = language;
            ov18_021EE638(pokedexApp, species, 94);
            ov18_021E6F6C(pokedexApp->unk_0004, GF_BG_LYR_SUB_3, pokedexApp->unk_185C, pokedexApp->unk_0854, HEAP_ID_37);
            ov18_021EED70(pokedexApp, species, spC);
            ov18_021F24E0(pokedexApp, species, 24);
            ov18_021F2530(pokedexApp, species, 53);
            ov18_021F209C(pokedexApp, species, spC, 49);
            ov18_021F1DE4(pokedexApp, species, spC, 48);
            ov18_021F2EC8(pokedexApp, spC, 44);
            PlaySE(SEQ_SE_GS_ZKN03);
            break;
        }
    }
}

void ov18_021E7B6C(BOOL a0) {
    if (a0 == TRUE) {
        GXS_SetVisibleWnd(GX_WNDMASK_W0);
        G2S_SetWnd0InsidePlane(GX_PLANEMASK_BG0 | GX_PLANEMASK_BG1 | GX_PLANEMASK_BG2 | GX_PLANEMASK_BG3, TRUE);
        G2S_SetWndOutsidePlane(GX_PLANEMASK_ALL, TRUE);
        G2S_SetWnd0Position(0, 0x98, 0xFF, 0xC0);
    } else {
        GXS_SetVisibleWnd(GX_WNDMASK_NONE);
    }
}

void ov18_021E7BD0(PokedexAppData *pokedexApp) {
    ov18_021E613C(pokedexApp, GF_BG_LYR_MAIN_0);
    ov18_021E613C(pokedexApp, GF_BG_LYR_MAIN_2);
    ov18_021E613C(pokedexApp, GF_BG_LYR_SUB_1);
    ov18_021E613C(pokedexApp, GF_BG_LYR_SUB_2);

    GfGfxLoader_LoadScrnDataFromOpenNarc(pokedexApp->unk_0854, 82, pokedexApp->unk_0004, GF_BG_LYR_MAIN_3, 0, 0, TRUE, HEAP_ID_37);
    if (pokedexApp->unk_1860 == 1) {
        GfGfxLoader_LoadScrnDataFromOpenNarc(pokedexApp->unk_0854, 81, pokedexApp->unk_0004, GF_BG_LYR_MAIN_0, 0, 0, TRUE, HEAP_ID_37);
    } else {
        GfGfxLoader_LoadScrnDataFromOpenNarc(pokedexApp->unk_0854, 80, pokedexApp->unk_0004, GF_BG_LYR_MAIN_0, 0, 0, TRUE, HEAP_ID_37);
    }
    GfGfxLoader_LoadCharDataFromOpenNarc(pokedexApp->unk_0854, 83, pokedexApp->unk_0004, GF_BG_LYR_MAIN_0, 0, 0, TRUE, HEAP_ID_37);
    GfGfxLoader_LoadCharDataFromOpenNarc(pokedexApp->unk_0854, 83, pokedexApp->unk_0004, GF_BG_LYR_MAIN_3, 0, 0, TRUE, HEAP_ID_37);
    GfGfxLoader_LoadCharDataFromOpenNarc(pokedexApp->unk_0854, 4, pokedexApp->unk_0004, GF_BG_LYR_MAIN_1, 0, 0, TRUE, HEAP_ID_37);
    PaletteData_LoadOpenNarc(pokedexApp->unk_0850, pokedexApp->unk_0854, 2, HEAP_ID_37, PLTTBUF_MAIN_BG, 0, 0);

    GfGfxLoader_LoadScrnDataFromOpenNarc(pokedexApp->unk_0854, 84, pokedexApp->unk_0004, GF_BG_LYR_SUB_3, 0, 0, TRUE, HEAP_ID_37);
    GfGfxLoader_LoadCharDataFromOpenNarc(pokedexApp->unk_0854, 85, pokedexApp->unk_0004, GF_BG_LYR_SUB_3, 0, 0, TRUE, HEAP_ID_37);
    GfGfxLoader_LoadScrnDataFromOpenNarc(pokedexApp->unk_0854, 86, pokedexApp->unk_0004, GF_BG_LYR_SUB_0, 0, 0, TRUE, HEAP_ID_37);
    GfGfxLoader_LoadCharDataFromOpenNarc(pokedexApp->unk_0854, 87, pokedexApp->unk_0004, GF_BG_LYR_SUB_0, 0, 0, TRUE, HEAP_ID_37);
    PaletteData_LoadOpenNarc(pokedexApp->unk_0850, pokedexApp->unk_0854, 18, HEAP_ID_37, PLTTBUF_SUB_BG, 0, 0);

    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_MAIN_0);
    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_MAIN_1);
    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_MAIN_2);
    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_MAIN_3);
    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_SUB_0);
    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_SUB_1);
    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_SUB_2);
    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_SUB_3);
}

void ov18_021E7D90(PokedexAppData *pokedexApp) {
    ov18_021E613C(pokedexApp, GF_BG_LYR_MAIN_0);
    ov18_021E613C(pokedexApp, GF_BG_LYR_MAIN_1);
    ov18_021E613C(pokedexApp, GF_BG_LYR_MAIN_2);
    ov18_021E613C(pokedexApp, GF_BG_LYR_SUB_0);
    ov18_021E613C(pokedexApp, GF_BG_LYR_SUB_1);
    ov18_021E613C(pokedexApp, GF_BG_LYR_SUB_3);

    GfGfxLoader_LoadScrnDataFromOpenNarc(pokedexApp->unk_0854, 89, pokedexApp->unk_0004, GF_BG_LYR_MAIN_3, 0, 0, TRUE, HEAP_ID_37);
    GfGfxLoader_LoadCharDataFromOpenNarc(pokedexApp->unk_0854, 90, pokedexApp->unk_0004, GF_BG_LYR_MAIN_3, 0, 0, TRUE, HEAP_ID_37);
    GfGfxLoader_LoadCharDataFromOpenNarc(pokedexApp->unk_0854, 4, pokedexApp->unk_0004, GF_BG_LYR_MAIN_1, 0, 0, TRUE, HEAP_ID_37);
    PaletteData_LoadOpenNarc(pokedexApp->unk_0850, pokedexApp->unk_0854, 2, HEAP_ID_37, PLTTBUF_MAIN_BG, 0, 0);

    GfGfxLoader_LoadScrnDataFromOpenNarc(pokedexApp->unk_0854, 91, pokedexApp->unk_0004, GF_BG_LYR_SUB_2, 0, 0, TRUE, HEAP_ID_37);
    GfGfxLoader_LoadCharDataFromOpenNarc(pokedexApp->unk_0854, 92, pokedexApp->unk_0004, GF_BG_LYR_SUB_2, 0, 0, TRUE, HEAP_ID_37);
    PaletteData_LoadOpenNarc(pokedexApp->unk_0850, pokedexApp->unk_0854, 18, HEAP_ID_37, PLTTBUF_SUB_BG, 0, 0);

    sub_020196E8(pokedexApp->unk_0008, 16, 0, 20);

    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_MAIN_0);
    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_MAIN_1);
    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_MAIN_2);
    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_MAIN_3);
    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_SUB_0);
    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_SUB_1);
    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_SUB_2);
    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_SUB_3);
}

void ov18_021E7ED8(PokedexAppData *pokedexApp) {
    ov18_021E613C(pokedexApp, GF_BG_LYR_MAIN_0);
    ov18_021E613C(pokedexApp, GF_BG_LYR_MAIN_2);
    ov18_021E613C(pokedexApp, GF_BG_LYR_SUB_0);
    ov18_021E613C(pokedexApp, GF_BG_LYR_SUB_1);
    ov18_021E613C(pokedexApp, GF_BG_LYR_SUB_3);

    GfGfxLoader_LoadScrnDataFromOpenNarc(pokedexApp->unk_0854, 101, pokedexApp->unk_0004, GF_BG_LYR_MAIN_3, 0, 0, TRUE, HEAP_ID_37);
    GfGfxLoader_LoadCharDataFromOpenNarc(pokedexApp->unk_0854, 102, pokedexApp->unk_0004, GF_BG_LYR_MAIN_3, 0, 0, TRUE, HEAP_ID_37);
    GfGfxLoader_LoadCharDataFromOpenNarc(pokedexApp->unk_0854, 4, pokedexApp->unk_0004, GF_BG_LYR_MAIN_1, 0, 0, TRUE, HEAP_ID_37);
    PaletteData_LoadOpenNarc(pokedexApp->unk_0850, pokedexApp->unk_0854, 2, HEAP_ID_37, PLTTBUF_MAIN_BG, 0, 0);

    GfGfxLoader_LoadScrnDataFromOpenNarc(pokedexApp->unk_0854, 103, pokedexApp->unk_0004, GF_BG_LYR_SUB_2, 0, 0, TRUE, HEAP_ID_37);
    GfGfxLoader_LoadCharDataFromOpenNarc(pokedexApp->unk_0854, 104, pokedexApp->unk_0004, GF_BG_LYR_SUB_2, 0, 0, TRUE, HEAP_ID_37);
    PaletteData_LoadOpenNarc(pokedexApp->unk_0850, pokedexApp->unk_0854, 18, HEAP_ID_37, PLTTBUF_SUB_BG, 0, 0);

    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_MAIN_0);
    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_MAIN_1);
    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_MAIN_2);
    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_MAIN_3);
    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_SUB_0);
    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_SUB_1);
    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_SUB_2);
    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_SUB_3);
}

void ov18_021E800C(PokedexAppData *pokedexApp) {
    ov18_021E613C(pokedexApp, GF_BG_LYR_MAIN_2);
    ov18_021E613C(pokedexApp, GF_BG_LYR_SUB_0);
    ov18_021E613C(pokedexApp, GF_BG_LYR_SUB_1);
    ov18_021E613C(pokedexApp, GF_BG_LYR_SUB_2);

    GfGfxLoader_LoadScrnDataFromOpenNarc(pokedexApp->unk_0854, 96, pokedexApp->unk_0004, GF_BG_LYR_MAIN_3, 0, 0, TRUE, HEAP_ID_37);
    GfGfxLoader_LoadCharDataFromOpenNarc(pokedexApp->unk_0854, 93, pokedexApp->unk_0004, GF_BG_LYR_MAIN_3, 0, 0, TRUE, HEAP_ID_37);
    GfGfxLoader_LoadScrnDataFromOpenNarc(pokedexApp->unk_0854, 95, pokedexApp->unk_0004, GF_BG_LYR_MAIN_0, 0, 0, TRUE, HEAP_ID_37);
    GfGfxLoader_LoadCharDataFromOpenNarc(pokedexApp->unk_0854, 93, pokedexApp->unk_0004, GF_BG_LYR_MAIN_0, 0, 0, TRUE, HEAP_ID_37);
    GfGfxLoader_LoadCharDataFromOpenNarc(pokedexApp->unk_0854, 4, pokedexApp->unk_0004, GF_BG_LYR_MAIN_1, 0, 0, TRUE, HEAP_ID_37);
    PaletteData_LoadOpenNarc(pokedexApp->unk_0850, pokedexApp->unk_0854, 2, HEAP_ID_37, PLTTBUF_MAIN_BG, 0, 0);

    GfGfxLoader_LoadScrnDataFromOpenNarc(pokedexApp->unk_0854, 97, pokedexApp->unk_0004, GF_BG_LYR_SUB_3, 0, 0, TRUE, HEAP_ID_37);
    GfGfxLoader_LoadCharDataFromOpenNarc(pokedexApp->unk_0854, 94, pokedexApp->unk_0004, GF_BG_LYR_SUB_3, 0, 0, TRUE, HEAP_ID_37);
    PaletteData_LoadOpenNarc(pokedexApp->unk_0850, pokedexApp->unk_0854, 18, HEAP_ID_37, PLTTBUF_SUB_BG, 0, 0);

    if (pokedexApp->unk_18C4 == 1) {
        void *r4;
        NNSG2dScreenData *sp10;

        r4 = GfGfxLoader_GetScrnDataFromOpenNarc(pokedexApp->unk_0854, 100, TRUE, &sp10, HEAP_ID_37);
        LoadRectToBgTilemapRect(pokedexApp->unk_0004, GF_BG_LYR_MAIN_0, sp10->rawData, 16, 16, 16, 4);
        Heap_Free(r4);
    }

    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_MAIN_0);
    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_MAIN_1);
    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_MAIN_2);
    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_MAIN_3);
    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_SUB_0);
    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_SUB_1);
    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_SUB_2);
    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_SUB_3);
}

void ov18_021E81A8(PokedexAppData *pokedexApp) {
    ov18_021E613C(pokedexApp, GF_BG_LYR_MAIN_0);
    ov18_021E613C(pokedexApp, GF_BG_LYR_MAIN_2);

    GfGfxLoader_LoadScrnDataFromOpenNarc(pokedexApp->unk_0854, 98, pokedexApp->unk_0004, GF_BG_LYR_MAIN_3, 0, 0, TRUE, HEAP_ID_37);
    GfGfxLoader_LoadCharDataFromOpenNarc(pokedexApp->unk_0854, 93, pokedexApp->unk_0004, GF_BG_LYR_MAIN_3, 0, 0, TRUE, HEAP_ID_37);
    GfGfxLoader_LoadScrnDataFromOpenNarc(pokedexApp->unk_0854, 99, pokedexApp->unk_0004, GF_BG_LYR_SUB_3, 0, 0, TRUE, HEAP_ID_37);
    GfGfxLoader_LoadCharDataFromOpenNarc(pokedexApp->unk_0854, 94, pokedexApp->unk_0004, GF_BG_LYR_SUB_3, 0, 0, TRUE, HEAP_ID_37);

    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_MAIN_0);
    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_MAIN_2);
    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_MAIN_3);
    ScheduleBgTilemapBufferTransfer(pokedexApp->unk_0004, GF_BG_LYR_SUB_3);
}

void ov18_021E8254(PokedexAppData *pokedexApp) {
    memset(pokedexApp->unk_18A4, 0, sizeof(pokedexApp->unk_18A4));

    switch (pokedexApp->unk_18A2) {
    case SPECIES_UNOWN:
    case SPECIES_PICHU:
    case SPECIES_DEOXYS:
    case SPECIES_BURMY:
    case SPECIES_WORMADAM:
    case SPECIES_SHELLOS:
    case SPECIES_GASTRODON:
    case SPECIES_ROTOM:
    case SPECIES_GIRATINA:
    case SPECIES_SHAYMIN:
        pokedexApp->unk_18C4 = Pokedex_GetSeenFormNum(pokedexApp->unk_0000->pokedex, pokedexApp->unk_18A2);
        for (u32 i = 0; i < pokedexApp->unk_18C4; ++i) {
            pokedexApp->unk_18A4[i] = Pokedex_GetSeenFormByIdx(pokedexApp->unk_0000->pokedex, pokedexApp->unk_18A2, i) | 0x80;
        }
        break;
    case SPECIES_CASTFORM:
        pokedexApp->unk_18C4 = 4;
        for (u32 i = 0; i < pokedexApp->unk_18C4; ++i) {
            pokedexApp->unk_18A4[i] = i | 0x80;
        }
        break;
    case SPECIES_CHERRIM:
        pokedexApp->unk_18C4 = 2;
        for (u32 i = 0; i < pokedexApp->unk_18C4; ++i) {
            pokedexApp->unk_18A4[i] = i | 0x80;
        }
        break;
    default:
        pokedexApp->unk_18A4[0] = ov18_021E83D0(pokedexApp, 0);
        pokedexApp->unk_18A4[1] = ov18_021E83D0(pokedexApp, 1);
        if (pokedexApp->unk_18A4[1] == 0) {
            pokedexApp->unk_18C4 = 1;
        } else {
            pokedexApp->unk_18C4 = 2;
        }
        break;
    }
}

u8 ov18_021E83D0(PokedexAppData *pokedexApp, u8 a1) {
    switch (Pokedex_SpeciesGetLastSeenGender(pokedexApp->unk_0000->pokedex, pokedexApp->unk_18A2, a1)) {
    case MON_MALE:
        return 1;
    case MON_FEMALE:
        return 2;
    case MON_GENDERLESS:
        return 3;
    default:
        if (a1 == 0) {
            return 3;
        } else {
            return 0;
        }
    }
}

void ov18_021E8410(PokedexAppData *pokedexApp) {
    NARC *narc; // forward decl fixes regswap
    PokedexAppData_UnkSub18CC *r5 = &pokedexApp->unk_18CC;
    narc = NARC_New(GetPokedexDataNarcID(), HEAP_ID_37);
    if (PlayerProfile_GetTrainerGender(pokedexApp->unk_0000->playerProfile) == TRAINER_MALE) {
        r5->unk_0 = GfGfxLoader_LoadFromOpenNarc(narc, 9, FALSE, HEAP_ID_37, FALSE);
        r5->unk_4 = GfGfxLoader_LoadFromOpenNarc(narc, 5, FALSE, HEAP_ID_37, FALSE);
        r5->unk_8 = GfGfxLoader_LoadFromOpenNarc(narc, 10, FALSE, HEAP_ID_37, FALSE);
        r5->unk_C = GfGfxLoader_LoadFromOpenNarc(narc, 6, FALSE, HEAP_ID_37, FALSE);
    } else {
        r5->unk_0 = GfGfxLoader_LoadFromOpenNarc(narc, 7, FALSE, HEAP_ID_37, FALSE);
        r5->unk_4 = GfGfxLoader_LoadFromOpenNarc(narc, 3, FALSE, HEAP_ID_37, FALSE);
        r5->unk_8 = GfGfxLoader_LoadFromOpenNarc(narc, 8, FALSE, HEAP_ID_37, FALSE);
        r5->unk_C = GfGfxLoader_LoadFromOpenNarc(narc, 4, FALSE, HEAP_ID_37, FALSE);
    }
    pokedexApp->unk_1848 = GfGfxLoader_LoadFromOpenNarc(narc, 0, FALSE, HEAP_ID_37, FALSE);
    pokedexApp->unk_184C = GfGfxLoader_LoadFromOpenNarc(narc, 1, FALSE, HEAP_ID_37, FALSE);
    NARC_Delete(narc);
}

void ov18_021E84EC(PokedexAppData *pokedexApp) {
    PokedexAppData_UnkSub18CC *r5 = &pokedexApp->unk_18CC;

    Heap_Free(pokedexApp->unk_1848);
    Heap_Free(pokedexApp->unk_184C);
    Heap_Free(r5->unk_0);
    Heap_Free(r5->unk_4);
    Heap_Free(r5->unk_8);
    Heap_Free(r5->unk_C);
}

void ov18_021E8528(PokedexAppData *pokedexApp, int a1, int a2) {
    ov18_021E8698(&pokedexApp->unk_18DC.unk_00, pokedexApp->unk_18A2, a1 + 4);
    ov18_021E8698(&pokedexApp->unk_18DC.unk_08, pokedexApp->unk_18A2, 7);
    ov18_021E8698(&pokedexApp->unk_18DC.unk_10, pokedexApp->unk_18A2, a1);
    ov18_021E8698(&pokedexApp->unk_18DC.unk_18, pokedexApp->unk_18A2, 3);

    u32 r2 = 1;
    r2 += pokedexApp->unk_18DC.unk_00.unk_4 - 1;
    r2 += pokedexApp->unk_18DC.unk_08.unk_4 - 1;
    r2 += pokedexApp->unk_18DC.unk_10.unk_4 - 1;
    r2 += pokedexApp->unk_18DC.unk_18.unk_4 - 1;

    pokedexApp->unk_18DC.unk_20.unk_0 = Heap_Alloc(HEAP_ID_37, sizeof(u32) * r2);
    pokedexApp->unk_18DC.unk_28 = Heap_Alloc(HEAP_ID_37, sizeof(u32) * r2);
    MI_CpuClear32(pokedexApp->unk_18DC.unk_20.unk_0, sizeof(u32) * r2);
    MI_CpuClear32(pokedexApp->unk_18DC.unk_28, sizeof(u32) * r2);
    pokedexApp->unk_18DC.unk_20.unk_0[0] = -2;
    pokedexApp->unk_18DC.unk_20.unk_4 = 1;
    pokedexApp->unk_18DC.unk_28[0] = 0;

    ov18_021E8714(pokedexApp, &pokedexApp->unk_18DC.unk_00, a2, 0);
    ov18_021E8714(pokedexApp, &pokedexApp->unk_18DC.unk_08, a2, 1);
    u32 r6 = pokedexApp->unk_18DC.unk_20.unk_4;
    ov18_021E8878(pokedexApp, &pokedexApp->unk_18DC.unk_10, a2, r6, 0);
    ov18_021E8878(pokedexApp, &pokedexApp->unk_18DC.unk_18, a2, r6, 1);
    ov18_021E8A00(pokedexApp);
}

void ov18_021E8648(PokedexAppData *pokedexApp) {
    Heap_Free(pokedexApp->unk_18DC.unk_00.unk_0);
    Heap_Free(pokedexApp->unk_18DC.unk_08.unk_0);
    Heap_Free(pokedexApp->unk_18DC.unk_10.unk_0);
    Heap_Free(pokedexApp->unk_18DC.unk_18.unk_0);
    Heap_Free(pokedexApp->unk_18DC.unk_20.unk_0);
    Heap_Free(pokedexApp->unk_18DC.unk_28);
}

void ov18_021E8698(PokedexAppData_UnkSub18DC_0 *a0, u16 a1, int a2) {
    int r3;
    u32 sp8;

    switch (a2) {
    case 0:
        r3 = 2;
        break;
    case 1:
        r3 = 0x1F1;
        break;
    case 2:
        r3 = 0x3E0;
        break;
    case 3:
        r3 = 0xB9C;
        break;
    case 4:
        r3 = 0x5CF;
        break;
    case 5:
        r3 = 0x7BE;
        break;
    case 6:
        r3 = 0x9AD;
        break;
    case 7:
        r3 = 0xD8B;
        break;
    }
    // UB: if unexpected a2, r3 is uninitialized
    a0->unk_0 = GfGfxLoader_LoadFromNarc_GetSizeOut(NARC_a_1_3_3, r3 + a1, FALSE, HEAP_ID_37, FALSE, &sp8);
    a0->unk_4 = sp8 / sizeof(u32);
}

void ov18_021E8714(PokedexAppData *pokedexApp, PokedexAppData_UnkSub18DC_0 *a1, int a2, int a3) {
    u16 i;
    u16 j;

    if (a2 == 0) {
        for (i = 0; i < a1->unk_4 - 1; ++i) {
            if (pokedexApp->unk_190C[a1->unk_0[i]].unk_00 >= 22) {
                continue;
            }
            for (j = 0; j < pokedexApp->unk_18DC.unk_20.unk_4; ++j) {
                if (pokedexApp->unk_18DC.unk_20.unk_0[j] == a1->unk_0[i]) {
                    pokedexApp->unk_18DC.unk_28[j] |= 1 << a3;
                    break;
                }
            }
            if (j == pokedexApp->unk_18DC.unk_20.unk_4) {
                pokedexApp->unk_18DC.unk_20.unk_0[pokedexApp->unk_18DC.unk_20.unk_4] = a1->unk_0[i];
                pokedexApp->unk_18DC.unk_28[pokedexApp->unk_18DC.unk_20.unk_4] = 1 << a3;
                ++pokedexApp->unk_18DC.unk_20.unk_4;
            }
        }
    } else {
        u32 r5;
        for (i = 0; i < a1->unk_4 - 1; ++i) {
            r5 = a1->unk_0[i];
            if (pokedexApp->unk_190C[a1->unk_0[i]].unk_00 < 22) {
                continue;
            }
            if (ov18_021E8B24(r5) == TRUE) {
                r5 = ov18_021E8B40();
            } else if (ov18_021E8B5C(r5) == TRUE) {
                r5 = ov18_021E8B78();
            }
            for (j = 0; j < pokedexApp->unk_18DC.unk_20.unk_4; ++j) {
                if (pokedexApp->unk_18DC.unk_20.unk_0[j] == r5) {
                    pokedexApp->unk_18DC.unk_28[j] |= 1 << a3;
                    break;
                }
            }
            if (j == pokedexApp->unk_18DC.unk_20.unk_4) {
                pokedexApp->unk_18DC.unk_20.unk_0[pokedexApp->unk_18DC.unk_20.unk_4] = r5;
                pokedexApp->unk_18DC.unk_28[pokedexApp->unk_18DC.unk_20.unk_4] = 1 << a3;
                ++pokedexApp->unk_18DC.unk_20.unk_4;
            }
        }
    }
}

void ov18_021E8878(PokedexAppData *pokedexApp, PokedexAppData_UnkSub18DC_0 *a1, int a2, int a3, int a4) {
    u16 i;
    u16 j;

    if (a2 == 0) {
        for (i = 0; i < a1->unk_4 - 1; ++i) {
            if (pokedexApp->unk_1908[a1->unk_0[i]].unk_00 >= 22) {
                continue;
            }
            for (j = a3; j < pokedexApp->unk_18DC.unk_20.unk_4; ++j) {
                if (pokedexApp->unk_18DC.unk_20.unk_0[j] == a1->unk_0[i]) {
                    pokedexApp->unk_18DC.unk_28[j] |= 1 << a4;
                    break;
                }
            }
            if (j == pokedexApp->unk_18DC.unk_20.unk_4) {
                pokedexApp->unk_18DC.unk_20.unk_0[pokedexApp->unk_18DC.unk_20.unk_4] = a1->unk_0[i];
                pokedexApp->unk_18DC.unk_28[pokedexApp->unk_18DC.unk_20.unk_4] = 0x80000000 + (1 << a4);
                ++pokedexApp->unk_18DC.unk_20.unk_4;
            }
        }
    } else {
        for (i = 0; i < a1->unk_4 - 1; ++i) {
            if (pokedexApp->unk_1908[a1->unk_0[i]].unk_00 < 22) {
                continue;
            }
            for (j = a3; j < pokedexApp->unk_18DC.unk_20.unk_4; ++j) {
                if (pokedexApp->unk_18DC.unk_20.unk_0[j] == a1->unk_0[i]) {
                    pokedexApp->unk_18DC.unk_28[j] |= 1 << a4;
                    break;
                }
            }
            if (j == pokedexApp->unk_18DC.unk_20.unk_4) {
                pokedexApp->unk_18DC.unk_20.unk_0[pokedexApp->unk_18DC.unk_20.unk_4] = a1->unk_0[i];
                pokedexApp->unk_18DC.unk_28[pokedexApp->unk_18DC.unk_20.unk_4] = 0x80000000 + (1 << a4);
                ++pokedexApp->unk_18DC.unk_20.unk_4;
            }
        }
    }
}

u32 ov18_021E89DC(u32 a0) {
    for (u32 i = 0; i < NELEMS(ov18_021F99E0); ++i) {
        if (a0 == ov18_021F99E0[i]) {
            return i;
        }
    }

    GF_ASSERT(FALSE);
    return 0;
}

void ov18_021E8A00(PokedexAppData *pokedexApp) {
    u32 r6;
    u32 r7;
    u16 i;
    u16 j;

    for (i = 1; i < pokedexApp->unk_18DC.unk_20.unk_4 - 1; ++i) {
        r6 = ov18_021E8AE0(pokedexApp, i);
        for (j = i + 1; j < pokedexApp->unk_18DC.unk_20.unk_4; ++j) {
            r7 = ov18_021E8AE0(pokedexApp, j);
            if (ov18_021E89DC(r6) > ov18_021E89DC(r7)) {
                s32 r3;
                u32 r3_2;

                r3 = pokedexApp->unk_18DC.unk_20.unk_0[i];
                pokedexApp->unk_18DC.unk_20.unk_0[i] = pokedexApp->unk_18DC.unk_20.unk_0[j];
                pokedexApp->unk_18DC.unk_20.unk_0[j] = r3;

                r3_2 = pokedexApp->unk_18DC.unk_28[i];
                pokedexApp->unk_18DC.unk_28[i] = pokedexApp->unk_18DC.unk_28[j];
                pokedexApp->unk_18DC.unk_28[j] = r3_2;

                r6 = r7;
            }
        }
    }
}

BOOL ov18_021E8AB0(PokedexAppData *pokedexApp, u32 a1) {
    if (pokedexApp->unk_18DC.unk_28[a1] & 0x80000000) {
        return TRUE;
    }
    return FALSE;
}

u32 ov18_021E8ACC(PokedexAppData *pokedexApp, u32 a1, u32 a2) {
    return pokedexApp->unk_18DC.unk_28[a1] & (1 << a2);
}

u32 ov18_021E8AE0(PokedexAppData *pokedexApp, u32 a1) {
    if (ov18_021E8AB0(pokedexApp, a1) == FALSE) { // explicit comparison required to match
        return ov18_021E8B0C(pokedexApp->unk_18DC.unk_20.unk_0[a1]);
    } else {
        return ov18_021E8B18(pokedexApp->unk_18DC.unk_20.unk_0[a1]);
    }
}

u32 ov18_021E8B0C(u32 a0) {
    return ov18_021F9954[a0];
}

u32 ov18_021E8B18(u32 a0) {
    return ov18_021F98D8[a0];
}

BOOL ov18_021E8B24(u32 a0) {
    u32 r0 = ov18_021E8B0C(a0);
    return r0 == MAP_ROUTE_2 || r0 == MAP_ROUTE_2_EAST;
}

u32 ov18_021E8B40(void) {
    for (u32 i = 0; i < NELEMS(ov18_021F9954); ++i) {
        if (ov18_021F9954[i] == 10) {
            return i;
        }
    }
    return 1;
}

BOOL ov18_021E8B5C(u32 a0) {
    u32 r0 = ov18_021E8B0C(a0);
    return r0 == MAP_ROUTE_16_EAST || r0 == MAP_ROUTE_16;
}

u32 ov18_021E8B78(void) {
    for (u32 i = 0; i < NELEMS(ov18_021F9954); ++i) {
        if (ov18_021F9954[i] == 24) {
            return i;
        }
    }
    return 1;
}

void ov18_021E8B94(PokedexAppData *pokedexApp) {
    u32 sp8;

    pokedexApp->unk_190C = GfGfxLoader_LoadFromNarc_GetSizeOut(NARC_a_1_3_3, 1, FALSE, HEAP_ID_37, FALSE, &sp8);
    pokedexApp->unk_1908 = GfGfxLoader_LoadFromNarc_GetSizeOut(NARC_a_1_3_3, 0, FALSE, HEAP_ID_37, FALSE, &sp8);
}

void ov18_021E8BD4(PokedexAppData *pokedexApp) {
    Heap_Free(pokedexApp->unk_190C);
    Heap_Free(pokedexApp->unk_1908);
}
