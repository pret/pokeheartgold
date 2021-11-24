#include "global.h"
#include "constants/maps.h"
#include "fielddata/mapmatrix/map_matrix.naix"
#include "filesystem.h"
#include "map_header.h"
#include "map_matrix.h"
#include "safari_zone.h"
#include <nitro/rtc.h>

struct ScriptState;

extern void* SavArray_Flags_get(SAVEDATA* savedata);
extern void sub_02066C1C(struct ScriptState* state, u32);
extern void sub_02066C4C(struct ScriptState* state, u32);
extern BOOL CheckFlagInArray(struct ScriptState* state, u16 flag_id);
extern void GF_RTC_CopyDate(RTCDate* date);
extern SAFARIZONE* sub_0202F57C(SAVEDATA* savedata);
extern SAFARIZONE_UNKSUB1* sub_0202F630(SAFARIZONE* safari_zone, s32);

static void MapMatrix_MapMatrixData_Load(MAPMATRIXDATA* map_matrix_data, u16 matrix_id, u32 map_no) {
    map_matrix_data->width = 0;
    map_matrix_data->height = 0;

    s32 i;

    for (i = 0; i < MAP_MATRIX_MAX_SIZE; i++) {
        map_matrix_data->headers[i] = 0;
        map_matrix_data->altitudes[i] = 0;
        map_matrix_data->maps.data[i] = 0;
    }

    for (i = 0; i < MAP_MATRIX_MAX_NAME_LENGTH; i++) {
        map_matrix_data->name[i] = 0;
    }

    void* buffer = AllocAtEndAndReadWholeNarcMemberByIdPair(NARC_fielddata_mapmatrix_map_matrix, matrix_id, 11);
    u8* cursor = (u8*)buffer;

    map_matrix_data->width = *(cursor++);
    map_matrix_data->height = *(cursor++);

    u8 has_headers_section = *(cursor++);
    u8 has_altitudes_section = *(cursor++);

    u8 name_length = *(cursor++);
    GF_ASSERT(name_length <= MAP_MATRIX_MAX_NAME_LENGTH);

    MI_CpuCopy8(cursor, &map_matrix_data->name, name_length);
    cursor += name_length;

    if (has_headers_section) {
        MI_CpuCopy8(cursor, &map_matrix_data->headers, map_matrix_data->width * map_matrix_data->height * sizeof(u16));
        cursor += map_matrix_data->width * map_matrix_data->height * sizeof(u16);
    } else {
        MIi_CpuClear16((u16)map_no, (u16*)&map_matrix_data->headers, map_matrix_data->width * map_matrix_data->height * sizeof(u16));
    }

    if (has_altitudes_section) {
        MI_CpuCopy8(cursor, &map_matrix_data->altitudes, map_matrix_data->width * map_matrix_data->height * sizeof(u8));
        cursor += map_matrix_data->width * map_matrix_data->height * sizeof(u8);
    }

    MI_CpuCopy8(cursor, map_matrix_data->maps.data, map_matrix_data->width * map_matrix_data->height * sizeof(u16));
    FreeToHeap(buffer);
}

MAPMATRIX* MapMatrix_New(void) {
    MAPMATRIX* map_matrix = AllocFromHeap(11, sizeof(MAPMATRIX));
    map_matrix->width = 0;
    map_matrix->height = 0;
    map_matrix->matrix_id = 0;

    return map_matrix;
}

void MapMatrix_Load(u32 map_no, MAPMATRIX* map_matrix) {
    u16 matrix_id = MapHeader_GetMatrixId(map_no);

    MapMatrix_MapMatrixData_Load(&map_matrix->data, matrix_id, map_no);

    map_matrix->matrix_id = matrix_id;
    map_matrix->height = map_matrix->data.height;
    map_matrix->width = map_matrix->data.width;
}

void MapMatrix_Free(MAPMATRIX* map_matrix) {
    FreeToHeap(map_matrix);
}

u16 MapMatrix_GetMapData(s32 map_no, MAPMATRIX* map_matrix) {
    GF_ASSERT(map_no < map_matrix->width * map_matrix->height);
    return map_matrix->data.maps.data[map_no];
}

u8 MapMatrix_GetWidth(MAPMATRIX* map_matrix) {
    GF_ASSERT(map_matrix != NULL);
    return map_matrix->width;
}

u8 MapMatrix_GetHeight(MAPMATRIX* map_matrix) {
    GF_ASSERT(map_matrix != NULL);
    return map_matrix->height;
}

