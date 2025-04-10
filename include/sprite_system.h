#ifndef POKEHEARTGOLD_SPRITE_SYSTEM_H
#define POKEHEARTGOLD_SPRITE_SYSTEM_H

#include "filesystem.h"
#include "palette.h"
#include "save.h"
#include "sprite.h"
#include "unk_02009D48.h"

typedef struct UnkStruct_0200D2B4 {
    int resourceSet;
    s16 x;
    s16 y;
    s16 z;
    u16 animSeqNo;
    int rotation;
    int palIndex;
    NNS_G2D_VRAM_TYPE whichScreen;
    int unk_18;
    int unk_1C;
    int unk_20;
    int unk_24;
} UnkStruct_0200D2B4;

typedef struct UnkTemplate_0200D748 {
    s16 x;
    s16 y;
    s16 z;
    u16 animation;
    int spritePriority;
    int pal;
    NNS_G2D_VRAM_TYPE vram;
    int resIdList[GF_GFX_RES_TYPE_MAX];
    int bgPriority;
    int vramTransfer;
} UnkTemplate_0200D748; // size=0x34

typedef struct SpriteSystem {
    HeapID heapId;
    u32 numGfxHandlers;
    BOOL hasOamManager;
    NNSG2dCellTransferState *cellTransferState; // 00C
    G2dRenderer renderer;                    // 010
} SpriteSystem;                               // size: 0x138

typedef struct SpriteManager {
    SpriteList *spriteList;
    SpriteResourceHeaderList *spriteHeaderList;                // 4
    GF_2DGfxResHeader *_2dGfxResHeader;                        // 8
    GF_2DGfxResMan *_2dGfxResMan[GF_GFX_RES_TYPE_MAX];         // C
    GF_2DGfxResObjList *_2dGfxResObjList[GF_GFX_RES_TYPE_MAX]; // 24
    int numGfxResObjects[GF_GFX_RES_TYPE_MAX];
    int numGfxResObjectTypes;
} SpriteManager; // size: 0x58

typedef struct OamManagerParam {
    int fromOBJmain;
    int numOBJmain;
    int fromAffineMain;
    int numAffineMain;
    int fromOBJsub;
    int numOBJsub;
    int fromAffineSub;
    int numAffineSub;
} OamManagerParam;

typedef struct OamCharTransferParam {
    int maxTasks;
    int sizeMain;
    int sizeSub;
    GXOBJVRamModeChar charModeMain;
    GXOBJVRamModeChar charModeSub;
} OamCharTransferParam;

typedef union SpriteResourceCountsListUnion {
    int asArray[GF_GFX_RES_TYPE_MAX];
    struct {
        int numChar;
        int numPltt;
        int numCell;
        int numAnim;
        int numMcel;
        int numManm;
    };
} SpriteResourceCountsListUnion;

