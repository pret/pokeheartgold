#include "field/map_prop_animation.h"
#include "field/overlay_01_02204004.h"

#include "unk_02005D10.h"

#include "constants/sndseq.h"

#include "global.h"

#define ANIM_ARCHIVE_ID_NONE -1

static void ov01_021E87A8(NARC *narc, FieldSystemUnkSubCC_Sub0 *unkCC_Sub0, MapPropAnimation *animation, int fileID, NNSG3dResMdl *resMdl, NNSG3dResTex *resTex);

static BOOL BicycleSlopeAnimation_Load(BicycleSlopeAnimation *bicycleSlopeAnims, NNSG3dRenderObj *renderObj, MapPropAnimation *animation, const u8 animID) {
    int i;
    
    GF_ASSERT(MapPropAnimation_GetLoopCount(animation) != -1); 
    
    for (i = 0; i < MAP_PROP_ANIMATION_MANAGER_MAX_BICYCLE_SLOPE_ANIMATIONS; i++) {
        if (bicycleSlopeAnims[i].loaded && animID == bicycleSlopeAnims[i].animID && bicycleSlopeAnims[i].renderObj == renderObj) {
            return FALSE;
        }
    }
    
    for (i = 0; i < MAP_PROP_ANIMATION_MANAGER_MAX_BICYCLE_SLOPE_ANIMATIONS; i++) {
        if (bicycleSlopeAnims[i].loaded == FALSE) {
            bicycleSlopeAnims[i].loaded = TRUE;
            bicycleSlopeAnims[i].animID = animID;
            bicycleSlopeAnims[i].animation = animation;
            bicycleSlopeAnims[i].renderObj = renderObj;
            break;
        }
    }
    return TRUE;
}

// Some equivalent to pokeplatinum's MapPropAnimation_LoadAnimationObj.
void ov01_021E87A8(NARC *narc, FieldSystemUnkSubCC_Sub0 *unkCC_Sub0, MapPropAnimation *animation, int fileID, NNSG3dResMdl *resMdl, NNSG3dResTex *resTex) {
    GF_ASSERT(fileID != ANIM_ARCHIVE_ID_NONE);
    
    void *anim = NARC_AllocAndReadWholeMember(narc, fileID, HEAP_ID_FIELD1);
    
    GF_ASSERT(anim != NULL);
    
    ov01_02204470(unkCC_Sub0, animation, anim, resMdl, resTex);
}

MapPropAnimationManager *MapPropAnimationManager_Init(NARC *animListNARC, FieldSystemUnkSubC8 *unkSubC8) {
    int i;
    MapPropAnimationManager *mapPropAnimationManager = Heap_Alloc(HEAP_ID_FIELD1, sizeof(MapPropAnimationManager));
    
    for(i = 0; i < MAP_PROP_ANIMATION_MANAGER_MAX_ANIMATIONS; i++) {
        mapPropAnimationManager->animations[i].loaded = FALSE;
        mapPropAnimationManager->animations[i].animArchiveID = 0;
        mapPropAnimationManager->animations[i].unkC = 0;
    }
    
    for(i = 0; i < MAP_PROP_ANIMATION_MANAGER_MAX_BICYCLE_SLOPE_ANIMATIONS; i++) {
        mapPropAnimationManager->bicycleSlopeAnimations[i].loaded = FALSE;
        mapPropAnimationManager->bicycleSlopeAnimations[i].renderObj = NULL;
        mapPropAnimationManager->bicycleSlopeAnimations[i].animation = NULL;
        mapPropAnimationManager->bicycleSlopeAnimations[i].animID = 0;
    }
    
    mapPropAnimationManager->animNARC = NARC_New(NARC_a_1_0_6, HEAP_ID_FIELD1);
    mapPropAnimationManager->animListNARC = animListNARC;
    mapPropAnimationManager->unk138 = ov01_022041D8(unkSubC8, HEAP_ID_FIELD1, 0x10);
    return mapPropAnimationManager;
}

static MapPropAnimation *MapPropAnimationData_GetAnimation(MapPropAnimationData *animData) {
    if (animData == NULL) {
        return NULL;
    }
    
    return animData->animation;
}

