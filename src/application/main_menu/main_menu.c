#include "application/main_menu/main_menu.h"

#include "global.h"

#include "msgdata/msg.naix"
#include "msgdata/msg/msg_0017.h"
#include "msgdata/msg/msg_0442.h"
#include "msgdata/msg/msg_0800.h"

#include "bg_window.h"
#include "font.h"
#include "gf_gfx_loader.h"
#include "main.h"
#include "menu_input_state.h"
#include "msgdata.h"
#include "mystery_gift.h"
#include "overlay_36.h"
#include "player_data.h"
#include "pokedex.h"
#include "render_window.h"
#include "sav_system_info.h"
#include "save.h"
#include "save_arrays.h"
#include "save_data_read_error.h"
#include "sound_02004A44.h"
#include "sprite.h"
#include "system.h"
#include "text.h"
#include "title_screen.h"
#include "touchscreen.h"
#include "unk_02005D10.h"
#include "unk_0200B150.h"
#include "unk_0200FA24.h"
#include "vram_transfer_manager.h"

typedef enum MainMenu_AppOption {
    APPOPTION_TITLE_SCREEN,
    APPOPTION_CONTINUE,
    APPOPTION_NEW_GAME,
    APPOPTION_POKEWALKER,
    APPOPTION_MYSTERY_GIFT,
    APPOPTION_RANGER,
    APPOPTION_MIGRATE_AGB,
    APPOPTION_CONNECT_TO_WII,
    APPOPTION_WFC,
    APPOPTION_WII_SETTINGS,

    APPOPTION_COUNT = APPOPTION_WII_SETTINGS,
} MainMenu_AppOption;

typedef struct MainMenuAppData {
    BgConfig *bgConfig;
    SaveData *saveData;
    Pokedex *pokedex;
    PlayerProfile *profile;
    IGT *igt;
    MysteryGiftSave *mysteryGift;
    u32 frames; // actual purpose unknown, this is incremented in the main function but never read anywhere
    u32 unused1C;
    u32 unk20;
    u32 connectedAgbGame;
    u32 unused28;
    BOOL drawConnectToRangerButton;
    BOOL drawConnectToWiiButton;
    BOOL drawMysteryGiftButton;
    u32 unk38;
    u32 unused3C;
    u32 unk40;
    u32 unk44;
    BOOL unk48;
    BOOL hasPokedex;
    u32 badges;
    u16 currentOption;
    u16 currentNewGameOption;
    MainMenu_AppOption selectedApp;
    Window unk5C[APPOPTION_COUNT];
    u32 unkEC[APPOPTION_COUNT];
    u32 unk110[APPOPTION_COUNT];
    fx32 currentScreenY;
    fx32 effectiveScreenY;
    u32 unk13C;
    u32 unk140;
    u32 unk144;
    u32 unk148;
    u32 unk14C;
    u32 unk150;
    Window unk154;
    Window unk164[2];
    BOOL dontHaveSavedata;
    BOOL unk188;
    u32 unk18C[1];
    Window unk190;
    Sprite *upArrowSprite;
    Sprite *downArrowSprite;
    u32 buttonBorderAnimFrame;
    MenuInputStateMgr menuInputState;
    int unk1B0;
    u32 unk1B4;
} MainMenuAppData;

typedef struct UnkStruct_ov74_02235414 {
    u32 unk0;
    BOOL unk4;
    u8 unk8[0x8];
    Window *window;
    u8 unk14[0x20 - 0x14];
    u32 textX;
    u32 textY;
    u8 unk28[4];
    u32 layer;
    u32 paletteNum1;
    u32 gmmId;
    u32 baseTile;
    u32 paletteNum2;
    u32 fontId;
    u8 unk44[0x10];
} UnkStruct_ov74_02235414;

typedef BOOL (*MainMenuPrintFunction)(MainMenuAppData *, u32, UnkStruct_ov74_02235414 *, u32);

typedef struct MainMenuButton {
    MainMenu_AppOption id;
    u32 height;
    u32 msgId;
    MainMenuPrintFunction printFunction;
} MainMenuButton;

extern void sub_02005AF8(u32 a0);
extern void sub_02027098(const char *path);
extern void sub_02038D28(SaveData *saveData);
extern void sub_02038D64(void);
extern u32 sub_02038D80(void);

extern u32 PmAgbCartridgeGetOffsets(u32 a0);
extern u32 PmAgbCartridge_GetVersionInternal(void);
extern u32 PmAgbCartridge_GetLanguage(void);
extern void ov74_0223512C(enum HeapID heapID);
extern u32 ov74_02235230(void);
extern void ov74_022352A0(enum HeapID heapID);
extern void ov74_02235308(BgConfig *bgConfig, u8 bgId, u32 screenSize, u32 screenBase, u32 charBase);
extern void ov74_02235390(u32 a0);
extern void ov74_0223539C(u32 a0, u32 newState, int *state, u32 waitingState);
extern void ov74_022353FC(int *state);
extern void ov74_02235414(UnkStruct_ov74_02235414 *a0, Window *window, u32 palette1, u32 gmmId, u32 baseTile, u32 palette2);
extern void ov74_02235464(UnkStruct_ov74_02235414 *a0, u32 width, u32 height, u32 baseTile);
extern void ov74_02235568(BgConfig *bgConfig, UnkStruct_ov74_02235414 *a1, u32 x, u32 y, u32 msgId);
extern void ov74_0223563C(void);
extern void ov74_02235690(void);
extern void ov74_02235728(NarcId narcId, u32 charFileId, u32 plttFileId, u32 cellFileId, u32 animFileId, u32 a5);
extern void ov74_022358BC(void);
extern Sprite *ov74_02235930(u32 a0, Sprite *sprite, u32 x, u32 y, u32 ctrlSeq);
extern void ov74_022359BC(void);
extern void ov74_02236034(BOOL enable);
extern void ov74_02236074(void);

extern BOOL CTRDG_IsExisting();

static void ov74_0222841C(MainMenuAppData *data, int currentOption);
static void ov74_02228548(MainMenuAppData *data, int a1);
static BOOL ChangeCurrentAppOption(MainMenuAppData *data, int offset);
static void ov74_022286F8(MainMenuAppData *data, int a1);
static void MainMenu_UpdateArrowSprites(MainMenuAppData *data);
static void AdvanceButtonBorderAnimation(MainMenuAppData *data);

static BOOL MainMenu_PrintContinueButton(MainMenuAppData *data, u32 a1, UnkStruct_ov74_02235414 *a2, u32 a3);
static BOOL MainMenu_PrintMigrateFromAgbButton(MainMenuAppData *data, u32 a1, UnkStruct_ov74_02235414 *a2, u32 a3);
static BOOL MainMenu_PrintMysteryGiftButton(MainMenuAppData *data, u32 a1, UnkStruct_ov74_02235414 *a2, u32 a3);
static BOOL MainMenu_PrintConnectToRangerButton(MainMenuAppData *data, u32 a1, UnkStruct_ov74_02235414 *a2, u32 a3);
static BOOL MainMenu_PrintConnectToWiiButton(MainMenuAppData *data, u32 a1, UnkStruct_ov74_02235414 *a2, u32 a3);
static BOOL MainMenu_PrintNintendoWFCSetupButton(MainMenuAppData *data, u32 a1, UnkStruct_ov74_02235414 *a2, u32 a3);
static BOOL MainMenu_PrintConnectToPokewalkerButton(MainMenuAppData *data, u32 a1, UnkStruct_ov74_02235414 *a2, u32 a3);
static BOOL MainMenu_PrintWiiMessageSettingsButton(MainMenuAppData *data, u32 a1, UnkStruct_ov74_02235414 *a2, u32 a3);

