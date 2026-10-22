#include "application/capsule_menu/defs.h"
#include "msgdata/msg/msg_0011.h"

#include "game_stats.h"
#include "pokemon.h"
#include "render_window.h"
#include "screen_fade.h"
#include "unk_02005D10.h"
#include "unk_02091054.h"

#define CAPSULE_INIT_STATE_ID              0
#define CAPSULE_FADE_IN_STATE_ID           1
#define CAPSULE_FADE_IN_WAIT_STATE_ID      2
#define CAPSULE_CAPSULE_SELECTION_STATE_ID 3
#define CAPSULE_CAPSULE_MENU_STATE_ID      4
#define CAPSULE_FADE_OUT_STATE_ID          5
#define CAPSULE_FADE_OUT_WAIT_STATE_ID     6
#define CAPSULE_CANCEL_PRESSED_STATE_ID    7
#define CAPSULE_EXIT_FADE_OUT_STATE_ID     8
#define CAPSULE_DEINIT_GFX_STATE_ID        9
#define CAPSULE_WAIT_EXIT_STATE_ID         10
#define CAPSULE_UNK_11_STATE_ID            11

void ov57_0223B75C(CapsuleAppManager *appMan);
void ov57_0223B78C(CapsuleAppManager *appMan);
void ov57_0223B948(CapsuleAppManager *appMan, int a1);
int ov57_0223B180(CapsuleAppManager *appMan);
void ov57_0223B700(CapsuleAppManager *appMan);
int ov57_0223A6B8(CapsuleAppManager *appMan);
int ov57_0223B620(CapsuleAppManager *appMan);
int ov57_0223AB58(CapsuleAppManager *appMan);
int ov57_0223A8FC(CapsuleAppManager *appMan);
BOOL ov57_0223A7DC(CapsuleAppManager *appMan);
void ov57_0223B12C(CapsuleAppManager *appMan);
void ov57_0223B828(CapsuleAppManager *appMan, int a1, int a2, int a3);
int ov57_0223B308(CapsuleAppManager *appMan);
BOOL ov57_0223B940(CapsuleAppManager *appMan);

extern BOOL (*const ov57_0223BEB8[])(CapsuleAppManager *appMan);

int ov57_0223A07C(BallCapsule *capsule) {
    int i;
    int result = 0;
    int sealCount;
    SEAL *seal;

    sealCount = 0;

    for (i = 0; i < MAX_SEALS_ON_CAPSULE; i++) {
        seal = CapsuleGetSealI(capsule, i);

        if (SealOnCapsuleGetID(seal) != 0) {
            sealCount++;
        }
    }

    if (sealCount != 0) {
        result = 1;
    }

    return result;
}

int ov57_0223A0A8(CapsuleAppManager *appMan, int index) {
    int pokemonIndex;
    int animIdx;
    int result;

    pokemonIndex = appMan->unk_28C[index].pokemonIndex;
    animIdx = appMan->unk_28C[index].animIdx;

    if ((pokemonIndex == 0xFF) && (animIdx == 0)) {
        result = CAPSULE_MENU_EMPTY_CAPSULE;
    } else if ((pokemonIndex == 0xFF) && (animIdx == 1)) {
        result = CAPSULE_MENU_HAS_SEALS;
    } else if ((pokemonIndex != 0xFF) && (animIdx == 1)) {
        result = CAPSULE_MENU_HAS_POKEMON;
    } else {
        result = CAPSULE_MENU_UNREACHABLE_CASE;
    }

    return result;
}

BOOL ov57_0223A0E0(CapsuleAppManager *appMan) {
    BOOL result = ov57_0223BEB8[appMan->unk_3F4](appMan);
    SpriteSystem_DrawSprites(appMan->unk_0D4.unk_00C);

    return result;
}

