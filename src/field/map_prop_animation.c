#include "field/map_prop_animation.h"
#include "field/overlay_01_02204004.h"

#include "global.h"

// Make static
void ov01_021E87A8(NARC *narc, FieldSystemUnkSubCC_Sub0 *unkCC_Sub0, MapPropAnimation *animation, int fileID, NNSG3dResMdl *resMdl, NNSG3dResTex *resTex);

BOOL BicycleSlopeAnimation_Load(BicycleSlopeAnimation *bicycleSlopeAnims, UnkStruct_FieldSysC0_SubC *unkC0_SubC, MapPropAnimation *animation, const u8 animID);

BOOL BicycleSlopeAnimation_Load(BicycleSlopeAnimation *bicycleSlopeAnims, UnkStruct_FieldSysC0_SubC *unkC0_SubC, MapPropAnimation *animation, const u8 animID) {
    int i;
    
    GF_ASSERT(MapPropAnimation_GetLoopCount(animation) != -1); 
    
    for (i = 0; i < MAP_PROP_ANIMATION_MANAGER_MAX_BICYCLE_SLOPE_ANIMATIONS; i++) {
        if (bicycleSlopeAnims[i].loaded && animID == bicycleSlopeAnims[i].animID && bicycleSlopeAnims[i].renderObj == &unkC0_SubC->renderObj) {
            return FALSE;
        }
    }
    
    for (i = 0; i < MAP_PROP_ANIMATION_MANAGER_MAX_BICYCLE_SLOPE_ANIMATIONS; i++) {
        if (bicycleSlopeAnims[i].loaded == FALSE) {
            bicycleSlopeAnims[i].loaded = TRUE;
            bicycleSlopeAnims[i].animID = animID;
            bicycleSlopeAnims[i].animation = animation;
            bicycleSlopeAnims[i].renderObj = &unkC0_SubC->renderObj;
            break;
        }
    }
    return TRUE;
}

// Some equivalent to pokeplatinum's MapPropAnimation_LoadAnimationObj.
void ov01_021E87A8(NARC *narc, FieldSystemUnkSubCC_Sub0 *unkCC_Sub0, MapPropAnimation *animation, int fileID, NNSG3dResMdl *resMdl, NNSG3dResTex *resTex) {
    GF_ASSERT(fileID != -1); // ANIME_ARCHIVE_ID_NONE?
    
    void *anim = NARC_AllocAndReadWholeMember(narc, fileID, HEAP_ID_FIELD1);
    
    GF_ASSERT(anim != NULL);
    
    ov01_02204470(unkCC_Sub0, animation, anim, resMdl, resTex);
}

MapPropAnimationManager *MapPropAnimationManager_Init(NARC *narc, FieldSystemUnkSubC8 *unkSubC8) {
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
    
    mapPropAnimationManager->unk130 = NARC_New(NARC_a_1_0_6, HEAP_ID_FIELD1);
    mapPropAnimationManager->unk134 = narc;
    mapPropAnimationManager->unk138 = ov01_022041D8(unkSubC8, HEAP_ID_FIELD1, 0x10);
    return mapPropAnimationManager;
}

// Make static
NNSG3dAnmObj *MapPropAnimation_GetAnimationObj(MapPropAnimation *animation);

NNSG3dAnmObj *MapPropAnimation_GetAnimationObj(MapPropAnimation *animation) {
    if (animation == NULL) {
        return NULL;
    }
    
    return animation->animObj;
}

// Make static
BOOL MapPropAnimation_CheckDeferredLoadingFlag(const u8 animationFlags);

BOOL MapPropAnimation_CheckDeferredLoadingFlag(const u8 animationFlags) {
    if (animationFlags == 8) return FALSE;
    
    BOOL deferredLoading = TRUE;
    if ((animationFlags & 1) != 1) deferredLoading = FALSE; // TODO: Flag name
    
    return deferredLoading;
}

// Make static
BOOL MapPropAnimation_CheckDeferredAddToRenderObjFlag(const u8 animationFlags);

BOOL MapPropAnimation_CheckDeferredAddToRenderObjFlag(const u8 animationFlags) {
    if (animationFlags == 8) return TRUE;
    
    return (((animationFlags >> 1) & 1) == 1);
}