static MainMenuButton sMainMenuButtons[] = {
    { .id = APPOPTION_CONTINUE,       .height = 10, .msgId = msg_0442_00000, .printFunction = MainMenu_PrintContinueButton            },
    { .id = APPOPTION_NEW_GAME,       .height = 4,  .msgId = msg_0442_00001, .printFunction = NULL                                    },
    { .id = APPOPTION_POKEWALKER,     .height = 4,  .msgId = msg_0442_00009, .printFunction = MainMenu_PrintConnectToPokewalkerButton },
    { .id = APPOPTION_MYSTERY_GIFT,   .height = 4,  .msgId = msg_0442_00002, .printFunction = MainMenu_PrintMysteryGiftButton         },
    { .id = APPOPTION_RANGER,         .height = 4,  .msgId = msg_0442_00003, .printFunction = MainMenu_PrintConnectToRangerButton     },
    { .id = APPOPTION_MIGRATE_AGB,    .height = 4,  .msgId = 0,              .printFunction = MainMenu_PrintMigrateFromAgbButton      }, // msgId can be 4, 5, 6, 7 or 8 depending on the inserted cartridge
    { .id = APPOPTION_CONNECT_TO_WII, .height = 4,  .msgId = msg_0442_00011, .printFunction = MainMenu_PrintConnectToWiiButton        },
    { .id = APPOPTION_WFC,            .height = 4,  .msgId = msg_0442_00012, .printFunction = MainMenu_PrintNintendoWFCSetupButton    },
    { .id = APPOPTION_WII_SETTINGS,   .height = 4,  .msgId = msg_0442_00010, .printFunction = MainMenu_PrintWiiMessageSettingsButton  },
};

static const TouchscreenHitbox sNewGameButtonHitboxes[] = {
    { .rect = { .top = 112, .bottom = 112 + 24, .left = 32, .right = GX_LCD_SIZE_X - 32 } },
    { .rect = { .top = 152, .bottom = 152 + 24, .left = 32, .right = GX_LCD_SIZE_X - 32 } },
    { TOUCHSCREEN_RECTLIST_END },
};

static const TouchscreenHitbox sArrowButtonHitboxes[] = {
    { .rect = { .top = 6, .bottom = 6 + 28, .left = 222, .right = 222 + 28 } },
    { .rect = { .top = 158, .bottom = 158 + 28, .left = 222, .right = 222 + 28 } },
    { TOUCHSCREEN_RECTLIST_END },
};

extern const OverlayManagerTemplate gApp_MainMenu_SelectOption_MysteryGift;
extern const OverlayManagerTemplate gApp_MainMenu_SelectOption_MigrateFromAgb;
extern const OverlayManagerTemplate gApp_MainMenu_SelectOption_ConnectToRanger;
extern const OverlayManagerTemplate gApp_MainMenu_SelectOption_NintendoWFCSetup;
extern const OverlayManagerTemplate ov112_App_MainMenu_SelectOption_ConnectToPokewalker;
extern const OverlayManagerTemplate ov75_App_MainMenu_SelectOption_WiiMessageSettings;

static u32 ov74_02227060(MainMenuAppData *data) {
    if (gSystem.newKeys & (PAD_BUTTON_Y | PAD_BUTTON_X | PAD_KEY_UP | PAD_KEY_DOWN | PAD_KEY_LEFT | PAD_KEY_RIGHT | PAD_BUTTON_B | PAD_BUTTON_A)) {
        data->menuInputState.state = MENU_INPUT_STATE_BUTTONS;
        return gSystem.newKeys;
    } else if (System_GetTouchNew()) {
        data->menuInputState.state = MENU_INPUT_STATE_TOUCH;
        return PAD_BUTTON_A;
    }

    return 0;
}

static u32 GetNthAvailableApp(MainMenuAppData *data, u8 n) {
    for (u32 i = 0, apps = 0; i < APPOPTION_COUNT; i++) {
        if (data->unkEC[i] != 0 && apps++ == n) {
            return i;
        }
    }
    return 0;
}

static u32 ov74_022270C4(MainMenuAppData *data, int *state, BOOL a2) {
    if (!a2) {
        PlaySE(SEQ_SE_DP_SELECT);
        data->selectedApp = (MainMenu_AppOption)data->unkEC[data->currentOption];
        if (data->selectedApp == APPOPTION_MIGRATE_AGB && CTRDG_IsPulledOut() == TRUE) {
            if (data->unk13C != 12) {
                sub_02038D64();
            }
            ShowGBACartRemovedError(HEAP_ID_MAIN_MENU);
        }
    } else {
        PlaySE(SEQ_SE_DP_SELECT);
        data->selectedApp = APPOPTION_TITLE_SCREEN;
        ov74_02235390(1);
    }

    if (data->selectedApp == APPOPTION_NEW_GAME) {
        data->unk40 |= (1 << 7);
        data->unk148 = 1;
        *state = 6;
    } else {
        if (data->selectedApp == APPOPTION_CONNECT_TO_WII) {
            ov74_02235390(1);
        }
        ov74_0223539C(0, 7, state, 8);
    }

    if (data->unk13C == 13) {
        data->unk13C = 14;
    }

    return TRUE;
}

static int CountAvailableAppsBefore(MainMenuAppData *data, int a1) {
    int i;
    int apps = 0;
    for (i = 0; i < a1; i++) {
        if (data->unkEC[i] != 0) {
            apps++;
        }
    }
    return apps;
}

static BOOL MainMenu_HandleKeyInput(MainMenuAppData *data, int *state) {
    BOOL changedOption = FALSE;

    if (gSystem.newKeys & (PAD_BUTTON_Y | PAD_BUTTON_X | PAD_KEY_UP | PAD_KEY_DOWN | PAD_KEY_LEFT | PAD_KEY_RIGHT | PAD_BUTTON_B | PAD_BUTTON_A) && data->menuInputState.state == MENU_INPUT_STATE_TOUCH) {
        data->menuInputState.state = MENU_INPUT_STATE_BUTTONS;
        ov74_0222841C(data, data->currentOption);
        return FALSE;
    }

    if (gSystem.newKeys & PAD_BUTTON_A) {
        return ov74_022270C4(data, state, FALSE);
    } else if (gSystem.newKeys & PAD_BUTTON_B) {
        return ov74_022270C4(data, state, TRUE);
    }

    if (data->unk48) {
        return FALSE;
    }

    u32 unk;
    u32 oldOption = data->currentOption;
    if (gSystem.newKeys & PAD_KEY_UP) {
        if (ChangeCurrentAppOption(data, -1)) {
            unk = CountAvailableAppsBefore(data, oldOption);
            if (unk == 7) {
                unk = 3;
                changedOption = TRUE;
            } else if (unk == 3) {
                unk = 0;
                changedOption = TRUE;
            }
        }
    } else if (gSystem.newKeys & PAD_KEY_DOWN) {
        changedOption = ChangeCurrentAppOption(data, 1);
        unk = data->currentOption;
    }

    if (changedOption) {
        ov74_022286F8(data, unk);
    }

    return FALSE;
}

static BOOL MainMenu_HandleTouchInput(MainMenuAppData *data, int *state, BOOL *validInput) {
    BOOL hitArrowButton;

    int hitboxNum = -1;
    hitArrowButton = FALSE;

    if (!System_GetTouchNew()) {
        return FALSE;
    }

    if (!data->unk48 && data->unk1B4 == 0) {
        hitboxNum = TouchscreenHitbox_FindRectAtTouchNew(sArrowButtonHitboxes);
    }

    if (hitboxNum == 0 && Sprite_GetAnimationNumber(data->upArrowSprite) / 2 != 0) {
        Sprite_SetAnimActiveFlag(data->upArrowSprite, TRUE);
        Sprite_ResetAnimCtrlState(data->upArrowSprite);
        if (data->currentOption > 3 && data->effectiveScreenY > FX32_CONST(GX_LCD_SIZE_Y)) {
            data->currentOption = GetNthAvailableApp(data, 3);
        } else {
            data->currentOption = GetNthAvailableApp(data, 0);
        }
        hitArrowButton = TRUE;
        *validInput = TRUE;
    } else if (hitboxNum == 1 && Sprite_GetAnimationNumber(data->downArrowSprite) / 2 != 0) {
        Sprite_SetAnimActiveFlag(data->downArrowSprite, TRUE);
        Sprite_ResetAnimCtrlState(data->downArrowSprite);
        if (data->currentOption < 3) {
            data->currentOption = GetNthAvailableApp(data, 3);
        } else {
            data->currentOption = GetNthAvailableApp(data, 7);
        }
        hitArrowButton = TRUE;
        *validInput = TRUE;
    }

    if (hitArrowButton) {
        data->menuInputState.state = MENU_INPUT_STATE_TOUCH;
        ov74_0222841C(data, data->currentOption);
        ov74_022286F8(data, data->currentOption);
        data->unk1B4 = 6;
        return FALSE;
    }

    u16 pixel = 0xFFFF & ~(1 << 0);
    u16 effectiveTouchY = gSystem.touchY + (data->effectiveScreenY / FX32_ONE);
    if (effectiveTouchY >= 512) {
        return FALSE;
    }
    if (!DoesPixelAtScreenXYMatchPtrVal(data->bgConfig, GF_BG_LYR_MAIN_0, gSystem.touchX, effectiveTouchY, &pixel)) {
        return FALSE;
    }

    *validInput = TRUE;

    // Button heights are 48 pixels.
    u16 touchedOption = gSystem.touchY / 48;
    if (data->effectiveScreenY == 0) {
        // The continue button is twice the height of the other buttons, so we need to account for one button being two buttons tall.
        if (touchedOption != 0) {
            touchedOption--;
        }
    } else if (data->effectiveScreenY == FX32_CONST(GX_LCD_SIZE_Y)) {
        touchedOption += 3;
    } else {
        touchedOption += 7;
    }

    if (touchedOption >= data->unk1B0) {
        return FALSE;
    }

    data->currentOption = GetNthAvailableApp(data, touchedOption);

    data->menuInputState.state = MENU_INPUT_STATE_TOUCH;
    ov74_0222841C(data, data->currentOption);
    return ov74_022270C4(data, state, FALSE);
}