u16 MapMatrix_GetMapHeader(MAPMATRIX* map_matrix, s32 x, s32 y) {
    s32 width = map_matrix->width;
    s32 height = map_matrix->height;

    GF_ASSERT(x >= 0 && x < width);
    GF_ASSERT(y >= 0 && y < height);

    return map_matrix->data.headers[y * width + x];
}

u8 MapMatrix_GetMatrixId(MAPMATRIX* map_matrix) {
    return map_matrix->matrix_id;
}

u8 MapMatrix_GetMapAltitude(MAPMATRIX* map_matrix, u8 matrix_id, u16 x, u16 y, int matrix_width) {
#pragma unused(matrix_id)
    GF_ASSERT(x < matrix_width);
    GF_ASSERT(y * matrix_width + x < MAP_MATRIX_MAX_SIZE);

    return map_matrix->data.altitudes[y * matrix_width + x];
}

MAPDATA* MapMatrix_MapData_New(u32 heap_id) {
    MAPDATA* map_data = AllocFromHeap(heap_id, sizeof(MAPDATA));

    void* buffer = AllocAtEndAndReadWholeNarcMemberByIdPair(NARC_fielddata_mapmatrix_map_matrix, 0, heap_id);
    u8* cursor = (u8*)buffer;
    cursor += 4;
    u8 name_length = *cursor;
    cursor++;
    cursor += name_length;

    MI_CpuCopy8(cursor, map_data, sizeof(MAPDATA));
    FreeToHeap(buffer);

    return map_data;
}

void MapMatrix_MapData_Free(MAPDATA* map_data) {
    GF_ASSERT(map_data != NULL);
    FreeToHeap(map_data);
}

u16 GetMapData(u32 map_no, MAPMATRIX* map_matrix) {
    GF_ASSERT(map_matrix != NULL);
    return MapMatrix_GetMapData(map_no, map_matrix);
}

void RemoveMahoganyTownAntennaTree(MAPMATRIX* map_matrix) {
    u16* maps = map_matrix->data.maps.data;
    u8 width = map_matrix->width;

    if (map_matrix->matrix_id != 0) {
        return;
    }

    maps[width * 5 + 16] = 86;
}

BOOL ShouldUseAlternateLakeOfRage(struct SaveBlock2* sav2, u32 map_no) {
    RTCDate date;
    struct ScriptState *state = SavArray_Flags_get(sav2);

    GF_RTC_CopyDate(&date);

    if (CheckFlagInArray(state, 202) == FALSE) {
        // The player hasn't battled the Red Gyarados yet.
        sub_02066C4C(state, 1);
        return FALSE;
    }

    // FIXME(tgsm): this smells like a fakematch, but honestly I'm not sure.
    if ((map_no == MAP_T29 || map_no == MAP_R43) && date.week == RTC_WEEK_WEDNESDAY) {
        goto disable_rain;
    } else {
        sub_02066C4C(state, 1);
        return FALSE;
    }

disable_rain:
    sub_02066C1C(state, 1);
    return TRUE;
}

void SetLakeOfRageWaterLevel(MAPMATRIX* map_matrix, BOOL lower_water_level) {
    u16* maps = map_matrix->data.maps.data;
    u8 width = map_matrix->width;

    if (map_matrix->matrix_id != 0) {
        return;
    }

    if (lower_water_level) {
        maps[width * 1 + 15] = 95;
        maps[width * 1 + 16] = 96;
        maps[width * 1 + 17] = 97;
        maps[width * 2 + 15] = 98;
        maps[width * 2 + 16] = 99;
        maps[width * 2 + 17] = 100;
    } else {
        maps[width * 1 + 15] = 89;
        maps[width * 1 + 16] = 90;
        maps[width * 1 + 17] = 91;
        maps[width * 2 + 15] = 92;
        maps[width * 2 + 16] = 93;
        maps[width * 2 + 17] = 94;
    }
}

void PlaceSafariZoneAreas(MAPMATRIX* map_matrix, SAVEDATA* save) {
    u16* maps = map_matrix->data.maps.data;
    s32 width = map_matrix->width;

    if (map_matrix->matrix_id != 212) { // Safari Zone
        return;
    }

    SAFARIZONE* safari_zone = sub_0202F57C(save);
    SAFARIZONE_UNKSUB1* sz_sub = sub_0202F630(safari_zone, 3);

    for (s32 y = 0; y < SAFARI_ZONE_ROWS; y++) {
        for (s32 x = 0; x < SAFARI_ZONE_COLS; x++) {
            u8 area_no = sz_sub->areas[(y * SAFARI_ZONE_COLS) + x].area_no;
            maps[width * (y + 1) + x + 1] = 652 + area_no;
        }
    }
}
