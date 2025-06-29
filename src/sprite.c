#include "sprite.h"

#include "global.h"

#include "math_util.h"
#include "system.h"

static void SpriteList_Init(SpriteList *spriteList);
static void Sprite_Init(Sprite *sprite);
static u32 Sprite_GetExAttrByAnimSeqAndFrame(const Sprite *sprite, u32 seq, u32 frame);
static BOOL SpriteList_LoadCellAndAnimForSprite(SpriteList *spriteList, const SpriteResourcesHeader *resHdr, Sprite *sprite, HeapID heapId);
static SpriteAnimType SpriteResourcesHeader_GetSpriteAnimType(const SpriteResourcesHeader *resHdr);
static void Sprite_SetCellBankPtr(const NNSG2dCellDataBank *cellData, Sprite *sprite);
static void Sprite_SetAnimBankPtr(const NNSG2dCellAnimBankData *cellAnim, Sprite *sprite);
static void Sprite_SetMultiCellBankPtr(const NNSG2dMultiCellDataBank *mcelData, Sprite *sprite);
static void Sprite_SetMultiAnimBankPtr(const NNSG2dMultiCellAnimBankData *mcelAnim, Sprite *sprite);
static void Sprite_InitCellAnimation(Sprite *sprite, HeapID heapId);
static void Sprite_InitCellAnimationWithTransfer(const SpriteResourcesHeader *resHdr, Sprite *sprite, HeapID heapId);
static void Sprite_InitMultiCellAnimation(Sprite *sprite, HeapID heapId);
static u32 Sprite_GetPaletteVramOffset(NNSG2dImagePaletteProxy *proxy, NNS_G2D_VRAM_TYPE vramType);
static void SpriteList_DrawSprite_Active(SpriteList *spriteList, Sprite *sprite);
static void SpriteList_DrawSprite_Inactive(SpriteList *spriteList, Sprite *sprite);
static void Sprite_AnimFunc_Active(Sprite *sprite);
static void Sprite_AnimFunc_Inactive(Sprite *sprite);
static void SpriteList_InsertSprite(SpriteList *spriteList, Sprite *sprite);
static void Sprite_EjectFromList(Sprite *sprite);
static void SpriteList_InitStack(SpriteList *spriteList);
static Sprite *SpriteList_AllocSpriteFromStack(SpriteList *spriteList);
static BOOL SpriteList_FreeSpriteToStack(SpriteList *spriteList, Sprite *sprite);

static void (*const sRenderFuncs[2])(SpriteList *spriteList, Sprite *sprite) = {
    SpriteList_DrawSprite_Inactive,
    SpriteList_DrawSprite_Active,
};

static void (*const sAnimFuncs[2])(Sprite *sprite) = {
    Sprite_AnimFunc_Inactive,
    Sprite_AnimFunc_Active,
};

SpriteList *SpriteList_Create(SpriteListParam *param) {
    GF_ASSERT(param != NULL);
    GF_ASSERT(param->rendererInstance != NULL);
    SpriteList *ret = AllocFromHeap(param->heapId, sizeof(SpriteList));
    GF_ASSERT(ret != NULL);
    SpriteList_Init(ret);
    ret->sprites = AllocFromHeap(param->heapId, param->num * sizeof(Sprite));
    GF_ASSERT(ret->sprites != NULL);
    ret->numSprites = param->num;
    ret->stack = AllocFromHeap(param->heapId, param->num * sizeof(Sprite *));
    GF_ASSERT(ret->stack != NULL);
    SpriteList_InitStack(ret);
    Sprite_Init(&ret->dummy);
    ret->dummy.prev = &ret->dummy;
    ret->dummy.next = &ret->dummy;
    ret->renderer = param->rendererInstance;
    ret->animBuff = Sys_AllocAndReadFile(param->heapId, "data/clact_default.NANR");
    NNS_G2dGetUnpackedAnimBank(ret->animBuff, &ret->animBank);
    ret->flag = TRUE;
    return ret;
}

BOOL SpriteList_Delete(SpriteList *spriteList) {
    if (spriteList == NULL) {
        return FALSE;
    }

    if (spriteList->sprites == NULL) {
        return TRUE;
    }

    SpriteList_DeleteAllSprites(spriteList);
    Heap_Free(spriteList->animBuff);
    Heap_Free(spriteList->stack);
    Heap_Free(spriteList->sprites);
    SpriteList_Init(spriteList);
    Heap_Free(spriteList);
    return TRUE;
}

