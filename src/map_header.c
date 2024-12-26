#define _IN_MAP_HEADER_C

#include "map_header.h"

#include "global.h"

#include "constants/battle.h"
#include "constants/map_sections.h"
#include "constants/maps.h"
#include "constants/sndseq.h"

#include "fielddata/eventdata/zone_event.naix"
#include "fielddata/mapmatrix/map_matrix.naix"
#include "fielddata/script/scr_seq.naix"
#include "msgdata/msg.naix"

#include "encounter_tables_narc.h"

static const u16 sPokemonCenterMaps[] = {
    MAP_T02PC0101,
    MAP_T03PC0101,
    MAP_T04PC0101,
    MAP_T05PC0101,
    MAP_T06PC0101,
    MAP_T07PC0101,
    MAP_T08PC0101,
    MAP_T09PC0101,
    MAP_T11PC0101,
    MAP_T21PC0101,
    MAP_T22PC0101,
    MAP_T23PC0101,
    MAP_T24PC0101,
    MAP_T25PC0101,
    MAP_T26PC0101,
    MAP_T27PC0101,
    MAP_T28PC0101,
    MAP_T30PC0101,
    MAP_T31PC0101,
    MAP_R03PC0101,
    MAP_R10PC0101,
    MAP_R32PC0101,
    MAP_D32PC0101,
    MAP_D47PC0101,
    MAP_EVERYWHERE,
};

#include "data/map_headers.h"

static u32 MapNumberBoundsCheck(u32 mapId) {
    if (mapId >= NELEMS(sMapHeaders)) {
        GF_ASSERT(FALSE);
        mapId = MAP_NOTHING;
    }

    return mapId;
}

u8 MapHeader_GetAreaDataBank(u32 mapId) {
    mapId = MapNumberBoundsCheck(mapId);
    return sMapHeaders[mapId].areaDataBank;
}

u16 MapHeader_GetMoveModelBank(u32 mapId) {
    mapId = MapNumberBoundsCheck(mapId);
    return sMapHeaders[mapId].moveModelBank;
}

u16 MapHeader_GetMatrixId(u32 mapId) {
    mapId = MapNumberBoundsCheck(mapId);
    return sMapHeaders[mapId].matrixId;
}

u16 MapHeader_GetMsgBank(u32 mapId) {
    mapId = MapNumberBoundsCheck(mapId);
    return sMapHeaders[mapId].msgBank;
}

u16 MapHeader_GetScriptsBank(u32 mapId) {
    mapId = MapNumberBoundsCheck(mapId);
    return sMapHeaders[mapId].scriptsBank;
}

u16 MapHeader_GetScriptHeaderBank(u32 mapId) {
    mapId = MapNumberBoundsCheck(mapId);
    return sMapHeaders[mapId].scriptHeaderBank;
}

u16 MapHeader_GetDayMusicId(u32 mapId) {
    mapId = MapNumberBoundsCheck(mapId);
    return sMapHeaders[mapId].dayMusicId;
}

u16 MapHeader_GetNightMusicId(u32 mapId) {
    mapId = MapNumberBoundsCheck(mapId);
    return sMapHeaders[mapId].nightMusicId;
}

BOOL MapHeader_HasWildEncounters(u32 mapId) {
    mapId = MapNumberBoundsCheck(mapId);
    return sMapHeaders[mapId].wildEncounterBank != ENCDATA_NA;
}

u8 MapHeader_GetWildEncounterBank(u32 mapId) {
    mapId = MapNumberBoundsCheck(mapId);
    return sMapHeaders[mapId].wildEncounterBank;
}

u16 MapHeader_GetEventsBank(u32 mapId) {
    mapId = MapNumberBoundsCheck(mapId);
    return sMapHeaders[mapId].eventsBank;
}

u16 MapHeader_GetMapSec(u32 mapId) {
    mapId = MapNumberBoundsCheck(mapId);
    return sMapHeaders[mapId].mapsec;
}

u8 MapHeader_GetAreaIcon(u32 mapId) {
    mapId = MapNumberBoundsCheck(mapId);
    return sMapHeaders[mapId].areaIcon;
}

u8 MapHeader_GetMomCallIntroParam(u32 mapId) {
    mapId = MapNumberBoundsCheck(mapId);
    return sMapHeaders[mapId].unk_12_C;
}

BOOL MapHeader_IsKanto(u32 mapId) {
    mapId = MapNumberBoundsCheck(mapId);
    return sMapHeaders[mapId].isKanto;
}

