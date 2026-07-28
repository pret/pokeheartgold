#ifndef POKEHEARTGOLD_FIELD_FIELD_SPRITE_MANAGER_H
#define POKEHEARTGOLD_FIELD_FIELD_SPRITE_MANAGER_H

#include "sprite.h"
#include "sprite_system.h"
#include "unk_02009D48.h"

typedef struct FieldSpriteManager {
    SpriteList *spriteList;
    G2dRenderer renderer;
    SpriteResourceHeaderList *spriteResourceHeaderList;
    GF_2DGfxResMan *spriteResManagers[GF_GFX_RES_TYPE_MAX];
    GF_2DGfxResObjList *spriteResObjLists[GF_GFX_RES_TYPE_MAX];
    u16 numResMans;
    u16 heapID;
} FieldSpriteManager;

// With these functions, the SpriteResourceHeaderList is owned by the FieldSpriteManager.
void FieldSpriteManager_InitWithResDat(FieldSpriteManager *fieldSpriteManager, const ResdatIdList *resDatIdxs, int numSprites, enum HeapID heapID);
void FieldSpriteManager_ReleaseWithResDat(FieldSpriteManager *fieldSpriteManager);
Sprite *FieldSpriteManager_CreateSprite(FieldSpriteManager *fieldSpriteManager, const UnmanagedSpriteTemplate *unmanagedSpriteTemplate);

// With these functions, a new SpriteResourceHeaderList is created to accompany each sprite.
void FieldSpriteManager_InitEmptyResLists(FieldSpriteManager *fieldSpriteManager, const SpriteResourceCountsListUnion *resDatCounts, int numSprites, enum HeapID heapId);
void FieldSpriteManager_AddPlttRes(FieldSpriteManager *fieldSpriteManager, NarcId narcId, int fileId, BOOL compressed, int plttNum, NNS_G2D_VRAM_TYPE vramType, int resId);
void FieldSpriteManager_AddCellRes(FieldSpriteManager *fieldSpriteManager, NarcId narcId, int fileId, BOOL compressed, int resId);
void FieldSpriteManager_AddAnimRes(FieldSpriteManager *fieldSpriteManager, NarcId narcId, int fileId, BOOL compressed, int resId);
void FieldSpriteManager_AddCharRes(FieldSpriteManager *fieldSpriteManager, NarcId narcId, int fileId, BOOL compressed, NNS_G2D_VRAM_TYPE vramType, int resId);
ManagedSprite *FieldSpriteManager_CreateManagedSprite(FieldSpriteManager *fieldSpriteManager, const ManagedSpriteTemplate *managedSpriteTemplate);
void FieldSpriteManager_ReleaseWithoutResDat(FieldSpriteManager *fieldSpriteManager);

#endif // POKEHEARTGOLD_FIELD_FIELD_SPRITE_MANAGER_H