static BOOL MainMenu_HandleInput(MainMenuAppData *data, int *newState) {
    BOOL hadTouchInput = FALSE;
    BOOL touchResult = MainMenu_HandleTouchInput(data, newState, &hadTouchInput);
    if (hadTouchInput) {
        data->menuInputState.state = MENU_INPUT_STATE_TOUCH;
        if (data->unk1B4 != 6) {
            ov74_0222841C(data, 0xFF);
        }
        return touchResult;
    }
    return MainMenu_HandleKeyInput(data, newState);
}

static u32 MainMenu_NewGame_HandleTouchInput(MainMenuAppData *data, BOOL *validInput) {
    if (!System_GetTouchNew()) {
        return 0;
    }

    int hitboxId = TouchscreenHitbox_FindRectAtTouchNew(sNewGameButtonHitboxes);
    if (hitboxId == -1) {
        return 0;
    }

    // Make sure the player didn't touch a transparent pixel (because of the hitbox sizes and positions, this will always be true)
    u16 pixel = 0xFFFF & ~(1 << 0);
    if (!DoesPixelAtScreenXYMatchPtrVal(data->bgConfig, GF_BG_LYR_MAIN_1, gSystem.touchX, gSystem.touchY, &pixel)) {
        return 0;
    }

    u32 ret = 1;
    *validInput = TRUE;
    if (hitboxId != 0) {
        ret = 2;
    }

    return ret;
}

static u32 MainMenu_NewGame_HandleInput(MainMenuAppData *data) {
    BOOL hadTouchInput = FALSE;
    u32 touchResult = MainMenu_NewGame_HandleTouchInput(data, &hadTouchInput);
    if (hadTouchInput) {
        data->menuInputState.state = MENU_INPUT_STATE_TOUCH;
        ov74_02228548(data, 0xFF);
        return touchResult;
    }

    if (gSystem.newKeys == 0) {
        return 0;
    }

    if (gSystem.newKeys & (PAD_BUTTON_Y | PAD_BUTTON_X | PAD_KEY_UP | PAD_KEY_DOWN | PAD_KEY_LEFT | PAD_KEY_RIGHT | PAD_BUTTON_B | PAD_BUTTON_A) && data->menuInputState.state == MENU_INPUT_STATE_TOUCH) {
        data->menuInputState.state = MENU_INPUT_STATE_BUTTONS;
        ov74_02228548(data, data->currentNewGameOption);
        return 0;
    }

    if (gSystem.newKeys & (PAD_KEY_UP | PAD_KEY_DOWN)) {
        data->currentNewGameOption ^= 1;
        ov74_02228548(data, data->currentNewGameOption);
        PlaySE(SEQ_SE_DP_SELECT);
        return 0;
    }

    u32 ret = 1;
    if (gSystem.newKeys & PAD_BUTTON_A) {
        if (data->currentNewGameOption != 0) {
            ret = 2;
        }
    } else {
        ret = 2;
        if (!(gSystem.newKeys & PAD_BUTTON_B)) {
            ret = 0;
        }
    }

    return ret;
}

static u32 ov74_02227580(MainMenuAppData *data) {
    return 0;
}

typedef struct UnkStruct_ov74_0223BBD4 {
    u32 x;
    u32 y;
    u32 width;
    u32 height;
    u32 gmmId;
    u32 msgId;
    u32 unused18;
} UnkStruct_ov74_0223BBD4;

// Unused warning screen for wifi user info
static BOOL ov74_02227584(MainMenuAppData *data) {
    static UnkStruct_ov74_0223BBD4 ov74_0223BBD4[] = {
        {
         .x = 5,
         .y = 5,
         .width = 22,
         .height = 14,
         .gmmId = NARC_msg_msg_0800_bin,
         // clang-format off
         .msgId = msg_0800_00016, // "Your Nintendo Wi-Fi Connection User Information may have been erased. [...]"
         .unused18 = 0,
         // clang-format on
        },
    };

    if (!WindowIsInUse(&data->unk190)) {
        for (int i = 0; i < (int)NELEMS(data->unk18C); i++) {
            if (data->unk18C[i] == 1) {
                data->unk18C[i] = 0;
                UnkStruct_ov74_02235414 unk;
                const UnkStruct_ov74_0223BBD4 *unk2 = &ov74_0223BBD4[i];
                ov74_02235414(&unk, &data->unk190, 0, unk2->gmmId, 0x3F7, 2);
                ov74_02235464(&unk, unk2->width, unk2->height, 1);
                ov74_02235568(data->bgConfig, &unk, unk2->x, unk2->y, unk2->msgId);
                return TRUE;
            }
        }
    } else {
        if (ov74_02227060(data) & (PAD_BUTTON_B | PAD_BUTTON_A)) {
            PlaySE(SEQ_SE_DP_SELECT);
            sub_0200E5D4(&data->unk190, FALSE);
            RemoveWindow(&data->unk190);
        }
        return TRUE;
    }

    return FALSE;
}

static void DetectInsertedGBACart(MainMenuAppData *data) {
    u32 offsets = PmAgbCartridgeGetOffsets(0);
    u32 version = 0;
    data->connectedAgbGame = 0;

    if (offsets != 0) {
        return;
    }

    switch (PmAgbCartridge_GetVersionInternal()) {
    case 0:
        version = VERSION_RUBY;
        break;
    case 1:
        version = VERSION_SAPPHIRE;
        break;
    case 2:
        version = VERSION_LEAF_GREEN;
        break;
    case 3:
        version = VERSION_FIRE_RED;
        break;
    case 4:
        version = VERSION_EMERALD;
        break;
    }
    sub_0201A4B0(version);

    if (Pokedex_GetNatDexFlag(data->pokedex) && gGameLanguage == PmAgbCartridge_GetLanguage()) {
        data->connectedAgbGame = PmAgbCartridge_GetVersionInternal() + 1;
        ov74_02236074();
    }
}

static void ov74_022276AC(MainMenuAppData *data) {
    switch (data->unk13C) {
    case 10:
        data->unk13C = 11;
        break;
    case 11:
        sub_02038D28(data->saveData);
        data->unk140 = 120;
        data->unk13C = 13;
        data->unk40 = 0;
        if (SaveMysteryGift_TestFlagx7FF(data->mysteryGift) == TRUE) {
            data->unk40 |= (1 << 0);
            data->unk44 |= (1 << 0);
        }
        break;
    case 13: {
        if (data->unk148 != 0) {
            break;
        }

        u32 unk = sub_02038D80();
        u32 unk2 = ~data->unk40 & unk;
        if (unk2 != 0 && data->unk144 == 15 && data->unk148 == 0 && data->unk40 != unk2) {
            data->unk48 = TRUE;

            if (unk2 & (1 << 0)) {
                data->drawMysteryGiftButton = TRUE;
                unk2 = (1 << 0);
            }

            if (unk2 & (1 << 1)) {
                data->drawConnectToRangerButton = TRUE;
                unk2 = (1 << 1);
            }

            if (unk2 & (1 << 2)) {
                data->drawConnectToWiiButton = TRUE;
                unk2 = (1 << 2);
            }

            if (unk2 & (1 << 1 | 1 << 0)) {
                data->unk188 = TRUE;
            }

            data->unk40 |= unk2;
        }

        data->unk140--;
        if (data->unk140 == 0) {
            sub_02038D64();
            data->unk13C = 12;
        }

        break;
    }
    case 14:
        sub_02038D64();
        data->unk13C = 12;
        break;
    }
}

