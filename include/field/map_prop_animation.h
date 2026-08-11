#ifndef POKEHEARTGOLD_FIELD_MAP_PROP_ANIMATION_H
#define POKEHEARTGOLD_FIELD_MAP_PROP_ANIMATION_H

#include "field/overlay_01_02204004.h"

#include "filesystem.h"

#define MAP_PROP_ANIM_LIST_FILE_ARCHIVE_IDS_COUNT 4

#define MAP_PROP_ANIMATION_MANAGER_MAX_ANIMATIONS               16
#define MAP_PROP_ANIMATION_MANAGER_MAX_BICYCLE_SLOPE_ANIMATIONS 2

#define MAP_PROP_ONE_SHOT_ANIMATION_MAX_ANIMATIONS 4

#define MAP_PROP_ONE_SHOT_ANIMATION_MAX_RENDER_OBJS 6

#define MAP_PROP_ONE_SHOT_ANIMATION_MANAGER_MAX_ITEMS 16

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
    NARC *animNARC;
    NARC *animListNARC;
    FieldSystemUnkSubCC_Sub0 *unk138;
} MapPropAnimationManager; // Size: 0x13C

typedef struct MapPropOneShotAnimationList {
    MapPropAnimationData *list[MAP_PROP_ONE_SHOT_ANIMATION_MAX_ANIMATIONS];
    int count;
} MapPropOneShotAnimationList;

typedef struct MapPropOneShotAnimation {
    MapPropOneShotAnimationList animations;
    NNSG3dRenderObj *mapPropRenderObjs[MAP_PROP_ONE_SHOT_ANIMATION_MAX_RENDER_OBJS]; // SubC?
    MapPropAnimationData *currentAnimation;
    int mapPropModelID;
    u8 tag;
    u8 unk35;
    u16 unk36;
} MapPropOneShotAnimation; // Size: 0x38 (at most)

typedef struct MapPropOneShotAnimationManager {
    MapPropOneShotAnimation items[MAP_PROP_ONE_SHOT_ANIMATION_MANAGER_MAX_ITEMS];
} MapPropOneShotAnimationManager; // Size: 0x380

MapPropAnimationManager *MapPropAnimationManager_Init(NARC *animListNARC, FieldSystemUnkSubC8 *unkSubC8);
BOOL MapPropAnimationManager_AddAnimationToRenderObj(const int mapPropModelID, const int mapPropAnimID, const BOOL isDeferred, NNSG3dRenderObj *renderObj, MapPropAnimationManager *manager);
void MapPropAnimationManager_UnloadAllAnimations(MapPropAnimationManager *manager);
void MapPropAnimationManager_RemoveAnimationFromRenderObj(MapPropAnimationManager *mapPropAnimationManager, NNSG3dRenderObj *renderObj, const int mapPropModelID, const int mapPropAnimIndex);
void MapPropAnimationManager_Free(MapPropAnimationManager *manager);
MapPropAnimationData *MapPropAnimationManager_GetAnimationData(const int mapPropModelID, const int mapPropAnimIndex, MapPropAnimationManager *mapPropAnimationManager);
void MapPropAnimationData_SetAnimationPaused(MapPropAnimationData *animation, const BOOL paused);
void MapPropAnimationData_GoToFirstAnimationFrame(MapPropAnimationData *animData);
void MapPropAnimationData_GoToLastAnimationFrame(MapPropAnimationData *animData);
void MapPropAnimationData_SetAnimationLoopCount(MapPropAnimationData *animation, int loopCount);
BOOL MapPropAnimationData_IsAnimationLoopFinished(MapPropAnimationData *animation);
int MapPropAnimationManager_GetAnimListNARCFileCount(MapPropAnimationManager *mapPropAnimationManager);
const u8 MapPropAnimationManager_GetPropAnimationCount(MapPropAnimationManager *manager, const int mapPropModelID);
MapPropOneShotAnimationManager *MapPropOneShotAnimationManager_New(void);
void MapPropOneShotAnimationManager_Free(MapPropOneShotAnimationManager **manager);
void MapPropOneShotAnimationManager_LoadPropAnimations(MapPropAnimationManager *animManager, MapPropOneShotAnimationManager *const oneShotAnimManager, const int tag, const int mapPropModelID, NNSG3dRenderObj *mapPropRenderObj, NNSG3dResMdl *mapPropModel, NNSG3dResTex *mapPropTexture, const int animationCount, const u8 animationLoopCount, const BOOL animationReversed);
void MapPropOneShotAnimationManager_SetAnimationRenderObj(MapPropOneShotAnimationManager *const oneShotAnimManager, const int tag, const u8 renderObjIndex, NNSG3dRenderObj *renderObj);
void MapPropOneShotAnimationManager_PlayAnimation(MapPropOneShotAnimationManager *const oneShotAnimManager, const int tag, const int mapPropAnimIndex);
void MapPropOneShotAnimationManager_PlayAnimationWithSoundEffect(MapPropOneShotAnimationManager *const oneShotAnimManager, const int tag, const int mapPropAnimIndex, const int sndseq);
void MapPropOneShotAnimationManager_UnloadAnimation(MapPropAnimationManager *animManager, MapPropOneShotAnimationManager *oneShotAnimManager, const int tag);
const BOOL MapPropOneShotAnimationManager_IsAnimationLoopFinished(MapPropOneShotAnimationManager *const oneShotAnimManager, const int tag);
const int MapPropOneShotAnimationManager_GetAnimationMapPropModelID(MapPropOneShotAnimationManager *const oneShotAnimManager, const int tag);
void ov01_021E8F3C(int fileCount, NNSG3dResMdl *resMdl, NNSG3dRenderObj *renderObj, NNSG3dResTex *resTex, MapPropAnimListFile *animListFile, MapPropAnimationManager *mapPropAnimationManager, FieldSystemUnkSub104 *unk104);
void ov01_021E90B0(MapPropOneShotAnimationManager *oneShotAnimManager, const int tag, u8 arg2);

#endif // POKEHEARTGOLD_FIELD_MAP_PROP_ANIMATION_H
