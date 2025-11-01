#include "map_preview_graphic.h"

#include "global.h"

#include "constants/maps.h"
#include "constants/movements.h"

#include "fielddata/graphic/preview_graphic/preview_graphic.naix"

#include "follow_mon.h"
#include "gf_gfx_loader.h"
#include "gf_rtc.h"
#include "map_object.h"
#include "overlay_01.h"
#include "overlay_01_021F1AFC.h"
#include "player_avatar.h"
#include "system.h"
#include "unk_0200FA24.h"
#include "unk_02062108.h"

typedef struct MapPreviewGraphicData {
    int mapId;
    u32 unused4;
    struct {
        int palNo;
        int charNo;
        int scrnNo;
    } files[4];
    int unused3C; // this looks like it was originally used as a dungeon index const
} MapPreviewGraphicData;

typedef struct UnkStateMachineSubstruct_0206A388 {
    u16 state;
    u16 unk2;
} UnkStateMachineSubstruct_0206A388;

typedef struct UnkStruct_0206A388 {
    int state;
    int displayTimer;
    enum HeapID heapID;
    BgConfig *bgConfig;
    Window *window;
    u16 bgColorMode;
    u16 index;
    u16 fadeOutTimer;
    u16 unk1A;
    u32 bg2Priority;
    u32 bg0Priority;
    u32 bg1Priority;
    u32 bg3Priority;
    int timeIndex;
    int unk30;
    UnkStateMachineSubstruct_0206A388 unk34;
} UnkStruct_0206A388;