static BOOL MapPropAnimation_CheckDeferredLoadingFlag(const u8 animationFlags) {
    if (animationFlags == (1 << 3)) return FALSE;
    
    BOOL deferredLoading = TRUE;
    if ((animationFlags & 1) != 1) deferredLoading = FALSE; // TODO: Flag name
    
    return deferredLoading;
}

static BOOL MapPropAnimation_CheckDeferredAddToRenderObjFlag(const u8 animationFlags) {
    if (animationFlags == (1 << 3)) return TRUE;
    
    return (((animationFlags >> 1) & 1) == 1);
}

static MapPropAnimationData *MapPropAnimationManager_LoadPropAnimationForOneShot(const int mapPropModelID, const int mapPropAnimIndex, const int animationLoopCount, const int arg3, const BOOL animationReversed, const BOOL animationPaused, const BOOL isDeferredLoading, NNSG3dResMdl *mapPropModel, NNSG3dResTex *mapPropTexture, MapPropAnimationManager *mapPropAnimationManager) {
    int i;

    MapPropAnimListFile animListFile;
    NARC_ReadWholeMember(mapPropAnimationManager->animListNARC, mapPropModelID, &animListFile);
    GF_ASSERT(mapPropAnimIndex < MAP_PROP_ANIM_LIST_FILE_ARCHIVE_IDS_COUNT);
    
    int animArchiveID = animListFile.animArchiveIDs[mapPropAnimIndex];
    
    if (animArchiveID == ANIM_ARCHIVE_ID_NONE) {
        return NULL;
    } else if (MapPropAnimation_CheckDeferredLoadingFlag(animListFile.flags) != isDeferredLoading) {
        return NULL;
    }
    
    for (i = 0; i < MAP_PROP_ANIMATION_MANAGER_MAX_ANIMATIONS; i++) {
        GF_ASSERT(arg3 == 0 || arg3 != mapPropAnimationManager->animations[i].unkC); // pastoriaGymButtonGroup-- What is this in HGSS?
    }

    for (i = 0; i < MAP_PROP_ANIMATION_MANAGER_MAX_ANIMATIONS; i++) {
        if (!mapPropAnimationManager->animations[i].loaded) {
            mapPropAnimationManager->animations[i].loaded = TRUE;
            MapPropAnimation *animation = ov01_022042FC(mapPropAnimationManager->unk138);
            GF_ASSERT(animation != NULL);
            MapPropAnimation_Init(animation, animationLoopCount, animationPaused, animationReversed);
            mapPropAnimationManager->animations[i].animArchiveID = animArchiveID;
            mapPropAnimationManager->animations[i].unkC = arg3;
            // MapPropAnimation_LoadAnimationObj?
            ov01_021E87A8(mapPropAnimationManager->animNARC, mapPropAnimationManager->unk138, animation, animArchiveID, mapPropModel, mapPropTexture);
            mapPropAnimationManager->animations[i].animation = animation;
            
            MapPropAnimation_GoToFirstFrame(mapPropAnimationManager->animations[i].animation);
            
            return &mapPropAnimationManager->animations[i];
        }
    }
    GF_ASSERT(FALSE);
    return NULL;
}

BOOL MapPropAnimationManager_AddAnimationToRenderObj(const int mapPropModelID, const int mapPropAnimID, const BOOL isDeferred, NNSG3dRenderObj *renderObj, MapPropAnimationManager *manager) {
    if (manager == NULL) {
        GF_ASSERT(FALSE);
        return FALSE;
    } else if (mapPropModelID >= MapPropAnimationManager_GetAnimListNARCFileCount(manager)) {
        return FALSE;
    }

    MapPropAnimListFile animListFile;
    NARC_ReadWholeMember(manager->animListNARC, mapPropModelID, &animListFile);
    GF_ASSERT(mapPropAnimID < MAP_PROP_ANIM_LIST_FILE_ARCHIVE_IDS_COUNT);

    int animArchiveID = animListFile.animArchiveIDs[mapPropAnimID];
    
    if (animArchiveID == ANIM_ARCHIVE_ID_NONE) {
        return FALSE;
    } else if (isDeferred != MapPropAnimation_CheckDeferredAddToRenderObjFlag(animListFile.flags)) {
        return FALSE;
    }
    
    for (int i = 0; i < MAP_PROP_ANIMATION_MANAGER_MAX_ANIMATIONS; i++) {
        if (animArchiveID == manager->animations[i].animArchiveID) {
            BOOL addAnimationObj = animListFile.isBicycleSlope ? BicycleSlopeAnimation_Load(manager->bicycleSlopeAnimations, renderObj, manager->animations[i].animation, animArchiveID) : TRUE;
            if (addAnimationObj) {
                MapPropAnimation_AddToRenderObj(renderObj, manager->animations[i].animation);
            }
            return TRUE;
        }
    }
    return FALSE;
}

