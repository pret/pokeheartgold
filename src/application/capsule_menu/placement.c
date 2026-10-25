#include "application/capsule_menu/capsule_menu.h"
#include "application/capsule_menu/defs.h"

#include "overlay_07.h"

static void SealPlacement_SetSealRenderPriorities(CapsuleAppManager *appMan, u8 index);
static BOOL SealPlacement_InitSeal(CapsuleAppManager *appMan, u8 sealIndex);

static void SealPlacement_SealTouchRange(TouchscreenHitbox *rect, u8 x, u8 y) {
    rect->rect.top = y - 10;
    rect->rect.left = x - 10;
    rect->rect.bottom = y + 10;
    rect->rect.right = x + 10;
}

static void SealPlacement_ScreenRect(TouchscreenHitbox *rect) {
    rect->rect.top = 0;
    rect->rect.left = 0;
    rect->rect.bottom = 192;
    rect->rect.right = 255;
}

void SealPlacement_UpdateSealTouchRect(TouchscreenHitbox *rect, ManagedSprite *sprite, BOOL touchingSprite) {
    s16 x, y;

    if (sprite == NULL) {
        return;
    }

    if (touchingSprite == TRUE) {
        ManagedSprite_SetPositionXY(sprite, gSystem.touchX, gSystem.touchY);
        ManagedSprite_GetPositionXY(sprite, &x, &y);
        SealPlacement_ScreenRect(rect);
    } else {
        ManagedSprite_GetPositionXY(sprite, &x, &y);
        SealPlacement_SealTouchRange(rect, x, y);
    }
}

void SealPlacement_OffsetSeals(CapsuleAppManager *appManager) {
    for (int i = 0; i < MAX_SEALS_ON_CAPSULE; ++i) {
        if (appManager->sealRenderInfo[i].sprite == NULL) {
            continue;
        }
        ManagedSprite_OffsetPositionXY(appManager->sealRenderInfo[i].sprite, -56, 16);
    }
}

void SealPlacement_UpdateSealsFromCapsule(CapsuleAppManager *appManager) {
    BallCapsule *capsule = appManager->capsules[appManager->capsuleIndex[0]].capsule;

    for (int i = 0; i < MAX_SEALS_ON_CAPSULE; i++) {
        if (capsule->seals[i].kind != SEAL_NONE) {
            appManager->sealRenderInfo[i].type = capsule->seals[i].kind;
            appManager->sealRenderInfo[i].x = capsule->seals[i].x;
            appManager->sealRenderInfo[i].y = capsule->seals[i].y;

            SealPlacement_InitSeal(appManager, i);
            SealPlacement_UpdateSealTouchRect(appManager->sealRenderInfo[i].touchscreenHitbox, appManager->sealRenderInfo[i].sprite, FALSE);

            appManager->sealRenderInfo[i].shouldRender = TRUE;
        } else {
            appManager->sealRenderInfo[i].shouldRender = FALSE;
            appManager->sealRenderInfo[i].type = 0;
        }
    }
}

int SealPlacement_GetTouchedSeal(CapsuleAppManager *appMan, u8 sealIndex) {
    u32 touchX, touchY;

    for (int i = 0; i < MAX_SEALS_ON_CAPSULE; i++) {
        if (appMan->sealRenderInfo[i].shouldRender == TRUE) {
            continue;
        }

        appMan->sealRenderInfo[i].type = appMan->sealPages.sealIDs[sealIndex];
        appMan->sealRenderInfo[i].x = 190;
        appMan->sealRenderInfo[i].y = 70;

        System_GetTouchHeldCoords(&touchX, &touchY);

        appMan->sealRenderInfo[i].x = touchX;
        appMan->sealRenderInfo[i].y = touchY;

        SealPlacement_InitSeal(appMan, i);
        SealPlacement_SetSealRenderPriorities(appMan, i);

        appMan->sealRenderInfo[i].shouldRender = TRUE;

        return i;
    }

    return 0xFF;
}

BOOL SealPlacement_NotMaxSeals(CapsuleAppManager *appMan) {
    for (int i = 0; i < MAX_SEALS_ON_CAPSULE; i++) {
        if (appMan->sealRenderInfo[i].shouldRender == TRUE) {
            continue;
        }

        return TRUE;
    }

    return FALSE;
}