BOOL SpriteList_DeleteAllSprites(SpriteList *spriteList) {
    if (spriteList == NULL) {
        return FALSE;
    }

    if (spriteList->sprites == NULL) {
        return TRUE;
    }

    Sprite *sprite = spriteList->dummy.next;
    while (sprite != &spriteList->dummy) {
        Sprite *next = sprite->next;
        Sprite_Delete(sprite);
        sprite = next;
    }
    return TRUE;
}

void SpriteList_RenderAndAnimateSprites(SpriteList *spriteList) {
    GF_ASSERT(spriteList != NULL);

    if (!spriteList->flag) {
        return;
    }

    Sprite *sprite = spriteList->dummy.next;
    while (sprite != &spriteList->dummy) {
        sRenderFuncs[sprite->drawFlag](spriteList, sprite);
        sAnimFuncs[sprite->animActive](sprite);
        sprite = sprite->next;
    }
}

static void SpriteList_Init(SpriteList *spriteList) {
    spriteList->sprites = NULL;
    spriteList->numSprites = 0;
    spriteList->stack = NULL;
    spriteList->stackPointer = 0;
    spriteList->renderer = NULL;
    Sprite_Init(&spriteList->dummy);
    spriteList->flag = FALSE;
}

static void Sprite_Init(Sprite *sprite) {
    sprite->spriteList = NULL;
    memset(sprite, 0, sizeof(Sprite));
    NNS_G2dInitImageProxy(&sprite->imageProxy);
    NNS_G2dInitImagePaletteProxy(&sprite->paletteProxy);
    sprite->mode = GX_OAM_MODE_NORMAL;
}

Sprite *Sprite_CreateAffine(const SpriteTemplate *template) {
    Sprite *sprite = SpriteList_AllocSpriteFromStack(template->spriteList);
    if (sprite == NULL) {
        return NULL;
    }

    sprite->spriteList = template->spriteList;
    sprite->animationNo = 0;
    sprite->matrix = template->position;
    sprite->scale = template->scale;
    sprite->rotation = template->rotation;
    sprite->type = template->whichScreen;
    sprite->drawPriority = template->priority;
    sprite->affine = 0;
    sprite->flip = 0;
    sprite->mosaic = FALSE;
    sprite->mode = GX_OAM_MODE_NORMAL;
    sprite->overwrite = NNS_G2D_RND_OVERWRITE_PRIORITY | NNS_G2D_RND_OVERWRITE_PLTTNO_OFFS;
    NNS_G2dSetRndCoreAffineOverwriteMode(&template->spriteList->renderer->rendererCore, (NNSG2dRendererAffineTypeOverwiteMode)sprite->affine);
    NNS_G2dSetRndCoreFlipMode(&template->spriteList->renderer->rendererCore, sprite->flip & 1, sprite->flip & 2);
    sprite->drawFlag = 1;
    sprite->animActive = 0;
    sprite->speed = FX32_CONST(2);
    if (!SpriteList_LoadCellAndAnimForSprite(template->spriteList, template->header, sprite, template->heapId)) {
        Sprite_Delete(sprite);
        return NULL;
    }
    sprite->palOffset = Sprite_GetPaletteVramOffset(&sprite->paletteProxy, sprite->type);
    sprite->palIndex = sprite->palOffset;
    SpriteList_InsertSprite(template->spriteList, sprite);
    return sprite;
}

Sprite *Sprite_Create(const SimpleSpriteTemplate *simpleTemplate) {
    SpriteTemplate template;

    template.spriteList = simpleTemplate->spriteList;
    template.header = simpleTemplate->header;
    template.position = simpleTemplate->position;
    SetVecFx32(template.scale, FX32_ONE, FX32_ONE, FX32_ONE);
    template.rotation = 0;
    template.priority = simpleTemplate->priority;
    template.whichScreen = simpleTemplate->whichScreen;
    template.heapId = simpleTemplate->heapId;

    return Sprite_CreateAffine(&template);
}

