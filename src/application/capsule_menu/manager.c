#include "application/capsule_menu/capsule_menu.h"
#include "application/capsule_menu/defs.h"
#include "battle/battle.h"
#include "msgdata/msg/msg_0011.h"

#include "game_stats.h"
#include "overlay_07.h"
#include "pokemon.h"
#include "render_window.h"
#include "screen_fade.h"
#include "unk_02005D10.h"
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
    TextOBJ *textOBJ;
} CapsuleUIPressTask;

static BOOL CapsuleManager_SelectionActions(CapsuleAppManager *appMan);
static BOOL CapsuleManager_HandleCancelUpdateSeals(CapsuleAppManager *appMan);
static BOOL ov57_0223A504(CapsuleAppManager *appMan);
static BOOL CapsuleManager_HandleSpritesAndInputs(CapsuleAppManager *appMan);
static BOOL CapsuleManager_Dummy(CapsuleAppManager *appMan);
static int CapsuleManager_HandleCancelUpdateSeals_Init(CapsuleAppManager *appMan);
static BOOL CapsuleManager_HandleFades(CapsuleAppManager *appMan);
static int CapsuleManager_HandleCancelUpdateSeals_CancelPressed(CapsuleAppManager *appMan);
static int CapsuleManager_HandleCancelUpdateSeals_FadeOut(CapsuleAppManager *appMan);
static BOOL ov57_0223B12C(CapsuleAppManager *appMan);
static int CapsuleManager_SelectionActions_HandleInput(CapsuleAppManager *appMan);
static int ov57_0223B288(CapsuleAppManager *appMan);
static int ov57_0223B2EC(CapsuleAppManager *appMan);
static int ov57_0223B308(CapsuleAppManager *appMan);
static int ov57_0223B32C(CapsuleAppManager *appMan, BOOL a1);
static int ov57_0223B3A4(CapsuleAppManager *appMan, u8 a1);
static int ov57_0223B3F8(CapsuleAppManager *appMan);
static int ov57_0223B45C(CapsuleAppManager *appMan);
static BOOL CapsuleManager_HandleCapsulePadMovement(int *a0);
static void CapsuleManager_MoveCursorToCapsule(CapsuleAppManager *appMan, int a1, BOOL a2);
static int ov57_0223B578(CapsuleAppManager *appMan);
static int CapsuleManager_HandleCancelUpdateSeals_CapsuleMenu(CapsuleAppManager *appMan);
static BOOL ov57_0223B6F0(CapsuleAppManager *appMan);
static BOOL CapsuleManager_FreeMenuWindow(CapsuleAppManager *appMan);
static BOOL ov57_0223B714(CapsuleAppManager *appMan);
static BOOL ov57_0223B73C(CapsuleAppManager *appMan);
static BOOL ov57_0223B74C(CapsuleAppManager *appMan);
static void CapsuleManager_CopyToActiveCapsule(CapsuleAppManager *appMan);
static void CapsuleManager_CopyFromActiveCapsule(CapsuleAppManager *appMan);
static void CapsuleManager_GetSealCounts(CapsuleAppManager *appMan);
static void CapsuleManager_SetSealCounts(CapsuleAppManager *appMan);
static void CapsuleManager_LoadLeadingPokemon(CapsuleAppManager *appMan);
static void CapsuleManager_UpdateStates(CapsuleAppManager *appMan, int a1, int a2, int a3);
static void CapsuleManager_PressCapsuleUI(ManagedSprite *sprite, TextOBJ *textObj);
static BOOL CapsuleManager_GetGraphicsTaskResult(CapsuleAppManager *appMan);
static void CapsuleManager_SetSelectedCapsule(CapsuleAppManager *appMan, int a1);
static void CapsuleManager_LoadThrownMonSprite(CapsuleAppManager *appMan);
static void CapsuleManager_LoadThrownMonAnim(CapsuleAppManager *appMan);
static void CapsuleManager_ZeroThrownMonScale(CapsuleAppManager *appMan);
static BOOL ov57_0223BA40(CapsuleAppManager *appMan);
static BOOL ov57_0223BABC(CapsuleAppManager *appMan);
static void CapsuleManager_SetThrownMonSpriteHidden(CapsuleAppManager *appMan, BOOL a1);
static void CapsuleManager_FreeThrownMonSprite(CapsuleAppManager *appMan);
static void CapsuleManager_SetUIAnimationFromTouch(ManagedSprite *sprite, u32 event);

static BOOL (*const sCapsuleFunctions[])(CapsuleAppManager *appMan) = {
    CapsuleManager_SelectionActions,
    CapsuleManager_HandleCancelUpdateSeals,
    ov57_0223A504,
    CapsuleManager_HandleSpritesAndInputs,
    CapsuleManager_Dummy,
};

const SealListMenuEntry gSealListMenuEntries[] = {
    { 0, ov57_0223B6F0                 },
    { 1, CapsuleManager_FreeMenuWindow },
    { 2, ov57_0223B714                 },
    { 3, ov57_0223B73C                 },
    { 4, ov57_0223B74C                 },
};

BOOL CapsuleManager_AnySealsOnCapsule(BallCapsule *capsule) {
    int i;
    int result = FALSE;
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
        result = TRUE;
    }

    return result;
}