static MapPreviewGraphicData sMapPreviewGraphicData[] = {
    // Dark Cave, North Side
    {
     .mapId = MAP_DARK_CAVE_ROUTE_45_SIDE,
     .unused4 = 0,
     .files = {
            {
                .palNo = NARC_preview_graphic_preview_graphic_dark_cave_r45_morning_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_dark_cave_r45_morning_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_dark_cave_r45_morning_NSCR_lz,
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_dark_cave_r45_day_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_dark_cave_r45_day_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_dark_cave_r45_day_NSCR_lz,
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_dark_cave_r45_day_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_dark_cave_r45_day_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_dark_cave_r45_day_NSCR_lz,
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_dark_cave_r45_night_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_dark_cave_r45_night_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_dark_cave_r45_night_NSCR_lz,
            },
        },
     .unused3C = 0,
     },
    // Dark Cave, South Side
    {
     .mapId = MAP_DARK_CAVE_ROUTE_31_SIDE,
     .unused4 = 0,
     .files = {
            {
                .palNo = NARC_preview_graphic_preview_graphic_dark_cave_r31_morning_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_dark_cave_r31_morning_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_dark_cave_r31_morning_NSCR_lz,
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_dark_cave_r31_day_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_dark_cave_r31_day_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_dark_cave_r31_day_NSCR_lz,
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_dark_cave_r31_day_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_dark_cave_r31_day_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_dark_cave_r31_day_NSCR_lz,
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_dark_cave_r31_night_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_dark_cave_r31_night_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_dark_cave_r31_night_NSCR_lz,
            },
        },
     .unused3C = 0,
     },
    // Sprout Tower
    {
     .mapId = MAP_SPROUT_TOWER_1F,
     .unused4 = 0,
     .files = {
            {
                .palNo = NARC_preview_graphic_preview_graphic_sprout_tower_morning_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_sprout_tower_morning_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_sprout_tower_morning_NSCR_lz,
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_sprout_tower_day_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_sprout_tower_day_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_sprout_tower_day_NSCR_lz,
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_sprout_tower_day_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_sprout_tower_day_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_sprout_tower_day_NSCR_lz,
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_sprout_tower_night_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_sprout_tower_night_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_sprout_tower_night_NSCR_lz,
            },
        },
     .unused3C = 1,
     },
    // Ruins of Alph 1
    {
     .mapId = MAP_RUINS_OF_ALPH_HALL_ENTRANCE,
     .unused4 = 0,
     .files = {
            {
                .palNo = NARC_preview_graphic_preview_graphic_ruins_of_alph_morning_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_ruins_of_alph_morning_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_ruins_of_alph_morning_NSCR_lz,
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_ruins_of_alph_day_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_ruins_of_alph_day_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_ruins_of_alph_day_NSCR_lz,
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_ruins_of_alph_day_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_ruins_of_alph_day_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_ruins_of_alph_day_NSCR_lz,
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_ruins_of_alph_night_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_ruins_of_alph_night_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_ruins_of_alph_night_NSCR_lz,
            },
        },
     .unused3C = 2,
     },
    // Ruins of Alph 2
    {
     .mapId = MAP_RUINS_OF_ALPH_HALL_ENTRANCE_SINJOH_EVENT,
     .unused4 = 0,
     .files = {
            {
                .palNo = NARC_preview_graphic_preview_graphic_ruins_of_alph_morning_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_ruins_of_alph_morning_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_ruins_of_alph_morning_NSCR_lz,
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_ruins_of_alph_day_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_ruins_of_alph_day_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_ruins_of_alph_day_NSCR_lz,
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_ruins_of_alph_day_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_ruins_of_alph_day_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_ruins_of_alph_day_NSCR_lz,
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_ruins_of_alph_night_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_ruins_of_alph_night_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_ruins_of_alph_night_NSCR_lz,
            },
        },
     .unused3C = 2,
     },
    // Union Cave
    {
     .mapId = MAP_UNION_CAVE_1F,
     .unused4 = 0,
     .files = {
            {
                .palNo = NARC_preview_graphic_preview_graphic_union_cave_morning_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_union_cave_morning_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_union_cave_morning_NSCR_lz,
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_union_cave_day_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_union_cave_day_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_union_cave_day_NSCR_lz,
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_union_cave_day_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_union_cave_day_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_union_cave_day_NSCR_lz,
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_union_cave_night_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_union_cave_night_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_union_cave_night_NSCR_lz,
            },
        },
     .unused3C = 3,
     },
    // Slowpoke Well
    {
     .mapId = MAP_SLOWPOKE_WELL_ENTRANCE,
     .unused4 = 0,
     .files = {
            {
                .palNo = NARC_preview_graphic_preview_graphic_slowpoke_well_morning_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_slowpoke_well_morning_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_slowpoke_well_morning_NSCR_lz,
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_slowpoke_well_day_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_slowpoke_well_day_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_slowpoke_well_day_NSCR_lz,
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_slowpoke_well_day_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_slowpoke_well_day_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_slowpoke_well_day_NSCR_lz,
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_slowpoke_well_night_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_slowpoke_well_night_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_slowpoke_well_night_NSCR_lz,
            },
        },
     .unused3C = 4,
     },
    // Ilex Forest
    {
     .mapId = MAP_ILEX_FOREST,
     .unused4 = 0,
     .files = {
            {
                .palNo = NARC_preview_graphic_preview_graphic_ilex_forest_morning_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_ilex_forest_morning_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_ilex_forest_morning_NSCR_lz,
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_ilex_forest_day_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_ilex_forest_day_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_ilex_forest_day_NSCR_lz,
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_ilex_forest_evening_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_ilex_forest_evening_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_ilex_forest_evening_NSCR_lz,
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_ilex_forest_night_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_ilex_forest_night_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_ilex_forest_night_NSCR_lz,
            },
        },
     .unused3C = 5,
     },
    // National Park
    {
     .mapId = MAP_NATIONAL_PARK,
     .unused4 = 0,
     .files = {
            {
                .palNo = NARC_preview_graphic_preview_graphic_national_park_morning_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_national_park_morning_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_national_park_morning_NSCR_lz,
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_national_park_day_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_national_park_day_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_national_park_day_NSCR_lz,
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_national_park_evening_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_national_park_evening_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_national_park_evening_NSCR_lz,
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_national_park_night_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_national_park_night_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_national_park_night_NSCR_lz,
            },
        },
     .unused3C = 6,
     },
    // Burned Tower
    {
     .mapId = MAP_BURNED_TOWER_1F,
     .unused4 = 0,
     .files = {
            {
                .palNo = NARC_preview_graphic_preview_graphic_burned_tower_morning_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_burned_tower_morning_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_burned_tower_morning_NSCR_lz,
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_burned_tower_day_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_burned_tower_day_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_burned_tower_day_NSCR_lz,
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_burned_tower_evening_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_burned_tower_evening_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_burned_tower_evening_NSCR_lz,
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_burned_tower_night_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_burned_tower_night_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_burned_tower_night_NSCR_lz,
            },
        },
     .unused3C = 7,
     },
    // Bell Tower
    {
     .mapId = MAP_BELL_TOWER_1F,
     .unused4 = 0,
     .files = {
            {
                .palNo = NARC_preview_graphic_preview_graphic_bell_tower_morning_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_bell_tower_morning_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_bell_tower_morning_NSCR_lz,
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_bell_tower_day_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_bell_tower_day_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_bell_tower_day_NSCR_lz,
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_bell_tower_evening_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_bell_tower_evening_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_bell_tower_evening_NSCR_lz,
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_bell_tower_night_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_bell_tower_night_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_bell_tower_night_NSCR_lz,
            },
        },
     .unused3C = 8,
     },
    // Whirl Islands
    {
     .mapId = MAP_WHIRL_ISLANDS_1F,
     .unused4 = 0,
     .files = {
            {
                .palNo = NARC_preview_graphic_preview_graphic_whirl_islands_morning_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_whirl_islands_morning_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_whirl_islands_morning_NSCR_lz,
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_whirl_islands_day_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_whirl_islands_day_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_whirl_islands_day_NSCR_lz,
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_whirl_islands_day_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_whirl_islands_day_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_whirl_islands_day_NSCR_lz,
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_whirl_islands_night_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_whirl_islands_night_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_whirl_islands_night_NSCR_lz,
            },
        },
     .unused3C = 9,
     },
    // Mt Mortar
    {
     .mapId = MAP_MOUNT_MORTAR_1F_ENTRANCE,
     .unused4 = 0,
     .files = {
            {
                .palNo = NARC_preview_graphic_preview_graphic_mt_mortar_morning_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_mt_mortar_morning_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_mt_mortar_morning_NSCR_lz,
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_mt_mortar_day_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_mt_mortar_day_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_mt_mortar_day_NSCR_lz,
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_mt_mortar_evening_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_mt_mortar_evening_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_mt_mortar_evening_NSCR_lz,
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_mt_mortar_night_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_mt_mortar_night_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_mt_mortar_night_NSCR_lz,
            },
        },
     .unused3C = 11,
     },
    // Ice Path
    {
     .mapId = MAP_ICE_PATH_1F,
     .unused4 = 0,
     .files = {
            {
                .palNo = NARC_preview_graphic_preview_graphic_ice_path_morning_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_ice_path_morning_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_ice_path_morning_NSCR_lz,
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_ice_path_day_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_ice_path_day_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_ice_path_day_NSCR_lz,
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_ice_path_day_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_ice_path_day_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_ice_path_day_NSCR_lz,
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_ice_path_night_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_ice_path_night_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_ice_path_night_NSCR_lz,
            },
        },
     .unused3C = 12,
     },
    // Dragon's Den
    {
     .mapId = MAP_DRAGONS_DEN_ENTRANCE,
     .unused4 = 0,
     .files = {
            {
                .palNo = NARC_preview_graphic_preview_graphic_dragons_den_morning_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_dragons_den_morning_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_dragons_den_morning_NSCR_lz,
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_dragons_den_day_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_dragons_den_day_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_dragons_den_day_NSCR_lz,
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_dragons_den_day_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_dragons_den_day_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_dragons_den_day_NSCR_lz,
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_dragons_den_night_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_dragons_den_night_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_dragons_den_night_NSCR_lz,
            },
        },
     .unused3C = 13,
     },
    // Tohjo Falls
    {
     .mapId = MAP_TOHJO_FALLS,
     .unused4 = 0,
     .files = {
            {
                .palNo = NARC_preview_graphic_preview_graphic_tohjo_falls_morning_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_tohjo_falls_morning_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_tohjo_falls_morning_NSCR_lz,
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_tohjo_falls_day_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_tohjo_falls_day_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_tohjo_falls_day_NSCR_lz,
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_tohjo_falls_day_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_tohjo_falls_day_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_tohjo_falls_day_NSCR_lz,
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_tohjo_falls_night_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_tohjo_falls_night_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_tohjo_falls_night_NSCR_lz,
            },
        },
     .unused3C = 14,
     },
    // Victory Road South
    {
     .mapId = MAP_VICTORY_ROAD_1F,
     .unused4 = 0,
     .files = {
            {
                .palNo = NARC_preview_graphic_preview_graphic_victory_road_morning_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_victory_road_morning_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_victory_road_morning_NSCR_lz,
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_victory_road_day_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_victory_road_day_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_victory_road_day_NSCR_lz,
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_victory_road_day_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_victory_road_day_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_victory_road_day_NSCR_lz,
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_victory_road_night_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_victory_road_night_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_victory_road_night_NSCR_lz,
            },
        },
     .unused3C = 15,
     },
    // Victory Road North
    {
     .mapId = MAP_VICTORY_ROAD_3F,
     .unused4 = 0,
     .files = {
            {
                .palNo = NARC_preview_graphic_preview_graphic_victory_road_morning_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_victory_road_morning_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_victory_road_morning_NSCR_lz,
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_victory_road_day_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_victory_road_day_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_victory_road_day_NSCR_lz,
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_victory_road_day_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_victory_road_day_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_victory_road_day_NSCR_lz,
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_victory_road_night_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_victory_road_night_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_victory_road_night_NSCR_lz,
            },
        },
     .unused3C = 15,
     },
    // Viridian Forest
    {
     .mapId = MAP_VIRIDIAN_FOREST,
     .unused4 = 0,
     .files = {
            {
                .palNo = NARC_preview_graphic_preview_graphic_viridian_forest_morning_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_viridian_forest_morning_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_viridian_forest_morning_NSCR_lz,
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_viridian_forest_day_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_viridian_forest_day_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_viridian_forest_day_NSCR_lz,
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_viridian_forest_evening_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_viridian_forest_evening_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_viridian_forest_evening_NSCR_lz,
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_viridian_forest_night_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_viridian_forest_night_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_viridian_forest_night_NSCR_lz,
            },
        },
     .unused3C = 16,
     },
    // Diglett Cave
    {
     .mapId = MAP_DIGLETT_CAVE,
     .unused4 = 0,
     .files = {
            {
                .palNo = NARC_preview_graphic_preview_graphic_diglett_cave_morning_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_diglett_cave_morning_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_diglett_cave_morning_NSCR_lz,
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_diglett_cave_day_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_diglett_cave_day_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_diglett_cave_day_NSCR_lz,
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_diglett_cave_day_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_diglett_cave_day_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_diglett_cave_day_NSCR_lz,
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_diglett_cave_night_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_diglett_cave_night_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_diglett_cave_night_NSCR_lz,
            },
        },
     .unused3C = 17,
     },
    // Rock Tunnel
    {
     .mapId = MAP_ROCK_TUNNEL_1F,
     .unused4 = 0,
     .files = {
            {
                .palNo = NARC_preview_graphic_preview_graphic_rock_tunnel_morning_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_rock_tunnel_morning_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_rock_tunnel_morning_NSCR_lz,
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_rock_tunnel_day_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_rock_tunnel_day_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_rock_tunnel_day_NSCR_lz,
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_rock_tunnel_day_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_rock_tunnel_day_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_rock_tunnel_day_NSCR_lz,
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_rock_tunnel_night_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_rock_tunnel_night_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_rock_tunnel_night_NSCR_lz,
            },
        },
     .unused3C = 18,
     },
    // Mt Moon
    {
     .mapId = MAP_MOUNT_MOON,
     .unused4 = 0,
     .files = {
            {
                .palNo = NARC_preview_graphic_preview_graphic_mt_moon_morning_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_mt_moon_morning_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_mt_moon_morning_NSCR_lz,
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_mt_moon_day_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_mt_moon_day_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_mt_moon_day_NSCR_lz,
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_mt_moon_evening_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_mt_moon_evening_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_mt_moon_evening_NSCR_lz,
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_mt_moon_night_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_mt_moon_night_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_mt_moon_night_NSCR_lz,
            },
        },
     .unused3C = 20,
     },
    // Seafoam Islands
    {
     .mapId = MAP_SEAFOAM_ISLANDS_1F,
     .unused4 = 0,
     .files = {
            {
                .palNo = NARC_preview_graphic_preview_graphic_seafoam_islands_morning_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_seafoam_islands_morning_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_seafoam_islands_morning_NSCR_lz,
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_seafoam_islands_day_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_seafoam_islands_day_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_seafoam_islands_day_NSCR_lz,
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_seafoam_islands_day_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_seafoam_islands_day_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_seafoam_islands_day_NSCR_lz,
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_seafoam_islands_night_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_seafoam_islands_night_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_seafoam_islands_night_NSCR_lz,
            },
        },
     .unused3C = 21,
     },
    // Mt Silver
    {
     .mapId = MAP_MOUNT_SILVER_CAVE_1F,
     .unused4 = 0,
     .files = {
            {
                .palNo = NARC_preview_graphic_preview_graphic_mt_silver_morning_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_mt_silver_morning_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_mt_silver_morning_NSCR_lz,
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_mt_silver_day_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_mt_silver_day_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_mt_silver_day_NSCR_lz,
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_mt_silver_day_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_mt_silver_day_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_mt_silver_day_NSCR_lz,
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_mt_silver_night_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_mt_silver_night_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_mt_silver_night_NSCR_lz,
            },
        },
     .unused3C = 22,
     },
    // Cerulean Cave
    {
     .mapId = MAP_CERULEAN_CAVE_1F,
     .unused4 = 0,
     .files = {
            {
                .palNo = NARC_preview_graphic_preview_graphic_cerulean_cave_morning_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_cerulean_cave_morning_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_cerulean_cave_morning_NSCR_lz,
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_cerulean_cave_day_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_cerulean_cave_day_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_cerulean_cave_day_NSCR_lz,
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_cerulean_cave_day_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_cerulean_cave_day_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_cerulean_cave_day_NSCR_lz,
            },
            {
                .palNo = NARC_preview_graphic_preview_graphic_cerulean_cave_night_NCLR,
                .charNo = NARC_preview_graphic_preview_graphic_cerulean_cave_night_NCGR_lz,
                .scrnNo = NARC_preview_graphic_preview_graphic_cerulean_cave_night_NSCR_lz,
            },
        },
     .unused3C = 23,
     },
};

