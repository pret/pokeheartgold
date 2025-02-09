#include "unk_02097F6C.h"

#include "constants/easy_chat.h"
#include "constants/items.h"
#include "constants/maps.h"
#include "constants/moves.h"
#include "constants/species.h"

#include "assert.h"
#include "map_events.h"
#include "wild_encounter.h"

#define SWARM_MAP_COUNT 20

static const u16 sSwarmMapLUT[SWARM_MAP_COUNT][2] = {
    { MAP_ROUTE_1,                  0 },
    { MAP_ROUTE_3,                  0 },
    { MAP_ROUTE_9,                  0 },
    { MAP_ROUTE_12,                 2 },
    { MAP_ROUTE_13,                 0 },
    { MAP_ROUTE_19,                 1 },
    { MAP_ROUTE_32,                 2 },
    { MAP_ROUTE_25,                 0 },
    { MAP_ROUTE_27,                 1 },
    { MAP_ROUTE_34,                 0 },
    { MAP_ROUTE_35,                 0 },
    { MAP_ROUTE_38,                 0 },
    { MAP_ROUTE_44,                 2 },
    { MAP_ROUTE_45,                 0 },
    { MAP_ROUTE_47,                 0 },
    { MAP_MOUNT_MORTAR_1F_ENTRANCE, 0 },
    { MAP_DARK_CAVE_ROUTE_31_SIDE,  0 },
    { MAP_VIRIDIAN_FOREST,          0 },
    { MAP_VERMILION,                1 },
    { MAP_VIOLET,                   2 },
};

BOOL sub_02097F6C(u32 rand, u16 mapno, u16 swarmValue) {
    u8 offset = rand % SWARM_MAP_COUNT;
    if (mapno == sSwarmMapLUT[offset][0]) {
        if (swarmValue == sSwarmMapLUT[offset][1]) {
            return TRUE;
        }
    }
    return FALSE;
}

void GetSwarmInfoFromRand(u32 rand, u16 *mapno, u16 *species) {
    ENC_DATA encData;
    const u16(*swarmMap)[2];

    swarmMap = &sSwarmMapLUT[rand % SWARM_MAP_COUNT];
    WildEncounters_ReadFromNarc(&encData, (*swarmMap)[0]);
    switch ((*swarmMap)[1]) {
    case 1:
        *species = encData.swarmSpecies[1];
        break;
    case 2:
        *species = encData.swarmSpecies[3];
        break;
    case 0:
        *species = encData.swarmSpecies[0];
        break;
    }
    GF_ASSERT(*species != SPECIES_NONE);
    *mapno = (*swarmMap)[0];
}