SpriteSystem *SpriteSystem_Alloc(HeapID heapId);
SpriteManager *SpriteManager_New(SpriteSystem *spriteSystem);
G2dRenderer *SpriteSystem_GetRenderer(SpriteSystem *spriteSystem);
BOOL SpriteSystem_Init(SpriteSystem *spriteSystem, const OamManagerParam *oamManagerParam, const OamCharTransferParam *oamTransferParam, int a3);
BOOL SpriteSystem_InitSprites(SpriteSystem *spriteSystem, SpriteManager *spriteManager, int maxSprites);
void thunk_Sprite_Delete(Sprite *sprite);
void SpriteSystem_DrawSprites(SpriteManager *spriteManager);
void SpriteSystem_TransferOam(void);
void SpriteSystem_UpdateTransfer(void);
void SpriteSystem_DestroySpriteManager(SpriteSystem *renderer, SpriteManager *gfxHandler);
void SpriteSystem_Free(SpriteSystem *);
BOOL sub_0200D294(SpriteSystem *renderer, SpriteManager *gfxHandler, const u16 *fileIdList);
BOOL sub_0200D2A4(SpriteSystem *renderer, SpriteManager *gfxHandler, const u16 *fileIdList, int loadCharMode, int loadPlttMode);
Sprite *SpriteSystem_CreateSpriteFromResourceHeader(SpriteSystem *renderer, SpriteManager *gfxHandler, const UnkStruct_0200D2B4 *a2);
BOOL SpriteSystem_InitManagerWithCapacities(SpriteSystem *renderer, SpriteManager *gfxHandler, SpriteResourceCountsListUnion *);
BOOL SpriteSystem_LoadCharResObj(SpriteSystem *renderer, SpriteManager *gfxHandler, NarcId narcId, int fileId, BOOL compressed, NNS_G2D_VRAM_TYPE vram, int resId);
BOOL SpriteSystem_LoadCharResObjFromOpenNarc(SpriteSystem *renderer, SpriteManager *gfxHandler, NARC *narc, int fileId, BOOL compressed, NNS_G2D_VRAM_TYPE vram, int resId);
s8 SpriteSystem_LoadPlttResObj(SpriteSystem *renderer, SpriteManager *gfxHandler, NarcId SpriteSystem_LoadPlttResObj, int fileId, BOOL compressed, int pltt_num, NNS_G2D_VRAM_TYPE vram, int resId);
s8 SpriteSystem_LoadPlttResObjFromOpenNarc(SpriteSystem *renderer, SpriteManager *gfxHandler, NARC *SpriteSystem_LoadPlttResObj, int fileId, BOOL compressed, int pltt_num, NNS_G2D_VRAM_TYPE vram, int resId);
u8 SpriteSystem_LoadPaletteBuffer(PaletteData *plttData, PaletteBufferId bufferId, SpriteSystem *renderer, SpriteManager *gfxHandler, NarcId narcId, int fileId, BOOL compressed, int pltt_num, NNS_G2D_VRAM_TYPE vram, int resId);
u8 SpriteSystem_LoadPaletteBufferFromOpenNarc(PaletteData *plttData, PaletteBufferId bufferId, SpriteSystem *renderer, SpriteManager *gfxHandler, NARC *narc, int fileId, BOOL compressed, int pltt_num, NNS_G2D_VRAM_TYPE vram, int resId);
BOOL SpriteSystem_LoadCellResObj(SpriteSystem *renderer, SpriteManager *gfxHandler, NarcId narcId, int fileId, BOOL compressed, int resId);
BOOL SpriteSystem_LoadCellResObjFromOpenNarc(SpriteSystem *renderer, SpriteManager *gfxHandler, NARC *narc, int fileId, BOOL compressed, int resId);
BOOL SpriteSystem_LoadAnimResObj(SpriteSystem *renderer, SpriteManager *gfxHandler, NarcId narcId, int fileId, BOOL compressed, int resId);
BOOL SpriteSystem_LoadAnimResObjFromOpenNarc(SpriteSystem *renderer, SpriteManager *gfxHandler, NARC *narc, int fileId, BOOL compressed, int resId);
ManagedSprite *SpriteSystem_NewSprite(SpriteSystem *renderer, SpriteManager *gfxHandler, const UnkTemplate_0200D748 *unkTemplate);
ManagedSprite *SpriteSystem_NewSpriteWithYOffset(SpriteSystem *renderer, SpriteManager *gfxHandler, const UnkTemplate_0200D748 *unkTemplate, fx32 yOffset);
NNSG2dImagePaletteProxy *SpriteManager_FindPlttResourceProxy(SpriteManager *gfxHandler, int id);
int SpriteManager_FindPlttResourceOffset(SpriteManager *gfxHandler, int id, NNS_G2D_VRAM_TYPE vram);
BOOL SpriteManager_UnloadCharObjById(SpriteManager *gfxHandler, u32 character);
BOOL SpriteManager_UnloadPlttObjById(SpriteManager *gfxHandler, u32 pal);
BOOL SpriteManager_UnloadCellObjById(SpriteManager *gfxHandler, u32 cell);
BOOL SpriteManager_UnloadAnimObjById(SpriteManager *gfxHandler, u32 animation);
void SpriteSystem_FreeResourcesAndManager(SpriteSystem *renderer, SpriteManager *);
void Sprite_DeleteAndFreeResources(ManagedSprite *);
void Sprite_TickFrame(Sprite *sprite);
void ManagedSprite_TickFrame(ManagedSprite *);
void ManagedSprite_TickTwoFrames(ManagedSprite *unk);
void ManagedSprite_TickNFrames(ManagedSprite *unk, fx32 frames);
u32 ManagedSprite_GetNumFrames(ManagedSprite *unk);
void ManagedSprite_SetAnim(ManagedSprite *, int);
void ManagedSprite_SetAnimNoRestart(ManagedSprite *, int);
u16 ManagedSprite_GetActiveAnim(ManagedSprite *unk);
void SetSpriteAnimationFlag(Sprite *, int);
void ManagedSprite_SetAnimateFlag(ManagedSprite *, int);
void SpriteSetAnimationSpeed(Sprite *, fx32);
void ManagedSprite_SetAnimSpeed(ManagedSprite *, fx32);
BOOL IsSpriteAnimated(Sprite *sprite);
BOOL ManagedSprite_IsAnimated(ManagedSprite *);
void UnkImageStruct_ResetSpriteAnimCtrlState(ManagedSprite *unk);
void SetSpriteAnimationFrame(Sprite *, u16);
void ManagedSprite_SetAnimationFrame(ManagedSprite *, u16);
u16 GetSpriteAnimationFrame(Sprite *sprite);
u16 ManagedSprite_GetAnimationFrame(ManagedSprite *unk);
void SpriteSetDrawFlag(Sprite *, int);
void ManagedSprite_SetDrawFlag(ManagedSprite *, int);
BOOL GetSpriteDrawFlag(Sprite *);
BOOL ManagedSprite_GetDrawFlag(ManagedSprite *a0);
void SetSpritePaletteOverride(Sprite *, int);
void ManagedSprite_SetPaletteOverride(ManagedSprite *, int);
void SetSpritePaletteOverrideOffset(Sprite *sprite, u8 a1);
void ManagedSprite_SetPaletteOverrideOffset(ManagedSprite *unk, u8 a1);
u8 ManagedSprite_GetPaletteOverrideOffset(ManagedSprite *unk);
void SetSpritePriority(Sprite *sprite, int a1);
int ManagedSprite_GetPriority(ManagedSprite *unk);
void ManagedSprite_SetPriority(ManagedSprite *, int);
void SetSpriteDrawPriority(Sprite *sprite, u16 a1);
void ManagedSprite_SetDrawPriority(ManagedSprite *unk, u16 a1);
u16 GetSpriteDrawPriority(Sprite *sprite);
u16 ManagedSprite_GetDrawPriority(ManagedSprite *unk);
void Sprite_SetPositionXY(Sprite *sprite, s16 x, s16 y);
void ManagedSprite_SetPositionXY(ManagedSprite *sprite, s16 x, s16 y);
void Sprite_SetPositionXYWithSubscreenOffset(Sprite *sprite, s16 x, s16 y, fx32 yOffset);
void ManagedSprite_SetPositionXYWithSubscreenOffset(ManagedSprite *a0, s16 x, s16 y, fx32 yOffset);
void Sprite_GetPositionXY(Sprite *sprite, s16 *x, s16 *y);
void ManagedSprite_GetPositionXY(ManagedSprite *unk, s16 *x, s16 *y);
void Sprite_GetPositionXY_CustomScreenYOffset(Sprite *sprite, s16 *x, s16 *y, fx32 yOffset);
void ManagedSprite_GetPositionXYWithSubscreenOffset(ManagedSprite *unk, s16 *x, s16 *y, fx32 yOffset);
void Sprite_OffsetPositionXY(Sprite *sprite, s16 dx, s16 dy);
void ManagedSprite_OffsetPositionXY(ManagedSprite *unk, s16 dx, s16 dy);
void UnkImageStruct_AddSpritePrecisePositionXY(ManagedSprite *unk, fx32 dx, fx32 dy);
void ManagedSprite_SetPositonFxXY(ManagedSprite *unk, fx32 x, fx32 y);
void ManagedSprite_GetSpritePositionFxXY(ManagedSprite *unk, fx32 *x, fx32 *y);
void ManagedSprite_SetPositionFxXYWithSubscreenOffset(ManagedSprite *unk, fx32 x, fx32 y, fx32 yOffset);
void ManagedSprite_GetPositionFxXYWithSubscreenOffset(ManagedSprite *unk, fx32 *x, fx32 *y, fx32 yOffset);
void SetSpriteAffineOverwriteMode(Sprite *sprite, u8 a1);
void ManagedSprite_SetAffineOverwriteMode(ManagedSprite *unk, u8 a1);
void SetSpriteAffineScale(Sprite *sprite, f32 x, f32 y);
void ManagedSprite_SetAffineScale(ManagedSprite *unk, f32 x, f32 y);
void GetSpriteAffineScale(Sprite *sprite, f32 *x, f32 *y);
void ManagedSprite_GetAffineScale(ManagedSprite *unk, f32 *x, f32 *y);
void SetSpriteAffineZRotation(Sprite *sprite, u16 a1);
void ManagedSprite_SetAffineZRotation(ManagedSprite *unk, u16 a1);
void OffsetSpriteAffineZRotation(Sprite *sprite, u16 a1);
void ManagedSprite_OffsetAffineZRotation(ManagedSprite *unk, u16 a1);
u16 sub_0200E0A4(Sprite *sprite);
u16 sub_0200E0AC(ManagedSprite *unk);
void SetSpriteFlipMode(Sprite *sprite, u8 a1);
void ManagedSprite_SetFlipMode(ManagedSprite *unk, u8 a1);
void ManagedSprite_SetAffineTranslation(ManagedSprite *unk, s16 x, s16 y);
void ManagedSprite_SetMosaicFlag(ManagedSprite *unk, BOOL mosaic);
void SetSpriteOamMode(Sprite *sprite, GXOamMode mode);
void ManagedSprite_SetOamMode(ManagedSprite *unk, GXOamMode mode);
GXOamMode GetSpriteOamMode(Sprite *sprite);
GXOamMode ManagedSprite_GetOamMode(ManagedSprite *unk);
u32 ManagedSprite_GetUserAttrForCurrentAnimFrame(ManagedSprite *unk);
BOOL SpriteSystem_LoadCharResObjWithHardwareMappingType(SpriteSystem *renderer, SpriteManager *gfxHandler, NarcId narcId, int fileId, BOOL compressed, NNS_G2D_VRAM_TYPE vram, int resId);
BOOL SpriteSystem_LoadCharResObjAtEndWithHardwareMappingType(SpriteSystem *renderer, SpriteManager *gfxHandler, NarcId narcId, int fileId, BOOL compressed, NNS_G2D_VRAM_TYPE vram, int resId);
BOOL SpriteSystem_LoadCharResObjFromOpenNarcWithHardwareMappingType(SpriteSystem *renderer, SpriteManager *gfxHandler, NARC *narc, int fileId, BOOL compressed, NNS_G2D_VRAM_TYPE vram, int resId);
void SpriteSystem_ReplaceCharResObj(SpriteSystem *renderer, SpriteManager *gfxHandler, NarcId narcId, int fileId, BOOL compressed, int resId);
void SpriteSystem_ReplacePlttResObj(SpriteSystem *renderer, SpriteManager *gfxHandler, NarcId narcId, int fileId, BOOL compressed, int resId);
SpriteList *SpriteManager_GetSpriteList(SpriteManager *gfxHandler);
void SpriteManager_SetSpriteList(SpriteManager *gfxHandler, SpriteList *spriteList);
void sub_0200E2B8(SpriteSystem *renderer, SpriteManager *gfxHandler, NARC *narc, int fileId, BOOL compressed, int resId);
void sub_0200E2EC(SpriteSystem *renderer, SpriteManager *gfxHandler, NARC *narc, int fileId, BOOL compressed, int resId);

#endif // POKEHEARTGOLD_SPRITE_SYSTEM_H
