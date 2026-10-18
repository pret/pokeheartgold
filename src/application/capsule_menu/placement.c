#include "application/capsule_menu/defs.h"

#include "unk_02091054.h"

void ov57_02238044(CapsuleAppManager *appManager, u8 index);

void ov57_02237E90(TouchscreenHitbox *rect, u8 x, u8 y) {
    rect->rect.top = y - 10;
    rect->rect.left = x - 10;
    rect->rect.bottom = y + 10;
    rect->rect.right = x + 10;
}

void ov57_02237EA8(TouchscreenHitbox *rect) {
    rect->rect.top = 0;
    rect->rect.left = 0;
    rect->rect.bottom = 192;
    rect->rect.right = 255;
}

void ov57_02237EB8(TouchscreenHitbox *rect, ManagedSprite *sprite, BOOL touchingSprite) {
    s16 x, y;

    if (sprite == NULL) {
        return;
    }

    if (touchingSprite == TRUE) {
        ManagedSprite_SetPositionXY(sprite, gSystem.touchX, gSystem.touchY);
        ManagedSprite_GetPositionXY(sprite, &x, &y);
        ov57_02237EA8(rect);
    } else {
        ManagedSprite_GetPositionXY(sprite, &x, &y);
        ov57_02237E90(rect, x, y);
    }
}

void ov57_02237F14(CapsuleAppManager *appManager) {
    for (int i = 0; i < MAX_SEALS_ON_CAPSULE; ++i) {
        if (appManager->unk_34C[i].sprite == NULL) {
            continue;
        }
        ManagedSprite_OffsetPositionXY(appManager->unk_34C[i].sprite, -56, 16);
    }
}

void ov57_02237F3C(CapsuleAppManager *appManager) {
    BallCapsule *capsule = appManager->unk_004[appManager->unk_3EC].capsule;

    for (int i = 0; i < MAX_SEALS_ON_CAPSULE; i++) {
        if (capsule->seals[i].kind != SEAL_NONE) {
            appManager->unk_34C[i].type = capsule->seals[i].kind;
            appManager->unk_34C[i].x = capsule->seals[i].x;
            appManager->unk_34C[i].y = capsule->seals[i].y;

            ov57_02238260(appManager, i);
            ov57_02237EB8(appManager->unk_34C[i].touchscreenHitbox, appManager->unk_34C[i].sprite, FALSE);

            appManager->unk_34C[i].shouldRender = TRUE;
        } else {
            appManager->unk_34C[i].shouldRender = FALSE;
            appManager->unk_34C[i].type = 0;
        }
    }
}

int ov57_02237FAC(CapsuleAppManager *appMan, u8 sealIndex) {
    u32 touchX, touchY;

    for (int i = 0; i < MAX_SEALS_ON_CAPSULE; i++) {
        if (appMan->unk_34C[i].shouldRender == TRUE) {
            continue;
        }

        appMan->unk_34C[i].type = appMan->unk_448.sealIDs[sealIndex];
        appMan->unk_34C[i].x = 190;
        appMan->unk_34C[i].y = 70;

        System_GetTouchHeldCoords(&touchX, &touchY);

        appMan->unk_34C[i].x = touchX;
        appMan->unk_34C[i].y = touchY;

        ov57_02238260(appMan, i);
        ov57_02238044(appMan, i);

        appMan->unk_34C[i].shouldRender = TRUE;

        return i;
    }

    return 0xFF;
}

BOOL ov57_02238028(CapsuleAppManager *appMan) {
    for (int i = 0; i < MAX_SEALS_ON_CAPSULE; i++) {
        if (appMan->unk_34C[i].shouldRender == TRUE) {
            continue;
        }

        return TRUE;
    }

    return FALSE;
}

