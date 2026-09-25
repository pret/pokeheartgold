#ifndef POKEHEARTGOLD_MAP_MATRIX_H
#define POKEHEARTGOLD_MAP_MATRIX_H

#include "heap.h"
#include "save.h"

#define MAP_MATRIX_MAX_SIZE        799
#define MAP_MATRIX_MAX_NAME_LENGTH 16

typedef struct MAPDATA {
    u16 models[MAP_MATRIX_MAX_SIZE];
} MAPDATA;

typedef struct MapMatrixData {
    u8 height;
    u8 width;
    u16 headers[MAP_MATRIX_MAX_SIZE];
    u8 altitudes[MAP_MATRIX_MAX_SIZE];
    MAPDATA maps;
    u8 name[MAP_MATRIX_MAX_NAME_LENGTH];
} MapMatrixData;

typedef struct MapMatrix {
    u8 width;
    u8 height;
    u8 matrix_id;
    MapMatrixData data;
} MapMatrix;

MapMatrix *MapMatrix_New(void);
void MapMatrix_Load(u32 map_no, MapMatrix *map_matrix);
void MapMatrix_Free(MapMatrix *map_matrix);
u16 MapMatrix_GetMapModelNo(int map_no, MapMatrix *map_matrix);
u8 MapMatrix_GetWidth(MapMatrix *map_matrix);
u8 MapMatrix_GetHeight(MapMatrix *map_matrix);
u16 MapMatrix_GetMapHeader(MapMatrix *map_matrix, s32 x, s32 y);
u8 MapMatrix_GetMatrixId(MapMatrix *map_matrix);
u8 MapMatrix_GetMapAltitude(MapMatrix *map_matrix, u8 matrix_id, u16 x, u16 y, int matrix_width);
MAPDATA *MapMatrix_MapData_New(enum HeapID heapID);
void MapMatrix_MapData_Free(MAPDATA *map_data);
u16 GetMapModelNo(u32 map_no, MapMatrix *map_matrix);
void RemoveMahoganyTownAntennaTree(MapMatrix *map_matrix);
BOOL ShouldUseAlternateLakeOfRage(SaveData *saveData, u32 map_no);
void SetLakeOfRageWaterLevel(MapMatrix *map_matrix, BOOL lower_water_level);
void PlaceSafariZoneAreas(MapMatrix *map_matrix, SaveData *saveData);

#endif