BOOL ov57_0223A104(CapsuleAppManager *appMan) {
    switch (appMan->unk_3FC) {
    case CAPSULE_INIT_STATE_ID: {
        NARC *narc;

        narc = NARC_New(NARC_a_0_8_7, HEAP_ID_52);

        ov57_02238DD0(appMan);
        ov57_02238E48(appMan);
        ov57_02238F48(appMan);
        ov57_02239BEC(appMan, narc);
        ov57_02239C88(appMan, narc);
        ov57_02239CE8(appMan, narc);
        ov57_02239014(appMan);
        ov57_022392F4(appMan, narc);
        ov57_022385DC(appMan);
        ov57_02237F3C(appMan);
        ov57_022383D0(appMan, 1);
        ov57_02237F14(appMan);
        ov57_02239D48(appMan, narc);
        ov57_02239EB4(appMan);
        ov57_02239114(appMan, narc);
        ov57_02239184(appMan);
        ov57_0223B75C(appMan);
        ov57_0223B78C(appMan);
        ov57_022388E4(appMan, appMan->unk_448.page);
        ov57_02238958(appMan);
        ov57_02238A00(appMan);
        ov57_0223A034(appMan, 0);
        ov57_02239240(appMan, 0);
        ov57_02238794(appMan);
        ov57_022387C0(appMan, 0);
        ov57_02239728(&appMan->unk_0D4.unk_018[3], 3, msg_0011_00007, FALSE);
        ov57_02239B94();
        ov57_0223B948(appMan, 0);
        ov57_0223866C(appMan, TRUE);
        GX_SetDispSelect(GX_DISP_SELECT_SUB_MAIN);

        NARC_Delete(narc);
    }
        appMan->unk_3FC++;
        break;

    case CAPSULE_FADE_IN_STATE_ID:
        ov57_02239BAC();
        appMan->unk_3FC++;
        break;

    case CAPSULE_FADE_IN_WAIT_STATE_ID:
        if (IsPaletteFadeFinished() != 1) {
            break;
        }

        appMan->unk_3FC++;

    case CAPSULE_CAPSULE_SELECTION_STATE_ID:
        appMan->unk_3FC = ov57_0223B180(appMan);
        break;
    case CAPSULE_CAPSULE_MENU_STATE_ID: {
        int (*callback)(CapsuleAppManager *);
        u32 result = TouchscreenListMenu_HandleInput(appMan->unk_0D4.unk_178);

        switch (result) {
        case LIST_CANCEL:
            ov57_0223B700(appMan);
            ov57_02239728(&appMan->unk_0D4.unk_018[3], 3, msg_0011_00007, FALSE);
            appMan->unk_3FC = CAPSULE_CAPSULE_SELECTION_STATE_ID;
            break;
        case LIST_NOTHING_CHOSEN:
            break;
        default:
            callback = (int (*)(CapsuleAppManager *))result;

            if (callback != NULL) {
                int result = callback(appMan);

                if (result != 1) {
                    ov57_0223B700(appMan);
                    break;
                }

                ov57_02239728(&appMan->unk_0D4.unk_018[3], 3, msg_0011_00007, FALSE);
                appMan->unk_3FC = CAPSULE_CAPSULE_SELECTION_STATE_ID;
            }
            break;
        }
    } break;
    case CAPSULE_FADE_OUT_STATE_ID:
        ov57_02239BCC();
        appMan->unk_3FC++;
        break;
    case CAPSULE_FADE_OUT_WAIT_STATE_ID:
        if (IsPaletteFadeFinished() != TRUE) {
            break;
        }
        ov57_0223864C(appMan);
        ov57_02239588(appMan);
        ov57_02238FEC(appMan);
        ov57_0223A05C(appMan);
        ov57_02239260(appMan);
        ov57_02238AC0(appMan);
        return FALSE;
    }

    ov57_02238FC4(appMan);
    ov57_02239558(appMan);

    return TRUE;
}