void MapPropAnimationManager_UnloadAllAnimations(MapPropAnimationManager *manager) {
    if (manager == NULL) {
        return;
    }

    for (int i = 0; i < MAP_PROP_ANIMATION_MANAGER_MAX_ANIMATIONS; i++) {
        if (manager->animations[i].loaded) {
            if (manager->animations[i].loaded == TRUE) {
                manager->animations[i].animation = NULL;
            }
            manager->animations[i].loaded = FALSE;
            manager->animations[i].unkC = 0;
        }
    }
}

static void MapPropAnimationManager_UnloadAnimation(MapPropAnimationData *animationData, MapPropAnimationManager *manager) {
    if (manager == NULL) {
        return;
    }

    GF_ASSERT(animationData != NULL);

    if (animationData->loaded) {
        if (animationData->loaded == TRUE) { // Technically different than the check above, but the same in practice.
            ov01_02204500(manager->unk138, animationData->animation);
            ov01_0220431C(manager->unk138, animationData->animation);
        }
        animationData->loaded = FALSE;
        animationData->unkC = 0;
    }
}

void MapPropAnimationManager_RemoveAnimationFromRenderObj(MapPropAnimationManager *mapPropAnimationManager, NNSG3dRenderObj *renderObj, const int mapPropModelID, const int mapPropAnimIndex) {
    MapPropAnimListFile animListFile;
    NARC_ReadWholeMember(mapPropAnimationManager->animListNARC, mapPropModelID, &animListFile);
    
    GF_ASSERT(mapPropAnimIndex < MAP_PROP_ANIM_LIST_FILE_ARCHIVE_IDS_COUNT);
    int animArchiveID = animListFile.animArchiveIDs[mapPropAnimIndex];
    GF_ASSERT(animArchiveID != ANIM_ARCHIVE_ID_NONE);
    
    for (u8 i = 0; i < MAP_PROP_ANIMATION_MANAGER_MAX_ANIMATIONS; i++) {
        if (mapPropAnimationManager->animations[i].loaded == TRUE && animArchiveID == mapPropAnimationManager->animations[i].animArchiveID) {
            MapPropAnimation_RemoveFromRenderObj(renderObj, mapPropAnimationManager->animations[i].animation);
            return;
        }
    }
}

void MapPropAnimationManager_Free(MapPropAnimationManager *manager) {
    if (manager == NULL) {
        return;
    }
    NARC_Delete(manager->animNARC);
    Heap_Free(manager);
}

MapPropAnimationData *MapPropAnimationManager_GetAnimationData(const int mapPropModelID, const int mapPropAnimIndex, MapPropAnimationManager *manager) {
    MapPropAnimListFile animListFile;

    NARC_ReadWholeMember(manager->animListNARC, mapPropModelID, &animListFile);
    
    GF_ASSERT(mapPropAnimIndex < MAP_PROP_ANIM_LIST_FILE_ARCHIVE_IDS_COUNT);
    
    u32 animArchiveID = animListFile.animArchiveIDs[mapPropAnimIndex];
    MapPropAnimationData *animationData = NULL;
    
    for (int i = 0; i < MAP_PROP_ANIMATION_MANAGER_MAX_ANIMATIONS; i++) {
        if (manager->animations[i].animArchiveID == animArchiveID) {
            animationData = &manager->animations[i];
            GF_ASSERT(animationData->loaded);
            break;
        }
    }
    GF_ASSERT(animationData != NULL);
    return animationData;
}

void MapPropAnimationData_SetAnimationPaused(MapPropAnimationData *animData, const BOOL paused) {
    MapPropAnimation_SetPaused(animData->animation, paused);
}