typedef struct UnkStruct_ov74_0223BC30 {
    u32 x;
    u32 y;
    u32 width;
    u32 height;
    u32 msgId;
} UnkStruct_ov74_0223BC30;

static BOOL ov74_0222779C(MainMenuAppData *data) {
    static UnkStruct_ov74_0223BC30 ov74_0223BC30[] = {
        { .x = 4, .y = 2,  .width = 24, .height = 20, .msgId = msg_0017_00001 }, // Found a mystery gift
        { .x = 4, .y = 4,  .width = 24, .height = 16, .msgId = msg_0017_00003 }, // Found a mystery gift, but don't have the Pokédex
        { .x = 4, .y = 1,  .width = 24, .height = 22, .msgId = msg_0017_00000 }, // Got a recruitment message from Ranger
        { .x = 4, .y = 3,  .width = 24, .height = 18, .msgId = msg_0017_00002 }, // Got a recruitment message from Ranger, but don't have the Pokédex
        { .x = 0, .y = 1,  .width = 32, .height = 11, .msgId = msg_0017_00005 }, // "WARNING! There's already a saved game file. [...]"
        { .x = 4, .y = 14, .width = 24, .height = 3,  .msgId = msg_0017_00006 }, // "Begin adventure"
        { .x = 4, .y = 19, .width = 24, .height = 3,  .msgId = msg_0017_00007 }, // "Return to the menu"
    };

    switch (data->unk144) {
    case 15:
        if (data->unk148 == 0) {
            return FALSE;
        }

        data->unk148--;
        if (data->unk148 == 0) {
            data->unk144 = 16;
        }
        return TRUE;
    case 16:
        LoadUserFrameGfx1(data->bgConfig, GF_BG_LYR_MAIN_1, 0x3F7, 2, 0, HEAP_ID_MAIN_MENU);
        LoadUserFrameGfx1(data->bgConfig, GF_BG_LYR_MAIN_1, 0x3EE, 3, 1, HEAP_ID_MAIN_MENU);
        BgClearTilemapBufferAndCommit(data->bgConfig, GF_BG_LYR_MAIN_1);
        ((vu16 *)HW_PLTT)[33] = RGB(26, 26, 26);
        data->unk144 = 17;
        break;
    case 17: {
        UnkStruct_ov74_02235414 unk;
        ov74_02235414(&unk, &data->unk154, 0, NARC_msg_msg_0017_bin, 0x3F7, 2);
        UnkStruct_ov74_0223BC30 *unk2;
        u32 unk3 = data->unk40 & ~data->unk44;
        if (unk3 & (1 << 0)) {
            unk2 = (data->unk38 & (1 << 0)) ? &ov74_0223BC30[0] : &ov74_0223BC30[1];
        } else if (unk3 & (1 << 1)) {
            unk2 = (data->unk38 & (1 << 1)) ? &ov74_0223BC30[2] : &ov74_0223BC30[3];
        } else if (unk3 & (1 << 7)) {
            unk.unk0 = 2;
            unk2 = &ov74_0223BC30[4];
            MsgData *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, unk.gmmId, HEAP_ID_MAIN_MENU);
            String *string = NewString_ReadMsgData(msgData, unk2->msgId);
            u32 width = FontID_String_GetWidthMultiline(unk.fontId, string, 0);
            unk.textX = (unk2->width * 8 - width) / 2;
            String_Delete(string);
            DestroyMsgData(msgData);
            unk.textY = 4;
        }
        ov74_02235464(&unk, unk2->width, unk2->height, 0x91);
        unk.layer = GF_BG_LYR_MAIN_1;
        ov74_02235568(data->bgConfig, &unk, unk2->x, unk2->y, unk2->msgId);

        BgTilemapRectChangePalette(data->bgConfig, GF_BG_LYR_MAIN_1, GetWindowX(unk.window), GetWindowY(unk.window), GetWindowWidth(unk.window), GetWindowHeight(unk.window), 0);

        if ((unk3 & (1 << 7)) && !(unk3 & (1 << 1 | 1 << 0))) {
            for (int i = 0; i < (int)NELEMS(data->unk164); i++) {
                Window *window = &data->unk164[i];
                ov74_02235414(&unk, window, 0, NARC_msg_msg_0017_bin, 0x3F7, 2);
                UnkStruct_ov74_0223BC30 *unk3 = &ov74_0223BC30[i + 5];
                unk.textY = 4;
                ov74_02235464(&unk, unk3->width, unk3->height, (i * 72) + 1);
                unk.layer = GF_BG_LYR_MAIN_1;
                ov74_02235568(data->bgConfig, &unk, unk3->x, unk3->y, unk3->msgId);
            }
            data->currentNewGameOption = 0;
            ov74_02228548(data, -1);
            data->unk144 = 19;
            data->unk14C = 30;
        } else {
            data->unk44 |= unk3;
            data->unk144 = 18;
            data->unk14C = 30;
        }

        GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG0, GF_PLANE_TOGGLE_OFF);
        GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG2, GF_PLANE_TOGGLE_OFF);
        GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG1, GF_PLANE_TOGGLE_ON);
        break;
    }
    case 18: {
        if (data->unk14C != 0) {
            data->unk14C--;
            break;
        }

        u32 oldInputState = data->menuInputState.state;
        u32 unk = ov74_02227060(data);
        if (unk & (PAD_BUTTON_B | PAD_BUTTON_A)) {
            if (oldInputState != data->menuInputState.state) {
                ov74_0222841C(data, data->currentOption);
            }
            RemoveWindow(&data->unk154);
            data->unk144 = 20;
            data->unk150 = unk;
            PlaySE(SEQ_SE_DP_SELECT);
        }
        break;
    }
    case 19:
        if (data->unk14C != 0) {
            data->unk14C--;
            if (data->unk14C == 0) {
                ov74_02228548(data, 0);
            }
        } else {
            u32 inputResult = MainMenu_NewGame_HandleInput(data);
            AdvanceButtonBorderAnimation(data);
            if (inputResult & 3) {
                RemoveWindow(&data->unk154);
                RemoveWindow(&data->unk164[0]);
                RemoveWindow(&data->unk164[1]);
                ov74_0222841C(data, data->currentOption);
                data->unk144 = 20;
                data->unk150 = inputResult;
                PlaySE(SEQ_SE_DP_SELECT);
            }
        }
        break;
    case 20:
        GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG0, GF_PLANE_TOGGLE_ON);
        GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG2, GF_PLANE_TOGGLE_ON);
        GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG1, GF_PLANE_TOGGLE_OFF);
        data->unk144 = 15;
        break;
    }

    return TRUE;
}

static void HandleScreenScroll(MainMenuAppData *data) {
    if (data->currentScreenY == data->effectiveScreenY) {
        return;
    }

#define ABS(x) (((x) ^ ((x) >> 31)) - ((x) >> 31))

    fx32 scrollStep = (data->effectiveScreenY - data->currentScreenY) / 4;
    if (ABS(scrollStep) > FX32_CONST(12)) {
        if (scrollStep > 0) {
            scrollStep = FX32_CONST(12);
        } else {
            scrollStep = FX32_CONST(-12);
        }
    }
    data->currentScreenY += scrollStep;

    if (ABS(data->effectiveScreenY - data->currentScreenY) < FX32_CONST(0.125f)) {
        data->currentScreenY = data->effectiveScreenY;
    }

    ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_0, BG_POS_OP_SET_Y, data->currentScreenY / FX32_ONE);
    ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_MAIN_2, BG_POS_OP_SET_Y, data->currentScreenY / FX32_ONE);
}

