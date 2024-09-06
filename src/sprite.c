#include "sprite.h"

#include "global.h"

#include "math_util.h"
#include "system.h"

static void sub_020245D4(SpriteList *spriteList);
static u32 Sprite_GetExAttrByAnimSeqAndFrame(const Sprite *sprite, u32 seq, u32 frame);
static BOOL sub_02024CD0(SpriteList *spriteList, const SpriteResourcesHeader *resHdr, Sprite *sprite, HeapID heapId);
static u32 sub_02024D78(const SpriteResourcesHeader *resHdr);
static void sub_02024D90(const NNSG2dCellDataBank *cellData, Sprite *sprite);
static void sub_02024D94(const NNSG2dCellAnimBankData *cellAnim, Sprite *sprite);
static void sub_02024D98(const NNSG2dMultiCellDataBank *mcelData, Sprite *sprite);
static void sub_02024DA0(const NNSG2dMultiCellAnimBankData *mcelAnim, Sprite *sprite);
static void sub_02024DA8(Sprite *sprite, HeapID heapId);
static void sub_02024DC8(const SpriteResourcesHeader *resHdr, Sprite *sprite, HeapID heapId);
static void sub_02024E24(Sprite *sprite, HeapID heapId);
static u32 sub_02024E84(NNSG2dImagePaletteProxy *proxy, NNS_G2D_VRAM_TYPE vramType);
void sub_02024EB4(SpriteList *spriteList, Sprite *sprite);
void sub_020245FC(Sprite *sprite);
void sub_02025010(SpriteList *spriteList, Sprite *sprite);
void sub_02025014(Sprite *sprite);
void sub_02025020(Sprite *sprite);
void sub_020250D8(SpriteList *spriteList);
Sprite *sub_02025110(SpriteList *spriteList);
void SpriteList_InsertSprite(SpriteList *spriteList, Sprite *sprite);
void Sprite_EjectFromList(Sprite *sprite);
void sub_0202512C(SpriteList *spriteList, Sprite *sprite);

static void (*const _020F6314[2])(SpriteList *spriteList, Sprite *sprite) = {
    sub_02025010,
    sub_02024EB4,
};

static void (*const _020F631C[2])(Sprite *sprite) = {
    sub_02025020,
    sub_02025014,
};

SpriteList *SpriteList_Create(SpriteListParam *param) {
    GF_ASSERT(param != NULL);
    GF_ASSERT(param->rendererInstance != NULL);
    SpriteList *ret = AllocFromHeap(param->heapId, sizeof(SpriteList));
    GF_ASSERT(ret != NULL);
    sub_020245D4(ret);
    ret->sprites = AllocFromHeap(param->heapId, param->num * sizeof(Sprite));
    GF_ASSERT(ret->sprites != NULL);
    ret->numSprites = param->num;
    ret->stack      = AllocFromHeap(param->heapId, param->num * sizeof(Sprite *));
    GF_ASSERT(ret->stack != NULL);
    sub_020250D8(ret);
    sub_020245FC(&ret->dummy);
    ret->dummy.prev = &ret->dummy;
    ret->dummy.next = &ret->dummy;
    ret->renderer   = param->rendererInstance;
    ret->animBuff   = Sys_AllocAndReadFile(param->heapId, "data/clact_default.NANR");
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

    sub_02024544(spriteList);
    FreeToHeap(spriteList->animBuff);
    FreeToHeap(spriteList->stack);
    FreeToHeap(spriteList->sprites);
    sub_020245D4(spriteList);
    FreeToHeap(spriteList);
    return TRUE;
}

