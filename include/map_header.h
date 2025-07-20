#ifndef POKEHEARTGOLD_MAP_HEADER_H
#define POKEHEARTGOLD_MAP_HEADER_H

#include "global.h"

#include "constants/battle.h"
#include "constants/pokemon.h"

#define MAP_FOLLOWMODE_PREVENT         0
#define MAP_FOLLOWMODE_HEIGHT_RESTRICT 1
#define MAP_FOLLOWMODE_ALLOW           2

typedef struct MapHeader {
    u8 wildEncounterBank;  // fielddata/encountdata/[gs]_enc_data.naix
    u8 areaDataBank;       // fielddata/areadata/area_data.naix
    u16 moveModelBank : 4; // fielddata/mm_list/move_model_list.naix
    u16 worldMapX : 6;
    u16 worldMapY : 6;
    u16 matrixId;         // fielddata/mapmatrix/map_matrix.naix
    u16 scriptsBank;      // fielddata/script/scr_seq_release.naix
    u16 scriptHeaderBank; // fielddata/script/scr_seq_release.naix
    u16 msgBank;          // msgdata/msg.naix
    u16 dayMusicId;       // data/sound/gs_sound_data.sdat
    u16 nightMusicId;     // data/sound/gs_sound_data.sdat
    u16 eventsBank;       // fielddata/eventdata/zone_event_release.naix
    u16 mapsec : 8;
    u16 areaIcon : 4;
    u16 momCallIntroParam : 4;
    u32 isKanto : 1;
    u32 weather : 7;
    u32 mapType : 4;
    u32 cameraType : 6;
    u32 followMode : 2;
    u32 battleBg : 5;
    u32 bikeAllowed : 1;
    u32 runningAllowed_Unused : 1;
    u32 escapeRopeAllowed : 1;
    u32 flyAllowed : 1;
    u32 outgoingCalls : 1;
    u32 incomingCalls : 1;
    u32 radioSignal : 1;
} MapHeader;

typedef enum MapType {
    MAP_TYPE_INVALID,
    MAP_TYPE_CITY_TOWN,
    MAP_TYPE_ROUTE,
    MAP_TYPE_CAVE,
    MAP_TYPE_INTERIOR,
    MAP_TYPE_POKEMON_CENTER, // Unused in HG/SS, Pokémon Centers use the Interior type
    MAP_TYPE_UNDERGROUND,    // Leftover from the Sinnoh games
} MapType;

u8 MapHeader_GetAreaDataBank(u32 mapId);
u16 MapHeader_GetMoveModelBank(u32 mapId);
u16 MapHeader_GetMatrixId(u32 mapId);
u16 MapHeader_GetMsgBank(u32 mapId);
u16 MapHeader_GetScriptsBank(u32 mapId);
u16 MapHeader_GetScriptHeaderBank(u32 mapId);
u16 MapHeader_GetDayMusicId(u32 mapId);
u16 MapHeader_GetNightMusicId(u32 mapId);
BOOL MapHeader_HasWildEncounters(u32 mapId);
u8 MapHeader_GetWildEncounterBank(u32 mapId);
u16 MapHeader_GetEventsBank(u32 mapId);
u32 MapHeader_GetMapSec(u32 mapId);
u8 MapHeader_GetAreaIcon(u32 mapId);
u8 MapHeader_GetMomCallIntroParam(u32 mapId);
BOOL MapHeader_IsInKanto(u32 mapId);
u32 MapHeader_GetWeatherType(u32 mapId);
u32 MapHeader_GetCameraType(u32 mapId);
BattleBg MapHeader_GetBattleBg(u32 mapId);
BOOL MapHeader_IsEscapeRopeAllowed(u32 mapId);
BOOL MapHeader_IsFlyAllowed(u32 mapId);
BOOL MapHeader_IsBikeAllowed(u32 mapId);
BOOL MapHeader_CanPlacePhoneCalls(u32 mapId);
BOOL MapHeader_CanReceivePhoneCalls(u32 mapId);
BOOL MapHeader_CanReceiveRadioSignal(u32 mapId);
MapType MapHeader_GetMapType(u32 mapId);
u8 MapHeader_GetFollowMode(u32 mapId);
void MapHeader_GetWorldMapCoords(u32 mapId, s16 *x, s16 *y);
BOOL MapHeader_IsTeleportAllowed(u32 mapId);
BOOL MapHeader_MapIsOnMainMatrix(u32 mapId);
BOOL MapHeader_IsCave(u32 mapId);
BOOL MapHeader_IsInBuilding(u32 mapId);
BOOL MapHeader_IsOutdoors(u32 mapId);
BOOL MapHeader_MapIsUnionRoom(u32 mapId);
BOOL MapHeader_MapIsAmitySquare(u32 mapId);
BOOL MapHeader_MapIsPokemonCenter(u32 mapId);
BOOL MapHeader_MapIsPokemonLeagueLobby(u32 mapId);
EvoMethod MapHeader_GetMapEvolutionMethod(u32 mapId);

#endif // POKEHEARTGOLD_MAP_HEADER_H
