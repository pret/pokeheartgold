#include "terrain_attributes.h"

#include "field_system.h"

static void TerrainAttributes_Load(MAPMATRIX *mapMatrix, TerrainAttributes *terrainAttributes, const u8 blockCount);
static const u8 TerrainAttributes_GetOrPushLandDataID(const u16 landDataID, u16 *blockIndexToLandDataID, u8 *blockCount);

void TerrainAttributes_New(FieldSystem *fieldSystem, const u8 blockCount) {
    if (fieldSystem->terrainAttributes == NULL) {
        fieldSystem->terrainAttributes = Heap_Alloc(HEAP_ID_FIELD2, sizeof(TerrainAttributes));
        TerrainAttributes_Load(fieldSystem->mapMatrix, fieldSystem->terrainAttributes, blockCount);
    }
}

void TerrainAttributes_Free(FieldSystem *fieldSystem) {
	if (fieldSystem->terrainAttributes != NULL) {
		Heap_Free(fieldSystem->terrainAttributes);
		fieldSystem->terrainAttributes = NULL;
	}
}

const u16 *TerrainAttributes_Get(const u32 mapMatrixIndex, const TerrainAttributes *terrainAttributes) {
    u8 blockIndex = terrainAttributes->mapMatrixIndexToBlockIndex[mapMatrixIndex];
    return &terrainAttributes->terrainAttributes[MAP_TILES_COUNT_X * MAP_TILES_COUNT_Z * blockIndex];
}

#ifdef NONMATCHING
// Code is almost correct, just have a r4/r5 swap issue in the inner loop (tried reordering declarations but nothing working yet), see comments in asm
static void TerrainAttributes_Load(MAPMATRIX *mapMatrix, TerrainAttributes *terrainAttributes, const u8 blockCount) {
    u16 mapMatrixIndex;
    u16 landDataID;
    int i, j;
    u16 blockIndexToLandDataID[TERRAIN_ATTRIBUTES_MAX_BLOCK_COUNT];

    u8 realBlockCount = 0;
    int mapMatrixWidth = MapMatrix_GetWidth(mapMatrix);
    int mapMatrixHeight = MapMatrix_GetHeight(mapMatrix);

    for (j = 0; j < mapMatrixHeight; j++) {
        for (i = 0; i < mapMatrixWidth; i++) {
            mapMatrixIndex = j * mapMatrixWidth + i;
            landDataID = MapMatrix_GetMapModelNo(mapMatrixIndex, mapMatrix);

            u8 blockIndex = TerrainAttributes_GetOrPushLandDataID(landDataID, blockIndexToLandDataID, &realBlockCount);
            terrainAttributes->mapMatrixIndexToBlockIndex[mapMatrixIndex] = blockIndex;
        }
    }

    NARC *landDataNARC = NARC_New(NARC_fielddata_landdata_land_data, HEAP_ID_FIELD2);

    for (int i = 0; i < blockCount; i++) {
        landDataID = blockIndexToLandDataID[i];
        void *terrainAttributesBlock = &terrainAttributes->terrainAttributes[MAP_TILES_COUNT_X * MAP_TILES_COUNT_Z * i];

        NARC_ReadFromMember(landDataNARC, landDataID, TERRAIN_ATTRIBUTES_OFFSET, TERRAIN_ATTRIBUTES_SIZE, terrainAttributesBlock);
    }

    NARC_Delete(landDataNARC);
}
#else
// clang-format off
asm static void TerrainAttributes_Load(MAPMATRIX *mapMatrix, TerrainAttributes *terrainAttributes, const u8 blockCount) {
	push {r4, r5, r6, r7, lr}
	sub sp, #0x3c
	str r1, [sp, #8]
	str r2, [sp, #0xc]
	str r0, [sp, #4]
	mov r2, #0
	add r1, sp, #0x18
	strb r2, [r1]
	bl MapMatrix_GetWidth
	add r6, r0, #0
	ldr r0, [sp, #4]
	bl MapMatrix_GetHeight
	str r0, [sp, #0x10]
	mov r0, #0
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x10]
	cmp r0, #0
	ble _020545BC
	ldr r7, [sp, #0x14]
_02054586:
	mov r5, #0 // -------- we have r4 instead
	cmp r6, #0
	ble _020545AE
_0205458C:
	add r0, r5, r7 // -------- we have r4 instead
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10 // -------- we have r5 instead
	ldr r1, [sp, #4]
	add r0, r4, #0 // -------- we have r5 instead
	bl MapMatrix_GetMapModelNo
	add r1, sp, #0x18
	add r1, #2
	add r2, sp, #0x18
	bl TerrainAttributes_GetOrPushLandDataID
	ldr r1, [sp, #8]
	add r5, r5, #1 // -------- we have r4 instead
	strb r0, [r1, r4] // -------- we have r5 instead
	cmp r5, r6 // -------- we have r4 instead
	blt _0205458C
_020545AE:
	ldr r0, [sp, #0x14]
	add r7, r7, r6
	add r1, r0, #1
	ldr r0, [sp, #0x10]
	str r1, [sp, #0x14]
	cmp r1, r0
	blt _02054586
_020545BC:
	mov r0, #0x41
	mov r1, #0xb
	bl NARC_New
	add r7, r0, #0
	ldr r0, [sp, #0xc]
	mov r6, #0
	cmp r0, #0
	ble _02054600
	ldr r0, [sp, #8]
	add r4, sp, #0x18
	add r0, #0xe2
	add r4, #2
	add r5, r6, #0
	str r0, [sp, #8]
_020545DA:
	ldr r0, [sp, #8]
	lsl r1, r5, #1
	add r0, r0, r1
	str r0, [sp]
	ldrh r1, [r4]
	mov r3, #2
	add r0, r7, #0
	mov r2, #0x14
	lsl r3, r3, #0xa
	bl NARC_ReadFromMember
	mov r0, #1
	lsl r0, r0, #0xa
	add r5, r5, r0
	ldr r0, [sp, #0xc]
	add r6, r6, #1
	add r4, r4, #2
	cmp r6, r0
	blt _020545DA
_02054600:
	add r0, r7, #0
	bl NARC_Delete
	add sp, #0x3c
	pop {r4, r5, r6, r7, pc}
}
// clang-format on
#endif // NONMATCHING

static const u8 TerrainAttributes_GetOrPushLandDataID(const u16 landDataID, u16 *blockIndexToLandDataID, u8 *blockCount){
    u8 i;

    for (i = 0; i < *blockCount; i++) {
        if (blockIndexToLandDataID[i] == landDataID) {
            return i;
        }
    }

    GF_ASSERT(i < TERRAIN_ATTRIBUTES_MAX_BLOCK_COUNT);

    blockIndexToLandDataID[i] = landDataID;
    (*blockCount)++;

    return i;
}
