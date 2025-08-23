#ifndef POKEHEARTGOLD_MAP_MATRIX_H
#define POKEHEARTGOLD_MAP_MATRIX_H

#include "heap.h"
#include "save.h"

#define MAP_MATRIX_MAX_SIZE        799
#define MAP_MATRIX_MAX_NAME_LENGTH 16

typedef struct MAPDATA {
    u16 models[MAP_MATRIX_MAX_SIZE];
} MAPDATA;

typedef struct MAPMATRIXDATA {
    u8 height;
    u8 width;
    u16 headers[MAP_MATRIX_MAX_SIZE];
    u8 altitudes[MAP_MATRIX_MAX_SIZE];
    MAPDATA maps;
    u8 name[MAP_MATRIX_MAX_NAME_LENGTH];
} MAPMATRIXDATA;

typedef struct MAPMATRIX {
    u8 width;
    u8 height;
    u8 matrix_id;
    MAPMATRIXDATA data;
} MAPMATRIX;

MAPMATRIX *MapMatrix_New(void);
void MapMatrix_Load(u32 map_no, MAPMATRIX *map_matrix);
void MapMatrix_Free(MAPMATRIX *map_matrix);
u16 MapMatrix_GetMapModelNo(s32 map_no, MAPMATRIX *map_matrix);
u8 MapMatrix_GetWidth(MAPMATRIX *map_matrix);
u8 MapMatrix_GetHeight(MAPMATRIX *map_matrix);
u16 MapMatrix_GetMapHeader(MAPMATRIX *map_matrix, s32 x, s32 y);
u8 MapMatrix_GetMatrixId(MAPMATRIX *map_matrix);
u8 MapMatrix_GetMapAltitude(MAPMATRIX *map_matrix, u8 matrix_id, u16 x, u16 y, int matrix_width);
MAPDATA *MapMatrix_MapData_New(HeapID heapId);
void MapMatrix_MapData_Free(MAPDATA *map_data);
u16 GetMapModelNo(u32 map_no, MAPMATRIX *map_matrix);
void RemoveMahoganyTownAntennaTree(MAPMATRIX *map_matrix);
BOOL ShouldUseAlternateLakeOfRage(SaveData *saveData, u32 map_no);
void SetLakeOfRageWaterLevel(MAPMATRIX *map_matrix, BOOL lower_water_level);
void PlaceSafariZoneAreas(MAPMATRIX *map_matrix, SaveData *saveData);

#endif
