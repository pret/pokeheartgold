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
    MAP_VIRIDIAN_POKECENTER_1F,
    MAP_PEWTER_POKECENTER_1F,
    MAP_CERULEAN_POKECENTER_1F,
    MAP_LAVENDER_POKECENTER_1F,
    MAP_VERMILION_POKECENTER_1F,
    MAP_CELADON_POKECENTER_1F,
    MAP_FUCHSIA_POKECENTER_1F,
    MAP_CINNABAR_ISLAND_POKECENTER_1F,
    MAP_SAFFRON_POKECENTER_1F,
    MAP_CHERRYGROVE_POKECENTER_1F,
    MAP_VIOLET_POKECENTER_1F,
    MAP_AZALEA_POKECENTER_1F,
    MAP_CIANWOOD_POKECENTER_1F,
    MAP_GOLDENROD_POKECENTER_1F,
    MAP_OLIVINE_POKECENTER_1F,
    MAP_ECRUTEAK_POKECENTER_1F,
    MAP_MAHOGANY_POKECENTER_1F,
    MAP_BLACKTHORN_POKECENTER_1F,
    MAP_MOUNT_SILVER_POKECENTER_1F,
    MAP_ROUTE_3_POKECENTER_1F,
    MAP_ROUTE_10_POKECENTER_1F,
    MAP_ROUTE_32_POKECENTER_1F,
    MAP_FRONTIER_ACCESS_POKECENTER_1F,
    MAP_SAFARI_ZONE_GATE_POKECENTER_1F,
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

u32 MapHeader_GetMapSec(u32 mapId) {
    mapId = MapNumberBoundsCheck(mapId);
    return sMapHeaders[mapId].mapsec;
}

u8 MapHeader_GetAreaIcon(u32 mapId) {
    mapId = MapNumberBoundsCheck(mapId);
    return sMapHeaders[mapId].areaIcon;
}

u8 MapHeader_GetMomCallIntroParam(u32 mapId) {
    mapId = MapNumberBoundsCheck(mapId);
    return sMapHeaders[mapId].momCallIntroParam;
}

BOOL MapHeader_IsInKanto(u32 mapId) {
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

BOOL MapHeader_CanPlacePhoneCalls(u32 mapId) {
    mapId = MapNumberBoundsCheck(mapId);
    return sMapHeaders[mapId].outgoingCalls;
}

BOOL MapHeader_CanReceivePhoneCalls(u32 mapId) {
    mapId = MapNumberBoundsCheck(mapId);
    return sMapHeaders[mapId].incomingCalls;
}

BOOL MapHeader_CanReceiveRadioSignal(u32 mapId) {
    mapId = MapNumberBoundsCheck(mapId);
    return sMapHeaders[mapId].radioSignal;
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

BOOL MapHeader_IsInBuilding(u32 mapId) {
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
    return mapId == MAP_POKEMON_LEAGUE_ENTRANCE;
}

EvoMethod MapHeader_GetMapEvolutionMethod(u32 mapId) {
    // Leftover from D/P/Pl.
    return EVO_NONE;
}
