#ifndef POKEHEARTGOLD_TERRAIN_ATTRIBUTES_H
#define POKEHEARTGOLD_TERRAIN_ATTRIBUTES_H

#include "global.h"
#include "script.h"
#include "field_types_def.h"

#define MAP_TILES_COUNT_X 32
#define MAP_TILES_COUNT_Z 32
#define TERRAIN_ATTRIBUTES_OFFSET 0x14 // was 0x10 in platinum, but is 0x14 in hg/ss
#define TERRAIN_ATTRIBUTES_SIZE   0x800
#define TERRAIN_ATTRIBUTES_COUNT  (TERRAIN_ATTRIBUTES_SIZE / sizeof(u16))

#define TERRAIN_ATTRIBUTES_MAP_MATRIX_COUNT 225
#define TERRAIN_ATTRIBUTES_MAX_BLOCK_COUNT  16

typedef struct TerrainAttributes {
    u8 mapMatrixIndexToBlockIndex[TERRAIN_ATTRIBUTES_MAP_MATRIX_COUNT];
    u16 terrainAttributes[TERRAIN_ATTRIBUTES_COUNT * TERRAIN_ATTRIBUTES_MAX_BLOCK_COUNT];
} TerrainAttributes;

void TerrainAttributes_New(FieldSystem *fieldSystem, const u8 blockCount);
void TerrainAttributes_Free(FieldSystem *fieldSystem);
const u16 *TerrainAttributes_Get(const u32 mapMatrixIndex, const TerrainAttributes *terrainAttributes);

#endif // POKEHEARTGOLD_TERRAIN_ATTRIBUTES_H