static void MainMenu_SetupGraphics(MainMenuAppData *data) {
    static const GraphicsBanks sMainMenuGraphicsBanks = {
        .bg = GX_VRAM_BG_128_A,
        .subbg = GX_VRAM_SUB_BG_128_C,
        .obj = GX_VRAM_OBJ_64_E,
        .subobj = GX_VRAM_SUB_OBJ_16_I,
        .tex = GX_VRAM_TEX_0_B,
        .texpltt = GX_VRAM_TEXPLTT_01_FG,
    };
    GraphicsBanks banks = sMainMenuGraphicsBanks;
    static const GraphicsModes sMainMenuGraphicsModes = {
        .dispMode = GX_DISPMODE_GRAPHICS,
        .bgMode = GX_BGMODE_0,
        .subMode = GX_BGMODE_0,
        ._2d3dMode = GX_BG0_AS_2D,
    };
    GraphicsModes modes = sMainMenuGraphicsModes;
    GfGfx_SetBanks(&banks);
    SetBothScreensModesAndDisable(&modes);

    GX_SetDispSelect(GX_DISP_SELECT_SUB_MAIN);

    ov74_02235308(data->bgConfig, GF_BG_LYR_MAIN_0, GF_BG_SCR_SIZE_256x512, 0xF000, 0x0);
    G2_SetBG0Priority(2);
    BG_ClearCharDataRange(GF_BG_LYR_MAIN_0, 32, 0, HEAP_ID_MAIN_MENU);
    BgClearTilemapBufferAndCommit(data->bgConfig, GF_BG_LYR_MAIN_0);

    ov74_02235308(data->bgConfig, GF_BG_LYR_MAIN_1, GF_BG_SCR_SIZE_256x256, 0xD800, 0x8000);
    G2_SetBG1Priority(1);
    BG_ClearCharDataRange(GF_BG_LYR_MAIN_1, 32, 0, HEAP_ID_MAIN_MENU);
    BgClearTilemapBufferAndCommit(data->bgConfig, GF_BG_LYR_MAIN_1);

    ov74_02235308(data->bgConfig, GF_BG_LYR_MAIN_2, GF_BG_SCR_SIZE_256x512, 0xE000, 0x0);
    G2_SetBG2Priority(0);
    BG_ClearCharDataRange(GF_BG_LYR_MAIN_2, 32, 0, HEAP_ID_MAIN_MENU);
    BgClearTilemapBufferAndCommit(data->bgConfig, GF_BG_LYR_MAIN_2);

    ResetAllTextPrinters();

    LoadFontPal0(GF_PAL_LOCATION_MAIN_BG, GF_PAL_SLOT_1_OFFSET, HEAP_ID_MAIN_MENU);
    LoadFontPal0(GF_PAL_LOCATION_MAIN_BG, GF_PAL_SLOT_0_OFFSET, HEAP_ID_MAIN_MENU);

    ((vu16 *)HW_PLTT)[0] = RGB_BLACK;
    ((vu16 *)HW_PLTT)[31] = RGB(26, 26, 26);

    LoadUserFrameGfx1(data->bgConfig, GF_BG_LYR_MAIN_0, 0x3F7, 2, 0, HEAP_ID_MAIN_MENU);
    LoadUserFrameGfx1(data->bgConfig, GF_BG_LYR_MAIN_0, 0x3EE, 3, 1, HEAP_ID_MAIN_MENU);

    ((vu16 *)HW_PLTT)[33] = RGB(26, 26, 26);
}

static void MainMenu_SetupSprites(MainMenuAppData *data) {
    ov74_0223563C();
    ov74_02235690();
    // FIXME: Unpack a/1/1/3 and use NAIX constants here.
    ov74_02235728(NARC_a_1_1_3, 47, 44, 46, 45, 0);

    data->upArrowSprite = ov74_02235930(0, data->upArrowSprite, 236, 20, 0);
    Sprite_SetDrawFlag(data->upArrowSprite, TRUE);
    Sprite_SetAnimActiveFlag(data->upArrowSprite, FALSE);

    data->downArrowSprite = ov74_02235930(0, data->downArrowSprite, 236, 172, 1);
    Sprite_SetDrawFlag(data->downArrowSprite, TRUE);
    Sprite_SetAnimActiveFlag(data->downArrowSprite, FALSE);
}

static void MainMenu_SetupWifiTiles(MainMenuAppData *data) {
    // FIXME: Unpack a/1/1/3 and use NAIX constants here.
    GfGfxLoader_GXLoadPal(NARC_a_1_1_3, 49, GF_PAL_LOCATION_MAIN_BG, GF_PAL_SLOT_4_OFFSET, 32, HEAP_ID_MAIN_MENU);
    GfGfxLoader_LoadCharData(NARC_a_1_1_3, 48, data->bgConfig, GF_BG_LYR_MAIN_2, 0x3E6, 0x100, FALSE, HEAP_ID_MAIN_MENU);
}

static void DrawWirelessIcon(MainMenuAppData *data, u32 x, u32 y, u32 type) {
    u16 *buffer = GetBgTilemapBuffer(data->bgConfig, GF_BG_LYR_MAIN_2);

    // Bits 15-12: palette, 11-0: tile number
    u32 tileId = (4 << 12) | 0x3E6;
    if (type == 2) {
        tileId += 4;
    }

    u32 offset = (y + 0) * 32 + x;
    buffer[offset++] = tileId + 0;
    buffer[offset++] = tileId + 1;
    offset = (y + 1) * 32 + x;
    buffer[offset++] = tileId + 2;
    buffer[offset++] = tileId + 3;

    BgCommitTilemapBufferToVram(data->bgConfig, GF_BG_LYR_MAIN_2);
}

static void ClearWirelessIcon(MainMenuAppData *data, u32 x, u32 y) {
    u16 *buffer = GetBgTilemapBuffer(data->bgConfig, GF_BG_LYR_MAIN_2);

    u32 offset = (y + 0) * 32 + x;
    buffer[offset++] = 0;
    buffer[offset++] = 0;
    offset = (y + 1) * 32 + x;
    buffer[offset++] = 0;
    buffer[offset++] = 0;

    BgCommitTilemapBufferToVram(data->bgConfig, GF_BG_LYR_MAIN_2);
}

static void PrintPlayerInfoField(Window *window, MsgData *msgData, MessageFormat *msgFmt, u32 color, u32 msgId, u32 y) {
    String *string = ReadMsgData_ExpandPlaceholders(msgFmt, msgData, msgId, HEAP_ID_MAIN_MENU);
    int stringPixelWidth = FontID_String_GetWidth(0, string, GetFontAttribute(0, 2));
    u32 x = GetWindowWidth(window) * 8 - (stringPixelWidth + 32);
    AddTextPrinterParameterizedWithColor(window, 0, string, x, y, TEXT_SPEED_NOTRANSFER, color, NULL);
    String_Delete(string);
}

static void ov74_02227E64(MessageFormat *messageFormat, int number) {
    u32 digits;
    PrintingMode printingMode;

    if (number >= 100) {
        digits = 3;
        printingMode = PRINTING_MODE_LEFT_ALIGN;
    } else if (number >= 10) {
        digits = 3;
        printingMode = PRINTING_MODE_RIGHT_ALIGN;
    } else {
        digits = 2;
        printingMode = PRINTING_MODE_RIGHT_ALIGN;
    }

    BufferIntegerAsString(messageFormat, 0, number, digits, printingMode, 1);
}

