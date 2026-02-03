#include "constants/maps.h"

#include "application/pokedex/pokedex_internal.h"
#include "application/pokedex/pokedex_internal_constants.h"
#include "application/zukanlist/zkn_data/zukan_data.naix"
#include "application/zukanlist/zkn_data/zukan_enc.naix"
#include "application/zukanlist/zkn_data/zukan_hw_data.naix"
#include "graphic/zukan_gra.naix"
#include "msgdata/msg.naix"

#include "dex_mon_measures.h"
#include "gf_gfx_loader.h"
#include "pokedex_util.h"
#include "sprite_system.h"
#include "unk_02005D10.h"
#include "unk_02091278.h"
#include "unk_020912AC.h"

static void ov18_021E5FA4(void);
static void ov18_021E5FE8(void);
static void ov18_021E602C(void);
static void ov18_021E6070(void);
static void ov18_021E60B4(void);
static void ov18_021E60F8(void);
static void ov18_021E6868(PokedexAppData *pokedexApp);
static void PokedexApp_3DigitNumToTiles(u16 *a0, u16 a1, u16 a2);
static void ov18_021E7048(PokedexAppData *pokedexApp);
static void ov18_021E7448(PokedexAppData *pokedexApp, const UnkStruct_ov18_021F9780 *a1, BOOL a2);
static void ov18_021E7490(PokedexAppData *pokedexApp, const UnkStruct_ov18_021F9780 *a1, u32 *a2, int a3);
static void ov18_021E7564(PokedexAppData *pokedexApp);
static void ov18_021E7628(PokedexAppData *pokedexApp, u32 a1, BOOL a2);
static void ov18_021E76A4(PokedexAppData *pokedexApp, u32 a1, BOOL a2);
static void ov18_021E7A3C(PokedexAppData *pokedexApp);
static void ov18_021E7BD0(PokedexAppData *pokedexApp);
static void ov18_021E7D90(PokedexAppData *pokedexApp);
static void ov18_021E7ED8(PokedexAppData *pokedexApp);
static u8 ov18_021E83D0(PokedexAppData *pokedexApp, u8 idx);
static void ov18_021E8698(PokedexAppData_UnkSub18DC_0 *a0, u16 species, int a2);
static void ov18_021E8714(PokedexAppData *pokedexApp, PokedexAppData_UnkSub18DC_0 *a1, int a2, int a3);
static void ov18_021E8878(PokedexAppData *pokedexApp, PokedexAppData_UnkSub18DC_0 *a1, int a2, int a3, int a4);
static u32 ov18_021E89DC(u32 a0);
static void ov18_021E8A00(PokedexAppData *pokedexApp);
static u32 ov18_021E8B40(void);
static u32 ov18_021E8B78(void);

static const u16 sOverworldMapIDs[70] = {
    0xFFFF,
    MAP_NEW_BARK,
    MAP_ROUTE_29,
    MAP_CHERRYGROVE,
    MAP_ROUTE_30,
    MAP_ROUTE_31,
    MAP_VIOLET,
    MAP_ROUTE_32,
    MAP_ROUTE_33,
    MAP_ROUTE_34,
    MAP_ROUTE_35,
    MAP_ROUTE_36,
    MAP_ROUTE_37,
    MAP_ECRUTEAK,
    MAP_ROUTE_38,
    MAP_ROUTE_39,
    MAP_OLIVINE,
    MAP_ROUTE_40,
    MAP_ROUTE_41,
    MAP_CIANWOOD,
    MAP_ROUTE_42,
    MAP_ROUTE_43,
    MAP_LAKE_OF_RAGE,
    MAP_ROUTE_44,
    MAP_BLACKTHORN,
    MAP_ROUTE_45,
    MAP_ROUTE_46,
    MAP_ROUTE_47,
    MAP_MOUNT_SILVER,
    MAP_ROUTE_12,
    MAP_ROUTE_19,
    MAP_ROUTE_20,
    MAP_PALLET,
    MAP_VIRIDIAN,
    MAP_CERULEAN,
    MAP_VERMILION,
    MAP_CELADON,
    MAP_FUCHSIA,
    MAP_CINNABAR_ISLAND,
    MAP_ROUTE_48,
    MAP_ROUTE_26,
    MAP_ROUTE_27,
    MAP_ROUTE_28,
    MAP_ROUTE_1,
    MAP_ROUTE_2,
    MAP_ROUTE_3,
    MAP_ROUTE_4,
    MAP_ROUTE_5,
    MAP_ROUTE_6,
    MAP_ROUTE_7,
    MAP_ROUTE_8,
    MAP_ROUTE_9,
    MAP_ROUTE_10,
    MAP_ROUTE_11,
    MAP_ROUTE_13,
    MAP_ROUTE_14,
    MAP_ROUTE_15,
    MAP_ROUTE_16_EAST,
    MAP_ROUTE_17,
    MAP_ROUTE_18,
    MAP_ROUTE_21,
    MAP_ROUTE_22,
    MAP_ROUTE_24,
    MAP_ROUTE_25,
    MAP_ROUTE_2_EAST,
    MAP_PEWTER,
    MAP_AZALEA,
    MAP_SAFARI_ZONE_GATE,
    MAP_ROUTE_16,
    0xFFFF,
};

static const u16 sDungeonMapIDs[] = {
    0xFFFF,
    MAP_SPROUT_TOWER_2F,
    MAP_RUINS_OF_ALPH,
    MAP_UNION_CAVE_1F,
    MAP_SLOWPOKE_WELL_B1F,
    MAP_ILEX_FOREST,
    MAP_NATIONAL_PARK,
    MAP_BURNED_TOWER_1F,
    MAP_BELL_TOWER_2F,
    MAP_WHIRL_ISLANDS_1F,
    MAP_MOUNT_MORTAR_1F_ENTRANCE,
    MAP_ICE_PATH_1F,
    MAP_DRAGONS_DEN,
    MAP_DARK_CAVE_ROUTE_31_SIDE,
    MAP_MOUNT_MOON_SQUARE,
    MAP_SEAFOAM_ISLANDS_1F,
    MAP_MOUNT_SILVER_CAVE_MOLTRES_CHAMBER,
    MAP_CLIFF_EDGE_GATE,
    MAP_CLIFF_CAVE,
    MAP_SS_AQUA_OLIVINE_PORT_INTERIOR,
    MAP_ROCK_TUNNEL_1F,
    MAP_VICTORY_ROAD_1F,
    MAP_TOHJO_FALLS,
    MAP_DIGLETT_CAVE,
    MAP_VIRIDIAN_FOREST,
    MAP_CERULEAN_CAVE_1F,
};

static const int sMapIDs_Alphabetical[142] = {
    MAP_ROUTE_1,
    MAP_ROUTE_2,
    MAP_ROUTE_2_EAST,
    MAP_ROUTE_3,
    MAP_ROUTE_4,
    MAP_ROUTE_5,
    MAP_ROUTE_6,
    MAP_ROUTE_7,
    MAP_ROUTE_8,
    MAP_ROUTE_9,
    MAP_ROUTE_10,
    MAP_ROUTE_11,
    MAP_ROUTE_12,
    MAP_ROUTE_13,
    MAP_ROUTE_14,
    MAP_ROUTE_15,
    MAP_ROUTE_16_EAST,
    MAP_ROUTE_16,
    MAP_ROUTE_17,
    MAP_ROUTE_18,
    MAP_ROUTE_19,
    MAP_ROUTE_20,
    MAP_ROUTE_21,
    MAP_ROUTE_22,
    MAP_ROUTE_24,
    MAP_ROUTE_25,
    MAP_ROUTE_26,
    MAP_ROUTE_27,
    MAP_ROUTE_28,
    MAP_ROUTE_29,
    MAP_ROUTE_30,
    MAP_ROUTE_31,
    MAP_ROUTE_32,
    MAP_ROUTE_33,
    MAP_ROUTE_34,
    MAP_ROUTE_35,
    MAP_ROUTE_36,
    MAP_ROUTE_37,
    MAP_ROUTE_38,
    MAP_ROUTE_39,
    MAP_ROUTE_40,
    MAP_ROUTE_41,
    MAP_ROUTE_42,
    MAP_ROUTE_43,
    MAP_ROUTE_44,
    MAP_ROUTE_45,
    MAP_ROUTE_46,
    MAP_ROUTE_47,
    MAP_ROUTE_48,
    MAP_AZALEA,
    MAP_BELL_TOWER_2F,
    MAP_BELL_TOWER_3F,
    MAP_BELL_TOWER_4F,
    MAP_BELL_TOWER_5F,
    MAP_BELL_TOWER_6F,
    MAP_BELL_TOWER_7F,
    MAP_BELL_TOWER_8F,
    MAP_BELL_TOWER_9F,
    MAP_BELL_TOWER_10F,
    MAP_BLACKTHORN,
    MAP_BURNED_TOWER_1F,
    MAP_BURNED_TOWER_B1F,
    MAP_CELADON,
    MAP_CERULEAN_CAVE_1F,
    MAP_CERULEAN_CAVE_2F,
    MAP_CERULEAN_CAVE_B1F,
    MAP_CERULEAN,
    MAP_CHERRYGROVE,
    MAP_CIANWOOD,
    MAP_CINNABAR_ISLAND,
    MAP_CLIFF_CAVE,
    MAP_CLIFF_EDGE_GATE,
    MAP_DIGLETT_CAVE,
    MAP_DARK_CAVE_ROUTE_45_SIDE,
    MAP_DARK_CAVE_ROUTE_31_SIDE,
    MAP_DRAGONS_DEN,
    MAP_ECRUTEAK,
    MAP_FUCHSIA,
    MAP_ICE_PATH_1F,
    MAP_ICE_PATH_B1F,
    MAP_ICE_PATH_B2F,
    MAP_ICE_PATH_B3F,
    MAP_ILEX_FOREST,
    MAP_LAKE_OF_RAGE,
    MAP_MOUNT_MOON,
    MAP_MOUNT_MOON_SQUARE_ENTRANCE,
    MAP_MOUNT_MOON_SQUARE,
    MAP_MOUNT_MOON_SQUARE_CLEFAIRY_EVENT,
    MAP_MOUNT_MORTAR_1F_ENTRANCE,
    MAP_MOUNT_MORTAR_1F_BACK,
    MAP_MOUNT_MORTAR_2F,
    MAP_MOUNT_MORTAR_B1F,
    MAP_MOUNT_SILVER,
    MAP_MOUNT_SILVER_CAVE_1F,
    MAP_MOUNT_SILVER_CAVE_UPPER_MOUNTAINSIDE,
    MAP_MOUNT_SILVER_CAVE_LOWER_MOUNTAINSIDE,
    MAP_MOUNT_SILVER_CAVE_EXPERT_BELT_CHAMBER,
    MAP_MOUNT_SILVER_CAVE_MOLTRES_CHAMBER,
    MAP_MOUNT_SILVER_CAVE_2F,
    MAP_MOUNT_SILVER_CAVE_3F,
    MAP_NATIONAL_PARK,
    MAP_NATIONAL_PARK_BUG_CATCHING_CONTEST,
    MAP_NEW_BARK,
    MAP_SS_AQUA_OLIVINE_PORT_INTERIOR,
    MAP_OLIVINE,
    MAP_PALLET,
    MAP_PEWTER,
    MAP_ROCK_TUNNEL_1F,
    MAP_ROCK_TUNNEL_B1F,
    MAP_RUINS_OF_ALPH,
    MAP_RUINS_OF_ALPH_UNDERGROUND_HALL,
    MAP_RUINS_OF_ALPH_UNDERGROUND_HALL_SINJOH_EVENT,
    MAP_RUINS_OF_ALPH_HALL_ENTRANCE_SINJOH_EVENT,
    MAP_RUINS_OF_ALPH_UNDERGROUND_HALL_SINJOH_EVENT_2,
    MAP_SLOWPOKE_WELL_B1F,
    MAP_SLOWPOKE_WELL_B2F,
    MAP_SAFARI_ZONE_ENTRANCE_EXTERIOR,
    MAP_SAFARI_ZONE_GATE,
    MAP_SEAFOAM_ISLANDS_1F,
    MAP_SEAFOAM_ISLANDS_B1F,
    MAP_SEAFOAM_ISLANDS_B2F,
    MAP_SEAFOAM_ISLANDS_B3F,
    MAP_SEAFOAM_ISLANDS_B4F,
    MAP_SPROUT_TOWER_2F,
    MAP_SPROUT_TOWER_3F,
    MAP_TOHJO_FALLS,
    MAP_TOHJO_FALLS_HIDDEN_ROOM,
    MAP_UNION_CAVE_1F,
    MAP_UNION_CAVE_B1F,
    MAP_UNION_CAVE_B2F,
    MAP_VERMILION,
    MAP_VICTORY_ROAD_1F,
    MAP_VICTORY_ROAD_2F,
    MAP_VICTORY_ROAD_3F,
    MAP_VIOLET,
    MAP_VIRIDIAN,
    MAP_VIRIDIAN_FOREST,
    MAP_WHIRL_ISLANDS_1F,
    MAP_WHIRL_ISLANDS_B1F,
    MAP_WHIRL_ISLANDS_B2F,
    MAP_WHIRL_ISLANDS_B3F,
    MAP_WHIRL_ISLANDS_B3F_LUGIA_CAVE,
};

