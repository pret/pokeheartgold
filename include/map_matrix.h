#ifndef POKEHEARTGOLD_MAP_MATRIX_H
#define POKEHEARTGOLD_MAP_MATRIX_H

#define MAP_MATRIX_MAX_SIZE 799
#define MAP_MATRIX_MAX_NAME_LENGTH 16

struct SaveBlock2;

struct MapData {
    u16 data[MAP_MATRIX_MAX_SIZE];
};

struct MapMatrixData {
    u8 height;
    u8 width;
    u16 headers[MAP_MATRIX_MAX_SIZE];
    u8 altitudes[MAP_MATRIX_MAX_SIZE];
    struct MapData maps;
    u8 name[MAP_MATRIX_MAX_NAME_LENGTH];
};

struct MapMatrix {
    u8 width;
    u8 height;
    u8 matrix_id;
    struct MapMatrixData data;
};

struct MapMatrix* MapMatrix_New(void);
void MapMatrix_Load(u32 map_no, struct MapMatrix* map_matrix);
void MapMatrix_Free(struct MapMatrix* map_matrix);
u16 MapMatrix_GetMapData(s32 map_no, struct MapMatrix* map_matrix);
u8 MapMatrix_GetWidth(struct MapMatrix* map_matrix);
u8 MapMatrix_GetHeight(struct MapMatrix* map_matrix);
u16 MapMatrix_GetMapHeader(struct MapMatrix* map_matrix, s32 x, s32 y);
u8 MapMatrix_GetMatrixId(struct MapMatrix* map_matrix);
u8 MapMatrix_GetMapAltitude(struct MapMatrix* map_matrix, u8 matrix_id, u16 x, u16 y, int matrix_width);
struct MapData* MapMatrix_MapData_New(u32 heap_id);
void MapMatrix_MapData_Free(struct MapData* map_data);
u16 GetMapData(u32 map_no, struct MapMatrix* map_matrix);
void RemoveMahoganyTownAntennaTree(struct MapMatrix* map_matrix);
BOOL ShouldUseAlternateLakeOfRage(struct SaveBlock2* sav2, u32 map_no);
void SetLakeOfRageWaterLevel(struct MapMatrix* map_matrix, BOOL lower_water_level);
void sub_0203B1FC(struct MapMatrix* map_matrix, struct SaveBlock2* sav2);

#endif
