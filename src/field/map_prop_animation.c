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