void Sprite_Delete(Sprite *sprite) {
    if (sprite->flag == SPRITE_ANIM_TYPE_NULL) {
        return;
    }

    if (sprite->prev != NULL) {
        Sprite_EjectFromList(sprite);
    }

    if (sprite->flag == SPRITE_ANIM_TYPE_CELL_TRANSFER) {
        SpriteAnimationDataWithTransfer *anim = (SpriteAnimationDataWithTransfer *)sprite->animationData;
        if (NNS_G2dGetImageLocation(&sprite->imageProxy, sprite->type) != -1u) {
            NNS_G2dFreeCellTransferStateHandle(anim->cellTransferStateHandle);
        }
    }

    if (sprite->flag == SPRITE_ANIM_TYPE_MULTICELL) {
        SpriteMultiAnimationData *anim = (SpriteMultiAnimationData *)sprite->animationData;
        if (anim->node != NULL) {
            Heap_Free(anim->node);
        }
        if (anim->cellAnim != NULL) {
            Heap_Free(anim->cellAnim);
        }
    }

    sprite->flag = SPRITE_ANIM_TYPE_NULL;
    SpriteList_FreeSpriteToStack(sprite->spriteList, sprite);
}

void Sprite_SetMatrix(Sprite *sprite, VecFx32 *vec) {
    sprite->matrix = *vec;
}

void Sprite_SetAffineMatrix(Sprite *sprite, VecFx32 *vec) {
    sprite->affineMatrix = *vec;
}

void Sprite_SetAffineScale(Sprite *sprite, VecFx32 *vec) {
    sprite->scale = *vec;
}

void Sprite_SetScaleAndAffineType(Sprite *sprite, VecFx32 *vec, u8 affine) {
    Sprite_SetAffineScale(sprite, vec);
    Sprite_SetAffineOverwriteMode(sprite, affine);
}

void Sprite_SetAffineZRotation(Sprite *sprite, u32 rotation) {
    sprite->rotation = rotation;
}

void Sprite_SetRotationAndAffineType(Sprite *sprite, u32 rotation, u8 affine) {
    Sprite_SetAffineZRotation(sprite, rotation);
    Sprite_SetAffineOverwriteMode(sprite, affine);
}

void Sprite_SetDrawFlag(Sprite *sprite, BOOL flag) {
    GF_ASSERT(sprite != NULL);
    GF_ASSERT(flag < 2);
    sprite->drawFlag = flag;
}

void Sprite_SetAnimActiveFlag(Sprite *sprite, BOOL flag) {
    GF_ASSERT(sprite != NULL);
    GF_ASSERT(flag < 2);
    sprite->animActive = flag;
}

void Sprite_SetAnimSpeed(Sprite *sprite, fx32 frame) {
    GF_ASSERT(sprite != NULL);
    sprite->speed = frame;
}

void Sprite_SetAffineOverwriteMode(Sprite *sprite, u8 affine) {
    GF_ASSERT(sprite != NULL);
    sprite->affine = affine;
}

void Sprite_SetFlipMode(Sprite *sprite, u8 flip) {
    GF_ASSERT(sprite != NULL);
    sprite->flip = flip;
    sprite->affine = 0;
}

VecFx32 *Sprite_GetMatrixPtr(Sprite *sprite) {
    return &sprite->matrix;
}

VecFx32 *Sprite_GetScalePtr(Sprite *sprite) {
    return &sprite->scale;
}

u16 Sprite_GetRotation(Sprite *sprite) {
    return sprite->rotation;
}

BOOL Sprite_GetDrawFlag(Sprite *sprite) {
    return sprite->drawFlag;
}

BOOL Sprite_GetAnimActiveFlag(Sprite *sprite) {
    return sprite->animActive;
}

u32 Sprite_GetNumAnimSeqs(Sprite *sprite) {
    GF_ASSERT(sprite != NULL);
    if (sprite->flag == SPRITE_ANIM_TYPE_CELL || sprite->flag == SPRITE_ANIM_TYPE_CELL_TRANSFER) {
        SpriteAnimationData *animData = (SpriteAnimationData *)sprite->animationData;
        return animData->animBankData->numSequences;
    } else {
        SpriteMultiAnimationData *animData = (SpriteMultiAnimationData *)sprite->animationData;
        return animData->multiAnimBankData->numSequences;
    }
}