static void SealPlacement_SetSealRenderPriorities(CapsuleAppManager *appMan, u8 index) {
    for (int i = 0; i < MAX_SEALS_ON_CAPSULE; i++) {
        if (appMan->sealRenderInfo[i].shouldRender != TRUE) {
            continue;
        }

        if (i == index) {
            ManagedSprite_SetDrawPriority(appMan->sealRenderInfo[i].sprite, 0);
        } else {
            int priority = ManagedSprite_GetDrawPriority(appMan->sealRenderInfo[i].sprite);

            if (priority == 0) {
                ManagedSprite_SetDrawPriority(appMan->sealRenderInfo[i].sprite, priority + 1);
            } else {
                ManagedSprite_SetDrawPriority(appMan->sealRenderInfo[i].sprite, priority + 2);
            }
        }
    }
}

#define MAKE_OBJECT_TAG(type, fileIdx) (20000 + (type) * 1000 + (fileIdx))

static void SealPlacement_LoadSeal(CapsuleAppManager *appMan, u8 type, u8 sealIndex) {
    SpriteSystem *spriteSystem = appMan->graphicsMan.spriteSystem;
    SpriteManager *spriteManager = appMan->graphicsMan.spriteManager;
    PaletteData *paletteData = appMan->graphicsMan.paletteData;

    SpriteSystem_LoadPaletteBuffer(paletteData, PLTTBUF_SUB_OBJ, spriteSystem, spriteManager, NARC_a_0_8_7, 6, 0, 1, NNS_G2D_VRAM_TYPE_2DSUB, MAKE_OBJECT_TAG(GF_GFX_RES_TYPE_PLTT, 6));

    int memberIdx = CapsuleMenu_GetSealMemberIdx(type);
    int objID = MAKE_OBJECT_TAG(GF_GFX_RES_TYPE_CHAR, sealIndex);

    SpriteSystem_LoadCharResObj(spriteSystem, spriteManager, NARC_a_0_8_7, memberIdx, TRUE, NNS_G2D_VRAM_TYPE_2DSUB, objID);
    SpriteSystem_LoadCellResObj(spriteSystem, spriteManager, NARC_a_0_8_7, 38, TRUE, MAKE_OBJECT_TAG(GF_GFX_RES_TYPE_CELL, 38));
    SpriteSystem_LoadAnimResObj(spriteSystem, spriteManager, NARC_a_0_8_7, 36, TRUE, MAKE_OBJECT_TAG(GF_GFX_RES_TYPE_ANIM, 36));
}

void SealPlacement_UpdateSeals(CapsuleAppManager *appMan) {
    int i;
    int dummy;
    int priorities[MAX_SEALS_ON_CAPSULE];
    int indices[MAX_SEALS_ON_CAPSULE];

    if (appMan->graphicsMan.sealsChanged == FALSE) {
        return;
    }

    appMan->graphicsMan.sealsChanged = FALSE;

    dummy = 0;

    for (i = 0; i < MAX_SEALS_ON_CAPSULE; i++) {
        priorities[i] = 0xFF;
        indices[i] = 0xFF;

        if (appMan->sealRenderInfo[i].sprite != NULL) {
            priorities[i] = ManagedSprite_GetDrawPriority(appMan->sealRenderInfo[i].sprite);
            indices[i] = i;
            dummy++;
        }
    }

    int tmp1;
    int tmp2;

    for (i = 0; i < MAX_SEALS_ON_CAPSULE - 1; i++) {
        for (int j = MAX_SEALS_ON_CAPSULE - 1; j > i; j--) {
            if (priorities[j - 1] >= priorities[j]) {
                tmp1 = priorities[j];
                tmp2 = indices[j];
                priorities[j] = priorities[j - 1];
                indices[j] = indices[j - 1];
                priorities[j - 1] = tmp1;
                indices[j - 1] = tmp2;
            }
        }
    }

    BallCapsule capsule;
    BallCapsule capsule_dupe;

    for (i = 0; i < MAX_SEALS_ON_CAPSULE; i++) {
        capsule.seals[i].kind = appMan->sealRenderInfo[i].type;
        capsule.seals[i].x = appMan->sealRenderInfo[i].x;
        capsule.seals[i].y = appMan->sealRenderInfo[i].y;
    }

    capsule_dupe = capsule;

    for (i = 0; i < MAX_SEALS_ON_CAPSULE; i++) {
        if (indices[i] == 0xFF) {
            appMan->sealRenderInfo[i].type = 0;
            appMan->sealRenderInfo[i].x = 0;
            appMan->sealRenderInfo[i].y = 0;
            continue;
        }

        appMan->sealRenderInfo[i].type = capsule_dupe.seals[indices[i]].kind;
        appMan->sealRenderInfo[i].x = capsule_dupe.seals[indices[i]].x;
        appMan->sealRenderInfo[i].y = capsule_dupe.seals[indices[i]].y;

        if (appMan->sealRenderInfo[indices[i]].sprite == NULL) {
            continue;
        }

        ManagedSprite_SetDrawPriority(appMan->sealRenderInfo[indices[i]].sprite, i);
    }
}

