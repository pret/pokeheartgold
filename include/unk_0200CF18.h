#ifndef POKEHEARTGOLD_UNK_0200CF18_H
#define POKEHEARTGOLD_UNK_0200CF18_H

#include "filesystem.h"
#include "unk_02009D48.h"
#include "save.h"
#include "unk_02023694.h"
#include "palette.h"

typedef struct UnkStruct_0200D2B4 {
    int resourceSet;
    s16 x;
    s16 y;
    s16 z;
    u16 animSeqNo;
    int rotation;
    int unk_10;
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
    u32 spritePriority;
    u32 pal;
    NNS_G2D_VRAM_TYPE vram;
    u32 resIdList[GF_GFX_RES_TYPE_MAX];
    u32 bgPriority;
    u32 vramTransfer;
} UnkTemplate_0200D748; // size=0x34

typedef struct SpriteRenderer {
    HeapID heapId;
    u32 numGfxHandlers;
    BOOL hasOamManager;
    NNSG2dCellTransferState* cellTransferState; // 00C
    GF_G2dRenderer renderer; // 010
} SpriteRenderer; // size: 0x138

typedef struct SpriteGfxHandler {
    SpriteList* spriteList;
    SpriteResourceHeaderList* spriteHeaderList; // 4
    struct _2DGfxResHeader* _2dGfxResHeader; // 8
    struct _2DGfxResMan* _2dGfxResMan[GF_GFX_RES_TYPE_MAX]; // C
    struct _2DGfxResObjList* _2dGfxResObjList[GF_GFX_RES_TYPE_MAX]; // 24
    int numGfxResObjects[GF_GFX_RES_TYPE_MAX];
    int numGfxResObjectTypes;
} SpriteGfxHandler; // size: 0x58

typedef struct Unk122_021E92FC {
    int unk0;
    int unk4;
    int unk8;
    int unkC;
    int unk10;
    int unk14;
    int unk18;
    int unk1C;
} Unk122_021E92FC;

typedef struct Unk122_021E92D0 {
    int unk0;
    int unk4;
    int unk8;
    int unkC;
    int unk10;
} Unk122_021E92D0;

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