// Make static
MapPropAnimationData *MapPropAnimationManager_LoadPropAnimationForOneShot(const int mapPropModelID, const int mapPropAnimIndex, const int animationLoopCount, const int arg3, const BOOL animationReversed, const BOOL animationPaused, const BOOL isDeferredLoading, NNSG3dResMdl *mapPropModel, NNSG3dResTex *mapPropTexture, MapPropAnimationManager *mapPropAnimationManager);

MapPropAnimationData *MapPropAnimationManager_LoadPropAnimationForOneShot(const int mapPropModelID, const int mapPropAnimIndex, const int animationLoopCount, const int arg3, const BOOL animationReversed, const BOOL animationPaused, const BOOL isDeferredLoading, NNSG3dResMdl *mapPropModel, NNSG3dResTex *mapPropTexture, MapPropAnimationManager *mapPropAnimationManager) {
    int i;

    MapPropAnimListFile animListFile;
    NARC_ReadWholeMember(mapPropAnimationManager->unk134, mapPropModelID, &animListFile); // animListNarc
    GF_ASSERT(mapPropAnimIndex < 4); // MAP_PROP_ANIM_LIST_FILE_ARCHIVE_IDS_COUNT
    
    int animArchiveID = animListFile.animArchiveIDs[mapPropAnimIndex];
    
    if (animArchiveID == -1) { // ANIM_ARCHIVE_ID_NONE
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
            ov01_022044C8(animation, animationLoopCount, animationPaused, animationReversed);
            mapPropAnimationManager->animations[i].animArchiveID = animArchiveID;
            mapPropAnimationManager->animations[i].unkC = arg3;
            // MapPropAnimation_LoadAnimationObj?
            ov01_021E87A8(mapPropAnimationManager->unk130, mapPropAnimationManager->unk138, animation, animArchiveID, mapPropModel, mapPropTexture);
            mapPropAnimationManager->animations[i].animation = animation;
            
            MapPropAnimation_GoToFirstFrame(mapPropAnimationManager->animations[i].animation);
            
            return &mapPropAnimationManager->animations[i];
        }
    }
    GF_ASSERT(FALSE);
    return NULL;
}