BOOL sub_02024544(SpriteList *spriteList) {
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

void sub_0202457C(SpriteList *spriteList) {
    GF_ASSERT(spriteList != NULL);

    if (!spriteList->flag) {
        return;
    }

    Sprite *sprite = spriteList->dummy.next;
    while (sprite != &spriteList->dummy) {
        _020F6314[sprite->drawFlag](spriteList, sprite);
        _020F631C[sprite->animActive](sprite);
        sprite = sprite->next;
    }
}

static void sub_020245D4(SpriteList *spriteList) {
    spriteList->sprites      = NULL;
    spriteList->numSprites   = 0;
    spriteList->stack        = NULL;
    spriteList->stackPointer = 0;
    spriteList->renderer     = NULL;
    sub_020245FC(&spriteList->dummy);
    spriteList->flag = FALSE;
}

void sub_020245FC(Sprite *sprite) {
    sprite->spriteList = NULL;
    memset(sprite, 0, sizeof(Sprite));
    NNS_G2dInitImageProxy(&sprite->imageProxy);
    NNS_G2dInitImagePaletteProxy(&sprite->paletteProxy);
    sprite->mode = GX_OAM_MODE_NORMAL;
}

Sprite *CreateSprite(const SpriteTemplate *template) {
    Sprite *sprite = sub_02025110(template->spriteList);
    if (sprite == NULL) {
        return NULL;
    }

    sprite->spriteList   = template->spriteList;
    sprite->animationNo  = 0;
    sprite->matrix       = template->position;
    sprite->scale        = template->scale;
    sprite->rotation     = template->rotation;
    sprite->type         = template->whichScreen;
    sprite->drawPriority = template->priority;
    sprite->affine       = 0;
    sprite->flip         = 0;
    sprite->mosaic       = FALSE;
    sprite->mode         = GX_OAM_MODE_NORMAL;
    sprite->overwrite    = NNS_G2D_RND_OVERWRITE_PRIORITY | NNS_G2D_RND_OVERWRITE_PLTTNO_OFFS;
    NNS_G2dSetRndCoreAffineOverwriteMode(&template->spriteList->renderer->rendererCore, (NNSG2dRendererAffineTypeOverwiteMode)sprite->affine);
    NNS_G2dSetRndCoreFlipMode(&template->spriteList->renderer->rendererCore, sprite->flip & 1, sprite->flip & 2);
    sprite->drawFlag   = 1;
    sprite->animActive = 0;
    sprite->frame      = FX32_CONST(2);
    if (!sub_02024CD0(template->spriteList, template->header, sprite, template->heapId)) {
        Sprite_Delete(sprite);
        return NULL;
    }
    sprite->palOffset = sub_02024E84(&sprite->paletteProxy, sprite->type);
    sprite->palIndex  = sprite->palOffset;
    SpriteList_InsertSprite(template->spriteList, sprite);
    return sprite;
}

Sprite *sub_02024714(const SimpleSpriteTemplate *simpleTemplate) {
    SpriteTemplate template;

    template.spriteList = simpleTemplate->spriteList;
    template.header     = simpleTemplate->header;
    template.position   = simpleTemplate->position;
    SetVecFx32(template.scale, FX32_ONE, FX32_ONE, FX32_ONE);
    template.rotation    = 0;
    template.priority    = simpleTemplate->priority;
    template.whichScreen = simpleTemplate->whichScreen;
    template.heapId      = simpleTemplate->heapId;

    return CreateSprite(&template);
}

void Sprite_Delete(Sprite *sprite) {
    if (sprite->flag == 0) {
        return;
    }

    if (sprite->prev != NULL) {
        Sprite_EjectFromList(sprite);
    }

    if (sprite->flag == 3) {
        SpriteAnimationData2 *anim = (SpriteAnimationData2 *)sprite->animationData;
        if (NNS_G2dGetImageLocation(&sprite->imageProxy, sprite->type) != -1u) {
            NNS_G2dFreeCellTransferStateHandle(anim->cellTransferStateHandle);
        }
    }

    if (sprite->flag == 2) {
        SpriteMultiAnimationData *anim = (SpriteMultiAnimationData *)sprite->animationData;
        if (anim->node != NULL) {
            FreeToHeap(anim->node);
        }
        if (anim->cellAnim != NULL) {
            FreeToHeap(anim->cellAnim);
        }
    }

    sprite->flag = 0;
    sub_0202512C(sprite->spriteList, sprite);
}

void Sprite_SetMatrix(Sprite *sprite, VecFx32 *vec) {
    sprite->matrix = *vec;
}

void Sprite_SetAffineMatrix(Sprite *sprite, VecFx32 *vec) {
    sprite->affineMatrix = *vec;
}

void Sprite_SetScale(Sprite *sprite, VecFx32 *vec) {
    sprite->scale = *vec;
}

void Sprite_SetScaleAndAffineType(Sprite *sprite, VecFx32 *vec, u8 a2) {
    Sprite_SetScale(sprite, vec);
    Sprite_SetAffineOverwriteType(sprite, a2);
}

void Sprite_SetRotation(Sprite *sprite, u32 a1) {
    sprite->rotation = a1;
}

void Sprite_SetRotationAndAffineType(Sprite *sprite, u32 a1, u8 a2) {
    Sprite_SetRotation(sprite, a1);
    Sprite_SetAffineOverwriteType(sprite, a2);
}

void Sprite_SetVisibleFlag(Sprite *sprite, BOOL flag) {
    GF_ASSERT(sprite != NULL);
    GF_ASSERT(flag < 2);
    sprite->drawFlag = flag;
}

void Sprite_SetAnimActiveFlag(Sprite *sprite, BOOL flag) {
    GF_ASSERT(sprite != NULL);
    GF_ASSERT(flag < 2);
    sprite->animActive = flag;
}

void Sprite_SetAnimFrame(Sprite *sprite, fx32 frame) {
    GF_ASSERT(sprite != NULL);
    sprite->frame = frame;
}

void Sprite_SetAffineOverwriteType(Sprite *sprite, u8 a1) {
    GF_ASSERT(sprite != NULL);
    sprite->affine = a1;
}

void Sprite_SetFlip_AffineOff(Sprite *sprite, u8 a1) {
    GF_ASSERT(sprite != NULL);
    sprite->flip   = a1;
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

BOOL Sprite_GetVisibleFlag(Sprite *sprite) {
    return sprite->drawFlag;
}

BOOL Sprite_GetAnimActiveFlag(Sprite *sprite) {
    return sprite->animActive;
}

u32 Sprite_GetNumAnimSeqs(Sprite *sprite) {
    GF_ASSERT(sprite != NULL);
    if (sprite->flag == 1 || sprite->flag == 3) {
        SpriteAnimationData *animData = (SpriteAnimationData *)sprite->animationData;
        return animData->animBankData->numSequences;
    } else {
        SpriteMultiAnimationData *animData = (SpriteMultiAnimationData *)sprite->animationData;
        return animData->multiAnimBankData->numSequences;
    }
}

void Sprite_SetAnimCtrlSeq(Sprite *sprite, int a1) {
    GF_ASSERT(Sprite_GetNumAnimSeqs(sprite) > a1);
    sprite->animationNo = (u16)a1;
    if (sprite->flag == 1 || sprite->flag == 3) {
        SpriteAnimationData *animData         = (SpriteAnimationData *)sprite->animationData;
        const NNSG2dAnimSequenceData *seqData = NNS_G2dGetAnimSequenceByIdx(animData->animBankData, a1);
        NNS_G2dSetCellAnimationSequence(&animData->animation, seqData);
        NNS_G2dStartAnimCtrl(&animData->animation.animCtrl);
    } else {
        SpriteMultiAnimationData *animData         = (SpriteMultiAnimationData *)sprite->animationData;
        const NNSG2dMultiCellAnimSequence *seqData = NNS_G2dGetAnimSequenceByIdx(animData->multiAnimBankData, a1);
        NNS_G2dSetAnimSequenceToMCAnimation(&animData->animation, seqData);
        NNS_G2dStartAnimCtrl(&animData->animation.animCtrl);
    }
}

void Sprite_TryChangeAnimSeq(Sprite *sprite, int a1) {
    if (sprite->animationNo != a1) {
        Sprite_SetAnimCtrlSeq(sprite, a1);
    }
}

void Sprite_ResetAnimCtrlState(Sprite *sprite) {
    if (sprite->flag == 1 || sprite->flag == 3) {
        SpriteAnimationData *animData = (SpriteAnimationData *)sprite->animationData;
        NNS_G2dResetAnimCtrlState(&animData->animation.animCtrl);
        NNS_G2dStartAnimCtrl(&animData->animation.animCtrl);
        Sprite_SetAnimCtrlCurrentFrame(sprite, 0);
    } else {
        SpriteMultiAnimationData *animData = (SpriteMultiAnimationData *)sprite->animationData;
        NNS_G2dResetAnimCtrlState(&animData->animation.animCtrl);
        NNS_G2dStartAnimCtrl(&animData->animation.animCtrl);
        Sprite_SetAnimCtrlCurrentFrame(sprite, 0);
    }
}

u16 Sprite_GetAnimationNumber(Sprite *sprite) {
    return sprite->animationNo;
}

void Sprite_TickAnimCtrlFrame(Sprite *sprite, fx32 a1) {
    if (sprite->flag == 1 || sprite->flag == 3) {
        SpriteAnimationData *animData = (SpriteAnimationData *)sprite->animationData;
        NNS_G2dTickCellAnimation(&animData->animation, a1);
    } else {
        SpriteMultiAnimationData *animData = (SpriteMultiAnimationData *)sprite->animationData;
        NNS_G2dTickMCAnimation(&animData->animation, a1);
    }
}

void Sprite_SetAnimCtrlCurrentFrame(Sprite *sprite, u16 a1) {
    if (sprite->flag == 1 || sprite->flag == 3) {
        SpriteAnimationData *animData = (SpriteAnimationData *)sprite->animationData;
        NNS_G2dSetCellAnimationCurrentFrame(&animData->animation, a1);
    } else {
        SpriteMultiAnimationData *animData = (SpriteMultiAnimationData *)sprite->animationData;
        NNS_G2dSetMCAnimationCurrentFrame(&animData->animation, a1);
    }
}

u16 Sprite_GetAnimCtrlCurrentFrame(Sprite *sprite) {
    SpriteAnimationData *animData = (SpriteAnimationData *)sprite->animationData;
    return NNS_G2dGetAnimCtrlCurrentFrame(&animData->animation.animCtrl);
}

void Sprite_SetPriority(Sprite *sprite, u8 a1) {
    sprite->priority = a1;
}

u8 Sprite_GetPriority(Sprite *sprite) {
    return sprite->priority;
}

void Sprite_SetPalIndex(Sprite *sprite, int a1) {
    GF_ASSERT(sprite != NULL);
    sprite->palIndex = a1;
    sprite->overwrite |= NNS_G2D_RND_OVERWRITE_PLTTNO;
    sprite->overwrite &= ~NNS_G2D_RND_OVERWRITE_PLTTNO_OFFS;
}

void Sprite_SetPalIndexRespectOffset(Sprite *sprite, int a1) {
    Sprite_SetPalIndex(sprite, a1);
    sprite->palIndex += sub_02024E84(&sprite->paletteProxy, sprite->type);
}

int Sprite_GetPalIndex(Sprite *sprite) {
    return sprite->palIndex;
}

void Sprite_SetPalOffset(Sprite *sprite, u8 a1) {
    GF_ASSERT(sprite != NULL);
    sprite->palOffset = a1;
    sprite->overwrite |= NNS_G2D_RND_OVERWRITE_PLTTNO_OFFS;
    sprite->overwrite &= ~NNS_G2D_RND_OVERWRITE_PLTTNO;
}

void sub_02024AA8(Sprite *sprite, u8 a1) {
    Sprite_SetPalOffset(sprite, a1);
    sprite->palOffset += sub_02024E84(&sprite->paletteProxy, sprite->type);
}

u8 Sprite_GetPalOffset(Sprite *sprite) {
    GF_ASSERT(sprite != NULL);
    return sprite->palOffset;
}

void Sprite_SetDrawPriority(Sprite *sprite, u16 a1) {
    SpriteList *spriteList = sprite->spriteList;
    sprite->drawPriority   = a1;
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

void Sprite_SetMosaic(Sprite *sprite, BOOL a1) {
    sprite->mosaic = a1;
    if (a1 == TRUE) {
        sprite->overwrite |= NNS_G2D_RND_OVERWRITE_MOSAIC;
    } else {
        sprite->overwrite ^= NNS_G2D_RND_OVERWRITE_MOSAIC;
    }
}

NNS_G2D_VRAM_TYPE Sprite_GetVramType(Sprite *sprite) {
    return sprite->type;
}

int Sprite_IsCellAnimationRunning(Sprite *sprite) {
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
    FreeToHeap(buf);
}

void ClearSubOAM(HeapID heapId) {
    void *buf = AllocFromHeap(heapId, HW_OAM_SIZE);
    MI_CpuFill16(buf, 0x2c0, HW_OAM_SIZE);
    GXS_LoadOAM(buf, 0, HW_OAM_SIZE);
    FreeToHeap(buf);
}

static u32 Sprite_GetExAttrByAnimSeqAndFrame(const Sprite *sprite, u32 seq, u32 frame) {
    const NNSG2dAnimBankData *animBank;
    const NNSG2dUserExAnimAttrBank *userExAnimAttrBank;
    const NNSG2dUserExAnimSequenceAttr *userExAnimSequenceAttr;
    const NNSG2dUserExAnimFrameAttr *userExAnimFrameAttr;

    if (sprite->flag == 1 || sprite->flag == 3) {
        SpriteAnimationData *animData = (SpriteAnimationData *)sprite->animationData;
        animBank                      = animData->animBankData;
    } else {
        SpriteMultiAnimationData *animData = (SpriteMultiAnimationData *)sprite->animationData;
        animBank                           = animData->multiAnimBankData;
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
    u32 animNum   = Sprite_GetAnimationNumber(sprite);
    u32 animFrame = Sprite_GetAnimCtrlCurrentFrame(sprite);
    return Sprite_GetExAttrByAnimSeqAndFrame(sprite, animNum, animFrame);
}

NNSG2dCellAnimation *Sprite_GetCellAnim(Sprite *sprite) {
    GF_ASSERT(sprite->flag != 2);
    SpriteAnimationData *animData = (SpriteAnimationData *)sprite->animationData;
    return &animData->animation;
}

static BOOL sub_02024CD0(SpriteList *spriteList, const SpriteResourcesHeader *resHdr, Sprite *sprite, HeapID heapId) {
    sprite->flag         = sub_02024D78(resHdr);
    sprite->imageProxy   = *resHdr->imageProxy;
    sprite->paletteProxy = *resHdr->plttProxy;
    sub_02024D90(resHdr->cellData, sprite);
    if (resHdr->cellAnim != NULL) {
        sub_02024D94(resHdr->cellAnim, sprite);
    } else {
        sub_02024D94(spriteList->animBank, sprite);
    }
    if (sprite->flag == 2) {
        sub_02024D98(resHdr->multiCellData, sprite);
        sub_02024DA0(resHdr->multiCellAnim, sprite);
        sub_02024E24(sprite, heapId);
    } else if (sprite->flag == 3) {
        sub_02024DC8(resHdr, sprite, heapId);
    } else {
        sub_02024DA8(sprite, heapId);
    }
    sprite->priority = resHdr->priority;
    return TRUE;
}

static u32 sub_02024D78(const SpriteResourcesHeader *resHdr) {
    if (resHdr->multiCellData != NULL) {
        return 2;
    } else if (resHdr->flag == TRUE) {
        return 3;
    } else {
        return 1;
    }
}

static void sub_02024D90(const NNSG2dCellDataBank *cellData, Sprite *sprite) {
    SpriteAnimationData *animData = (SpriteAnimationData *)sprite->animationData;
    animData->cellBank            = cellData;
}

static void sub_02024D94(const NNSG2dCellAnimBankData *cellAnim, Sprite *sprite) {
    SpriteAnimationData *animData = (SpriteAnimationData *)sprite->animationData;
    animData->animBankData        = cellAnim;
}

static void sub_02024D98(const NNSG2dMultiCellDataBank *mcelData, Sprite *sprite) {
    SpriteMultiAnimationData *animData = (SpriteMultiAnimationData *)sprite->animationData;
    animData->multiCellBank            = mcelData;
}

static void sub_02024DA0(const NNSG2dMultiCellAnimBankData *mcelAnim, Sprite *sprite) {
    SpriteMultiAnimationData *animData = (SpriteMultiAnimationData *)sprite->animationData;
    animData->multiAnimBankData        = mcelAnim;
}

static void sub_02024DA8(Sprite *sprite, HeapID heapId) {
    SpriteAnimationData *animData         = (SpriteAnimationData *)sprite->animationData;
    const NNSG2dAnimSequenceData *animSeq = NNS_G2dGetAnimSequenceByIdx(animData->animBankData, 0);
    NNS_G2dInitCellAnimation(&animData->animation, animSeq, animData->cellBank);
}

static void sub_02024DC8(const SpriteResourcesHeader *resHdr, Sprite *sprite, HeapID heapId) {
    SpriteAnimationData2 *animData = (SpriteAnimationData2 *)sprite->animationData;
    const NNSG2dCharacterData *charData;
    animData->cellTransferStateHandle = NNS_G2dGetNewCellTransferStateHandle();
    charData                          = resHdr->charData;
    NNS_G2dInitCellAnimationVramTransfered(&animData->animation, NNS_G2dGetAnimSequenceByIdx(animData->animBankData, 0), animData->cellBank, animData->cellTransferStateHandle, -1, NNS_G2dGetImageLocation(&sprite->imageProxy, NNS_G2D_VRAM_TYPE_2DMAIN), NNS_G2dGetImageLocation(&sprite->imageProxy, NNS_G2D_VRAM_TYPE_2DSUB), charData->pRawData, NULL, charData->szByte);
}

static void sub_02024E24(Sprite *sprite, HeapID heapId) {
    SpriteMultiAnimationData *animData         = (SpriteMultiAnimationData *)sprite->animationData;
    const NNSG2dMultiCellAnimSequence *animSeq = NNS_G2dGetAnimSequenceByIdx(animData->multiAnimBankData, 0);
    u16 numNodes                               = NNS_G2dGetMCBankNumNodesRequired(animData->multiCellBank);
    animData->node                             = AllocFromHeap(heapId, numNodes * sizeof(NNSG2dNode));
    animData->cellAnim                         = AllocFromHeap(heapId, numNodes * sizeof(NNSG2dCellAnimation));
    NNS_G2dInitMCAnimation(&animData->animation, animData->node, animData->cellAnim, numNodes, animData->animBankData, animData->cellBank, animData->multiCellBank);
    NNS_G2dSetAnimSequenceToMCAnimation(&animData->animation, animSeq);
}

static u32 sub_02024E84(NNSG2dImagePaletteProxy *proxy, NNS_G2D_VRAM_TYPE vramType) {
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
