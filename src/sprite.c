#include "sprite.h"

#include "global.h"

#include "math_util.h"
#include "system.h"

BOOL sub_02024544(SpriteList *spriteList);
void sub_020245D4(SpriteList *spriteList);
void sub_020245FC(Sprite *sprite);
void sub_02024EB4(SpriteList *spriteList, Sprite *sprite);
void sub_02025010(SpriteList *spriteList, Sprite *sprite);
void sub_02025014(Sprite *sprite);
void sub_02025020(Sprite *sprite);
void sub_020250D8(SpriteList *spriteList);
Sprite *sub_02025110(SpriteList *spriteList);
BOOL sub_02024CD0(SpriteList *spriteList, const SpriteResourcesHeader *resHdr, Sprite *sprite, HeapID heapId);
u8 sub_02024E84(NNSG2dImagePaletteProxy *proxy, NNS_G2D_VRAM_TYPE vramType);
void sub_02025024(SpriteList *spriteList, Sprite *sprite);
void sub_020250BC(Sprite *sprite);
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

void sub_020245D4(SpriteList *spriteList) {
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
    sprite->overwrite    = 0x11;
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
    sub_02025024(template->spriteList, sprite);
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
        sub_020250BC(sprite);
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