static BOOL SealPlacement_InitSeal(CapsuleAppManager *appMan, u8 sealIndex) {
    int dummy;
    SealRenderInfo *sealInfo;
    ManagedSpriteTemplate spriteTemplate;
    SpriteSystem *spriteSystem = appMan->graphicsMan.spriteSystem;
    SpriteManager *spriteManager = appMan->graphicsMan.spriteManager;
    PaletteData *paletteData = appMan->graphicsMan.paletteData;
    sealInfo = &appMan->sealRenderInfo[sealIndex];

    if (sealInfo->shouldRender == TRUE) {
        GF_ASSERT(FALSE);
        return FALSE;
    }

    SealPlacement_LoadSeal(appMan, sealInfo->type, sealIndex);

    spriteTemplate.x = sealInfo->x;
    spriteTemplate.y = sealInfo->y;
    spriteTemplate.z = 0;
    spriteTemplate.animation = 0;
    spriteTemplate.pal = 0;
    spriteTemplate.vramTransfer = FALSE;
    spriteTemplate.drawPriority = 0;
    spriteTemplate.vram = NNS_G2D_VRAM_TYPE_2DSUB;
    spriteTemplate.bgPriority = 1;
    spriteTemplate.resIdList[GF_GFX_RES_TYPE_MCEL] = -1;
    spriteTemplate.resIdList[GF_GFX_RES_TYPE_MANM] = -1;

    dummy = CapsuleMenu_GetSealMemberIdx(sealInfo->type);

    spriteTemplate.resIdList[GF_GFX_RES_TYPE_CHAR] = MAKE_OBJECT_TAG(GF_GFX_RES_TYPE_CHAR, sealIndex);
    spriteTemplate.resIdList[GF_GFX_RES_TYPE_PLTT] = MAKE_OBJECT_TAG(GF_GFX_RES_TYPE_PLTT, 6);
    spriteTemplate.resIdList[GF_GFX_RES_TYPE_CELL] = MAKE_OBJECT_TAG(GF_GFX_RES_TYPE_CELL, 38);
    spriteTemplate.resIdList[GF_GFX_RES_TYPE_ANIM] = MAKE_OBJECT_TAG(GF_GFX_RES_TYPE_ANIM, 36);
    sealInfo->sprite = SpriteSystem_NewSprite(spriteSystem, spriteManager, &spriteTemplate);

    ManagedSprite_TickFrame(sealInfo->sprite);

    return TRUE;
}

BOOL SealPlacement_HandleTouchscreen(CapsuleAppManager *appMan, u32 touchscreenState, u8 index) {
    if (appMan->sealRenderInfo[index].shouldRender == 0) {
        return 1;
    }

    switch (touchscreenState) {
    case TOUCH_BUTTON_PRESSED:
        if (appMan->graphicsMan.index == 0xFF) {
            appMan->graphicsMan.index = index;
            SealPlacement_SetSealRenderPriorities(appMan, index);
        }
        break;
    case TOUCH_BUTTON_HELD: {
        if (appMan->graphicsMan.index == index) {
            SealPlacement_UpdateSealTouchRect(appMan->sealRenderInfo[index].touchscreenHitbox, appMan->sealRenderInfo[index].sprite, TRUE);
            SealPlacement_UpdateSealOamMode(appMan, index);
            SealPlacement_UpdateSealXY(appMan, index);
        }
    } break;
    case TOUCH_BUTTON_HELD_OUT_OF_BOUNDS:
    case TOUCH_BUTTON_RELEASED: {
        BOOL isValid;

        if (appMan->graphicsMan.index == 0xFF) {
            isValid = SealPlacement_SealIsValid(appMan, index);
            SealPlacement_UpdateSealTouchRect(appMan->sealRenderInfo[index].touchscreenHitbox, appMan->sealRenderInfo[index].sprite, FALSE);

            if (!isValid) {
                SealPlacement_FreeSeal(appMan, index);
            }

            appMan->graphicsMan.index = 0xFF;
        }
    } break;
    default:
        GF_ASSERT(FALSE);
        break;
    }

    return 1;
}

void SealPlacement_FreeInactiveSeals(CapsuleAppManager *appMan) {
    for (int i = 0; i < MAX_SEALS_ON_CAPSULE; i++) {
        if (appMan->sealRenderInfo[i].shouldRender != TRUE) {
            continue;
        }

        SealPlacement_FreeSeal(appMan, i);
    }
}