void ov57_02238044(CapsuleAppManager *appMan, u8 index) {
    for (int i = 0; i < MAX_SEALS_ON_CAPSULE; i++) {
        if (appMan->unk_34C[i].shouldRender != TRUE) {
            continue;
        }

        if (i == index) {
            ManagedSprite_SetDrawPriority(appMan->unk_34C[i].sprite, 0);
        } else {
            int priority = ManagedSprite_GetDrawPriority(appMan->unk_34C[i].sprite);

            if (priority == 0) {
                ManagedSprite_SetDrawPriority(appMan->unk_34C[i].sprite, priority + 1);
            } else {
                ManagedSprite_SetDrawPriority(appMan->unk_34C[i].sprite, priority + 2);
            }
        }
    }
}

#define MAKE_OBJECT_TAG(type, fileIdx) (20000 + (type) * 1000 + (fileIdx))

void ov57_0223809C(CapsuleAppManager *appMan, u8 type, u8 sealIndex) {
    SpriteSystem *spriteSystem = appMan->unk_0D4.unk_008;
    SpriteManager *spriteManager = appMan->unk_0D4.unk_00C;
    PaletteData *paletteData = appMan->unk_0D4.unk_014;

    SpriteSystem_LoadPaletteBuffer(paletteData, PLTTBUF_SUB_OBJ, spriteSystem, spriteManager, NARC_a_0_8_7, 6, 0, 1, NNS_G2D_VRAM_TYPE_2DSUB, MAKE_OBJECT_TAG(GF_GFX_RES_TYPE_PLTT, 6));

    int memberIdx = CapsuleMenu_GetSealMemberIdx(type);
    int objID = MAKE_OBJECT_TAG(GF_GFX_RES_TYPE_CHAR, sealIndex);

    SpriteSystem_LoadCharResObj(spriteSystem, spriteManager, NARC_a_0_8_7, memberIdx, TRUE, NNS_G2D_VRAM_TYPE_2DSUB, objID);
    SpriteSystem_LoadCellResObj(spriteSystem, spriteManager, NARC_a_0_8_7, 38, TRUE, MAKE_OBJECT_TAG(GF_GFX_RES_TYPE_CELL, 38));
    SpriteSystem_LoadAnimResObj(spriteSystem, spriteManager, NARC_a_0_8_7, 36, TRUE, MAKE_OBJECT_TAG(GF_GFX_RES_TYPE_ANIM, 36));
}

void ov57_02238134(CapsuleAppManager *appMan) {
    int i;
    int dummy;
    int priorities[8];
    int indices[8];

    if (appMan->unk_0D4.unk_1B4 == FALSE) {
        return;
    }

    appMan->unk_0D4.unk_1B4 = FALSE;

    dummy = 0;

    for (i = 0; i < MAX_SEALS_ON_CAPSULE; i++) {
        priorities[i] = 0xFF;
        indices[i] = 0xFF;

        if (appMan->unk_34C[i].sprite != NULL) {
            priorities[i] = ManagedSprite_GetDrawPriority(appMan->unk_34C[i].sprite);
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
        capsule.seals[i].kind = appMan->unk_34C[i].type;
        capsule.seals[i].x = appMan->unk_34C[i].x;
        capsule.seals[i].y = appMan->unk_34C[i].y;
    }

    capsule_dupe = capsule;

    for (i = 0; i < MAX_SEALS_ON_CAPSULE; i++) {
        if (indices[i] == 0xFF) {
            appMan->unk_34C[i].type = 0;
            appMan->unk_34C[i].x = 0;
            appMan->unk_34C[i].y = 0;
            continue;
        }

        appMan->unk_34C[i].type = capsule_dupe.seals[indices[i]].kind;
        appMan->unk_34C[i].x = capsule_dupe.seals[indices[i]].x;
        appMan->unk_34C[i].y = capsule_dupe.seals[indices[i]].y;

        if (appMan->unk_34C[indices[i]].sprite == NULL) {
            continue;
        }

        ManagedSprite_SetDrawPriority(appMan->unk_34C[indices[i]].sprite, i);
    }
}