BOOL ov57_0223A31C(CapsuleAppManager *appMan) {
    switch (appMan->unk_3FC) {
    case CAPSULE_INIT_STATE_ID:
        appMan->unk_3FC = ov57_0223A6B8(appMan);
        break;
    case CAPSULE_CAPSULE_MENU_STATE_ID:
        appMan->unk_3FC = ov57_0223B620(appMan);
        break;
    case CAPSULE_FADE_OUT_STATE_ID:
        appMan->unk_3FC = ov57_0223AB58(appMan);
        break;
    case CAPSULE_FADE_OUT_WAIT_STATE_ID:
        ov57_02239728(&appMan->unk_0D4.unk_018[0], 0, msg_0011_00012, FALSE);
        appMan->unk_410 = 20;
        if (ov57_022384C0(appMan) == TRUE) {
            appMan->unk_0D4.unk_1B4 = TRUE;
        }
        ov57_0223853C(appMan);
        ov57_022394AC(appMan);
        GameStats_AddScore(Save_GameStats_Get(appMan->unk_000->saveData), SCORE_EVENT_BALL_CAPSULE_MODIFIED);
        if (appMan->unk_28C[appMan->unk_3EC].pokemonIndex != 0xFF) {
            Pokemon *mon = appMan->unk_000->mons[appMan->unk_28C[appMan->unk_3EC].pokemonIndex];
            SetMonData(mon, MON_DATA_BALL_CAPSULE, SealCase_GetCapsuleI(appMan->unk_000->sealCase, appMan->unk_3EC));
        }
        appMan->unk_3FC = 11;
        break;
    case CAPSULE_CANCEL_PRESSED_STATE_ID:
        appMan->unk_3FC = ov57_0223A8FC(appMan);
        break;
    case CAPSULE_UNK_11_STATE_ID:
        if (ov57_0223A7DC(appMan)) {
            return TRUE;
        }
        break;
    }

    if (appMan->unk_3FC == CAPSULE_CAPSULE_MENU_STATE_ID || appMan->unk_3FC == CAPSULE_INIT_STATE_ID) {

        if (appMan->unk_0D4.unk_000 == 0xFF) {
            TouchHitboxController_IsTriggered(appMan->unk_0D4.unk_118);
        } else {
            u32 x, y;
            int index;
            BOOL isScreenHeld;

            index = appMan->unk_0D4.unk_000;
            isScreenHeld = System_GetTouchHeldCoords(&x, &y);
            if (appMan->unk_3FC != CAPSULE_CAPSULE_MENU_STATE_ID) {
                isScreenHeld = FALSE;
            }

            if (isScreenHeld) {
                int sealIndex;

                sealIndex = CapsuleMenu_GetSealNameIndex(appMan->unk_34C[index].type);
                ov57_02239B2C(&appMan->unk_0D4.unk_018[0], sealIndex);
                ManagedSprite_SetPositionXY(appMan->unk_34C[index].sprite, x, y);
                ov57_0223848C(appMan, index);
                ov57_02238508(appMan, index);
            } else {
                BOOL valid;

                valid = ov57_022383F8(appMan, index);
                ov57_02237EB8(appMan->unk_34C[index].touchscreenHitbox, appMan->unk_34C[index].sprite, 0);

                if (valid == 0) {
                    GiveOrTakeSeal2(appMan->unk_000->sealCase, appMan->unk_34C[index].type, 1);
                    ov57_022399F8(appMan);
                    ov57_02238438(appMan, index);
                }

                PlaySE(SEQ_SE_DP_BOX01);
                appMan->unk_0D4.unk_000 = 0xFF;
                ov57_02239B2C(appMan->unk_0D4.unk_018, 0xFFFF);
            }
        }
    }

    ov57_0223A058(appMan);
    ov57_0223921C(appMan);
    ov57_02238FC4(appMan);
    ov57_02239558(appMan);
    return TRUE;
}

