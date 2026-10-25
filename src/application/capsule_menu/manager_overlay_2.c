#include "application/capsule_menu/defs.h"
#include "battle/battle.h"
#include "msgdata/msg/msg_0011.h"

#include "game_stats.h"
#include "overlay_07.h"
#include "pokemon.h"
#include "render_window.h"
#include "screen_fade.h"
#include "unk_02005D10.h"
#include "unk_02091054.h"
#include "yes_no_prompt.h"

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

#define THROW_INIT_GFX_STATE_ID              0
#define THROW_WAIT_INIT_THROW_STATE_ID       1
#define THROW_SET_CAPSULE_STATE_ID           2
#define THROW_WAIT_FOR_END_STATE_ID          3
#define THROW_WAIT_FOR_ROTATION_END_STATE_ID 4
#define THROW_WAIT_FOR_ANIMS_END_STATE_ID    5
#define THROW_WAIT_AFTER_ANIMS_END_STATE_ID  6
#define THROW_WAIT_FREE_STATE_ID             7

typedef struct {
    int frame;
    ManagedSprite *sprite;
    TextOBJ *fontOAM;
} CapsuleUIPressTask;

BOOL ov57_0223A104(CapsuleAppManager *appMan);
BOOL ov57_0223A31C(CapsuleAppManager *appMan);
BOOL ov57_0223A504(CapsuleAppManager *appMan);
BOOL ov57_0223A5AC(CapsuleAppManager *appMan);
BOOL ov57_0223A6B4(CapsuleAppManager *appMan);
int ov57_0223A6B8(CapsuleAppManager *appMan);
BOOL ov57_0223A7DC(CapsuleAppManager *appMan);
int ov57_0223A8FC(CapsuleAppManager *appMan);
int ov57_0223AB58(CapsuleAppManager *appMan);
BOOL ov57_0223B12C(CapsuleAppManager *appMan);
int ov57_0223B180(CapsuleAppManager *appMan);
int ov57_0223B288(CapsuleAppManager *appMan);
int ov57_0223B2EC(CapsuleAppManager *appMan);
int ov57_0223B308(CapsuleAppManager *appMan);
int ov57_0223B32C(CapsuleAppManager *appMan, BOOL a1);
int ov57_0223B3A4(CapsuleAppManager *appMan, u8 a1);
int ov57_0223B3F8(CapsuleAppManager *appMan);
int ov57_0223B45C(CapsuleAppManager *appMan);
BOOL ov57_0223B478(int *a0);
void ov57_0223B504(CapsuleAppManager *appMan, int a1, BOOL a2);
int ov57_0223B578(CapsuleAppManager *appMan);
int ov57_0223B620(CapsuleAppManager *appMan);
BOOL ov57_0223B6F0(CapsuleAppManager *appMan);
BOOL ov57_0223B700(CapsuleAppManager *appMan);
BOOL ov57_0223B714(CapsuleAppManager *appMan);
BOOL ov57_0223B73C(CapsuleAppManager *appMan);
BOOL ov57_0223B74C(CapsuleAppManager *appMan);
void ov57_0223B75C(CapsuleAppManager *appMan);
void ov57_0223B774(CapsuleAppManager *appMan);
void ov57_0223B78C(CapsuleAppManager *appMan);
void ov57_0223B7A8(CapsuleAppManager *appMan);
void ov57_0223B7C4(CapsuleAppManager *appMan);
void ov57_0223B828(CapsuleAppManager *appMan, int a1, int a2, int a3);
void ov57_0223B90C(ManagedSprite *sprite, TextOBJ *textObj);
BOOL ov57_0223B940(CapsuleAppManager *appMan);
void ov57_0223B948(CapsuleAppManager *appMan, int a1);
void ov57_0223B950(CapsuleAppManager *appMan);
void ov57_0223B9C8(CapsuleAppManager *appMan);
void ov57_0223BA1C(CapsuleAppManager *appMan);
BOOL ov57_0223BA40(CapsuleAppManager *appMan);
BOOL ov57_0223BABC(CapsuleAppManager *appMan);
void ov57_0223BB38(CapsuleAppManager *appMan, BOOL a1);
void ov57_0223BB4C(CapsuleAppManager *appMan);
void ov57_0223B858(ManagedSprite *sprite, u32 event);

static BOOL (*const ov57_0223BEB8[])(CapsuleAppManager *appMan) = {
    ov57_0223A104,
    ov57_0223A31C,
    ov57_0223A504,
    ov57_0223A5AC,
    ov57_0223A6B4,
};

