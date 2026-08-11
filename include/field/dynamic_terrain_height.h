#ifndef POKEHEARTGOLD_FIELD_DYNAMIC_TERRAIN_HEIGHT_H
#define POKEHEARTGOLD_FIELD_DYNAMIC_TERRAIN_HEIGHT_H

typedef struct DynamicTerrainHeightManager {
    u8 unk0[0x8];
} DynamicTerrainHeightManager;

DynamicTerrainHeightManager *DynamicTerrainHeightManager_New(const u8 platesCount, enum HeapID heapID);
void DynamicTerrainHeightManager_Free(DynamicTerrainHeightManager *dynamicTerrainHeightManager);

#endif // POKEHEARTGOLD_FIELD_DYNAMIC_TERRAIN_HEIGHT_H