static BOOL MainMenu_PrintContinueButton(MainMenuAppData *data, u32 a1, UnkStruct_ov74_02235414 *a2, u32 a3) {
    MessageFormat *messageFormat;
    MsgData *msgData;

    msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0442_bin, HEAP_ID_MAIN_MENU);
    messageFormat = MessageFormat_New(HEAP_ID_MAIN_MENU);
    u32 textColor = (PlayerProfile_GetTrainerGender(data->profile) == PLAYER_GENDER_FEMALE) ? MAKE_TEXT_COLOR(3, 4, 15) : MAKE_TEXT_COLOR(7, 8, 15);

    ov74_02235568(data->bgConfig, a2, 3, a3, sMainMenuButtons[a1].msgId);

    static u32 sContinueButtonMsgs[] = {
        msg_0442_00000, // "CONTINUE"
        msg_0442_00013, // "PLAYER"
        msg_0442_00014, // "TIME"
        msg_0442_00016, // "BADGES"
        msg_0442_00015, // "POKéDEX"
    };
    for (u32 i = 1; i < NELEMS(sContinueButtonMsgs); i++) {
        if (i == 4 && !data->hasPokedex) {
            continue;
        }

        String *string = ReadMsgData_ExpandPlaceholders(messageFormat, msgData, sContinueButtonMsgs[i], HEAP_ID_MAIN_MENU);
        AddTextPrinterParameterizedWithColor(a2->window, 0, string, 32, i * 16, TEXT_SPEED_NOTRANSFER, textColor, NULL);
        String_Delete(string);
    }

    BufferPlayersName(messageFormat, 0, data->profile);
    PrintPlayerInfoField(a2->window, msgData, messageFormat, textColor, msg_0442_00017, 16);

    ov74_02227E64(messageFormat, GetIGTHours(data->igt));
    BufferIntegerAsString(messageFormat, 1, GetIGTMinutes(data->igt), 2, PRINTING_MODE_LEADING_ZEROS, 1);
    PrintPlayerInfoField(a2->window, msgData, messageFormat, textColor, msg_0442_00018, 32);

    BufferIntegerAsString(messageFormat, 0, data->badges, 2, PRINTING_MODE_LEFT_ALIGN, 1);
    PrintPlayerInfoField(a2->window, msgData, messageFormat, textColor, msg_0442_00020, 48);

    if (data->hasPokedex) {
        ov74_02227E64(messageFormat, Pokedex_CountDexOwned(data->pokedex));
        PrintPlayerInfoField(a2->window, msgData, messageFormat, textColor, msg_0442_00019, 64);
    }

    DrawFrameAndWindow1(a2->window, FALSE, a2->baseTile, a2->paletteNum2);

    data->unkEC[a1] = sMainMenuButtons[a1].id;
    MessageFormat_Delete(messageFormat);
    DestroyMsgData(msgData);

    return TRUE;
}

static BOOL MainMenu_PrintMigrateFromAgbButton(MainMenuAppData *data, u32 a1, UnkStruct_ov74_02235414 *a2, u32 a3) {
    if (data->connectedAgbGame == 0) {
        return FALSE;
    }

    u32 msgId;
    switch (data->connectedAgbGame - 1) {
    case 0:
        msgId = msg_0442_00004; // "MIGRATE FROM RUBY"
        break;
    case 1:
        msgId = msg_0442_00005; // "MIGRATE FROM SAPPHIRE"
        break;
    case 2:
        msgId = msg_0442_00006; // "MIGRATE FROM LEAFGREEN"
        break;
    case 3:
        msgId = msg_0442_00007; // "MIGRATE FROM FIRERED"
        break;
    case 4:
        msgId = msg_0442_00008; // "MIGRATE FROM EMERALD"
        break;
    }

    ov74_02235568(data->bgConfig, a2, 3, a3, msgId);
    ClearWirelessIcon(data, 23, a3);
    data->unkEC[a1] = sMainMenuButtons[a1].id;

    return TRUE;
}

static BOOL MainMenu_PrintMysteryGiftButton(MainMenuAppData *data, u32 a1, UnkStruct_ov74_02235414 *a2, u32 y) {
    if (!data->drawMysteryGiftButton) {
        if (SaveMysteryGift_TestFlagx7FF(data->mysteryGift) == TRUE) {
            data->drawMysteryGiftButton = TRUE;
        }

        if (Save_SysInfo_GetMysteryGiftActive(Save_SysInfo_Get(data->saveData)) == TRUE) {
            data->drawMysteryGiftButton = TRUE;
        }

        ov74_0223512C(HEAP_ID_MAIN_MENU);

        if (ov74_02235230() != 0) {
            data->drawMysteryGiftButton = TRUE;
            ov74_02236034(TRUE);
        }
    }

    if (data->drawMysteryGiftButton == TRUE && !data->hasPokedex) {
        data->drawMysteryGiftButton = FALSE;
    }

    if (data->drawMysteryGiftButton == TRUE) {
        ov74_02235568(data->bgConfig, a2, 3, y, sMainMenuButtons[a1].msgId);
        ClearWirelessIcon(data, 23, y);
        data->unkEC[a1] = sMainMenuButtons[a1].id;
        data->unk38 |= (1 << 0);
        SaveMysteryGift_SetFlagx7FF(data->mysteryGift);

        return TRUE;
    }

    return FALSE;
}

static BOOL MainMenu_PrintConnectToRangerButton(MainMenuAppData *data, u32 a1, UnkStruct_ov74_02235414 *a2, u32 a3) {
    if (data->drawConnectToRangerButton == TRUE && data->hasPokedex == TRUE) {
        ov74_02235568(data->bgConfig, a2, 3, a3, sMainMenuButtons[a1].msgId);
        DrawWirelessIcon(data, 23, a3, 1);
        data->unk110[a1] = 1;
        data->unkEC[a1] = sMainMenuButtons[a1].id;
        data->unk38 |= (1 << 1);

        return TRUE;
    }

    return FALSE;
}

static BOOL MainMenu_PrintConnectToWiiButton(MainMenuAppData *data, u32 a1, UnkStruct_ov74_02235414 *a2, u32 a3) {
    if (data->drawConnectToWiiButton == TRUE) {
        ov74_02235568(data->bgConfig, a2, 3, a3, sMainMenuButtons[a1].msgId);
        data->unk110[a1] = 1;
        DrawWirelessIcon(data, 23, a3, 1);
        data->unkEC[a1] = sMainMenuButtons[a1].id;

        return TRUE;
    }

    return FALSE;
}

static BOOL MainMenu_PrintNintendoWFCSetupButton(MainMenuAppData *data, u32 a1, UnkStruct_ov74_02235414 *a2, u32 a3) {
    ov74_02235568(data->bgConfig, a2, 3, a3, sMainMenuButtons[a1].msgId);
    data->unk110[a1] = 2;
    DrawWirelessIcon(data, 23, a3, 2);
    data->unkEC[a1] = sMainMenuButtons[a1].id;

    return TRUE;
}

static BOOL MainMenu_PrintConnectToPokewalkerButton(MainMenuAppData *data, u32 a1, UnkStruct_ov74_02235414 *a2, u32 a3) {
    ov74_02235568(data->bgConfig, a2, 3, a3, sMainMenuButtons[a1].msgId);
    ClearWirelessIcon(data, 23, a3);
    data->unkEC[a1] = sMainMenuButtons[a1].id;

    return TRUE;
}

static BOOL MainMenu_PrintWiiMessageSettingsButton(MainMenuAppData *data, u32 a1, UnkStruct_ov74_02235414 *a2, u32 a3) {
    ov74_02235568(data->bgConfig, a2, 3, a3, sMainMenuButtons[a1].msgId);
    ClearWirelessIcon(data, 23, a3);
    data->unkEC[a1] = sMainMenuButtons[a1].id;

    return TRUE;
}

static BOOL ov74_022282CC(MainMenuAppData *data) {
    u32 y;
    u32 i;

    BOOL ret = FALSE;

    data->unk1B0 = 0;
    data->unk20 = 1;

    for (i = 0, y = 1; i < APPOPTION_COUNT; i++) {
        const MainMenuButton *button = &sMainMenuButtons[i];
        UnkStruct_ov74_02235414 unk;
        ov74_02235414(&unk, &data->unk5C[i], 1, NARC_msg_msg_0442_bin, 0x3F7, 2);
        ov74_02235464(&unk, 23, button->height, data->unk20);
        if (button->printFunction != NULL) {
            if (data->unkEC[i] != 0) {
                SetWindowX(unk.window, 3);
                SetWindowY(unk.window, y);
                DrawFrameAndWindow1(unk.window, FALSE, unk.baseTile, unk.paletteNum2);

                if (data->unk110[i] != 0) {
                    DrawWirelessIcon(data, 23, y, data->unk110[i]);
                } else {
                    ClearWirelessIcon(data, 23, y);
                }
                y += button->height + 2;
                ret = TRUE;
            } else {
                if (button->printFunction(data, i, &unk, y) == TRUE) {
                    y += button->height + 2;
                    ret = TRUE;
                }
            }
        } else {
            ov74_02235568(data->bgConfig, &unk, 3, y, button->msgId);
            data->unkEC[i] = button->id;
            y += button->height + 2;
        }

        data->unk20 += button->height * 23;
        if (data->unkEC[i] != 0) {
            data->unk1B0++;
        }
    }

    MainMenu_UpdateArrowSprites(data);
    ov74_0222841C(data, data->currentOption);

    return ret;
}

