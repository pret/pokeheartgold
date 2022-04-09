#ifndef POKEHEARTGOLD_MAP_HEADER_H
#define POKEHEARTGOLD_MAP_HEADER_H

#define MAP_FOLLOWMODE_PREVENT          0
#define MAP_FOLLOWMODE_HEIGHT_RESTRICT  1
#define MAP_FOLLOWMODE_ALLOW            2

typedef struct MapHeader {
    u8 wild_encounter_bank;     // fielddata/encountdata/[gs]_enc_data.naix
    u8 area_data_bank;          // fielddata/areadata/area_data.naix
    u16 move_model_bank:4;      // fielddata/mm_list/move_model_list.naix
    u16 world_map_x:6;
    u16 world_map_y:6;
    u16 matrix_id;              // fielddata/mapmatrix/map_matrix.naix
    u16 scripts_bank;           // fielddata/script/scr_seq_release.naix
    u16 script_header_bank;     // fielddata/script/scr_seq_release.naix
    u16 msg_bank;               // msgdata/msg.naix
    u16 day_music_id;           // data/sound/gs_sound_data.sdat
    u16 night_music_id;         // data/sound/gs_sound_data.sdat
    u16 events_bank;            // fielddata/eventdata/zone_event_release.naix
    u16 mapsec:8;
    u16 area_icon:4;
    u16 unk_12_C:4;
    u32 is_kanto:1;
    u32 weather:7;
    u32 location_type:4;
    u32 camera_type:6;
    u32 follow_mode:2;
    u32 battle_bg:5;
    u32 bike_allowed:1;
    u32 unk_14_1A:1;            // unused running flag?
    u32 escape_rope_allowed:1;
    u32 fly_allowed:1;
    u32 unk_14_1D:1;
    u32 unk_14_1E:1;
    u32 unk_14_1F:1;
} MAP_HEADER;

u8 MapHeader_GetAreaDataBank(u32 map_no);
u16 MapHeader_GetMoveModelBank(u32 map_no);
u16 MapHeader_GetMatrixId(u32 map_no);
u16 MapHeader_GetMsgBank(u32 map_no);
u16 MapHeader_GetScriptsBank(u32 map_no);
u16 MapHeader_GetScriptHeaderBank(u32 map_no);
u16 MapHeader_GetDayMusicId(u32 map_no);
u16 MapHeader_GetNightMusicId(u32 map_no);
BOOL MapHeader_HasWildEncounters(u32 map_no);
u8 MapHeader_GetWildEncounterBank(u32 map_no);
u16 MapHeader_GetEventsBank(u32 map_no);
u16 MapHeader_GetMapSec(u32 map_no);
u8 MapHeader_GetAreaIcon(u32 map_no);
u8 MapHeader_GetMomCallIntroParam(u32 map_no);
BOOL MapHeader_IsKanto(u32 map_no);
u32 MapHeader_GetWeatherType(u32 map_no);
u32 MapHeader_GetCameraType(u32 map_no);
u32 MapHeader_GetBattleBg(u32 map_no);
BOOL MapHeader_IsEscapeRopeAllowed(u32 map_no);
BOOL MapHeader_IsFlyAllowed(u32 map_no);
BOOL MapHeader_IsBikeAllowed(u32 map_no);
BOOL MapHeader_GetField14_1D(u32 map_no);
BOOL MapHeader_GetField14_1E(u32 map_no);
BOOL MapHeader_GetField14_1F(u32 map_no);
u32 MapHeader_GetMapType(u32 map_no);
u8 MapHeader_GetFollowMode(u32 map_no);
void MapHeader_GetWorldMapCoords(u32 map_no, s16 *x, s16 *y);
BOOL MapHeader_IsOutdoors(u32 map_no);
BOOL MapHeader_MapIsOnMainMatrix(u32 map_no);
BOOL MapHeader_IsCave(u32 map_no);
BOOL sub_0203B58C(u32 map_no);
BOOL sub_0203B5AC(u32 map_no);
BOOL MapHeader_MapIsUnionRoom(u32 map_no);
BOOL MapHeader_MapIsAmitySquare(u32 map_no);
BOOL MapHeader_MapIsPokemonCenter(u32 map_no);
BOOL MapHeader_MapIsPokemonLeagueLobby(u32 map_no);
u16 MapHeader_GetMapEvolutionMethod(u32 map_no);

#endif //POKEHEARTGOLD_MAP_HEADER_H