void MapPropAnimationData_GoToFirstAnimationFrame(MapPropAnimationData *animData) {
    MapPropAnimation_GoToFirstFrame(animData->animation);
}

void MapPropAnimationData_GoToLastAnimationFrame(MapPropAnimationData *animData) {
    MapPropAnimation_GoToLastFrame(animData->animation);
}

void MapPropAnimationData_SetAnimationLoopCount(MapPropAnimationData *animData, int loopCount) {
    MapPropAnimation_SetLoopCount(animData->animation, loopCount);
}

BOOL MapPropAnimationData_IsAnimationLoopFinished(MapPropAnimationData *animData) {
    return MapPropAnimation_IsLoopFinished(animData->animation);
}

int MapPropAnimationManager_GetAnimListNARCFileCount(MapPropAnimationManager *manager) {
    return NARC_GetFileCount(manager->animListNARC);
}

const u8 MapPropAnimationManager_GetPropAnimationCount(MapPropAnimationManager *manager, const int mapPropModelID) {
    u8 i;
    MapPropAnimListFile animListFile;
    NARC_ReadWholeMember(manager->animListNARC, mapPropModelID, &animListFile);

    // TODO: Check if plat's oversight preventing this from triggering still exists.
    if (!animListFile.hasAnimations) {
        return 0;
    }

    for (i = 0; i < MAP_PROP_ANIM_LIST_FILE_ARCHIVE_IDS_COUNT; i++) {
        if (animListFile.animArchiveIDs[i] == ANIM_ARCHIVE_ID_NONE) {
            break;
        }
    }

    return i;
}

static MapPropOneShotAnimation *MapPropOneShotAnimationManager_AllocateAnimation(MapPropOneShotAnimationManager *manager, const u8 tag) {
    u8 i;

    GF_ASSERT(tag != 0);
    u8 itemIndex = MAP_PROP_ONE_SHOT_ANIMATION_MANAGER_MAX_ITEMS;

    for (i = 0; i < MAP_PROP_ONE_SHOT_ANIMATION_MANAGER_MAX_ITEMS; i++) {
        if (itemIndex == MAP_PROP_ONE_SHOT_ANIMATION_MANAGER_MAX_ITEMS && manager->items[i].tag == 0) {
            itemIndex = i;
        }
    }
    if (itemIndex != MAP_PROP_ONE_SHOT_ANIMATION_MANAGER_MAX_ITEMS) {
        manager->items[itemIndex].tag = tag;
        manager->items[itemIndex].unk35 = 0;
    } else {
        GF_ASSERT(FALSE);
        return NULL;
    }
    return &manager->items[itemIndex];
}

static void MapPropOneShotAnimation_Reset(MapPropOneShotAnimation *oneShotAnimation) {
    oneShotAnimation->tag = 0;
    oneShotAnimation->mapPropModelID = 0;
    oneShotAnimation->currentAnimation = NULL;

    for (u8 i = 0; i < MAP_PROP_ONE_SHOT_ANIMATION_MAX_RENDER_OBJS; i++) {
        oneShotAnimation->mapPropRenderObjs[i] = NULL;
    }
}

static MapPropOneShotAnimation *MapPropOneShotAnimationManager_GetAnimation(MapPropOneShotAnimationManager *manager, const int tag) {
    int i;
    MapPropOneShotAnimation *oneShotAnimation = NULL;

    for (i = 0; i < MAP_PROP_ONE_SHOT_ANIMATION_MANAGER_MAX_ITEMS; i++) {
        if (manager->items[i].tag == tag) {
            oneShotAnimation = &manager->items[i];
            break;
        }
    }
    return oneShotAnimation;
}

static void MapPropOneShotAnimation_Init(NNSG3dRenderObj *mapPropRenderObj, const int animationCount, MapPropOneShotAnimation *oneShotAnimation) {
    GF_ASSERT(animationCount <= MAP_PROP_ONE_SHOT_ANIMATION_MAX_ANIMATIONS);

    if (mapPropRenderObj != NULL) {
        oneShotAnimation->mapPropRenderObjs[0] = mapPropRenderObj;
    }
    
    oneShotAnimation->animations.count = animationCount;
}