void Sprite_SetAnimCtrlSeq(Sprite *sprite, int seq) {
    GF_ASSERT(Sprite_GetNumAnimSeqs(sprite) > seq);
    sprite->animationNo = (u16)seq;
    if (sprite->flag == SPRITE_ANIM_TYPE_CELL || sprite->flag == SPRITE_ANIM_TYPE_CELL_TRANSFER) {
        SpriteAnimationData *animData = (SpriteAnimationData *)sprite->animationData;
        const NNSG2dAnimSequenceData *seqData = NNS_G2dGetAnimSequenceByIdx(animData->animBankData, seq);
        NNS_G2dSetCellAnimationSequence(&animData->animation, seqData);
        NNS_G2dStartAnimCtrl(&animData->animation.animCtrl);
    } else {
        SpriteMultiAnimationData *animData = (SpriteMultiAnimationData *)sprite->animationData;
        const NNSG2dMultiCellAnimSequence *seqData = NNS_G2dGetAnimSequenceByIdx(animData->multiAnimBankData, seq);
        NNS_G2dSetAnimSequenceToMCAnimation(&animData->animation, seqData);
        NNS_G2dStartAnimCtrl(&animData->animation.animCtrl);
    }
}

void Sprite_TryChangeAnimSeq(Sprite *sprite, int seq) {
    if (sprite->animationNo != seq) {
        Sprite_SetAnimCtrlSeq(sprite, seq);
    }
}

void Sprite_ResetAnimCtrlState(Sprite *sprite) {
    if (sprite->flag == SPRITE_ANIM_TYPE_CELL || sprite->flag == SPRITE_ANIM_TYPE_CELL_TRANSFER) {
        SpriteAnimationData *animData = (SpriteAnimationData *)sprite->animationData;
        NNS_G2dResetAnimCtrlState(&animData->animation.animCtrl);
        NNS_G2dStartAnimCtrl(&animData->animation.animCtrl);
        Sprite_SetAnimationFrame(sprite, 0);
    } else {
        SpriteMultiAnimationData *animData = (SpriteMultiAnimationData *)sprite->animationData;
        NNS_G2dResetAnimCtrlState(&animData->animation.animCtrl);
        NNS_G2dStartAnimCtrl(&animData->animation.animCtrl);
        Sprite_SetAnimationFrame(sprite, 0);
    }
}

u16 Sprite_GetAnimationNumber(Sprite *sprite) {
    return sprite->animationNo;
}

void Sprite_UpdateAnim(Sprite *sprite, fx32 frames) {
    if (sprite->flag == SPRITE_ANIM_TYPE_CELL || sprite->flag == SPRITE_ANIM_TYPE_CELL_TRANSFER) {
        SpriteAnimationData *animData = (SpriteAnimationData *)sprite->animationData;
        NNS_G2dTickCellAnimation(&animData->animation, frames);
    } else {
        SpriteMultiAnimationData *animData = (SpriteMultiAnimationData *)sprite->animationData;
        NNS_G2dTickMCAnimation(&animData->animation, frames);
    }
}

void Sprite_SetAnimationFrame(Sprite *sprite, u16 frameIndex) {
    if (sprite->flag == SPRITE_ANIM_TYPE_CELL || sprite->flag == SPRITE_ANIM_TYPE_CELL_TRANSFER) {
        SpriteAnimationData *animData = (SpriteAnimationData *)sprite->animationData;
        NNS_G2dSetCellAnimationCurrentFrame(&animData->animation, frameIndex);
    } else {
        SpriteMultiAnimationData *animData = (SpriteMultiAnimationData *)sprite->animationData;
        NNS_G2dSetMCAnimationCurrentFrame(&animData->animation, frameIndex);
    }
}

u16 Sprite_GetAnimationFrame(Sprite *sprite) {
    SpriteAnimationData *animData = (SpriteAnimationData *)sprite->animationData;
    return NNS_G2dGetAnimCtrlCurrentFrame(&animData->animation.animCtrl);
}

void Sprite_SetPriority(Sprite *sprite, u8 priority) {
    sprite->priority = priority;
}

u8 Sprite_GetPriority(Sprite *sprite) {
    return sprite->priority;
}

void Sprite_SetPaletteOverride(Sprite *sprite, int index) {
    GF_ASSERT(sprite != NULL);
    sprite->palIndex = index;
    sprite->overwrite |= NNS_G2D_RND_OVERWRITE_PLTTNO;
    sprite->overwrite &= ~NNS_G2D_RND_OVERWRITE_PLTTNO_OFFS;
}

void Sprite_SetPalIndexRespectVramOffset(Sprite *sprite, int index) {
    Sprite_SetPaletteOverride(sprite, index);
    sprite->palIndex += Sprite_GetPaletteVramOffset(&sprite->paletteProxy, sprite->type);
}

