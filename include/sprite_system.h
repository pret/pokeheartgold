#ifndef POKEHEARTGOLD_SPRITE_SYSTEM_H
#define POKEHEARTGOLD_SPRITE_SYSTEM_H

#include "filesystem.h"
#include "palette.h"
#include "save.h"
#include "sprite.h"
#include "unk_02009D48.h"

typedef struct UnmanagedSpriteTemplate {
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
} UnmanagedSpriteTemplate;

typedef struct ManagedSpriteTemplate {
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
} ManagedSpriteTemplate; // size=0x34

typedef struct SpriteSystem {
    HeapID heapId;
    u32 numGfxHandlers;
    BOOL hasOamManager;
    NNSG2dCellTransferState *cellTransferState; // 00C
    G2dRenderer renderer;                       // 010
} SpriteSystem;                                 // size: 0x138

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
void SpriteSystem_DestroySpriteManager(SpriteSystem *spriteSystem, SpriteManager *spriteManager);
void SpriteSystem_Free(SpriteSystem *spriteSystem);
BOOL sub_0200D294(SpriteSystem *spriteSystem, SpriteManager *spriteManager, const u16 *fileIdList);
BOOL sub_0200D2A4(SpriteSystem *spriteSystem, SpriteManager *spriteManager, const u16 *fileIdList, int loadCharMode, int loadPlttMode);
Sprite *SpriteSystem_CreateSpriteFromResourceHeader(SpriteSystem *spriteSystem, SpriteManager *spriteManager, const UnmanagedSpriteTemplate *a2);
BOOL SpriteSystem_InitManagerWithCapacities(SpriteSystem *spriteSystem, SpriteManager *spriteManager, SpriteResourceCountsListUnion *);
BOOL SpriteSystem_LoadCharResObj(SpriteSystem *spriteSystem, SpriteManager *spriteManager, NarcId narcId, int fileId, BOOL compressed, NNS_G2D_VRAM_TYPE vram, int resId);
BOOL SpriteSystem_LoadCharResObjFromOpenNarc(SpriteSystem *spriteSystem, SpriteManager *spriteManager, NARC *narc, int fileId, BOOL compressed, NNS_G2D_VRAM_TYPE vram, int resId);
s8 SpriteSystem_LoadPlttResObj(SpriteSystem *spriteSystem, SpriteManager *spriteManager, NarcId SpriteSystem_LoadPlttResObj, int fileId, BOOL compressed, int pltt_num, NNS_G2D_VRAM_TYPE vram, int resId);
s8 SpriteSystem_LoadPlttResObjFromOpenNarc(SpriteSystem *spriteSystem, SpriteManager *spriteManager, NARC *SpriteSystem_LoadPlttResObj, int fileId, BOOL compressed, int pltt_num, NNS_G2D_VRAM_TYPE vram, int resId);
u8 SpriteSystem_LoadPaletteBuffer(PaletteData *plttData, PaletteBufferId bufferId, SpriteSystem *spriteSystem, SpriteManager *spriteManager, NarcId narcId, int fileId, BOOL compressed, int pltt_num, NNS_G2D_VRAM_TYPE vram, int resId);
u8 SpriteSystem_LoadPaletteBufferFromOpenNarc(PaletteData *plttData, PaletteBufferId bufferId, SpriteSystem *spriteSystem, SpriteManager *spriteManager, NARC *narc, int fileId, BOOL compressed, int pltt_num, NNS_G2D_VRAM_TYPE vram, int resId);
BOOL SpriteSystem_LoadCellResObj(SpriteSystem *spriteSystem, SpriteManager *spriteManager, NarcId narcId, int fileId, BOOL compressed, int resId);
BOOL SpriteSystem_LoadCellResObjFromOpenNarc(SpriteSystem *spriteSystem, SpriteManager *spriteManager, NARC *narc, int fileId, BOOL compressed, int resId);
BOOL SpriteSystem_LoadAnimResObj(SpriteSystem *spriteSystem, SpriteManager *spriteManager, NarcId narcId, int fileId, BOOL compressed, int resId);
BOOL SpriteSystem_LoadAnimResObjFromOpenNarc(SpriteSystem *spriteSystem, SpriteManager *spriteManager, NARC *narc, int fileId, BOOL compressed, int resId);
ManagedSprite *SpriteSystem_NewSprite(SpriteSystem *spriteSystem, SpriteManager *spriteManager, const ManagedSpriteTemplate *unkTemplate);
ManagedSprite *SpriteSystem_NewSpriteWithYOffset(SpriteSystem *spriteSystem, SpriteManager *spriteManager, const ManagedSpriteTemplate *unkTemplate, fx32 yOffset);
NNSG2dImagePaletteProxy *SpriteManager_FindPlttResourceProxy(SpriteManager *spriteManager, int id);
int SpriteManager_FindPlttResourceOffset(SpriteManager *spriteManager, int id, NNS_G2D_VRAM_TYPE vram);
BOOL SpriteManager_UnloadCharObjById(SpriteManager *spriteManager, u32 character);
BOOL SpriteManager_UnloadPlttObjById(SpriteManager *spriteManager, u32 pal);
BOOL SpriteManager_UnloadCellObjById(SpriteManager *spriteManager, u32 cell);
BOOL SpriteManager_UnloadAnimObjById(SpriteManager *spriteManager, u32 animation);
void SpriteSystem_FreeResourcesAndManager(SpriteSystem *spriteSystem, SpriteManager *);
void Sprite_DeleteAndFreeResources(ManagedSprite *managedSprite);
void Sprite_TickFrame(Sprite *sprite);
void ManagedSprite_TickFrame(ManagedSprite *managedSprite);
void ManagedSprite_TickTwoFrames(ManagedSprite *managedSprite);
void ManagedSprite_TickNFrames(ManagedSprite *managedSprite, fx32 frames);
u32 ManagedSprite_GetNumFrames(ManagedSprite *managedSprite);
void ManagedSprite_SetAnim(ManagedSprite *, int);
void ManagedSprite_SetAnimNoRestart(ManagedSprite *managedSprite, int);
u16 ManagedSprite_GetActiveAnim(ManagedSprite *managedSprite);
void thunk_Sprite_SetAnimationFlag(Sprite *sprite, int);
void ManagedSprite_SetAnimateFlag(ManagedSprite *managedSprite, int flag);
void thunk_Sprite_SetAnimationSpeed(Sprite *sprite, fx32 speed);
void ManagedSprite_SetAnimSpeed(ManagedSprite *managedSprite, fx32 speed);
BOOL thunk_Sprite_IsAnimated(Sprite *sprite);
BOOL ManagedSprite_IsAnimated(ManagedSprite *managedSprite);
void ManagedSprite_ResetSpriteAnimCtrlState(ManagedSprite *managedSprite);
void thunk_Sprite_SetAnimationFrame(Sprite *sprite, u16 frame);
void ManagedSprite_SetAnimationFrame(ManagedSprite *managedSprite, u16 frame);
u16 thunk_Sprite_GetAnimationFrame(Sprite *sprite);
u16 ManagedSprite_GetAnimationFrame(ManagedSprite *managedSprite);
void thunk_Sprite_SetDrawFlag(Sprite *sprite, int flag);
void ManagedSprite_SetDrawFlag(ManagedSprite *managedSprite, int flag);
BOOL thunk_Sprite_GetDrawFlag(Sprite *sprite);
BOOL ManagedSprite_GetDrawFlag(ManagedSprite *managedSprite);
void thunk_Sprite_SetPaletteOverride(Sprite *sprite, int flag);
void ManagedSprite_SetPaletteOverride(ManagedSprite *managedSprite, int flag);
void thunk_Sprite_SetPaletteOffset(Sprite *sprite, u8 a1);
void ManagedSprite_SetPaletteOverrideOffset(ManagedSprite *managedSprite, u8 a1);
u8 ManagedSprite_GetPaletteOverrideOffset(ManagedSprite *managedSprite);
void thunk_Sprite_SetPriority(Sprite *sprite, int priority);
int ManagedSprite_GetPriority(ManagedSprite *managedSprite);
void ManagedSprite_SetPriority(ManagedSprite *managedSprite, int priority);
void thunk_Sprite_SetDrawPriority(Sprite *sprite, u16 priority);
void ManagedSprite_SetDrawPriority(ManagedSprite *managedSprite, u16 priority);
u16 thunk_Sprite_GetDrawPriority(Sprite *sprite);
u16 ManagedSprite_GetDrawPriority(ManagedSprite *managedSprite);
void Sprite_SetPositionXY(Sprite *sprite, s16 x, s16 y);
void ManagedSprite_SetPositionXY(ManagedSprite *managedSprite, s16 x, s16 y);
void Sprite_SetPositionXYWithSubscreenOffset(Sprite *sprite, s16 x, s16 y, fx32 yOffset);
void ManagedSprite_SetPositionXYWithSubscreenOffset(ManagedSprite *managedSprite, s16 x, s16 y, fx32 yOffset);
void Sprite_GetPositionXY(Sprite *sprite, s16 *x, s16 *y);
void ManagedSprite_GetPositionXY(ManagedSprite *managedSprite, s16 *x, s16 *y);
void Sprite_GetPositionXY_CustomScreenYOffset(Sprite *sprite, s16 *x, s16 *y, fx32 yOffset);
void ManagedSprite_GetPositionXYWithSubscreenOffset(ManagedSprite *managedSprite, s16 *x, s16 *y, fx32 yOffset);
void Sprite_OffsetPositionXY(Sprite *sprite, s16 dx, s16 dy);
void ManagedSprite_OffsetPositionXY(ManagedSprite *managedSprite, s16 dx, s16 dy);
void ManagedSprite_AddSpritePrecisePositionXY(ManagedSprite *managedSprite, fx32 dx, fx32 dy);
void ManagedSprite_SetPositonFxXY(ManagedSprite *managedSprite, fx32 x, fx32 y);
void ManagedSprite_GetSpritePositionFxXY(ManagedSprite *managedSprite, fx32 *x, fx32 *y);
void ManagedSprite_SetPositionFxXYWithSubscreenOffset(ManagedSprite *managedSprite, fx32 x, fx32 y, fx32 yOffset);
void ManagedSprite_GetPositionFxXYWithSubscreenOffset(ManagedSprite *managedSprite, fx32 *x, fx32 *y, fx32 yOffset);
void thunk_Sprite_SetAffineOverworldMode(Sprite *sprite, u8 a1);
void ManagedSprite_SetAffineOverwriteMode(ManagedSprite *managedSprite, u8 a1);
void Sprite_SetAffineScaleXY(Sprite *sprite, f32 x, f32 y);
void ManagedSprite_SetAffineScale(ManagedSprite *managedSprite, f32 x, f32 y);
void Sprite_GetAffineScaleXY(Sprite *sprite, f32 *x, f32 *y);
void ManagedSprite_GetAffineScale(ManagedSprite *managedSprite, f32 *x, f32 *y);
void thunk_Sprite_SetAffineZRotation(Sprite *sprite, u16 a1);
void ManagedSprite_SetAffineZRotation(ManagedSprite *managedSprite, u16 a1);
void Sprite_OffsetAffineZRotation2(Sprite *sprite, u16 a1);
void ManagedSprite_OffsetAffineZRotation(ManagedSprite *managedSprite, u16 a1);
u16 thunk_Sprite_GetRotation(Sprite *sprite);
u16 ManagedSprite_GetRotation(ManagedSprite *managedSprite);
void thunk_Sprite_SetFlipMode(Sprite *sprite, u8 a1);
void ManagedSprite_SetFlipMode(ManagedSprite *managedSprite, u8 a1);
void ManagedSprite_SetAffineTranslation(ManagedSprite *managedSprite, s16 x, s16 y);
void ManagedSprite_SetMosaicFlag(ManagedSprite *managedSprite, BOOL mosaic);
void thunk_Sprite_SetOamMode(Sprite *sprite, GXOamMode mode);
void ManagedSprite_SetOamMode(ManagedSprite *managedSprite, GXOamMode mode);
GXOamMode thunk_Sprite_GetOamMode(Sprite *sprite);
GXOamMode ManagedSprite_GetOamMode(ManagedSprite *managedSprite);
u32 ManagedSprite_GetUserAttrForCurrentAnimFrame(ManagedSprite *managedSprite);
BOOL SpriteSystem_LoadCharResObjWithHardwareMappingType(SpriteSystem *spriteSystem, SpriteManager *spriteManager, NarcId narcId, int fileId, BOOL compressed, NNS_G2D_VRAM_TYPE vram, int resId);
BOOL SpriteSystem_LoadCharResObjAtEndWithHardwareMappingType(SpriteSystem *spriteSystem, SpriteManager *spriteManager, NarcId narcId, int fileId, BOOL compressed, NNS_G2D_VRAM_TYPE vram, int resId);
BOOL SpriteSystem_LoadCharResObjFromOpenNarcWithHardwareMappingType(SpriteSystem *spriteSystem, SpriteManager *spriteManager, NARC *narc, int fileId, BOOL compressed, NNS_G2D_VRAM_TYPE vram, int resId);
void SpriteSystem_ReplaceCharResObj(SpriteSystem *spriteSystem, SpriteManager *spriteManager, NarcId narcId, int fileId, BOOL compressed, int resId);
void SpriteSystem_ReplacePlttResObj(SpriteSystem *spriteSystem, SpriteManager *spriteManager, NarcId narcId, int fileId, BOOL compressed, int resId);
SpriteList *SpriteManager_GetSpriteList(SpriteManager *spriteManager);
void SpriteManager_SetSpriteList(SpriteManager *spriteManager, SpriteList *spriteList);
void sub_0200E2B8(SpriteSystem *spriteSystem, SpriteManager *spriteManager, NARC *narc, int fileId, BOOL compressed, int resId);
void sub_0200E2EC(SpriteSystem *spriteSystem, SpriteManager *spriteManager, NARC *narc, int fileId, BOOL compressed, int resId);

#endif // POKEHEARTGOLD_SPRITE_SYSTEM_H
