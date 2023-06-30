#include "assert.h"
#include "map_events.h"
#include "wild_encounter.h"
#include "unk_02097F6C.h"
#include "constants/easy_chat.h"
#include "constants/items.h"
#include "constants/maps.h"
#include "constants/moves.h"
#include "constants/species.h"

#define SWARM_MAP_COUNT 20

static const u16 sSwarmMapLUT[SWARM_MAP_COUNT][2] = {
    {MAP_R01, 0},
    {MAP_R03, 0},
    {MAP_R09, 0},
    {MAP_R12, 2},
    {MAP_R13, 0},
    {MAP_W19, 1},
    {MAP_R32, 2},
    {MAP_R25, 0},
    {MAP_R27, 1},
    {MAP_R34, 0},
    {MAP_R35, 0},
    {MAP_R38, 0},
    {MAP_R44, 2},
    {MAP_R45, 0},
    {MAP_R47, 0},
    {MAP_D38R0101, 0},
    {MAP_D42R0102, 0},
    {MAP_D46R0101, 0},
    {MAP_T06, 1},
    {MAP_T22, 2},
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
    const u16 (*swarmMap)[2];

    swarmMap = &sSwarmMapLUT[rand % SWARM_MAP_COUNT];
    WildEncounters_ReadFromNarc(&encData, (*swarmMap)[0]);
    switch((*swarmMap)[1]) {
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
