#include "application/capsule_menu/defs.h"

#include "screen_fade.h"

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

void ov57_0223B75C(CapsuleAppManager *appMan);
void ov57_0223B78C(CapsuleAppManager *appMan);
void ov57_0223B948(CapsuleAppManager *appMan, int a1);
int ov57_0223B180(CapsuleAppManager *appMan);
void ov57_0223B700(CapsuleAppManager *appMan);

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
        ov57_02239728(&appMan->unk_0D4.unk_018[3], 3, 7, FALSE);
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
            ov57_02239728(&appMan->unk_0D4.unk_018[3], 3, 7, FALSE);
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

                ov57_02239728(&appMan->unk_0D4.unk_018[3], 3, 7, FALSE);
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
