#include "global.h"

#include "constants/maps.h"

#include "application/pokegear/map/pokegear_map_internal.h"

const MapFlypointParam gMapFlypointParams[] = {
    { MAP_PALLET,           MAP_PALLET,                          FLYPOINT_PALLET,       0,    32, 11, 0,  20, 1, 1, 3, 3, 1, 1 },
    { MAP_VIRIDIAN,         MAP_VIRIDIAN,                        FLYPOINT_VIRIDIAN,     1,    31, 7,  5,  20, 2, 2, 4, 4, 1, 1 },
    { MAP_PEWTER,           MAP_PEWTER,                          FLYPOINT_PEWTER,       2,    32, 2,  10, 20, 2, 2, 4, 4, 1, 1 },
    { MAP_CERULEAN,         MAP_CERULEAN,                        FLYPOINT_CERULEAN,     3,    40, 3,  15, 20, 2, 2, 4, 4, 1, 1 },
    { MAP_LAVENDER,         MAP_LAVENDER,                        FLYPOINT_LAVENDER,     4,    44, 7,  20, 20, 1, 1, 3, 3, 1, 1 },
    { MAP_VERMILION,        MAP_VERMILION,                       FLYPOINT_VERMILION,    5,    40, 9,  25, 20, 2, 2, 4, 4, 1, 1 },
    { MAP_CELADON,          MAP_CELADON,                         FLYPOINT_CELADON,      6,    37, 7,  30, 20, 2, 2, 4, 4, 1, 1 },
    { MAP_FUCHSIA,          MAP_FUCHSIA,                         FLYPOINT_FUCHSIA,      7,    37, 12, 35, 20, 2, 2, 4, 4, 1, 1 },
    { MAP_CINNABAR_ISLAND,  MAP_CINNABAR_ISLAND,                 FLYPOINT_CINNABAR,     8,    32, 15, 0,  24, 1, 1, 3, 3, 1, 1 },
    { MAP_INDIGO_PLATEAU,   MAP_INDIGO_PLATEAU,                  FLYPOINT_INDIGO,       0xFF, 28, 6,  0,  0,  1, 1, 0, 0, 0, 0 },
    { MAP_SAFFRON,          MAP_SAFFRON,                         FLYPOINT_SAFFRON,      9,    40, 6,  5,  24, 2, 2, 4, 4, 1, 1 },
    { MAP_NEW_BARK,         MAP_NEW_BARK,                        FLYPOINT_NEW_BARK,     10,   21, 12, 11, 25, 1, 1, 1, 1, 0, 0 },
    { MAP_CHERRYGROVE,      MAP_CHERRYGROVE,                     FLYPOINT_CHERRYGROVE,  11,   16, 12, 15, 24, 2, 1, 4, 3, 1, 1 },
    { MAP_VIOLET,           MAP_VIOLET,                          FLYPOINT_VIOLET,       12,   14, 7,  20, 24, 2, 2, 3, 4, 0, 1 },
    { MAP_AZALEA,           MAP_AZALEA,                          FLYPOINT_AZALEA,       13,   12, 14, 25, 24, 2, 1, 4, 3, 1, 1 },
    { MAP_CIANWOOD,         MAP_CIANWOOD,                        FLYPOINT_GOLDENROD,    14,   5,  10, 30, 24, 1, 2, 3, 4, 1, 1 },
    { MAP_GOLDENROD,        MAP_GOLDENROD,                       FLYPOINT_ECRUTEAK,     15,   9,  10, 35, 24, 3, 2, 5, 4, 1, 1 },
    { MAP_OLIVINE,          MAP_OLIVINE,                         FLYPOINT_OLIVINE,      16,   8,  7,  0,  28, 2, 2, 4, 4, 1, 1 },
    { MAP_ECRUTEAK,         MAP_ECRUTEAK,                        FLYPOINT_CIANWOOD,     0x11, 11, 4,  5,  28, 2, 2, 4, 4, 1, 1 },
    { MAP_MAHOGANY,         MAP_MAHOGANY,                        FLYPOINT_MAHOGANY,     0x12, 16, 5,  10, 28, 1, 1, 3, 3, 1, 1 },
    { MAP_BLACKTHORN,       MAP_BLACKTHORN,                      FLYPOINT_BLACKTHORN,   0x13, 20, 4,  15, 28, 2, 2, 4, 4, 1, 1 },
    { MAP_LAKE_OF_RAGE,     MAP_LAKE_OF_RAGE,                    FLYPOINT_LAKE_OF_RAGE, 0xFF, 15, 1,  0,  0,  3, 2, 0, 0, 0, 0 },
    { MAP_MOUNT_SILVER,     MAP_MOUNT_SILVER,                    FLYPOINT_MT_SILVER,    0xFF, 25, 8,  0,  0,  1, 1, 0, 0, 0, 0 },
    { MAP_SAFARI_ZONE_GATE, MAP_SAFARI_ZONE_GATE,                FLYPOINT_SAFARI,       0xFF, 2,  8,  0,  0,  2, 2, 0, 0, 0, 0 },
    { MAP_BATTLE_FRONTIER,  MAP_BATTLE_FRONTIER_FRONTIER_ACCESS, FLYPOINT_UNION_CAVE,   0xFF, 6,  6,  0,  0,  2, 2, 0, 0, 0, 0 },
    { MAP_NATIONAL_PARK,    MAP_POKEATHLON_DOME,                 FLYPOINT_POKEATHLON,   0xFF, 10, 6,  0,  0,  2, 2, 0, 0, 0, 0 },
    { MAP_VICTORY_ROAD_1F,  MAP_ROUTE_26,                        FLYPOINT_VICTORY_ROAD, 0xFF, 28, 7,  0,  0,  1, 2, 0, 0, 0, 0 },
};