int CapsuleManager_CapsuleSelectionField(CapsuleAppManager *appMan, int index) {
    int pokemonIndex;
    int animIdx;
    int result;

    pokemonIndex = appMan->capsuleSprites[index].pokemonIndex;
    animIdx = appMan->capsuleSprites[index].animIdx;

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

BOOL CapsuleManager_CallFunction(CapsuleAppManager *appMan) {
    BOOL result = sCapsuleFunctions[appMan->funcIndex](appMan);
    SpriteSystem_DrawSprites(appMan->graphicsMan.spriteManager);

    return result;
}

static BOOL CapsuleManager_SelectionActions(CapsuleAppManager *appMan) {
    switch (appMan->stateID) {
    case CAPSULE_INIT_STATE_ID: {
        NARC *narc;

        narc = NARC_New(NARC_application_custom_ball_data_cb_data, HEAP_ID_CAPSULE_MENU);

        CapsuleGraphics_LoadPokemonIcons(appMan);
        CapsuleGraphics_InitPokemonIcons(appMan);
        CapsuleGraphics_SetPokemonSpritesPosition(appMan);
        CapsuleGraphics_LoadBgLayer2Tilemap(appMan, narc);
        CapsuleGraphics_LoadBgLayer5Tilemap(appMan, narc);
        CapsuleGraphics_LoadBgLayer7Tilemap(appMan, narc);
        CapsuleGraphics_AssignCapsules(appMan);
        CapsuleGraphics_InitCapsuleSprites(appMan, narc);
        CapsuleGraphics_InitUIWindows(appMan);
        SealPlacement_UpdateSealsFromCapsule(appMan);
        SealPlacement_DrawActiveSeals(appMan, 1);
        SealPlacement_OffsetSeals(appMan);
        CapsuleGraphics_LoadCapsuleUI(appMan, narc);
        CapsuleGraphics_InitCapsuleUI(appMan);
        CapsuleGraphics_LoadSelectionResources(appMan, narc);
        CapsuleGraphics_InitSelectionIndicator(appMan);
        CapsuleManager_CopyToActiveCapsule(appMan);
        CapsuleManager_GetSealCounts(appMan);
        CapsuleGraphics_PopulateSealPage(appMan, appMan->sealPages.page);
        CapsuleGraphics_LoadPageSprites(appMan);
        CapsuleGraphics_InitPageSprites(appMan);
        CapsuleGraphics_SetPageSpritesDrawFlag(appMan, 0);
        CapsuleGraphics_SetSelectionIndicatorDrawFlags(appMan, 0);
        ov57_02238794(appMan);
        CapsuleGraphics_SetFontOAMDrawFlag(appMan, 0);
        CapsuleGraphics_PrintMessage(&appMan->graphicsMan.windows[3], 3, msg_0011_00007, FALSE);
        CapsuleGraphics_StartDisplay();
        CapsuleManager_SetSelectedCapsule(appMan, 0);
        ov57_0223866C(appMan, TRUE);
        GX_SetDispSelect(GX_DISP_SELECT_SUB_MAIN);

        NARC_Delete(narc);
    }
        appMan->stateID++;
        break;

    case CAPSULE_FADE_IN_STATE_ID:
        CapsuleGraphics_FadeIn();
        appMan->stateID++;
        break;

    case CAPSULE_FADE_IN_WAIT_STATE_ID:
        if (IsPaletteFadeFinished() != 1) {
            break;
        }

        appMan->stateID++;

    case CAPSULE_CAPSULE_SELECTION_STATE_ID:
        appMan->stateID = CapsuleManager_SelectionActions_HandleInput(appMan);
        break;
    case CAPSULE_CAPSULE_MENU_STATE_ID: {
        int (*callback)(CapsuleAppManager *);
        u32 result = TouchscreenListMenu_HandleInput(appMan->graphicsMan.touchScreenListMenu);

        switch (result) {
        case LIST_CANCEL:
            CapsuleManager_FreeMenuWindow(appMan);
            CapsuleGraphics_PrintMessage(&appMan->graphicsMan.windows[3], 3, msg_0011_00007, FALSE);
            appMan->stateID = CAPSULE_CAPSULE_SELECTION_STATE_ID;
            break;
        case LIST_NOTHING_CHOSEN:
            break;
        default:
            callback = (int (*)(CapsuleAppManager *))result;

            if (callback != NULL) {
                int result = callback(appMan);

                if (result != 1) {
                    CapsuleManager_FreeMenuWindow(appMan);
                    break;
                }

                CapsuleGraphics_PrintMessage(&appMan->graphicsMan.windows[3], 3, msg_0011_00007, FALSE);
                appMan->stateID = CAPSULE_CAPSULE_SELECTION_STATE_ID;
            }
            break;
        }
    } break;
    case CAPSULE_FADE_OUT_STATE_ID:
        CapsuleGraphics_FadeOut();
        appMan->stateID++;
        break;
    case CAPSULE_FADE_OUT_WAIT_STATE_ID:
        if (IsPaletteFadeFinished() != TRUE) {
            break;
        }
        CapsuleGraphics_RemoveUIWindows(appMan);
        CapsuleGraphics_FreeCapsuleSprites(appMan);
        CapsuleGraphics_FreePokemonSprites(appMan);
        CapsuleGraphics_FreeUISprites(appMan);
        CapsuleGraphics_FreeSelectionIndicator(appMan);
        CapsuleGraphics_FreePageSprites(appMan);
        return FALSE;
    }

    CapsuleGraphics_TickPokemonSprites(appMan);
    CapsuleGraphics_TickCursor(appMan);

    return TRUE;
}

static BOOL CapsuleManager_HandleCancelUpdateSeals(CapsuleAppManager *appMan) {
    switch (appMan->stateID) {
    case CAPSULE_INIT_STATE_ID:
        appMan->stateID = CapsuleManager_HandleCancelUpdateSeals_Init(appMan);
        break;
    case CAPSULE_CAPSULE_MENU_STATE_ID:
        appMan->stateID = CapsuleManager_HandleCancelUpdateSeals_CapsuleMenu(appMan);
        break;
    case CAPSULE_FADE_OUT_STATE_ID:
        appMan->stateID = CapsuleManager_HandleCancelUpdateSeals_FadeOut(appMan);
        break;
    case CAPSULE_FADE_OUT_WAIT_STATE_ID:
        CapsuleGraphics_PrintMessage(&appMan->graphicsMan.windows[0], 0, msg_0011_00012, FALSE);
        appMan->frameCounter = 20;
        if (SealPlacement_AnySealsChanged(appMan) == TRUE) {
            appMan->graphicsMan.sealsChanged = TRUE;
        }
        SealPlacement_LoadCapsuleSeals(appMan);
        CapsuleGraphics_SetCapsuleSpriteAnim(appMan);
        GameStats_AddScore(Save_GameStats_Get(appMan->appData->saveData), SCORE_EVENT_BALL_CAPSULE_MODIFIED);
        if (appMan->capsuleSprites[appMan->capsuleIndex[0]].pokemonIndex != 0xFF) {
            Pokemon *mon = appMan->appData->mons[appMan->capsuleSprites[appMan->capsuleIndex[0]].pokemonIndex];
            SetMonData(mon, MON_DATA_BALL_CAPSULE, SealCase_GetCapsuleI(appMan->appData->sealCase, appMan->capsuleIndex[0]));
        }
        appMan->stateID = 11;
        break;
    case CAPSULE_CANCEL_PRESSED_STATE_ID:
        appMan->stateID = CapsuleManager_HandleCancelUpdateSeals_CancelPressed(appMan);
        break;
    case CAPSULE_UNK_11_STATE_ID:
        if (CapsuleManager_HandleFades(appMan)) {
            return TRUE;
        }
        break;
    }

    if (appMan->stateID == CAPSULE_CAPSULE_MENU_STATE_ID || appMan->stateID == CAPSULE_INIT_STATE_ID) {

        if (appMan->graphicsMan.index == 0xFF) {
            TouchHitboxController_IsTriggered(appMan->graphicsMan.touchHitboxController);
        } else {
            u32 x, y;
            int index;
            BOOL isScreenHeld;

            index = appMan->graphicsMan.index;
            isScreenHeld = System_GetTouchHeldCoords(&x, &y);
            if (appMan->stateID != CAPSULE_CAPSULE_MENU_STATE_ID) {
                isScreenHeld = FALSE;
            }

            if (isScreenHeld) {
                int sealIndex;

                sealIndex = CapsuleMenu_GetSealNameIndex(appMan->sealRenderInfo[index].type);
                CapsuleGraphics_UpdateSealNameText(&appMan->graphicsMan.windows[0], sealIndex);
                ManagedSprite_SetPositionXY(appMan->sealRenderInfo[index].sprite, x, y);
                SealPlacement_UpdateSealOamMode(appMan, index);
                SealPlacement_UpdateSealXY(appMan, index);
            } else {
                BOOL valid;

                valid = SealPlacement_SealIsValid(appMan, index);
                SealPlacement_UpdateSealTouchRect(appMan->sealRenderInfo[index].touchscreenHitbox, appMan->sealRenderInfo[index].sprite, 0);

                if (valid == 0) {
                    GiveOrTakeSeal2(appMan->appData->sealCase, appMan->sealRenderInfo[index].type, 1);
                    CapsuleGraphics_UpdateAllSealCountText(appMan);
                    SealPlacement_FreeSeal(appMan, index);
                }

                PlaySE(SEQ_SE_DP_BOX01);
                appMan->graphicsMan.index = 0xFF;
                CapsuleGraphics_UpdateSealNameText(appMan->graphicsMan.windows, 0xFFFF);
            }
        }
    }

    CapsuleGraphics_Dummy(appMan);
    CapsuleGraphics_TickSelectionIndicator(appMan);
    CapsuleGraphics_TickPokemonSprites(appMan);
    CapsuleGraphics_TickCursor(appMan);
    return TRUE;
}

static BOOL ov57_0223A504(CapsuleAppManager *appMan) {
    switch (appMan->stateID) {
    case CAPSULE_INIT_STATE_ID:
        CapsuleManager_AssignCapsuleMon(appMan, appMan->capsuleIndex[0]);
        CapsuleGraphics_PrintMessage(&appMan->graphicsMan.windows[0], 0, msg_0011_00009, TRUE);
        appMan->stateID++;
        break;
    case CAPSULE_FADE_IN_STATE_ID:
        ov57_0223B12C(appMan);
        if (gSystem.newKeys & (PAD_BUTTON_A | PAD_BUTTON_B | PAD_KEY_RIGHT | PAD_KEY_LEFT | PAD_KEY_UP | PAD_KEY_DOWN | PAD_BUTTON_X | PAD_BUTTON_Y) || System_GetTouchNew()) {
            appMan->stateID++;
        }
        break;
    case CAPSULE_FADE_IN_WAIT_STATE_ID:
        CapsuleManager_UpdateStates(appMan, 0, 0xFF, 0);
        ClearWindowPixelBuffer(&appMan->graphicsMan.windows[0], TRUE);
        ClearWindowTilemapAndScheduleTransfer(&appMan->graphicsMan.windows[0]);
        ov57_0223866C(appMan, TRUE);
        CapsuleGraphics_PrintMessage(&appMan->graphicsMan.windows[3], 3, msg_0011_00007, FALSE);
    }

    CapsuleGraphics_TickPokemonSprites(appMan);
    CapsuleGraphics_TickCursor(appMan);

    return TRUE;
}

static BOOL CapsuleManager_HandleSpritesAndInputs(CapsuleAppManager *appMan) {
    switch (appMan->stateID) {
    case CAPSULE_INIT_STATE_ID:
        ManagedSprite_SetDrawPriority(appMan->cursor[0], 25);
        ManagedSprite_SetDrawPriority(appMan->cursor[1], 20);
        ManagedSprite_SetAnim(appMan->cursor[0], 1);
        CapsuleGraphics_PrintMessage(&appMan->graphicsMan.windows[3], 3, msg_0011_00010, 0);
        ManagedSprite_SetDrawFlag(appMan->cursor[1], 1);
        appMan->stateID++;
    case CAPSULE_FADE_IN_STATE_ID:
        appMan->stateID = ov57_0223B308(appMan);
        break;
    case CAPSULE_FADE_IN_WAIT_STATE_ID:
        ov57_0223B12C(appMan);
        if (gSystem.newKeys & (PAD_BUTTON_A | PAD_BUTTON_B | PAD_KEY_RIGHT | PAD_KEY_LEFT | PAD_KEY_UP | PAD_KEY_DOWN | PAD_BUTTON_X | PAD_BUTTON_Y) || System_GetTouchNew()) {
            appMan->stateID = CAPSULE_CAPSULE_SELECTION_STATE_ID;
        }
        break;
    case CAPSULE_CAPSULE_SELECTION_STATE_ID:
        ManagedSprite_SetDrawPriority(appMan->cursor[0], 20);
        ManagedSprite_SetDrawPriority(appMan->cursor[1], 25);
        CapsuleManager_UpdateStates(appMan, 0, 0xFF, 0);
        ManagedSprite_SetAnim(appMan->cursor[0], 0);
        ClearWindowPixelBuffer(&appMan->graphicsMan.windows[0], TRUE);
        ClearWindowTilemapAndScheduleTransfer(&appMan->graphicsMan.windows[0]);
        ov57_0223866C(appMan, TRUE);
        CapsuleGraphics_PrintMessage(&appMan->graphicsMan.windows[3], 3, msg_0011_00007, 0);
        break;
    }

    CapsuleGraphics_TickPokemonSprites(appMan);
    CapsuleGraphics_TickCursor(appMan);

    return TRUE;
}

static BOOL CapsuleManager_Dummy(CapsuleAppManager *appMan) {
    return FALSE;
}

static int CapsuleManager_HandleCancelUpdateSeals_Init(CapsuleAppManager *appMan) {
    switch (appMan->throwStateID) {
    case 0:
        CapsuleManager_SetSelectedCapsule(appMan, 0);
        CapsuleGraphics_InitWindows(appMan);
        CapsuleGraphics_UpdateAllSealCountText(appMan);
        CapsuleManager_CopyToActiveCapsule(appMan);
        CapsuleManager_GetSealCounts(appMan);
        appMan->graphicsMan.sealsChanged = 0;
        appMan->frameCounter = 0;
        CapsuleGraphics_FadeOut();
        ++appMan->throwStateID;
        break;
    case 1:
        if (CapsuleManager_GetGraphicsTaskResult(appMan) == TRUE) {
            break;
        }
        if (IsPaletteFadeFinished() != TRUE) {
            break;
        }
        GfGfx_EngineATogglePlanes(GX_PLANEMASK_OBJ, GF_PLANE_TOGGLE_OFF);
        GfGfx_EngineBTogglePlanes(GX_PLANEMASK_BG2, GF_PLANE_TOGGLE_ON);
        SetBgPriority(GF_BG_LYR_SUB_3, 1);
        CapsuleGraphics_SetPageSpritesDrawFlag(appMan, TRUE);
        CapsuleGraphics_SetSelectionIndicatorDrawFlags(appMan, TRUE);
        CapsuleGraphics_SetFontOAMDrawFlag(appMan, TRUE);
        ov57_02238AF0(appMan, TRUE);
        ManagedSprite_SetAnimationFrame(appMan->pageSprites[8], 0);
        ManagedSprite_SetAnimationFrame(appMan->pageSprites[9], 0);
        ManagedSprite_SetAnimationFrame(appMan->pageSprites[10], 0);
        SetBgPriority(GF_BG_LYR_MAIN_3, 1);
        ClearWindowTilemapAndCopyToVram(&appMan->graphicsMan.windows[3]);
        CapsuleGraphics_PrintMessage(&appMan->graphicsMan.windows[0], 0, 0xFFFF, TRUE);
        GX_SetDispSelect(GX_DISP_SELECT_MAIN_SUB);
        CapsuleGraphics_FadeIn();
        ++appMan->throwStateID;
        break;
    case 2:
        if (IsPaletteFadeFinished() != TRUE) {
            break;
        }
        CapsuleManager_SetSelectedCapsule(appMan, 1);
        appMan->throwStateID = 0;
        return 4;
    }

    return 0;
}

static BOOL CapsuleManager_HandleFades(CapsuleAppManager *appMan) {
    switch (appMan->throwStateID) {
    case 0:
        if (appMan->frameCounter > 0) {
            --appMan->frameCounter;
            return FALSE;
        }
        appMan->frameCounter = 0;
        CapsuleGraphics_FadeOut();
        ++appMan->throwStateID;
        break;
    case 1:
        if (IsPaletteFadeFinished() != TRUE) {
            break;
        }
        GfGfx_EngineATogglePlanes(GX_PLANEMASK_OBJ, GF_PLANE_TOGGLE_ON);
        SetBgPriority(GF_BG_LYR_MAIN_3, 3);
        SetBgPriority(GF_BG_LYR_SUB_3, 3);
        GfGfx_EngineBTogglePlanes(GX_PLANEMASK_BG2, GF_PLANE_TOGGLE_OFF);
        CapsuleGraphics_SetPageSpritesDrawFlag(appMan, FALSE);
        CapsuleGraphics_SetSelectionIndicatorDrawFlags(appMan, FALSE);
        CapsuleGraphics_SetFontOAMDrawFlag(appMan, FALSE);
        ClearWindowPixelBuffer(&appMan->graphicsMan.windows[0], TRUE);
        CapsuleGraphics_PrintMessage(&appMan->graphicsMan.windows[3], 3, msg_0011_00007, FALSE);
        CopyWindowToVram(&appMan->graphicsMan.windows[3]);
        ov57_0223866C(appMan, TRUE);
        GX_SetDispSelect(GX_DISP_SELECT_SUB_MAIN);
        ov57_02238AF0(appMan, -1);
        CapsuleManager_SetSelectedCapsule(appMan, 0);
        CapsuleGraphics_FadeIn();
        ++appMan->throwStateID;
        break;
    case 2:
        if (CapsuleManager_GetGraphicsTaskResult(appMan) == TRUE) {
            break;
        }
        if (IsPaletteFadeFinished() != TRUE) {
            break;
        }
        ManagedSprite_SetDrawFlag(appMan->cursor[1], FALSE);
        CapsuleManager_UpdateStates(appMan, 0, 0xFF, 0);
        CapsuleGraphics_FreeSealCountWindows(appMan);
        appMan->throwStateID = 0;
        return TRUE;
    }

    return FALSE;
}

static int CapsuleManager_HandleCancelUpdateSeals_CancelPressed(CapsuleAppManager *appMan) {
    switch (appMan->throwStateID) {
    case 0:
        if (!SealPlacement_AnySealsChanged(appMan)) {
            return CAPSULE_UNK_11_STATE_ID;
        }
        PaletteData_BeginPaletteFade(appMan->graphicsMan.paletteData, 2, 0x80b, 0, 0, 10, RGB_BLACK);
        PaletteData_BeginPaletteFade(appMan->graphicsMan.paletteData, 8, 0xFFFF, 0, 0, 10, RGB_BLACK);
        CapsuleManager_SetSelectedCapsule(appMan, 0);
        GfGfx_EngineBTogglePlanes(GX_PLANEMASK_BG0, GF_PLANE_TOGGLE_OFF);
        ++appMan->throwStateID;
        break;
    case 1:
        if (PaletteData_GetSelectedBuffersBitmask(appMan->graphicsMan.paletteData) != 0) {
            break;
        }
        PaletteData_SetAutoTransparent(appMan->graphicsMan.paletteData, FALSE);
        CapsuleGraphics_InitMessageWindow(appMan->graphicsMan.bgConfig, &appMan->graphicsMan.windows[4], GF_BG_LYR_SUB_0, 2, 1, 27, 4, 0x03A);

        YesNoPromptTemplate yesNoPromptTemplate;
        MI_CpuClear8(&yesNoPromptTemplate, sizeof(YesNoPromptTemplate));
        yesNoPromptTemplate.bgConfig = appMan->graphicsMan.bgConfig;
        yesNoPromptTemplate.bgId = GF_BG_LYR_SUB_0;
        yesNoPromptTemplate.tileStart = 0x0E6;
        yesNoPromptTemplate.plttSlot = 5;
        yesNoPromptTemplate.x = 25;
        yesNoPromptTemplate.y = 6;
        yesNoPromptTemplate.ignoreTouchFlag = appMan->menuInputState;
        appMan->graphicsMan.yesNoPrompt = YesNoPrompt_Create(HEAP_ID_CAPSULE_MENU);
        YesNoPrompt_InitFromTemplate(appMan->graphicsMan.yesNoPrompt, &yesNoPromptTemplate);
        CapsuleGraphics_PrintMessage(&appMan->graphicsMan.windows[4], 4, msg_0011_00014, FALSE);
        ++appMan->throwStateID;
        break;
    case 2:
        GfGfx_EngineBTogglePlanes(GX_PLANEMASK_BG0, GF_PLANE_TOGGLE_ON);
        ++appMan->throwStateID;
        // fallthrough
    case 3:
        YesNoResponse response = YesNoPrompt_HandleInput(appMan->graphicsMan.yesNoPrompt);
        switch (response) {
        case YESNORESPONSE_WAIT:
            break;
        case YESNORESPONSE_YES:
        case YESNORESPONSE_NO:
            appMan->menuInputState = YesNoPrompt_IsInTouchMode(appMan->graphicsMan.yesNoPrompt);
            appMan->yesNoResult = response;
            PaletteData_SetAutoTransparent(appMan->graphicsMan.paletteData, TRUE);
            YesNoPrompt_Reset(appMan->graphicsMan.yesNoPrompt);
            YesNoPrompt_Destroy(appMan->graphicsMan.yesNoPrompt);
            ClearFrameAndWindow2(&appMan->graphicsMan.windows[4], FALSE);
            RemoveWindow(&appMan->graphicsMan.windows[4]);
            ++appMan->throwStateID;
            break;
        }
        break;
    case 4:
        PaletteData_BeginPaletteFade(appMan->graphicsMan.paletteData, 2, 0x80B, 0, 10, 0, RGB_BLACK);
        PaletteData_BeginPaletteFade(appMan->graphicsMan.paletteData, 8, 0xFFFF, 0, 10, 0, RGB_BLACK);
        ++appMan->throwStateID;
        break;
    case 5:
        if (PaletteData_GetSelectedBuffersBitmask(appMan->graphicsMan.paletteData) != 0) {
            break;
        }
        int result;
        switch (appMan->yesNoResult) {
        case YESNORESPONSE_YES:
            CapsuleManager_CopyFromActiveCapsule(appMan);
            CapsuleManager_SetSealCounts(appMan);
            CapsuleGraphics_UpdateAllSealCountText(appMan);
            SealPlacement_FreeInactiveSeals(appMan);
            SealPlacement_UpdateSealsFromCapsule(appMan);
            SealPlacement_DrawActiveSeals(appMan, TRUE);
            result = 6;
            appMan->frameCounter = 20;
            break;
        case YESNORESPONSE_NO:
            result = 4;
            break;
        case YESNORESPONSE_WAIT:
        default:
            result = CAPSULE_CANCEL_PRESSED_STATE_ID;
            break;
        }
        CapsuleManager_SetSelectedCapsule(appMan, 1);
        appMan->throwStateID = 0;
        return result;
    }

    return CAPSULE_CANCEL_PRESSED_STATE_ID;
}

static int CapsuleManager_HandleCancelUpdateSeals_FadeOut(CapsuleAppManager *appMan) {
    switch (appMan->throwStateID) {
    case THROW_INIT_GFX_STATE_ID:
        GfGfx_EngineATogglePlanes(GX_PLANEMASK_OBJ, GF_PLANE_TOGGLE_ON);
        PaletteData_BeginPaletteFade(appMan->graphicsMan.paletteData, 2, 0x80B, 0, 0, 10, RGB_BLACK);
        PaletteData_BeginPaletteFade(appMan->graphicsMan.paletteData, 8, 0xFFFF, 0, 0, 10, RGB_BLACK);
        CapsuleManager_SetSelectedCapsule(appMan, 0);
        appMan->yesNoResult = YESNORESPONSE_WAIT;
        CapsuleManager_LoadLeadingPokemon(appMan);
        CapsuleManager_LoadThrownMonSprite(appMan);
        CapsuleManager_SetThrownMonSpriteHidden(appMan, 1);
        CapsuleGraphics_PrintMessage(&appMan->graphicsMan.windows[0], 0, msg_0011_00013, FALSE);
        ++appMan->throwStateID;
        break;
    case THROW_WAIT_INIT_THROW_STATE_ID:
        if (PaletteData_GetSelectedBuffersBitmask(appMan->graphicsMan.paletteData) != 0) {
            break;
        }
        BallThrow sp5C;
        sp5C.type = 1;
        sp5C.heapID = HEAP_ID_CAPSULE_MENU;
        sp5C.mode = 0;
        sp5C.target = 0xFF;
        sp5C.bgPrio = 0;
        sp5C.surface = 1;
        sp5C.spriteSystem = appMan->graphicsMan.spriteSystem;
        sp5C.paletteData = appMan->graphicsMan.paletteData;
        sp5C.ball = GetMonData(appMan->pokemon, MON_DATA_POKEBALL, NULL);
        appMan->graphicsMan.ballRotation = ov07_02233DB8(&sp5C);
        ++appMan->throwStateID;
        break;
    case THROW_SET_CAPSULE_STATE_ID: {
        BallCapsule sp44;
        BallCapsuleConfig sp38 = { 0 };
        sp38.battlerType = BATTLER_TYPE_SOLO_ENEMY;
        sp38.mon = appMan->pokemon;
        int spC = appMan->capsuleIndex[0] + 1;
        SealPlacement_GetCapsuleSeals(&sp44, appMan);
        SetMonData(appMan->pokemon, MON_DATA_BALL_CAPSULE_ID, &spC);
        SetMonData(appMan->pokemon, MON_DATA_BALL_CAPSULE, &sp44);
        appMan->graphicsMan.sealEffect = ov07_02232694(HEAP_ID_CAPSULE_MENU, &sp38);
        ov07_022329B0(appMan->graphicsMan.sealEffect);
        ++appMan->throwStateID;
        appMan->yesNoResult = YESNORESPONSE_WAIT;
    } break;
    case THROW_WAIT_FOR_END_STATE_ID:
        if (ov07_02232A04(appMan->graphicsMan.sealEffect) != TRUE) {
            break;
        }
        if (ov07_02233EA0(appMan->graphicsMan.ballRotation) != TRUE) {
            break;
        }
        ov57_0223BA40(appMan);
        ov07_02232A44(appMan->graphicsMan.sealEffect);
        CapsuleManager_SetThrownMonSpriteHidden(appMan, 0);
        CapsuleManager_ZeroThrownMonScale(appMan);
        PlaySE(SEQ_SE_DP_CUSTOM05);
        ++appMan->throwStateID;
        break;
    case THROW_WAIT_FOR_ROTATION_END_STATE_ID: {
        BOOL r5 = ov57_0223BA40(appMan);
        BOOL r0 = ov07_02233E88(appMan->graphicsMan.ballRotation);
        if (r0 || r5) {
            break;
        }
        ov07_02233ECC(appMan->graphicsMan.ballRotation);
        GfGfx_EngineATogglePlanes(GX_PLANEMASK_OBJ, GF_PLANE_TOGGLE_OFF);
        CapsuleManager_LoadThrownMonAnim(appMan);
        appMan->yesNoResult = YESNORESPONSE_WAIT;
        ++appMan->throwStateID;
    } break;
    case THROW_WAIT_FOR_ANIMS_END_STATE_ID:
        if (ov07_02232A54(appMan->graphicsMan.sealEffect)) {
            break;
        }
        if (sub_02017068(appMan->graphicsMan.pokepicAnimManager, 0) != TRUE) {
            break;
        }
        if (Pokepic_IsAnimActive(appMan->graphicsMan.pokepic)) {
            break;
        }
        ov07_02232AB8(appMan->graphicsMan.sealEffect);
        ++appMan->throwStateID;
        break;
    case THROW_WAIT_AFTER_ANIMS_END_STATE_ID:
        ++appMan->yesNoResult;
        if (appMan->yesNoResult < 30) {
            break;
        }
        appMan->yesNoResult = YESNORESPONSE_WAIT;
        BallThrow ballThrow;
        ballThrow.type = 1;
        ballThrow.heapID = HEAP_ID_CAPSULE_MENU;
        ballThrow.mode = 5;
        ballThrow.target = 0xFF;
        ballThrow.bgPrio = 0;
        ballThrow.surface = 1;
        ballThrow.spriteSystem = appMan->graphicsMan.spriteSystem;
        ballThrow.paletteData = appMan->graphicsMan.paletteData;
        ballThrow.ball = GetMonData(appMan->pokemon, MON_DATA_POKEBALL, NULL);
        appMan->graphicsMan.ballRotation = ov07_02233DB8(&ballThrow);
        CapsuleManager_SetNormalAlpha();
        GfGfx_EngineATogglePlanes(GX_PLANEMASK_OBJ, GF_PLANE_TOGGLE_ON);
        ++appMan->throwStateID;
        break;
    case THROW_WAIT_FREE_STATE_ID: {
        BOOL r5 = ov57_0223BABC(appMan);
        BOOL r0 = ov07_02233E88(appMan->graphicsMan.ballRotation);
        if (r0 || r5) {
            break;
        }
        PaletteData_BeginPaletteFade(appMan->graphicsMan.paletteData, 2, 0x80B, 0, 10, 0, RGB_BLACK);
        PaletteData_BeginPaletteFade(appMan->graphicsMan.paletteData, 8, 0xFFFF, 0, 10, 0, RGB_BLACK);
        CapsuleManager_SetThrownMonSpriteHidden(appMan, 1);
        CapsuleManager_FreeThrownMonSprite(appMan);
        ov07_02233ECC(appMan->graphicsMan.ballRotation);
        ++appMan->throwStateID;
    } break;
    default:
        if (PaletteData_GetSelectedBuffersBitmask(appMan->graphicsMan.paletteData) != 0) {
            break;
        }
        GfGfx_EngineATogglePlanes(GX_PLANEMASK_OBJ, GF_PLANE_TOGGLE_OFF);
        CapsuleManager_SetSelectedCapsule(appMan, 1);
        appMan->throwStateID = 0;
        appMan->stateID = CAPSULE_CAPSULE_MENU_STATE_ID;
        CapsuleGraphics_PrintMessage(&appMan->graphicsMan.windows[0], 0, 0xFFFF, FALSE);
        return CAPSULE_CAPSULE_MENU_STATE_ID;
    }

    return CAPSULE_FADE_OUT_STATE_ID;
}

void CapsuleManager_HandleSpritePress(u32 index, u32 event, void *arg) {
    CapsuleAppManager *appMan = arg;

    if (!appMan->graphicsMan.selectedCapsule) {
        return;
    }

    switch (index) {
    case 8:
        if (event == TOUCH_BUTTON_PRESSED) {
            if (appMan->sealPages.page > 0) {
                --appMan->sealPages.page;
            } else {
                appMan->sealPages.page = appMan->sealPages.maxPage - 1;
            }
            CapsuleGraphics_FreePageSprites(appMan);
            CapsuleGraphics_PopulateSealPage(appMan, appMan->sealPages.page);
            CapsuleGraphics_LoadPageSprites(appMan);
            CapsuleGraphics_InitPageSprites(appMan);
            CapsuleGraphics_UpdateAllSealCountText(appMan);
            PlaySE(SEQ_SE_DP_CUSTOM02);
        }
        CapsuleManager_SetUIAnimationFromTouch(appMan->pageSprites[8], event);
        break;
    case 9:
        if (event == TOUCH_BUTTON_PRESSED) {
            ++appMan->sealPages.page;
            appMan->sealPages.page %= appMan->sealPages.maxPage;
            CapsuleGraphics_FreePageSprites(appMan);
            CapsuleGraphics_PopulateSealPage(appMan, appMan->sealPages.page);
            CapsuleGraphics_LoadPageSprites(appMan);
            CapsuleGraphics_InitPageSprites(appMan);
            CapsuleGraphics_UpdateAllSealCountText(appMan);
            PlaySE(SEQ_SE_DP_CUSTOM02);
        }
        CapsuleManager_SetUIAnimationFromTouch(appMan->pageSprites[9], event);
        break;
    case 10:
        if (event == TOUCH_BUTTON_PRESSED) {
            if (appMan->stateID != CAPSULE_FADE_OUT_STATE_ID) {
                appMan->stateID = CAPSULE_FADE_OUT_STATE_ID;
                PlaySE(SEQ_SE_DP_DECIDE);
            }
            CapsuleManager_PressCapsuleUI(appMan->pageSprites[10], NULL);
        }
        CapsuleManager_SetUIAnimationFromTouch(appMan->pageSprites[10], event);
        break;
    case 11:
        if (event == TOUCH_BUTTON_PRESSED) {
            if (appMan->stateID != CAPSULE_FADE_OUT_WAIT_STATE_ID) {
                appMan->stateID = CAPSULE_FADE_OUT_WAIT_STATE_ID;
                CapsuleManager_SetSelectedCapsule(appMan, 0);
                PlaySE(SEQ_SE_DP_PIRORIRO);
            }
            CapsuleManager_PressCapsuleUI(appMan->pageSprites[11], appMan->graphicsMan.textOBJ[0]);
        }
        CapsuleManager_SetUIAnimationFromTouch(appMan->pageSprites[11], event);
        break;
    case 12:
        if (event == TOUCH_BUTTON_PRESSED) {
            if (appMan->stateID != CAPSULE_CANCEL_PRESSED_STATE_ID) {
                appMan->stateID = CAPSULE_CANCEL_PRESSED_STATE_ID;
                CapsuleManager_SetSelectedCapsule(appMan, 0);
                PlaySE(SEQ_SE_DP_DECIDE);
            }
            CapsuleManager_PressCapsuleUI(appMan->pageSprites[12], appMan->graphicsMan.textOBJ[1]);
        }
        CapsuleManager_SetUIAnimationFromTouch(appMan->pageSprites[12], event);
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
            if (!SealPlacement_NotMaxSeals(appMan)) {
                PlaySE(SEQ_SE_DP_CUSTOM06);
                CapsuleGraphics_PrintMessage(&appMan->graphicsMan.windows[0], 0, msg_0011_00015, FALSE);
            } else {
                u8 *sealIDs = appMan->sealPages.sealIDs;
                if (sealIDs[index] != SEAL_NONE && SealCaseInventory_GetSealQuantity(appMan->sealCount, sealIDs[index] - 1) != 0) {
                    appMan->graphicsMan.index = SealPlacement_GetTouchedSeal(appMan, index);
                    CapsuleGraphics_UpdateSealNameText(&appMan->graphicsMan.windows[0], CapsuleMenu_GetSealNameIndex(sealIDs[index]));
                    GiveOrTakeSeal(appMan->appData->sealCase, sealIDs[index], -1);
                    CapsuleGraphics_UpdateSealCountText(appMan, index);
                    PlaySE(SEQ_SE_DP_BOX02);
                } else if (sealIDs[index] != SEAL_NONE) {
                    PlaySE(SEQ_SE_DP_CUSTOM06);
                    CapsuleGraphics_PrintMessage(&appMan->graphicsMan.windows[0], 0, msg_0011_00016, FALSE);
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
            SealPlacement_HandleTouchscreen(appMan, event, r5);
            CapsuleGraphics_UpdateSealNameText(&appMan->graphicsMan.windows[0], CapsuleMenu_GetSealNameIndex(appMan->sealRenderInfo[r5].type));
            PlaySE(SEQ_SE_DP_BOX02);
        }
        break;
    default:
        GF_ASSERT(FALSE);
    }
}

static BOOL ov57_0223B12C(CapsuleAppManager *appMan) {
    if (appMan->menuInputState == MENU_INPUT_STATE_TOUCH) {
        if (System_GetTouchHeld()) {
            return FALSE;
        }
        if (gSystem.heldKeys) {
            appMan->menuInputState = MENU_INPUT_STATE_BUTTONS;
            return TRUE;
        }
    } else {
        if (gSystem.heldKeys) {
            return FALSE;
        }
        if (System_GetTouchHeld()) {
            appMan->menuInputState = MENU_INPUT_STATE_TOUCH;
            return FALSE;
        }
    }

    return FALSE;
}

static int CapsuleManager_SelectionActions_HandleInput(CapsuleAppManager *appMan) {
    ov57_0223B12C(appMan);
    if (appMan->menuInputState == MENU_INPUT_STATE_BUTTONS) {
        return ov57_0223B288(appMan);
    } else {
        return ov57_0223B2EC(appMan);
    }
}

static int ov57_0223B1A4(CapsuleAppManager *appMan, u8 a1) {
    switch (a1) {
    case 12:
        PlaySE(SEQ_SE_DP_DECIDE);
        CapsuleMenu_SetAction(appMan->appData, 0);
        return CAPSULE_FADE_OUT_STATE_ID;
    case 13:
        CapsuleGraphics_PrintMessage(&appMan->graphicsMan.windows[3], 3, msg_0011_00008, FALSE);
        CapsuleGraphics_OpenCapsuleSelectionMenu(appMan->graphicsMan.bgConfig, &appMan->graphicsMan.windows[1], GF_BG_LYR_MAIN_1, appMan, appMan->capsuleIndex[0]);
        PlaySE(SEQ_SE_DP_SELECT);
        return CAPSULE_CAPSULE_MENU_STATE_ID;
    default:
        SealPlacement_UpdateSeals(appMan);
        SealPlacement_LoadCapsuleSeals(appMan);
        CapsuleGraphics_SetCapsuleSpriteAnim(appMan);
        appMan->capsuleIndex[0] = a1;
        CapsuleManager_MoveCursorToCapsule(appMan, 0, TRUE);
        SealPlacement_FreeInactiveSeals(appMan);
        SealPlacement_UpdateSealsFromCapsule(appMan);
        SealPlacement_DrawActiveSeals(appMan, 1);
        SealPlacement_OffsetSeals(appMan);
        if (appMan->menuInputState == 0) {
            PlaySE(SEQ_SE_DP_SELECT);
        } else {
            CapsuleGraphics_PrintMessage(&appMan->graphicsMan.windows[3], 3, msg_0011_00008, FALSE);
            CapsuleGraphics_OpenCapsuleSelectionMenu(appMan->graphicsMan.bgConfig, &appMan->graphicsMan.windows[1], GF_BG_LYR_MAIN_1, appMan, appMan->capsuleIndex[0]);
            PlaySE(SEQ_SE_DP_SELECT);
            return CAPSULE_CAPSULE_MENU_STATE_ID;
        }
        break;
    }

    return CAPSULE_CAPSULE_SELECTION_STATE_ID;
}

static int ov57_0223B288(CapsuleAppManager *appMan) {
    int result;
    int sp0;

    if (gSystem.newKeys & PAD_BUTTON_B) {
        result = ov57_0223B1A4(appMan, 12);
    } else if (gSystem.newKeys & PAD_BUTTON_A) {
        result = ov57_0223B1A4(appMan, 13);
    } else if (!(gSystem.newAndRepeatedKeys & PAD_PLUS_KEY_MASK)) {
        result = CAPSULE_CAPSULE_SELECTION_STATE_ID;
    } else {
        sp0 = appMan->capsuleIndex[0];
        if (!CapsuleManager_HandleCapsulePadMovement(&sp0)) {
            result = CAPSULE_CAPSULE_SELECTION_STATE_ID;
        } else {
            result = ov57_0223B1A4(appMan, sp0);
        }
    }
    return result;
}

static int ov57_0223B2EC(CapsuleAppManager *appMan) {
    int result = ov57_0223B578(appMan);
    if (result < 0) {
        return CAPSULE_CAPSULE_SELECTION_STATE_ID;
    } else {
        return ov57_0223B1A4(appMan, result);
    }
}

static int ov57_0223B308(CapsuleAppManager *appMan) {
    ov57_0223B12C(appMan);
    if (appMan->menuInputState == 0) {
        return ov57_0223B3F8(appMan);
    } else {
        return ov57_0223B45C(appMan);
    }
}

static int ov57_0223B32C(CapsuleAppManager *appMan, BOOL a1) {
    if (appMan->capsuleIndex[0] == appMan->capsuleIndex[1]) {
        a1 = FALSE;
    }
    if (a1) {
        CapsuleGraphics_SwapCapsules(appMan, appMan->capsuleIndex[0], appMan->capsuleIndex[1]);
        CapsuleManager_MoveCursorToCapsule(appMan, 1, TRUE);
        CapsuleGraphics_PrintMessage(&appMan->graphicsMan.windows[0], 0, msg_0011_00011, TRUE);
        PlaySE(SEQ_SE_DP_SELECT);
        return CAPSULE_FADE_IN_WAIT_STATE_ID;
    } else {
        ManagedSprite_SetDrawFlag(appMan->cursor[1], FALSE);
        ManagedSprite_SetAnim(appMan->cursor[0], 0);
        CapsuleManager_MoveCursorToCapsule(appMan, 0, FALSE);
        PlaySE(SEQ_SE_DP_DECIDE);
        return CAPSULE_CAPSULE_SELECTION_STATE_ID;
    }
}

static int ov57_0223B3A4(CapsuleAppManager *appMan, u8 a1) {
    switch (a1) {
    case 12:
        return ov57_0223B32C(appMan, FALSE);
    case 13:
        return ov57_0223B32C(appMan, TRUE);
    default:
        appMan->capsuleIndex[1] = a1;
        CapsuleManager_MoveCursorToCapsule(appMan, 1, FALSE);
        if (appMan->menuInputState == 0) {
            PlaySE(SEQ_SE_DP_SELECT);
        } else {
            return ov57_0223B32C(appMan, TRUE);
        }
        break;
    }

    return CAPSULE_FADE_IN_STATE_ID;
}

static int ov57_0223B3F8(CapsuleAppManager *appMan) {
    int result;
    int sp0;

    if (gSystem.newKeys & PAD_BUTTON_B) {
        result = ov57_0223B3A4(appMan, 12);
    } else if (gSystem.newKeys & PAD_BUTTON_A) {
        result = ov57_0223B3A4(appMan, 13);
    } else if (!(gSystem.newAndRepeatedKeys & PAD_PLUS_KEY_MASK)) {
        result = CAPSULE_FADE_IN_STATE_ID;
    } else {
        sp0 = appMan->capsuleIndex[1];
        if (!CapsuleManager_HandleCapsulePadMovement(&sp0)) {
            result = CAPSULE_FADE_IN_STATE_ID;
        } else {
            result = ov57_0223B3A4(appMan, sp0);
        }
    }
    return result;
}

static int ov57_0223B45C(CapsuleAppManager *appMan) {
    int result = ov57_0223B578(appMan);
    if (result < 0) {
        return CAPSULE_FADE_IN_STATE_ID;
    } else {
        return ov57_0223B3A4(appMan, result);
    }
}

static BOOL CapsuleManager_HandleCapsulePadMovement(int *capsuleIndex) {
    if (gSystem.newAndRepeatedKeys & PAD_KEY_RIGHT) {
        *capsuleIndex += 1;
        *capsuleIndex %= MAX_CAPSULES;
    } else if (gSystem.newAndRepeatedKeys & PAD_KEY_LEFT) {
        if (*capsuleIndex > 0) {
            *capsuleIndex -= 1;
        } else {
            *capsuleIndex = MAX_CAPSULES - 1;
        }
    } else if (gSystem.newAndRepeatedKeys & PAD_KEY_UP) {
        if (*capsuleIndex / 4 != 0) {
            *capsuleIndex -= 4;
            *capsuleIndex %= MAX_CAPSULES;
        } else {
            return FALSE;
        }
    } else if (gSystem.newAndRepeatedKeys & PAD_KEY_DOWN) {
        if (*capsuleIndex / 4 != 2) {
            *capsuleIndex += 4;
            *capsuleIndex %= MAX_CAPSULES;
        } else {
            return FALSE;
        }
    } else {
        return FALSE;
    }

    return TRUE;
}

static void CapsuleManager_MoveCursorToCapsule(CapsuleAppManager *appMan, int index, BOOL moveBoth) {
    s16 x, y;
    int cursorIndex = 0;

    if (index == 0) {
        cursorIndex = 1;
    }
    CapsuleGraphics_GetCapsuleGridLocation(appMan->capsuleIndex[index], &x, &y);
    ManagedSprite_SetPositionXY(appMan->cursor[index], x, y);

    if (moveBoth == TRUE) {
        appMan->capsuleIndex[cursorIndex] = appMan->capsuleIndex[index];
        CapsuleGraphics_GetCapsuleGridLocation(appMan->capsuleIndex[cursorIndex], &x, &y);
        ManagedSprite_SetPositionXY(appMan->cursor[cursorIndex], x, y);
    }
}

static const TouchscreenHitbox ov57_0223BEB0[2] = {
    { .rect = { 168, 192, 192, 256 } },
    { .rect = { TOUCHSCREEN_RECTLIST_END } },
};

static int ov57_0223B578(CapsuleAppManager *appMan) {
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
        if (!DoesPixelAtScreenXYMatchPtrVal(appMan->graphicsMan.bgConfig, GF_BG_LYR_MAIN_3, gSystem.touchX, gSystem.touchY, &sp10)) {
            r4 = -1;
        } else {
            r4 += 12;
        }
        return r4;
    }
    return -1;
}

static int CapsuleManager_HandleCancelUpdateSeals_CapsuleMenu(CapsuleAppManager *appMan) {
    ov57_0223B12C(appMan);
    if (gSystem.newKeys & PAD_BUTTON_A) {
        if (appMan->graphicsMan.index != 0xFF) {
            PlaySE(SEQ_SE_DP_CUSTOM06);
            return CAPSULE_CAPSULE_MENU_STATE_ID;
        }
        CapsuleManager_SetSelectedCapsule(appMan, 0);
        PlaySE(SEQ_SE_DP_PIRORIRO);
        CapsuleManager_PressCapsuleUI(appMan->pageSprites[11], appMan->graphicsMan.textOBJ[0]);
        return CAPSULE_FADE_OUT_WAIT_STATE_ID;
    }
    if (gSystem.newKeys & PAD_BUTTON_B) {
        if (appMan->graphicsMan.index != 0xFF) {
            PlaySE(SEQ_SE_DP_CUSTOM06);
            return CAPSULE_CAPSULE_MENU_STATE_ID;
        }
        CapsuleManager_SetSelectedCapsule(appMan, 0);
        PlaySE(SEQ_SE_DP_DECIDE);
        CapsuleManager_PressCapsuleUI(appMan->pageSprites[12], appMan->graphicsMan.textOBJ[1]);
        return CAPSULE_CANCEL_PRESSED_STATE_ID;
    }
    if (gSystem.newKeys & (PAD_BUTTON_X | PAD_BUTTON_Y)) {
        if (appMan->graphicsMan.index != 0xFF) {
            PlaySE(SEQ_SE_DP_CUSTOM06);
            return CAPSULE_CAPSULE_MENU_STATE_ID;
        }
        PlaySE(SEQ_SE_DP_DECIDE);
        CapsuleManager_PressCapsuleUI(appMan->pageSprites[10], NULL);
        return CAPSULE_FADE_OUT_STATE_ID;
    }

    return CAPSULE_CAPSULE_MENU_STATE_ID;
}

static BOOL ov57_0223B6F0(CapsuleAppManager *appMan) {
    CapsuleManager_UpdateStates(appMan, 1, 0, 3);
    return FALSE;
}

static BOOL CapsuleManager_FreeMenuWindow(CapsuleAppManager *appMan) {
    ov57_02238D80(appMan);
    ov57_0223866C(appMan, TRUE);
    return TRUE;
}

static BOOL ov57_0223B714(CapsuleAppManager *appMan) {
    SealPlacement_UpdateSeals(appMan);
    SealPlacement_LoadCapsuleSeals(appMan);
    CapsuleGraphics_SetCapsuleSpriteAnim(appMan);
    CapsuleMenu_SetAction(appMan->appData, 1);
    appMan->stateID = 5;
    return FALSE;
}

static BOOL ov57_0223B73C(CapsuleAppManager *appMan) {
    CapsuleManager_UpdateStates(appMan, 2, 0, 3);
    return FALSE;
}

static BOOL ov57_0223B74C(CapsuleAppManager *appMan) {
    CapsuleManager_UpdateStates(appMan, 3, 0, 3);
    return FALSE;
}

static void CapsuleManager_CopyToActiveCapsule(CapsuleAppManager *appMan) {
    CopyCapsule(appMan->capsules[appMan->capsuleIndex[0]].capsule, &appMan->activeCapsule);
}

static void CapsuleManager_CopyFromActiveCapsule(CapsuleAppManager *appMan) {
    CopyCapsule(&appMan->activeCapsule, appMan->capsules[appMan->capsuleIndex[0]].capsule);
}

static void CapsuleManager_GetSealCounts(CapsuleAppManager *appMan) {
    for (int i = 0; i < SEAL_MAX + 1; ++i) {
        appMan->sealCounts[i] = SealCaseInventory_GetSealQuantity(appMan->sealCount, i);
    }
}

static void CapsuleManager_SetSealCounts(CapsuleAppManager *appMan) {
    for (int i = 0; i < SEAL_MAX + 1; ++i) {
        SealCaseInventory_SetSealQuantity(appMan->sealCount, i, appMan->sealCounts[i]);
    }
}

static void CapsuleManager_LoadLeadingPokemon(CapsuleAppManager *appMan) {
    int isEgg;
    Pokemon *pokemon;

    if (appMan->capsules[appMan->capsuleIndex[0]].partyIdx != 0xFF) {
        pokemon = appMan->appData->mons[appMan->capsules[appMan->capsuleIndex[0]].partyIdx];
        CopyPokemonToPokemon(pokemon, appMan->pokemon);

        return;
    }

    for (int i = 0; i < appMan->appData->partyCount; i++) {
        pokemon = appMan->appData->mons[i];
        isEgg = GetMonData(pokemon, MON_DATA_IS_EGG, NULL);

        if (isEgg != 0) {
            continue;
        }

        CopyPokemonToPokemon(pokemon, appMan->pokemon);
        break;
    }
}

static void CapsuleManager_UpdateStates(CapsuleAppManager *appMan, int a1, int a2, int a3) {
    if (a2 == 0xFF) {
        appMan->stateID = appMan->alternateState;
    } else {
        appMan->stateID = a2;
    }
    appMan->funcIndex = a1;
    appMan->alternateState = a3;
    appMan->throwStateID = 0;
}

static void CapsuleManager_SetUIAnimationFromTouch(ManagedSprite *sprite, u32 event) {
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

static void CapsuleManager_OffsetFontOAM(TextOBJ *textOBJ, int xOffset, int yOffset) {
    int x;
    int y;

    if (textOBJ != NULL) {
        sub_02013794(textOBJ, &x, &y);
        sub_020136B4(textOBJ, x + xOffset, y + yOffset);
    }
}

static void CapsuleManager_CapsuleUIPressTask(SysTask *sysTask, void *taskData) {
    CapsuleUIPressTask *capsuleUIPressTask = taskData;

    switch (capsuleUIPressTask->frame) {
    case 3:
        CapsuleManager_OffsetFontOAM(capsuleUIPressTask->textOBJ, 0, -1);
        ManagedSprite_SetAnimationFrame(capsuleUIPressTask->sprite, 2);
        capsuleUIPressTask->frame++;
        break;
    case 6:
        CapsuleManager_OffsetFontOAM(capsuleUIPressTask->textOBJ, 0, 2);
        ManagedSprite_SetAnimationFrame(capsuleUIPressTask->sprite, 0);
        SysTask_Destroy(sysTask);
        Heap_Free(capsuleUIPressTask);
        break;
    default:
        capsuleUIPressTask->frame++;
        break;
    }
}

static void CapsuleManager_PressCapsuleUI(ManagedSprite *sprite, TextOBJ *textObj) {
    CapsuleUIPressTask *taskData = Heap_Alloc(HEAP_ID_CAPSULE_MENU, sizeof(CapsuleUIPressTask));
    taskData->frame = 1;
    taskData->sprite = sprite;
    taskData->textOBJ = textObj;
    CapsuleManager_OffsetFontOAM(taskData->textOBJ, 0, -1);
    SysTask_CreateOnMainQueue(CapsuleManager_CapsuleUIPressTask, taskData, 1000);
}

static BOOL CapsuleManager_GetGraphicsTaskResult(CapsuleAppManager *appMan) {
    return appMan->graphicsMan.graphicsTaskResult;
}

static void CapsuleManager_SetSelectedCapsule(CapsuleAppManager *appMan, int a1) {
    appMan->graphicsMan.selectedCapsule = a1;
}

static void CapsuleManager_LoadThrownMonSprite(CapsuleAppManager *appMan) {
    PokepicTemplate pokemonSpriteTemplate;
    PokepicAnimScript spriteAnimFrame[10];
    int species;
    int yOffset;

    GetPokemonSpriteCharAndPlttNarcIds(&pokemonSpriteTemplate, appMan->pokemon, 2);

    species = GetMonData(appMan->pokemon, MON_DATA_SPECIES, NULL);
    yOffset = sub_0207083C(appMan->pokemon, 2);

    appMan->graphicsMan.pokepicYOffset = yOffset;
    NARC_ReadPokepicAnimScript(appMan->narc, spriteAnimFrame, species, 1);
    appMan->graphicsMan.pokepic = PokepicManager_CreatePokepic(appMan->graphicsMan.pokepicManager, &pokemonSpriteTemplate, 192, 48 + yOffset, -640, 0, spriteAnimFrame, NULL);
}

static void CapsuleManager_LoadThrownMonAnim(CapsuleAppManager *appMan) {
    int species;
    int dummy;

    species = GetMonData(appMan->pokemon, MON_DATA_SPECIES, NULL);
    dummy = GetMonNature(appMan->pokemon);

    Pokepic_StartAnim(appMan->graphicsMan.pokepic, 1);
    sub_0207294C(appMan->narc, appMan->graphicsMan.pokepicAnimManager, appMan->graphicsMan.pokepic, species, 2, 0, 0);
}

static void CapsuleManager_ZeroThrownMonScale(CapsuleAppManager *appMan) {
    Pokepic_SetAttr(appMan->graphicsMan.pokepic, POKEPIC_AFFINEW, 0);
    Pokepic_SetAttr(appMan->graphicsMan.pokepic, POKEPIC_AFFINEH, 0);
}

static BOOL ov57_0223BA40(CapsuleAppManager *appMan) {
    if (Pokepic_GetAttr(appMan->graphicsMan.pokepic, POKEPIC_AFFINEW) == 0x100) {
        return FALSE;
    } else if (Pokepic_GetAttr(appMan->graphicsMan.pokepic, POKEPIC_AFFINEW) >= 0x100) {
        Pokepic_SetAttr(appMan->graphicsMan.pokepic, POKEPIC_AFFINEW, 0x100);
        Pokepic_SetAttr(appMan->graphicsMan.pokepic, POKEPIC_AFFINEH, 0x100);
        return 0;
    } else {
        Pokepic_AddAttr(appMan->graphicsMan.pokepic, POKEPIC_AFFINEW, 0x20);
        Pokepic_AddAttr(appMan->graphicsMan.pokepic, POKEPIC_AFFINEH, 0x20);
        sub_0200914C(appMan->graphicsMan.pokepic, appMan->graphicsMan.pokepicYOffset);
    }

    return TRUE;
}

static BOOL ov57_0223BABC(CapsuleAppManager *appMan) {
    if (Pokepic_GetAttr(appMan->graphicsMan.pokepic, POKEPIC_AFFINEW) == 0x0) {
        return 0;
    } else if (Pokepic_GetAttr(appMan->graphicsMan.pokepic, POKEPIC_AFFINEW) <= 0x0) {
        Pokepic_SetAttr(appMan->graphicsMan.pokepic, POKEPIC_AFFINEW, 0x0);
        Pokepic_SetAttr(appMan->graphicsMan.pokepic, POKEPIC_AFFINEH, 0x0);
        return 0;
    } else {
        Pokepic_AddAttr(appMan->graphicsMan.pokepic, POKEPIC_AFFINEW, -0x20);
        Pokepic_AddAttr(appMan->graphicsMan.pokepic, POKEPIC_AFFINEH, -0x20);
        sub_0200914C(appMan->graphicsMan.pokepic, appMan->graphicsMan.pokepicYOffset);
    }

    return 1;
}

static void CapsuleManager_SetThrownMonSpriteHidden(CapsuleAppManager *appMan, int value) {
    Pokepic_SetAttr(appMan->graphicsMan.pokepic, POKEPIC_VANISHED, value);
}

static void CapsuleManager_FreeThrownMonSprite(CapsuleAppManager *appMan) {
    Pokepic_Delete(appMan->graphicsMan.pokepic);
}

void CapsuleManager_SetNormalAlpha(void) {
    G2_SetBlendAlpha(GX_BLEND_PLANEMASK_NONE, GX_BLEND_PLANEMASK_NONE, 31, 31);
    G2S_SetBlendAlpha(GX_BLEND_PLANEMASK_NONE, GX_BLEND_PLANEMASK_NONE, 31, 31);
}