u32 MapHeader_GetWeatherType(u32 mapId) {
    mapId = MapNumberBoundsCheck(mapId);
    return sMapHeaders[mapId].weather;
}

u32 MapHeader_GetCameraType(u32 mapId) {
    mapId = MapNumberBoundsCheck(mapId);
    return sMapHeaders[mapId].cameraType;
}

BattleBg MapHeader_GetBattleBg(u32 mapId) {
    mapId = MapNumberBoundsCheck(mapId);
    return (BattleBg)sMapHeaders[mapId].battleBg;
}

BOOL MapHeader_IsEscapeRopeAllowed(u32 mapId) {
    mapId = MapNumberBoundsCheck(mapId);
    return sMapHeaders[mapId].escapeRopeAllowed;
}

BOOL MapHeader_IsFlyAllowed(u32 mapId) {
    mapId = MapNumberBoundsCheck(mapId);
    return sMapHeaders[mapId].flyAllowed;
}

BOOL MapHeader_IsBikeAllowed(u32 mapId) {
    mapId = MapNumberBoundsCheck(mapId);
    return sMapHeaders[mapId].bikeAllowed;
}

BOOL MapHeader_GetField14_1D(u32 mapId) {
    mapId = MapNumberBoundsCheck(mapId);
    return sMapHeaders[mapId].unk_14_1D;
}

BOOL MapHeader_GetField14_1E(u32 mapId) {
    mapId = MapNumberBoundsCheck(mapId);
    return sMapHeaders[mapId].unk_14_1E;
}

BOOL MapHeader_GetField14_1F(u32 mapId) {
    mapId = MapNumberBoundsCheck(mapId);
    return sMapHeaders[mapId].unk_14_1F;
}

MapType MapHeader_GetMapType(u32 mapId) {
    mapId = MapNumberBoundsCheck(mapId);
    return (MapType)sMapHeaders[mapId].mapType;
}

u8 MapHeader_GetFollowMode(u32 mapId) {
    mapId = MapNumberBoundsCheck(mapId);
    return sMapHeaders[mapId].followMode;
}

void MapHeader_GetWorldMapCoords(u32 mapId, s16 *x, s16 *y) {
    mapId = MapNumberBoundsCheck(mapId);

    *x = sMapHeaders[mapId].worldMapX;
    *y = sMapHeaders[mapId].worldMapY;
}

BOOL MapHeader_IsTeleportAllowed(u32 mapId) {
    if (MapHeader_IsFlyAllowed(mapId) == FALSE) {
        return FALSE;
    }

    return MapHeader_GetMapType(mapId) != MAP_TYPE_CITY_TOWN;
}

BOOL MapHeader_MapIsOnMainMatrix(u32 mapId) {
    return MapHeader_GetMatrixId(mapId) == NARC_map_matrix_map_matrix_0000_EVERYWHERE_bin;
}

BOOL MapHeader_IsCave(u32 mapId) {
    return MapHeader_GetMapType(mapId) == MAP_TYPE_CAVE;
}

BOOL MapHeader_IsBuilding(u32 mapId) {
    return MapHeader_GetMapType(mapId) == MAP_TYPE_INTERIOR || MapHeader_GetMapType(mapId) == MAP_TYPE_POKEMON_CENTER;
}

BOOL MapHeader_IsOutdoors(u32 mapId) {
    return MapHeader_GetMapType(mapId) == MAP_TYPE_CITY_TOWN || MapHeader_GetMapType(mapId) == MAP_TYPE_ROUTE;
}

BOOL MapHeader_MapIsUnionRoom(u32 mapId) {
    return mapId == MAP_UNION;
}

BOOL MapHeader_MapIsAmitySquare(u32 mapId) {
    // Leftover from D/P/Pl.
    return FALSE;
}

BOOL MapHeader_MapIsPokemonCenter(u32 mapId) {
    for (s32 i = 0; i < (s32)NELEMS(sPokemonCenterMaps); i++) {
        if (mapId == sPokemonCenterMaps[i]) {
            return TRUE;
        }
    }

    return FALSE;
}

BOOL MapHeader_MapIsPokemonLeagueLobby(u32 mapId) {
    return mapId == MAP_T10R0101;
}

EvoMethod MapHeader_GetMapEvolutionMethod(u32 mapId) {
    // Leftover from D/P/Pl.
    return EVO_NONE;
}