int Sprite_GetPalIndex(Sprite *sprite) {
    return sprite->palIndex;
}

void Sprite_SetPalOffset(Sprite *sprite, u8 offset) {
    GF_ASSERT(sprite != NULL);
    sprite->palOffset = offset;
    sprite->overwrite |= NNS_G2D_RND_OVERWRITE_PLTTNO_OFFS;
    sprite->overwrite &= ~NNS_G2D_RND_OVERWRITE_PLTTNO;
}

void Sprite_SetPalOffsetRespectVramOffset(Sprite *sprite, u8 offset) {
    Sprite_SetPalOffset(sprite, offset);
    sprite->palOffset += Sprite_GetPaletteVramOffset(&sprite->paletteProxy, sprite->type);
}

u8 Sprite_GetPalOffset(Sprite *sprite) {
    GF_ASSERT(sprite != NULL);
    return sprite->palOffset;
}

void Sprite_SetDrawPriority(Sprite *sprite, u32 priority) {
    SpriteList *spriteList = sprite->spriteList;
    sprite->drawPriority = priority;
    Sprite_EjectFromList(sprite);
    SpriteList_InsertSprite(spriteList, sprite);
}

u16 Sprite_GetDrawPriority(Sprite *sprite) {
    return sprite->drawPriority;
}

void Sprite_SetImageProxy(Sprite *sprite, NNSG2dImageProxy *proxy) {
    sprite->imageProxy = *proxy;
}

NNSG2dImageProxy *Sprite_GetImageProxy(Sprite *sprite) {
    return &sprite->imageProxy;
}

void Sprite_SetPaletteProxy(Sprite *sprite, NNSG2dImagePaletteProxy *proxy) {
    sprite->paletteProxy = *proxy;
}

NNSG2dImagePaletteProxy *Sprite_GetPaletteProxy(Sprite *sprite) {
    return &sprite->paletteProxy;
}

void Sprite_SetMosaic(Sprite *sprite, BOOL mosaic) {
    sprite->mosaic = mosaic;
    if (mosaic == TRUE) {
        sprite->overwrite |= NNS_G2D_RND_OVERWRITE_MOSAIC;
    } else {
        sprite->overwrite ^= NNS_G2D_RND_OVERWRITE_MOSAIC;
    }
}

NNS_G2D_VRAM_TYPE Sprite_GetVramType(Sprite *sprite) {
    return sprite->type;
}

int Sprite_IsAnimated(Sprite *sprite) {
    GF_ASSERT(sprite != NULL);
    SpriteAnimationData *animData = (SpriteAnimationData *)sprite->animationData;
    return NNS_G2dIsAnimCtrlActive(&animData->animation.animCtrl);
}

void Sprite_SetOamMode(Sprite *sprite, GXOamMode mode) {
    GF_ASSERT(sprite != NULL);
    sprite->mode = mode;
    if (mode == GX_OAM_MODE_NORMAL) {
        sprite->overwrite ^= NNS_G2D_RND_OVERWRITE_OBJMODE;
    } else {
        sprite->overwrite |= NNS_G2D_RND_OVERWRITE_OBJMODE;
    }
}

GXOamMode Sprite_GetOamMode(Sprite *sprite) {
    GF_ASSERT(sprite != NULL);
    return sprite->mode;
}

void ClearMainOAM(HeapID heapId) {
    void *buf = AllocFromHeap(heapId, HW_OAM_SIZE);
    MI_CpuFill16(buf, 0x2c0, HW_OAM_SIZE);
    DC_FlushRange(buf, HW_OAM_SIZE);
    GX_LoadOAM(buf, 0, HW_OAM_SIZE);
    Heap_Free(buf);
}

void ClearSubOAM(HeapID heapId) {
    void *buf = AllocFromHeap(heapId, HW_OAM_SIZE);
    MI_CpuFill16(buf, 0x2c0, HW_OAM_SIZE);
    GXS_LoadOAM(buf, 0, HW_OAM_SIZE);
    Heap_Free(buf);
}