static void MapPropOneShotAnimation_SetAnimation(MapPropOneShotAnimation *oneShotAnimation, const int mapPropAnimIndex, MapPropAnimationData *animData) {
    GF_ASSERT(mapPropAnimIndex < oneShotAnimation->animations.count);
    oneShotAnimation->animations.list[mapPropAnimIndex] = animData;
}

static MapPropAnimationData *MapPropOneShotAnimation_SwitchAnimation(MapPropOneShotAnimation *oneShotAnimation, const int mapPropAnimIndex) {
    GF_ASSERT(mapPropAnimIndex < oneShotAnimation->animations.count);

    MapPropAnimationData *newAnimData = oneShotAnimation->animations.list[mapPropAnimIndex];
    MapPropAnimation *newAnimation = MapPropAnimationData_GetAnimation(newAnimData);
    MapPropAnimation *currentAnimation = MapPropAnimationData_GetAnimation(oneShotAnimation->currentAnimation);

    for (u8 i = 0; i < MAP_PROP_ONE_SHOT_ANIMATION_MAX_RENDER_OBJS; i++) {
        if (oneShotAnimation->mapPropRenderObjs[i] != NULL) {
            MapPropAnimation_RemoveFromRenderObj(oneShotAnimation->mapPropRenderObjs[i], currentAnimation);
            MapPropAnimation_AddToRenderObj(oneShotAnimation->mapPropRenderObjs[i], newAnimation);
        }
    }

    oneShotAnimation->currentAnimation = newAnimData;
    return newAnimData;
}

static void MapPropOneShotAnimation_LoadPropAnimations(const int mapPropModelID, NNSG3dResMdl *mapPropModel, NNSG3dResTex *mapPropTexture, const int animationCount, const int animationLoopCount, const BOOL animationReversed, MapPropAnimationManager *manager, MapPropOneShotAnimation *oneShotAnimation) {
    for (int index = 0; index < animationCount; index++) {
        MapPropAnimationData *animData = MapPropAnimationManager_LoadPropAnimationForOneShot(mapPropModelID, index, animationLoopCount, 0, animationReversed, TRUE, TRUE, mapPropModel, mapPropTexture, manager);
        GF_ASSERT(animData != NULL);
        MapPropOneShotAnimation_SetAnimation(oneShotAnimation, index, animData);
    }
}

static void MapPropAnimationManager_UnloadOneShotAnimation(MapPropAnimationManager *manager, MapPropOneShotAnimation *oneShotAnimation) {
    int i;
    MapPropAnimation *animation = MapPropAnimationData_GetAnimation(oneShotAnimation->currentAnimation);

    for (i = 0; i < MAP_PROP_ONE_SHOT_ANIMATION_MAX_RENDER_OBJS; i++) {
        if (oneShotAnimation->mapPropRenderObjs[i] != NULL) {
            MapPropAnimation_RemoveFromRenderObj(oneShotAnimation->mapPropRenderObjs[i], animation);
        }
    }

    for (i = 0; i < oneShotAnimation->animations.count; i++) {
        MapPropAnimationManager_UnloadAnimation(oneShotAnimation->animations.list[i], manager);
        oneShotAnimation->animations.list[i] = NULL;
    }
}

MapPropOneShotAnimationManager *MapPropOneShotAnimationManager_New(void) {
    MapPropOneShotAnimationManager *manager = Heap_Alloc(HEAP_ID_FIELD1, sizeof(MapPropOneShotAnimationManager));
    MIi_CpuClearFast(0, (u32*)manager, sizeof(MapPropOneShotAnimationManager));
    return manager;
}

void MapPropOneShotAnimationManager_Free(MapPropOneShotAnimationManager **manager) {
    if (*manager == NULL) {
        return;
    }
    Heap_Free(*manager);
    *manager = NULL;
}

