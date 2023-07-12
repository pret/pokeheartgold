#define _IN_MAP_HEADER_C

#include "global.h"
#include "constants/map_sections.h"
#include "constants/maps.h"
#include "constants/sndseq.h"
#include "fielddata/mapmatrix/map_matrix.naix"
#include "fielddata/eventdata/zone_event.naix"
#include "fielddata/script/scr_seq.naix"
#include "map_header.h"
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

static u32 MapNumberBoundsCheck(u32 map_no) {
    if (map_no >= NELEMS(sMapHeaders)) {
        GF_ASSERT(FALSE);
        map_no = MAP_NOTHING;
    }

    return map_no;
}

u8 MapHeader_GetAreaDataBank(u32 map_no) {
    map_no = MapNumberBoundsCheck(map_no);
    return sMapHeaders[map_no].area_data_bank;
}

u16 MapHeader_GetMoveModelBank(u32 map_no) {
    map_no = MapNumberBoundsCheck(map_no);
    return sMapHeaders[map_no].move_model_bank;
}

u16 MapHeader_GetMatrixId(u32 map_no) {
    map_no = MapNumberBoundsCheck(map_no);
    return sMapHeaders[map_no].matrix_id;
}

u16 MapHeader_GetMsgBank(u32 map_no) {
    map_no = MapNumberBoundsCheck(map_no);
    return sMapHeaders[map_no].msg_bank;
}

u16 MapHeader_GetScriptsBank(u32 map_no) {
    map_no = MapNumberBoundsCheck(map_no);
    return sMapHeaders[map_no].scripts_bank;
}

u16 MapHeader_GetScriptHeaderBank(u32 map_no) {
    map_no = MapNumberBoundsCheck(map_no);
    return sMapHeaders[map_no].script_header_bank;
}

u16 MapHeader_GetDayMusicId(u32 map_no) {
    map_no = MapNumberBoundsCheck(map_no);
    return sMapHeaders[map_no].day_music_id;
}

u16 MapHeader_GetNightMusicId(u32 map_no) {
    map_no = MapNumberBoundsCheck(map_no);
    return sMapHeaders[map_no].night_music_id;
}

BOOL MapHeader_HasWildEncounters(u32 map_no) {
    map_no = MapNumberBoundsCheck(map_no);
    return sMapHeaders[map_no].wild_encounter_bank != ENCDATA_NA;
}

u8 MapHeader_GetWildEncounterBank(u32 map_no) {
    map_no = MapNumberBoundsCheck(map_no);
    return sMapHeaders[map_no].wild_encounter_bank;
}

u16 MapHeader_GetEventsBank(u32 map_no) {
    map_no = MapNumberBoundsCheck(map_no);
    return sMapHeaders[map_no].events_bank;
}

u16 MapHeader_GetMapSec(u32 map_no) {
    map_no = MapNumberBoundsCheck(map_no);
    return sMapHeaders[map_no].mapsec;
}

u8 MapHeader_GetAreaIcon(u32 map_no) {
    map_no = MapNumberBoundsCheck(map_no);
    return sMapHeaders[map_no].area_icon;
}

u8 MapHeader_GetMomCallIntroParam(u32 map_no) {
    map_no = MapNumberBoundsCheck(map_no);
    return sMapHeaders[map_no].unk_12_C;
}

BOOL MapHeader_IsKanto(u32 map_no) {
    map_no = MapNumberBoundsCheck(map_no);
    return sMapHeaders[map_no].is_kanto;
}

u32 MapHeader_GetWeatherType(u32 map_no) {
    map_no = MapNumberBoundsCheck(map_no);
    return sMapHeaders[map_no].weather;
}

u32 MapHeader_GetCameraType(u32 map_no) {
    map_no = MapNumberBoundsCheck(map_no);
    return sMapHeaders[map_no].camera_type;
}

u32 MapHeader_GetBattleBg(u32 map_no) {
    map_no = MapNumberBoundsCheck(map_no);
    return sMapHeaders[map_no].battle_bg;
}

BOOL MapHeader_IsEscapeRopeAllowed(u32 map_no) {
    map_no = MapNumberBoundsCheck(map_no);
    return sMapHeaders[map_no].escape_rope_allowed;
}

BOOL MapHeader_IsFlyAllowed(u32 map_no) {
    map_no = MapNumberBoundsCheck(map_no);
    return sMapHeaders[map_no].fly_allowed;
}

BOOL MapHeader_IsBikeAllowed(u32 map_no) {
    map_no = MapNumberBoundsCheck(map_no);
    return sMapHeaders[map_no].bike_allowed;
}

BOOL MapHeader_GetField14_1D(u32 map_no) {
    map_no = MapNumberBoundsCheck(map_no);
    return sMapHeaders[map_no].unk_14_1D;
}

BOOL MapHeader_GetField14_1E(u32 map_no) {
    map_no = MapNumberBoundsCheck(map_no);
    return sMapHeaders[map_no].unk_14_1E;
}

BOOL MapHeader_GetField14_1F(u32 map_no) {
    map_no = MapNumberBoundsCheck(map_no);
    return sMapHeaders[map_no].unk_14_1F;
}

u32 MapHeader_GetMapType(u32 map_no) {
    map_no = MapNumberBoundsCheck(map_no);
    return sMapHeaders[map_no].location_type;
}

u8 MapHeader_GetFollowMode(u32 map_no) {
    map_no = MapNumberBoundsCheck(map_no);
    return sMapHeaders[map_no].follow_mode;
}

void MapHeader_GetWorldMapCoords(u32 map_no, s16 *x, s16 *y) {
    map_no = MapNumberBoundsCheck(map_no);

    *x = sMapHeaders[map_no].world_map_x;
    *y = sMapHeaders[map_no].world_map_y;
}

BOOL MapHeader_IsOutdoors(u32 map_no) {
    if (MapHeader_IsFlyAllowed(map_no) == FALSE) {
        return FALSE;
    }

    return MapHeader_GetMapType(map_no) != 1;
}

BOOL MapHeader_MapIsOnMainMatrix(u32 map_no) {
    return MapHeader_GetMatrixId(map_no) == NARC_map_matrix_map_matrix_0000_EVERYWHERE_bin;
}

BOOL MapHeader_IsCave(u32 map_no) {
    return MapHeader_GetMapType(map_no) == 3;
}

BOOL sub_0203B58C(u32 map_no) {
    return MapHeader_GetMapType(map_no) == 4 || MapHeader_GetMapType(map_no) == 5;
}

BOOL sub_0203B5AC(u32 map_no) {
    return MapHeader_GetMapType(map_no) == 1 || MapHeader_GetMapType(map_no) == 2;
}

BOOL MapHeader_MapIsUnionRoom(u32 map_no) {
    return map_no == MAP_UNION;
}

BOOL MapHeader_MapIsAmitySquare(u32 map_no) {
    // Leftover from D/P/Pl.
    return FALSE;
}

BOOL MapHeader_MapIsPokemonCenter(u32 map_no) {
    for (s32 i = 0; i < (s32)NELEMS(sPokemonCenterMaps); i++) {
        if (map_no == sPokemonCenterMaps[i]) {
            return TRUE;
        }
    }

    return FALSE;
}

BOOL MapHeader_MapIsPokemonLeagueLobby(u32 map_no) {
    return map_no == MAP_T10R0101;
}

u16 MapHeader_GetMapEvolutionMethod(u32 map_no) {
    // Leftover from D/P/Pl.
    return 0;
}