static const GraphicsBanks sGraphicsBanks = {
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

static const u8 sLanguages[6] = {
    LANGUAGE_JAPANESE,
    LANGUAGE_ENGLISH,
    LANGUAGE_FRENCH,
    LANGUAGE_ITALIAN,
    LANGUAGE_GERMAN,
    LANGUAGE_SPANISH,
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
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    25,
    27,
};

void ov18_021E5C40(void *cb_arg) {
    PokedexAppData *pokedexApp = cb_arg;

    PaletteData_PushTransparentBuffers(pokedexApp->paletteData);
    ov18_021E7A3C(pokedexApp);
    DoScheduledBgGpuUpdates(pokedexApp->bgConfig);
    SpriteSystem_TransferOam();
    OS_SetIrqCheckFlag(OS_IE_V_BLANK);
}

void ov18_021E5C74(void) {
    GfGfx_SetBanks(&sGraphicsBanks);
}

void ov18_021E5C84(PokedexAppData *pokedexApp) {
    pokedexApp->bgConfig = BgConfig_Alloc(HEAP_ID_POKEDEX_APP);

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

        InitBgFromTemplate(pokedexApp->bgConfig, GF_BG_LYR_MAIN_0, &bgTemplate, GF_BG_TYPE_TEXT);
        ov18_021E613C(pokedexApp, GF_BG_LYR_MAIN_0);
        BG_ClearCharDataRange(GF_BG_LYR_MAIN_0, 0x20, 0, HEAP_ID_POKEDEX_APP);
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

        InitBgFromTemplate(pokedexApp->bgConfig, GF_BG_LYR_MAIN_1, &bgTemplate, GF_BG_TYPE_TEXT);
        ov18_021E613C(pokedexApp, GF_BG_LYR_MAIN_1);
        BG_ClearCharDataRange(GF_BG_LYR_MAIN_1, 0x20, 0, HEAP_ID_POKEDEX_APP);
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

        InitBgFromTemplate(pokedexApp->bgConfig, GF_BG_LYR_MAIN_2, &bgTemplate, GF_BG_TYPE_TEXT);
        ov18_021E613C(pokedexApp, GF_BG_LYR_MAIN_2);
        BG_ClearCharDataRange(GF_BG_LYR_MAIN_2, 0x20, 0, HEAP_ID_POKEDEX_APP);
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

        InitBgFromTemplate(pokedexApp->bgConfig, GF_BG_LYR_MAIN_3, &bgTemplate, GF_BG_TYPE_TEXT);
        ov18_021E613C(pokedexApp, GF_BG_LYR_MAIN_3);
        BG_ClearCharDataRange(GF_BG_LYR_MAIN_3, 0x20, 0, HEAP_ID_POKEDEX_APP);
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

        InitBgFromTemplate(pokedexApp->bgConfig, GF_BG_LYR_SUB_0, &bgTemplate, GF_BG_TYPE_TEXT);
        ov18_021E613C(pokedexApp, GF_BG_LYR_SUB_0);
        BG_ClearCharDataRange(GF_BG_LYR_SUB_0, 0x20, 0, HEAP_ID_POKEDEX_APP);
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

        InitBgFromTemplate(pokedexApp->bgConfig, GF_BG_LYR_SUB_1, &bgTemplate, GF_BG_TYPE_TEXT);
        ov18_021E613C(pokedexApp, GF_BG_LYR_SUB_1);
        BG_ClearCharDataRange(GF_BG_LYR_SUB_1, 0x20, 0, HEAP_ID_POKEDEX_APP);
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

        InitBgFromTemplate(pokedexApp->bgConfig, GF_BG_LYR_SUB_2, &bgTemplate, GF_BG_TYPE_TEXT);
        ov18_021E613C(pokedexApp, GF_BG_LYR_SUB_2);
        BG_ClearCharDataRange(GF_BG_LYR_SUB_2, 0x20, 0, HEAP_ID_POKEDEX_APP);
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

        InitBgFromTemplate(pokedexApp->bgConfig, GF_BG_LYR_SUB_3, &bgTemplate, GF_BG_TYPE_TEXT);
        ov18_021E613C(pokedexApp, GF_BG_LYR_SUB_3);
        BG_ClearCharDataRange(GF_BG_LYR_SUB_3, 0x20, 0, HEAP_ID_POKEDEX_APP);
    }
}

void ov18_021E5E70(PokedexAppData *pokedexApp, BOOL a1) {
    FreeBgTilemapBuffer(pokedexApp->bgConfig, GF_BG_LYR_SUB_3);
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

            InitBgFromTemplate(pokedexApp->bgConfig, GF_BG_LYR_SUB_3, &bgTemplate, GF_BG_TYPE_TEXT);
            ov18_021E613C(pokedexApp, GF_BG_LYR_SUB_3);
            BG_ClearCharDataRange(GF_BG_LYR_SUB_3, 0x20, 0, HEAP_ID_POKEDEX_APP);
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

            InitBgFromTemplate(pokedexApp->bgConfig, GF_BG_LYR_SUB_3, &bgTemplate, GF_BG_TYPE_AFFINE);
            ov18_021E613C(pokedexApp, GF_BG_LYR_SUB_3);
            BG_ClearCharDataRange(GF_BG_LYR_SUB_3, 0x40, 0, HEAP_ID_POKEDEX_APP);
        }
    }

    GfGfx_EngineBTogglePlanes(GX_PLANEMASK_BG0, GF_PLANE_TOGGLE_ON);
    GfGfx_EngineBTogglePlanes(GX_PLANEMASK_BG1, GF_PLANE_TOGGLE_ON);
    GfGfx_EngineBTogglePlanes(GX_PLANEMASK_BG2, GF_PLANE_TOGGLE_ON);
    GfGfx_EngineBTogglePlanes(GX_PLANEMASK_BG3, GF_PLANE_TOGGLE_ON);
    GfGfx_EngineBTogglePlanes(GX_PLANEMASK_OBJ, GF_PLANE_TOGGLE_ON);
}

void ov18_021E5F58(PokedexAppData *pokedexApp) {
    FreeBgTilemapBuffer(pokedexApp->bgConfig, GF_BG_LYR_SUB_3);
    FreeBgTilemapBuffer(pokedexApp->bgConfig, GF_BG_LYR_SUB_2);
    FreeBgTilemapBuffer(pokedexApp->bgConfig, GF_BG_LYR_SUB_1);
    FreeBgTilemapBuffer(pokedexApp->bgConfig, GF_BG_LYR_SUB_0);
    FreeBgTilemapBuffer(pokedexApp->bgConfig, GF_BG_LYR_MAIN_3);
    FreeBgTilemapBuffer(pokedexApp->bgConfig, GF_BG_LYR_MAIN_2);
    FreeBgTilemapBuffer(pokedexApp->bgConfig, GF_BG_LYR_MAIN_1);
    FreeBgTilemapBuffer(pokedexApp->bgConfig, GF_BG_LYR_MAIN_0);
    Heap_Free(pokedexApp->bgConfig);
}