BOOL MapPropAnimationManager_AddAnimationToRenderObj(const int mapPropModelID, const int mapPropAnimID, const BOOL isDeferred, UnkStruct_FieldSysC0_SubC *unkC0_SubC, MapPropAnimationManager *manager) {
    if (manager == NULL) {
        GF_ASSERT(FALSE);
        return FALSE;
    } else if (mapPropModelID >= MapPropAnimationManager_GetAnimListNARCFileCount(manager)) {
        return FALSE;
    }

    MapPropAnimListFile animListFile;
    NARC_ReadWholeMember(manager->unk134, mapPropModelID, &animListFile);
    GF_ASSERT(mapPropAnimID < MAP_PROP_ANIM_LIST_FILE_ARCHIVE_IDS_COUNT);

    int animArchiveID = animListFile.animArchiveIDs[mapPropAnimID];
    
    if (animArchiveID == -1) {
        return FALSE;
    } else if (isDeferred != MapPropAnimation_CheckDeferredAddToRenderObjFlag(animListFile.flags)) {
        return FALSE;
    }
    
    for (int i = 0; i < MAP_PROP_ANIMATION_MANAGER_MAX_ANIMATIONS; i++) {
        if (animArchiveID == manager->animations[i].animArchiveID) {
            BOOL addAnimationObj = animListFile.isBicycleSlope ? BicycleSlopeAnimation_Load(manager->bicycleSlopeAnimations, unkC0_SubC, manager->animations[i].animation, animArchiveID) : TRUE;
            if (addAnimationObj) {
                ov01_0220450C(unkC0_SubC, manager->animations[i].animation);
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

// Make static
void MapPropAnimationManager_UnloadAnimation(MapPropAnimationData *animationData, MapPropAnimationManager *manager);

void MapPropAnimationManager_UnloadAnimation(MapPropAnimationData *animationData, MapPropAnimationManager *manager) {
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

void MapPropAnimationManager_RemoveAnimationFromRenderObj(MapPropAnimationManager *mapPropAnimationManager, UnkStruct_FieldSysC0_SubC *unkC0_SubC, const int mapPropModelID, const int mapPropAnimIndex) {
    MapPropAnimListFile animListFile;
    NARC_ReadWholeMember(mapPropAnimationManager->unk134, mapPropModelID, &animListFile);
    
    GF_ASSERT(mapPropAnimIndex < MAP_PROP_ANIM_LIST_FILE_ARCHIVE_IDS_COUNT);
    int animArchiveID = animListFile.animArchiveIDs[mapPropAnimIndex];
    GF_ASSERT(animArchiveID != -1); // ANIME_ARCHIVE_ID_NONE
    
    for (u8 i = 0; i < MAP_PROP_ANIMATION_MANAGER_MAX_ANIMATIONS; i++) {
        if (mapPropAnimationManager->animations[i].loaded == TRUE && animArchiveID == mapPropAnimationManager->animations[i].animArchiveID) {
            ov01_02204518(unkC0_SubC, mapPropAnimationManager->animations[i].animation);
            return;
        }
    }
}

void MapPropAnimationManager_Free(MapPropAnimationManager *manager) {
    if (manager == NULL) {
        return;
    }
    NARC_Delete(manager->unk130);
    Heap_Free(manager);
}

MapPropAnimationData *MapPropAnimationManager_GetAnimationData(const int mapPropModelID, const int mapPropAnimIndex, MapPropAnimationManager *manager) {
    MapPropAnimListFile animListFile;

    NARC_ReadWholeMember(manager->unk134, mapPropModelID, &animListFile);
    
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
    return NARC_GetFileCount(manager->unk134);
}

const u8 MapPropAnimationManager_GetPropAnimationCount(MapPropAnimationManager *manager, const int mapPropModelID) {
    u8 i;
    MapPropAnimListFile animListFile;
    NARC_ReadWholeMember(manager->unk134, mapPropModelID, &animListFile);

    // TODO: Check if plat's oversight preventing this from triggering still exists.
    if (!animListFile.hasAnimations) {
        return 0;
    }

    for (i = 0; i < MAP_PROP_ANIM_LIST_FILE_ARCHIVE_IDS_COUNT; i++) {
        if (animListFile.animArchiveIDs[i] == -1) { // ANIM_ARCHIVE_ID_NONE
            break;
        }
    }

    return i;
}

// Make static
MapPropOneShotAnimation *MapPropOneShotAnimationManager_AllocateAnimation(MapPropOneShotAnimationManager *manager, const u8 tag);

MapPropOneShotAnimation *MapPropOneShotAnimationManager_AllocateAnimation(MapPropOneShotAnimationManager *manager, const u8 tag) {
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

// Make static
void MapPropOneShotAnimation_Reset(MapPropOneShotAnimation *oneShotAnimation);

void MapPropOneShotAnimation_Reset(MapPropOneShotAnimation *oneShotAnimation) {
    oneShotAnimation->tag = 0;
    oneShotAnimation->mapPropModelID = 0;
    oneShotAnimation->currentAnimation = NULL;

    for (u8 i = 0; i < MAP_PROP_ONE_SHOT_ANIMATION_MAX_RENDER_OBJS; i++) {
        oneShotAnimation->mapPropRenderObjs[i] = NULL;
    }
}

// Make static
MapPropOneShotAnimation *MapPropOneShotAnimationManager_GetAnimation(MapPropOneShotAnimationManager *manager, const int tag);

MapPropOneShotAnimation *MapPropOneShotAnimationManager_GetAnimation(MapPropOneShotAnimationManager *manager, const int tag) {
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

// Make static
void MapPropOneShotAnimation_Init(NNSG3dRenderObj *mapPropRenderObj, const int animationCount, MapPropOneShotAnimation *oneShotAnimation);

void MapPropOneShotAnimation_Init(NNSG3dRenderObj *mapPropRenderObj, const int animationCount, MapPropOneShotAnimation *oneShotAnimation) {
    GF_ASSERT(animationCount <= MAP_PROP_ONE_SHOT_ANIMATION_MAX_ANIMATIONS);

    if (mapPropRenderObj != NULL) {
        oneShotAnimation->mapPropRenderObjs[0] = mapPropRenderObj;
    }
    
    oneShotAnimation->animations.count = animationCount;
}

// Make static
void MapPropOneShotAnimation_SetAnimation(MapPropOneShotAnimation *oneShotAnimation, const int mapPropAnimIndex, MapPropAnimation *animation);

void MapPropOneShotAnimation_SetAnimation(MapPropOneShotAnimation *oneShotAnimation, const int mapPropAnimIndex, MapPropAnimation *animation) {
    GF_ASSERT(mapPropAnimIndex < oneShotAnimation->animations.count);
    oneShotAnimation->animations.list[mapPropAnimIndex] = animation;
}