static BOOL Task_MapPreviewGraphic_ShowImage(TaskManager *man);
static void MapPreviewGraphic_LoadGfx(UnkStruct_0206A388 *unk);
static void MapPreviewGraphic_InitWindow(UnkStruct_0206A388 *unk);
static int sub_0206A694(UnkStruct_0206A388 *unk, FieldSystem *fsys);

u8 MapPreviewGraphic_GetIndex(u32 mapId) {
    u8 ret = -1;
    for (int i = 0; i < (int)NELEMS(sMapPreviewGraphicData); i++) {
        if (sMapPreviewGraphicData[i].mapId == mapId) {
            ret = i;
            break;
        }
    }
    return ret;
}

void MapPreviewGraphic_BeginShowImage(TaskManager *man, int index, u8 time, int a3) {
    FieldSystem *fsys = TaskManager_GetFieldSystem(man);
    UnkStruct_0206A388 *unk = Heap_AllocAtEnd(HEAP_ID_FIELD1, sizeof(UnkStruct_0206A388));

    unk->state = 0;
    unk->displayTimer = 0;
    unk->bgConfig = FieldSystem_GetBgConfigPtr(fsys);
    unk->fadeOutTimer = 0;
    unk->unk1A = 0;
    unk->index = index;

    switch (time) {
    case RTC_TIMEOFDAY_MORN:
        unk->timeIndex = 0;
        break;
    case RTC_TIMEOFDAY_DAY:
        unk->timeIndex = 1;
        break;
    case RTC_TIMEOFDAY_EVE:
        unk->timeIndex = 2;
        break;
    case RTC_TIMEOFDAY_NITE:
    case RTC_TIMEOFDAY_LATE:
        unk->timeIndex = 3;
        break;
    default:
        GF_ASSERT(FALSE);
        unk->timeIndex = 0;
        break;
    }

    unk->heapID = HEAP_ID_FIELD1;
    unk->unk30 = a3;
    unk->unk34.state = 0;
    unk->unk34.unk2 = 0;

    TaskManager_Call(man, Task_MapPreviewGraphic_ShowImage, unk);
}

