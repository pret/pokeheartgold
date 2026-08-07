#ifndef POKEHEARTGOLD_FIELD_MAP_PROP_ANIMATION_H
#define POKEHEARTGOLD_FIELD_MAP_PROP_ANIMATION_H

#include "field/overlay_01_02204004.h"

#include "filesystem.h"

#define MAP_PROP_ANIM_LIST_FILE_ARCHIVE_IDS_COUNT 4

#define MAP_PROP_ANIMATION_MANAGER_MAX_ANIMATIONS               16
#define MAP_PROP_ANIMATION_MANAGER_MAX_BICYCLE_SLOPE_ANIMATIONS 2

typedef struct BicycleSlopeAnimation {
    BOOL loaded;
    NNSG3dRenderObj *renderObj;
    MapPropAnimation *animation;
    int animID;
} BicycleSlopeAnimation; // Size: 0x10

typedef struct MapPropAnimListFile {
    u8 hasAnimations;
    u8 flags;
    u8 isBicycleSlope;
    u8 filler_3;
    u32 unk4;
    u32 animArchiveIDs[MAP_PROP_ANIM_LIST_FILE_ARCHIVE_IDS_COUNT];
} MapPropAnimListFile; // Size: 0x18

typedef struct MapPropAnimationData { // Should we swap the names?
    MapPropAnimation *animation;
    BOOL loaded;
    u32 animArchiveID;
    u32 unkC;
} MapPropAnimationData;

typedef struct MapPropAnimationManager {
    NNSFndAllocator allocator;
    MapPropAnimationData animations[MAP_PROP_ANIMATION_MANAGER_MAX_ANIMATIONS];
    BicycleSlopeAnimation bicycleSlopeAnimations[MAP_PROP_ANIMATION_MANAGER_MAX_BICYCLE_SLOPE_ANIMATIONS];
    NARC *unk130;
    NARC *unk134;
    FieldSystemUnkSubCC_Sub0 *unk138;
} MapPropAnimationManager; // Size: 0x13C

typedef struct MapPropOneShotAnimationManager {
    u8 unk0[0x380];
} MapPropOneShotAnimationManager; // Size: 0x380

MapPropAnimationManager *MapPropAnimationManager_Init(NARC *narc, FieldSystemUnkSubC8 *unkSubC8);
BOOL MapPropAnimationManager_AddAnimationToRenderObj(const int mapPropModelID, const int mapPropAnimID, const BOOL isDeferred, UnkStruct_FieldSysC0_SubC *renderObj, MapPropAnimationManager *manager);
void MapPropAnimationManager_UnloadAllAnimations(MapPropAnimationManager *manager);
void MapPropAnimationManager_RemoveAnimationFromRenderObj(MapPropAnimationManager *mapPropAnimationManager, UnkStruct_FieldSysC0_SubC *unkC0_SubC, const int mapPropModelID, const int mapPropAnimIndex);
void MapPropAnimationManager_Free(MapPropAnimationManager *manager);
MapPropAnimationData *MapPropAnimationManager_GetAnimationData(const int mapPropModelID, const int mapPropAnimIndex, MapPropAnimationManager *mapPropAnimationManager);
void MapPropAnimationData_SetAnimationPaused(MapPropAnimationData *animation, const BOOL paused);
void MapPropAnimationData_GoToFirstAnimationFrame(MapPropAnimationData *animData);
void MapPropAnimationData_GoToLastAnimationFrame(MapPropAnimationData *animData);
void MapPropAnimationData_SetAnimationLoopCount(MapPropAnimationData *animation, int loopCount);
BOOL MapPropAnimationData_IsAnimationLoopFinished(MapPropAnimationData *animation);
int MapPropAnimationManager_GetAnimListNARCFileCount(MapPropAnimationManager *mapPropAnimationManager);
MapPropOneShotAnimationManager *ov01_021E8DB4();
void ov01_021E8DD4(MapPropOneShotAnimationManager **mapPropOneShotAnimationManager);

#endif // POKEHEARTGOLD_FIELD_MAP_PROP_ANIMATION_H