BOOL ov57_0223A504(CapsuleAppManager *appMan) {
    switch (appMan->unk_3FC) {
    case CAPSULE_INIT_STATE_ID:
        ov57_0223BC4C(appMan, appMan->unk_3EC);
        ov57_02239728(&appMan->unk_0D4.unk_018[0], 0, msg_0011_00009, TRUE);
        appMan->unk_3FC++;
        break;
    case CAPSULE_FADE_IN_STATE_ID:
        ov57_0223B12C(appMan);
        if (gSystem.newKeys & (PAD_BUTTON_A | PAD_BUTTON_B | PAD_KEY_RIGHT | PAD_KEY_LEFT | PAD_KEY_UP | PAD_KEY_DOWN | PAD_BUTTON_X | PAD_BUTTON_Y) || System_GetTouchNew()) {
            appMan->unk_3FC++;
        }
        break;
    case CAPSULE_FADE_IN_WAIT_STATE_ID:
        ov57_0223B828(appMan, 0, 0xFF, 0);
        ClearWindowPixelBuffer(&appMan->unk_0D4.unk_018[0], TRUE);
        ClearWindowTilemapAndScheduleTransfer(&appMan->unk_0D4.unk_018[0]);
        ov57_0223866C(appMan, TRUE);
        ov57_02239728(&appMan->unk_0D4.unk_018[3], 3, msg_0011_00007, FALSE);
    }

    ov57_02238FC4(appMan);
    ov57_02239558(appMan);

    return TRUE;
}

BOOL ov57_0223A5AC(CapsuleAppManager *appMan) {
    switch (appMan->unk_3FC) {
    case CAPSULE_INIT_STATE_ID:
        ManagedSprite_SetDrawPriority(appMan->unk_31C[0], 25);
        ManagedSprite_SetDrawPriority(appMan->unk_31C[1], 20);
        ManagedSprite_SetAnim(appMan->unk_31C[0], 1);
        ov57_02239728(&appMan->unk_0D4.unk_018[3], 3, msg_0011_00010, 0);
        ManagedSprite_SetDrawFlag(appMan->unk_31C[1], 1);
        appMan->unk_3FC++;
    case CAPSULE_FADE_IN_STATE_ID:
        appMan->unk_3FC = ov57_0223B308(appMan);
        break;
    case CAPSULE_FADE_IN_WAIT_STATE_ID:
        ov57_0223B12C(appMan);
        if (gSystem.newKeys & (PAD_BUTTON_A | PAD_BUTTON_B | PAD_KEY_RIGHT | PAD_KEY_LEFT | PAD_KEY_UP | PAD_KEY_DOWN | PAD_BUTTON_X | PAD_BUTTON_Y) || System_GetTouchNew()) {
            appMan->unk_3FC = CAPSULE_CAPSULE_SELECTION_STATE_ID;
        }
        break;
    case CAPSULE_CAPSULE_SELECTION_STATE_ID:
        ManagedSprite_SetDrawPriority(appMan->unk_31C[0], 20);
        ManagedSprite_SetDrawPriority(appMan->unk_31C[1], 25);
        ov57_0223B828(appMan, 0, 0xFF, 0);
        ManagedSprite_SetAnim(appMan->unk_31C[0], 0);
        ClearWindowPixelBuffer(&appMan->unk_0D4.unk_018[0], TRUE);
        ClearWindowTilemapAndScheduleTransfer(&appMan->unk_0D4.unk_018[0]);
        ov57_0223866C(appMan, TRUE);
        ov57_02239728(&appMan->unk_0D4.unk_018[3], 3, msg_0011_00007, 0);
        break;
    }

    ov57_02238FC4(appMan);
    ov57_02239558(appMan);

    return TRUE;
}

BOOL ov57_0223A6B4(CapsuleAppManager *appMan) {
    return FALSE;
}