void SealPlacement_DrawActiveSeals(CapsuleAppManager *appMan, int flag) {
    for (int i = 0; i < MAX_SEALS_ON_CAPSULE; i++) {
        if (appMan->sealRenderInfo[i].shouldRender != TRUE) {
            continue;
        }

        ManagedSprite_SetDrawFlag(appMan->sealRenderInfo[i].sprite, flag);
    }
}

BOOL SealPlacement_SealIsValid(CapsuleAppManager *appMan, int index) {
    int distance;
    s16 x, y;

    if (!appMan->sealRenderInfo[index].shouldRender) {
        return TRUE;
    }

    ManagedSprite_GetPositionXY(appMan->sealRenderInfo[index].sprite, &x, &y);
    distance = ov07_022344E4(x, y, 190, 70);

    if (distance > 60) {
        return FALSE;
    }

    return TRUE;
}

void SealPlacement_FreeSeal(CapsuleAppManager *appMan, int sealIndex) {
    int dummy;

    dummy = CapsuleMenu_GetSealMemberIdx(appMan->sealRenderInfo[sealIndex].type);

    SpriteManager_UnloadCharObjById(appMan->graphicsMan.spriteManager, MAKE_OBJECT_TAG(GF_GFX_RES_TYPE_CHAR, sealIndex));
    Sprite_DeleteAndFreeResources(appMan->sealRenderInfo[sealIndex].sprite);

    appMan->sealRenderInfo[sealIndex].sprite = NULL;
    appMan->sealRenderInfo[sealIndex].shouldRender = FALSE;
    appMan->sealRenderInfo[sealIndex].type = 0;
    appMan->sealRenderInfo[sealIndex].x = 0;
    appMan->sealRenderInfo[sealIndex].y = 0;

    SealPlacement_SealTouchRange(appMan->sealRenderInfo[sealIndex].touchscreenHitbox, 0, 0);
}

void SealPlacement_UpdateSealOamMode(CapsuleAppManager *appMan, int index) {
    BOOL isValid = SealPlacement_SealIsValid(appMan, index);

    if (!isValid) {
        ManagedSprite_SetOamMode(appMan->sealRenderInfo[index].sprite, GX_OAM_MODE_XLU);
    } else {
        ManagedSprite_SetOamMode(appMan->sealRenderInfo[index].sprite, GX_OAM_MODE_NORMAL);
    }
}

BOOL SealPlacement_AnySealsChanged(CapsuleAppManager *appMan) {
    int index;
    BallCapsule *capsule;

    index = appMan->capsuleIndex[0];
    capsule = appMan->capsules[index].capsule;

    for (int i = 0; i < MAX_SEALS_ON_CAPSULE; i++) {
        if ((appMan->sealRenderInfo[i].type != capsule->seals[i].kind)
            || (appMan->sealRenderInfo[i].x != capsule->seals[i].x)
            || (appMan->sealRenderInfo[i].y != capsule->seals[i].y)) {
            return TRUE;
        }
    }

    return FALSE;
}

void SealPlacement_UpdateSealXY(CapsuleAppManager *appMan, int sealIndex) {
    s16 x, y;

    ManagedSprite_GetPositionXY(appMan->sealRenderInfo[sealIndex].sprite, &x, &y);

    appMan->sealRenderInfo[sealIndex].x = (u8)x;
    appMan->sealRenderInfo[sealIndex].y = (u8)y;
}

void SealPlacement_LoadCapsuleSeals(CapsuleAppManager *appMan) {
    BallCapsule capsule;

    for (int i = 0; i < MAX_SEALS_ON_CAPSULE; i++) {
        capsule.seals[i].kind = appMan->sealRenderInfo[i].type;
        capsule.seals[i].x = appMan->sealRenderInfo[i].x;
        capsule.seals[i].y = appMan->sealRenderInfo[i].y;
    }

    SealCase_SetCapsuleI(appMan->appData->sealCase, &capsule, appMan->capsuleIndex[0]);
}

void SealPlacement_GetCapsuleSeals(BallCapsule *capsule, CapsuleAppManager *appMan) {
    for (int i = 0; i < MAX_SEALS_ON_CAPSULE; i++) {
        capsule->seals[i].kind = appMan->sealRenderInfo[i].type;
        capsule->seals[i].x = appMan->sealRenderInfo[i].x;
        capsule->seals[i].y = appMan->sealRenderInfo[i].y;
    }
}