static u32 Sprite_GetExAttrByAnimSeqAndFrame(const Sprite *sprite, u32 seq, u32 frame) {
    const NNSG2dAnimBankData *animBank;
    const NNSG2dUserExAnimAttrBank *userExAnimAttrBank;
    const NNSG2dUserExAnimSequenceAttr *userExAnimSequenceAttr;
    const NNSG2dUserExAnimFrameAttr *userExAnimFrameAttr;

    if (sprite->flag == SPRITE_ANIM_TYPE_CELL || sprite->flag == SPRITE_ANIM_TYPE_CELL_TRANSFER) {
        SpriteAnimationData *animData = (SpriteAnimationData *)sprite->animationData;
        animBank = animData->animBankData;
    } else {
        SpriteMultiAnimationData *animData = (SpriteMultiAnimationData *)sprite->animationData;
        animBank = animData->multiAnimBankData;
    }
    userExAnimAttrBank = NNS_G2dGetUserExAnimAttrBank(animBank);
    if (userExAnimAttrBank != NULL) {
        userExAnimSequenceAttr = NNS_G2dGetUserExAnimSequenceAttr(userExAnimAttrBank, seq);
        if (userExAnimSequenceAttr != NULL) {
            userExAnimFrameAttr = NNS_G2dGetUserExAnimFrameAttr(userExAnimSequenceAttr, frame);
            if (userExAnimFrameAttr != NULL) {
                return NNS_G2dGetUserExAnimFrmAttrValue(userExAnimFrameAttr);
            }
        }
    }

    return 0;
}

u32 Sprite_GetCurrentAnimFrameExAttr(Sprite *sprite) {
    u32 animNum = Sprite_GetAnimationNumber(sprite);
    u32 animFrame = Sprite_GetAnimationFrame(sprite);
    return Sprite_GetExAttrByAnimSeqAndFrame(sprite, animNum, animFrame);
}

NNSG2dCellAnimation *Sprite_GetCellAnim(Sprite *sprite) {
    GF_ASSERT(sprite->flag != SPRITE_ANIM_TYPE_MULTICELL);
    SpriteAnimationData *animData = (SpriteAnimationData *)sprite->animationData;
    return &animData->animation;
}

static BOOL SpriteList_LoadCellAndAnimForSprite(SpriteList *spriteList, const SpriteResourcesHeader *resHdr, Sprite *sprite, HeapID heapId) {
    sprite->flag = SpriteResourcesHeader_GetSpriteAnimType(resHdr);
    sprite->imageProxy = *resHdr->imageProxy;
    sprite->paletteProxy = *resHdr->plttProxy;
    Sprite_SetCellBankPtr(resHdr->cellData, sprite);
    if (resHdr->cellAnim != NULL) {
        Sprite_SetAnimBankPtr(resHdr->cellAnim, sprite);
    } else {
        Sprite_SetAnimBankPtr(spriteList->animBank, sprite);
    }
    if (sprite->flag == SPRITE_ANIM_TYPE_MULTICELL) {
        Sprite_SetMultiCellBankPtr(resHdr->multiCellData, sprite);
        Sprite_SetMultiAnimBankPtr(resHdr->multiCellAnim, sprite);
        Sprite_InitMultiCellAnimation(sprite, heapId);
    } else if (sprite->flag == SPRITE_ANIM_TYPE_CELL_TRANSFER) {
        Sprite_InitCellAnimationWithTransfer(resHdr, sprite, heapId);
    } else {
        Sprite_InitCellAnimation(sprite, heapId);
    }
    sprite->priority = resHdr->priority;
    return TRUE;
}

static SpriteAnimType SpriteResourcesHeader_GetSpriteAnimType(const SpriteResourcesHeader *resHdr) {
    if (resHdr->multiCellData != NULL) {
        return SPRITE_ANIM_TYPE_MULTICELL;
    } else if (resHdr->flag == TRUE) {
        return SPRITE_ANIM_TYPE_CELL_TRANSFER;
    } else {
        return SPRITE_ANIM_TYPE_CELL;
    }
}

static void Sprite_SetCellBankPtr(const NNSG2dCellDataBank *cellData, Sprite *sprite) {
    SpriteAnimationData *animData = (SpriteAnimationData *)sprite->animationData;
    animData->cellBank = cellData;
}

static void Sprite_SetAnimBankPtr(const NNSG2dCellAnimBankData *cellAnim, Sprite *sprite) {
    SpriteAnimationData *animData = (SpriteAnimationData *)sprite->animationData;
    animData->animBankData = cellAnim;
}

static void Sprite_SetMultiCellBankPtr(const NNSG2dMultiCellDataBank *mcelData, Sprite *sprite) {
    SpriteMultiAnimationData *animData = (SpriteMultiAnimationData *)sprite->animationData;
    animData->multiCellBank = mcelData;
}