int ov57_0223A6B8(CapsuleAppManager *appMan) {
    switch (appMan->unk_404) {
    case 0:
        ov57_0223B948(appMan, 0);
        ov57_022398C4(appMan);
        ov57_022399F8(appMan);
        ov57_0223B75C(appMan);
        ov57_0223B78C(appMan);
        appMan->unk_0D4.unk_1B4 = 0;
        appMan->unk_410 = 0;
        ov57_02239BCC();
        ++appMan->unk_404;
        break;
    case 1:
        if (ov57_0223B940(appMan) == TRUE) {
            break;
        }
        if (IsPaletteFadeFinished() != TRUE) {
            break;
        }
        GfGfx_EngineATogglePlanes(GX_PLANEMASK_OBJ, GF_PLANE_TOGGLE_OFF);
        GfGfx_EngineBTogglePlanes(GX_PLANEMASK_BG2, GF_PLANE_TOGGLE_ON);
        SetBgPriority(GF_BG_LYR_SUB_3, 1);
        ov57_0223A034(appMan, TRUE);
        ov57_02239240(appMan, TRUE);
        ov57_022387C0(appMan, TRUE);
        ov57_02238AF0(appMan, TRUE);
        ManagedSprite_SetAnimationFrame(appMan->unk_414[8], 0);
        ManagedSprite_SetAnimationFrame(appMan->unk_414[9], 0);
        ManagedSprite_SetAnimationFrame(appMan->unk_414[10], 0);
        SetBgPriority(GF_BG_LYR_MAIN_3, 1);
        ClearWindowTilemapAndCopyToVram(&appMan->unk_0D4.unk_018[3]);
        ov57_02239728(&appMan->unk_0D4.unk_018[0], 0, 0xFFFF, TRUE);
        GX_SetDispSelect(GX_DISP_SELECT_MAIN_SUB);
        ov57_02239BAC();
        ++appMan->unk_404;
        break;
    case 2:
        if (IsPaletteFadeFinished() != TRUE) {
            break;
        }
        ov57_0223B948(appMan, 1);
        appMan->unk_404 = 0;
        return 4;
    }

    return 0;
}

BOOL ov57_0223A7DC(CapsuleAppManager *appMan) {
    switch (appMan->unk_404) {
    case 0:
        if (appMan->unk_410 > 0) {
            --appMan->unk_410;
            return FALSE;
        }
        appMan->unk_410 = 0;
        ov57_02239BCC();
        ++appMan->unk_404;
        break;
    case 1:
        if (IsPaletteFadeFinished() != TRUE) {
            break;
        }
        GfGfx_EngineATogglePlanes(GX_PLANEMASK_OBJ, GF_PLANE_TOGGLE_ON);
        SetBgPriority(GF_BG_LYR_MAIN_3, 3);
        SetBgPriority(GF_BG_LYR_SUB_3, 3);
        GfGfx_EngineBTogglePlanes(GX_PLANEMASK_BG2, GF_PLANE_TOGGLE_OFF);
        ov57_0223A034(appMan, FALSE);
        ov57_02239240(appMan, FALSE);
        ov57_022387C0(appMan, FALSE);
        ClearWindowPixelBuffer(&appMan->unk_0D4.unk_018[0], TRUE);
        ov57_02239728(&appMan->unk_0D4.unk_018[3], 3, msg_0011_00007, FALSE);
        CopyWindowToVram(&appMan->unk_0D4.unk_018[3]);
        ov57_0223866C(appMan, TRUE);
        GX_SetDispSelect(GX_DISP_SELECT_SUB_MAIN);
        ov57_02238AF0(appMan, -1);
        ov57_0223B948(appMan, 0);
        ov57_02239BAC();
        ++appMan->unk_404;
        break;
    case 2:
        if (ov57_0223B940(appMan) == TRUE) {
            break;
        }
        if (IsPaletteFadeFinished() != TRUE) {
            break;
        }
        ManagedSprite_SetDrawFlag(appMan->unk_31C[1], FALSE);
        ov57_0223B828(appMan, 0, 0xFF, 0);
        ov57_02239B0C(appMan);
        appMan->unk_404 = 0;
        return TRUE;
    }

    return FALSE;
}