void MapPropOneShotAnimationManager_LoadPropAnimations(MapPropAnimationManager *animManager, MapPropOneShotAnimationManager *const oneShotAnimManager, const int tag, const int mapPropModelID, NNSG3dRenderObj *mapPropRenderObj, NNSG3dResMdl *mapPropModel, NNSG3dResTex *mapPropTexture, const int animationCount, const u8 animationLoopCount, const BOOL animationReversed) {
    u8 fixedAnimationLoopCount;
    MapPropOneShotAnimation *oneShotAnimation = MapPropOneShotAnimationManager_AllocateAnimation(oneShotAnimManager, tag);
    
    if (!oneShotAnimation) {
        GF_ASSERT(FALSE);
        return;
    }

    MapPropOneShotAnimation_Init(mapPropRenderObj, animationCount, oneShotAnimation);

    fixedAnimationLoopCount = animationLoopCount;
    GF_ASSERT(fixedAnimationLoopCount != 0);

    if (fixedAnimationLoopCount == 0) {
        fixedAnimationLoopCount = 1;
    }
    
    MapPropOneShotAnimation_LoadPropAnimations(mapPropModelID, mapPropModel, mapPropTexture, animationCount, fixedAnimationLoopCount, animationReversed, animManager, oneShotAnimation);
    oneShotAnimation->mapPropModelID = mapPropModelID;
}

void MapPropOneShotAnimationManager_SetAnimationRenderObj(MapPropOneShotAnimationManager *const oneShotAnimManager, const int tag, const u8 renderObjIndex, NNSG3dRenderObj *renderObj) {
    GF_ASSERT(renderObjIndex < MAP_PROP_ONE_SHOT_ANIMATION_MAX_RENDER_OBJS);
    MapPropOneShotAnimation *oneShotAnimation = MapPropOneShotAnimationManager_GetAnimation(oneShotAnimManager, tag);

    GF_ASSERT(oneShotAnimation->mapPropRenderObjs[renderObjIndex] == NULL);
    oneShotAnimation->mapPropRenderObjs[renderObjIndex] = renderObj;
}

void MapPropOneShotAnimationManager_PlayAnimation(MapPropOneShotAnimationManager *const oneShotAnimManager, const int tag, const int mapPropAnimIndex) {
    GF_ASSERT(tag != 0);

    MapPropOneShotAnimation *oneShotAnimation = MapPropOneShotAnimationManager_GetAnimation(oneShotAnimManager, tag);
    MapPropAnimationData *animData = MapPropOneShotAnimation_SwitchAnimation(oneShotAnimation, mapPropAnimIndex);

    MapPropAnimationData_SetAnimationPaused(animData, FALSE);
}

void MapPropOneShotAnimationManager_PlayAnimationWithSoundEffect(MapPropOneShotAnimationManager *const oneShotAnimManager, const int tag, const int mapPropAnimIndex, const int sndseq) {
    GF_ASSERT(tag != 0);

    MapPropOneShotAnimation *oneShotAnimation = MapPropOneShotAnimationManager_GetAnimation(oneShotAnimManager, tag);
    MapPropAnimationData *animData = MapPropOneShotAnimation_SwitchAnimation(oneShotAnimation, mapPropAnimIndex);

    if (sndseq != SEQ_NONE) {
        PlaySE(sndseq);
    }

    MapPropAnimationData_SetAnimationPaused(animData, FALSE);
}

void MapPropOneShotAnimationManager_UnloadAnimation(MapPropAnimationManager *animManager, MapPropOneShotAnimationManager *oneShotAnimManager, const int tag) {
    GF_ASSERT(tag != 0);
    MapPropOneShotAnimation *oneShotAnimation = MapPropOneShotAnimationManager_GetAnimation(oneShotAnimManager, tag);

    MapPropAnimationManager_UnloadOneShotAnimation(animManager, oneShotAnimation);
    MapPropOneShotAnimation_Reset(oneShotAnimation);
}

static MapPropAnimationData *MapPropOneShotAnimationManager_GetCurrentAnimation(MapPropOneShotAnimationManager *const oneShotAnimManager, const int tag) {
    GF_ASSERT(tag != 0);

    MapPropOneShotAnimation *oneShotAnimation = MapPropOneShotAnimationManager_GetAnimation(oneShotAnimManager, tag);
    return oneShotAnimation->currentAnimation;
}

const BOOL MapPropOneShotAnimationManager_IsAnimationLoopFinished(MapPropOneShotAnimationManager *const oneShotAnimManager, const int tag) {
    MapPropAnimationData *animData = MapPropOneShotAnimationManager_GetCurrentAnimation(oneShotAnimManager, tag);
    GF_ASSERT(animData != NULL);

    return MapPropAnimation_IsLoopFinished(animData->animation) != FALSE;
}