const UnkStruct_ov57_0223BECC ov57_0223BECC[] = {
    { 0, ov57_0223B6F0 },
    { 1, ov57_0223B700 },
    { 2, ov57_0223B714 },
    { 3, ov57_0223B73C },
    { 4, ov57_0223B74C },
};

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
        if (appMan->unk_28C[appMan->unk_3EC[0]].pokemonIndex != 0xFF) {
            Pokemon *mon = appMan->unk_000->mons[appMan->unk_28C[appMan->unk_3EC[0]].pokemonIndex];
            SetMonData(mon, MON_DATA_BALL_CAPSULE, SealCase_GetCapsuleI(appMan->unk_000->sealCase, appMan->unk_3EC[0]));
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
        ov57_0223BC4C(appMan, appMan->unk_3EC[0]);
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

int ov57_0223A8FC(CapsuleAppManager *appMan) {
    switch (appMan->unk_404) {
    case 0:
        if (!ov57_022384C0(appMan)) {
            return CAPSULE_UNK_11_STATE_ID;
        }
        PaletteData_BeginPaletteFade(appMan->unk_0D4.unk_014, 2, 0x80b, 0, 0, 10, RGB_BLACK);
        PaletteData_BeginPaletteFade(appMan->unk_0D4.unk_014, 8, 0xFFFF, 0, 0, 10, RGB_BLACK);
        ov57_0223B948(appMan, 0);
        GfGfx_EngineBTogglePlanes(GX_PLANEMASK_BG0, GF_PLANE_TOGGLE_OFF);
        ++appMan->unk_404;
        break;
    case 1:
        if (PaletteData_GetSelectedBuffersBitmask(appMan->unk_0D4.unk_014) != 0) {
            break;
        }
        PaletteData_SetAutoTransparent(appMan->unk_0D4.unk_014, FALSE);
        ov57_022397B0(appMan->unk_0D4.unk_010, &appMan->unk_0D4.unk_018[4], GF_BG_LYR_SUB_0, 2, 1, 27, 4, 0x03A);

        YesNoPromptTemplate yesNoPromptTemplate;
        MI_CpuClear8(&yesNoPromptTemplate, sizeof(YesNoPromptTemplate));
        yesNoPromptTemplate.bgConfig = appMan->unk_0D4.unk_010;
        yesNoPromptTemplate.bgId = GF_BG_LYR_SUB_0;
        yesNoPromptTemplate.tileStart = 0x0E6;
        yesNoPromptTemplate.plttSlot = 5;
        yesNoPromptTemplate.x = 25;
        yesNoPromptTemplate.y = 6;
        yesNoPromptTemplate.ignoreTouchFlag = appMan->unk_40C;
        appMan->unk_0D4.unk_170 = YesNoPrompt_Create(HEAP_ID_52);
        YesNoPrompt_InitFromTemplate(appMan->unk_0D4.unk_170, &yesNoPromptTemplate);
        ov57_02239728(&appMan->unk_0D4.unk_018[4], 4, msg_0011_00014, FALSE);
        ++appMan->unk_404;
        break;
    case 2:
        GfGfx_EngineBTogglePlanes(GX_PLANEMASK_BG0, GF_PLANE_TOGGLE_ON);
        ++appMan->unk_404;
        // fallthrough
    case 3:
        YesNoResponse response = YesNoPrompt_HandleInput(appMan->unk_0D4.unk_170);
        switch (response) {
        case YESNORESPONSE_WAIT:
            break;
        case YESNORESPONSE_YES:
        case YESNORESPONSE_NO:
            appMan->unk_40C = YesNoPrompt_IsInTouchMode(appMan->unk_0D4.unk_170);
            appMan->unk_408 = response;
            PaletteData_SetAutoTransparent(appMan->unk_0D4.unk_014, TRUE);
            YesNoPrompt_Reset(appMan->unk_0D4.unk_170);
            YesNoPrompt_Destroy(appMan->unk_0D4.unk_170);
            ClearFrameAndWindow2(&appMan->unk_0D4.unk_018[4], FALSE);
            RemoveWindow(&appMan->unk_0D4.unk_018[4]);
            ++appMan->unk_404;
            break;
        }
        break;
    case 4:
        PaletteData_BeginPaletteFade(appMan->unk_0D4.unk_014, 2, 0x80B, 0, 10, 0, RGB_BLACK);
        PaletteData_BeginPaletteFade(appMan->unk_0D4.unk_014, 8, 0xFFFF, 0, 10, 0, RGB_BLACK);
        ++appMan->unk_404;
        break;
    case 5:
        if (PaletteData_GetSelectedBuffersBitmask(appMan->unk_0D4.unk_014) != 0) {
            break;
        }
        int result;
        switch (appMan->unk_408) {
        case YESNORESPONSE_YES:
            ov57_0223B774(appMan);
            ov57_0223B7A8(appMan);
            ov57_022399F8(appMan);
            ov57_022383AC(appMan);
            ov57_02237F3C(appMan);
            ov57_022383D0(appMan, TRUE);
            result = 6;
            appMan->unk_410 = 20;
            break;
        case YESNORESPONSE_NO:
            result = 4;
            break;
        case YESNORESPONSE_WAIT:
        default:
            result = CAPSULE_CANCEL_PRESSED_STATE_ID;
            break;
        }
        ov57_0223B948(appMan, 1);
        appMan->unk_404 = 0;
        return result;
    }

    return CAPSULE_CANCEL_PRESSED_STATE_ID;
}

int ov57_0223AB58(CapsuleAppManager *appMan) {
    switch (appMan->unk_404) {
    case THROW_INIT_GFX_STATE_ID:
        GfGfx_EngineATogglePlanes(GX_PLANEMASK_OBJ, GF_PLANE_TOGGLE_ON);
        PaletteData_BeginPaletteFade(appMan->unk_0D4.unk_014, 2, 0x80B, 0, 0, 10, RGB_BLACK);
        PaletteData_BeginPaletteFade(appMan->unk_0D4.unk_014, 8, 0xFFFF, 0, 0, 10, RGB_BLACK);
        ov57_0223B948(appMan, 0);
        appMan->unk_408 = 0;
        ov57_0223B7C4(appMan);
        ov57_0223B950(appMan);
        ov57_0223BB38(appMan, 1);
        ov57_02239728(&appMan->unk_0D4.unk_018[0], 0, msg_0011_00013, FALSE);
        ++appMan->unk_404;
        break;
    case THROW_WAIT_INIT_THROW_STATE_ID:
        if (PaletteData_GetSelectedBuffersBitmask(appMan->unk_0D4.unk_014) != 0) {
            break;
        }
        UnkStruct_134 sp5C;
        sp5C.unk0 = 1;
        sp5C.heapID = HEAP_ID_52;
        sp5C.unk8 = 0;
        sp5C.unkC = 0xFF;
        sp5C.unk14 = 0;
        sp5C.unk18 = 1;
        sp5C.spriteSystem = appMan->unk_0D4.unk_008;
        sp5C.paletteData = appMan->unk_0D4.unk_014;
        sp5C.ball = GetMonData(appMan->unk_458, MON_DATA_POKEBALL, NULL);
        appMan->unk_0D4.unk_180 = ov07_02233DB8(&sp5C);
        ++appMan->unk_404;
        break;
    case THROW_SET_CAPSULE_STATE_ID: {
        BallCapsule sp44;
        BallCapsuleConfig sp38 = { 0 };
        sp38.battlerType = BATTLER_TYPE_SOLO_ENEMY;
        sp38.mon = appMan->unk_458;
        int spC = appMan->unk_3EC[0] + 1;
        ov57_0223857C(&sp44, appMan);
        SetMonData(appMan->unk_458, MON_DATA_BALL_CAPSULE_ID, &spC);
        SetMonData(appMan->unk_458, MON_DATA_BALL_CAPSULE, &sp44);
        appMan->unk_0D4.unk_17C = ov07_02232694(HEAP_ID_52, &sp38);
        ov07_022329B0(appMan->unk_0D4.unk_17C);
        ++appMan->unk_404;
        appMan->unk_408 = 0;
    } break;
    case THROW_WAIT_FOR_END_STATE_ID:
        if (ov07_02232A04(appMan->unk_0D4.unk_17C) != TRUE) {
            break;
        }
        if (ov07_02233EA0(appMan->unk_0D4.unk_180) != TRUE) {
            break;
        }
        ov57_0223BA40(appMan);
        ov07_02232A44(appMan->unk_0D4.unk_17C);
        ov57_0223BB38(appMan, 0);
        ov57_0223BA1C(appMan);
        PlaySE(SEQ_SE_DP_CUSTOM05);
        ++appMan->unk_404;
        break;
    case THROW_WAIT_FOR_ROTATION_END_STATE_ID: {
        BOOL r5 = ov57_0223BA40(appMan);
        BOOL r0 = ov07_02233E88(appMan->unk_0D4.unk_180);
        if (r0 || r5) {
            break;
        }
        ov07_02233ECC(appMan->unk_0D4.unk_180);
        GfGfx_EngineATogglePlanes(GX_PLANEMASK_OBJ, GF_PLANE_TOGGLE_OFF);
        ov57_0223B9C8(appMan);
        appMan->unk_408 = 0;
        ++appMan->unk_404;
    } break;
    case THROW_WAIT_FOR_ANIMS_END_STATE_ID:
        if (ov07_02232A54(appMan->unk_0D4.unk_17C)) {
            break;
        }
        if (sub_02017068(appMan->unk_0D4.unk_1B0, 0) != TRUE) {
            break;
        }
        if (Pokepic_IsAnimActive(appMan->unk_0D4.unk_0F4)) {
            break;
        }
        ov07_02232AB8(appMan->unk_0D4.unk_17C);
        ++appMan->unk_404;
        break;
    case THROW_WAIT_AFTER_ANIMS_END_STATE_ID:
        ++appMan->unk_408;
        if (appMan->unk_408 < 30) {
            break;
        }
        appMan->unk_408 = 0;
        UnkStruct_134 sp10;
        sp10.unk0 = 1;
        sp10.heapID = HEAP_ID_52;
        sp10.unk8 = 5;
        sp10.unkC = 0xFF;
        sp10.unk14 = 0;
        sp10.unk18 = 1;
        sp10.spriteSystem = appMan->unk_0D4.unk_008;
        sp10.paletteData = appMan->unk_0D4.unk_014;
        sp10.ball = GetMonData(appMan->unk_458, MON_DATA_POKEBALL, NULL);
        appMan->unk_0D4.unk_180 = ov07_02233DB8(&sp10);
        ov57_0223BB5C();
        GfGfx_EngineATogglePlanes(GX_PLANEMASK_OBJ, GF_PLANE_TOGGLE_ON);
        ++appMan->unk_404;
        break;
    case THROW_WAIT_FREE_STATE_ID: {
        BOOL r5 = ov57_0223BABC(appMan);
        BOOL r0 = ov07_02233E88(appMan->unk_0D4.unk_180);
        if (r0 || r5) {
            break;
        }
        PaletteData_BeginPaletteFade(appMan->unk_0D4.unk_014, 2, 0x80B, 0, 10, 0, RGB_BLACK);
        PaletteData_BeginPaletteFade(appMan->unk_0D4.unk_014, 8, 0xFFFF, 0, 10, 0, RGB_BLACK);
        ov57_0223BB38(appMan, 1);
        ov57_0223BB4C(appMan);
        ov07_02233ECC(appMan->unk_0D4.unk_180);
        ++appMan->unk_404;
    } break;
    default:
        if (PaletteData_GetSelectedBuffersBitmask(appMan->unk_0D4.unk_014) != 0) {
            break;
        }
        GfGfx_EngineATogglePlanes(GX_PLANEMASK_OBJ, GF_PLANE_TOGGLE_OFF);
        ov57_0223B948(appMan, 1);
        appMan->unk_404 = 0;
        appMan->unk_3FC = CAPSULE_CAPSULE_MENU_STATE_ID;
        ov57_02239728(&appMan->unk_0D4.unk_018[0], 0, 0xFFFF, FALSE);
        return CAPSULE_CAPSULE_MENU_STATE_ID;
    }

    return CAPSULE_FADE_OUT_STATE_ID;
}

void ov57_0223AEA8(u32 index, u32 event, void *arg) {
    CapsuleAppManager *appMan = arg;

    if (!appMan->unk_0D4.unk_004) {
        return;
    }

    switch (index) {
    case 8:
        if (event == TOUCH_BUTTON_PRESSED) {
            if (appMan->unk_448.page > 0) {
                --appMan->unk_448.page;
            } else {
                appMan->unk_448.page = appMan->unk_448.maxPage - 1;
            }
            ov57_02238AC0(appMan);
            ov57_022388E4(appMan, appMan->unk_448.page);
            ov57_02238958(appMan);
            ov57_02238A00(appMan);
            ov57_022399F8(appMan);
            PlaySE(SEQ_SE_DP_CUSTOM02);
        }
        ov57_0223B858(appMan->unk_414[8], event);
        break;
    case 9:
        if (event == TOUCH_BUTTON_PRESSED) {
            ++appMan->unk_448.page;
            appMan->unk_448.page %= appMan->unk_448.maxPage;
            ov57_02238AC0(appMan);
            ov57_022388E4(appMan, appMan->unk_448.page);
            ov57_02238958(appMan);
            ov57_02238A00(appMan);
            ov57_022399F8(appMan);
            PlaySE(SEQ_SE_DP_CUSTOM02);
        }
        ov57_0223B858(appMan->unk_414[9], event);
        break;
    case 10:
        if (event == TOUCH_BUTTON_PRESSED) {
            if (appMan->unk_3FC != CAPSULE_FADE_OUT_STATE_ID) {
                appMan->unk_3FC = CAPSULE_FADE_OUT_STATE_ID;
                PlaySE(SEQ_SE_DP_DECIDE);
            }
            ov57_0223B90C(appMan->unk_414[10], NULL);
        }
        ov57_0223B858(appMan->unk_414[10], event);
        break;
    case 11:
        if (event == TOUCH_BUTTON_PRESSED) {
            if (appMan->unk_3FC != CAPSULE_FADE_OUT_WAIT_STATE_ID) {
                appMan->unk_3FC = CAPSULE_FADE_OUT_WAIT_STATE_ID;
                ov57_0223B948(appMan, 0);
                PlaySE(SEQ_SE_DP_PIRORIRO);
            }
            ov57_0223B90C(appMan->unk_414[11], appMan->unk_0D4.unk_18C[0]);
        }
        ov57_0223B858(appMan->unk_414[11], event);
        break;
    case 12:
        if (event == TOUCH_BUTTON_PRESSED) {
            if (appMan->unk_3FC != CAPSULE_CANCEL_PRESSED_STATE_ID) {
                appMan->unk_3FC = CAPSULE_CANCEL_PRESSED_STATE_ID;
                ov57_0223B948(appMan, 0);
                PlaySE(SEQ_SE_DP_DECIDE);
            }
            ov57_0223B90C(appMan->unk_414[12], appMan->unk_0D4.unk_18C[1]);
        }
        ov57_0223B858(appMan->unk_414[12], event);
        break;
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
        if (event == TOUCH_BUTTON_PRESSED) {
            if (!ov57_02238028(appMan)) {
                PlaySE(SEQ_SE_DP_CUSTOM06);
                ov57_02239728(&appMan->unk_0D4.unk_018[0], 0, msg_0011_00015, FALSE);
            } else {
                u8 *sealIDs = appMan->unk_448.sealIDs;
                if (sealIDs[index] != SEAL_NONE && SealCaseInventory_GetSealQuantity(appMan->unk_064, sealIDs[index] - 1) != 0) {
                    appMan->unk_0D4.unk_000 = ov57_02237FAC(appMan, index);
                    ov57_02239B2C(&appMan->unk_0D4.unk_018[0], CapsuleMenu_GetSealNameIndex(sealIDs[index]));
                    GiveOrTakeSeal(appMan->unk_000->sealCase, sealIDs[index], -1);
                    ov57_02239A8C(appMan, index);
                    PlaySE(SEQ_SE_DP_BOX02);
                } else if (sealIDs[index] != SEAL_NONE) {
                    PlaySE(SEQ_SE_DP_CUSTOM06);
                    ov57_02239728(&appMan->unk_0D4.unk_018[0], 0, msg_0011_00016, FALSE);
                }
            }
        }
        break;
    case 13:
    case 14:
    case 15:
    case 16:
    case 17:
    case 18:
    case 19:
    case 20:
        if (event == TOUCH_BUTTON_PRESSED) {
            int r5 = index - 13;
            ov57_022382F8(appMan, event, r5);
            ov57_02239B2C(&appMan->unk_0D4.unk_018[0], CapsuleMenu_GetSealNameIndex(appMan->unk_34C[r5].type));
            PlaySE(SEQ_SE_DP_BOX02);
        }
        break;
    default:
        GF_ASSERT(FALSE);
    }
}

BOOL ov57_0223B12C(CapsuleAppManager *appMan) {
    if (appMan->unk_40C == MENU_INPUT_STATE_TOUCH) {
        if (System_GetTouchHeld()) {
            return FALSE;
        }
        if (gSystem.heldKeys) {
            appMan->unk_40C = MENU_INPUT_STATE_BUTTONS;
            return TRUE;
        }
    } else {
        if (gSystem.heldKeys) {
            return FALSE;
        }
        if (System_GetTouchHeld()) {
            appMan->unk_40C = MENU_INPUT_STATE_TOUCH;
            return FALSE;
        }
    }

    return FALSE;
}

int ov57_0223B180(CapsuleAppManager *appMan) {
    ov57_0223B12C(appMan);
    if (appMan->unk_40C == MENU_INPUT_STATE_BUTTONS) {
        return ov57_0223B288(appMan);
    } else {
        return ov57_0223B2EC(appMan);
    }
}

int ov57_0223B1A4(CapsuleAppManager *appMan, u8 a1) {
    switch (a1) {
    case 12:
        PlaySE(SEQ_SE_DP_DECIDE);
        ov57_02237E88(appMan->unk_000, 0);
        return CAPSULE_FADE_OUT_STATE_ID;
    case 13:
        ov57_02239728(&appMan->unk_0D4.unk_018[3], 3, msg_0011_00008, FALSE);
        ov57_02238C30(appMan->unk_0D4.unk_010, &appMan->unk_0D4.unk_018[1], GF_BG_LYR_MAIN_1, appMan, appMan->unk_3EC[0]);
        PlaySE(SEQ_SE_DP_SELECT);
        return CAPSULE_CAPSULE_MENU_STATE_ID;
    default:
        ov57_02238134(appMan);
        ov57_0223853C(appMan);
        ov57_022394AC(appMan);
        appMan->unk_3EC[0] = a1;
        ov57_0223B504(appMan, 0, TRUE);
        ov57_022383AC(appMan);
        ov57_02237F3C(appMan);
        ov57_022383D0(appMan, 1);
        ov57_02237F14(appMan);
        if (appMan->unk_40C == 0) {
            PlaySE(SEQ_SE_DP_SELECT);
        } else {
            ov57_02239728(&appMan->unk_0D4.unk_018[3], 3, msg_0011_00008, FALSE);
            ov57_02238C30(appMan->unk_0D4.unk_010, &appMan->unk_0D4.unk_018[1], GF_BG_LYR_MAIN_1, appMan, appMan->unk_3EC[0]);
            PlaySE(SEQ_SE_DP_SELECT);
            return CAPSULE_CAPSULE_MENU_STATE_ID;
        }
        break;
    }

    return CAPSULE_CAPSULE_SELECTION_STATE_ID;
}

int ov57_0223B288(CapsuleAppManager *appMan) {
    int result;
    int sp0;

    if (gSystem.newKeys & PAD_BUTTON_B) {
        result = ov57_0223B1A4(appMan, 12);
    } else if (gSystem.newKeys & PAD_BUTTON_A) {
        result = ov57_0223B1A4(appMan, 13);
    } else if (!(gSystem.newAndRepeatedKeys & PAD_PLUS_KEY_MASK)) {
        result = CAPSULE_CAPSULE_SELECTION_STATE_ID;
    } else {
        sp0 = appMan->unk_3EC[0];
        if (!ov57_0223B478(&sp0)) {
            result = CAPSULE_CAPSULE_SELECTION_STATE_ID;
        } else {
            result = ov57_0223B1A4(appMan, sp0);
        }
    }
    return result;
}

int ov57_0223B2EC(CapsuleAppManager *appMan) {
    int result = ov57_0223B578(appMan);
    if (result < 0) {
        return CAPSULE_CAPSULE_SELECTION_STATE_ID;
    } else {
        return ov57_0223B1A4(appMan, result);
    }
}

int ov57_0223B308(CapsuleAppManager *appMan) {
    ov57_0223B12C(appMan);
    if (appMan->unk_40C == 0) {
        return ov57_0223B3F8(appMan);
    } else {
        return ov57_0223B45C(appMan);
    }
}

int ov57_0223B32C(CapsuleAppManager *appMan, BOOL a1) {
    if (appMan->unk_3EC[0] == appMan->unk_3EC[1]) {
        a1 = FALSE;
    }
    if (a1) {
        ov57_022394D8(appMan, appMan->unk_3EC[0], appMan->unk_3EC[1]);
        ov57_0223B504(appMan, 1, TRUE);
        ov57_02239728(&appMan->unk_0D4.unk_018[0], 0, msg_0011_00011, TRUE);
        PlaySE(SEQ_SE_DP_SELECT);
        return CAPSULE_FADE_IN_WAIT_STATE_ID;
    } else {
        ManagedSprite_SetDrawFlag(appMan->unk_31C[1], FALSE);
        ManagedSprite_SetAnim(appMan->unk_31C[0], 0);
        ov57_0223B504(appMan, 0, FALSE);
        PlaySE(SEQ_SE_DP_DECIDE);
        return CAPSULE_CAPSULE_SELECTION_STATE_ID;
    }
}

int ov57_0223B3A4(CapsuleAppManager *appMan, u8 a1) {
    switch (a1) {
    case 12:
        return ov57_0223B32C(appMan, FALSE);
    case 13:
        return ov57_0223B32C(appMan, TRUE);
    default:
        appMan->unk_3EC[1] = a1;
        ov57_0223B504(appMan, 1, FALSE);
        if (appMan->unk_40C == 0) {
            PlaySE(SEQ_SE_DP_SELECT);
        } else {
            return ov57_0223B32C(appMan, TRUE);
        }
        break;
    }

    return CAPSULE_FADE_IN_STATE_ID;
}

int ov57_0223B3F8(CapsuleAppManager *appMan) {
    int result;
    int sp0;

    if (gSystem.newKeys & PAD_BUTTON_B) {
        result = ov57_0223B3A4(appMan, 12);
    } else if (gSystem.newKeys & PAD_BUTTON_A) {
        result = ov57_0223B3A4(appMan, 13);
    } else if (!(gSystem.newAndRepeatedKeys & PAD_PLUS_KEY_MASK)) {
        result = CAPSULE_FADE_IN_STATE_ID;
    } else {
        sp0 = appMan->unk_3EC[1];
        if (!ov57_0223B478(&sp0)) {
            result = CAPSULE_FADE_IN_STATE_ID;
        } else {
            result = ov57_0223B3A4(appMan, sp0);
        }
    }
    return result;
}

int ov57_0223B45C(CapsuleAppManager *appMan) {
    int result = ov57_0223B578(appMan);
    if (result < 0) {
        return CAPSULE_FADE_IN_STATE_ID;
    } else {
        return ov57_0223B3A4(appMan, result);
    }
}

BOOL ov57_0223B478(int *a0) {
    if (gSystem.newAndRepeatedKeys & PAD_KEY_RIGHT) {
        *a0 += 1;
        *a0 %= MAX_CAPSULES;
    } else if (gSystem.newAndRepeatedKeys & PAD_KEY_LEFT) {
        if (*a0 > 0) {
            *a0 -= 1;
        } else {
            *a0 = MAX_CAPSULES - 1;
        }
    } else if (gSystem.newAndRepeatedKeys & PAD_KEY_UP) {
        if (*a0 / 4 != 0) {
            *a0 -= 4;
            *a0 %= MAX_CAPSULES;
        } else {
            return FALSE;
        }
    } else if (gSystem.newAndRepeatedKeys & PAD_KEY_DOWN) {
        if (*a0 / 4 != 2) {
            *a0 += 4;
            *a0 %= MAX_CAPSULES;
        } else {
            return FALSE;
        }
    } else {
        return FALSE;
    }

    return TRUE;
}

void ov57_0223B504(CapsuleAppManager *appMan, int a1, BOOL a2) {
    s16 x, y;
    int r4 = 0;
    if (a1 == 0) {
        r4 = 1;
    }
    ov57_02238DAC(appMan->unk_3EC[a1], &x, &y);
    ManagedSprite_SetPositionXY(appMan->unk_31C[a1], x, y);
    if (a2 == TRUE) {
        appMan->unk_3EC[r4] = appMan->unk_3EC[a1];
        ov57_02238DAC(appMan->unk_3EC[r4], &x, &y);
        ManagedSprite_SetPositionXY(appMan->unk_31C[r4], x, y);
    }
}

static const TouchscreenHitbox ov57_0223BEB0[2] = {
    { .rect = { 168, 192, 192, 256 } },
    { TOUCHSCREEN_RECTLIST_END },
};

int ov57_0223B578(CapsuleAppManager *appMan) {
    if (!System_GetTouchNew()) {
        return -1;
    }
    TouchscreenHitbox sp12;
    sp12.circle.sentinel = TOUCHSCREEN_CIRCLE_SENTINEL;
    sp12.circle.r = 24;
    for (int i = 0; i < 3; ++i) {
        sp12.circle.y = 56 * i + 24;
        for (int j = 0; j < 4; ++j) {
            sp12.circle.x = 56 * j + 40;
            if (TouchscreenHitbox_TouchNewIsIn(&sp12)) {
                return 4 * i + j;
            }
        }
    }

    int r4 = TouchscreenHitbox_FindRectAtTouchNew(ov57_0223BEB0);
    if (r4 != -1) {
        u16 sp10 = 0x3FF;
        if (!DoesPixelAtScreenXYMatchPtrVal(appMan->unk_0D4.unk_010, GF_BG_LYR_MAIN_3, gSystem.touchX, gSystem.touchY, &sp10)) {
            r4 = -1;
        } else {
            r4 += 12;
        }
        return r4;
    }
    return -1;
}

int ov57_0223B620(CapsuleAppManager *appMan) {
    ov57_0223B12C(appMan);
    if (gSystem.newKeys & PAD_BUTTON_A) {
        if (appMan->unk_0D4.unk_000 != 0xFF) {
            PlaySE(SEQ_SE_DP_CUSTOM06);
            return CAPSULE_CAPSULE_MENU_STATE_ID;
        }
        ov57_0223B948(appMan, 0);
        PlaySE(SEQ_SE_DP_PIRORIRO);
        ov57_0223B90C(appMan->unk_414[11], appMan->unk_0D4.unk_18C[0]);
        return CAPSULE_FADE_OUT_WAIT_STATE_ID;
    }
    if (gSystem.newKeys & PAD_BUTTON_B) {
        if (appMan->unk_0D4.unk_000 != 0xFF) {
            PlaySE(SEQ_SE_DP_CUSTOM06);
            return CAPSULE_CAPSULE_MENU_STATE_ID;
        }
        ov57_0223B948(appMan, 0);
        PlaySE(SEQ_SE_DP_DECIDE);
        ov57_0223B90C(appMan->unk_414[12], appMan->unk_0D4.unk_18C[1]);
        return CAPSULE_CANCEL_PRESSED_STATE_ID;
    }
    if (gSystem.newKeys & (PAD_BUTTON_X | PAD_BUTTON_Y)) {
        if (appMan->unk_0D4.unk_000 != 0xFF) {
            PlaySE(SEQ_SE_DP_CUSTOM06);
            return CAPSULE_CAPSULE_MENU_STATE_ID;
        }
        PlaySE(SEQ_SE_DP_DECIDE);
        ov57_0223B90C(appMan->unk_414[10], NULL);
        return CAPSULE_FADE_OUT_STATE_ID;
    }

    return CAPSULE_CAPSULE_MENU_STATE_ID;
}

BOOL ov57_0223B6F0(CapsuleAppManager *appMan) {
    ov57_0223B828(appMan, 1, 0, 3);
    return FALSE;
}

BOOL ov57_0223B700(CapsuleAppManager *appMan) {
    ov57_02238D80(appMan);
    ov57_0223866C(appMan, TRUE);
    return TRUE;
}

BOOL ov57_0223B714(CapsuleAppManager *appMan) {
    ov57_02238134(appMan);
    ov57_0223853C(appMan);
    ov57_022394AC(appMan);
    ov57_02237E88(appMan->unk_000, 1);
    appMan->unk_3FC = 5;
    return FALSE;
}

BOOL ov57_0223B73C(CapsuleAppManager *appMan) {
    ov57_0223B828(appMan, 2, 0, 3);
    return FALSE;
}

BOOL ov57_0223B74C(CapsuleAppManager *appMan) {
    ov57_0223B828(appMan, 3, 0, 3);
    return FALSE;
}

void ov57_0223B75C(CapsuleAppManager *appMan) {
    CopyCapsule(appMan->unk_004[appMan->unk_3EC[0]].capsule, &appMan->unk_068);
}

void ov57_0223B774(CapsuleAppManager *appMan) {
    CopyCapsule(&appMan->unk_068, appMan->unk_004[appMan->unk_3EC[0]].capsule);
}

void ov57_0223B78C(CapsuleAppManager *appMan) {
    for (int i = 0; i < SEAL_MAX + 1; ++i) {
        appMan->unk_080[i] = SealCaseInventory_GetSealQuantity(appMan->unk_064, i);
    }
}

void ov57_0223B7A8(CapsuleAppManager *appMan) {
    for (int i = 0; i < SEAL_MAX + 1; ++i) {
        SealCaseInventory_SetSealQuantity(appMan->unk_064, i, appMan->unk_080[i]);
    }
}

void ov57_0223B7C4(CapsuleAppManager *appMan) {
    int isEgg;
    Pokemon *pokemon;

    if (appMan->unk_004[appMan->unk_3EC[0]].partyIdx != 0xFF) {
        pokemon = appMan->unk_000->mons[appMan->unk_004[appMan->unk_3EC[0]].partyIdx];
        CopyPokemonToPokemon(pokemon, appMan->unk_458);

        return;
    }

    for (int i = 0; i < appMan->unk_000->partyCount; i++) {
        pokemon = appMan->unk_000->mons[i];
        isEgg = GetMonData(pokemon, MON_DATA_IS_EGG, NULL);

        if (isEgg != 0) {
            continue;
        }

        CopyPokemonToPokemon(pokemon, appMan->unk_458);
        break;
    }
}

void ov57_0223B828(CapsuleAppManager *appMan, int a1, int a2, int a3) {
    if (a2 == 0xFF) {
        appMan->unk_3FC = appMan->unk_400;
    } else {
        appMan->unk_3FC = a2;
    }
    appMan->unk_3F4 = a1;
    appMan->unk_400 = a3;
    appMan->unk_404 = 0;
}

void ov57_0223B858(ManagedSprite *sprite, u32 event) {
    switch (event) {
    case TOUCH_BUTTON_PRESSED:
        ManagedSprite_SetAnimationFrame(sprite, 1);
        break;
    case TOUCH_BUTTON_HELD:
        ManagedSprite_SetAnimationFrame(sprite, 2);
        break;
    case TOUCH_BUTTON_HELD_OUT_OF_BOUNDS:
    case TOUCH_BUTTON_RELEASED:
        ManagedSprite_SetAnimationFrame(sprite, 0);
        break;
    default:
        GF_ASSERT(FALSE);
    }
}

void ov57_0223B890(TextOBJ *fontOAM, int xOffset, int yOffset) {
    int x;
    int y;

    if (fontOAM != NULL) {
        sub_02013794(fontOAM, &x, &y);
        sub_020136B4(fontOAM, x + xOffset, y + yOffset);
    }
}

void ov57_0223B8B8(SysTask *sysTask, void *taskData) {
    CapsuleUIPressTask *capsuleUIPressTask = taskData;

    switch (capsuleUIPressTask->frame) {
    case 3:
        ov57_0223B890(capsuleUIPressTask->fontOAM, 0, -1);
        ManagedSprite_SetAnimationFrame(capsuleUIPressTask->sprite, 2);
        capsuleUIPressTask->frame++;
        break;
    case 6:
        ov57_0223B890(capsuleUIPressTask->fontOAM, 0, 2);
        ManagedSprite_SetAnimationFrame(capsuleUIPressTask->sprite, 0);
        SysTask_Destroy(sysTask);
        Heap_Free(capsuleUIPressTask);
        break;
    default:
        capsuleUIPressTask->frame++;
        break;
    }
}

void ov57_0223B90C(ManagedSprite *sprite, TextOBJ *textObj) {
    CapsuleUIPressTask *taskData = Heap_Alloc(HEAP_ID_52, sizeof(CapsuleUIPressTask));
    taskData->frame = 1;
    taskData->sprite = sprite;
    taskData->fontOAM = textObj;
    ov57_0223B890(taskData->fontOAM, 0, -1);
    SysTask_CreateOnMainQueue(ov57_0223B8B8, taskData, 1000);
}

BOOL ov57_0223B940(CapsuleAppManager *appMan) {
    return appMan->unk_0D4.unk_1AC;
}

void ov57_0223B948(CapsuleAppManager *appMan, int a1) {
    appMan->unk_0D4.unk_004 = a1;
}