static void ov18_021E5FA4(void) {
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

static void ov18_021E5FE8(void) {
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

static void ov18_021E602C(void) {
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

static void ov18_021E6070(void) {
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

static void ov18_021E60B4(void) {
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

static void ov18_021E60F8(void) {
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

    FillBgTilemapRect(pokedexApp->bgConfig, bgId, 0, 0, 0, width, 0x20, 0);
    ScheduleBgTilemapBufferTransfer(pokedexApp->bgConfig, bgId);
}

void ov18_021E6174(void) {
    G2_SetBlendAlpha(0, GX_PLANEMASK_BG0 | GX_PLANEMASK_BG1 | GX_PLANEMASK_BG2 | GX_PLANEMASK_BG3, 6, 10);
}

void ov18_021E618C(u8 ev1, u8 ev2) {
    G2_SetBlendAlpha(GX_PLANEMASK_BG2, GX_PLANEMASK_BG3, ev1, ev2);
}

void ov18_021E61A4(PokedexAppData *pokedexApp) {
    pokedexApp->paletteData = PaletteData_Init(HEAP_ID_POKEDEX_APP);
    ZeroPalettesByBitmask(PLTTBUF_MAIN_BG_F | PLTTBUF_SUB_BG_F | PLTTBUF_MAIN_OBJ_F | PLTTBUF_SUB_OBJ_F, HEAP_ID_POKEDEX_APP);
    PaletteData_AllocBuffers(pokedexApp->paletteData, PLTTBUF_MAIN_BG, 0x200, HEAP_ID_POKEDEX_APP);
    PaletteData_AllocBuffers(pokedexApp->paletteData, PLTTBUF_SUB_BG, 0x200, HEAP_ID_POKEDEX_APP);
    PaletteData_AllocBuffers(pokedexApp->paletteData, PLTTBUF_MAIN_OBJ, 0x200, HEAP_ID_POKEDEX_APP);
    PaletteData_AllocBuffers(pokedexApp->paletteData, PLTTBUF_SUB_OBJ, 0x200, HEAP_ID_POKEDEX_APP);
}

void ov18_021E6204(PokedexAppData *pokedexApp) {
    PaletteData_FreeBuffers(pokedexApp->paletteData, PLTTBUF_SUB_OBJ);
    PaletteData_FreeBuffers(pokedexApp->paletteData, PLTTBUF_MAIN_OBJ);
    PaletteData_FreeBuffers(pokedexApp->paletteData, PLTTBUF_SUB_BG);
    PaletteData_FreeBuffers(pokedexApp->paletteData, PLTTBUF_MAIN_BG);
    PaletteData_Free(pokedexApp->paletteData);
}

void ov18_021E6244(PokedexAppData *pokedexApp) {
    pokedexApp->msgData = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, NARC_msg_msg_0802_bin, HEAP_ID_POKEDEX_APP);
    pokedexApp->msgFormat = MessageFormat_New(HEAP_ID_POKEDEX_APP);
    pokedexApp->strBufFormatted = String_New(0x400, HEAP_ID_POKEDEX_APP);
}

void ov18_021E6280(PokedexAppData *pokedexApp) {
    String_Delete(pokedexApp->strBufFormatted);
    MessageFormat_Delete(pokedexApp->msgFormat);
    DestroyMsgData(pokedexApp->msgData);
}

void ov18_021E62A8(PokedexAppData *pokedexApp) {
    NARC *narc = NARC_New(NARC_application_zukanlist_zkn_data_zukan_hw_data, HEAP_ID_POKEDEX_APP);
    pokedexApp->unk_1850 = GfGfxLoader_LoadFromOpenNarc(narc, NARC_zukan_hw_data_zukan_hw_data_0_bin, FALSE, HEAP_ID_POKEDEX_APP, FALSE);
    pokedexApp->unk_1854 = GfGfxLoader_LoadFromOpenNarc(narc, NARC_zukan_hw_data_zukan_hw_data_1_bin, FALSE, HEAP_ID_POKEDEX_APP, FALSE);
    NARC_Delete(narc);
}

void ov18_021E62E8(PokedexAppData *pokedexApp) {
    Heap_Free(pokedexApp->unk_1854);
    Heap_Free(pokedexApp->unk_1850);
}

void ov18_021E6308(PokedexAppData *pokedexApp) {
    pokedexApp->unk_0008 = sub_0201956C(pokedexApp->bgConfig, 2, 24, HEAP_ID_POKEDEX_APP);
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
    sub_020196B8(pokedexApp->unk_0008, 0, pokedexApp->gfxNarc, NARC_zukan_gra_zukan_gra_00000005_NSCR_lz, 1);
    sub_020196B8(pokedexApp->unk_0008, 1, pokedexApp->gfxNarc, NARC_zukan_gra_zukan_gra_00000006_NSCR_lz, 1);
    sub_020196B8(pokedexApp->unk_0008, 2, pokedexApp->gfxNarc, NARC_zukan_gra_zukan_gra_00000007_NSCR_lz, 1);
    sub_020196B8(pokedexApp->unk_0008, 3, pokedexApp->gfxNarc, NARC_zukan_gra_zukan_gra_00000008_NSCR_lz, 1);
    sub_020196B8(pokedexApp->unk_0008, 4, pokedexApp->gfxNarc, NARC_zukan_gra_zukan_gra_00000009_NSCR_lz, 1);
    sub_020196B8(pokedexApp->unk_0008, 5, pokedexApp->gfxNarc, NARC_zukan_gra_zukan_gra_00000010_NSCR_lz, 1);
    sub_020196B8(pokedexApp->unk_0008, 6, pokedexApp->gfxNarc, NARC_zukan_gra_zukan_gra_00000069_NSCR_lz, 1);
    sub_020196B8(pokedexApp->unk_0008, 7, pokedexApp->gfxNarc, NARC_zukan_gra_zukan_gra_00000070_NSCR_lz, 1);
    sub_020196B8(pokedexApp->unk_0008, 8, pokedexApp->gfxNarc, NARC_zukan_gra_zukan_gra_00000071_NSCR_lz, 1);
    sub_020196B8(pokedexApp->unk_0008, 13, pokedexApp->gfxNarc, NARC_zukan_gra_zukan_gra_00000016_NSCR_lz, 1);
    sub_020196B8(pokedexApp->unk_0008, 16, pokedexApp->gfxNarc, NARC_zukan_gra_zukan_gra_00000011_NSCR_lz, 1);
    sub_020196B8(pokedexApp->unk_0008, 23, pokedexApp->gfxNarc, NARC_zukan_gra_zukan_gra_00000088_NSCR_lz, 1);
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

    if (Pokedex_CheckMonCaughtFlag(pokedexApp->args->pokedex, pokedexApp->curSpecies)) {
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
    ScheduleWindowCopyToVram(&pokedexApp->windows[3]);
}

void ov18_021E67B0(PokedexAppData *pokedexApp) {
    sub_0201980C(pokedexApp->unk_0008, 23);
    ClearWindowTilemapAndScheduleTransfer(&pokedexApp->windows[3]);
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

static void ov18_021E6868(PokedexAppData *pokedexApp) {
    ov18_021E613C(pokedexApp, GF_BG_LYR_MAIN_1);
    ov18_021E613C(pokedexApp, GF_BG_LYR_MAIN_2);
    ov18_021E613C(pokedexApp, GF_BG_LYR_MAIN_3);
    ov18_021E613C(pokedexApp, GF_BG_LYR_SUB_0);
    ov18_021E613C(pokedexApp, GF_BG_LYR_SUB_1);
    ov18_021E613C(pokedexApp, GF_BG_LYR_SUB_2);

    GfGfxLoader_LoadCharDataFromOpenNarc(pokedexApp->gfxNarc, NARC_zukan_gra_zukan_gra_00000001_NCGR_lz, pokedexApp->bgConfig, GF_BG_LYR_MAIN_0, 0, 0, TRUE, HEAP_ID_POKEDEX_APP);
    {
        NNSG2dScreenData *scrnData;
        void *scrnDataRaw = GfGfxLoader_GetScrnDataFromOpenNarc(pokedexApp->gfxNarc, NARC_zukan_gra_zukan_gra_00000000_NSCR_lz, TRUE, &scrnData, HEAP_ID_POKEDEX_APP);
        BG_LoadScreenTilemapData(pokedexApp->bgConfig, GF_BG_LYR_MAIN_0, scrnData->rawData, 0x1000);
        Heap_Free(scrnDataRaw);
    }
    GfGfxLoader_LoadCharDataFromOpenNarc(pokedexApp->gfxNarc, NARC_zukan_gra_zukan_gra_00000004_NCGR_lz, pokedexApp->bgConfig, GF_BG_LYR_MAIN_2, 0, 0, TRUE, HEAP_ID_POKEDEX_APP);
    GfGfxLoader_LoadCharDataFromOpenNarc(pokedexApp->gfxNarc, NARC_zukan_gra_zukan_gra_00000003_NCGR_lz, pokedexApp->bgConfig, GF_BG_LYR_MAIN_3, 0, 0, TRUE, HEAP_ID_POKEDEX_APP);
    PaletteData_LoadOpenNarc(pokedexApp->paletteData, pokedexApp->gfxNarc, NARC_zukan_gra_zukan_gra_00000002_NCLR, HEAP_ID_POKEDEX_APP, PLTTBUF_MAIN_BG, 0, 0);
    GfGfxLoader_LoadCharDataFromOpenNarc(pokedexApp->gfxNarc, NARC_zukan_gra_zukan_gra_00000017_NCGR_lz, pokedexApp->bgConfig, GF_BG_LYR_SUB_0, 0, 0, TRUE, HEAP_ID_POKEDEX_APP);
    GfGfxLoader_LoadScrnDataFromOpenNarc(pokedexApp->gfxNarc, NARC_zukan_gra_zukan_gra_00000016_NSCR_lz, pokedexApp->bgConfig, GF_BG_LYR_SUB_0, 0, 0, TRUE, HEAP_ID_POKEDEX_APP);
    GfGfxLoader_LoadCharDataFromOpenNarc(pokedexApp->gfxNarc, NARC_zukan_gra_zukan_gra_00000019_NCGR_lz, pokedexApp->bgConfig, GF_BG_LYR_SUB_3, 0, 0, TRUE, HEAP_ID_POKEDEX_APP);
    if (pokedexApp->unk_185C == 2) {
        GfGfxLoader_LoadScrnDataFromOpenNarc(pokedexApp->gfxNarc, NARC_zukan_gra_zukan_gra_00000020_NSCR_lz, pokedexApp->bgConfig, GF_BG_LYR_SUB_3, 0, 0, TRUE, HEAP_ID_POKEDEX_APP);
    } else {
        GfGfxLoader_LoadScrnDataFromOpenNarc(pokedexApp->gfxNarc, NARC_zukan_gra_zukan_gra_00000021_NSCR_lz, pokedexApp->bgConfig, GF_BG_LYR_SUB_3, 0, 0, TRUE, HEAP_ID_POKEDEX_APP);
    }
    PaletteData_LoadOpenNarc(pokedexApp->paletteData, pokedexApp->gfxNarc, NARC_zukan_gra_zukan_gra_00000018_NCLR, HEAP_ID_POKEDEX_APP, PLTTBUF_SUB_BG, 0, 0);
    if (!pokedexApp->unk_1860) {
        FillBgTilemapRect(pokedexApp->bgConfig, GF_BG_LYR_MAIN_0, 0x16, 3, 15, 26, 2, TILEMAP_FILL_KEEP_PAL);
    }
    ov18_021E6A70(pokedexApp);
    sub_020196E8(pokedexApp->unk_0008, 0, 0, 19);
    ov18_021E6C98(pokedexApp);
    ScheduleBgTilemapBufferTransfer(pokedexApp->bgConfig, GF_BG_LYR_MAIN_0);
    ScheduleBgTilemapBufferTransfer(pokedexApp->bgConfig, GF_BG_LYR_MAIN_1);
    ScheduleBgTilemapBufferTransfer(pokedexApp->bgConfig, GF_BG_LYR_MAIN_2);
    ScheduleBgTilemapBufferTransfer(pokedexApp->bgConfig, GF_BG_LYR_MAIN_3);
    ScheduleBgTilemapBufferTransfer(pokedexApp->bgConfig, GF_BG_LYR_SUB_0);
    ScheduleBgTilemapBufferTransfer(pokedexApp->bgConfig, GF_BG_LYR_SUB_1);
    ScheduleBgTilemapBufferTransfer(pokedexApp->bgConfig, GF_BG_LYR_SUB_2);
    ScheduleBgTilemapBufferTransfer(pokedexApp->bgConfig, GF_BG_LYR_SUB_3);
}

void ov18_021E6A70(PokedexAppData *pokedexApp) {
    if (pokedexApp->unk_1858 == 0) {
        sub_020196E8(pokedexApp->unk_0008, 2, 5, 3);
    } else {
        sub_020196E8(pokedexApp->unk_0008, 3, 5, 3);
    }
}

static void PokedexApp_3DigitNumToTiles(u16 *dest, u16 num, u16 baseTile) {
    u8 pow10s[3] = { 100, 10, 1 };

#ifdef BUGFIX
    GF_ASSERT(num <= 999);
#endif // BUGFIX

    for (u8 i = 0; i < 3; ++i) {
        dest[i] = (baseTile + (num / pow10s[i])) | 0x1000;
        num %= pow10s[i];
    }
}

u16 *ov18_021E6AEC(PokedexAppData *pokedexApp, u32 a1) {
    u16 *ret = Heap_AllocAtEnd(HEAP_ID_POKEDEX_APP, 160 * 10 * sizeof(u16));
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
                PokedexApp_3DigitNumToTiles(&ret[160 * i + 37 + 5 * j], r1 + 1, 3);
            } else {
                PokedexApp_3DigitNumToTiles(&ret[160 * i + 37 + 5 * j], r1 + 1, 14);
            }
        }
    }

    return ret;
}

u16 *ov18_021E6BB8(PokedexAppData *pokedexApp, u32 a1) {
    u16 *ret = Heap_AllocAtEnd(HEAP_ID_POKEDEX_APP, 160 * 10 * sizeof(u16));
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
                PokedexApp_3DigitNumToTiles(&ret[160 * i + 37 + 5 * j], r1, 3);
            } else {
                PokedexApp_3DigitNumToTiles(&ret[160 * i + 37 + 5 * j], r1, 14);
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
    LoadRectToBgTilemapRect(pokedexApp->bgConfig, GF_BG_LYR_MAIN_3, a1, 0, 0, 32, 24);
    ScheduleBgTilemapBufferTransfer(pokedexApp->bgConfig, GF_BG_LYR_MAIN_3);
}

BOOL ov18_021E6D10(PokedexAppData *pokedexApp, u16 species, u16 language) {
    // explicit comparison to FALSE required to match
    if (Pokedex_GetInternationalViewFlag(pokedexApp->args->pokedex) == FALSE) {
        return FALSE;
    }

    return Pokedex_HasCaughtMonWithLanguage(pokedexApp->args->pokedex, species, language);
}

BOOL ov18_021E6D38(PokedexAppData *pokedexApp, u16 species) {
    for (int i = 0; i < NELEMS(sLanguages); ++i) {
        if (sLanguages[i] != GAME_LANGUAGE && ov18_021E6D10(pokedexApp, species, sLanguages[i]) == TRUE) {
            return TRUE;
        }
    }

    return FALSE;
}

void ov18_021E6D68(PokedexAppData *pokedexApp, u16 species, s16 a2) {
    if (Pokedex_GetInternationalViewFlag(pokedexApp->args->pokedex) == FALSE) {
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
            ov18_021E6F6C(pokedexApp->bgConfig, GF_BG_LYR_SUB_3, pokedexApp->unk_185C, pokedexApp->gfxNarc, HEAP_ID_POKEDEX_APP);
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
        ov18_021E6FB8(pokedexApp->bgConfig, GF_BG_LYR_SUB_3, pokedexApp->gfxNarc, HEAP_ID_POKEDEX_APP);
        ClearWindowTilemapAndScheduleTransfer(&pokedexApp->windows[7]);
        ov18_021F11C0(pokedexApp, 10, 0);
    } else {
        ov18_021E6F6C(pokedexApp->bgConfig, GF_BG_LYR_SUB_3, pokedexApp->unk_185C, pokedexApp->gfxNarc, HEAP_ID_POKEDEX_APP);
        ScheduleWindowCopyToVram(&pokedexApp->windows[7]);
    }
}

void ov18_021E6F6C(BgConfig *bgConfig, u8 bgId, u8 language, NARC *narc, enum HeapID heapId) {
    NNSG2dScreenData *scrnData;

    void *scrnDataRaw = GfGfxLoader_GetScrnDataFromOpenNarc(narc, language == GAME_LANGUAGE ? NARC_zukan_gra_zukan_gra_00000020_NSCR_lz : NARC_zukan_gra_zukan_gra_00000021_NSCR_lz, TRUE, &scrnData, heapId);
    LoadRectToBgTilemapRect(bgConfig, bgId, scrnData->rawData, 0, 0, 32, 24);
    ScheduleBgTilemapBufferTransfer(bgConfig, bgId);
    Heap_Free(scrnDataRaw);
}

void ov18_021E6FB8(BgConfig *bgConfig, u8 bgId, NARC *narc, enum HeapID heapId) {
    NNSG2dScreenData *spC;

    void *r6 = GfGfxLoader_GetScrnDataFromOpenNarc(narc, NARC_zukan_gra_zukan_gra_00000022_NSCR_lz, TRUE, &spC, heapId);
    LoadRectToBgTilemapRect(bgConfig, bgId, spC->rawData, 0, 0, 32, 24);
    ScheduleBgTilemapBufferTransfer(bgConfig, bgId);
    Heap_Free(r6);
}

void ov18_021E6FFC(PokedexAppData *pokedexApp) {
    pokedexApp->dexSearchCriteria[DEX_SEARCH_CRITERIA_SORT_ORDER] = DEX_ORDER_NATIONAL;
    pokedexApp->dexSearchCriteria[DEX_SEARCH_CRITERIA_LETTER] = DEX_SEARCH_LETTERS_ALL;
    pokedexApp->dexSearchCriteria[DEX_SEARCH_CRITERIA_TYPE1] = DEX_SEARCH_TYPE_ALL;
    pokedexApp->dexSearchCriteria[DEX_SEARCH_CRITERIA_TYPE2] = DEX_SEARCH_TYPE_ALL;
    pokedexApp->dexSearchCriteria[DEX_SEARCH_CRITERIA_HEIGHT_MIN] = 0;
    pokedexApp->dexSearchCriteria[DEX_SEARCH_CRITERIA_HEIGHT_MAX] = 152;
    pokedexApp->dexSearchCriteria[DEX_SEARCH_CRITERIA_WEIGHT_MIN] = 0;
    pokedexApp->dexSearchCriteria[DEX_SEARCH_CRITERIA_WEIGHT_MAX] = 152;
    pokedexApp->dexSearchCriteria[DEX_SEARCH_CRITERIA_AREA] = DEX_SEARCH_AREA_ALL;
    pokedexApp->dexSearchCriteria[DEX_SEARCH_CRITERIA_BODY_TYPE] = DEX_SEARCH_BODYTYPE_ALL;
}

static void ov18_021E7048(PokedexAppData *pokedexApp) {
    ov18_021E613C(pokedexApp, GF_BG_LYR_MAIN_0);
    ov18_021E613C(pokedexApp, GF_BG_LYR_MAIN_1);
    ov18_021E613C(pokedexApp, GF_BG_LYR_MAIN_3);
    ov18_021E613C(pokedexApp, GF_BG_LYR_SUB_0);
    ov18_021E613C(pokedexApp, GF_BG_LYR_SUB_1);

    GfGfxLoader_LoadCharDataFromOpenNarc(pokedexApp->gfxNarc, NARC_zukan_gra_zukan_gra_00000004_NCGR_lz, pokedexApp->bgConfig, GF_BG_LYR_MAIN_1, 0, 0, TRUE, HEAP_ID_POKEDEX_APP);
    GfGfxLoader_LoadCharDataFromOpenNarc(pokedexApp->gfxNarc, NARC_zukan_gra_zukan_gra_00000003_NCGR_lz, pokedexApp->bgConfig, GF_BG_LYR_MAIN_3, 0, 0, TRUE, HEAP_ID_POKEDEX_APP);
    GfGfxLoader_LoadCharDataFromOpenNarc(pokedexApp->gfxNarc, NARC_zukan_gra_zukan_gra_00000058_NCGR_lz, pokedexApp->bgConfig, GF_BG_LYR_MAIN_2, 0, 0, TRUE, HEAP_ID_POKEDEX_APP);
    GfGfxLoader_LoadScrnDataFromOpenNarc(pokedexApp->gfxNarc, NARC_zukan_gra_zukan_gra_00000057_NSCR_lz, pokedexApp->bgConfig, GF_BG_LYR_MAIN_2, 0, 0, TRUE, HEAP_ID_POKEDEX_APP);
    PaletteData_LoadOpenNarc(pokedexApp->paletteData, pokedexApp->gfxNarc, NARC_zukan_gra_zukan_gra_00000002_NCLR, HEAP_ID_POKEDEX_APP, PLTTBUF_MAIN_BG, 0, 0);

    GfGfxLoader_LoadCharDataFromOpenNarc(pokedexApp->gfxNarc, NARC_zukan_gra_zukan_gra_00000058_NCGR_lz, pokedexApp->bgConfig, GF_BG_LYR_SUB_2, 0, 0, TRUE, HEAP_ID_POKEDEX_APP);
    GfGfxLoader_LoadCharDataFromOpenNarc(pokedexApp->gfxNarc, NARC_zukan_gra_zukan_gra_00000058_NCGR_lz, pokedexApp->bgConfig, GF_BG_LYR_SUB_3, 0, 0, TRUE, HEAP_ID_POKEDEX_APP);
    GfGfxLoader_LoadScrnDataFromOpenNarc(pokedexApp->gfxNarc, NARC_zukan_gra_zukan_gra_00000059_NSCR_lz, pokedexApp->bgConfig, GF_BG_LYR_SUB_3, 0, 0, TRUE, HEAP_ID_POKEDEX_APP);
    GfGfxLoader_LoadScrnDataFromOpenNarc(pokedexApp->gfxNarc, NARC_zukan_gra_zukan_gra_00000060_NSCR_lz, pokedexApp->bgConfig, GF_BG_LYR_SUB_2, 0, 0, TRUE, HEAP_ID_POKEDEX_APP);
    PaletteData_LoadOpenNarc(pokedexApp->paletteData, pokedexApp->gfxNarc, NARC_zukan_gra_zukan_gra_00000018_NCLR, HEAP_ID_POKEDEX_APP, PLTTBUF_SUB_BG, 0, 0);

    ScheduleBgTilemapBufferTransfer(pokedexApp->bgConfig, GF_BG_LYR_MAIN_0);
    ScheduleBgTilemapBufferTransfer(pokedexApp->bgConfig, GF_BG_LYR_MAIN_1);
    ScheduleBgTilemapBufferTransfer(pokedexApp->bgConfig, GF_BG_LYR_MAIN_2);
    ScheduleBgTilemapBufferTransfer(pokedexApp->bgConfig, GF_BG_LYR_MAIN_3);
    ScheduleBgTilemapBufferTransfer(pokedexApp->bgConfig, GF_BG_LYR_SUB_0);
    ScheduleBgTilemapBufferTransfer(pokedexApp->bgConfig, GF_BG_LYR_SUB_1);
    ScheduleBgTilemapBufferTransfer(pokedexApp->bgConfig, GF_BG_LYR_SUB_2);
    ScheduleBgTilemapBufferTransfer(pokedexApp->bgConfig, GF_BG_LYR_SUB_3);
}

void ov18_021E71D0(PokedexAppData *pokedexApp, int a1, int a2) {
    switch (a1) {
    case 0:
        GfGfxLoader_LoadScrnDataFromOpenNarc(pokedexApp->gfxNarc, NARC_zukan_gra_zukan_gra_00000057_NSCR_lz, pokedexApp->bgConfig, GF_BG_LYR_MAIN_2, 0, 0, TRUE, HEAP_ID_POKEDEX_APP);
        ov18_021F6DE0(pokedexApp, a2);
        ov18_021EEED0(pokedexApp, 0);
        ov18_021EF45C(pokedexApp);
        ov18_021EF528(pokedexApp);
        ov18_021F3618(pokedexApp, 0);
        break;
    case 1:
        GfGfxLoader_LoadScrnDataFromOpenNarc(pokedexApp->gfxNarc, NARC_zukan_gra_zukan_gra_00000062_NSCR_lz, pokedexApp->bgConfig, GF_BG_LYR_MAIN_2, 0, 0, TRUE, HEAP_ID_POKEDEX_APP);
        ov18_021E7448(pokedexApp, &ov18_021F9780[pokedexApp->dexSearchCriteria[DEX_SEARCH_CRITERIA_SORT_ORDER]], TRUE);
        ov18_021F6EC0(pokedexApp);
        ov18_021EEED0(pokedexApp, 2);
        ov18_021EF5D8(pokedexApp);
        ov18_021F3618(pokedexApp, 4);
        break;
    case 2:
        GfGfxLoader_LoadScrnDataFromOpenNarc(pokedexApp->gfxNarc, NARC_zukan_gra_zukan_gra_00000063_NSCR_lz, pokedexApp->bgConfig, GF_BG_LYR_MAIN_2, 0, 0, TRUE, HEAP_ID_POKEDEX_APP);
        ov18_021E76A4(pokedexApp, pokedexApp->dexSearchCriteria[DEX_SEARCH_CRITERIA_LETTER], 1);
        ov18_021F6FA0(pokedexApp);
        ov18_021EEED0(pokedexApp, 3);
        ov18_021EF764(pokedexApp);
        ov18_021F3618(pokedexApp, 4);
        break;
    case 3:
        GfGfxLoader_LoadScrnDataFromOpenNarc(pokedexApp->gfxNarc, NARC_zukan_gra_zukan_gra_00000064_NSCR_lz, pokedexApp->bgConfig, GF_BG_LYR_MAIN_2, 0, 0, TRUE, HEAP_ID_POKEDEX_APP);
        ov18_021E74E4(pokedexApp);
        ov18_021F7124(pokedexApp);
        ov18_021EEED0(pokedexApp, 4);
        ov18_021EF848(pokedexApp);
        ov18_021F3618(pokedexApp, 4);
        break;
    case 4:
        GfGfxLoader_LoadScrnDataFromOpenNarc(pokedexApp->gfxNarc, NARC_zukan_gra_zukan_gra_00000065_NSCR_lz, pokedexApp->bgConfig, GF_BG_LYR_MAIN_2, 0, 0, TRUE, HEAP_ID_POKEDEX_APP);
        ov18_021F7354(pokedexApp);
        ov18_021EEED0(pokedexApp, 5);
        ov18_021EF91C(pokedexApp);
        ov18_021F3618(pokedexApp, 2);
        break;
    case 5:
        GfGfxLoader_LoadScrnDataFromOpenNarc(pokedexApp->gfxNarc, NARC_zukan_gra_zukan_gra_00000066_NSCR_lz, pokedexApp->bgConfig, GF_BG_LYR_MAIN_2, 0, 0, TRUE, HEAP_ID_POKEDEX_APP);
        ov18_021F74D8(pokedexApp);
        ov18_021EEED0(pokedexApp, 6);
        ov18_021EF9B4(pokedexApp);
        ov18_021F3618(pokedexApp, 3);
        break;
    case 6:
        GfGfxLoader_LoadScrnDataFromOpenNarc(pokedexApp->gfxNarc, NARC_zukan_gra_zukan_gra_00000067_NSCR_lz, pokedexApp->bgConfig, GF_BG_LYR_MAIN_2, 0, 0, TRUE, HEAP_ID_POKEDEX_APP);
        ov18_021E7448(pokedexApp, &ov18_021F9770[pokedexApp->dexSearchCriteria[DEX_SEARCH_CRITERIA_AREA]], TRUE);
        ov18_021F7668(pokedexApp);
        ov18_021EEED0(pokedexApp, 7);
        ov18_021EFA50(pokedexApp);
        ov18_021F3618(pokedexApp, 4);
        ov18_021E7564(pokedexApp);
        break;
    case 7:
        GfGfxLoader_LoadScrnDataFromOpenNarc(pokedexApp->gfxNarc, NARC_zukan_gra_zukan_gra_00000068_NSCR_lz, pokedexApp->bgConfig, GF_BG_LYR_MAIN_2, 0, 0, TRUE, HEAP_ID_POKEDEX_APP);
        ov18_021E7628(pokedexApp, pokedexApp->dexSearchCriteria[DEX_SEARCH_CRITERIA_BODY_TYPE], TRUE);
        ov18_021F7748(pokedexApp);
        ov18_021EEED0(pokedexApp, 8);
        ov18_021EFB88(pokedexApp);
        ov18_021F3618(pokedexApp, 1);
        break;
    }
}

static void ov18_021E7448(PokedexAppData *pokedexApp, const UnkStruct_ov18_021F9780 *a1, BOOL a2) {
    if (a2 == TRUE) {
        BgTilemapRectChangePalette(pokedexApp->bgConfig, GF_BG_LYR_MAIN_2, a1->x, a1->y, a1->width, a1->height, 3);
    } else {
        BgTilemapRectChangePalette(pokedexApp->bgConfig, GF_BG_LYR_MAIN_2, a1->x, a1->y, a1->width, a1->height, 2);
    }
    ScheduleBgTilemapBufferTransfer(pokedexApp->bgConfig, GF_BG_LYR_MAIN_2);
}

static void ov18_021E7490(PokedexAppData *pokedexApp, const UnkStruct_ov18_021F9780 *a1, u32 *a2, int a3) {
    ov18_021E7448(pokedexApp, &a1[*a2], FALSE);
    *a2 = a3;
    ov18_021E7448(pokedexApp, &a1[a3], TRUE);
}

void ov18_021E74B8(PokedexAppData *pokedexApp, int a1) {
    ov18_021E7490(pokedexApp, ov18_021F9780, pokedexApp->dexSearchCriteria, a1);
    ov18_021EFBE8(pokedexApp, 37);
    ScheduleWindowCopyToVram(&pokedexApp->windows[37]);
}

void ov18_021E74E4(PokedexAppData *pokedexApp) {
    for (int i = 0; i < NELEMS(ov18_021F990C); ++i) {
        ov18_021E7448(pokedexApp, &ov18_021F990C[i], FALSE);
    }
    ov18_021E7448(pokedexApp, &ov18_021F990C[pokedexApp->dexSearchCriteria[DEX_SEARCH_CRITERIA_TYPE1]], TRUE);
    ov18_021E7448(pokedexApp, &ov18_021F990C[pokedexApp->dexSearchCriteria[DEX_SEARCH_CRITERIA_TYPE2]], TRUE);
}

void ov18_021E7534(PokedexAppData *pokedexApp, int a1) {
    ov18_021E7490(pokedexApp, ov18_021F9770, &pokedexApp->dexSearchCriteria[DEX_SEARCH_CRITERIA_AREA], a1);
    ov18_021EFE70(pokedexApp, 75);
    ScheduleWindowCopyToVram(&pokedexApp->windows[75]);
}

static void ov18_021E7564(PokedexAppData *pokedexApp) {
    if (pokedexApp->unk_1860 == 1) {
        return;
    }
    GridInputHandler_ClearEnabledFlag(pokedexApp->unk_1864, 1);

    const UnkStruct_ov18_021F9780 *r5 = &ov18_021F9770[1];
    u16 *r4 = GetBgTilemapBuffer(pokedexApp->bgConfig, GF_BG_LYR_MAIN_2);
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
    ScheduleBgTilemapBufferTransfer(pokedexApp->bgConfig, GF_BG_LYR_MAIN_2);
}

static void ov18_021E7628(PokedexAppData *pokedexApp, u32 a1, BOOL a2) {
    UnkStruct_ov18_021F9780 sp0;

    sp0.width = 4;
    sp0.height = 4;
    sp0.x = 6 * (a1 % 5) + 2;
    sp0.y = 5 * (a1 / 5 + 1);

    ov18_021E7448(pokedexApp, &sp0, a2);
}

void ov18_021E766C(PokedexAppData *pokedexApp, u32 bodyType) {
    ov18_021E7628(pokedexApp, pokedexApp->dexSearchCriteria[DEX_SEARCH_CRITERIA_BODY_TYPE], FALSE);
    pokedexApp->dexSearchCriteria[DEX_SEARCH_CRITERIA_BODY_TYPE] = bodyType;
    ov18_021E7628(pokedexApp, pokedexApp->dexSearchCriteria[DEX_SEARCH_CRITERIA_BODY_TYPE], TRUE);
    ov18_021F3494(pokedexApp);
}

u8 ov18_021E7698(int a0) {
    return ov18_021F9C20[a0];
}

static void ov18_021E76A4(PokedexAppData *pokedexApp, u32 a1, BOOL a2) {
    UnkStruct_ov18_021F9780 sp0;

    sp0.width = 2;
    sp0.height = 2;
    sp0.x = 4 * (ov18_021F9C20[a1] % 7) + 3;
    sp0.y = 4 * (ov18_021F9C20[a1] / 7) + 5;

    ov18_021E7448(pokedexApp, &sp0, a2);
}

void ov18_021E76EC(PokedexAppData *pokedexApp, u32 letter) {
    ov18_021E76A4(pokedexApp, pokedexApp->dexSearchCriteria[DEX_SEARCH_CRITERIA_LETTER], FALSE);
    pokedexApp->dexSearchCriteria[DEX_SEARCH_CRITERIA_LETTER] = letter;
    ov18_021E76A4(pokedexApp, pokedexApp->dexSearchCriteria[DEX_SEARCH_CRITERIA_LETTER], TRUE);
    ov18_021EFC3C(pokedexApp, 66);
    ScheduleWindowCopyToVram(&pokedexApp->windows[66]);
}

void ov18_021E7724(PokedexAppData *pokedexApp) {
    NNSG2dScreenData *scrnData;
    void *scrnDataRaw;
    u16 *r4;
    u16 *r5;
    u16 *sp10;
    u16 sp1A;
    u16 sp18;
    u32 i;
    u32 j;

    r4 = sub_02019B08(pokedexApp->unk_0008, 15);
    r5 = sub_02019B08(pokedexApp->unk_0008, 14);

    scrnDataRaw = GfGfxLoader_GetScrnDataFromOpenNarc(pokedexApp->gfxNarc, NARC_zukan_gra_zukan_gra_00000000_NSCR_lz, TRUE, &scrnData, HEAP_ID_POKEDEX_APP);
    sp10 = (u16 *)scrnData->rawData;
    for (i = 0; i < 24; ++i) {
        memcpy(&r4[32 * i], &sp10[32 * i], 32 * sizeof(u16));
        memcpy(&r5[3 * i], &sp10[32 * i + 0x400], 3 * sizeof(u16));
    }
    Heap_Free(scrnDataRaw);

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
        ScheduleBgTilemapBufferTransfer(pokedexApp->bgConfig, GF_BG_LYR_SUB_1);
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
        ScheduleBgTilemapBufferTransfer(pokedexApp->bgConfig, GF_BG_LYR_SUB_3);
        ScheduleBgTilemapBufferTransfer(pokedexApp->bgConfig, GF_BG_LYR_SUB_1);
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
            ov18_021E6FB8(pokedexApp->bgConfig, GF_BG_LYR_SUB_3, pokedexApp->gfxNarc, HEAP_ID_POKEDEX_APP);
            ClearWindowTilemapAndScheduleTransfer(&pokedexApp->windows[81]);

            ov18_021F11C0(pokedexApp, 45, 0);
        } else {
            if (ov18_021E6D38(pokedexApp, species) == TRUE) {
                ov18_021F2A2C(pokedexApp, 22, 1);
            } else {
                ov18_021F2A2C(pokedexApp, 22, 0);
            }
            ov18_021F2A84(pokedexApp, 24, 1);
            ov18_021E6F6C(pokedexApp->bgConfig, GF_BG_LYR_SUB_3, pokedexApp->unk_185C, pokedexApp->gfxNarc, HEAP_ID_POKEDEX_APP);
            ScheduleWindowCopyToVram(&pokedexApp->windows[81]);
        }
    }
}

static void ov18_021E7A3C(PokedexAppData *pokedexApp) {
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

void ov18_021E7A80(PokedexAppData *pokedexApp, u16 species, s16 a2) {
    if (!Pokedex_GetInternationalViewFlag(pokedexApp->args->pokedex)) {
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
            ov18_021E6F6C(pokedexApp->bgConfig, GF_BG_LYR_SUB_3, pokedexApp->unk_185C, pokedexApp->gfxNarc, HEAP_ID_POKEDEX_APP);
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

static void ov18_021E7BD0(PokedexAppData *pokedexApp) {
    ov18_021E613C(pokedexApp, GF_BG_LYR_MAIN_0);
    ov18_021E613C(pokedexApp, GF_BG_LYR_MAIN_2);
    ov18_021E613C(pokedexApp, GF_BG_LYR_SUB_1);
    ov18_021E613C(pokedexApp, GF_BG_LYR_SUB_2);

    GfGfxLoader_LoadScrnDataFromOpenNarc(pokedexApp->gfxNarc, NARC_zukan_gra_zukan_gra_00000082_NSCR_lz, pokedexApp->bgConfig, GF_BG_LYR_MAIN_3, 0, 0, TRUE, HEAP_ID_POKEDEX_APP);
    if (pokedexApp->unk_1860 == 1) {
        GfGfxLoader_LoadScrnDataFromOpenNarc(pokedexApp->gfxNarc, NARC_zukan_gra_zukan_gra_00000081_NSCR_lz, pokedexApp->bgConfig, GF_BG_LYR_MAIN_0, 0, 0, TRUE, HEAP_ID_POKEDEX_APP);
    } else {
        GfGfxLoader_LoadScrnDataFromOpenNarc(pokedexApp->gfxNarc, NARC_zukan_gra_zukan_gra_00000080_NSCR_lz, pokedexApp->bgConfig, GF_BG_LYR_MAIN_0, 0, 0, TRUE, HEAP_ID_POKEDEX_APP);
    }
    GfGfxLoader_LoadCharDataFromOpenNarc(pokedexApp->gfxNarc, NARC_zukan_gra_zukan_gra_00000083_NCGR_lz, pokedexApp->bgConfig, GF_BG_LYR_MAIN_0, 0, 0, TRUE, HEAP_ID_POKEDEX_APP);
    GfGfxLoader_LoadCharDataFromOpenNarc(pokedexApp->gfxNarc, NARC_zukan_gra_zukan_gra_00000083_NCGR_lz, pokedexApp->bgConfig, GF_BG_LYR_MAIN_3, 0, 0, TRUE, HEAP_ID_POKEDEX_APP);
    GfGfxLoader_LoadCharDataFromOpenNarc(pokedexApp->gfxNarc, NARC_zukan_gra_zukan_gra_00000004_NCGR_lz, pokedexApp->bgConfig, GF_BG_LYR_MAIN_1, 0, 0, TRUE, HEAP_ID_POKEDEX_APP);
    PaletteData_LoadOpenNarc(pokedexApp->paletteData, pokedexApp->gfxNarc, NARC_zukan_gra_zukan_gra_00000002_NCLR, HEAP_ID_POKEDEX_APP, PLTTBUF_MAIN_BG, 0, 0);

    GfGfxLoader_LoadScrnDataFromOpenNarc(pokedexApp->gfxNarc, NARC_zukan_gra_zukan_gra_00000084_NSCR_lz, pokedexApp->bgConfig, GF_BG_LYR_SUB_3, 0, 0, TRUE, HEAP_ID_POKEDEX_APP);
    GfGfxLoader_LoadCharDataFromOpenNarc(pokedexApp->gfxNarc, NARC_zukan_gra_zukan_gra_00000085_NCGR_lz, pokedexApp->bgConfig, GF_BG_LYR_SUB_3, 0, 0, TRUE, HEAP_ID_POKEDEX_APP);
    GfGfxLoader_LoadScrnDataFromOpenNarc(pokedexApp->gfxNarc, NARC_zukan_gra_zukan_gra_00000086_NSCR_lz, pokedexApp->bgConfig, GF_BG_LYR_SUB_0, 0, 0, TRUE, HEAP_ID_POKEDEX_APP);
    GfGfxLoader_LoadCharDataFromOpenNarc(pokedexApp->gfxNarc, NARC_zukan_gra_zukan_gra_00000087_NCGR_lz, pokedexApp->bgConfig, GF_BG_LYR_SUB_0, 0, 0, TRUE, HEAP_ID_POKEDEX_APP);
    PaletteData_LoadOpenNarc(pokedexApp->paletteData, pokedexApp->gfxNarc, NARC_zukan_gra_zukan_gra_00000018_NCLR, HEAP_ID_POKEDEX_APP, PLTTBUF_SUB_BG, 0, 0);

    ScheduleBgTilemapBufferTransfer(pokedexApp->bgConfig, GF_BG_LYR_MAIN_0);
    ScheduleBgTilemapBufferTransfer(pokedexApp->bgConfig, GF_BG_LYR_MAIN_1);
    ScheduleBgTilemapBufferTransfer(pokedexApp->bgConfig, GF_BG_LYR_MAIN_2);
    ScheduleBgTilemapBufferTransfer(pokedexApp->bgConfig, GF_BG_LYR_MAIN_3);
    ScheduleBgTilemapBufferTransfer(pokedexApp->bgConfig, GF_BG_LYR_SUB_0);
    ScheduleBgTilemapBufferTransfer(pokedexApp->bgConfig, GF_BG_LYR_SUB_1);
    ScheduleBgTilemapBufferTransfer(pokedexApp->bgConfig, GF_BG_LYR_SUB_2);
    ScheduleBgTilemapBufferTransfer(pokedexApp->bgConfig, GF_BG_LYR_SUB_3);
}

static void ov18_021E7D90(PokedexAppData *pokedexApp) {
    ov18_021E613C(pokedexApp, GF_BG_LYR_MAIN_0);
    ov18_021E613C(pokedexApp, GF_BG_LYR_MAIN_1);
    ov18_021E613C(pokedexApp, GF_BG_LYR_MAIN_2);
    ov18_021E613C(pokedexApp, GF_BG_LYR_SUB_0);
    ov18_021E613C(pokedexApp, GF_BG_LYR_SUB_1);
    ov18_021E613C(pokedexApp, GF_BG_LYR_SUB_3);

    GfGfxLoader_LoadScrnDataFromOpenNarc(pokedexApp->gfxNarc, NARC_zukan_gra_zukan_gra_00000089_NSCR_lz, pokedexApp->bgConfig, GF_BG_LYR_MAIN_3, 0, 0, TRUE, HEAP_ID_POKEDEX_APP);
    GfGfxLoader_LoadCharDataFromOpenNarc(pokedexApp->gfxNarc, NARC_zukan_gra_zukan_gra_00000090_NCGR_lz, pokedexApp->bgConfig, GF_BG_LYR_MAIN_3, 0, 0, TRUE, HEAP_ID_POKEDEX_APP);
    GfGfxLoader_LoadCharDataFromOpenNarc(pokedexApp->gfxNarc, NARC_zukan_gra_zukan_gra_00000004_NCGR_lz, pokedexApp->bgConfig, GF_BG_LYR_MAIN_1, 0, 0, TRUE, HEAP_ID_POKEDEX_APP);
    PaletteData_LoadOpenNarc(pokedexApp->paletteData, pokedexApp->gfxNarc, NARC_zukan_gra_zukan_gra_00000002_NCLR, HEAP_ID_POKEDEX_APP, PLTTBUF_MAIN_BG, 0, 0);

    GfGfxLoader_LoadScrnDataFromOpenNarc(pokedexApp->gfxNarc, NARC_zukan_gra_zukan_gra_00000091_NSCR_lz, pokedexApp->bgConfig, GF_BG_LYR_SUB_2, 0, 0, TRUE, HEAP_ID_POKEDEX_APP);
    GfGfxLoader_LoadCharDataFromOpenNarc(pokedexApp->gfxNarc, NARC_zukan_gra_zukan_gra_00000092_NCGR_lz, pokedexApp->bgConfig, GF_BG_LYR_SUB_2, 0, 0, TRUE, HEAP_ID_POKEDEX_APP);
    PaletteData_LoadOpenNarc(pokedexApp->paletteData, pokedexApp->gfxNarc, NARC_zukan_gra_zukan_gra_00000018_NCLR, HEAP_ID_POKEDEX_APP, PLTTBUF_SUB_BG, 0, 0);

    sub_020196E8(pokedexApp->unk_0008, 16, 0, 20);

    ScheduleBgTilemapBufferTransfer(pokedexApp->bgConfig, GF_BG_LYR_MAIN_0);
    ScheduleBgTilemapBufferTransfer(pokedexApp->bgConfig, GF_BG_LYR_MAIN_1);
    ScheduleBgTilemapBufferTransfer(pokedexApp->bgConfig, GF_BG_LYR_MAIN_2);
    ScheduleBgTilemapBufferTransfer(pokedexApp->bgConfig, GF_BG_LYR_MAIN_3);
    ScheduleBgTilemapBufferTransfer(pokedexApp->bgConfig, GF_BG_LYR_SUB_0);
    ScheduleBgTilemapBufferTransfer(pokedexApp->bgConfig, GF_BG_LYR_SUB_1);
    ScheduleBgTilemapBufferTransfer(pokedexApp->bgConfig, GF_BG_LYR_SUB_2);
    ScheduleBgTilemapBufferTransfer(pokedexApp->bgConfig, GF_BG_LYR_SUB_3);
}

static void ov18_021E7ED8(PokedexAppData *pokedexApp) {
    ov18_021E613C(pokedexApp, GF_BG_LYR_MAIN_0);
    ov18_021E613C(pokedexApp, GF_BG_LYR_MAIN_2);
    ov18_021E613C(pokedexApp, GF_BG_LYR_SUB_0);
    ov18_021E613C(pokedexApp, GF_BG_LYR_SUB_1);
    ov18_021E613C(pokedexApp, GF_BG_LYR_SUB_3);

    GfGfxLoader_LoadScrnDataFromOpenNarc(pokedexApp->gfxNarc, NARC_zukan_gra_zukan_gra_00000101_NSCR_lz, pokedexApp->bgConfig, GF_BG_LYR_MAIN_3, 0, 0, TRUE, HEAP_ID_POKEDEX_APP);
    GfGfxLoader_LoadCharDataFromOpenNarc(pokedexApp->gfxNarc, NARC_zukan_gra_zukan_gra_00000102_NCGR_lz, pokedexApp->bgConfig, GF_BG_LYR_MAIN_3, 0, 0, TRUE, HEAP_ID_POKEDEX_APP);
    GfGfxLoader_LoadCharDataFromOpenNarc(pokedexApp->gfxNarc, NARC_zukan_gra_zukan_gra_00000004_NCGR_lz, pokedexApp->bgConfig, GF_BG_LYR_MAIN_1, 0, 0, TRUE, HEAP_ID_POKEDEX_APP);
    PaletteData_LoadOpenNarc(pokedexApp->paletteData, pokedexApp->gfxNarc, NARC_zukan_gra_zukan_gra_00000002_NCLR, HEAP_ID_POKEDEX_APP, PLTTBUF_MAIN_BG, 0, 0);

    GfGfxLoader_LoadScrnDataFromOpenNarc(pokedexApp->gfxNarc, NARC_zukan_gra_zukan_gra_00000103_NSCR_lz, pokedexApp->bgConfig, GF_BG_LYR_SUB_2, 0, 0, TRUE, HEAP_ID_POKEDEX_APP);
    GfGfxLoader_LoadCharDataFromOpenNarc(pokedexApp->gfxNarc, NARC_zukan_gra_zukan_gra_00000104_NCGR_lz, pokedexApp->bgConfig, GF_BG_LYR_SUB_2, 0, 0, TRUE, HEAP_ID_POKEDEX_APP);
    PaletteData_LoadOpenNarc(pokedexApp->paletteData, pokedexApp->gfxNarc, NARC_zukan_gra_zukan_gra_00000018_NCLR, HEAP_ID_POKEDEX_APP, PLTTBUF_SUB_BG, 0, 0);

    ScheduleBgTilemapBufferTransfer(pokedexApp->bgConfig, GF_BG_LYR_MAIN_0);
    ScheduleBgTilemapBufferTransfer(pokedexApp->bgConfig, GF_BG_LYR_MAIN_1);
    ScheduleBgTilemapBufferTransfer(pokedexApp->bgConfig, GF_BG_LYR_MAIN_2);
    ScheduleBgTilemapBufferTransfer(pokedexApp->bgConfig, GF_BG_LYR_MAIN_3);
    ScheduleBgTilemapBufferTransfer(pokedexApp->bgConfig, GF_BG_LYR_SUB_0);
    ScheduleBgTilemapBufferTransfer(pokedexApp->bgConfig, GF_BG_LYR_SUB_1);
    ScheduleBgTilemapBufferTransfer(pokedexApp->bgConfig, GF_BG_LYR_SUB_2);
    ScheduleBgTilemapBufferTransfer(pokedexApp->bgConfig, GF_BG_LYR_SUB_3);
}

void ov18_021E800C(PokedexAppData *pokedexApp) {
    ov18_021E613C(pokedexApp, GF_BG_LYR_MAIN_2);
    ov18_021E613C(pokedexApp, GF_BG_LYR_SUB_0);
    ov18_021E613C(pokedexApp, GF_BG_LYR_SUB_1);
    ov18_021E613C(pokedexApp, GF_BG_LYR_SUB_2);

    GfGfxLoader_LoadScrnDataFromOpenNarc(pokedexApp->gfxNarc, NARC_zukan_gra_zukan_gra_00000096_NSCR_lz, pokedexApp->bgConfig, GF_BG_LYR_MAIN_3, 0, 0, TRUE, HEAP_ID_POKEDEX_APP);
    GfGfxLoader_LoadCharDataFromOpenNarc(pokedexApp->gfxNarc, NARC_zukan_gra_zukan_gra_00000093_NCGR_lz, pokedexApp->bgConfig, GF_BG_LYR_MAIN_3, 0, 0, TRUE, HEAP_ID_POKEDEX_APP);
    GfGfxLoader_LoadScrnDataFromOpenNarc(pokedexApp->gfxNarc, NARC_zukan_gra_zukan_gra_00000095_NSCR_lz, pokedexApp->bgConfig, GF_BG_LYR_MAIN_0, 0, 0, TRUE, HEAP_ID_POKEDEX_APP);
    GfGfxLoader_LoadCharDataFromOpenNarc(pokedexApp->gfxNarc, NARC_zukan_gra_zukan_gra_00000093_NCGR_lz, pokedexApp->bgConfig, GF_BG_LYR_MAIN_0, 0, 0, TRUE, HEAP_ID_POKEDEX_APP);
    GfGfxLoader_LoadCharDataFromOpenNarc(pokedexApp->gfxNarc, NARC_zukan_gra_zukan_gra_00000004_NCGR_lz, pokedexApp->bgConfig, GF_BG_LYR_MAIN_1, 0, 0, TRUE, HEAP_ID_POKEDEX_APP);
    PaletteData_LoadOpenNarc(pokedexApp->paletteData, pokedexApp->gfxNarc, NARC_zukan_gra_zukan_gra_00000002_NCLR, HEAP_ID_POKEDEX_APP, PLTTBUF_MAIN_BG, 0, 0);

    GfGfxLoader_LoadScrnDataFromOpenNarc(pokedexApp->gfxNarc, NARC_zukan_gra_zukan_gra_00000097_NSCR_lz, pokedexApp->bgConfig, GF_BG_LYR_SUB_3, 0, 0, TRUE, HEAP_ID_POKEDEX_APP);
    GfGfxLoader_LoadCharDataFromOpenNarc(pokedexApp->gfxNarc, NARC_zukan_gra_zukan_gra_00000094_NCGR_lz, pokedexApp->bgConfig, GF_BG_LYR_SUB_3, 0, 0, TRUE, HEAP_ID_POKEDEX_APP);
    PaletteData_LoadOpenNarc(pokedexApp->paletteData, pokedexApp->gfxNarc, NARC_zukan_gra_zukan_gra_00000018_NCLR, HEAP_ID_POKEDEX_APP, PLTTBUF_SUB_BG, 0, 0);

    if (pokedexApp->numSeenForms == 1) {
        void *scrnDataRaw;
        NNSG2dScreenData *scrnData;

        scrnDataRaw = GfGfxLoader_GetScrnDataFromOpenNarc(pokedexApp->gfxNarc, NARC_zukan_gra_zukan_gra_00000100_NSCR_lz, TRUE, &scrnData, HEAP_ID_POKEDEX_APP);
        LoadRectToBgTilemapRect(pokedexApp->bgConfig, GF_BG_LYR_MAIN_0, scrnData->rawData, 16, 16, 16, 4);
        Heap_Free(scrnDataRaw);
    }

    ScheduleBgTilemapBufferTransfer(pokedexApp->bgConfig, GF_BG_LYR_MAIN_0);
    ScheduleBgTilemapBufferTransfer(pokedexApp->bgConfig, GF_BG_LYR_MAIN_1);
    ScheduleBgTilemapBufferTransfer(pokedexApp->bgConfig, GF_BG_LYR_MAIN_2);
    ScheduleBgTilemapBufferTransfer(pokedexApp->bgConfig, GF_BG_LYR_MAIN_3);
    ScheduleBgTilemapBufferTransfer(pokedexApp->bgConfig, GF_BG_LYR_SUB_0);
    ScheduleBgTilemapBufferTransfer(pokedexApp->bgConfig, GF_BG_LYR_SUB_1);
    ScheduleBgTilemapBufferTransfer(pokedexApp->bgConfig, GF_BG_LYR_SUB_2);
    ScheduleBgTilemapBufferTransfer(pokedexApp->bgConfig, GF_BG_LYR_SUB_3);
}

void ov18_021E81A8(PokedexAppData *pokedexApp) {
    ov18_021E613C(pokedexApp, GF_BG_LYR_MAIN_0);
    ov18_021E613C(pokedexApp, GF_BG_LYR_MAIN_2);

    GfGfxLoader_LoadScrnDataFromOpenNarc(pokedexApp->gfxNarc, NARC_zukan_gra_zukan_gra_00000098_NSCR_lz, pokedexApp->bgConfig, GF_BG_LYR_MAIN_3, 0, 0, TRUE, HEAP_ID_POKEDEX_APP);
    GfGfxLoader_LoadCharDataFromOpenNarc(pokedexApp->gfxNarc, NARC_zukan_gra_zukan_gra_00000093_NCGR_lz, pokedexApp->bgConfig, GF_BG_LYR_MAIN_3, 0, 0, TRUE, HEAP_ID_POKEDEX_APP);
    GfGfxLoader_LoadScrnDataFromOpenNarc(pokedexApp->gfxNarc, NARC_zukan_gra_zukan_gra_00000099_NSCR_lz, pokedexApp->bgConfig, GF_BG_LYR_SUB_3, 0, 0, TRUE, HEAP_ID_POKEDEX_APP);
    GfGfxLoader_LoadCharDataFromOpenNarc(pokedexApp->gfxNarc, NARC_zukan_gra_zukan_gra_00000094_NCGR_lz, pokedexApp->bgConfig, GF_BG_LYR_SUB_3, 0, 0, TRUE, HEAP_ID_POKEDEX_APP);

    ScheduleBgTilemapBufferTransfer(pokedexApp->bgConfig, GF_BG_LYR_MAIN_0);
    ScheduleBgTilemapBufferTransfer(pokedexApp->bgConfig, GF_BG_LYR_MAIN_2);
    ScheduleBgTilemapBufferTransfer(pokedexApp->bgConfig, GF_BG_LYR_MAIN_3);
    ScheduleBgTilemapBufferTransfer(pokedexApp->bgConfig, GF_BG_LYR_SUB_3);
}

void ov18_021E8254(PokedexAppData *pokedexApp) {
    memset(pokedexApp->seenForms, 0, sizeof(pokedexApp->seenForms));

    switch (pokedexApp->curSpecies) {
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
        pokedexApp->numSeenForms = Pokedex_GetSeenFormNum(pokedexApp->args->pokedex, pokedexApp->curSpecies);
        for (u32 i = 0; i < pokedexApp->numSeenForms; ++i) {
            pokedexApp->seenForms[i] = Pokedex_GetSeenFormByIdx(pokedexApp->args->pokedex, pokedexApp->curSpecies, i) | 0x80;
        }
        break;
    case SPECIES_CASTFORM:
        pokedexApp->numSeenForms = 4;
        for (u32 i = 0; i < pokedexApp->numSeenForms; ++i) {
            pokedexApp->seenForms[i] = i | 0x80;
        }
        break;
    case SPECIES_CHERRIM:
        pokedexApp->numSeenForms = 2;
        for (u32 i = 0; i < pokedexApp->numSeenForms; ++i) {
            pokedexApp->seenForms[i] = i | 0x80;
        }
        break;
    default:
        pokedexApp->seenForms[0] = ov18_021E83D0(pokedexApp, 0);
        pokedexApp->seenForms[1] = ov18_021E83D0(pokedexApp, 1);
        if (pokedexApp->seenForms[1] == 0) {
            pokedexApp->numSeenForms = 1;
        } else {
            pokedexApp->numSeenForms = 2;
        }
        break;
    }
}

static u8 ov18_021E83D0(PokedexAppData *pokedexApp, u8 idx) {
    switch (Pokedex_SpeciesGetLastSeenGender(pokedexApp->args->pokedex, pokedexApp->curSpecies, idx)) {
    case MON_MALE:
        return 1;
    case MON_FEMALE:
        return 2;
    case MON_GENDERLESS:
        return 3;
    default:
        if (idx == 0) {
            return 3;
        } else {
            return 0;
        }
    }
}

void ov18_021E8410(PokedexAppData *pokedexApp) {
    NARC *narc; // forward decl fixes regswap
    PokedexAppData_UnkSub18CC *r5 = &pokedexApp->unk_18CC;
    narc = NARC_New(GetPokedexDataNarcID(), HEAP_ID_POKEDEX_APP);
    if (PlayerProfile_GetTrainerGender(pokedexApp->args->playerProfile) == TRAINER_MALE) {
        r5->player_ypos = GfGfxLoader_LoadFromOpenNarc(narc, NARC_zukan_data_mon_stats_player_ypos_m, FALSE, HEAP_ID_POKEDEX_APP, FALSE);
        r5->player_scale = GfGfxLoader_LoadFromOpenNarc(narc, NARC_zukan_data_mon_stats_player_scale_m, FALSE, HEAP_ID_POKEDEX_APP, FALSE);
        r5->mon_ypos = GfGfxLoader_LoadFromOpenNarc(narc, NARC_zukan_data_mon_stats_mon_ypos_m, FALSE, HEAP_ID_POKEDEX_APP, FALSE);
        r5->mon_scale = GfGfxLoader_LoadFromOpenNarc(narc, NARC_zukan_data_mon_stats_mon_scale_m, FALSE, HEAP_ID_POKEDEX_APP, FALSE);
    } else {
        r5->player_ypos = GfGfxLoader_LoadFromOpenNarc(narc, NARC_zukan_data_mon_stats_player_ypos_f, FALSE, HEAP_ID_POKEDEX_APP, FALSE);
        r5->player_scale = GfGfxLoader_LoadFromOpenNarc(narc, NARC_zukan_data_mon_stats_player_scale_f, FALSE, HEAP_ID_POKEDEX_APP, FALSE);
        r5->mon_ypos = GfGfxLoader_LoadFromOpenNarc(narc, NARC_zukan_data_mon_stats_mon_ypos_f, FALSE, HEAP_ID_POKEDEX_APP, FALSE);
        r5->mon_scale = GfGfxLoader_LoadFromOpenNarc(narc, NARC_zukan_data_mon_stats_mon_scale_f, FALSE, HEAP_ID_POKEDEX_APP, FALSE);
    }
    pokedexApp->heights = GfGfxLoader_LoadFromOpenNarc(narc, NARC_zukan_data_mon_stats_height, FALSE, HEAP_ID_POKEDEX_APP, FALSE);
    pokedexApp->weights = GfGfxLoader_LoadFromOpenNarc(narc, NARC_zukan_data_mon_stats_weight, FALSE, HEAP_ID_POKEDEX_APP, FALSE);
    NARC_Delete(narc);
}

void ov18_021E84EC(PokedexAppData *pokedexApp) {
    PokedexAppData_UnkSub18CC *r5 = &pokedexApp->unk_18CC;

    Heap_Free(pokedexApp->heights);
    Heap_Free(pokedexApp->weights);
    Heap_Free(r5->player_ypos);
    Heap_Free(r5->player_scale);
    Heap_Free(r5->mon_ypos);
    Heap_Free(r5->mon_scale);
}

void ov18_021E8528(PokedexAppData *pokedexApp, int a1, int a2) {
    ov18_021E8698(&pokedexApp->unk_18DC.unk_00, pokedexApp->curSpecies, a1 + 4);
    ov18_021E8698(&pokedexApp->unk_18DC.unk_08, pokedexApp->curSpecies, 7);
    ov18_021E8698(&pokedexApp->unk_18DC.unk_10, pokedexApp->curSpecies, a1);
    ov18_021E8698(&pokedexApp->unk_18DC.unk_18, pokedexApp->curSpecies, 3);

    u32 nMaps = 1;
    nMaps += pokedexApp->unk_18DC.unk_00.nMaps - 1;
    nMaps += pokedexApp->unk_18DC.unk_08.nMaps - 1;
    nMaps += pokedexApp->unk_18DC.unk_10.nMaps - 1;
    nMaps += pokedexApp->unk_18DC.unk_18.nMaps - 1;

    pokedexApp->unk_18DC.unk_20.maps = Heap_Alloc(HEAP_ID_POKEDEX_APP, sizeof(u32) * nMaps);
    pokedexApp->unk_18DC.unk_28 = Heap_Alloc(HEAP_ID_POKEDEX_APP, sizeof(u32) * nMaps);
    MI_CpuClear32(pokedexApp->unk_18DC.unk_20.maps, sizeof(u32) * nMaps);
    MI_CpuClear32(pokedexApp->unk_18DC.unk_28, sizeof(u32) * nMaps);
    pokedexApp->unk_18DC.unk_20.maps[0] = -2;
    pokedexApp->unk_18DC.unk_20.nMaps = 1;
    pokedexApp->unk_18DC.unk_28[0] = 0;

    ov18_021E8714(pokedexApp, &pokedexApp->unk_18DC.unk_00, a2, 0);
    ov18_021E8714(pokedexApp, &pokedexApp->unk_18DC.unk_08, a2, 1);
    u32 r6 = pokedexApp->unk_18DC.unk_20.nMaps;
    ov18_021E8878(pokedexApp, &pokedexApp->unk_18DC.unk_10, a2, r6, 0);
    ov18_021E8878(pokedexApp, &pokedexApp->unk_18DC.unk_18, a2, r6, 1);
    ov18_021E8A00(pokedexApp);
}

void ov18_021E8648(PokedexAppData *pokedexApp) {
    Heap_Free(pokedexApp->unk_18DC.unk_00.maps);
    Heap_Free(pokedexApp->unk_18DC.unk_08.maps);
    Heap_Free(pokedexApp->unk_18DC.unk_10.maps);
    Heap_Free(pokedexApp->unk_18DC.unk_18.maps);
    Heap_Free(pokedexApp->unk_18DC.unk_20.maps);
    Heap_Free(pokedexApp->unk_18DC.unk_28);
}

static void ov18_021E8698(PokedexAppData_UnkSub18DC_0 *a0, u16 species, int a2) {
    int base;
    u32 size;

    switch (a2) {
    case 0:
        base = NARC_zukan_enc_zukan_enc_00000002; // 0 * 495 + 2
        break;
    case 1:
        base = NARC_zukan_enc_zukan_enc_00000497; // 1 * 495 + 2
        break;
    case 2:
        base = NARC_zukan_enc_zukan_enc_00000992; // 2 * 495 + 2
        break;
    case 3:
        base = NARC_zukan_enc_zukan_enc_00002972; // 6 * 495 + 2
        break;
    case 4:
        base = NARC_zukan_enc_zukan_enc_00001487; // 3 * 495 + 2
        break;
    case 5:
        base = NARC_zukan_enc_zukan_enc_00001982; // 4 * 495 + 2
        break;
    case 6:
        base = NARC_zukan_enc_zukan_enc_00002477; // 5 * 495 + 2
        break;
    case 7:
        base = NARC_zukan_enc_zukan_enc_00003467; // 7 * 495 + 2
        break;
    }
    // UB: if unexpected a2, r3 is uninitialized
    a0->maps = GfGfxLoader_LoadFromNarc_GetSizeOut(NARC_application_zukanlist_zkn_data_zukan_enc, base + species, FALSE, HEAP_ID_POKEDEX_APP, FALSE, &size);
    a0->nMaps = size / sizeof(u32);
}

static void ov18_021E8714(PokedexAppData *pokedexApp, PokedexAppData_UnkSub18DC_0 *a1, int a2, int a3) {
    u16 i;
    u16 j;

    if (a2 == 0) {
        for (i = 0; i < a1->nMaps - 1; ++i) {
            if (pokedexApp->unk_190C[a1->maps[i]].unk_00 >= 22) {
                continue;
            }
            for (j = 0; j < pokedexApp->unk_18DC.unk_20.nMaps; ++j) {
                if (pokedexApp->unk_18DC.unk_20.maps[j] == a1->maps[i]) {
                    pokedexApp->unk_18DC.unk_28[j] |= 1 << a3;
                    break;
                }
            }
            if (j == pokedexApp->unk_18DC.unk_20.nMaps) {
                pokedexApp->unk_18DC.unk_20.maps[pokedexApp->unk_18DC.unk_20.nMaps] = a1->maps[i];
                pokedexApp->unk_18DC.unk_28[pokedexApp->unk_18DC.unk_20.nMaps] = 1 << a3;
                ++pokedexApp->unk_18DC.unk_20.nMaps;
            }
        }
    } else {
        u32 mapId;
        for (i = 0; i < a1->nMaps - 1; ++i) {
            mapId = a1->maps[i];
            if (pokedexApp->unk_190C[a1->maps[i]].unk_00 < 22) {
                continue;
            }
            if (ov18_021E8B24(mapId) == TRUE) {
                mapId = ov18_021E8B40();
            } else if (ov18_021E8B5C(mapId) == TRUE) {
                mapId = ov18_021E8B78();
            }
            for (j = 0; j < pokedexApp->unk_18DC.unk_20.nMaps; ++j) {
                if (pokedexApp->unk_18DC.unk_20.maps[j] == mapId) {
                    pokedexApp->unk_18DC.unk_28[j] |= 1 << a3;
                    break;
                }
            }
            if (j == pokedexApp->unk_18DC.unk_20.nMaps) {
                pokedexApp->unk_18DC.unk_20.maps[pokedexApp->unk_18DC.unk_20.nMaps] = mapId;
                pokedexApp->unk_18DC.unk_28[pokedexApp->unk_18DC.unk_20.nMaps] = 1 << a3;
                ++pokedexApp->unk_18DC.unk_20.nMaps;
            }
        }
    }
}

static void ov18_021E8878(PokedexAppData *pokedexApp, PokedexAppData_UnkSub18DC_0 *a1, int a2, int a3, int a4) {
    u16 i;
    u16 j;

    if (a2 == 0) {
        for (i = 0; i < a1->nMaps - 1; ++i) {
            if (pokedexApp->unk_1908[a1->maps[i]].unk_00 >= 22) {
                continue;
            }
            for (j = a3; j < pokedexApp->unk_18DC.unk_20.nMaps; ++j) {
                if (pokedexApp->unk_18DC.unk_20.maps[j] == a1->maps[i]) {
                    pokedexApp->unk_18DC.unk_28[j] |= 1 << a4;
                    break;
                }
            }
            if (j == pokedexApp->unk_18DC.unk_20.nMaps) {
                pokedexApp->unk_18DC.unk_20.maps[pokedexApp->unk_18DC.unk_20.nMaps] = a1->maps[i];
                pokedexApp->unk_18DC.unk_28[pokedexApp->unk_18DC.unk_20.nMaps] = 0x80000000 + (1 << a4);
                ++pokedexApp->unk_18DC.unk_20.nMaps;
            }
        }
    } else {
        for (i = 0; i < a1->nMaps - 1; ++i) {
            if (pokedexApp->unk_1908[a1->maps[i]].unk_00 < 22) {
                continue;
            }
            for (j = a3; j < pokedexApp->unk_18DC.unk_20.nMaps; ++j) {
                if (pokedexApp->unk_18DC.unk_20.maps[j] == a1->maps[i]) {
                    pokedexApp->unk_18DC.unk_28[j] |= 1 << a4;
                    break;
                }
            }
            if (j == pokedexApp->unk_18DC.unk_20.nMaps) {
                pokedexApp->unk_18DC.unk_20.maps[pokedexApp->unk_18DC.unk_20.nMaps] = a1->maps[i];
                pokedexApp->unk_18DC.unk_28[pokedexApp->unk_18DC.unk_20.nMaps] = 0x80000000 + (1 << a4);
                ++pokedexApp->unk_18DC.unk_20.nMaps;
            }
        }
    }
}

static u32 ov18_021E89DC(u32 a0) {
    for (u32 i = 0; i < NELEMS(sMapIDs_Alphabetical); ++i) {
        if (a0 == sMapIDs_Alphabetical[i]) {
            return i;
        }
    }

    GF_ASSERT(FALSE);
    return 0;
}

static void ov18_021E8A00(PokedexAppData *pokedexApp) {
    u32 r6;
    u32 r7;
    u16 i;
    u16 j;

    for (i = 1; i < pokedexApp->unk_18DC.unk_20.nMaps - 1; ++i) {
        r6 = ov18_021E8AE0(pokedexApp, i);
        for (j = i + 1; j < pokedexApp->unk_18DC.unk_20.nMaps; ++j) {
            r7 = ov18_021E8AE0(pokedexApp, j);
            if (ov18_021E89DC(r6) > ov18_021E89DC(r7)) {
                s32 r3;
                u32 r3_2;

                r3 = pokedexApp->unk_18DC.unk_20.maps[i];
                pokedexApp->unk_18DC.unk_20.maps[i] = pokedexApp->unk_18DC.unk_20.maps[j];
                pokedexApp->unk_18DC.unk_20.maps[j] = r3;

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
        return ov18_021E8B0C(pokedexApp->unk_18DC.unk_20.maps[a1]);
    } else {
        return ov18_021E8B18(pokedexApp->unk_18DC.unk_20.maps[a1]);
    }
}

u32 ov18_021E8B0C(u32 idx) {
    return sOverworldMapIDs[idx];
}

u32 ov18_021E8B18(u32 a0) {
    return sDungeonMapIDs[a0];
}

BOOL ov18_021E8B24(u32 idx) {
    u32 mapId = ov18_021E8B0C(idx);
    return mapId == MAP_ROUTE_2 || mapId == MAP_ROUTE_2_EAST;
}

static u32 ov18_021E8B40(void) {
    for (u32 i = 0; i < NELEMS(sOverworldMapIDs); ++i) {
        if (sOverworldMapIDs[i] == MAP_ROUTE_2) {
            return i;
        }
    }
    return 1;
}

BOOL ov18_021E8B5C(u32 idx) {
    u32 mapId = ov18_021E8B0C(idx);
    return mapId == MAP_ROUTE_16_EAST || mapId == MAP_ROUTE_16;
}

static u32 ov18_021E8B78(void) {
    for (u32 i = 0; i < NELEMS(sOverworldMapIDs); ++i) {
        if (sOverworldMapIDs[i] == MAP_ROUTE_16) {
            return i;
        }
    }
    return 1;
}

void ov18_021E8B94(PokedexAppData *pokedexApp) {
    u32 size;

    pokedexApp->unk_190C = GfGfxLoader_LoadFromNarc_GetSizeOut(NARC_application_zukanlist_zkn_data_zukan_enc, NARC_zukan_enc_zukan_enc_00000001, FALSE, HEAP_ID_POKEDEX_APP, FALSE, &size);
    pokedexApp->unk_1908 = GfGfxLoader_LoadFromNarc_GetSizeOut(NARC_application_zukanlist_zkn_data_zukan_enc, NARC_zukan_enc_zukan_enc_00000000, FALSE, HEAP_ID_POKEDEX_APP, FALSE, &size);
}

void ov18_021E8BD4(PokedexAppData *pokedexApp) {
    Heap_Free(pokedexApp->unk_190C);
    Heap_Free(pokedexApp->unk_1908);
}