const int MapPropOneShotAnimationManager_GetAnimationMapPropModelID(MapPropOneShotAnimationManager *const oneShotAnimManager, const int tag) {
    MapPropOneShotAnimation *oneShotAnimation = MapPropOneShotAnimationManager_GetAnimation(oneShotAnimManager, tag);
    return oneShotAnimation->mapPropModelID;
}

void ov01_021E8F3C(int fileCount, NNSG3dResMdl *resMdl, NNSG3dRenderObj *renderObj, NNSG3dResTex *resTex, MapPropAnimListFile *animListFile, MapPropAnimationManager *mapPropAnimationManager, FieldSystemUnkSub104 *unk104) {
    int archiveID;
    int i, j;
    u8 k = 0;
    MapPropAnimation *timeOfDayAnimations[4];
    if (fileCount >= MapPropAnimationManager_GetAnimListNARCFileCount(mapPropAnimationManager)) {
        return;
    }
    if (!animListFile->hasAnimations) {
        return;
    }
    
    for (i = 0; i < MAP_PROP_ANIM_LIST_FILE_ARCHIVE_IDS_COUNT; i++) {
        archiveID = animListFile->animArchiveIDs[i];
        if (archiveID == ANIM_ARCHIVE_ID_NONE || MapPropAnimation_CheckDeferredLoadingFlag(animListFile->flags) != 0) {
            return;
        }
        
        BOOL notDeferred = MapPropAnimation_CheckDeferredAddToRenderObjFlag(animListFile->flags) == FALSE;
        for (j = 0; j < MAP_PROP_ANIMATION_MANAGER_MAX_ANIMATIONS; j++) {
            if (mapPropAnimationManager->animations[j].loaded) continue;
                    
            mapPropAnimationManager->animations[j].loaded = TRUE;
                    
            MapPropAnimation *mapPropAnimation = ov01_022042FC(mapPropAnimationManager->unk138);
    
            GF_ASSERT(mapPropAnimation != NULL);
    
            if (animListFile->isBicycleSlope) {
                MapPropAnimation_Init(mapPropAnimation, 1, TRUE, FALSE);
            } else {
                MapPropAnimation_Init(mapPropAnimation, -1, FALSE, FALSE);
            }
                    
            mapPropAnimationManager->animations[j].animArchiveID = archiveID;
            mapPropAnimationManager->animations[j].unkC = FALSE;
            ov01_021E87A8(mapPropAnimationManager->animNARC, mapPropAnimationManager->unk138, mapPropAnimation, archiveID, resMdl, resTex);
            mapPropAnimationManager->animations[j].animation = mapPropAnimation;
            MapPropAnimation_GoToFirstFrame(mapPropAnimationManager->animations[j].animation);
                
            if (notDeferred) {
                BOOL addToRenderObj;
                if (animListFile->isBicycleSlope) {
                    addToRenderObj = BicycleSlopeAnimation_Load(mapPropAnimationManager->bicycleSlopeAnimations, renderObj, mapPropAnimationManager->animations[j].animation, archiveID);
                } else {
                    addToRenderObj = TRUE;
                }
                
                if (addToRenderObj) {
                    MapPropAnimation_AddToRenderObj(renderObj, mapPropAnimationManager->animations[j].animation);
                }
            } else if (animListFile->flags == (1 << 3)) {
                timeOfDayAnimations[k++] = mapPropAnimationManager->animations[j].animation;
            }
            break;
        }
        GF_ASSERT(j != MAP_PROP_ANIMATION_MANAGER_MAX_ANIMATIONS);
    }
        
    if (animListFile->flags == (1 << 3)) {
        MapPropAnimation_AddToRenderObj(renderObj, timeOfDayAnimations[ov01_02204834(unk104)]); // FieldSystemUnkSub104_GetTimeOfDayVisualState
        ov01_0220476C(unk104, renderObj, &timeOfDayAnimations[0], 4);
    }
}

void ov01_021E90B0(MapPropOneShotAnimationManager *oneShotAnimManager, const int tag, u8 arg2) {
    MapPropOneShotAnimation *oneShotAnimation = MapPropOneShotAnimationManager_GetAnimation(oneShotAnimManager, tag);
    oneShotAnimation->unk35 = arg2;
}