static void Sprite_SetMultiAnimBankPtr(const NNSG2dMultiCellAnimBankData *mcelAnim, Sprite *sprite) {
    SpriteMultiAnimationData *animData = (SpriteMultiAnimationData *)sprite->animationData;
    animData->multiAnimBankData = mcelAnim;
}

static void Sprite_InitCellAnimation(Sprite *sprite, HeapID heapId) {
    SpriteAnimationData *animData = (SpriteAnimationData *)sprite->animationData;
    const NNSG2dAnimSequenceData *animSeq = NNS_G2dGetAnimSequenceByIdx(animData->animBankData, 0);
    NNS_G2dInitCellAnimation(&animData->animation, animSeq, animData->cellBank);
}

static void Sprite_InitCellAnimationWithTransfer(const SpriteResourcesHeader *resHdr, Sprite *sprite, HeapID heapId) {
    SpriteAnimationDataWithTransfer *animData = (SpriteAnimationDataWithTransfer *)sprite->animationData;
    const NNSG2dCharacterData *charData;
    animData->cellTransferStateHandle = NNS_G2dGetNewCellTransferStateHandle();
    charData = resHdr->charData;
    NNS_G2dInitCellAnimationVramTransfered(&animData->animation, NNS_G2dGetAnimSequenceByIdx(animData->animBankData, 0), animData->cellBank, animData->cellTransferStateHandle, -1, NNS_G2dGetImageLocation(&sprite->imageProxy, NNS_G2D_VRAM_TYPE_2DMAIN), NNS_G2dGetImageLocation(&sprite->imageProxy, NNS_G2D_VRAM_TYPE_2DSUB), charData->pRawData, NULL, charData->szByte);
}

static void Sprite_InitMultiCellAnimation(Sprite *sprite, HeapID heapId) {
    SpriteMultiAnimationData *animData = (SpriteMultiAnimationData *)sprite->animationData;
    const NNSG2dMultiCellAnimSequence *animSeq = NNS_G2dGetAnimSequenceByIdx(animData->multiAnimBankData, 0);
    u16 numNodes = NNS_G2dGetMCBankNumNodesRequired(animData->multiCellBank);
    animData->node = AllocFromHeap(heapId, numNodes * sizeof(NNSG2dNode));
    animData->cellAnim = AllocFromHeap(heapId, numNodes * sizeof(NNSG2dCellAnimation));
    NNS_G2dInitMCAnimation(&animData->animation, animData->node, animData->cellAnim, numNodes, animData->animBankData, animData->cellBank, animData->multiCellBank);
    NNS_G2dSetAnimSequenceToMCAnimation(&animData->animation, animSeq);
}

static u32 Sprite_GetPaletteVramOffset(NNSG2dImagePaletteProxy *proxy, NNS_G2D_VRAM_TYPE vramType) {
    u32 plttSize;

    if (proxy->bExtendedPlt) {
        plttSize = 0x200;
    } else if (proxy->fmt == GX_TEXFMT_PLTT256) {
        plttSize = 0;
    } else {
        plttSize = 0x20;
    }
    if (plttSize != 0) {
        return NNS_G2dGetImagePaletteLocation(proxy, vramType) / plttSize;
    }

    return 0;
}