typedef enum PreviewGraphicState {
    PG_STATE_INIT,
    PG_STATE_FADE_IN,
    PG_STATE_WAIT_OR_SKIP,
    PG_STATE_FADE_OUT
} PreviewGraphicState;

static BOOL Task_MapPreviewGraphic_ShowImage(TaskManager *man) {
    FieldSystem *fsys = TaskManager_GetFieldSystem(man);
    UnkStruct_0206A388 *unk = TaskManager_GetEnvironment(man);

    switch (unk->state) {
    case PG_STATE_INIT:
        unk->bgColorMode = GetBgColorMode(unk->bgConfig, 2);
        unk->bg2Priority = GetBgPriority(unk->bgConfig, GF_BG_LYR_MAIN_2);
        unk->bg0Priority = GetBgPriority(unk->bgConfig, GF_BG_LYR_MAIN_0);
        unk->bg1Priority = GetBgPriority(unk->bgConfig, GF_BG_LYR_MAIN_1);
        unk->bg3Priority = GetBgPriority(unk->bgConfig, GF_BG_LYR_MAIN_3);
        SetBgControlParam(unk->bgConfig, 2, GF_BG_CNT_SET_COLOR_MODE, 1);
        SetBgPriority(GF_BG_LYR_MAIN_3, 0);
        SetBgPriority(GF_BG_LYR_MAIN_2, 1);
        SetBgPriority(GF_BG_LYR_MAIN_0, 2);
        MapPreviewGraphic_LoadGfx(unk);
        MapPreviewGraphic_InitWindow(unk);
        G2_SetBlendAlpha(4, 33, 16, 0);
        BeginNormalPaletteFade(0, 1, 1, RGB_BLACK, 16, 1, unk->heapID);
        unk->state++;
        break;
    case PG_STATE_FADE_IN:
        if (IsPaletteFadeFinished()) {
            unk->state++;
        }
        break;
    case PG_STATE_WAIT_OR_SKIP:
        if (gSystem.newKeys & PAD_BUTTON_A) {
            unk->fadeOutTimer = 0;
            unk->state++;
            break;
        }
        if (++unk->displayTimer > 60) {
            unk->fadeOutTimer = 0;
            unk->state++;
        }
        break;
    case PG_STATE_FADE_OUT:
        if (unk->fadeOutTimer < 16) {
            if (++unk->unk1A >= 2) {
                unk->unk1A = 0;
                unk->fadeOutTimer++;
            }
            reg_G2_BLDALPHA = (16 - unk->fadeOutTimer) | (unk->fadeOutTimer << 8);
        }
        if (sub_0206A694(unk, fsys) && unk->fadeOutTimer >= 16) {
            ToggleBgLayer(2, GF_PLANE_TOGGLE_OFF);
            SetBgControlParam(unk->bgConfig, 2, GF_BG_CNT_SET_COLOR_MODE, unk->bgColorMode);
            SetBgPriority(GF_BG_LYR_MAIN_2, (u8)unk->bg2Priority);
            SetBgPriority(GF_BG_LYR_MAIN_0, (u8)unk->bg0Priority);
            SetBgPriority(GF_BG_LYR_MAIN_1, (u8)unk->bg1Priority);
            SetBgPriority(GF_BG_LYR_MAIN_3, (u8)unk->bg3Priority);
            reg_G2_BLDCNT = 0;
            BG_ClearCharDataRange(2, 0x20, 0, unk->heapID);
            BgClearTilemapBufferAndCommit(unk->bgConfig, 2);
            WindowArray_Delete(unk->window, 1);
            Heap_Free(unk);
            return TRUE;
        }
        break;
    }
    return FALSE;
}