SpriteRenderer* SpriteRenderer_Create(HeapID);
SpriteGfxHandler* SpriteRenderer_CreateGfxHandler(SpriteRenderer*);
GF_G2dRenderer* SpriteRenderer_GetG2dRendererPtr(SpriteRenderer*);
BOOL sub_0200CF70(SpriteRenderer* renderer, const Unk122_021E92FC*, const Unk122_021E92D0*, int);
BOOL sub_0200CFF4(SpriteRenderer* renderer, SpriteGfxHandler* gfxHandler, int);
void thunk_Sprite_Delete(Sprite* sprite);
void sub_0200D020(SpriteGfxHandler* gfxHandler);
void thunk_OamManager_ApplyAndResetBuffers(void);
void sub_0200D03C(void);
void SpriteRenderer_RemoveGfxHandler(SpriteRenderer* renderer, SpriteGfxHandler* gfxHandler);
void SpriteRenderer_Delete(SpriteRenderer*);
BOOL sub_0200D294(SpriteRenderer* renderer, SpriteGfxHandler* gfxHandler, const u16* fileIdList);
BOOL sub_0200D2A4(SpriteRenderer* renderer, SpriteGfxHandler* gfxHandler, const u16* fileIdList, int loadCharMode, int loadPlttMode);
Sprite* SpriteRenderer_CreateSprite(SpriteRenderer* renderer, SpriteGfxHandler* gfxHandler, const UnkStruct_0200D2B4* a2);
BOOL SpriteRenderer_Init2DGfxResManagersFromCountsArray(SpriteRenderer* renderer, SpriteGfxHandler* gfxHandler, SpriteResourceCountsListUnion*);
BOOL SpriteRenderer_LoadCharResObjFromNarcId(SpriteRenderer* renderer, SpriteGfxHandler* gfxHandler, NarcId narcId, int fileId, BOOL compressed, int vram, int resId);
BOOL SpriteRenderer_LoadCharResObjFromOpenNarc(SpriteRenderer* renderer, SpriteGfxHandler* gfxHandler, NARC* narc, int fileId, BOOL compressed, int vram, int resId);
s8 SpriteRenderer_LoadPlttResObjFromNarcId(SpriteRenderer* renderer, SpriteGfxHandler* gfxHandler, NarcId SpriteRenderer_LoadPlttResObjFromNarcId, int fileId, BOOL compressed, int pltt_num, int vram, int resId);
s8 SpriteRenderer_LoadPlttResObjFromOpenNarc(SpriteRenderer* renderer, SpriteGfxHandler* gfxHandler, NARC* SpriteRenderer_LoadPlttResObjFromNarcId, int fileId, BOOL compressed, int pltt_num, int vram, int resId);
u8 sub_0200D644(PaletteData* plttData, u32 bufferId, SpriteRenderer* renderer, SpriteGfxHandler* gfxHandler, NarcId narcId, int fileId, BOOL compressed, int pltt_num, int vram, int resId);
u8 sub_0200D68C(PaletteData* plttData, u32 bufferId, SpriteRenderer* renderer, SpriteGfxHandler* gfxHandler, NARC* narc, int fileId, BOOL compressed, int pltt_num, int vram, int resId);
BOOL SpriteRenderer_LoadCellResObjFromNarcId(SpriteRenderer* renderer, SpriteGfxHandler* gfxHandler, NarcId narcId, int fileId, BOOL compressed, int resId);
BOOL SpriteRenderer_LoadCellResObjFromOpenNarc(SpriteRenderer* renderer, SpriteGfxHandler* gfxHandler, NARC* narc, int fileId, BOOL compressed, int resId);
BOOL SpriteRenderer_LoadAnimResObjFromNarcId(SpriteRenderer* renderer, SpriteGfxHandler* gfxHandler, NarcId narcId, int fileId, BOOL compressed, int resId);
BOOL SpriteRenderer_LoadAnimResObjFromOpenNarc(SpriteRenderer* renderer, SpriteGfxHandler* gfxHandler, NARC* narc, int fileId, BOOL compressed, int resId);
UnkImageStruct* SpriteRenderer_LoadResourcesAndCreateSprite(SpriteRenderer* renderer, SpriteGfxHandler* gfxHandler, UnkTemplate_0200D748* unkTemplate);
UnkImageStruct* SpriteRenderer_LoadResourcesAndCreateSprite_CustomBottomScreenOffset(SpriteRenderer* renderer, SpriteGfxHandler* gfxHandler, UnkTemplate_0200D748* unkTemplate, fx32 yOffset);
NNSG2dImagePaletteProxy* sub_0200D934(SpriteGfxHandler* gfxHandler, int id);
int sub_0200D944(SpriteGfxHandler* gfxHandler, int id, int vram);
BOOL SpriteGfxHandler_UnloadCharObjById(SpriteGfxHandler* gfxHandler, u32 character);
BOOL SpriteGfxHandler_UnloadPlttObjById(SpriteGfxHandler* gfxHandler, u32 pal);
BOOL SpriteGfxHandler_UnloadCellObjById(SpriteGfxHandler* gfxHandler, u32 cell);
BOOL SpriteGfxHandler_UnloadAnimObjById(SpriteGfxHandler* gfxHandler, u32 animation);
void SpriteRenderer_UnloadResourcesAndRemoveGfxHandler(SpriteRenderer* renderer, SpriteGfxHandler*);
void sub_0200D9DC(UnkImageStruct*);
void TickSpriteAnimation1Frame(Sprite* sprite);
void UnkImageStruct_TickSpriteAnimation1Frame(UnkImageStruct*);
void UnkImageStruct_TickSpriteAnimation2Frames(UnkImageStruct* unk);
void UnkImageStruct_TickSpriteAnimationNFrames(UnkImageStruct* unk, fx32 frames);
u32 UnkImageStruct_GetSpriteAnimSeqNo(UnkImageStruct* unk);
void UnkImageStruct_SetSpriteAnimSeqNo(UnkImageStruct*, int);
void UnkImageStruct_TryChangeSpriteAnimSeqNo(UnkImageStruct*, int);
u16 UnkImageStruct_GetSpriteCurrentAnimSeqNo(UnkImageStruct* unk);
void thunk_Set2dSpriteAnimActiveFlag(Sprite*, int);
void UnkImageStruct_SetSpriteAnimActiveFlag(UnkImageStruct*, int);
void sub_0200DC84(Sprite*, fx32);
void sub_0200DC8C(UnkImageStruct*, fx32);
BOOL sub_0200DC98(Sprite* sprite);
BOOL sub_0200DCA0(UnkImageStruct*);
void UnkImageStruct_ResetSpriteAnimCtrlState(UnkImageStruct* unk);
void thunk_Sprite_SetAnimCtrlCurrentFrame(Sprite*, u16);
void UnkImageStruct_SetSpriteAnimCtrlCurrentFrame(UnkImageStruct*, u16);
u16 thunk_Sprite_GetAnimCtrlCurrentFrame(Sprite* sprite);
u16 UnkImageStruct_GetSpriteAnimCtrlCurrentFrame(UnkImageStruct* unk);
void thunk_Set2dSpriteVisibleFlag(Sprite*, int);
void UnkImageStruct_SetSpriteVisibleFlag(UnkImageStruct*, int);
BOOL thunk_Get2dSpriteVisibleFlag(Sprite*);
BOOL UnkImageStruct_GetSpriteVisibleFlag(UnkImageStruct* a0);
void thunk_Sprite_SetPalIndex(Sprite*, int);
void UnkImageStruct_SetSpritePalIndex(UnkImageStruct*, int);
void thunk_Sprite_SetPalOffset(Sprite* sprite, u8 a1);
void UnkImageStruct_SetSpritePalOffset(UnkImageStruct* unk, u8 a1);
u8 UnkImageStruct_GetSpritePalOffset(UnkImageStruct* unk);
void thunk_Sprite_SetPriority(Sprite* sprite, int a1);
int UnkImageStruct_GetSpritePriority(UnkImageStruct* unk);
void UnkImageStruct_SetSpritePriority(UnkImageStruct*, int);
void thunk_Sprite_SetDrawPriority(Sprite* sprite, u16 a1);
void UnkImageStruct_SetSpriteDrawPriority(UnkImageStruct* unk, u16 a1);
u16 thunk_Sprite_GetDrawPriority(Sprite* sprite);
u16 UnkImageStruct_GetSpriteDrawPriority(UnkImageStruct* unk);
void Sprite_SetPositionXY(Sprite* sprite, s16 x, s16 y);
void UnkImageStruct_SetSpritePositionXY(UnkImageStruct*, s16, s16);
void Sprite_SetPositionXY_CustomScreenYOffset(Sprite* sprite, s16 x, s16 y, fx32 yOffset);
void UnkImageStruct_SetSpritePositionXY_CustomScreenYOffset(UnkImageStruct* a0, s16 x, s16 y, fx32 yOffset);
void Sprite_GetPositionXY(Sprite* sprite, s16* x, s16* y);
void UnkImageStruct_GetSpritePositionXY(UnkImageStruct* unk, s16* x, s16* y);
void Sprite_GetPositionXY_CustomScreenYOffset(Sprite* sprite, s16* x, s16* y, fx32 yOffset);
void UnkImageStruct_GetSpritePositionXY_CustomScreenYOffset(UnkImageStruct* unk, s16* x, s16* y, fx32 yOffset);
void Sprite_AddPositionXY(Sprite* sprite, s16 dx, s16 dy);
void UnkImageStruct_AddSpritePositionXY(UnkImageStruct* unk, s16 dx, s16 dy);
void UnkImageStruct_AddSpritePrecisePositionXY(UnkImageStruct* unk, fx32 dx, fx32 dy);
void UnkImageStruct_SetSpritePrecisePositionXY_NoBottomScreenCorrection(UnkImageStruct* unk, fx32 x, fx32 y);
void UnkImageStruct_GetSpritePositionXY_NoBottomScreenCorrection(UnkImageStruct* unk, fx32* x, fx32* y);
void UnkImageStruct_SetSpritePrecisePositionXY(UnkImageStruct* unk, fx32 x, fx32 y, fx32 yOffset);
void UnkImageStruct_GetSpritePrecisePositionXY(UnkImageStruct* unk, fx32* x, fx32* y, fx32 yOffset);
void sub_0200DF90(Sprite* sprite, u8 a1);
void sub_0200DF98(UnkImageStruct* unk, u8 a1);
void sub_0200DFA4(Sprite* sprite, f32 x, f32 y);
void sub_0200E024(UnkImageStruct* unk, f32 x, f32 y);
void sub_0200E030(Sprite* sprite, f32* x, f32* y);
void sub_0200E060(UnkImageStruct* unk, f32* x, f32* y);
void sub_0200E06C(Sprite* sprite, u16 a1);
void sub_0200E074(UnkImageStruct* unk, u16 a1);
void sub_0200E080(Sprite* sprite, u16 a1);
void sub_0200E098(UnkImageStruct* unk, u16 a1);
u16 sub_0200E0A4(Sprite* sprite);
u16 sub_0200E0AC(UnkImageStruct* unk);
void sub_0200E0B8(Sprite* sprite, u8 a1);
void sub_0200E0C0(UnkImageStruct* unk, u8 a1);
void sub_0200E0CC(UnkImageStruct* unk, s16 x, s16 y);
void sub_0200E0E8(UnkImageStruct* unk, BOOL mosaic);
void sub_0200E0F4(Sprite* sprite, GXOamMode mode);
void sub_0200E0FC(UnkImageStruct* unk, GXOamMode mode);
GXOamMode sub_0200E108(Sprite* sprite);
GXOamMode sub_0200E110(UnkImageStruct* unk);
u32 sub_0200E11C(UnkImageStruct* unk);
BOOL sub_0200E128(SpriteRenderer* renderer, SpriteGfxHandler* gfxHandler, NarcId narcId, int fileId, BOOL compressed, int vram, int resId);
BOOL sub_0200E188(SpriteRenderer* renderer, SpriteGfxHandler* gfxHandler, NarcId narcId, int fileId, BOOL compressed, int vram, int resId);
BOOL sub_0200E1E8(SpriteRenderer* renderer, SpriteGfxHandler* gfxHandler, NARC* narc, int fileId, BOOL compressed, int vram, int resId);
void sub_0200E248(SpriteRenderer* renderer, SpriteGfxHandler* gfxHandler, NarcId narcId, int fileId, BOOL compressed, int resId);
void sub_0200E27C(SpriteRenderer* renderer, SpriteGfxHandler* gfxHandler, NarcId narcId, int fileId, BOOL compressed, int resId);
SpriteList* sub_0200E2B0(SpriteGfxHandler* gfxHandler);
void sub_0200E2B4(SpriteGfxHandler* gfxHandler, SpriteList* spriteList);
void sub_0200E2B8(SpriteRenderer* renderer, SpriteGfxHandler* gfxHandler, NARC* narc, int fileId, BOOL compressed, int resId);
void sub_0200E2EC(SpriteRenderer* renderer, SpriteGfxHandler* gfxHandler, NARC* narc, int fileId, BOOL compressed, int resId);

#endif //POKEHEARTGOLD_UNK_0200CF18_H