static void SpriteList_DrawSprite_Active(SpriteList *spriteList, Sprite *sprite) {
    VecFx32 matrix = sprite->matrix;
    NNS_G2dSetRendererImageProxy(spriteList->renderer, &sprite->imageProxy, &sprite->paletteProxy);
    NNS_G2dBeginRendering(spriteList->renderer);
    NNS_G2dPushMtx();
    NNS_G2dSetRndCoreAffineOverwriteMode(&spriteList->renderer->rendererCore, (NNSG2dRendererAffineTypeOverwiteMode)sprite->affine);
    if (sprite->affine == NNS_G2D_RND_AFFINE_OVERWRITE_NONE) {
        NNS_G2dSetRndCoreFlipMode(&spriteList->renderer->rendererCore, sprite->flip & 1, sprite->flip & 2);
    } else {
        NNS_G2dSetRndCoreFlipMode(&spriteList->renderer->rendererCore, FALSE, FALSE);
    }
    NNS_G2dTranslate(matrix.x, matrix.y, matrix.z);
    if (sprite->affine != NNS_G2D_RND_AFFINE_OVERWRITE_NONE) {
        NNS_G2dTranslate(sprite->affineMatrix.x, sprite->affineMatrix.y, sprite->affineMatrix.z);
        NNS_G2dScale(sprite->scale.x, sprite->scale.y, sprite->scale.z);
        NNS_G2dRotZ(FX_SinIdx(sprite->rotation), FX_CosIdx(sprite->rotation));
        NNS_G2dTranslate(-sprite->affineMatrix.x, -sprite->affineMatrix.y, -sprite->affineMatrix.z);
    }
    NNS_G2dSetRendererOverwriteEnable(spriteList->renderer, (NNSG2dRendererOverwriteParam)sprite->overwrite);
    NNS_G2dSetRendererOverwriteDisable(spriteList->renderer, (NNSG2dRendererOverwriteParam)~sprite->overwrite);
    NNS_G2dSetRendererOverwritePlttNo(spriteList->renderer, sprite->palIndex);
    NNS_G2dSetRendererOverwritePlttNoOffset(spriteList->renderer, sprite->palOffset);
    NNS_G2dSetRendererOverwriteMosaicFlag(spriteList->renderer, sprite->mosaic);
    NNS_G2dSetRendererOverwriteOBJMode(spriteList->renderer, sprite->mode);
    NNS_G2dSetRendererOverwritePriority(spriteList->renderer, sprite->priority);
    if (sprite->flag == SPRITE_ANIM_TYPE_CELL || sprite->flag == SPRITE_ANIM_TYPE_CELL_TRANSFER) {
        SpriteAnimationData *animData = (SpriteAnimationData *)sprite->animationData;
        NNS_G2dDrawCellAnimation(&animData->animation);
    } else {
        SpriteMultiAnimationData *animData = (SpriteMultiAnimationData *)sprite->animationData;
        NNS_G2dDrawMultiCellAnimation(&animData->animation);
    }
    NNS_G2dPopMtx();
    NNS_G2dEndRendering();
}

static void SpriteList_DrawSprite_Inactive(SpriteList *spriteList, Sprite *sprite) {
}

static void Sprite_AnimFunc_Active(Sprite *sprite) {
    Sprite_UpdateAnim(sprite, sprite->speed);
}

static void Sprite_AnimFunc_Inactive(Sprite *sprite) {
}

static void SpriteList_InsertSprite(SpriteList *spriteList, Sprite *sprite) {
    Sprite *head;
    if (spriteList->dummy.next == &spriteList->dummy) {
        spriteList->dummy.next = sprite;
        spriteList->dummy.prev = sprite;
        sprite->prev = &spriteList->dummy;
        sprite->next = &spriteList->dummy;
        return;
    }

    if (spriteList->dummy.prev->drawPriority <= sprite->drawPriority) {
        sprite->prev = spriteList->dummy.prev;
        spriteList->dummy.prev->next = sprite;
        sprite->next = &spriteList->dummy;
        spriteList->dummy.prev = sprite;
        return;
    }

    head = spriteList->dummy.next;
    while (head != &spriteList->dummy) {
        if (head->drawPriority > sprite->drawPriority) {
            head->prev->next = sprite;
            sprite->prev = head->prev;
            head->prev = sprite;
            sprite->next = head;
            return;
        }
        head = head->next;
    }
}

static void Sprite_EjectFromList(Sprite *sprite) {
    sprite->prev->next = sprite->next;
    sprite->next->prev = sprite->prev;
}

static void SpriteList_InitStack(SpriteList *spriteList) {
    for (int i = 0; i < spriteList->numSprites; ++i) {
        Sprite_Init(&spriteList->sprites[i]);
        spriteList->stack[i] = &spriteList->sprites[i];
    }
    spriteList->stackPointer = 0;
}

static Sprite *SpriteList_AllocSpriteFromStack(SpriteList *spriteList) {
    if (spriteList->stackPointer >= spriteList->numSprites) {
        return NULL;
    }

    Sprite *ret = spriteList->stack[spriteList->stackPointer];
    ++spriteList->stackPointer;
    return ret;
}

static BOOL SpriteList_FreeSpriteToStack(SpriteList *spriteList, Sprite *sprite) {
    if (spriteList->stackPointer <= 0) {
        return FALSE;
    }

    Sprite_Init(sprite);
    --spriteList->stackPointer;
    spriteList->stack[spriteList->stackPointer] = sprite;
    return TRUE;
}