static void MapPreviewGraphic_LoadGfx(UnkStruct_0206A388 *unk) {
    GfGfxLoader_GXLoadPal(NARC_a_1_5_0, sMapPreviewGraphicData[unk->index].files[unk->timeIndex].palNo, GF_PAL_LOCATION_MAIN_BG, GF_PAL_SLOT_0_OFFSET, 0x160, unk->heapID);
    GfGfxLoader_LoadCharData(NARC_a_1_5_0, sMapPreviewGraphicData[unk->index].files[unk->timeIndex].charNo, unk->bgConfig, GF_BG_LYR_MAIN_2, 0, 0, 1, unk->heapID);
    GfGfxLoader_LoadScrnData(NARC_a_1_5_0, sMapPreviewGraphicData[unk->index].files[unk->timeIndex].scrnNo, unk->bgConfig, GF_BG_LYR_MAIN_2, 0, 0, 1, unk->heapID);
}

static void MapPreviewGraphic_InitWindow(UnkStruct_0206A388 *unk) {
    unk->window = AllocWindows(unk->heapID, 1);
    AddWindowParameterized(unk->bgConfig, unk->window, 2, 0, 0, 28, 2, 13, 0x2C0);
}

static int sub_0206A694(UnkStruct_0206A388 *unk, FieldSystem *fsys) {
    LocalMapObject *player;

    if (!unk->unk30) {
        return TRUE;
    }

    UnkStateMachineSubstruct_0206A388 *unkSub = &unk->unk34; // required to match

    switch (unk->unk34.state) {
    case 0:
        PlayerAvatar_ToggleAutomaticHeightUpdatingImmediate(fsys->playerAvatar, FALSE);
        unkSub->state++;
        break;
    case 1:
        VecFx32 pos;
        player = PlayerAvatar_GetMapObject(fsys->playerAvatar);
        unkSub->unk2++;
        MapObject_CopyPositionVector(player, &pos);
        pos.y -= 2 * FX32_ONE;
        MapObject_SetPositionVector(player, &pos);
        if (unkSub->unk2 >= 16) {
            PlayerAvatar_ToggleAutomaticHeightUpdatingImmediate(fsys->playerAvatar, TRUE);
            unkSub->state++;
        }
        break;
    case 2:
        Field_PlayerAvatar_OrrTransitionFlags(fsys->playerAvatar, PLAYER_TRANSITION_WALKING);
        Field_PlayerAvatar_ApplyTransitionFlags(fsys->playerAvatar);
        unkSub->state++;
        break;
    case 3:
        player = PlayerAvatar_GetMapObject(fsys->playerAvatar);
        if (MapObject_AreBitsSetForMovementScriptInit(player)) {
            MapObject_SetHeldMovement(player, MOVEMENT_FACE_DOWN);
            unkSub->state++;
        }
        break;
    case 4:
        player = PlayerAvatar_GetMapObject(fsys->playerAvatar);
        if (MapObject_AreBitsSetForMovementScriptInit(player)) {
            if (FollowMon_IsActive(fsys)) {
                ov01_02205790(fsys, 1);
                sub_0205FC94(FollowMon_GetMapObject(fsys), MOVEMENT_WALK_UNK_48);
                sub_02069DC8(FollowMon_GetMapObject(fsys), TRUE);
            }
            unkSub->state++;
        }
        break;
    case 5:
        return TRUE;
    }

    return FALSE;
}
