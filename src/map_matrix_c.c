#include "global.h"
#include "filesystem.h"
#include "map_header.h"
#include "map_matrix.h"
#include <nitro/rtc/api.h>

struct ScriptState;

extern void* SavArray_Flags_get(struct SaveBlock2* sav2);
extern void sub_02066C1C(struct ScriptState* state, u32 a1);
extern void sub_02066C4C(struct ScriptState* state, u32 a1);
extern BOOL CheckFlagInArray(struct ScriptState* state, u16 flag_id);
extern void GF_RTC_CopyDate(RTCDate* date);

static void MapMatrix_MapMatrixData_Load(struct MapMatrixData* map_matrix_data, u16 matrix_id, u32 map_no) {
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

struct MapMatrix* MapMatrix_New(void) {
    struct MapMatrix* map_matrix = AllocFromHeap(11, sizeof(struct MapMatrix));
    map_matrix->width = 0;
    map_matrix->height = 0;
    map_matrix->matrix_id = 0;

    return map_matrix;
}

void MapMatrix_Load(u32 map_no, struct MapMatrix* map_matrix) {
    u16 matrix_id = MapHeader_GetMatrixId(map_no);

    MapMatrix_MapMatrixData_Load(&map_matrix->data, matrix_id, map_no);

    map_matrix->matrix_id = matrix_id;
    map_matrix->height = map_matrix->data.height;
    map_matrix->width = map_matrix->data.width;
}

void MapMatrix_Free(struct MapMatrix* map_matrix) {
    FreeToHeap(map_matrix);
}

u16 MapMatrix_GetMapData(s32 map_no, struct MapMatrix* map_matrix) {
    GF_ASSERT(map_no < map_matrix->width * map_matrix->height);
    return map_matrix->data.maps.data[map_no];
}

u8 MapMatrix_GetWidth(struct MapMatrix* map_matrix) {
    GF_ASSERT(map_matrix != NULL);
    return map_matrix->width;
}

u8 MapMatrix_GetHeight(struct MapMatrix* map_matrix) {
    GF_ASSERT(map_matrix != NULL);
    return map_matrix->height;
}

u16 MapMatrix_GetMapHeader(struct MapMatrix* map_matrix, s32 x, s32 y) {
    s32 width = map_matrix->width;
    s32 height = map_matrix->height;

    GF_ASSERT(x >= 0 && x < width);
    GF_ASSERT(y >= 0 && y < height);

    return map_matrix->data.headers[y * width + x];
}

u8 MapMatrix_GetMatrixId(struct MapMatrix* map_matrix) {
    return map_matrix->matrix_id;
}

u8 MapMatrix_GetMapAltitude(struct MapMatrix* map_matrix, u8 matrix_id, u16 x, u16 y, int matrix_width) {
#pragma unused(matrix_id)
    GF_ASSERT(x < matrix_width);
    GF_ASSERT(y * matrix_width + x < MAP_MATRIX_MAX_SIZE);

    return map_matrix->data.altitudes[y * matrix_width + x];
}

struct MapData* MapMatrix_MapData_New(u32 heap_id) {
    struct MapData* map_data = AllocFromHeap(heap_id, sizeof(struct MapData));

    void* buffer = AllocAtEndAndReadWholeNarcMemberByIdPair(NARC_fielddata_mapmatrix_map_matrix, 0, heap_id);
    u8* cursor = (u8*)buffer;
    cursor += 4;
    u8 name_length = *cursor;
    cursor++;
    cursor += name_length;

    MI_CpuCopy8(cursor, map_data, sizeof(struct MapData));
    FreeToHeap(buffer);

    return map_data;
}

void MapMatrix_MapData_Free(struct MapData* map_data) {
    GF_ASSERT(map_data != NULL);
    FreeToHeap(map_data);
}

u16 GetMapData(u32 map_no, struct MapMatrix* map_matrix) {
    GF_ASSERT(map_matrix != NULL);
    return MapMatrix_GetMapData(map_no, map_matrix);
}

void RemoveMahoganyTownAntennaTree(struct MapMatrix* map_matrix) {
    u16* maps = map_matrix->data.maps.data;
    u8 width = map_matrix->width;

    if (map_matrix->matrix_id != 0) {
        return;
    }

    maps[width * 5 + 16] = 86;
}

asm BOOL sub_0203B114(struct SaveBlock2* sav2, u32 map_no) {
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r1, #0
	bl SavArray_Flags_get
	add r4, r0, #0
	add r0, sp, #0
	bl GF_RTC_CopyDate
	add r0, r4, #0
	mov r1, #0xca
	bl CheckFlagInArray
	cmp r0, #0
	bne _0203B140
	add r0, r4, #0
	mov r1, #1
	bl sub_02066C4C
	add sp, #0x10
	mov r0, #0
	pop {r3, r4, r5, pc}
_0203B140:
	cmp r5, #0x58
	beq _0203B148
	cmp r5, #0x2d
	bne _0203B14E
_0203B148:
	ldr r0, [sp, #0xc]
	cmp r0, #3
	beq _0203B15C
_0203B14E:
	add r0, r4, #0
	mov r1, #1
	bl sub_02066C4C
	add sp, #0x10
	mov r0, #0
	pop {r3, r4, r5, pc}
_0203B15C:
	add r0, r4, #0
	mov r1, #1
	bl sub_02066C1C
	mov r0, #1
	add sp, #0x10
	pop {r3, r4, r5, pc}
}

void SetLakeOfRageWaterLevel(struct MapMatrix* map_matrix, BOOL lower_water_level) {
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