static void ov74_0222841C(MainMenuAppData *data, int currentOption) {
    for (int i = 0; i < NELEMS(data->unk5C); i++) {
        Window *window = &data->unk5C[i];
        if (!WindowIsInUse(window)) {
            continue;
        }

        if (i == 0 && data->effectiveScreenY == FX32_CONST(GX_LCD_SIZE_Y * 2)) {
            continue;
        }

        if (i < currentOption - 5 || i > currentOption + 5) {
            continue;
        }

        if (data->menuInputState.state == MENU_INPUT_STATE_TOUCH) {
            DrawFrameAndWindow1(window, TRUE, 0x3EE, 2);
            BgTilemapRectChangePalette(data->bgConfig, GF_BG_LYR_MAIN_0, GetWindowX(window), GetWindowY(window), GetWindowWidth(window), GetWindowHeight(window), 0);
        } else if (i == currentOption) {
            DrawFrameAndWindow1(window, TRUE, 0x3EE, 3);
            BgTilemapRectChangePalette(data->bgConfig, GF_BG_LYR_MAIN_0, GetWindowX(window), GetWindowY(window), GetWindowWidth(window), GetWindowHeight(window), 0);
        } else {
            DrawFrameAndWindow1(window, TRUE, 0x3F7, 2);
            BgTilemapRectChangePalette(data->bgConfig, GF_BG_LYR_MAIN_0, GetWindowX(window), GetWindowY(window), GetWindowWidth(window), GetWindowHeight(window), 1);
        }
    }

    BgCommitTilemapBufferToVram(data->bgConfig, GF_BG_LYR_MAIN_0);
}

static void ov74_02228548(MainMenuAppData *data, int a1) {
    for (int i = 0; i < (int)NELEMS(data->unk164); i++) {
        Window *window = &data->unk164[i];
        if (!WindowIsInUse(window)) {
            continue;
        }

        if (a1 < 0) {
            DrawFrameAndWindow1(window, TRUE, 0x3F7, 2);
            BgTilemapRectChangePalette(data->bgConfig, GF_BG_LYR_MAIN_1, GetWindowX(window), GetWindowY(window), GetWindowWidth(window), GetWindowHeight(window), 1);
        } else if (data->menuInputState.state == MENU_INPUT_STATE_TOUCH) {
            DrawFrameAndWindow1(window, TRUE, 0x3EE, 2);
            BgTilemapRectChangePalette(data->bgConfig, GF_BG_LYR_MAIN_1, GetWindowX(window), GetWindowY(window), GetWindowWidth(window), GetWindowHeight(window), 0);
        } else if (i == a1) {
            DrawFrameAndWindow1(window, TRUE, 0x3EE, 3);
            BgTilemapRectChangePalette(data->bgConfig, GF_BG_LYR_MAIN_1, GetWindowX(window), GetWindowY(window), GetWindowWidth(window), GetWindowHeight(window), 0);
        } else {
            DrawFrameAndWindow1(window, TRUE, 0x3F7, 2);
            BgTilemapRectChangePalette(data->bgConfig, GF_BG_LYR_MAIN_1, GetWindowX(window), GetWindowY(window), GetWindowWidth(window), GetWindowHeight(window), 1);
        }
    }
    BgCommitTilemapBufferToVram(data->bgConfig, GF_BG_LYR_MAIN_1);
}

static BOOL ChangeCurrentAppOption(MainMenuAppData *data, int offset) {
    int option = data->currentOption;
    int oldOption = data->currentOption;

    while (TRUE) {
        option += offset;

        if (option == -1) {
            option = 0;
        }

        if (option == NELEMS(sMainMenuButtons)) {
            option = NELEMS(sMainMenuButtons) - 1;
        }

        if (option == data->currentOption) {
            break;
        }

        if (data->unkEC[option] != 0) {
            PlaySE(SEQ_SE_DP_SELECT);
            break;
        }
    }
    data->currentOption = option;

    if (data->currentOption != oldOption) {
        ov74_0222841C(data, data->currentOption);
        data->unk1B4 = 6;
        return TRUE;
    }

    return FALSE;
}

static void ov74_022286F8(MainMenuAppData *data, int a1) {
    Window *window = &data->unk5C[a1];

    int optionY = (GetWindowY(window) - 1) * 8;
    int optionHeight = GetWindowHeight(window); // unused
    int screenY = data->effectiveScreenY / FX32_ONE;

    if (screenY <= optionY && screenY + GX_LCD_SIZE_Y > optionY) {
        return;
    }

    data->effectiveScreenY = optionY * FX32_ONE;

    MainMenu_UpdateArrowSprites(data);
    if (data->effectiveScreenY == FX32_CONST(GX_LCD_SIZE_Y * 2)) {
        FillBgTilemapRect(data->bgConfig, GF_BG_LYR_MAIN_0, 0x0, 0, 0, 32, 12, 0);
        FillBgTilemapRect(data->bgConfig, GF_BG_LYR_MAIN_2, 0x0, 0, 0, 32, 12, 0);
        ScheduleBgTilemapBufferTransfer(data->bgConfig, GF_BG_LYR_MAIN_0);
        ScheduleBgTilemapBufferTransfer(data->bgConfig, GF_BG_LYR_MAIN_2);
    } else if (data->effectiveScreenY == 0) {
        ov74_022282CC(data);
    }
}

static void MainMenu_UpdateArrowSprites(MainMenuAppData *data) {
    BOOL upArrowEnabled;
    BOOL downArrowEnabled;

    downArrowEnabled = FALSE;
    upArrowEnabled = FALSE;
    int screenY = data->effectiveScreenY / FX32_ONE;

    for (int i = 0; i < NELEMS(data->unk5C); i++) {
        Window *window = &data->unk5C[i];
        if (!WindowIsInUse(window)) {
            continue;
        }

        int optionY = (GetWindowY(window) - 1) * 8;
        int optionHeight = GetWindowHeight(window); // unused

        if (screenY > optionY) {
            upArrowEnabled = TRUE;
        }

        if (screenY + GX_LCD_SIZE_Y <= optionY) {
            downArrowEnabled = TRUE;
        }
    }

    Sprite_SetAnimCtrlSeq(data->upArrowSprite, upArrowEnabled * 2);
    Sprite_SetAnimActiveFlag(data->upArrowSprite, FALSE);
    Sprite_SetAnimCtrlSeq(data->downArrowSprite, downArrowEnabled * 2 + 1);
    Sprite_SetAnimActiveFlag(data->downArrowSprite, FALSE);
}

static void MainMenu_FreeGraphics(OverlayManager *manager) {
    MainMenuAppData *data = OverlayManager_GetData(manager);

    if (data->upArrowSprite != NULL || data->downArrowSprite != NULL) {
        Sprite_Delete(data->upArrowSprite);
        Sprite_Delete(data->downArrowSprite);
        ov74_022359BC();
    }

    for (u32 i = 0; i < NELEMS(data->unk5C); i++) {
        if (data->unk5C[i].bgConfig != NULL) {
            ClearWindowTilemapAndCopyToVram(&data->unk5C[i]);
            RemoveWindow(&data->unk5C[i]);
        }
    }

    FreeBgTilemapBuffer(data->bgConfig, GF_BG_LYR_MAIN_0);
    FreeBgTilemapBuffer(data->bgConfig, GF_BG_LYR_MAIN_1);
    FreeBgTilemapBuffer(data->bgConfig, GF_BG_LYR_MAIN_2);

    GX_SetDispSelect(GX_DISP_SELECT_MAIN_SUB);

    Heap_Free(data->bgConfig);
    Main_SetVBlankIntrCB(NULL, NULL);
}

