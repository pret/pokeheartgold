#include "field/map_prop_animation.h"
#include "field/overlay_01_02204004.h"

//#include "filesystem.h"
#include "global.h"

// Make static
BOOL BicycleSlopeAnimation_Load(BicycleSlopeAnimation *bicycleSlopeAnims, NNSG3dRenderObj *renderObj, MapPropAnimation *animation, const u8 animID);
void ov01_021E87A8(NARC *narc, FieldSystemUnkSubCC_Sub0 *unkCC_Sub0, MapPropAnimation *animation, int fileID, NNSG3dResMdl *resMdl, NNSG3dResTex *resTex);

BOOL BicycleSlopeAnimation_Load(BicycleSlopeAnimation *bicycleSlopeAnims, NNSG3dRenderObj *renderObj, MapPropAnimation *animation, const u8 animID) {
    int i;
    
    GF_ASSERT(ov01_02204554(animation) != -1); 
    
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
    GF_ASSERT(fileID != -1); // ANIME_ARCHIVE_ID_NONE?
    
    void *anim = NARC_AllocAndReadWholeMember(narc, fileID, HEAP_ID_FIELD1);
    
    GF_ASSERT(anim != NULL);
    
    ov01_02204470(unkCC_Sub0, animation, anim, resMdl, resTex);
}

MapPropAnimationManager *MapPropAnimationManager_Init(NARC *narc, FieldSystemUnkSubC8 *unkSubC8) {
    int i;
    MapPropAnimationManager *mapPropAnimationManager = Heap_Alloc(HEAP_ID_FIELD1, sizeof(MapPropAnimationManager));
    
    for(i = 0; i < MAP_PROP_ANIMATION_MANAGER_MAX_ANIMATIONS; i++) {
        mapPropAnimationManager->animations[i].unk4 = 0;
        mapPropAnimationManager->animations[i].unk8 = 0;
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