static void AdvanceButtonBorderAnimation(MainMenuAppData *data) {
    static u16 sButtonBorderAnimation[] = {
        RGB(1, 28, 20),
        RGB(3, 28, 20),
        RGB(5, 28, 20),
        RGB(7, 28, 20),
        RGB(9, 28, 20),
        RGB(11, 28, 20),
        RGB(13, 28, 20),
        RGB(15, 28, 20),
        RGB(17, 28, 20),
        RGB(19, 28, 20),
        RGB(21, 28, 20),
        RGB(23, 28, 20),
        RGB(25, 28, 20),
        RGB(27, 28, 20),
        RGB(29, 28, 20),
        RGB(31, 28, 20),
        RGB(29, 28, 20),
        RGB(27, 28, 20),
        RGB(25, 28, 20),
        RGB(23, 28, 20),
        RGB(21, 28, 20),
        RGB(19, 28, 20),
        RGB(17, 28, 20),
        RGB(15, 28, 20),
        RGB(13, 28, 20),
        RGB(11, 28, 20),
        RGB(9, 28, 20),
        RGB(7, 28, 20),
        RGB(5, 28, 20),
        RGB(3, 28, 20),
        0,
    };

    if (sButtonBorderAnimation[data->buttonBorderAnimFrame] == 0) {
        data->buttonBorderAnimFrame = 0;
    }
    ((vu16 *)HW_PLTT)[54] = sButtonBorderAnimation[data->buttonBorderAnimFrame++];
}

static void MainMenu_OnVBlank(BgConfig *bgConfig) {
    GF_RunVramTransferTasks();
    OamManager_ApplyAndResetBuffers();
    DoScheduledBgGpuUpdates(bgConfig);
    OS_SetIrqCheckFlag(OS_IE_VBLANK);
}

BOOL MainMenuApp_Init(OverlayManager *manager, int *state) {
    Heap_Create(HEAP_ID_3, HEAP_ID_MAIN_MENU, 0x40000);

    MainMenuAppData *data = OverlayManager_CreateAndGetData(manager, sizeof(MainMenuAppData), HEAP_ID_MAIN_MENU);
    memset(data, 0, sizeof(MainMenuAppData));

    data->bgConfig = BgConfig_Alloc(HEAP_ID_MAIN_MENU);

    sub_0200FBF4(PM_LCD_TOP, 0);
    sub_0200FBF4(PM_LCD_BOTTOM, 0);

    UnkStruct_02111868_sub *args = OverlayManager_GetArgs(manager);
    data->saveData = args->saveData;

    data->mysteryGift = Save_MysteryGift_Get(data->saveData);
    data->currentScreenY = 0;
    data->effectiveScreenY = 0;
    data->profile = Save_PlayerData_GetProfile(data->saveData);
    data->pokedex = Save_Pokedex_Get(data->saveData);
    data->igt = Save_PlayerData_GetIGTAddr(data->saveData);
    data->hasPokedex = Pokedex_IsEnabled(data->pokedex);
    data->badges = PlayerProfile_CountBadges(data->profile);
    data->unk144 = 15;

    ov74_022352A0(HEAP_ID_MAIN_MENU);
    if (!Save_FileExists(data->saveData)) {
        data->dontHaveSavedata = TRUE;
    }
    sub_02005AF8(0);
    sub_02004AD8(0);

    return TRUE;
}

#define MAIN_MENU_BACKGROUND_COLOR RGB(12, 12, 31)

BOOL MainMenuApp_Main(OverlayManager *manager, int *state) {
    MainMenuAppData *data = OverlayManager_GetData(manager);
    data->frames++;
    BOOL cartInserted = CTRDG_IsExisting(); // unused

    if (ov74_0222779C(data) == TRUE) {
        ov74_022276AC(data);
        HandleScreenScroll(data);
        return FALSE;
    }

    AdvanceButtonBorderAnimation(data);

    if (data->unk1B4 != 0) {
        data->unk1B4--;
    }

    switch (*state) {
    case 0:
        MainMenu_SetupGraphics(data);
        *state = 1;
        break;
    case 1:
        if (ov74_02227580(data) == 0) { // always 0
            *state = 3;
        } else {
            ov74_0223539C(1, 2, state, 8);
            ((vu16 *)HW_PLTT)[0] = MAIN_MENU_BACKGROUND_COLOR;
        }
        break;
    case 2:
        if (!ov74_02227584(data)) {
            ov74_0223539C(0, 3, state, 8);
        }
        break;
    case 3:
        data->unk13C = 12;
        if (data->dontHaveSavedata == TRUE) {
            data->selectedApp = APPOPTION_NEW_GAME;
            ov74_0223539C(0, 7, state, 8);
        } else {
            DetectInsertedGBACart(data);
            *state = 4;
        }
        break;
    case 4:
        MainMenu_SetupSprites(data);
        MainMenu_SetupWifiTiles(data);
        Main_SetVBlankIntrCB((GFIntrCB)MainMenu_OnVBlank, data->bgConfig);
        ov74_022282CC(data);
        ov74_0222841C(data, data->currentOption);
        ov74_0223539C(1, 5, state, 8);
        ((vu16 *)HW_PLTT)[0] = MAIN_MENU_BACKGROUND_COLOR;
        data->unk13C = 10;
        break;
    case 5:
        MainMenu_HandleInput(data, state);
        if (data->unk48 == TRUE) {
            ov74_022282CC(data);
            data->unk48 = FALSE;
        } else if (*state == 5 && data->unk188 == TRUE) {
            data->unk188 = FALSE;
            data->unk148 = 1;
        }
        break;
    case 6:
        if (data->unk144 == 15) {
            if (data->unk150 & PAD_BUTTON_B) {
                *state = 5;
            } else {
                ov74_0223539C(0, 7, state, 8);
            }
        }
        break;
    case 7:
        MainMenu_FreeGraphics(manager);
        return TRUE;
    case 8: // Wait for palette fade
        ov74_022353FC(state);
        break;
    case 9: // Unused exit state
        return TRUE;
    }

    ov74_022276AC(data);
    HandleScreenScroll(data);
    ov74_022358BC();
    return FALSE;
}

static void MainMenu_QueueSelectedApp(MainMenuAppData *data) {
    FS_EXTERN_OVERLAY(OVY_75);
    FS_EXTERN_OVERLAY(OVY_112);

    switch (data->selectedApp) {
    case APPOPTION_CONTINUE:
        RegisterMainOverlay(FS_OVERLAY_ID(OVY_36), &ov36_App_MainMenu_SelectOption_Continue);
        break;
    case APPOPTION_NEW_GAME:
        RegisterMainOverlay(FS_OVERLAY_ID(OVY_36), &ov36_App_MainMenu_SelectOption_NewGame);
        break;
    case APPOPTION_MYSTERY_GIFT:
        RegisterMainOverlay(FS_OVERLAY_ID(OVY_74), &gApp_MainMenu_SelectOption_MysteryGift);
        break;
    case APPOPTION_MIGRATE_AGB:
        RegisterMainOverlay(FS_OVERLAY_ID(OVY_74), &gApp_MainMenu_SelectOption_MigrateFromAgb);
        break;
    case APPOPTION_RANGER:
        RegisterMainOverlay(FS_OVERLAY_ID(OVY_74), &gApp_MainMenu_SelectOption_ConnectToRanger);
        break;
    case APPOPTION_CONNECT_TO_WII:
        sub_02027098("data/eoo.dat");
        break;
    case APPOPTION_WFC:
        Sound_Stop();
        RegisterMainOverlay(FS_OVERLAY_ID_NONE, &gApp_MainMenu_SelectOption_NintendoWFCSetup);
        break;
    case APPOPTION_POKEWALKER:
        Sound_Stop();
        RegisterMainOverlay(FS_OVERLAY_ID(OVY_112), &ov112_App_MainMenu_SelectOption_ConnectToPokewalker);
        break;
    case APPOPTION_WII_SETTINGS:
        Sound_Stop();
        RegisterMainOverlay(FS_OVERLAY_ID(OVY_75), &ov75_App_MainMenu_SelectOption_WiiMessageSettings);
        break;
    case APPOPTION_TITLE_SCREEN:
        RegisterMainOverlay(FS_OVERLAY_ID(intro_title), &gApplication_TitleScreen);
        break;
    }
}

BOOL MainMenuApp_Exit(OverlayManager *manager, int *state) {
    MainMenuAppData *data = OverlayManager_GetData(manager);

    MainMenu_QueueSelectedApp(data);

    OverlayManager_FreeData(manager);
    Heap_Destroy(HEAP_ID_MAIN_MENU);

    ov74_02236034(FALSE);

    return TRUE;
}
