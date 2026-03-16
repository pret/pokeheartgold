#include "battle/battle_input.h"

#include "global.h"

#include "constants/battle_menu.h"

#include "battle/battle_controller_opponent.h"
#include "msgdata/msg/msg_0197.h"

#include "gf_gfx_loader.h"
#include "heap.h"
#include "math_util.h"
#include "obj_char_transfer.h"
#include "overlay_06.h"
#include "palette.h"
#include "pokemon_icon_idx.h"
#include "render_text.h"
#include "render_window.h"
#include "touchscreen.h"
#include "unk_02005D10.h"
#include "unk_02013534.h"
#include "unk_02077678.h"
#include "unk_0208805C.h"

static void BattleInput_FreeDefaultResources(BattleInput *battleInput);
static void BattleInput_FreeBallGaugeResources(BattleInput *battleInput);
static void Task_AnimateBallGauge(SysTask *task, void *data);
static void BattleInput_InitMenuWindow(BattleInput *battleInput);
static void Task_BattleMenuScrollHorizontal(SysTask *task, void *data);
static void BattleInput_InitMenuSlideIn(BattleInput *battleInput, int battlerId);
static void BattleInput_CreateMainMenuObjectsInitial(BattleInput *battleInput, int a1, int a2);
static void BattleInput_CreateMainMenuObjects(BattleInput *battleInput, int a1, int a2);
static void BattleInput_CreateMainMenuFightObjectInitial(BattleInput *battleInput, int param1, int param2);
static void BattleInput_CreateMainMenuFightObject(BattleInput *battleInput, int param1, int param2);
static void BattleInput_CreatePalParkMenuObjectsInitial(BattleInput *battleInput, int param1, int param2);
static void BattleInput_CreatePalParkMenuObjects(BattleInput *battleInput, int param1, int param2);
static void BattleInput_CreateFightMenuObjects(BattleInput *battleInput, int param1, int param2);
static void BattleInput_CreateYesNoMenuObjects(BattleInput *battleInput, int param1, int param2);
static void BattleInput_CreateKeepForgetMenuObjects(BattleInput *battleInput, int param1, int param2);
static void BattleInput_CreateGiveUpOnMoveMenuObjects(BattleInput *battleInput, int param1, int param2);
static void BattleInput_CreateVSRecorderPlaybackMenuObjects(BattleInput *battleInput, int param1, int param2);
static void BattleInput_CreateSwitchOrFleeMenuObjects(BattleInput *battleInput, int param1, int param2);
static void BattleInput_CreateSwitchOrKeepMenuObjects(BattleInput *battleInput, int param1, int param2);
static void BattleInput_CreateTargetMenuObjects(BattleInput *battleInput, int param1, int param2);
static int BattleInput_TouchCallback_MainMenu(BattleInput *battleInput, int param1, int param2);
static int BattleInput_TouchCallback_FightMenu(BattleInput *battleInput, int param1, int param2);
static int BattleInput_TouchCallback_TwoOptionMenu(BattleInput *battleInput, int param1, int param2);
static int BattleInput_TouchCallback_TargetMenu(BattleInput *battleInput, int param1, int param2);
static int BattleInput_TouchCallback_VSRecorderMenu(BattleInput *battleInput, int param1, int param2);
static void BattleInput_LoadPokemonIconResources(BattleInput *battleInput);
static void BattleInput_FreePokemonIconResources(BattleInput *battleInput);
static void BattleInput_DeletePokemonIconSprites(BattleInput *battleInput);
static ManagedSprite *BattleInput_SetPokemonIcon(BattleInput *battleInput, Pokemon *pokemon, int battlerType, int hp, int maxHp, int status);
static ManagedSprite *BattleInput_SetBugContestPokemonIcon(BattleInput *battleInput, Pokemon *pokemon);
static void Task_AnimatePokemonIconSprite(SysTask *task, void *data);
static int ov12_022684F8(u8 task);
static void String_GetFontLength(String *str, u32 fontId, int *lengthOut, int *charLengthOut);
static void BattleInput_CreateTextObject(BattleInput *battleInput, BattleInputTextObject *textObj, String *str, u32 fontId, int textColor, int palOffset, int palId, int x, int y, int centerText, BattleInputMoveMemory_DisplayObj *param10);
static void BattleInput_DeleteTextObjects(BattleInput *battleInput);
static void ov12_022686BC(BattleInput *battleInput);
static BattleInputMoveMemory *BattleInput_GetMoveMemory(BattleInput *battleInput, int battlerType);
static void BattleInput_FreeMoveMemory(BattleInput *battleInput);
static void BattleInput_SetMoveDisplayObjectTextFont(BattleInput *battleInput, String *str, u32 fontId, BattleInputMoveMemory_DisplayObj *display, int textColor);
static void BattleInput_CreateMoveTypeIcons(BattleInput *battleInput);
static void BattleInput_DeleteAndFreeTypeIconGraphics(BattleInput *battleInput);
static void BattleInput_DeleteAndFreeCategoryIconGraphics(BattleInput *battleInput);
static void ov12_02268C30(BattleInput *battleInput, int moveType, int movePos);
static void ov12_02268C4C(BattleInput *battleInput, int movePos);
static void ov12_02268CA0(BattleInput *battleInput, int param1);
static void ov12_02268D5C(void);
static void ov12_02268D88(BattleInput *battleInput, int param1, int param2);
static void BattleInput_FreePersistentResources(BattleInput *battleInput);
static void BattleInput_GetMonsHitArray(BattleInput *battleInput, u8 *monsHit, int checkMonExists);
static void ov12_02268E2C(BattleInput *battleInput, int param1, u8 *monsHit, int checkExists);
static void BattleInput_StartFeedbackTask(SysTaskFunc task, BattleInput *battleInput);
static void BattleInput_DestroyFeedbackTask(BattleInput *battleInput);
static void BattleInput_Deadstriped_02268EDC(BattleInput *battleInput, int touchInput);
static void BattleInput_Deadstriped_02268EE0(BattleInput *battleInput, int unused);
static void ov12_02268EE4(BattleInput *battleInput, const s16 *offsets, const TouchscreenHitbox *hitbox, int bufferIndex, int offsetIndex);
static void Task_ButtonFeedback(SysTask *task, void *data);
static void Task_FightMenuButtonFeedback(SysTask *task, void *data);
static void Task_TargetMenuButtonFeedback(SysTask *task, void *data);
static int GetPPTextColor(int pp, int maxPp);
static void Task_BattleMenuSlideIn(SysTask *task, void *data);
static void VBlankTask_BattleMenuSlideIn(SysTask *task, void *data);
static void HBlankCB_BattleMenuSlideIn(void *data);
static void ov12_02269830(SysTask *task, void *data);
static void ov12_0226989C(SysTask *task, void *data);
static void Task_FadeInBattleMenuBackground(SysTask *task, void *data);
static void Task_BattleMenuMessageWaitForTouchResponse(SysTask *task, void *data);
static int BattleInput_CheckCursorInput(BattleInput *battleInput);
static int BattleInput_CursorMove_MainMenu(BattleInput *battleInput, int shouldInitialize);
static void BattleInput_CursorSave_MainMenu(BattleInput *battleInput, int param1);
static int BattleInput_CursorMove_PalParkMenu(BattleInput *battleInput, int param1);
static int BattleInput_CursorMove_FightMenu(BattleInput *battleInput, int param1);
static void BattleInput_CursorSave_FightMenu(BattleInput *battleInput, int param1);
static int BattleInput_CursorMove_TargetMenu(BattleInput *battleInput, int param1);
static void BattleInput_CursorSave_TargetMenu(BattleInput *battleInput, int input);
static int BattleInput_CursorMove_TwoOptionsMenu(BattleInput *battleInput, int param1);
static u32 BattleCursor_CheckKeyInput(BattleMenuCursor *cursor, int xMax, int yMax, const u8 *moveData);
static int BattleInput_CatchingTutorialMain(BattleInput *battleInput);
static int BattleInput_CatchingTutorialCB_Fight(BattleInput *battleInput);
static int BattleInput_CatchingTutorialCB_Move(BattleInput *battleInput);
static int BattleInput_CatchingTutorialCB_Bag(BattleInput *battleInput);
static void BattleInput_CreateBugContestGraphics(BattleInput *battleInput);
static void BattleInput_DeleteBugContestGraphics(BattleInput *battleInput);
static BOOL BattleSystem_IsInFrontier(BattleSystem *battleSystem);

// Data

ALIGN(4)
static const u16 sBottomScreenBgTilemapId[7] = {
    43,
    36,
    41,
    37,
    38,
    42,
    39
};

ALIGN(4)
static const u16 sTypeIconPositions[][2] = {
    { 32,  61  },
    { 160, 60  },
    { 32,  124 },
    { 160, 123 }
};

ALIGN(4)
static const u16 sMovePPTextPositions[4][2] = {
    { 59, 61 },
    { 187, 60 },
    { 59, 124 },
    { 187, 123 }
};

ALIGN(4)
static const u16 sMovePPMaxTextPositions[4][2] = {
    { 76, 61 },
    { 204, 60 },
    { 76, 124 },
    { 204, 123 }
};

ALIGN(4)
static const u16 sTargetPokemonMenuPositions[][2] = {
    { 60, 116 },
    { 196, 32 },
    { 196, 116 },
    { 60, 32 },
    { 128, 175 }
};

ALIGN(4)
static const u16 sPokemonIconPositions[][2] = {
    { 60, 116 },
    { 196, 56 },
    { 196, 116 },
    { 60, 56 }
};

static const BgTemplate sBattleMenuBackgroundTemplates[] = {
    {
     .x = 0,
     .y = 0,
     .bufferSize = 0x800,
     .baseTile = 0,
     .size = 1,
     .colorMode = 0,
     .screenBase = 12,
     .charBase = 0,
     .priority = 0,
     .areaOver = 0,
     .dummy = 0,
     .mosaic = 0,
     },
    {
     .x = 0,
     .y = 0,
     .bufferSize = 0x800,
     .baseTile = 0,
     .size = 1,
     .colorMode = 0,
     .screenBase = 13,
     .charBase = 0,
     .priority = 0,
     .areaOver = 0,
     .dummy = 0,
     .mosaic = 0,
     },
    {
     .x = 0,
     .y = 0,
     .bufferSize = 0x800,
     .baseTile = 0,
     .size = 1,
     .colorMode = 0,
     .screenBase = 14,
     .charBase = 0,
     .priority = 0,
     .areaOver = 0,
     .dummy = 0,
     .mosaic = 0,
     },
    {
     .x = 0,
     .y = 0,
     .bufferSize = 0x800,
     .baseTile = 0,
     .size = 1,
     .colorMode = 0,
     .screenBase = 15,
     .charBase = 0,
     .priority = 0,
     .areaOver = 0,
     .dummy = 0,
     .mosaic = 0,
     },
};

static const TouchscreenHitbox sTouchscreenRectMainMenuButtons[] = {
    {
     .rect = {
            .top = 24,
            .bottom = 144,
            .left = 0,
            .right = 255,
        },
     },
    {
     .rect = {
            .top = 144,
            .bottom = 192,
            .left = 0,
            .right = 80,
        },
     },
    {
     .rect = {
            .top = 144,
            .bottom = 192,
            .left = 176,
            .right = 255,
        },
     },
    {
     .rect = {
            .top = 152,
            .bottom = 192,
            .left = 88,
            .right = 168,
        },
     },
    {
     .rect = {
            .top = TOUCHSCREEN_RECTLIST_END,
            .bottom = 0,
            .left = 0,
            .right = 0,
        },
     },
};

static const int sTouchArrayMainMenu[] = {
    BATTLE_INPUT_FIGHT,
    BATTLE_INPUT_BAG,
    BATTLE_INPUT_POKEMON,
    BATTLE_INPUT_RUN
};

ALIGN(4)
static const u8 ov12_0226EB04[] = {
    1,
    2,
    3,
    4
};

ALIGN(4)
static const u8 sCursorArrayMainMenu[2][3] = {
    { CURSOR_INPUT_FIGHT, CURSOR_INPUT_FIGHT, CURSOR_INPUT_FIGHT   },
    { CURSOR_INPUT_BAG,   CURSOR_INPUT_RUN,   CURSOR_INPUT_POKEMON }
};

static const TouchscreenHitbox ov12_0226E240[] = {
    {
     .rect = {
            .top = 24,
            .bottom = 144,
            .left = 0,
            .right = 255 },
     },
    {
     .rect = { .top = TOUCHSCREEN_RECTLIST_END, .bottom = 0, .left = 0, .right = 0 },
     },
};

static const TouchscreenHitbox sTouchscreenRectPalParkButtons[] = {
    {
     .rect = {
            .top = 40,
            .bottom = 128,
            .left = 24,
            .right = 232,
        },
     },
    {
     .rect = {
            .top = 152,
            .bottom = 192,
            .left = 88,
            .right = 168,
        },
     },
    {
     .rect = {
            .top = TOUCHSCREEN_RECTLIST_END,
            .bottom = 0,
            .left = 0,
            .right = 0,
        },
     },
};

static const int sTouchArrayPalPark[] = {
    BATTLE_INPUT_BALL,
    BATTLE_INPUT_RUN,
    0,
    0
};

ALIGN(4)
static const u8 ov12_0226EB00[] = {
    1,
    4
};

ALIGN(4)
static const u8 sCursorArrayPalParkMenu[2][1] = {
    { CURSOR_INPUT_PAL_PARK_BALL },
    { CURSOR_INPUT_PAL_PARK_RUN }
};

static const TouchscreenHitbox sTouchscreenRectFightMenuButtons[] = {
    {
     .rect = {
            .top = 152,
            .bottom = 192,
            .left = 8,
            .right = 248,
        },
     },
    {
     .rect = {
            .top = 24,
            .bottom = 80,
            .left = 0,
            .right = 128,
        },
     },
    {
     .rect = {
            .top = 24,
            .bottom = 80,
            .left = 128,
            .right = 255,
        },
     },
    {
     .rect = {
            .top = 88,
            .bottom = 144,
            .left = 0,
            .right = 128,
        },
     },
    {
     .rect = {
            .top = 88,
            .bottom = 144,
            .left = 128,
            .right = 255,
        },
     },
    {
     .rect = {
            .top = TOUCHSCREEN_RECTLIST_END,
            .bottom = 0,
            .left = 0,
            .right = 0,
        },
     },
};

static const int sTouchArrayFightMenu[] = {
    BATTLE_INPUT_CANCEL,
    BATTLE_INPUT_MOVE_1,
    BATTLE_INPUT_MOVE_2,
    BATTLE_INPUT_MOVE_3,
    BATTLE_INPUT_MOVE_4
};

ALIGN(4)
static const u8 ov12_0226EB08[] = {
    4,
    8,
    9,
    10,
    11
};

ALIGN(4)
static const u8 sCursorArrayFightMenu[][2] = {
    { CURSOR_INPUT_MOVE_1,       CURSOR_INPUT_MOVE_2       },
    { CURSOR_INPUT_MOVE_3,       CURSOR_INPUT_MOVE_4       },
    { CURSOR_INPUT_FIGHT_CANCEL, CURSOR_INPUT_FIGHT_CANCEL }
};

static const TouchscreenHitbox sTouchscreenRectTwoOptionsMenuButtons[] = {
    {
     .rect = {
            .top = 40,
            .bottom = 0x60,
            .left = 8,
            .right = 248,
        },
     },
    {
     .rect = {
            .top = 112,
            .bottom = 168,
            .left = 8,
            .right = 248,
        },
     },
    {
     .rect = {
            .top = TOUCHSCREEN_RECTLIST_END,
            .bottom = 0,
            .left = 0,
            .right = 0,
        },
     },
};

static const int sTouchArrayTwoOptionsMenu[] = {
    BATTLE_INPUT_YES,
    BATTLE_INPUT_CANCEL
};

ALIGN(4)
static const u8 ov12_0226EAFC[] = {
    1,
    4
};

ALIGN(4)
static const u8 sTwoOptionsMenuCursorInput[2][1] = {
    { CURSOR_INPUT_TWO_OPTION_TOP },
    { CURSOR_INPUT_TWO_OPTION_BOTTOM }
};

static const TouchscreenHitbox sTouchscreenRectTargetMenuButtons[] = {
    {
     .rect = {
            .top = 88,
            .bottom = 144,
            .left = 0,
            .right = 120,
        },
     },
    {
     .rect = {
            .top = 8,
            .bottom = 80,
            .left = 136,
            .right = 255,
        },
     },
    {
     .rect = {
            .top = 88,
            .bottom = 144,
            .left = 136,
            .right = 255,
        },
     },
    {
     .rect = {
            .top = 8,
            .bottom = 80,
            .left = 0,
            .right = 120,
        },
     },
    {
     .rect = {
            .top = 152,
            .bottom = 192,
            .left = 8,
            .right = 248,
        },
     },
    {
     .rect = {
            .top = TOUCHSCREEN_RECTLIST_END,
            .bottom = 0,
            .left = 0,
            .right = 0,
        },
     }
};

static const int sTouchArrayTargetMenu[] = {
    BATTLE_INPUT_TARGET_PLAYER_LEFT,
    BATTLE_INPUT_TARGET_OPPONENT_RIGHT,
    BATTLE_INPUT_TARGET_PLAYER_RIGHT,
    BATTLE_INPUT_TARGET_OPPONENT_LEFT,
    BATTLE_INPUT_CANCEL
};

ALIGN(4)
static const u8 ov12_0226EB10[] = {
    6,
    12,
    13,
    5,
    4
};

ALIGN(4)
static const u8 sTargetMenuButtonInputArray[][2] = {
    { CURSOR_INPUT_TARGET_OPPONENT_LEFT, CURSOR_INPUT_TARGET_OPPONENT_RIGHT },
    { CURSOR_INPUT_TARGET_PLAYER_LEFT,   CURSOR_INPUT_TARGET_PLAYER_RIGHT   },
    { CURSOR_INPUT_TARGET_CANCEL,        CURSOR_INPUT_TARGET_CANCEL         }
};

static const TouchscreenHitbox sTouchscreenRectVsRecorderPlaybackButton[] = {
    {
     .rect = {
            .top = 152,
            .bottom = 192,
            .left = 0,
            .right = 255,
        },
     },
    {
     .rect = {
            .top = TOUCHSCREEN_RECTLIST_END,
            .bottom = 0,
            .left = 0,
            .right = 0,
        },
     }
};

static const int sTouchArrayVsRecorderPlayback[] = {
    BATTLE_INPUT_STOP
};

ALIGN(4)
static const u8 ov12_0226E1F8[] = {
    4
};

typedef struct BattleMenuTemplate {
    u16 unk_00;
    u16 paletteId;
    u16 unk_04_val2[4];
    u16 priority[4];
    const TouchscreenHitbox *touchscreenRect;
    const int *touchInput;
    const u8 *unk_1C;
    int (*funcCursor)(BattleInput *battleInput, int param1);
    void (*funcSaveCursorPos)(BattleInput *battleInput, int param1);
    void (*funcCreateMenuObjects)(BattleInput *battleInput, int param1, int param2);
    int (*funcTouchCallback)(BattleInput *battleInput, int touchInput, int param2);
} BattleMenuTemplate;

static const BattleMenuTemplate sBattleMenuTemplates[] = {
    [BATTLE_MENU_0] = {
                       .unk_00 = 28,
                       .paletteId = 246,
                       .unk_04_val2 = { 0xFFFF, 0xFFFF, 0, 0xFFFF },
                       .priority = { 2, 1, 3, 0 },
                       .touchscreenRect = NULL,
                       .touchInput = NULL,
                       .unk_1C = NULL,
                       .funcCursor = NULL,
                       .funcSaveCursorPos = NULL,
                       .funcCreateMenuObjects = NULL,
                       .funcTouchCallback = NULL,
                       },
    [BATTLE_MENU_MAIN_INITIAL] = {
                       .unk_00 = 28,
                       .paletteId = 246,
                       .unk_04_val2 = { 1, 2, 0, 0xFFFF },
                       .priority = { 2, 3, 3, 0 },
                       .touchscreenRect = sTouchscreenRectMainMenuButtons,
                       .touchInput = sTouchArrayMainMenu,
                       .unk_1C = ov12_0226EB04,
                       .funcCursor = BattleInput_CursorMove_MainMenu,
                       .funcSaveCursorPos = BattleInput_CursorSave_MainMenu,
                       .funcCreateMenuObjects = BattleInput_CreateMainMenuObjectsInitial,
                       .funcTouchCallback = BattleInput_TouchCallback_MainMenu,
                       },
    [BATTLE_MENU_MAIN] = {
                       .unk_00 = 28,
                       .paletteId = 246,
                       .unk_04_val2 = { 1, 2, 0, 0xFFFF },
                       .priority = { 2, 3, 3, 0 },
                       .touchscreenRect = sTouchscreenRectMainMenuButtons,
                       .touchInput = sTouchArrayMainMenu,
                       .unk_1C = ov12_0226EB04,
                       .funcCursor = BattleInput_CursorMove_MainMenu,
                       .funcSaveCursorPos = BattleInput_CursorSave_MainMenu,
                       .funcCreateMenuObjects = BattleInput_CreateMainMenuObjectsInitial,
                       .funcTouchCallback = BattleInput_TouchCallback_MainMenu,
                       },
    [BATTLE_MENU_3] = {
                       .unk_00 = 28,
                       .paletteId = 246,
                       .unk_04_val2 = { 1, 2, 0, 0xFFFF },
                       .priority = { 2, 3, 3, 0 },
                       .touchscreenRect = sTouchscreenRectMainMenuButtons,
                       .touchInput = sTouchArrayMainMenu,
                       .unk_1C = ov12_0226EB04,
                       .funcCursor = BattleInput_CursorMove_MainMenu,
                       .funcSaveCursorPos = BattleInput_CursorSave_MainMenu,
                       .funcCreateMenuObjects = BattleInput_CreateMainMenuObjects,
                       .funcTouchCallback = BattleInput_TouchCallback_MainMenu,
                       },
    [BATTLE_MENU_4] = {
                       .unk_00 = 28,
                       .paletteId = 246,
                       .unk_04_val2 = { 1, 2, 0, 0xFFFF },
                       .priority = { 2, 3, 3, 0 },
                       .touchscreenRect = sTouchscreenRectMainMenuButtons,
                       .touchInput = sTouchArrayMainMenu,
                       .unk_1C = ov12_0226EB04,
                       .funcCursor = BattleInput_CursorMove_MainMenu,
                       .funcSaveCursorPos = BattleInput_CursorSave_MainMenu,
                       .funcCreateMenuObjects = BattleInput_CreateMainMenuObjects,
                       .funcTouchCallback = BattleInput_TouchCallback_MainMenu,
                       },
    [BATTLE_MENU_5] = {
                       .unk_00 = 28,
                       .paletteId = 246,
                       .unk_04_val2 = { 1, 2, 0, 0xFFFF },
                       .priority = { 2, 3, 3, 0 },
                       .touchscreenRect = ov12_0226E240,
                       .touchInput = sTouchArrayMainMenu,
                       .unk_1C = ov12_0226EB04,
                       .funcCursor = BattleInput_CursorMove_MainMenu,
                       .funcSaveCursorPos = BattleInput_CursorSave_MainMenu,
                       .funcCreateMenuObjects = BattleInput_CreateMainMenuFightObjectInitial,
                       .funcTouchCallback = BattleInput_TouchCallback_MainMenu,
                       },
    [BATTLE_MENU_6] = {
                       .unk_00 = 28,
                       .paletteId = 246,
                       .unk_04_val2 = { 1, 2, 0, 0xFFFF },
                       .priority = { 2, 3, 3, 0 },
                       .touchscreenRect = ov12_0226E240,
                       .touchInput = sTouchArrayMainMenu,
                       .unk_1C = ov12_0226EB04,
                       .funcCursor = BattleInput_CursorMove_MainMenu,
                       .funcSaveCursorPos = BattleInput_CursorSave_MainMenu,
                       .funcCreateMenuObjects = BattleInput_CreateMainMenuFightObject,
                       .funcTouchCallback = BattleInput_TouchCallback_MainMenu,
                       },
    [BATTLE_MENU_7] = {
                       .unk_00 = 28,
                       .paletteId = 246,
                       .unk_04_val2 = { 1, 0xFFFF, 0, 0xFFFF },
                       .priority = { 2, 1, 3, 0 },
                       .touchscreenRect = sTouchscreenRectMainMenuButtons,
                       .touchInput = sTouchArrayMainMenu,
                       .unk_1C = ov12_0226EB04,
                       .funcCursor = BattleInput_CursorMove_MainMenu,
                       .funcSaveCursorPos = BattleInput_CursorSave_MainMenu,
                       .funcCreateMenuObjects = BattleInput_CreateMainMenuObjectsInitial,
                       .funcTouchCallback = BattleInput_TouchCallback_MainMenu,
                       },
    [BATTLE_MENU_8] = {
                       .unk_00 = 28,
                       .paletteId = 246,
                       .unk_04_val2 = { 1, 0xFFFF, 0, 0xFFFF },
                       .priority = { 2, 1, 3, 0 },
                       .touchscreenRect = sTouchscreenRectMainMenuButtons,
                       .touchInput = sTouchArrayMainMenu,
                       .unk_1C = ov12_0226EB04,
                       .funcCursor = BattleInput_CursorMove_MainMenu,
                       .funcSaveCursorPos = BattleInput_CursorSave_MainMenu,
                       .funcCreateMenuObjects = BattleInput_CreateMainMenuObjects,
                       .funcTouchCallback = BattleInput_TouchCallback_MainMenu,
                       },
    [BATTLE_MENU_PAL_PARK_INITIAL] = {
                       .unk_00 = 28,
                       .paletteId = 246,
                       .unk_04_val2 = { 1, 0xFFFF, 0, 0xFFFF },
                       .priority = { 2, 3, 3, 0 },
                       .touchscreenRect = sTouchscreenRectPalParkButtons,
                       .touchInput = sTouchArrayPalPark,
                       .unk_1C = ov12_0226EB00,
                       .funcCursor = BattleInput_CursorMove_PalParkMenu,
                       .funcSaveCursorPos = NULL,
                       .funcCreateMenuObjects = BattleInput_CreatePalParkMenuObjectsInitial,
                       .funcTouchCallback = BattleInput_TouchCallback_MainMenu,
                       },
    [BATTLE_MENU_PAL_PARK] = {
                       .unk_00 = 28,
                       .paletteId = 246,
                       .unk_04_val2 = { 1, 0xFFFF, 0, 0xFFFF },
                       .priority = { 2, 3, 3, 0 },
                       .touchscreenRect = sTouchscreenRectPalParkButtons,
                       .touchInput = sTouchArrayPalPark,
                       .unk_1C = ov12_0226EB00,
                       .funcCursor = BattleInput_CursorMove_PalParkMenu,
                       .funcSaveCursorPos = NULL,
                       .funcCreateMenuObjects = BattleInput_CreatePalParkMenuObjects,
                       .funcTouchCallback = BattleInput_TouchCallback_MainMenu,
                       },
    [BATTLE_MENU_FIGHT] = {
                       .unk_00 = 28,
                       .paletteId = 246,
                       .unk_04_val2 = { 3, 0xFFFF, 0, 0xFFFF },
                       .priority = { 2, 1, 3, 0 },
                       .touchscreenRect = sTouchscreenRectFightMenuButtons,
                       .touchInput = sTouchArrayFightMenu,
                       .unk_1C = ov12_0226EB08,
                       .funcCursor = BattleInput_CursorMove_FightMenu,
                       .funcSaveCursorPos = BattleInput_CursorSave_FightMenu,
                       .funcCreateMenuObjects = BattleInput_CreateFightMenuObjects,
                       .funcTouchCallback = BattleInput_TouchCallback_FightMenu,
                       },
    [BATTLE_MENU_TARGET] = {
                       .unk_00 = 28,
                       .paletteId = 246,
                       .unk_04_val2 = { 4, 5, 0, 0xFFFF },
                       .priority = { 2, 1, 3, 0 },
                       .touchscreenRect = sTouchscreenRectTargetMenuButtons,
                       .touchInput = sTouchArrayTargetMenu,
                       .unk_1C = ov12_0226EB10,
                       .funcCursor = BattleInput_CursorMove_TargetMenu,
                       .funcSaveCursorPos = BattleInput_CursorSave_TargetMenu,
                       .funcCreateMenuObjects = BattleInput_CreateTargetMenuObjects,
                       .funcTouchCallback = BattleInput_TouchCallback_TargetMenu,
                       },
    [BATTLE_MENU_YES_NO] = {
                       .unk_00 = 28,
                       .paletteId = 246,
                       .unk_04_val2 = { 6, 0xFFFF, 0, 0xFFFF },
                       .priority = { 2, 1, 3, 0 },
                       .touchscreenRect = sTouchscreenRectTwoOptionsMenuButtons,
                       .touchInput = sTouchArrayTwoOptionsMenu,
                       .unk_1C = ov12_0226EAFC,
                       .funcCursor = BattleInput_CursorMove_TwoOptionsMenu,
                       .funcSaveCursorPos = NULL,
                       .funcCreateMenuObjects = BattleInput_CreateYesNoMenuObjects,
                       .funcTouchCallback = BattleInput_TouchCallback_TwoOptionMenu,
                       },
    [BATTLE_MENU_KEEP_FORGET_MOVE] = {
                       .unk_00 = 28,
                       .paletteId = 246,
                       .unk_04_val2 = { 6, 0xFFFF, 0, 0xFFFF },
                       .priority = { 2, 1, 3, 0 },
                       .touchscreenRect = sTouchscreenRectTwoOptionsMenuButtons,
                       .touchInput = sTouchArrayTwoOptionsMenu,
                       .unk_1C = ov12_0226EAFC,
                       .funcCursor = BattleInput_CursorMove_TwoOptionsMenu,
                       .funcSaveCursorPos = NULL,
                       .funcCreateMenuObjects = BattleInput_CreateKeepForgetMenuObjects,
                       .funcTouchCallback = BattleInput_TouchCallback_TwoOptionMenu,
                       },
    [BATTLE_MENU_GIVE_UP_ON_MOVE] = {
                       .unk_00 = 28,
                       .paletteId = 246,
                       .unk_04_val2 = { 6, 0xFFFF, 0, 0xFFFF },
                       .priority = { 2, 1, 3, 0 },
                       .touchscreenRect = sTouchscreenRectTwoOptionsMenuButtons,
                       .touchInput = sTouchArrayTwoOptionsMenu,
                       .unk_1C = ov12_0226EAFC,
                       .funcCursor = BattleInput_CursorMove_TwoOptionsMenu,
                       .funcSaveCursorPos = NULL,
                       .funcCreateMenuObjects = BattleInput_CreateGiveUpOnMoveMenuObjects,
                       .funcTouchCallback = BattleInput_TouchCallback_TwoOptionMenu,
                       },
    [BATTLE_MENU_SWITCH_OR_FLEE] = {
                       .unk_00 = 28,
                       .paletteId = 246,
                       .unk_04_val2 = { 6, 0xFFFF, 0, 0xFFFF },
                       .priority = { 2, 1, 3, 0 },
                       .touchscreenRect = sTouchscreenRectTwoOptionsMenuButtons,
                       .touchInput = sTouchArrayTwoOptionsMenu,
                       .unk_1C = ov12_0226EAFC,
                       .funcCursor = BattleInput_CursorMove_TwoOptionsMenu,
                       .funcSaveCursorPos = NULL,
                       .funcCreateMenuObjects = BattleInput_CreateSwitchOrFleeMenuObjects,
                       .funcTouchCallback = BattleInput_TouchCallback_TwoOptionMenu,
                       },
    [BATTLE_MENU_SWITCH_OR_KEEP] = {
                       .unk_00 = 28,
                       .paletteId = 246,
                       .unk_04_val2 = { 6, 0xFFFF, 0, 0xFFFF },
                       .priority = { 2, 1, 3, 0 },
                       .touchscreenRect = sTouchscreenRectTwoOptionsMenuButtons,
                       .touchInput = sTouchArrayTwoOptionsMenu,
                       .unk_1C = ov12_0226EAFC,
                       .funcCursor = BattleInput_CursorMove_TwoOptionsMenu,
                       .funcSaveCursorPos = NULL,
                       .funcCreateMenuObjects = BattleInput_CreateSwitchOrKeepMenuObjects,
                       .funcTouchCallback = BattleInput_TouchCallback_TwoOptionMenu,
                       },
    [BATTLE_MENU_VS_RECORDER_PLAYBACK] = {
                       .unk_00 = 28,
                       .paletteId = 246,
                       .unk_04_val2 = { 6, 4, 0, 0xFFFF },
                       .priority = { 2, 3, 3, 0 },
                       .touchscreenRect = sTouchscreenRectVsRecorderPlaybackButton,
                       .touchInput = sTouchArrayVsRecorderPlayback,
                       .unk_1C = ov12_0226E1F8,
                       .funcCursor = NULL,
                       .funcSaveCursorPos = NULL,
                       .funcCreateMenuObjects = BattleInput_CreateVSRecorderPlaybackMenuObjects,
                       .funcTouchCallback = BattleInput_TouchCallback_VSRecorderMenu,
                       },
    [BATTLE_MENU_19] = {
                       .unk_00 = 28,
                       .paletteId = 246,
                       .unk_04_val2 = { 1, 2, 0, 0xFFFF },
                       .priority = { 2, 3, 3, 0 },
                       .touchscreenRect = sTouchscreenRectMainMenuButtons,
                       .touchInput = sTouchArrayMainMenu,
                       .unk_1C = ov12_0226EB04,
                       .funcCursor = BattleInput_CursorMove_MainMenu,
                       .funcSaveCursorPos = BattleInput_CursorSave_MainMenu,
                       .funcCreateMenuObjects = BattleInput_CreateMainMenuObjectsInitial,
                       .funcTouchCallback = BattleInput_TouchCallback_MainMenu,
                       },
    [BATTLE_MENU_20] = {
                       .unk_00 = 28,
                       .paletteId = 246,
                       .unk_04_val2 = { 1, 2, 0, 0xFFFF },
                       .priority = { 2, 3, 3, 0 },
                       .touchscreenRect = sTouchscreenRectMainMenuButtons,
                       .touchInput = sTouchArrayMainMenu,
                       .unk_1C = ov12_0226EB04,
                       .funcCursor = BattleInput_CursorMove_MainMenu,
                       .funcSaveCursorPos = BattleInput_CursorSave_MainMenu,
                       .funcCreateMenuObjects = BattleInput_CreateMainMenuObjects,
                       .funcTouchCallback = BattleInput_TouchCallback_MainMenu,
                       },
};

static const ManagedSpriteTemplate sBallGaugeTemplate = {
    .x = 12,
    .y = 13,
    .z = 0,
    .animation = 0,
    .drawPriority = 10,
    .pal = 0,
    .vram = NNS_G2D_VRAM_TYPE_2DSUB,
    .resIdList = { 20023, 20023, 20015, 20015, -1, -1 },
    .bgPriority = 1,
    .vramTransfer = 0
};

static const ManagedSpriteTemplate sBallGaugeOpponentTemplate = {
    .x = 0xF6,
    .y = 9,
    .z = 0,
    .animation = 0,
    .drawPriority = 11,
    .pal = 1,
    .vram = NNS_G2D_VRAM_TYPE_2DSUB,
    .resIdList = { 20024, 20023, 20016, 20016, -1, -1 },
    .bgPriority = 1,
    .vramTransfer = 0
};

static const ManagedSpriteTemplate ov12_0226E4B0 = {
    .x = 0,
    .y = 0,
    .z = 0,
    .animation = 0,
    .drawPriority = 100,
    .pal = 0,
    .vram = NNS_G2D_VRAM_TYPE_2DSUB,
    .resIdList = { 20025, 20020, 20017, 20017, -1, -1 },
    .bgPriority = 1,
    .vramTransfer = 0
};

static const ManagedSpriteTemplate ov12_0226E4E4 = {
    .x = 0,
    .y = 0,
    .z = 0,
    .animation = 0,
    .drawPriority = 100,
    .pal = 0,
    .vram = NNS_G2D_VRAM_TYPE_2DSUB,
    .resIdList = { 20037, 20022, 20021, 20021, -1, -1 },
    .bgPriority = 1,
    .vramTransfer = 0
};

static const ManagedSpriteTemplate sSpriteTemplateBugNet = {
    .x = 88,
    .y = 8,
    .z = 0,
    .animation = 0,
    .drawPriority = 10,
    .pal = 4,
    .vram = NNS_G2D_VRAM_TYPE_2DSUB,
    .resIdList = { 20040, 20023, 20022, 20022, -1, -1 },
    .bgPriority = 1,
    .vramTransfer = 0
};

static const ManagedSpriteTemplate sSpriteTemplateSportBall = {
    .x = 208,
    .y = 8,
    .z = 0,
    .animation = 0,
    .drawPriority = 10,
    .pal = 5,
    .vram = NNS_G2D_VRAM_TYPE_2DSUB,
    .resIdList = { 20040, 20023, 20022, 20022, -1, -1 },
    .bgPriority = 1,
    .vramTransfer = 0
};

ALIGN(4)
static const s16 sMainMenuButtonsScreenOffsets[][3] = {
    { 0, 192, 384 },
    { 0, 192, 384 },
    { 0, 192, 384 },
    { 0, 192, 384 }
};

ALIGN(4)
static const u8 sMainMenuButtonsTouchscreenRect[][4] = {
    { 4,  15, 2,  29 },
    { 17, 23, 0,  9  },
    { 17, 23, 22, 31 },
    { 18, 23, 11, 20 }
};

ALIGN(4)
static const s16 sFightMenuButtonsScreenOffsets[5][3] = {
    { 0, 192, 384 },
    { 0, 192, 384 },
    { 0, 192, 384 },
    { 0, 192, 384 },
    { 0, 192, 384 }
};

ALIGN(4)
static const TouchscreenHitbox sFightMenuButtonsTouchscreenRect[] = {
    {
     .rect = {
            .top = 2,
            .bottom = 9,
            .left = 0,
            .right = 15,
        },
     },
    {
     .rect = {
            .top = 2,
            .bottom = 9,
            .left = 16,
            .right = 31,
        },
     },
    {
     .rect = {
            .top = 10,
            .bottom = 17,
            .left = 0,
            .right = 15,
        },
     },
    {
     .rect = {
            .top = 10,
            .bottom = 17,
            .left = 16,
            .right = 31,
        },
     },
    {
     .rect = {
            .top = 18,
            .bottom = 23,
            .left = 1,
            .right = 30,
        },
     },
};

ALIGN(4)
static const s16 ov12_0226E258[] = { 0x22F, 0x22C, 0x229, 0x226 };

ALIGN(4)
static const TouchscreenHitbox ov12_0226E2A8[] = {
    {
     .rect = {
            .top = 3,
            .bottom = 9,
            .left = 0,
            .right = 15,
        },
     },
    {
     .rect = {
            .top = 3,
            .bottom = 9,
            .left = 16,
            .right = 31,
        },
     },
    {
     .rect = {
            .top = 11,
            .bottom = 17,
            .left = 0,
            .right = 15,
        },
     },
    {
     .rect = {
            .top = 11,
            .bottom = 17,
            .left = 16,
            .right = 31,
        },
     },
};

ALIGN(4)
static const s16 sTargetMenuButtonsScreenOffsets[][3] = {
    { 0, 192, 384 },
    { 0, 192, 384 },
    { 0, 192, 384 },
    { 0, 192, 384 },
    { 0, 192, 384 }
};

ALIGN(4)
static const TouchscreenHitbox ov12_0226E348[] = {
    {
     .rect = {
            .top = 10,
            .bottom = 17,
            .left = 0,
            .right = 14,
        },
     },
    {
     .rect = {
            .top = 0,
            .bottom = 9,
            .left = 17,
            .right = 31,
        },
     },
    {
     .rect = {
            .top = 10,
            .bottom = 17,
            .left = 17,
            .right = 31,
        },
     },
    {
     .rect = {
            .top = 0,
            .bottom = 9,
            .left = 0,
            .right = 14,
        },
     },
    {
     .rect = {
            .top = 18,
            .bottom = 23,
            .left = 1,
            .right = 30,
        },
     },
};

ALIGN(4)
static const s16 ov12_0226E238[] = {
    0x238,
    0x235,
    0x232,
    0x23B
};

ALIGN(4)
static const TouchscreenHitbox ov12_0226E2F8[] = {
    {
     .rect = {
            .top = 0xB,
            .bottom = 17,
            .left = 0,
            .right = 14,
        },
     },
    {
     .rect = {
            .top = 1,
            .bottom = 9,
            .left = 17,
            .right = 31,
        },
     },
    {
     .rect = {
            .top = 0xB,
            .bottom = 17,
            .left = 17,
            .right = 31,
        },
     },
    {
     .rect = {
            .top = 1,
            .bottom = 9,
            .left = 0,
            .right = 14,
        },
     },
};

ALIGN(4)
static const s16 ov12_0226E286[][3] = {
    { 0, 5,    10    },
    { 0, 192, 384 }
};

ALIGN(4)
static const u8 ov12_0226E24C[][4] = {
    { 0xd, 0x14, 0, 31 },
    { 0x4, 0xb,  0, 31 }
};

ALIGN(4)
static const s16 ov12_0226E228[] = { 0, 192, 384 };

ALIGN(4)
static const TouchscreenHitbox ov12_0226E20C[] = {
    {
     .rect = {
            .top = 18,
            .bottom = 23,
            .left = 0,
            .right = 31 },
     },
};

static const ALIGN(4) S16Pos ov12_0226E2D8[] = {
    { 128, 76 },
    { 40, 0xA4 },
    { 0xD8, 0xA4 },
    { 128, 168 }
};

ALIGN(4)
static const int sMoveRangeHitMons[][4] = {
    { 1, 1, 1, 1 },
    { 0, 1, 0, 1 },
    { 0, 1, 1, 1 },
    { 1, 1, 1, 1 },
    { 1, 0, 0, 0 },
    { 1, 0, 1, 0 },
    { 0, 0, 1, 0 },
    { 1, 1, 0, 1 },
    { 0, 1, 1, 1 },
    { 1, 1, 0, 1 },
    { 1, 0, 1, 0 },
    { 0, 1, 0, 1 }
};

typedef struct NCLRIndex {
    u16 baseIndex;
    u16 animationIndex;
} NCLRIndex;

static const NCLRIndex sBackgroundPaletteIds[] = {
    { 0xF7,  0x10F },
    { 248,  0x110 },
    { 0xF9,  0x111 },
    { 0xFA,  0x112 },
    { 0xFB,  0x113 },
    { 0xFC,  0x114 },
    { 0xFD,  0x115 },
    { 0xFE,  0x116 },
    { 255,  0x117 },
    { 0x100, 0x118 },
    { 0x101, 0x119 },
    { 0x102, 0x11A },
    { 0x103, 0x11B },
    { 0x104, 0x11C },
    { 0x105, 0x11D },
    { 0x106, 0x11E },
    { 0x107, 0x11F },
    { 0x120, 0x121 },
    { -1,    -1    },
    { -1,    -1    },
    { -1,    -1    },
    { -1,    -1    },
    { -1,    -1    }
};

BattleInput *BattleInput_New(void) {
    BattleInput *input = Heap_Alloc(HEAP_ID_BATTLE, sizeof(BattleInput));
    MI_CpuFill8(input, 0, sizeof(BattleInput));

    input->curMenuId = BATTLE_MENU_NONE;

    return input;
}

void BgConfig_InitBattleMenuBackgrounds(BgConfig *config) {
    for (int i = 0; i < NELEMS(sBattleMenuBackgroundTemplates); i++) {
        InitBgFromTemplate(config, i + GF_BG_LYR_SUB_0, &sBattleMenuBackgroundTemplates[i], 0);
        BgFillTilemapBufferAndCommit(config, i + GF_BG_LYR_SUB_0, 767);
        BgSetPosTextAndCommit(config, i + GF_BG_LYR_SUB_0, BG_POS_OP_SET_X, 0);
        BgSetPosTextAndCommit(config, i + GF_BG_LYR_SUB_0, BG_POS_OP_SET_Y, 0);
    }
}

void BgConfig_CleanupBattleMenuBackgrounds(BgConfig *config) {
    for (int i = 0; i < NELEMS(sBattleMenuBackgroundTemplates); i++) {
        ToggleBgLayer(i + GF_BG_LYR_SUB_0, GF_PLANE_TOGGLE_OFF);
        FreeBgTilemapBuffer(config, i + GF_BG_LYR_SUB_0);
    }
}

void *BattleInput_NewInit(NARC *unused, NARC *unused2, BattleSystem *battleSystem, u32 gender, u8 *a4) {
    BattleInput *battleInput = BattleInput_New();

    battleInput->battleSystem = battleSystem;
    battleInput->gender = gender;
    battleInput->unk4 = a4;

    if (battleInput->unk4 != 0) {
        battleInput->keyPressed = *a4;
    }

    PaletteData *palette = BattleSystem_GetPaletteData(battleSystem);
    u32 backgroundId = BattleSystem_GetBackgroundId(battleSystem);

    if (backgroundId >= NELEMS(sBackgroundPaletteIds)) {
        backgroundId = 0;
        GF_ASSERT(FALSE);
    }

    battleInput->fontSystem = FontSystem_NewInit(13, HEAP_ID_BATTLE);
    battleInput->fadeTask = SysTask_CreateOnMainQueue(Task_FadeInBattleMenuBackground, battleInput, 1310);

    for (int i = 0; i < 7; i++) {
        NNSG2dScreenData *screenData;
        int bottomScreenBgTilemapId;

        void *buffer = Heap_Alloc(HEAP_ID_BATTLE, 0x800);
        battleInput->screenBuffer[i] = buffer;

        if (BattleSystem_IsInFrontier(battleSystem) && sBottomScreenBgTilemapId[i] == 43) {
            bottomScreenBgTilemapId = 174;
        } else {
            bottomScreenBgTilemapId = sBottomScreenBgTilemapId[i];
        }

        void *narcData = GfGfxLoader_GetScrnData(NARC_a_0_0_7, bottomScreenBgTilemapId, 1, &screenData, HEAP_ID_BATTLE);

        MI_CpuCopy32(screenData->rawData, battleInput->screenBuffer[i], 0x800);
        Heap_Free(narcData);
    }

    int bottomScreenBgPaletteId = (BattleSystem_IsInFrontier(battleSystem)) ? 349 : 246;
    battleInput->paletteBuffer = Heap_Alloc(HEAP_ID_BATTLE, 0x200);

    PaletteData_LoadNarc(palette, NARC_a_0_0_7, bottomScreenBgPaletteId, HEAP_ID_BATTLE, PLTTBUF_SUB_BG, 0, 0);

    if (sBackgroundPaletteIds[backgroundId].baseIndex != 0xffff) {
        PaletteData_LoadNarc(palette, NARC_a_0_0_7, sBackgroundPaletteIds[backgroundId].baseIndex, HEAP_ID_BATTLE, PLTTBUF_SUB_BG, 32, 0);
    }

    u16 *unfadedBuffer = PaletteData_GetUnfadedBuf(palette, PLTTBUF_SUB_BG);
    MI_CpuCopy16(unfadedBuffer, battleInput->paletteBuffer, 0x200);

    for (int i = 0; i < MAX_MON_MOVES; i++) {
        MI_CpuFill8(&battleInput->moveMemory[i].move, 0xFF, sizeof(BattleInputMove));
    }

    for (int i = 0; i < 4; i++) {
        for (int j = 0; j < MAX_MON_MOVES; j++) {
            battleInput->moveMemory[i].typeIcon[j] = Heap_Alloc(HEAP_ID_BATTLE, sub_0208805C(6));
        }
    }

    battleInput->bgPalNormal = Heap_Alloc(HEAP_ID_BATTLE, 0x40);
    battleInput->bgPalTouch = Heap_Alloc(HEAP_ID_BATTLE, 0x40);

    MI_CpuCopy16(battleInput->paletteBuffer, battleInput->bgPalNormal, 0x20);
    MI_CpuCopy16(&battleInput->paletteBuffer[7 * 16], &battleInput->bgPalNormal[16], 0x20);

    u16 animationIndex;
    if (BattleSystem_IsInFrontier(battleSystem)) {
        animationIndex = 350;
    } else if (sBackgroundPaletteIds[backgroundId].animationIndex != 0xffff) {
        animationIndex = sBackgroundPaletteIds[backgroundId].animationIndex;
    } else {
        animationIndex = 271;
    }

    NNSG2dPaletteData *nnsgPalette;
    void *narcDataPalette = GfGfxLoader_GetPlttData(NARC_a_0_0_7, animationIndex, &nnsgPalette, HEAP_ID_BATTLE);

    if (BattleSystem_IsInFrontier(battleSystem)) {
        MI_CpuCopy16(nnsgPalette->pRawData, battleInput->bgPalTouch, 0x40);
    } else {
        MI_CpuCopy16(nnsgPalette->pRawData, battleInput->bgPalTouch, 0x20);
    }

    Heap_Free(narcDataPalette);

    TextFlags_ResetHasSpedUpInput();
    TextFlags_ResetHasContinuedInput();

    battleInput->bgTask = SysTask_CreateOnMainQueue(Task_BattleMenuMessageWaitForTouchResponse, battleInput, 55000);

    return battleInput;
}

void BattleInput_Free(BattleInput *battleInput) {
    if (battleInput->unk4 != 0) {
        *battleInput->unk4 = battleInput->keyPressed;
    }

    BattleInput_FreePersistentResources(battleInput);
    BattleInput_FreeBallGaugeResources(battleInput);
    BattleInput_FreeDefaultResources(battleInput);

    sub_020135AC(battleInput->fontSystem);
    SysTask_Destroy(battleInput->fadeTask);

    for (int i = 0; i < 7; i++) {
        Heap_Free(battleInput->screenBuffer[i]);
    }

    Heap_Free(battleInput->paletteBuffer);
    BattleInput_FreeMoveMemory(battleInput);
    Heap_Free(battleInput->bgPalNormal);
    Heap_Free(battleInput->bgPalTouch);
    SysTask_Destroy(battleInput->bgTask);
    Heap_Free(battleInput);
}

void BattleInput_LoadDefaultResources(BattleInput *battleInput) {
    SpriteSystem *spriteSystem = BattleSystem_GetSpriteSystem(battleInput->battleSystem);
    SpriteManager *spriteManager = BattleSystem_GetSpriteManager(battleInput->battleSystem);
    BgConfig *bgConfig = BattleSystem_GetBgConfig(battleInput->battleSystem);
    PaletteData *paletteData = BattleSystem_GetPaletteData(battleInput->battleSystem);

    int bottomScreenBgTilesId;

    if (BattleSystem_IsInFrontier(battleInput->battleSystem)) {
        bottomScreenBgTilesId = 173;
    } else {
        bottomScreenBgTilesId = 28;
    }

    GfGfxLoader_LoadCharData(NARC_a_0_0_7, bottomScreenBgTilesId, bgConfig, GF_BG_LYR_SUB_0, 0, 0x6000, 1, HEAP_ID_BATTLE);

    sub_0207775C(spriteSystem, spriteManager, 20017, 20017);

    sub_02077720(BattleSystem_GetPaletteData(battleInput->battleSystem), 3, spriteSystem, spriteManager, 2, 20020);

    for (int i = 0; i < 4; i++) {
        sub_020776B8(spriteSystem, spriteManager, NNS_G2D_VRAM_TYPE_2DSUB, TYPE_NORMAL, 20025 + i);
    }

    if (BattleSystem_GetBattleType(battleInput->battleSystem) & BATTLE_TYPE_TUTORIAL) {
        BattleFinger_LoadResources(spriteSystem, spriteManager, HEAP_ID_BATTLE, paletteData, 20414, 20036, 20407, 20396);
        battleInput->tutorial.finger = BattleFinger_New(spriteSystem, spriteManager, HEAP_ID_BATTLE, 20414, 20036, 20407, 20396, 10, 0);
    }
}

static void BattleInput_FreeDefaultResources(BattleInput *battleInput) {
    int i;
    SpriteSystem *spriteSystem = BattleSystem_GetSpriteSystem(battleInput->battleSystem);
    SpriteManager *spriteManager = BattleSystem_GetSpriteManager(battleInput->battleSystem);

    for (i = 0; i < 4; i++) {
        sub_020777A4(spriteManager, 20025 + i);
    }

    sub_020777AC(spriteManager, 20020);
    sub_020777B4(spriteManager, 20017, 20017);

    if (BattleSystem_GetBattleType(battleInput->battleSystem) & BATTLE_TYPE_TUTORIAL) {
        BattleFinger_Delete(battleInput->tutorial.finger);
        BattleFinger_FreeResources(spriteManager, 20414, 20036, 20407, 20396);
    }
}

void BattleInput_ChangeMenu(NARC *narc0, NARC *narc1, BattleInput *battleInput, int menuId, int a4, int *a5) {
    const BattleMenuTemplate *menuTemplate, *prevMenuTemplate;

    if (a5 != NULL) {
        MI_CpuCopy8(a5, &battleInput->menu, sizeof(BattleInputMenu));
    }

    battleInput->isTouchDisabled = FALSE;

    BgConfig *bgConfig = BattleSystem_GetBgConfig(battleInput->battleSystem);
    SpriteSystem *spriteSystem = BattleSystem_GetSpriteSystem(battleInput->battleSystem);
    SpriteManager *spriteManager = BattleSystem_GetSpriteManager(battleInput->battleSystem);

    if (battleInput->curMenuId == BATTLE_MENU_NONE) {
        a4 = 1;
        prevMenuTemplate = NULL;
    } else {
        prevMenuTemplate = &sBattleMenuTemplates[battleInput->curMenuId];
    }

    menuTemplate = &sBattleMenuTemplates[menuId];

    PaletteData_LoadPalette(BattleSystem_GetPaletteData(battleInput->battleSystem), battleInput->paletteBuffer, PLTTBUF_SUB_BG, 0, 0x200);

    for (int i = 0; i < 4; i++) {
        if ((menuTemplate->unk_04_val2[i] != 0xffff) && ((a4 == 1) || (menuTemplate->unk_04_val2[i] != prevMenuTemplate->unk_04_val2[i]))) {
            BG_LoadScreenTilemapData(bgConfig, 4 + i, battleInput->screenBuffer[menuTemplate->unk_04_val2[i]], 0x800);
            ScheduleBgTilemapBufferTransfer(bgConfig, 4 + i);
        }
    }

    SpriteSystem_LoadPaletteBufferFromOpenNarc(BattleSystem_GetPaletteData(battleInput->battleSystem), PLTTBUF_SUB_OBJ, spriteSystem, spriteManager, narc1, 72, 0, 7, NNS_G2D_VRAM_TYPE_2DSUB, 20023);

    battleInput->curMenuId = menuId;

    G2S_SetBlendAlpha(GX_BLEND_PLANEMASK_BG1, 15, 8, 12);
    BattleInput_FreePersistentResources(battleInput);

    if (menuTemplate->funcCreateMenuObjects != NULL) {
        menuTemplate->funcCreateMenuObjects(battleInput, menuId, a4);
    }

    SysTask_CreateOnVWaitQueue(ov12_02269830, battleInput, 10);
}

void BattleInput_LoadBallGaugeResources(NARC *narc, BattleInput *battleInput) {
    int i;

    GF_ASSERT(battleInput->spriteBallGauge[0] == NULL && battleInput->spriteBallGaugeOpponent[0] == NULL);

    SpriteSystem *spriteSystem = BattleSystem_GetSpriteSystem(battleInput->battleSystem);
    SpriteManager *spriteManager = BattleSystem_GetSpriteManager(battleInput->battleSystem);

    SpriteSystem_LoadCharResObjFromOpenNarc(spriteSystem, spriteManager, narc, 208, 1, NNS_G2D_VRAM_TYPE_2DSUB, 20023);
    SpriteSystem_LoadCellResObjFromOpenNarc(spriteSystem, spriteManager, narc, 207, 1, 20015);
    SpriteSystem_LoadAnimResObjFromOpenNarc(spriteSystem, spriteManager, narc, 209, 1, 20015);

    SpriteSystem_LoadCharResObjFromOpenNarc(spriteSystem, spriteManager, narc, 205, 1, NNS_G2D_VRAM_TYPE_2DSUB, 20024);
    SpriteSystem_LoadCellResObjFromOpenNarc(spriteSystem, spriteManager, narc, 204, 1, 20016);
    SpriteSystem_LoadAnimResObjFromOpenNarc(spriteSystem, spriteManager, narc, 206, 1, 20016);

    for (i = 0; i < 6; i++) {
        battleInput->spriteBallGauge[i] = SpriteSystem_NewSprite(spriteSystem, spriteManager, &sBallGaugeTemplate);
        Sprite_SetPositionXYWithSubscreenOffset(battleInput->spriteBallGauge[i]->sprite, 19 * i + 12, 13, FX32_CONST(272));
        ManagedSprite_SetAffineOverwriteMode(battleInput->spriteBallGauge[i], 1);

        battleInput->spriteBallGaugeOpponent[i] = SpriteSystem_NewSprite(spriteSystem, spriteManager, &sBallGaugeOpponentTemplate);
        Sprite_SetPositionXYWithSubscreenOffset(battleInput->spriteBallGaugeOpponent[i]->sprite, 246 + -12 * i, 9, FX32_CONST(272));
    }

    BattleInput_DisableBallGauge(battleInput);

    GF_ASSERT(battleInput->ballTask == NULL);
    battleInput->ballTask = SysTask_CreateOnMainQueue(Task_AnimateBallGauge, battleInput, 1300);

    PaletteData *palette = BattleSystem_GetPaletteData(battleInput->battleSystem);
    BattleCursor_LoadResources(spriteSystem, spriteManager, palette, HEAP_ID_BATTLE, 20413, 20035, 20406, 20395);
    battleInput->cursor = BattleCursor_New(spriteSystem, spriteManager, HEAP_ID_BATTLE, 20413, 20035, 20406, 20395, 5, 0);
}

static void BattleInput_FreeBallGaugeResources(BattleInput *battleInput) {
    int i;

    GF_ASSERT(battleInput->spriteBallGauge[0] != NULL && battleInput->spriteBallGaugeOpponent[0] != NULL);

    SpriteSystem *spriteSystem = BattleSystem_GetSpriteSystem(battleInput->battleSystem);
    SpriteManager *spriteManager = BattleSystem_GetSpriteManager(battleInput->battleSystem);

    SpriteManager_UnloadCharObjById(spriteManager, 20023);
    SpriteManager_UnloadCellObjById(spriteManager, 20015);
    SpriteManager_UnloadAnimObjById(spriteManager, 20015);
    SpriteManager_UnloadCharObjById(spriteManager, 20024);
    SpriteManager_UnloadCellObjById(spriteManager, 20016);
    SpriteManager_UnloadAnimObjById(spriteManager, 20016);
    SpriteManager_UnloadPlttObjById(spriteManager, 20023);

    for (i = 0; i < 6; i++) {
        Sprite_DeleteAndFreeResources(battleInput->spriteBallGauge[i]);
        battleInput->spriteBallGauge[i] = NULL;

        Sprite_DeleteAndFreeResources(battleInput->spriteBallGaugeOpponent[i]);
        battleInput->spriteBallGaugeOpponent[i] = NULL;
    }

    SysTask_Destroy(battleInput->ballTask);
    battleInput->ballTask = NULL;

    BattleCursor_FreeResources(spriteManager, 20413, 20035, 20406, 20395);
    BattleCursor_Delete(battleInput->cursor);
}

static void Task_AnimateBallGauge(SysTask *task, void *data) {
    BattleInput *battleInput = data;
    int i;
    BallGaugeAnimation *ballAnim;

    for (i = 0; i < 6; i++) {
        ballAnim = &battleInput->ballGaugeAnimation[i];
        switch (ballAnim->state) {
        case 0:
        default:
            if (thunk_Sprite_GetDrawFlag(battleInput->spriteBallGauge[i]->sprite) == 0) {
                break;
            }

            if (ballAnim->percentExpToNextLevel >= 87) {
                ballAnim->animationType = 0;
                ballAnim->delay = 10;
            } else {
                break;
            }

            ballAnim->delay += LCRandom() % 8;
            ballAnim->countMax = 2;
            ballAnim->state++;
            break;
        case 1:
            if (ballAnim->delay > 0) {
                ballAnim->delay--;
                break;
            }

            ballAnim->state++;
            break;
        case 2:
        case 4:
            ManagedSprite_OffsetAffineZRotation(battleInput->spriteBallGauge[i], 0x800);
            ballAnim->xOffset += 0x180;

            ManagedSprite_SetPositionXYWithSubscreenOffset(battleInput->spriteBallGauge[i], 12 + 19 * i + ballAnim->xOffset / 0x100, 13, FX32_CONST(272));
            ballAnim->count++;

            if (ballAnim->count >= ballAnim->countMax) {
                ballAnim->count = 0;

                if (ballAnim->state == 2) {
                    ballAnim->state++;
                } else {
                    ManagedSprite_SetAffineZRotation(battleInput->spriteBallGauge[i], 0);
                    ManagedSprite_SetPositionXYWithSubscreenOffset(battleInput->spriteBallGauge[i], 12 + 19 * i, 13, FX32_CONST(272));

                    ballAnim->xOffset = 0;

                    if (ballAnim->loop < 1) {
                        ballAnim->loop++;

                        if (ballAnim->countMax > 1) {
                            ballAnim->countMax--;
                        }

                        ballAnim->state = 2;
                    } else {
                        ballAnim->loop = 0;
                        ballAnim->state = 0;
                    }
                }
            }

            break;
        case 3:
            ManagedSprite_OffsetAffineZRotation(battleInput->spriteBallGauge[i], -0x800);
            ballAnim->xOffset -= 0x180;

            ManagedSprite_SetPositionXYWithSubscreenOffset(battleInput->spriteBallGauge[i], 12 + 19 * i + ballAnim->xOffset / 0x100, 13, FX32_CONST(272));
            ballAnim->count++;

            if (ballAnim->count >= ballAnim->countMax * 2) {
                ballAnim->count = 0;
                ballAnim->state++;
            }
            break;
        }
    }
}

void BattleInput_SetPartyExpPercents(BattleInput *battleInput, u8 *percentExpToNextLevel) {
    for (int i = 0; i < 6; i++) {
        battleInput->ballGaugeAnimation[i].percentExpToNextLevel = percentExpToNextLevel[i];
    }
}

void BattleInput_UpdateBallGaugeAnimation(BattleInput *battleInput, u8 *a1, u8 *a2) {
    for (int i = 0; i < 6; i++) {
        Sprite_SetAnimCtrlSeq(battleInput->spriteBallGauge[i]->sprite, ov12_022684F8(a1[i]));
        Sprite_TickFrame(battleInput->spriteBallGauge[i]->sprite);

        Sprite_SetAnimCtrlSeq(battleInput->spriteBallGaugeOpponent[i]->sprite, ov12_022684F8(a2[i]));
        Sprite_TickFrame(battleInput->spriteBallGaugeOpponent[i]->sprite);
    }
}

void BattleInput_EnableBallGauge(BattleInput *battleInput) {
    GF_ASSERT(battleInput->spriteBallGauge[0] != NULL && battleInput->spriteBallGaugeOpponent[0] != NULL);

    int maxGauge;

    if (BattleSystem_GetBattleType(battleInput->battleSystem) & BATTLE_TYPE_BUG_CONTEST) {
        maxGauge = 1;
    } else {
        maxGauge = 6;
    }

    for (int i = 0; i < maxGauge; i++) {
        thunk_Sprite_SetDrawFlag(battleInput->spriteBallGauge[i]->sprite, 1);
    }

    if (BattleSystem_GetBattleType(battleInput->battleSystem) & BATTLE_TYPE_TRAINER) {
        for (int i = 0; i < 6; i++) {
            thunk_Sprite_SetDrawFlag(battleInput->spriteBallGaugeOpponent[i]->sprite, 1);
        }
    }
}

void BattleInput_DisableBallGauge(BattleInput *battleInput) {
    GF_ASSERT(battleInput->spriteBallGauge[0] != NULL && battleInput->spriteBallGaugeOpponent[0] != NULL);

    for (int i = 0; i < 6; i++) {
        thunk_Sprite_SetDrawFlag(battleInput->spriteBallGauge[i]->sprite, 0);
        thunk_Sprite_SetDrawFlag(battleInput->spriteBallGaugeOpponent[i]->sprite, 0);
    }
}

int BattleInput_CheckTouch(BattleInput *battleInput) {
    int ret, rectHit, paletteId;
    int keyPressed = 0;

    GF_ASSERT(battleInput->curMenuId != BATTLE_MENU_NONE);

    const BattleMenuTemplate *menuTemplate = &sBattleMenuTemplates[battleInput->curMenuId];

    if ((menuTemplate->touchscreenRect == NULL) || (battleInput->isTouchDisabled == TRUE)) {
        return -1;
    }

    GF_ASSERT(menuTemplate->touchInput != NULL);

    if (BattleSystem_GetBattleType(battleInput->battleSystem) & BATTLE_TYPE_TUTORIAL) {
        rectHit = BattleInput_CatchingTutorialMain(battleInput);
    } else {
        rectHit = TouchscreenHitbox_FindRectAtTouchNew(menuTemplate->touchscreenRect);

        if (rectHit == -1) {
            rectHit = BattleInput_CheckCursorInput(battleInput);
            keyPressed++;
        }
    }

    if (rectHit == -1) {
        ret = -1;
        paletteId = 0xff;
    } else {
        ret = menuTemplate->touchInput[rectHit];
        paletteId = menuTemplate->unk_1C[rectHit];
    }

    if (menuTemplate->funcTouchCallback != NULL) {
        ret = menuTemplate->funcTouchCallback(battleInput, ret, paletteId);

        if (ret != -1) {
            if (menuTemplate->funcSaveCursorPos != NULL) {
                menuTemplate->funcSaveCursorPos(battleInput, rectHit);
            }

            MI_CpuClear8(&battleInput->menuCursor, sizeof(BattleMenuCursor));
            BattleCursor_Disable(battleInput->cursor);

            if (keyPressed > 0) {
                battleInput->keyPressed = 1;
            } else {
                battleInput->keyPressed = 0;
            }
        }
    }

    return ret;
}

BOOL BattleInput_CheckFeedbackDone(BattleInput *battleInput) {
    if ((battleInput->feedbackTask == NULL) && (battleInput->unk10 == NULL) && (ov12_022698B0(battleInput) == 1)) {
        return TRUE;
    }

    return FALSE;
}

int ov12_02266C84(int moveRange, int battlerId) {
    switch (moveRange) {
    case 0:
        return (battlerId == 4) ? 9 : 8;
    case 1:
    case 0x2:
    case 0x10:
        return (battlerId == 4) ? 6 : 4;
    case 0x4:
    case 0x80:
        return 1;
    case 8:
        return (battlerId == 4) ? 7 : 2;
    case 0x100:
        return (battlerId == 4) ? 4 : 6;
    case 0x40:
        return 3;
    case 0x200:
        return 10;
    case 0x20:
        return 5;
    case 0x400:
        return 11;
    default:
        GF_ASSERT(FALSE);
        return 0;
    }
}

static void BattleInput_InitMenuWindow(BattleInput *battleInput) {
    GXS_SetVisibleWnd(GX_WNDMASK_W0);
    G2S_SetWndOutsidePlane(GX_WND_PLANEMASK_BG0 | GX_WND_PLANEMASK_BG1 | GX_WND_PLANEMASK_BG2 | GX_WND_PLANEMASK_BG3 | GX_WND_PLANEMASK_OBJ, 1);
    G2S_SetWnd0InsidePlane(GX_WND_PLANEMASK_BG0 | GX_WND_PLANEMASK_BG1 | GX_WND_PLANEMASK_BG3 | GX_WND_PLANEMASK_OBJ, 1);

    int x = 255 - (battleInput->scrollXEdge / 0x100);

    if (x < 0) {
        x = 0;
    }

    G2S_SetWnd0Position(x, 0, 255, 192);
}

void BattleInput_StartMenuScrollHorizontalTask(BattleInput *battleInput, int xSpeed, int xEnd) {
    if (battleInput->scrollXEdge == xEnd * 0x100) {
        return;
    }

    battleInput->scrollXSpeed = xSpeed;
    battleInput->scrollXEnd = xEnd << 8;

    SysTask_CreateOnMainQueue(Task_BattleMenuScrollHorizontal, battleInput, 1200);
}

static void Task_BattleMenuScrollHorizontal(SysTask *task, void *data) {
    BattleInput *battleInput = data;
    BOOL isFinished = FALSE;
    BgConfig *bgConfig;

    bgConfig = BattleSystem_GetBgConfig(battleInput->battleSystem);
    battleInput->scrollXEdge += battleInput->scrollXSpeed;

    if (((battleInput->scrollXSpeed <= 0) && (battleInput->scrollXEdge <= battleInput->scrollXEnd)) || ((battleInput->scrollXSpeed > 0) && (battleInput->scrollXEdge >= battleInput->scrollXEnd))) {
        battleInput->scrollXEdge = battleInput->scrollXEnd;
        isFinished = TRUE;
    }

    BgSetPosTextAndCommit(bgConfig, GF_BG_LYR_SUB_2, BG_POS_OP_SET_X, battleInput->scrollXEdge / 0x100);
    BattleInput_InitMenuWindow(battleInput);

    if (isFinished == TRUE) {
        BgFillTilemapBufferAndCommit(bgConfig, 7, (0x6000 / 0x20 - 1));
        ToggleBgLayer(GF_BG_LYR_SUB_3, GF_PLANE_TOGGLE_OFF);
        SetBgPriority(GF_BG_LYR_SUB_3, 0);
        GXS_SetVisibleWnd(GX_WNDMASK_NONE);
        SysTask_Destroy(task);
        return;
    }
}

static void BattleInput_InitMenuSlideIn(BattleInput *battleInput, int battlerId) {
    battleInput->isTouchDisabled = TRUE;

    G2S_SetWndOutsidePlane(GX_WND_PLANEMASK_BG0 | GX_WND_PLANEMASK_BG1 | GX_WND_PLANEMASK_BG2 | GX_WND_PLANEMASK_BG3, 1);
    G2S_SetWnd0InsidePlane(GX_WND_PLANEMASK_BG2 | GX_WND_PLANEMASK_BG3, 1);
    G2S_SetWnd1InsidePlane(GX_WND_PLANEMASK_BG2 | GX_WND_PLANEMASK_BG3, 1);
    G2S_SetWnd0Position(0, 0, 255, (18 * 8));
    G2S_SetWnd1Position(0, (18 * 8), 255, 192);
    GXS_SetVisibleWnd(GX_WNDMASK_W0 | GX_WNDMASK_W1);

    BattleMenuSlideIn *menuSlideIn = Heap_Alloc(HEAP_ID_BATTLE, sizeof(BattleMenuSlideIn));
    MI_CpuClear8(menuSlideIn, sizeof(BattleMenuSlideIn));

    menuSlideIn->battleInput = battleInput;
    menuSlideIn->battlerId = battlerId;
    menuSlideIn->x = -(255 * 100);
    menuSlideIn->y = (40 * 100);
    menuSlideIn->xSet = ((255 * 100) - menuSlideIn->x) / 100;
    menuSlideIn->ySet = ((40 * 100) - menuSlideIn->y) / 100;

    PlaySE(SEQ_SE_DP_SLIDEIN);
    SysTask_CreateOnMainQueue(Task_BattleMenuSlideIn, menuSlideIn, 1210);

    BOOL ret = Main_SetHBlankIntrCB(HBlankCB_BattleMenuSlideIn, menuSlideIn);
    GF_ASSERT(ret == 1);

    menuSlideIn->vblankTask = SysTask_CreateOnVBlankQueue(VBlankTask_BattleMenuSlideIn, menuSlideIn, 10);
}

static void BattleInput_CreateMainMenuObjectsInitial(BattleInput *battleInput, int a1, int a2) {
    int battlerType = battleInput->menu.main.battlerType;
    BattleInput_CreateMainMenuObjects(battleInput, a1, a2);
    BattleInput_InitMenuSlideIn(battleInput, battlerType);
}

static void BattleInput_CreateMainMenuObjects(BattleInput *battleInput, int a1, int a2) {
    String *strFight, *strBag, *strPokemon, *strRun;
    MsgData *msgLoader;
    int battlerType;
    BattleInputMainMenu *menu;

    menu = &battleInput->menu.main;
    battlerType = menu->battlerType;

    battleInput->cancelRunDisplay = menu->cancelRunDisplay;

    msgLoader = BattleSystem_GetMessageLoader(battleInput->battleSystem);

    battleInput->battlerType = battlerType;

    if (BattleSystem_GetBattleType(battleInput->battleSystem) & BATTLE_TYPE_SAFARI) {
        strFight = NewString_ReadMsgData(msgLoader, msg_0197_00931);   // BALL
        strBag = NewString_ReadMsgData(msgLoader, msg_0197_00932);     // BAIT
        strPokemon = NewString_ReadMsgData(msgLoader, msg_0197_00933); // MUD
    } else if (BattleSystem_GetBattleType(battleInput->battleSystem) & BATTLE_TYPE_PAL_PARK) {
        strFight = NewString_ReadMsgData(msgLoader, msg_0197_01223);   // BALL
        strBag = NewString_ReadMsgData(msgLoader, msg_0197_00932);     // BAIT
        strPokemon = NewString_ReadMsgData(msgLoader, msg_0197_00933); // MUD
    } else if (BattleSystem_GetBattleType(battleInput->battleSystem) & BATTLE_TYPE_BUG_CONTEST) {
        strFight = NewString_ReadMsgData(msgLoader, msg_0197_00924);   // FIGHT
        strBag = NewString_ReadMsgData(msgLoader, msg_0197_01270);     // BALL
        strPokemon = NewString_ReadMsgData(msgLoader, msg_0197_00926); // POKéMON
    } else {
        strFight = NewString_ReadMsgData(msgLoader, msg_0197_00924);   // FIGHT
        strBag = NewString_ReadMsgData(msgLoader, msg_0197_00925);     // BAG
        strPokemon = NewString_ReadMsgData(msgLoader, msg_0197_00926); // POKéMON
    }

    if (battleInput->cancelRunDisplay == 1) {
        strRun = NewString_ReadMsgData(msgLoader, msg_0197_00928); // CANCEL
        battleInput->unk66F = 1;
    } else {
        strRun = NewString_ReadMsgData(msgLoader, msg_0197_00927); // RUN
        battleInput->unk66F = 0;
    }

    BattleInput_CreateTextObject(battleInput, &battleInput->textObj[MENUTXT_FIGHT], strFight, 4, MAKE_TEXT_COLOR(1, 2, 3), 2, 20023, 128, 83, 1, NULL);
    BattleInput_CreateTextObject(battleInput, &battleInput->textObj[MENUTXT_BAG], strBag, 4, MAKE_TEXT_COLOR(4, 5, 6), 2, 20023, 40, 169, 1, NULL);
    BattleInput_CreateTextObject(battleInput, &battleInput->textObj[MENUTXT_POKEMON], strPokemon, 4, MAKE_TEXT_COLOR(7, 8, 9), 2, 20023, 216, 168, 1, NULL);
    BattleInput_CreateTextObject(battleInput, &battleInput->textObj[MENUTXT_RUN], strRun, 4, MAKE_TEXT_COLOR(10, 11, 12), 2, 20023, 128, 176, 1, NULL);

    String_Delete(strFight);
    String_Delete(strBag);
    String_Delete(strPokemon);
    String_Delete(strRun);

    if ((BattleSystem_GetBattleType(battleInput->battleSystem) & (BATTLE_TYPE_SAFARI | BATTLE_TYPE_PAL_PARK)) == 0) {
        Pokemon *pokemon = BattleSystem_GetPartyMon(battleInput->battleSystem, menu->battlerId, menu->selectedMon);
        ;

        BattleInput_LoadPokemonIconResources(battleInput);
        ManagedSprite *spriteMonIcon = BattleInput_SetPokemonIcon(battleInput, pokemon, battlerType, menu->hp, menu->maxHp, menu->monIconStatus);

        int x, y;
        sub_02013794(battleInput->textObj[MENUTXT_FIGHT].textObj, &x, &y);

        if (battlerType == 4) {
            x += battleInput->textObj[MENUTXT_FIGHT].fontLength + 32 / 2;
        } else {
            x -= 32 / 2;
        }

        ManagedSprite_SetPositionXYWithSubscreenOffset(spriteMonIcon, x, y - (FX32_CONST(272) >> FX32_SHIFT), FX32_CONST(272));

        if (BattleSystem_GetBattleType(battleInput->battleSystem) & BATTLE_TYPE_BUG_CONTEST) {
            Pokemon *caughtMon;
            String *strMonGender;
            String *strFormated;
            MessageFormat *format;
            int genderColor = 0;

            format = BattleSystem_GetMessageFormat(battleInput->battleSystem);
            strFormated = String_New(32, HEAP_ID_BATTLE);
            caughtMon = BattleSystem_GetBugContestCaughtMon(battleInput->battleSystem);
            if (caughtMon != NULL) {
                int species = GetMonData(caughtMon, MON_DATA_SPECIES, NULL);
                if (species != SPECIES_NONE) {
                    int gender = GetMonGender(caughtMon);

                    switch (gender) {
                    case MON_MALE:
                        strMonGender = NewString_ReadMsgData(msgLoader, msg_0197_01272); // ♂
                        genderColor = 0xc0d00;
                        break;
                    case MON_FEMALE:
                        strMonGender = NewString_ReadMsgData(msgLoader, msg_0197_01273); // ♀
                        genderColor = 0xe0f00;
                        break;
                    default:
                        strMonGender = NULL;
                        break;
                    }

                    if (strMonGender != NULL) {
                        BattleInput_CreateTextObject(battleInput, &battleInput->textObj[MENUTXT_BUG_GENDER], strMonGender, 0, genderColor, 3, 20023, 136, 0x10, 0, 0);
                        String_Delete(strMonGender);
                    }
                    int level = GetMonData(caughtMon, MON_DATA_LEVEL, NULL);
                    BufferIntegerAsString(format, 1, level, 3, PRINTING_MODE_LEFT_ALIGN, 1);
                    String *strMonLevel = NewString_ReadMsgData(msgLoader, msg_0197_01274);
                    StringExpandPlaceholders(format, strFormated, strMonLevel);
                    BattleInput_CreateTextObject(battleInput, &battleInput->textObj[MENUTXT_BUG_LEVEL], strFormated, 0, 0x90800, 3, 20023, 144, 0x10, 0, 0);
                    String_Delete(strMonLevel);
                    BattleInput_SetBugContestPokemonIcon(battleInput, caughtMon);
                }
            }
            int ballsRemaining = BattleSystem_GetSafariBallCount(battleInput->battleSystem);
            BufferIntegerAsString(format, 0, ballsRemaining, 2, PRINTING_MODE_LEFT_ALIGN, 1);
            String *strBallsRemaining = NewString_ReadMsgData(msgLoader, msg_0197_01271);
            StringExpandPlaceholders(format, strFormated, strBallsRemaining);
            BattleInput_CreateTextObject(battleInput, &battleInput->textObj[6], strFormated, 0, 0x90800, 3, 20023, 224, 0x10, 0, 0);
            String_Delete(strBallsRemaining);
            BattleInput_CreateBugContestGraphics(battleInput);
            String_Delete(strFormated);
        }
    }
}

static void BattleInput_CreateMainMenuFightObjectInitial(BattleInput *battleInput, int param1, int param2) {
    int battlerType = battleInput->menu.main.battlerType;

    BattleInput_CreateMainMenuFightObject(battleInput, param1, param2);
    BattleInput_InitMenuSlideIn(battleInput, battlerType);
}

static void BattleInput_CreateMainMenuFightObject(BattleInput *battleInput, int param1, int param2) {
    int battlerType = battleInput->menu.main.battlerType;

    BattleInput_CreateMainMenuObjects(battleInput, param1, param2);

    BgConfig *bgConfig = BattleSystem_GetBgConfig(battleInput->battleSystem);

    FillBgTilemapRect(bgConfig, 4, (0x6000 / 0x20 - 1), 0, 0x10, 32, 8, 17);
    ScheduleBgTilemapBufferTransfer(bgConfig, 5);

    TextOBJ_SetSpritesDrawFlag(battleInput->textObj[MENUTXT_BAG].textObj, 0);
    TextOBJ_SetSpritesDrawFlag(battleInput->textObj[MENUTXT_POKEMON].textObj, 0);
    TextOBJ_SetSpritesDrawFlag(battleInput->textObj[MENUTXT_RUN].textObj, 0);
}

static void BattleInput_CreatePalParkMenuObjectsInitial(BattleInput *battleInput, int param1, int param2) {
    int battlerType = battleInput->menu.main.battlerType;

    BattleInput_CreatePalParkMenuObjects(battleInput, param1, param2);
    BattleInput_InitMenuSlideIn(battleInput, battlerType);
}

void BattleInput_CreatePalParkMenuObjects(BattleInput *battleInput, int param1, int param2) {
    int battlerType = battleInput->menu.main.battlerType;

    BattleInput_CreateMainMenuObjects(battleInput, param1, param2);

    BgConfig *bgConfig = BattleSystem_GetBgConfig(battleInput->battleSystem);

    FillBgTilemapRect(bgConfig, 4, (0x6000 / 0x20 - 1), 0, 0x10, 10, 8, 17);
    FillBgTilemapRect(bgConfig, 4, (0x6000 / 0x20 - 1), 0x16, 0x10, 10, 8, 17);
    ScheduleBgTilemapBufferTransfer(bgConfig, 5);

    TextOBJ_SetSpritesDrawFlag(battleInput->textObj[MENUTXT_BAG].textObj, 0);
    TextOBJ_SetSpritesDrawFlag(battleInput->textObj[MENUTXT_POKEMON].textObj, 0);
}

static void BattleInput_CreateFightMenuObjects(BattleInput *battleInput, int param1, int param2) {
    BattleInputFightMenu *fightMenu;
    int i;
    MsgData *msgLoader;
    BattleInputMoveMemory *moveMemory;
    int ppColor;

    fightMenu = &battleInput->menu.fight;
    GF_ASSERT(fightMenu);

    battleInput->battlerType = fightMenu->battlerType;

    msgLoader = BattleSystem_GetMessageLoader(battleInput->battleSystem);
    moveMemory = BattleInput_GetMoveMemory(battleInput, fightMenu->battlerType);

    BattleInput_CreateMoveTypeIcons(battleInput);

    BattleInput_CreateTextObject(battleInput, &battleInput->textObj[MENUTXT_MOVE_1], NULL, 4, MAKE_TEXT_COLOR(7, 8, 9), 3, 20023, 64, 45, 1, &moveMemory->moveDisplay[0]);
    BattleInput_CreateTextObject(battleInput, &battleInput->textObj[MENUTXT_MOVE_2], NULL, 4, MAKE_TEXT_COLOR(7, 8, 9), 3, 20023, 192, 44, 1, &moveMemory->moveDisplay[1]);
    BattleInput_CreateTextObject(battleInput, &battleInput->textObj[MENUTXT_MOVE_3], NULL, 4, MAKE_TEXT_COLOR(7, 8, 9), 3, 20023, 64, 108, 1, &moveMemory->moveDisplay[2]);
    BattleInput_CreateTextObject(battleInput, &battleInput->textObj[MENUTXT_MOVE_4], NULL, 4, MAKE_TEXT_COLOR(7, 8, 9), 3, 20023, 192, 107, 1, &moveMemory->moveDisplay[3]);

    for (i = 0; i < MAX_MON_MOVES; i++) {
        ppColor = GetPPTextColor(fightMenu->pp[i], fightMenu->ppMax[i]);
        BattleInput_CreateTextObject(battleInput, &battleInput->textObj[MENUTXT_PP_MAX_1 + i], NULL, 0, ppColor, 4, 20023, sMovePPMaxTextPositions[i][0], sMovePPMaxTextPositions[i][1], 0, &moveMemory->ppDisplay[i]);
        BattleInput_CreateTextObject(battleInput, &battleInput->textObj[MENUTXT_PP_1 + i], NULL, 0, ppColor, 4, 20023, sMovePPTextPositions[i][0], sMovePPTextPositions[i][1], 0, &moveMemory->ppMaxDisplay[i]);
    }

    String *strCancel = NewString_ReadMsgData(msgLoader, msg_0197_00929); // CANCEL
    BattleInput_CreateTextObject(battleInput, &battleInput->textObj[MENUTXT_CANCEL], strCancel, 4, MAKE_TEXT_COLOR(10, 11, 12), 2, 20023, 128, 175, 1, NULL);
    String_Delete(strCancel);

    int moveType;

    for (i = 0; i < MAX_MON_MOVES; i++) {
        if (fightMenu->moveNo[i] != MOVE_NONE) {
            moveType = GetMoveAttr(fightMenu->moveNo[i], MOVEATTR_TYPE);
            ov12_02268C30(battleInput, moveType, i);
        } else {
            ov12_02268C4C(battleInput, i);
            break;
        }
    }

    BgConfig *bgConfig = BattleSystem_GetBgConfig(battleInput->battleSystem);

    if (fightMenu->moveNo[0] == MOVE_NONE) {
        TextOBJ_SetSpritesDrawFlag(battleInput->textObj[MENUTXT_MOVE_1].textObj, 0);
        TextOBJ_SetSpritesDrawFlag(battleInput->textObj[MENUTXT_PP_1].textObj, 0);
        TextOBJ_SetSpritesDrawFlag(battleInput->textObj[MENUTXT_PP_MAX_1].textObj, 0);
    }

    if (fightMenu->moveNo[1] == MOVE_NONE) {
        TextOBJ_SetSpritesDrawFlag(battleInput->textObj[MENUTXT_MOVE_2].textObj, 0);
        TextOBJ_SetSpritesDrawFlag(battleInput->textObj[MENUTXT_PP_2].textObj, 0);
        TextOBJ_SetSpritesDrawFlag(battleInput->textObj[MENUTXT_PP_MAX_2].textObj, 0);
    }

    if (fightMenu->moveNo[2] == MOVE_NONE) {
        TextOBJ_SetSpritesDrawFlag(battleInput->textObj[MENUTXT_MOVE_3].textObj, 0);
        TextOBJ_SetSpritesDrawFlag(battleInput->textObj[MENUTXT_PP_3].textObj, 0);
        TextOBJ_SetSpritesDrawFlag(battleInput->textObj[MENUTXT_PP_MAX_3].textObj, 0);
    }

    if (fightMenu->moveNo[3] == MOVE_NONE) {
        TextOBJ_SetSpritesDrawFlag(battleInput->textObj[MENUTXT_MOVE_4].textObj, 0);
        TextOBJ_SetSpritesDrawFlag(battleInput->textObj[MENUTXT_PP_4].textObj, 0);
        TextOBJ_SetSpritesDrawFlag(battleInput->textObj[MENUTXT_PP_MAX_4].textObj, 0);
    }
}

static void BattleInput_CreateYesNoMenuObjects(BattleInput *battleInput, int param1, int param2) {
    MsgData *msgLoader = BattleSystem_GetMessageLoader(battleInput->battleSystem);
    String *strYes = NewString_ReadMsgData(msgLoader, msg_0197_00940); // Yes
    String *strNo = NewString_ReadMsgData(msgLoader, msg_0197_00941);  // No

    BattleInput_CreateTextObject(battleInput, &battleInput->textObj[MENUTXT_YES], strYes, 4, MAKE_TEXT_COLOR(1, 2, 3), 2, 20023, 128, 67, 1, NULL);
    BattleInput_CreateTextObject(battleInput, &battleInput->textObj[MENUTXT_NO], strNo, 4, MAKE_TEXT_COLOR(10, 11, 12), 2, 20023, 128, 139, 1, NULL);

    String_Delete(strYes);
    String_Delete(strNo);
}

static void BattleInput_CreateKeepForgetMenuObjects(BattleInput *battleInput, int param1, int param2) {
    MsgData *msgLoader = BattleSystem_GetMessageLoader(battleInput->battleSystem);
    String *strForget = NewString_ReadMsgData(msgLoader, msg_0197_01181); // Forget a move!
    String *strKeep = NewString_ReadMsgData(msgLoader, msg_0197_01182);   // Keep old moves!

    BattleInput_CreateTextObject(battleInput, &battleInput->textObj[MENUTXT_FORGET_MOVE], strForget, 4, MAKE_TEXT_COLOR(1, 2, 3), 2, 20023, 128, 67, 1, NULL);
    BattleInput_CreateTextObject(battleInput, &battleInput->textObj[MENUTXT_KEEP_MOVE], strKeep, 4, MAKE_TEXT_COLOR(10, 11, 12), 2, 20023, 128, 139, 1, NULL);

    String_Delete(strForget);
    String_Delete(strKeep);
}

static void BattleInput_CreateGiveUpOnMoveMenuObjects(BattleInput *battleInput, int param1, int param2) {
    BattleInputTwoOptionMenu *menu = &battleInput->menu.twoOption;
    MsgData *msgLoader = BattleSystem_GetMessageLoader(battleInput->battleSystem);
    MessageFormat *strTemplate = BattleSystem_GetMessageFormat(battleInput->battleSystem);
    String *strGiveUp = NewString_ReadMsgData(msgLoader, msg_0197_01186);     // Give up on {move}?
    String *strDontGiveUp = NewString_ReadMsgData(msgLoader, msg_0197_01187); // Don't give up on {move}!
    String *strGiveUpFormated = String_New(100, HEAP_ID_BATTLE);
    String *strDontGiveUpFormated = String_New(100, HEAP_ID_BATTLE);

    BufferMoveName(strTemplate, 0, menu->moveNo);
    StringExpandPlaceholders(strTemplate, strGiveUpFormated, strGiveUp);
    StringExpandPlaceholders(strTemplate, strDontGiveUpFormated, strDontGiveUp);

    BattleInput_CreateTextObject(battleInput, &battleInput->textObj[MENUTXT_GIVEUP], strGiveUpFormated, 4, MAKE_TEXT_COLOR(1, 2, 3), 2, 20023, 128, 67, 1, NULL);
    BattleInput_CreateTextObject(battleInput, &battleInput->textObj[MENUTXT_DONT_GIVEUP], strDontGiveUpFormated, 4, MAKE_TEXT_COLOR(10, 11, 12), 2, 20023, 128, 139, 1, NULL);

    String_Delete(strGiveUp);
    String_Delete(strDontGiveUp);
    String_Delete(strGiveUpFormated);
    String_Delete(strDontGiveUpFormated);
}

static void BattleInput_CreateVSRecorderPlaybackMenuObjects(BattleInput *battleInput, int param1, int param2) {
    G2S_SetBlendAlpha(2, 15, 31, 0);

    MsgData *msgLoader = BattleSystem_GetMessageLoader(battleInput->battleSystem);
    String *strStop = NewString_ReadMsgData(msgLoader, msg_0197_01260); // STOP

    NNSG2dScreenData *screenData;

    void *data = GfGfxLoader_GetScrnData(NARC_a_0_0_7, 40, 1, &screenData, HEAP_ID_BATTLE);
    MI_CpuCopy32(screenData->rawData, battleInput->screenBuffer[6], 0x800);
    Heap_Free(data);

    BgConfig *bgConfig = BattleSystem_GetBgConfig(battleInput->battleSystem);
    BG_LoadScreenTilemapData(bgConfig, 4, battleInput->screenBuffer[6], 0x800);
    ScheduleBgTilemapBufferTransfer(bgConfig, 4);

    bgConfig = BattleSystem_GetBgConfig(battleInput->battleSystem);

    MI_CpuClear32(battleInput->screenBuffer[4], 0x800);
    BG_LoadScreenTilemapData(bgConfig, 5, battleInput->screenBuffer[4], 0x800);
    ScheduleBgTilemapBufferTransfer(bgConfig, 5);

    BattleInput_CreateTextObject(battleInput, &battleInput->textObj[0], strStop, 4, MAKE_TEXT_COLOR(1, 2, 3), 2, 20023, 128, 171, 1, NULL);
    String_Delete(strStop);
}

static void BattleInput_CreateSwitchOrFleeMenuObjects(BattleInput *battleInput, int param1, int param2) {
    BattleInputTwoOptionMenu *menu = &battleInput->menu.twoOption;
    MsgData *msgLoader = BattleSystem_GetMessageLoader(battleInput->battleSystem);
    MessageFormat *strTemplate = BattleSystem_GetMessageFormat(battleInput->battleSystem);
    String *strNextPokemon = NewString_ReadMsgData(msgLoader, msg_0197_01217); // Use next Pokémon
    String *strFlee = NewString_ReadMsgData(msgLoader, msg_0197_01218);        // Flee
    String *strNextPokemonFormated = String_New(100, HEAP_ID_BATTLE);
    String *strFleeFormated = String_New(100, HEAP_ID_BATTLE);

    BufferMoveName(strTemplate, 0, menu->moveNo);
    StringExpandPlaceholders(strTemplate, strNextPokemonFormated, strNextPokemon);
    StringExpandPlaceholders(strTemplate, strFleeFormated, strFlee);

    BattleInput_CreateTextObject(battleInput, &battleInput->textObj[MENUTXT_USE_NEXT_MON], strNextPokemonFormated, 4, MAKE_TEXT_COLOR(1, 2, 3), 2, 20023, 128, 67, 1, NULL);
    BattleInput_CreateTextObject(battleInput, &battleInput->textObj[MENUTXT_FLEE], strFleeFormated, 4, MAKE_TEXT_COLOR(10, 11, 12), 2, 20023, 128, 139, 1, NULL);

    String_Delete(strNextPokemon);
    String_Delete(strFlee);
    String_Delete(strNextPokemonFormated);
    String_Delete(strFleeFormated);
}

static void BattleInput_CreateSwitchOrKeepMenuObjects(BattleInput *battleInput, int param1, int param2) {
    MsgData *msgLoader;
    String *strSwitchPokemon, *strKeepBattling, *strSwitchPokemonFormated, *strKeepBattlingFormated;
    MessageFormat *strTemplate;
    BattleInputTwoOptionMenu *menu;

    menu = &battleInput->menu.twoOption;
    msgLoader = BattleSystem_GetMessageLoader(battleInput->battleSystem);
    strTemplate = BattleSystem_GetMessageFormat(battleInput->battleSystem);
    strSwitchPokemon = NewString_ReadMsgData(msgLoader, msg_0197_01215); // Switch Pokémon
    strKeepBattling = NewString_ReadMsgData(msgLoader, msg_0197_01216);  // Keep battling
    strSwitchPokemonFormated = String_New(100, HEAP_ID_BATTLE);
    strKeepBattlingFormated = String_New(100, HEAP_ID_BATTLE);

    BufferMoveName(strTemplate, 0, menu->moveNo);
    StringExpandPlaceholders(strTemplate, strSwitchPokemonFormated, strSwitchPokemon);
    StringExpandPlaceholders(strTemplate, strKeepBattlingFormated, strKeepBattling);

    BattleInput_CreateTextObject(battleInput, &battleInput->textObj[MENUTXT_SWITCH], strSwitchPokemonFormated, 4, MAKE_TEXT_COLOR(1, 2, 3), 2, 20023, 128, 67, 1, NULL);
    BattleInput_CreateTextObject(battleInput, &battleInput->textObj[MENUTXT_KEEP_BATTLING], strKeepBattlingFormated, 4, MAKE_TEXT_COLOR(10, 11, 12), 2, 20023, 128, 139, 1, NULL);

    String_Delete(strSwitchPokemon);
    String_Delete(strKeepBattling);
    String_Delete(strSwitchPokemonFormated);
    String_Delete(strKeepBattlingFormated);
}

static void BattleInput_CreateTargetMenuObjects(BattleInput *battleInput, int param1, int param2) {
    BattleInputTargetMenu *menu;
    int i;
    MsgData *msgLoader;
    u8 monsHit[4];
    String *strPokemonName, *strGenderMarker;
    Pokemon *pokemon;
    BoxPokemon *boxMon;
    MessageFormat *messageFormat;
    int monNameColor;
    u8 v10[6];
    u8 v11[6];
    int battlerId;

    menu = &battleInput->menu.target;

    battleInput->monTargetType = menu->selectionType;
    battleInput->battlerType = menu->battlerType;

    msgLoader = BattleSystem_GetMessageLoader(battleInput->battleSystem);
    messageFormat = BattleSystem_GetMessageFormat(battleInput->battleSystem);

    BattleInput_GetMonsHitArray(battleInput, monsHit, 0);
    BattleInput_LoadPokemonIconResources(battleInput);
    ov12_022686BC(battleInput);
    ov12_0223C1C4(battleInput->battleSystem, v10);
    ov12_0223C1A0(battleInput->battleSystem, v11);

    strPokemonName = String_New(24, HEAP_ID_BATTLE);

    for (i = MENUTXT_MON_NAME_1; i < MENUTXT_MON_NAME_4 + 1; i++) {
        battlerId = v11[2 + i];

        if ((menu->targetMons[battlerId].hide == 1) && (monsHit[i] == 1)) {
            if (menu->targetMons[battlerId].gender == MON_MALE) {
                strGenderMarker = NewString_ReadMsgData(msgLoader, msg_0197_00962); // ♂
            } else if (menu->targetMons[battlerId].gender == MON_FEMALE) {
                strGenderMarker = NewString_ReadMsgData(msgLoader, msg_0197_00963); // ♀
            } else {
                strGenderMarker = NewString_ReadMsgData(msgLoader, msg_0197_00964); //(genderless)
            }

            pokemon = BattleSystem_GetPartyMon(battleInput->battleSystem, battlerId, menu->targetMons[battlerId].selectedMon);
            boxMon = Mon_GetBoxMon(pokemon);

            BufferBoxMonNickname(messageFormat, 0, boxMon);
            StringExpandPlaceholders(messageFormat, strPokemonName, strGenderMarker);

            if (i & 1) {
                monNameColor = MAKE_TEXT_COLOR(1, 2, 3); // Opponent
            } else {
                monNameColor = MAKE_TEXT_COLOR(4, 5, 6); // Ally
            }

            BattleInput_CreateTextObject(battleInput, &battleInput->textObj[i], strPokemonName, 4, monNameColor, 6, 20023, sTargetPokemonMenuPositions[i][0], sTargetPokemonMenuPositions[i][1], 1, NULL);
            String_Delete(strGenderMarker);

            switch (i) {
            case 1:
                BattleInput_SetPokemonIcon(battleInput, pokemon, 3, menu->targetMons[battlerId].hp, menu->targetMons[battlerId].hpMax, menu->targetMons[battlerId].status);
                break;
            case 3:
                BattleInput_SetPokemonIcon(battleInput, pokemon, 5, menu->targetMons[battlerId].hp, menu->targetMons[battlerId].hpMax, menu->targetMons[battlerId].status);
                break;
            }
        } else {
            if (monsHit[i] == 0) {
                ov12_02268CA0(battleInput, i);
            }
        }
    }

    String_Delete(strPokemonName);

    String *strCancel = NewString_ReadMsgData(msgLoader, msg_0197_00930); // CANCEL
    BattleInput_CreateTextObject(battleInput, &battleInput->textObj[MENUTXT_TARGET_CANCEL], strCancel, 4, MAKE_TEXT_COLOR(10, 11, 12), 2, 20023, sTargetPokemonMenuPositions[MENUTXT_TARGET_CANCEL][0], sTargetPokemonMenuPositions[MENUTXT_TARGET_CANCEL][1], 1, NULL);
    String_Delete(strCancel);
}

static int BattleInput_TouchCallback_MainMenu(BattleInput *battleInput, int touchInput, int unused) {
    int textObjId, frameType;

    int battler = BATTLER_NONE;

    switch (touchInput) {
    case TOUCH_MENU_NO_INPUT:
    default:
        return touchInput;
    case BATTLE_INPUT_FIGHT:
        textObjId = MENUTXT_FIGHT;
        frameType = 0;

        switch (battleInput->battlerType) {
        case 0:
            battler = battleInput->battlerType;
            break;
        case 2:
        case 4:
            battler = battleInput->battlerType - 2;
            break;
        }
        break;
    case BATTLE_INPUT_BAG:
        textObjId = MENUTXT_BAG;
        frameType = 1;
        break;
    case BATTLE_INPUT_POKEMON:
        textObjId = MENUTXT_POKEMON;
        frameType = 1;
        break;
    case BATTLE_INPUT_RUN:
        textObjId = MENUTXT_RUN;
        frameType = 1;
        break;
    }

    BattleInput_Deadstriped_02268EE0(battleInput, unused);
    BattleInput_StartFeedbackTask(Task_ButtonFeedback, battleInput);

    battleInput->feedback.button.screenOffsets = sMainMenuButtonsScreenOffsets[touchInput - 1];
    battleInput->feedback.button.unk8 = &sMainMenuButtonsTouchscreenRect[touchInput - 1];
    battleInput->feedback.button.unk10 = 1;
    battleInput->feedback.button.ret = touchInput;
    battleInput->feedback.button.textObjId = textObjId;
    battleInput->feedback.button.pokemonIconIndex = battler;
    battleInput->feedback.button.frameType = frameType;
    battleInput->feedback.button.pos = ov12_0226E2D8[touchInput - 1];
    battleInput->feedback.button.shouldDeleteAfter = TRUE;

    return touchInput;
}

static int BattleInput_TouchCallback_FightMenu(BattleInput *battleInput, int touchInput, int unusedParam) {
    if (touchInput == TOUCH_MENU_NO_INPUT) {
        return touchInput;
    }

    BattleInputFightMenu *menu = &battleInput->menu.fight;

    if ((touchInput >= BATTLE_INPUT_MOVE_1) && (touchInput <= BATTLE_INPUT_MOVE_4)) {
        if (menu->moveNo[touchInput - 1] == MOVE_NONE) {
            return TOUCH_MENU_NO_INPUT;
        }
    }

    u32 index = touchInput - 1; // required to match
    const s16 *offsets;
    const void *touchscreenRect;

    switch (touchInput) {
    case TOUCH_MENU_NO_INPUT:
    default:
        return TOUCH_MENU_NO_INPUT;
    case BATTLE_INPUT_MOVE_1:
    case BATTLE_INPUT_MOVE_2:
    case BATTLE_INPUT_MOVE_3:
    case BATTLE_INPUT_MOVE_4:
        offsets = sFightMenuButtonsScreenOffsets[index];
        touchscreenRect = &sFightMenuButtonsTouchscreenRect[index];
        break;
    case BATTLE_INPUT_CANCEL:
        offsets = sFightMenuButtonsScreenOffsets[4];
        touchscreenRect = &sFightMenuButtonsTouchscreenRect[4];
        break;
    }

    BattleInput_Deadstriped_02268EE0(battleInput, unusedParam);
    BattleInput_StartFeedbackTask(Task_FightMenuButtonFeedback, battleInput);

    battleInput->feedback.button.screenOffsets = offsets;
    battleInput->feedback.button.unk8 = touchscreenRect;
    battleInput->feedback.button.unk10 = 3;
    battleInput->feedback.button.ret = touchInput;
    battleInput->feedback.button.shouldDeleteAfter = TRUE;

    return touchInput;
}

static int BattleInput_TouchCallback_TwoOptionMenu(BattleInput *battleInput, int touchInput, int unused) {
    int textObjId;

    switch (touchInput) {
    case TOUCH_MENU_NO_INPUT:
    default:
        return touchInput;
    case BATTLE_INPUT_YES:
        textObjId = MENUTXT_YES;
        break;
    case BATTLE_INPUT_CANCEL:
        textObjId = MENUTXT_NO;
        break;
    }

    BattleInput_Deadstriped_02268EE0(battleInput, unused);
    BattleInput_StartFeedbackTask(Task_ButtonFeedback, battleInput);

    if (touchInput == BATTLE_INPUT_YES) {
        battleInput->feedback.button.screenOffsets = ov12_0226E286[1];
        battleInput->feedback.button.unk8 = &ov12_0226E24C[1];
    } else {
        battleInput->feedback.button.screenOffsets = ov12_0226E286[0];
        battleInput->feedback.button.unk8 = &ov12_0226E24C[0];
    }

    battleInput->feedback.button.unk10 = 6;
    battleInput->feedback.button.ret = touchInput;
    battleInput->feedback.button.textObjId = textObjId;
    battleInput->feedback.button.frameType = 3;
    battleInput->feedback.button.shouldDeleteAfter = TRUE;

    return touchInput;
}

static int BattleInput_TouchCallback_TargetMenu(BattleInput *battleInput, int touchInput, int unused) {
    BattleInputTargetMenu *menu;
    u8 moveRange[4];

    menu = &battleInput->menu.target;

    BattleInput_GetMonsHitArray(battleInput, moveRange, 1);

    switch (touchInput) {
    case TOUCH_MENU_NO_INPUT:
    default:
        return touchInput;
    case BATTLE_INPUT_MOVE_1:
        if (moveRange[0] == 0) {
            return TOUCH_MENU_NO_INPUT;
        }
        break;
    case BATTLE_INPUT_MOVE_2:
        if (moveRange[1] == 0) {
            return TOUCH_MENU_NO_INPUT;
        }
        break;
    case BATTLE_INPUT_MOVE_3:
        if (moveRange[2] == 0) {
            return TOUCH_MENU_NO_INPUT;
        }
        break;
    case BATTLE_INPUT_MOVE_4:
        if (moveRange[3] == 0) {
            return TOUCH_MENU_NO_INPUT;
        }
        break;
    case BATTLE_INPUT_CANCEL:
        BattleInput_Deadstriped_02268EE0(battleInput, 4);
        BattleInput_StartFeedbackTask(Task_ButtonFeedback, battleInput);

        battleInput->feedback.button.screenOffsets = sTargetMenuButtonsScreenOffsets[4];
        battleInput->feedback.button.unk8 = &ov12_0226E348[4];
        battleInput->feedback.button.unk10 = 4;
        battleInput->feedback.button.ret = touchInput;
        battleInput->feedback.button.textObjId = 4;
        battleInput->feedback.button.frameType = 3;
        battleInput->feedback.button.shouldDeleteAfter = TRUE;

        return touchInput;
    }

    BgConfig *bgConfig;

    bgConfig = BattleSystem_GetBgConfig(battleInput->battleSystem);
    BgFillTilemapBufferAndCommit(bgConfig, 5, (0x6000 / 0x20 - 1));
    ScheduleBgTilemapBufferTransfer(bgConfig, 5);

    BattleInput_Deadstriped_02268EDC(battleInput, touchInput);
    BattleInput_StartFeedbackTask(Task_TargetMenuButtonFeedback, battleInput);

    battleInput->feedback.monSelect.ret = touchInput;

    return touchInput;
}

static int BattleInput_TouchCallback_VSRecorderMenu(BattleInput *battleInput, int touchInput, int unused) {
    switch (touchInput) {
    case TOUCH_MENU_NO_INPUT:
    default:
        return touchInput;
    case 1:
        break;
    }

    BattleInput_Deadstriped_02268EE0(battleInput, unused);
    BattleInput_StartFeedbackTask(Task_ButtonFeedback, battleInput);

    battleInput->feedback.button.screenOffsets = ov12_0226E228;
    battleInput->feedback.button.unk8 = &ov12_0226E20C;
    battleInput->feedback.button.unk10 = 6;
    battleInput->feedback.button.ret = touchInput;
    battleInput->feedback.button.textObjId = 0;
    battleInput->feedback.button.frameType = 3;
    battleInput->feedback.button.shouldDeleteAfter = FALSE;

    return touchInput;
}

static void BattleInput_LoadPokemonIconResources(BattleInput *battleInput) {
    SpriteSystem *spriteSystem;
    SpriteManager *spriteManager;
    PaletteData *palette;

    spriteSystem = BattleSystem_GetSpriteSystem(battleInput->battleSystem);
    spriteManager = BattleSystem_GetSpriteManager(battleInput->battleSystem);
    palette = BattleSystem_GetPaletteData(battleInput->battleSystem);

    SpriteSystem_LoadPaletteBuffer(palette, PLTTBUF_SUB_OBJ, spriteSystem, spriteManager, NARC_poketool_icongra_poke_icon, sub_02074490(), 0, 3, NNS_G2D_VRAM_TYPE_2DSUB, 20022);
    SpriteSystem_LoadCellResObj(spriteSystem, spriteManager, NARC_poketool_icongra_poke_icon, sub_02074498(), 0, 20021);
    SpriteSystem_LoadAnimResObj(spriteSystem, spriteManager, NARC_poketool_icongra_poke_icon, sub_020744A4(), 0, 20021);
}

static void BattleInput_FreePokemonIconResources(BattleInput *battleInput) {
    SpriteManager *spriteManager = BattleSystem_GetSpriteManager(battleInput->battleSystem);

    SpriteManager_UnloadCharObjById(spriteManager, 20036);
    SpriteManager_UnloadCharObjById(spriteManager, 20037);
    SpriteManager_UnloadCharObjById(spriteManager, 20038);
    SpriteManager_UnloadCellObjById(spriteManager, 20021);
    SpriteManager_UnloadAnimObjById(spriteManager, 20021);
    SpriteManager_UnloadPlttObjById(spriteManager, 20022);
}

static void BattleInput_DeletePokemonIconSprites(BattleInput *battleInput) {
    int i;

    for (i = 0; i < 4; i++) {
        if (battleInput->spritePokemonIcons[i] != NULL) {
            Sprite_DeleteAndFreeResources(battleInput->spritePokemonIcons[i]);
            battleInput->spritePokemonIcons[i] = NULL;
        }

        if (battleInput->taskAnimatePokemonIcon[i] != NULL) {
            SysTask_Destroy(battleInput->taskAnimatePokemonIcon[i]);
            battleInput->taskAnimatePokemonIcon[i] = NULL;
        }
    }

    if (battleInput->spriteCaughtBugIcon != NULL) {
        Sprite_DeleteAndFreeResources(battleInput->spriteCaughtBugIcon);
        battleInput->spriteCaughtBugIcon = NULL;
    }
}

static ManagedSprite *BattleInput_SetPokemonIcon(BattleInput *battleInput, Pokemon *pokemon, int battlerType, int hp, int maxHp, int status) {
    SpriteSystem *spriteSystem;
    SpriteManager *spriteManager;
    u32 resId;
    ManagedSpriteTemplate spriteTemplate;
    ManagedSprite *sprite;
    int battler;

    if (battlerType >= BATTLER_TYPE_PLAYER_SIDE_SLOT_1) {
        battler = battlerType - BATTLER_TYPE_PLAYER_SIDE_SLOT_1;
    } else {
        battler = battlerType;
    }

    GF_ASSERT(battleInput->spritePokemonIcons[battler] == 0);
    GF_ASSERT(battleInput->taskAnimatePokemonIcon[battler] == 0);

    switch (battlerType) {
    case BATTLER_TYPE_SOLO_PLAYER:
    case BATTLER_TYPE_PLAYER_SIDE_SLOT_1:
    case BATTLER_TYPE_PLAYER_SIDE_SLOT_2:
        resId = 20036;
        break;
    case BATTLER_TYPE_ENEMY_SIDE_SLOT_1:
        resId = 20037;
        break;
    case BATTLER_TYPE_ENEMY_SIDE_SLOT_2:
        resId = 20038;
        break;
    default:
        GF_ASSERT(FALSE);
        return NULL;
    }

    spriteSystem = BattleSystem_GetSpriteSystem(battleInput->battleSystem);
    spriteManager = BattleSystem_GetSpriteManager(battleInput->battleSystem);

    SpriteSystem_LoadCharResObj(spriteSystem, spriteManager, NARC_poketool_icongra_poke_icon, Pokemon_GetIconNaix(pokemon), 0, NNS_G2D_VRAM_TYPE_2DSUB, resId);

    spriteTemplate = ov12_0226E4E4;
    spriteTemplate.resIdList[0] = resId;
    spriteTemplate.x = sPokemonIconPositions[battler][0];
    spriteTemplate.y = sPokemonIconPositions[battler][1];
    sprite = SpriteSystem_NewSprite(spriteSystem, spriteManager, &spriteTemplate);

    ManagedSprite_SetPositionXYWithSubscreenOffset(sprite, spriteTemplate.x, spriteTemplate.y, FX32_CONST(272));
    Sprite_SetPalOffsetRespectVramOffset(sprite->sprite, Pokemon_GetIconPalette(pokemon));

    int anim = 0;

    if ((hp == 0) || (status == 2)) {
        anim = 0;
    } else if (status == 3) {
        anim = 5;
    } else {
        switch (CalculateHpBarColor(hp, maxHp, 48)) {
        case 4:
            anim = 1;
            break;
        case 3:
            anim = 2;
            break;
        case 2:
            anim = 3;
            break;
        case 1:
            anim = 4;
            break;
        }

        ManagedSprite_SetAnim(sprite, anim);
    }

    ManagedSprite_TickFrame(sprite);

    battleInput->spritePokemonIcons[battler] = sprite;
    battleInput->taskAnimatePokemonIcon[battler] = SysTask_CreateOnMainQueue(Task_AnimatePokemonIconSprite, sprite, 1300);

    return sprite;
}

static ManagedSprite *BattleInput_SetBugContestPokemonIcon(BattleInput *battleInput, Pokemon *pokemon) {
    GF_ASSERT(battleInput->spriteCaughtBugIcon == 0);

    SpriteSystem *spriteSystem = BattleSystem_GetSpriteSystem(battleInput->battleSystem);
    SpriteManager *spriteManager = BattleSystem_GetSpriteManager(battleInput->battleSystem);

    SpriteSystem_LoadCharResObj(spriteSystem, spriteManager, NARC_poketool_icongra_poke_icon, Pokemon_GetIconNaix(pokemon), 0, NNS_G2D_VRAM_TYPE_2DSUB, 20039);

    ManagedSpriteTemplate spriteTemplate = ov12_0226E4E4;
    spriteTemplate.resIdList[0] = 20039;
    spriteTemplate.x = 120;
    spriteTemplate.y = 8;
    ManagedSprite *sprite = SpriteSystem_NewSprite(spriteSystem, spriteManager, &spriteTemplate);

    ManagedSprite_SetPositionXYWithSubscreenOffset(sprite, spriteTemplate.x, spriteTemplate.y, 0x110000);

    Sprite_SetPalOffsetRespectVramOffset(sprite->sprite, Pokemon_GetIconPalette(pokemon));

    ManagedSprite_TickFrame(sprite);

    battleInput->spriteCaughtBugIcon = sprite;
    return sprite;
}

static void Task_AnimatePokemonIconSprite(SysTask *task, void *data) {
    ManagedSprite_TickFrame((ManagedSprite *)data);
}

static int ov12_022684F8(u8 task) {
    int animationState;

    switch (task) {
    case 0:
    default:
        animationState = 0;
        break;
    case 1:
        animationState = 1;
        break;
    case 2:
        animationState = 3;
        break;
    case 3:
        animationState = 2;
        break;
    }

    return animationState;
}

static void String_GetFontLength(String *str, u32 fontId, int *lengthOut, int *charLengthOut) {
    int length, charLength;

    length = FontID_String_GetWidth(fontId, str, 0);
    charLength = length / 8;

    if (FX_ModS32(length, 8) != 0) {
        charLength++;
    }

    *lengthOut = length;
    *charLengthOut = charLength;
}

static void BattleInput_CreateTextObject(BattleInput *battleInput, BattleInputTextObject *battleTextObj, String *str, u32 fontId, int textColor, int palOffset, int palId, int x, int y, int centerText, BattleInputMoveMemory_DisplayObj *param10) {
    TextOBJTemplate textObjTemplate;
    Window window;
    UnkStruct_02021AC8 charTransferAlloc;
    int size;
    TextOBJ *textObj;
    BgConfig *bgConfig;
    SpriteManager *spriteManager;
    int fontLength, charLength;

    GF_ASSERT(battleTextObj->textObj == NULL);

    spriteManager = BattleSystem_GetSpriteManager(battleInput->battleSystem);
    bgConfig = BattleSystem_GetBgConfig(battleInput->battleSystem);

    if (param10 == NULL) {
        String_GetFontLength(str, fontId, &fontLength, &charLength);
    } else {
        fontLength = param10->fontLength;
        charLength = param10->charLength;
    }

    if (param10 == NULL) {
        InitWindow(&window);
        AddTextWindowTopLeftCorner(bgConfig, &window, charLength, 16 / 8, 0, 0);
        AddTextPrinterParameterizedWithColorAndSpacing(&window, fontId, str, 0, 0, 0xFF, textColor, 0, 0, NULL);
    } else {
        window = param10->window;
    }

    size = sub_02013688(&window, NNS_G2D_VRAM_TYPE_2DSUB, 5);
    sub_02021AC8(size, 1, NNS_G2D_VRAM_TYPE_2DSUB, &charTransferAlloc);

    if (centerText == 1) {
        x -= fontLength / 2;
    }

    y += (FX32_CONST(272) >> FX32_SHIFT) - 8;

    textObjTemplate.fontSystem = battleInput->fontSystem;
    textObjTemplate.window = &window;
    textObjTemplate.spriteList = SpriteManager_GetSpriteList(spriteManager);
    textObjTemplate.plttResourceProxy = SpriteManager_FindPlttResourceProxy(spriteManager, palId);
    textObjTemplate.sprite = NULL;
    textObjTemplate.offset = charTransferAlloc.offset;
    textObjTemplate.x = x;
    textObjTemplate.y = y;
    textObjTemplate.unk_20 = 0;
    textObjTemplate.unk_24 = 100;
    textObjTemplate.vram = NNS_G2D_VRAM_TYPE_2DSUB;
    textObjTemplate.heapID = HEAP_ID_BATTLE;

    textObj = sub_020135D8(&textObjTemplate);

    sub_020138E0(textObj, palOffset);
    sub_020136B4(textObj, x, y);

    if (param10 == NULL) {
        RemoveWindow(&window);
    }

    battleTextObj->textObj = textObj;
    battleTextObj->unk4 = charTransferAlloc;
    battleTextObj->fontLength = fontLength;
}

static void BattleInput_DeleteTextObjects(BattleInput *battleInput) {
    for (int i = 0; i < 13; i++) {
        if (battleInput->textObj[i].textObj != NULL) {
            FontOAM_Delete(battleInput->textObj[i].textObj);
            sub_02021B5C(&battleInput->textObj[i].unk4);
            battleInput->textObj[i].textObj = NULL;
        }
    }
}

static void ov12_022686BC(BattleInput *battleInput) {
    u8 moveRange[4], hitsMultiple[4];
    int j, i;
    u16 *src, *dest;
    BgConfig *bgConfig;

    bgConfig = BattleSystem_GetBgConfig(battleInput->battleSystem);
    src = GetBgTilemapBuffer(bgConfig, 5);

    BattleInput_GetMonsHitArray(battleInput, moveRange, 0);

    if (moveRange[0] == 1) {
        ov12_02268E2C(battleInput, 1, hitsMultiple, 0);

        if (hitsMultiple[2] == 1) {
            for (i = 12; i <= 16; i++) {
                dest = &src[i * 32];

                for (j = 15; j <= 16; j++) {
                    dest[j] = 676;
                }
            }
        }

        if (hitsMultiple[3] == 1) {
            for (i = 10; i <= 10; i++) {
                dest = &src[i * 32];

                for (j = 2; j <= 12; j++) {
                    dest[j] = 676;
                }
            }
        }
    }

    if (moveRange[1] == 1) {
        ov12_02268E2C(battleInput, 2, hitsMultiple, 0);

        if (hitsMultiple[2] == 1) {
            for (i = 10; i <= 10; i++) {
                dest = &src[i * 32];

                for (j = 19; j <= 29; j++) {
                    dest[j] = 676;
                }
            }
        }

        if (hitsMultiple[3] == 1) {
            for (i = 3; i <= 7; i++) {
                dest = &src[i * 32];

                for (j = 15; j <= 16; j++) {
                    dest[j] = 676;
                }
            }
        }
    }
}

static BattleInputMoveMemory *BattleInput_GetMoveMemory(BattleInput *battleInput, int battlerType) {
    if (battlerType >= BATTLER_TYPE_PLAYER_SIDE_SLOT_1) {
        battlerType -= BATTLER_TYPE_PLAYER_SIDE_SLOT_1;
    }

    return &battleInput->moveMemory[battlerType];
}

static void BattleInput_FreeMoveMemory(BattleInput *battleInput) {
    int j, i;

    for (i = 0; i < 4; i++) {
        for (j = 0; j < MAX_MON_MOVES; j++) {
            Heap_Free(battleInput->moveMemory[i].typeIcon[j]);

            if (battleInput->moveMemory[i].moveDisplay[j].window.pixelBuffer != NULL) {
                RemoveWindow(&battleInput->moveMemory[i].moveDisplay[j].window);
            }

            if (battleInput->moveMemory[i].ppDisplay[j].window.pixelBuffer != NULL) {
                RemoveWindow(&battleInput->moveMemory[i].ppDisplay[j].window);
            }

            if (battleInput->moveMemory[i].ppMaxDisplay[j].window.pixelBuffer != NULL) {
                RemoveWindow(&battleInput->moveMemory[i].ppMaxDisplay[j].window);
            }
        }
    }
}

void BattleInput_LoadFightMenuText(BattleInput *battleInput, int battlerId, const BattleInputMove *moveMemory) {
    BattleInputMoveMemory *moveDisplayObj;
    void *charData;
    NNSG2dCharacterData *charDataNNS;
    int i, size, moveType;
    String *strMoveName;
    String *strSlashFormatted;
    String *strSlash;
    String *strPP;
    MessageFormat *messageFormat;
    int ppColor;
    MsgData *msgLoader = BattleSystem_GetMessageLoader(battleInput->battleSystem);
    moveDisplayObj = BattleInput_GetMoveMemory(battleInput, battlerId);
    size = sub_0208805C(6);
    strPP = NewString_ReadMsgData(msgLoader, msg_0197_00938); // PP
    messageFormat = BattleSystem_GetMessageFormat(battleInput->battleSystem);
    strSlashFormatted = String_New(((2 + 2 + 1 + 2) * 2 + 2), HEAP_ID_BATTLE);
    strSlash = NewString_ReadMsgData(msgLoader, msg_0197_00937); // '/'

    for (i = 0; i < MAX_MON_MOVES; i++) {
        if ((moveMemory->moveNo[i] != moveDisplayObj->move.moveNo[i]) && (moveMemory->moveNo[i] != 0)) {
            moveType = GetMoveAttr(moveMemory->moveNo[i], MOVEATTR_TYPE);
            charData = GfGfxLoader_GetCharData(sub_020776B4(), sub_02077678(moveType), 1, &charDataNNS, HEAP_ID_BATTLE);
            MI_CpuCopy32(charDataNNS->pRawData, moveDisplayObj->typeIcon[i], size);
            Heap_Free(charData);
        }

        if ((moveDisplayObj->moveDisplay[i].window.pixelBuffer == NULL) || ((moveMemory->moveNo[i] != moveDisplayObj->move.moveNo[i]) && (moveMemory->moveNo[i] != 0))) {
            strMoveName = GetMoveName(moveMemory->moveNo[i], HEAP_ID_BATTLE);
            BattleInput_SetMoveDisplayObjectTextFont(battleInput, strMoveName, 4, &moveDisplayObj->moveDisplay[i], MAKE_TEXT_COLOR(7, 8, 9));
            String_Delete(strMoveName);
        }

        if ((moveDisplayObj->ppDisplay[i].window.pixelBuffer == NULL) || (moveDisplayObj->ppMaxDisplay[i].window.pixelBuffer == NULL) || (moveMemory->moveNo[i] != 0) || (moveMemory->moveNo[i] != moveDisplayObj->move.moveNo[i]) || (moveMemory->pp[i] != moveDisplayObj->move.pp[i]) || (moveMemory->ppMax[i] != moveDisplayObj->move.ppMax[i])) {
            BufferIntegerAsString(messageFormat, 0, moveMemory->pp[i], 2, PRINTING_MODE_RIGHT_ALIGN, 0);
            BufferIntegerAsString(messageFormat, 1, moveMemory->ppMax[i], 2, PRINTING_MODE_RIGHT_ALIGN, 0);
            StringExpandPlaceholders(messageFormat, strSlashFormatted, strSlash);

            ppColor = GetPPTextColor(moveMemory->pp[i], moveMemory->ppMax[i]);

            if ((moveDisplayObj->ppDisplay[i].window.pixelBuffer == NULL) || (moveMemory->moveNo[i] != moveDisplayObj->move.moveNo[i]) || (moveMemory->pp[i] != moveDisplayObj->move.pp[i])) {
                BattleInput_SetMoveDisplayObjectTextFont(battleInput, strSlashFormatted, 0, &moveDisplayObj->ppDisplay[i], ppColor);
            }

            if ((moveDisplayObj->ppMaxDisplay[i].window.pixelBuffer == NULL) || (moveMemory->moveNo[i] != moveDisplayObj->move.moveNo[i]) || (moveMemory->pp[i] != moveDisplayObj->move.pp[i])) {
                BattleInput_SetMoveDisplayObjectTextFont(battleInput, strPP, 0, &moveDisplayObj->ppMaxDisplay[i], ppColor);
            }
        }
    }

    String_Delete(strPP);
    String_Delete(strSlash);
    String_Delete(strSlashFormatted);

    moveDisplayObj->move = *moveMemory;
}

static void BattleInput_SetMoveDisplayObjectTextFont(BattleInput *battleInput, String *str, u32 fontId, BattleInputMoveMemory_DisplayObj *display, int textColor) {
    int length, charLength;

    String_GetFontLength(str, fontId, &length, &charLength);

    display->fontLength = length;
    display->charLength = charLength;

    if (display->window.pixelBuffer != NULL) {
        RemoveWindow(&display->window);
    }

    InitWindow(&display->window);
    AddTextWindowTopLeftCorner(BattleSystem_GetBgConfig(battleInput->battleSystem), &display->window, charLength, 16 / 8, 0, 0);
    AddTextPrinterParameterizedWithColorAndSpacing(&display->window, fontId, str, 0, 0, 0xFF, textColor, 0, 0, NULL);
}

static void BattleInput_CreateMoveTypeIcons(BattleInput *battleInput) {
    int i;
    SpriteSystem *renderer;
    SpriteManager *spriteManager;
    ManagedSpriteTemplate typeIconTemplate;
    BattleInputFightMenu *menu;
    int type;
    BattleInputMoveMemory *moveDisplayObj;

    menu = &battleInput->menu.fight;
    renderer = BattleSystem_GetSpriteSystem(battleInput->battleSystem);
    spriteManager = BattleSystem_GetSpriteManager(battleInput->battleSystem);
    moveDisplayObj = BattleInput_GetMoveMemory(battleInput, battleInput->battlerType);
    typeIconTemplate = ov12_0226E4B0;

    for (i = 0; i < MAX_MON_MOVES; i++) {
        GF_ASSERT(battleInput->spriteTypeIcons[i] == 0);

        if (menu->moveNo[i] != 0) {
            type = GetMoveAttr(menu->moveNo[i], MOVEATTR_TYPE);
            typeIconTemplate.resIdList[0] = 20025 + i;
            typeIconTemplate.x = sTypeIconPositions[i][0];
            typeIconTemplate.y = sTypeIconPositions[i][1];

            battleInput->spriteTypeIcons[i] = sub_020777C8(renderer, spriteManager, type, &typeIconTemplate);

            ManagedSprite_SetPositionXYWithSubscreenOffset(battleInput->spriteTypeIcons[i], typeIconTemplate.x, typeIconTemplate.y, FX32_CONST(272));

            NNSG2dImageProxy *proxy = Sprite_GetImageProxy(battleInput->spriteTypeIcons[i]->sprite);

            MI_CpuCopy16(moveDisplayObj->typeIcon[i], (void *)(G2S_GetOBJCharPtr() + (u32)proxy->vramLocation.baseAddrOfVram[NNS_G2D_VRAM_TYPE_2DSUB]), sub_0208805C(6));
        }
    }
}

static void BattleInput_DeleteAndFreeTypeIconGraphics(BattleInput *battleInput) {
    int i;
    SpriteSystem *renderer = BattleSystem_GetSpriteSystem(battleInput->battleSystem);
    SpriteManager *spriteManager = BattleSystem_GetSpriteManager(battleInput->battleSystem);

    for (i = 0; i < MAX_MON_MOVES; i++) {
        if (battleInput->spriteTypeIcons[i] != NULL) {
            thunk_ManagedSprite_DeleteAndFreeResources(battleInput->spriteTypeIcons[i]);
            battleInput->spriteTypeIcons[i] = NULL;
        }
    }
}

static void BattleInput_DeleteAndFreeCategoryIconGraphics(BattleInput *battleInput) {
    int i;
    SpriteSystem *renderer;
    SpriteManager *spriteManager;

    renderer = BattleSystem_GetSpriteSystem(battleInput->battleSystem);
    spriteManager = BattleSystem_GetSpriteManager(battleInput->battleSystem);

    for (i = 0; i < 4; i++) {
        if (battleInput->spriteCategoryIcons[i] != NULL) {
            sub_02077870(battleInput->spriteCategoryIcons[i]);
            sub_02077868(spriteManager, 20029 + i);
            battleInput->spriteCategoryIcons[i] = NULL;
        }
    }
}

static void ov12_02268C30(BattleInput *battleInput, int moveType, int movePos) {
    ov06_0221BA1C(BattleSystem_GetPaletteData(battleInput->battleSystem), moveType, HEAP_ID_BATTLE, PLTTBUF_SUB_BG, 8 + movePos);
}

static void ov12_02268C4C(BattleInput *battleInput, int movePos) {
    PaletteData *palette;
    int i;

    palette = BattleSystem_GetPaletteData(battleInput->battleSystem);

    for (i = movePos; i < 4; i++) {
        ov12_02268EE4(battleInput, &ov12_0226E258[i], &ov12_0226E2A8[i], 3, 0);
        PaletteData_LoadPalette(palette, &battleInput->paletteBuffer[14 * 16], PLTTBUF_SUB_BG, (8 + i) * 16, 0x20);
    }
}

static void ov12_02268CA0(BattleInput *battleInput, int textObjId) {
    PaletteData *palette;
    const u8 paletteNo[] = { 6, 12, 13, 5 };

    BgConfig *bgConfig = BattleSystem_GetBgConfig(battleInput->battleSystem);
    palette = BattleSystem_GetPaletteData(battleInput->battleSystem);

    ov12_02268EE4(battleInput, &ov12_0226E238[textObjId], &ov12_0226E2F8[textObjId], 4, 0);

    PaletteData_LoadPalette(palette, &battleInput->paletteBuffer[14 * 16], PLTTBUF_SUB_BG, paletteNo[textObjId] * 16, 0x20);
    ScheduleBgTilemapBufferTransfer(bgConfig, 4);
    FillBgTilemapRect(bgConfig, 5, (0x6000 / 0x20 - 1), ov12_0226E2F8[textObjId].rect.left, ov12_0226E2F8[textObjId].rect.top, ov12_0226E2F8[textObjId].rect.right - ov12_0226E2F8[textObjId].rect.left + 1, ov12_0226E2F8[textObjId].rect.bottom - ov12_0226E2F8[textObjId].rect.top + 1, 17);
    ScheduleBgTilemapBufferTransfer(bgConfig, 5);
}

static void ov12_02268D5C(void) {
    for (int i = 0; i < 4; i++) {
        if (GF_BG_LYR_SUB_0 + i != GF_BG_LYR_SUB_2) {
            ToggleBgLayer(GF_BG_LYR_SUB_0 + i, GF_PLANE_TOGGLE_OFF);
        } else {
            ToggleBgLayer(GF_BG_LYR_SUB_0 + i, GF_PLANE_TOGGLE_ON);
        }
    }
}

static void ov12_02268D88(BattleInput *battleInput, int param1, int param2) {
    if (param1 == 1) {
        BattleInput_FreePersistentResources(battleInput);
    }

    if (param2 == 1) {
        SysTask_CreateOnVWaitQueue(ov12_0226989C, battleInput, 10);
    }
}

static void BattleInput_FreePersistentResources(BattleInput *battleInput) {
    BattleInput_DeleteAndFreeTypeIconGraphics(battleInput);
    BattleInput_DeleteAndFreeCategoryIconGraphics(battleInput);
    BattleInput_DeleteTextObjects(battleInput);
    BattleInput_FreePokemonIconResources(battleInput);
    BattleInput_DeletePokemonIconSprites(battleInput);
    BattleInput_DeleteBugContestGraphics(battleInput);
}

static void BattleInput_GetMonsHitArray(BattleInput *battleInput, u8 *monsHit, int checkMonExists) {
    BattleInputTargetMenu *menu;
    int i;
    u8 battlerIdBuffer[6];
    int battlerId;

    menu = &battleInput->menu.target;
    ov12_0223C1A0(battleInput->battleSystem, battlerIdBuffer);

    for (i = 0; i < 4; i++) {
        battlerId = battlerIdBuffer[2 + i];

        if ((checkMonExists == TRUE) && (menu->targetMons[battlerId].hide == FALSE)) {
            monsHit[i] = 0;
        } else {
            monsHit[i] = sMoveRangeHitMons[battleInput->monTargetType][i];
        }
    }
}

static void ov12_02268E2C(BattleInput *battleInput, int param1, u8 *monsHit, int checkExists) {
    BattleInputTargetMenu *menu;
    int i;

    menu = &battleInput->menu.target;

    switch (battleInput->monTargetType) {
    case TARGET_ANY:
    case TARGET_ANY_NOT_PLAYER_LEFT:
    case TARGET_ANY_NOT_PLAYER_RIGHT:
    case TARGET_ANY_ALLY:
    case TARGET_ANY_OPPONENT:
        for (i = 0; i < 4; i++) {
            if (i == param1 - 1) {
                monsHit[i] = 1;
            } else {
                monsHit[i] = 0;
            }
        }
        break;
    default:
        BattleInput_GetMonsHitArray(battleInput, monsHit, checkExists);
        break;
    }
}

static void BattleInput_StartFeedbackTask(SysTaskFunc task, BattleInput *battleInput) {
    GF_ASSERT(battleInput->feedbackTask == NULL);

    MI_CpuClear8(&battleInput->feedback, sizeof(BattleInputFeedback));
    battleInput->feedbackTask = SysTask_CreateOnMainQueue(task, battleInput, 1300);
}

static void BattleInput_DestroyFeedbackTask(BattleInput *battleInput) {
    if (battleInput->feedbackTask != NULL) {
        SysTask_Destroy(battleInput->feedbackTask);
        battleInput->feedbackTask = NULL;
        MI_CpuClear8(&battleInput->feedback, sizeof(BattleInputFeedback));
    }
}

static void BattleInput_Deadstriped_02268EDC(BattleInput *battleInput, int touchInput) {
}

static void BattleInput_Deadstriped_02268EE0(BattleInput *battleInput, int unused) {
}

static void ov12_02268EE4(BattleInput *battleInput, const s16 *offsets, const TouchscreenHitbox *hitbox, int bufferIndex, int offsetIndex) {
    int x, y;
    BgConfig *bgConfig;
    u16 *src, *dest;
    u16 *screenBuffer, *writeBuffer;
    int offset;

    bgConfig = BattleSystem_GetBgConfig(battleInput->battleSystem);
    src = GetBgTilemapBuffer(bgConfig, 4);
    screenBuffer = battleInput->screenBuffer[bufferIndex];
    offset = offsets[offsetIndex];

    for (y = hitbox->rect.top; y <= hitbox->rect.bottom; y++) {
        dest = &src[y * 32];
        writeBuffer = &screenBuffer[y * 32];

        for (x = hitbox->rect.left; x <= hitbox->rect.right; x++) {
            dest[x] = writeBuffer[x] + offset;
        }
    }

    ScheduleBgTilemapBufferTransfer(bgConfig, 4);
}

static void Task_ButtonFeedback(SysTask *task, void *data) {
    BattleInput *battleInput = data;
    BgConfig *bgConfig = BattleSystem_GetBgConfig(battleInput->battleSystem);
    int x, y;

    switch (battleInput->feedback.state) {
    case 0:
        // Button down
        ov12_02268EE4(battleInput, battleInput->feedback.button.screenOffsets, battleInput->feedback.button.unk8, battleInput->feedback.button.unk10, 2);
        sub_02013794(battleInput->textObj[battleInput->feedback.button.textObjId].textObj, &x, &y);
        sub_020136B4(battleInput->textObj[battleInput->feedback.button.textObjId].textObj, x, y - 2);

        if ((battleInput->feedback.button.pokemonIconIndex != 0xFF) && (battleInput->spritePokemonIcons[battleInput->feedback.button.pokemonIconIndex] != NULL)) {
            ManagedSprite_OffsetPositionXY(battleInput->spritePokemonIcons[battleInput->feedback.button.pokemonIconIndex], 0, -2);
        }

        battleInput->feedback.state++;
        break;
    case 1:
        // Wait until animation is finished
        battleInput->feedback.delay++;

        if (battleInput->feedback.delay <= 0) {
            break;
        }

        battleInput->feedback.delay = 0;
        battleInput->feedback.state++;
        // fallthrough
    case 2:
        // Button up
        ov12_02268EE4(battleInput, battleInput->feedback.button.screenOffsets, battleInput->feedback.button.unk8, battleInput->feedback.button.unk10, 1);
        sub_02013794(battleInput->textObj[battleInput->feedback.button.textObjId].textObj, &x, &y);
        sub_020136B4(battleInput->textObj[battleInput->feedback.button.textObjId].textObj, x, y + 1);

        if ((battleInput->feedback.button.pokemonIconIndex != 0xFF) && (battleInput->spritePokemonIcons[battleInput->feedback.button.pokemonIconIndex] != NULL)) {
            ManagedSprite_OffsetPositionXY(battleInput->spritePokemonIcons[battleInput->feedback.button.pokemonIconIndex], 0, 1);
        }

        battleInput->feedback.state++;
        break;
    default:
        // Finish task
        battleInput->feedback.delay++;

        if (battleInput->feedback.delay > 0) {
            ov12_02268D88(battleInput, battleInput->feedback.button.shouldDeleteAfter, 0);
            BattleInput_DestroyFeedbackTask(battleInput);
            return;
        }
        break;
    }
}

static void Task_FightMenuButtonFeedback(SysTask *task, void *data) {
    BattleInput *battleInput = data;
    BgConfig *bgConfig;
    int x, y;
    int moveTextObjId, ppMaxTextObjId, ppTextObjId;
    int spriteIndex, moveNo;
    BattleInputFightMenu *menu;

    bgConfig = BattleSystem_GetBgConfig(battleInput->battleSystem);
    menu = &battleInput->menu.fight;

    switch (battleInput->feedback.button.ret) {
    case BATTLE_INPUT_MOVE_1:
        moveTextObjId = MENUTXT_MOVE_1;
        ppMaxTextObjId = MENUTXT_PP_MAX_1;
        ppTextObjId = MENUTXT_PP_1;
        spriteIndex = 0;
        moveNo = menu->moveNo[0];
        break;
    case BATTLE_INPUT_MOVE_2:
        moveTextObjId = 1;
        ppMaxTextObjId = MENUTXT_PP_MAX_2;
        ppTextObjId = MENUTXT_PP_2;
        spriteIndex = 1;
        moveNo = menu->moveNo[1];
        break;
    case BATTLE_INPUT_MOVE_3:
        moveTextObjId = 2;
        ppMaxTextObjId = MENUTXT_PP_MAX_3;
        ppTextObjId = MENUTXT_PP_3;
        spriteIndex = 2;
        moveNo = menu->moveNo[2];
        break;
    case BATTLE_INPUT_MOVE_4:
        moveTextObjId = 3;
        ppMaxTextObjId = MENUTXT_PP_MAX_4;
        ppTextObjId = MENUTXT_PP_4;
        spriteIndex = 3;
        moveNo = menu->moveNo[3];
        break;
    case BATTLE_INPUT_CANCEL:
    default:
        moveTextObjId = 0;
        ppMaxTextObjId = 0;
        ppTextObjId = 0;
        spriteIndex = 0;
        moveNo = 0;
        break;
    }

    switch (battleInput->feedback.state) {
    case 0:
        ov12_02268EE4(battleInput, battleInput->feedback.button.screenOffsets, battleInput->feedback.button.unk8, battleInput->feedback.button.unk10, 2);

        if (battleInput->feedback.button.ret != BATTLE_INPUT_CANCEL) {
            sub_02013794(battleInput->textObj[moveTextObjId].textObj, &x, &y);
            sub_020136B4(battleInput->textObj[moveTextObjId].textObj, x, y - 2);
            sub_02013794(battleInput->textObj[ppMaxTextObjId].textObj, &x, &y);
            sub_020136B4(battleInput->textObj[ppMaxTextObjId].textObj, x, y - 2);
            sub_02013794(battleInput->textObj[ppTextObjId].textObj, &x, &y);
            sub_020136B4(battleInput->textObj[ppTextObjId].textObj, x, y - 2);

            if (moveNo != MOVE_NONE) {
                Sprite_OffsetPositionXY(battleInput->spriteTypeIcons[spriteIndex]->sprite, 0, -2);

                if (battleInput->spriteCategoryIcons[spriteIndex] != NULL) {
                    Sprite_OffsetPositionXY(battleInput->spriteCategoryIcons[spriteIndex]->sprite, 0, -2);
                }
            }
        } else {
            sub_02013794(battleInput->textObj[4].textObj, &x, &y);
            sub_020136B4(battleInput->textObj[4].textObj, x, y - 2);
        }

        battleInput->feedback.state++;
        break;
    case 1:
        battleInput->feedback.delay++;

        if (battleInput->feedback.delay <= 0) {
            break;
        }

        battleInput->feedback.delay = 0;
        battleInput->feedback.state++;
    case 2:
        ov12_02268EE4(battleInput, battleInput->feedback.button.screenOffsets, battleInput->feedback.button.unk8, battleInput->feedback.button.unk10, 1);

        if (battleInput->feedback.button.ret != 0xff) {
            sub_02013794(battleInput->textObj[moveTextObjId].textObj, &x, &y);
            sub_020136B4(battleInput->textObj[moveTextObjId].textObj, x, y + 1);
            sub_02013794(battleInput->textObj[ppMaxTextObjId].textObj, &x, &y);
            sub_020136B4(battleInput->textObj[ppMaxTextObjId].textObj, x, y + 1);
            sub_02013794(battleInput->textObj[ppTextObjId].textObj, &x, &y);
            sub_020136B4(battleInput->textObj[ppTextObjId].textObj, x, y + 1);

            if (moveNo != 0) {
                Sprite_OffsetPositionXY(battleInput->spriteTypeIcons[spriteIndex]->sprite, 0, 1);

                if (battleInput->spriteCategoryIcons[spriteIndex] != NULL) {
                    Sprite_OffsetPositionXY(battleInput->spriteCategoryIcons[spriteIndex]->sprite, 0, 1);
                }
            }
        } else {
            sub_02013794(battleInput->textObj[4].textObj, &x, &y);
            sub_020136B4(battleInput->textObj[4].textObj, x, y + 1);
        }

        battleInput->feedback.state++;
        break;
    default:
        battleInput->feedback.delay++;

        if (battleInput->feedback.delay > 0) {
            ov12_02268EE4(battleInput, battleInput->feedback.unkBugContest.unk4, battleInput->feedback.unkBugContest.unk8, battleInput->feedback.button.unk10, 0);
            ov12_02268D88(battleInput, 1, 1);
            BattleInput_DestroyFeedbackTask(battleInput);
            return;
        }
        break;
    }
}

static void Task_TargetMenuButtonFeedback(SysTask *task, void *data) {
    BattleInput *battleInput = data;
    BgConfig *bgConfig;
    int i, x, y;
    u8 v4[4];

    bgConfig = BattleSystem_GetBgConfig(battleInput->battleSystem);

    switch (battleInput->feedback.state) {
    case 0:
        ov12_02268E2C(battleInput, battleInput->feedback.monSelect.ret, v4, 1);

        for (i = 0; i < 4; i++) {
            if (v4[i] == 1) {
                ov12_02268EE4(battleInput, sTargetMenuButtonsScreenOffsets[i], &ov12_0226E348[i], 4, 2);

                if (battleInput->textObj[0 + i].textObj != 0) {
                    sub_02013794(battleInput->textObj[0 + i].textObj, &x, &y);
                    sub_020136B4(battleInput->textObj[0 + i].textObj, x, y + -2);
                }

                if (battleInput->spritePokemonIcons[i] != 0) {
                    ManagedSprite_OffsetPositionXY(battleInput->spritePokemonIcons[i], 0, -2);
                }
            }
        }

        battleInput->feedback.state++;
        break;
    case 1:
        battleInput->feedback.delay++;

        if (battleInput->feedback.delay <= 0) {
            break;
        }

        battleInput->feedback.delay = 0;
        battleInput->feedback.state++;
    case 2:
        ov12_02268E2C(battleInput, battleInput->feedback.monSelect.ret, v4, 1);

        for (i = 0; i < 4; i++) {
            if (v4[i] == 1) {
                ov12_02268EE4(battleInput, sTargetMenuButtonsScreenOffsets[i], &ov12_0226E348[i], 4, 1);

                if (battleInput->textObj[0 + i].textObj != 0) {
                    sub_02013794(battleInput->textObj[0 + i].textObj, &x, &y);
                    sub_020136B4(battleInput->textObj[0 + i].textObj, x, y + 1);
                }

                if (battleInput->spritePokemonIcons[i] != 0) {
                    ManagedSprite_OffsetPositionXY(battleInput->spritePokemonIcons[i], 0, 1);
                }
            }
        }

        battleInput->feedback.state++;
        break;
    case 3:
        battleInput->feedback.delay++;

        if (battleInput->feedback.delay > 0) {
            battleInput->feedback.delay = 0;
            battleInput->feedback.state++;
        }
        break;
    default:
        ov12_02268D88(battleInput, 1, 1);
        BattleInput_DestroyFeedbackTask(battleInput);
        return;
    }
}

static int GetPPTextColor(int pp, int maxPp) {
    if (pp == 0) {
        return MAKE_TEXT_COLOR(7, 8, 0);
    }

    if (maxPp == pp) {
        return MAKE_TEXT_COLOR(1, 2, 0);
    }

    if (maxPp <= 2) {
        if (pp == 1) {
            return MAKE_TEXT_COLOR(5, 6, 0);
        }
    } else if (maxPp <= 7) {
        switch (pp) {
        case 1:
            return MAKE_TEXT_COLOR(5, 6, 0);
        case 2:
            return MAKE_TEXT_COLOR(3, 4, 0);
        }
    } else {
        if (pp <= maxPp / 4) {
            return MAKE_TEXT_COLOR(5, 6, 0);
        }

        if (pp <= maxPp / 2) {
            return MAKE_TEXT_COLOR(3, 4, 0);
        }
    }

    return MAKE_TEXT_COLOR(1, 2, 0);
}

static void Task_BattleMenuSlideIn(SysTask *task, void *data) {
    BattleMenuSlideIn *menuSlideIn = data;
    BgConfig *bgConfig = BattleSystem_GetBgConfig(menuSlideIn->battleInput->battleSystem);

    switch (menuSlideIn->state) {
    case 0:
        menuSlideIn->x += ((255 * 100) / 4);
        menuSlideIn->y -= ((40 * 100) / 4);
        menuSlideIn->xSet = ((255 * 100) - menuSlideIn->x) / 100;
        menuSlideIn->ySet = -menuSlideIn->y / 100;

        if ((menuSlideIn->x >= 0) || (menuSlideIn->y <= 0)) {
            menuSlideIn->x = 0;
            menuSlideIn->y = (18 * 8);
            menuSlideIn->xSet = 0 / 100;
            menuSlideIn->ySet = 0 / 100;
            menuSlideIn->state++;
        }
        break;
    case 1:
        menuSlideIn->battleInput->isTouchDisabled = FALSE;
        SysTask_Destroy(menuSlideIn->vblankTask);
        HBlankInterruptDisable();
        GXS_SetVisibleWnd(GX_WNDMASK_NONE);
        BattleInput_Deadstriped_022698AC(menuSlideIn->battleInput, 1);
        menuSlideIn->state++;
        break;
    default:
        if (ov12_022698B0(menuSlideIn->battleInput) == 0) {
            break;
        }

        BgSetPosTextAndCommit(bgConfig, 4, BG_POS_OP_SET_X, 0);
        BgSetPosTextAndCommit(bgConfig, 4, BG_POS_OP_SET_Y, 0);
        BgSetPosTextAndCommit(bgConfig, 5, BG_POS_OP_SET_X, 0);
        BgSetPosTextAndCommit(bgConfig, 5, BG_POS_OP_SET_Y, 0);
        ov12_0223BB64(menuSlideIn->battleInput->battleSystem, 1);
        Heap_Free(data);
        SysTask_Destroy(task);

        return;
    }
}

static void VBlankTask_BattleMenuSlideIn(SysTask *task, void *data) {
    BattleMenuSlideIn *menuSlideIn = data;
    s32 xSet, ySet, x;

    BgConfig *bgConfig = BattleSystem_GetBgConfig(menuSlideIn->battleInput->battleSystem);

    if (menuSlideIn->battlerId == 4) {
        x = 255 - menuSlideIn->xSet;

        if (x > 0) {
            x = 0;
        }

        BgSetPosTextAndCommit(bgConfig, 4, BG_POS_OP_SET_X, x);
        BgSetPosTextAndCommit(bgConfig, 5, BG_POS_OP_SET_X, 255 - menuSlideIn->xSet);
        xSet = -menuSlideIn->x / 100;
    } else {
        x = menuSlideIn->xSet;

        if (x < 0) {
            x = 0;
        }

        BgSetPosTextAndCommit(bgConfig, 4, BG_POS_OP_SET_X, x);
        BgSetPosTextAndCommit(bgConfig, 5, BG_POS_OP_SET_X, menuSlideIn->xSet);

        xSet = 255 + menuSlideIn->x / 100;
    }

    BgSetPosTextAndCommit(bgConfig, 4, BG_POS_OP_SET_Y, 0);
    BgSetPosTextAndCommit(bgConfig, 5, BG_POS_OP_SET_Y, 0);

    ySet = (18 * 8) + (menuSlideIn->y) / 100;

    if (xSet < 0) {
        xSet = 0;
    } else if (xSet > 255) {
        xSet = 255;
    }

    if (ySet > 192) {
        ySet = 192;
    } else if (ySet < 0) {
        ySet = 0;
    }

    if (menuSlideIn->battlerId == 4) {
        G2S_SetWnd0Position(0, 0, xSet, (18 * 8));
    } else {
        if (xSet == 0) {
            xSet = 1;
        }

        G2S_SetWnd0Position(xSet, 0, 0, (18 * 8));
    }

    G2S_SetWnd1Position(0, (18 * 8), 255, ySet);
    menuSlideIn->unk_10 = menuSlideIn->ySet;
}

static void HBlankCB_BattleMenuSlideIn(void *data) {
    BattleMenuSlideIn *menuSlideIn = data;
    s32 vCnt, x;

    vCnt = GX_GetVCount();

    if (vCnt == (18 * 8)) {
        BgConfig *bgConfig = BattleSystem_GetBgConfig(menuSlideIn->battleInput->battleSystem);

        BgSetPosTextAndCommit(bgConfig, 4, BG_POS_OP_SET_X, 0);
        BgSetPosTextAndCommit(bgConfig, 4, BG_POS_OP_SET_Y, menuSlideIn->unk_10);
        BgSetPosTextAndCommit(bgConfig, 5, BG_POS_OP_SET_X, 0);
        BgSetPosTextAndCommit(bgConfig, 5, BG_POS_OP_SET_Y, menuSlideIn->unk_10);
    } else if (vCnt > 192) {
        BgConfig *bgConfig = BattleSystem_GetBgConfig(menuSlideIn->battleInput->battleSystem);

        if (menuSlideIn->battlerId == 4) {
            x = 255 - menuSlideIn->xSet;

            if (x > 0) {
                x = 0;
            }

            BgSetPosTextAndCommit(bgConfig, 4, BG_POS_OP_SET_X, 255 - menuSlideIn->xSet);
            BgSetPosTextAndCommit(bgConfig, 5, BG_POS_OP_SET_X, 255 - menuSlideIn->xSet);
        } else {
            x = menuSlideIn->xSet;

            if (x < 0) {
                x = 0;
            }

            BgSetPosTextAndCommit(bgConfig, 4, BG_POS_OP_SET_X, menuSlideIn->xSet);
            BgSetPosTextAndCommit(bgConfig, 5, BG_POS_OP_SET_X, menuSlideIn->xSet);
        }

        BgSetPosTextAndCommit(bgConfig, 4, BG_POS_OP_SET_Y, 0);
        BgSetPosTextAndCommit(bgConfig, 5, BG_POS_OP_SET_Y, 0);
    }
}

static void ov12_02269830(SysTask *task, void *data) {
    BattleInput *battleInput = data;
    const BattleMenuTemplate *menu;
    int i;

    menu = &sBattleMenuTemplates[battleInput->curMenuId];

    for (i = 0; i < 4; i++) {
        if (menu->unk_04_val2[i] == 0xffff) {
            ToggleBgLayer(GF_BG_LYR_SUB_0 + i, GF_PLANE_TOGGLE_OFF);
        } else {
            ToggleBgLayer(GF_BG_LYR_SUB_0 + i, GF_PLANE_TOGGLE_ON);
        }
    }

    for (i = 0; i < 4; i++) {
        SetBgPriority(GF_BG_LYR_SUB_0 + i, (u8)menu->priority[i]);
    }

    SysTask_Destroy(task);
}

static void ov12_0226989C(SysTask *task, void *data) {
    ov12_02268D5C();
    SysTask_Destroy(task);
}

void BattleInput_Deadstriped_022698AC(BattleInput *battleInput, int unused) {
}

int ov12_022698B0(BattleInput *battleInput) {
    if (battleInput->unused_664 == NULL) {
        // always returns TRUE
        return TRUE;
    }

    return FALSE;
}

static void Task_FadeInBattleMenuBackground(SysTask *task, void *data) {
    BattleInput *battleInput = data;
    PaletteData *palette = BattleSystem_GetPaletteData(battleInput->battleSystem);

    if (PaletteData_GetSelectedBuffersBitmask(palette) != 0) {
        return;
    }

    PaletteData_BlendPalette(palette, PLTTBUF_SUB_BG, 1, 1, battleInput->fadeCur >> 8, 32311);

    if (battleInput->fadeDir == 0) {
        battleInput->fadeCur += 0x200;
    } else {
        battleInput->fadeCur -= 0x200;
    }

    if (battleInput->fadeCur >= 17 << 8) {
        battleInput->fadeCur = 15 << 8;
        battleInput->fadeDir = 1;
    } else if (battleInput->fadeCur <= 0) {
        battleInput->fadeCur = 1 << 8;
        battleInput->fadeDir = 0;
    }
}

static void Task_BattleMenuMessageWaitForTouchResponse(SysTask *task, void *data) {
    BattleInput *battleInput = data;
    PaletteData *palette;
    u16 *fadedBuffer;
    int size;
    int msgSkip, msgWait;

    msgSkip = TextFlags_GetHasSpedUpInput();
    msgWait = TextFlags_GetHasContinuedInput();

    TextFlags_ResetHasSpedUpInput();
    TextFlags_ResetHasContinuedInput();

    palette = BattleSystem_GetPaletteData(battleInput->battleSystem);

    if (PaletteData_GetSelectedBuffersBitmask(palette) != 0) {
        return;
    }

    fadedBuffer = PaletteData_GetFadedBuf(palette, PLTTBUF_SUB_BG);
    size = 16;

    if (gSystem.touchHeld && ((msgSkip == 1) || (msgWait == 1))) {
        // When using the touch screen to advance messages, set the background palette
        // to the saved "background touch response" palette
        if (memcmp(&fadedBuffer[8], &battleInput->bgPalNormal[8], size) == 0) {
            if (BattleSystem_IsInFrontier(battleInput->battleSystem)) {
                MI_CpuCopy16(&battleInput->bgPalTouch[0], &fadedBuffer[0], 0x20);
                MI_CpuCopy16(&battleInput->bgPalTouch[16], &fadedBuffer[7 * 16], 0x20);
            } else {
                MI_CpuCopy16(&battleInput->bgPalTouch[8], &fadedBuffer[8], size);
            }
        }
    } else {
        // If either the message isn't advanced this frame or if no touch input is
        // received, return the background palette to the "normal" palette
        if (memcmp(&fadedBuffer[8], &battleInput->bgPalTouch[8], size) == 0) {
            if (BattleSystem_IsInFrontier(battleInput->battleSystem)) {
                MI_CpuCopy16(&battleInput->bgPalNormal[0], &fadedBuffer[0], 0x20);
                MI_CpuCopy16(&battleInput->bgPalNormal[16], &fadedBuffer[7 * 16], 0x20);
            } else {
                MI_CpuCopy16(&battleInput->bgPalNormal[8], &fadedBuffer[8], size);
            }
        }
    }
}

static int BattleInput_CheckCursorInput(BattleInput *battleInput) {
    BattleMenuCursor *cursor;
    const BattleMenuTemplate *menu;

    cursor = &battleInput->menuCursor;
    menu = &sBattleMenuTemplates[battleInput->curMenuId];

    if (menu->funcCursor == NULL) {
        return TOUCH_MENU_NO_INPUT;
    }

    if (cursor->enabled == FALSE) {
        if ((battleInput->keyPressed == TRUE) || (gSystem.newKeys & (PAD_BUTTON_A | PAD_BUTTON_B | PAD_BUTTON_X | PAD_BUTTON_Y | PAD_KEY_RIGHT | PAD_KEY_LEFT | PAD_KEY_UP | PAD_KEY_DOWN))) {
            if (battleInput->keyPressed == FALSE) {
                PlaySE(SEQ_SE_DP_SELECT);
            }

            cursor->enabled = TRUE;
            battleInput->keyPressed = FALSE;
            menu->funcCursor(battleInput, TRUE);
        }

        return TOUCH_MENU_NO_INPUT;
    }

    return menu->funcCursor(battleInput, FALSE);
}

static int BattleInput_CursorMove_MainMenu(BattleInput *battleInput, int shouldInitialize) {
    BattleMenuCursor *cursor;
    u32 key;
    const BattleMenuTemplate *menu;
    int i, input, battlerId;
    BattleCursorPosition *cursorPos;

    cursor = &battleInput->menuCursor;
    menu = &sBattleMenuTemplates[battleInput->curMenuId];
    battlerId = BattleSystem_GetBattlerFromBattlerType(battleInput->battleSystem, battleInput->battlerType);
    cursorPos = ov12_02261280(BattleSystem_GetOpponentData(battleInput->battleSystem, battlerId));

    if (shouldInitialize == TRUE) {
        cursor->menuX = cursorPos->commandX;
        cursor->menuY = cursorPos->commandY;
        input = sCursorArrayMainMenu[cursor->menuY][cursor->menuX];
        ov12_0226BB1C(battleInput->cursor, menu->touchscreenRect[input].rect.left + 8, menu->touchscreenRect[input].rect.right - 8, menu->touchscreenRect[input].rect.top + 8, menu->touchscreenRect[input].rect.bottom - 8, FX32_CONST(272));
        return TOUCH_MENU_NO_INPUT;
    }

    switch (battleInput->curMenuId) {
    case BATTLE_MENU_6:
    case BATTLE_MENU_5:
        key = BattleCursor_CheckKeyInput(cursor, 1, 1, sCursorArrayMainMenu[0]);
        break;
    default:
        input = sCursorArrayMainMenu[cursor->menuY][cursor->menuX];

        if ((input == CURSOR_INPUT_RUN) && (gSystem.newKeys & PAD_KEY_UP)) {

        } else {
            key = BattleCursor_CheckKeyInput(cursor, 3, 2, sCursorArrayMainMenu[0]);

            if ((key == 0) && (input == CURSOR_INPUT_FIGHT)) {
                if (gSystem.newKeys & PAD_KEY_LEFT) {
                    cursor->menuX = 0;
                    cursor->menuY = 1;
                    PlaySE(SEQ_SE_DP_SELECT);
                    key = PAD_KEY_LEFT;
                } else if (gSystem.newKeys & PAD_KEY_RIGHT) {
                    cursor->menuX = 2;
                    cursor->menuY = 1;
                    PlaySE(SEQ_SE_DP_SELECT);
                    key = PAD_KEY_RIGHT;
                }
            }
        }
        break;
    }

    switch (key) {
    case PAD_KEY_UP:
    case PAD_KEY_DOWN:
    case PAD_KEY_LEFT:
    case PAD_KEY_RIGHT:
        input = sCursorArrayMainMenu[cursor->menuY][cursor->menuX];
        ov12_0226BB1C(battleInput->cursor, menu->touchscreenRect[input].rect.left + 8, menu->touchscreenRect[input].rect.right - 8, menu->touchscreenRect[input].rect.top + 8, menu->touchscreenRect[input].rect.bottom - 8, FX32_CONST(272));
        break;
    case PAD_BUTTON_A:
        return sCursorArrayMainMenu[cursor->menuY][cursor->menuX];
    case PAD_BUTTON_B:
        if (battleInput->unk66F == 1) {
            for (i = 0; i < menu->touchscreenRect[i].rect.top != TOUCHSCREEN_RECTLIST_END; i++) {
                if (BATTLE_INPUT_RUN == menu->touchInput[i]) {
                    return i;
                }
            }
        }
        break;
    }

    return TOUCH_MENU_NO_INPUT;
}

static void BattleInput_CursorSave_MainMenu(BattleInput *battleInput, int input) {
    BattleCursorPosition *cursor;
    int battler, x, y;

    battler = BattleSystem_GetBattlerFromBattlerType(battleInput->battleSystem, battleInput->battlerType);

    if ((input != 3) || (battleInput->cancelRunDisplay == 0)) {
        cursor = ov12_02261280(BattleSystem_GetOpponentData(battleInput->battleSystem, battler));

        for (y = 0; y < 2; y++) {
            for (x = 0; x < 3; x++) {
                if (input == sCursorArrayMainMenu[y][x]) {
                    cursor->commandX = x;
                    cursor->commandY = y;

                    return;
                }
            }
        }
    }
}

static int BattleInput_CursorMove_PalParkMenu(BattleInput *battleInput, int shoulInit) {
    BattleMenuCursor *cursor;
    u32 key;
    const BattleMenuTemplate *menu;
    int input;

    cursor = &battleInput->menuCursor;
    menu = &sBattleMenuTemplates[battleInput->curMenuId];

    if (shoulInit == TRUE) {
        cursor->menuX = 0;
        cursor->menuY = 0;
        input = sCursorArrayPalParkMenu[cursor->menuY][cursor->menuX];
        ov12_0226BB1C(battleInput->cursor, menu->touchscreenRect[input].rect.left + 8, menu->touchscreenRect[input].rect.right - 8, menu->touchscreenRect[input].rect.top + 8, menu->touchscreenRect[input].rect.bottom - 8, FX32_CONST(272));
        return TOUCH_MENU_NO_INPUT;
    }

    key = BattleCursor_CheckKeyInput(cursor, 1, 2, sCursorArrayPalParkMenu[0]);

    switch (key) {
    case PAD_KEY_UP:
    case PAD_KEY_DOWN:
    case PAD_KEY_LEFT:
    case PAD_KEY_RIGHT:
        input = sCursorArrayPalParkMenu[cursor->menuY][cursor->menuX];
        ov12_0226BB1C(battleInput->cursor, menu->touchscreenRect[input].rect.left + 8, menu->touchscreenRect[input].rect.right - 8, menu->touchscreenRect[input].rect.top + 8, menu->touchscreenRect[input].rect.bottom - 8, FX32_CONST(272));
        break;
    case PAD_BUTTON_A:
        return sCursorArrayPalParkMenu[cursor->menuY][cursor->menuX];
    case PAD_BUTTON_B:
        break;
    }

    return TOUCH_MENU_NO_INPUT;
}

static int BattleInput_CursorMove_FightMenu(BattleInput *battleInput, int param1) {
    BattleMenuCursor *cursor;
    u32 keyPressed;
    const BattleMenuTemplate *menuTemplate;
    int input, i;
    u8 cursorArray[3][2];
    BattleInputFightMenu *menu;
    BattleCursorPosition *cursorPos;

    cursorPos = ov12_02261280(BattleSystem_GetOpponentData(battleInput->battleSystem, BattleSystem_GetBattlerFromBattlerType(battleInput->battleSystem, battleInput->battlerType)));
    cursor = &battleInput->menuCursor;
    menuTemplate = &sBattleMenuTemplates[battleInput->curMenuId];
    menu = &battleInput->menu.fight;

    if (param1 == 1) {
        cursor->menuX = cursorPos->moveX;
        cursor->menuY = cursorPos->moveY;
        input = sCursorArrayFightMenu[cursor->menuY][cursor->menuX];

        if ((input != CURSOR_INPUT_FIGHT_CANCEL) && (menu->moveNo[input - 1] == MOVE_NONE)) {
            cursorPos->moveX = 0;
            cursorPos->moveY = 0;
            cursor->menuX = 0;
            cursor->menuY = 0;
            input = sCursorArrayFightMenu[cursor->menuY][cursor->menuX];
        }

        ov12_0226BB1C(battleInput->cursor, menuTemplate->touchscreenRect[input].rect.left + 8, menuTemplate->touchscreenRect[input].rect.right - 8, menuTemplate->touchscreenRect[input].rect.top + 8, menuTemplate->touchscreenRect[input].rect.bottom - 8, FX32_CONST(272));
        return TOUCH_MENU_NO_INPUT;
    }

    MI_CpuCopy8(sCursorArrayFightMenu, cursorArray, 6);
    keyPressed = BattleCursor_CheckKeyInput(cursor, 2, 3, cursorArray[0]);

    switch (keyPressed) {
    case PAD_KEY_UP:
    case PAD_KEY_DOWN:
    case PAD_KEY_LEFT:
    case PAD_KEY_RIGHT:
        input = sCursorArrayFightMenu[cursor->menuY][cursor->menuX];
        ov12_0226BB1C(battleInput->cursor, menuTemplate->touchscreenRect[input].rect.left + 8, menuTemplate->touchscreenRect[input].rect.right - 8, menuTemplate->touchscreenRect[input].rect.top + 8, menuTemplate->touchscreenRect[input].rect.bottom - 8, FX32_CONST(272));
        break;
    case PAD_BUTTON_A:
        return sCursorArrayFightMenu[cursor->menuY][cursor->menuX];
    case PAD_BUTTON_B:
        for (i = 0; i < menuTemplate->touchscreenRect[i].rect.top != TOUCHSCREEN_RECTLIST_END; i++) {
            if (BATTLE_INPUT_CANCEL == menuTemplate->touchInput[i]) {
                return i;
            }
        }

        break;
    }

    return TOUCH_MENU_NO_INPUT;
}

static void BattleInput_CursorSave_FightMenu(BattleInput *battleInput, int input) {
    BattleCursorPosition *cursorPos;
    int battler, x, y;

    if (input == 0) {
        return;
    }

    battler = BattleSystem_GetBattlerFromBattlerType(battleInput->battleSystem, battleInput->battlerType);
    cursorPos = ov12_02261280(BattleSystem_GetOpponentData(battleInput->battleSystem, battler));

    for (y = 0; y < 3; y++) {
        for (x = 0; x < 2; x++) {
            if (input == sCursorArrayFightMenu[y][x]) {
                cursorPos->moveX = x;
                cursorPos->moveY = y;
                return;
            }
        }
    }
}

static int BattleInput_CursorMove_TargetMenu(BattleInput *battleInput, int param1) {
    BattleMenuCursor *cursor;
    u32 keyPressed;
    const BattleMenuTemplate *menuTemplate;
    int battler, input;
    int multiTarget = FALSE;
    u8 moveRange[4], connectRange[4]; // Connect range checks if the mon exists or not
    u8 buttonInputArray[3][2];
    int i, j, menuMaxX, menuMaxY;
    int cursorLeft, cursorRight, cursorTop, cursorBottom, v17, v18;
    int topOpponent, bottomOpponent, leftOpponent, rightOpponent;
    int topPlayer, bottomPlayer, leftPlayer, rightPlayer;
    int cursorLeftBottom, cursorRightBottom;
    int anim;
    BattleCursorPosition *cursorPos;

    cursorPos = ov12_02261280(BattleSystem_GetOpponentData(battleInput->battleSystem, BattleSystem_GetBattlerFromBattlerType(battleInput->battleSystem, battleInput->battlerType)));
    cursor = &battleInput->menuCursor;
    menuTemplate = &sBattleMenuTemplates[battleInput->curMenuId];

    MI_CpuCopy8(sTargetMenuButtonInputArray, buttonInputArray, 3 * 2);

    BattleInput_GetMonsHitArray(battleInput, moveRange, 1);
    BattleInput_GetMonsHitArray(battleInput, connectRange, 0);

    for (i = 0; i < 2; i++) {
        for (j = 0; j < 2; j++) {
            if (connectRange[buttonInputArray[i][j]] == 0) {
                buttonInputArray[i][j] = 0xff;
            }
        }
    }

    switch (battleInput->monTargetType) {
    default:
        // Targets any selected
    case TARGET_ANY:
    case TARGET_PLAYER_LEFT:
    case TARGET_PLAYER_RIGHT:
    case TARGET_ANY_NOT_PLAYER_LEFT:
    case TARGET_ANY_NOT_PLAYER_RIGHT:
    case TARGET_ANY_ALLY:
    case TARGET_ANY_OPPONENT:
        menuMaxX = 2;
        menuMaxY = 3;
        break;
        // Targets all selected
    case TARGET_ALL_OPPONENTS:
    case TARGET_ALL_NOT_PLAYER_LEFT:
    case TARGET_ALL:
    case TARGET_ALL_ALLIES:
    case TARGET_ALL_NOT_PLAYER_RIGHT:
        multiTarget = TRUE;
        menuMaxX = 1;
        menuMaxY = 2;

        if ((connectRange[BATTLER_ENEMY2] == 1) && (connectRange[BATTLER_ENEMY] == 1)) {
            leftOpponent = menuTemplate->touchscreenRect[3].rect.left + 8;
            rightOpponent = menuTemplate->touchscreenRect[1].rect.right - 8;
            topOpponent = menuTemplate->touchscreenRect[3].rect.top + 8;
            bottomOpponent = menuTemplate->touchscreenRect[3].rect.bottom - 8;
        } else if ((connectRange[BATTLER_ENEMY2] == 1) && (connectRange[BATTLER_ENEMY] == 0)) {
            leftOpponent = menuTemplate->touchscreenRect[3].rect.left + 8;
            rightOpponent = menuTemplate->touchscreenRect[3].rect.right - 8;
            topOpponent = menuTemplate->touchscreenRect[3].rect.top + 8;
            bottomOpponent = menuTemplate->touchscreenRect[3].rect.bottom - 8;
        } else if ((connectRange[BATTLER_ENEMY2] == 0) && (connectRange[BATTLER_ENEMY] == 1)) {
            leftOpponent = menuTemplate->touchscreenRect[1].rect.left + 8;
            rightOpponent = menuTemplate->touchscreenRect[1].rect.right - 8;
            topOpponent = menuTemplate->touchscreenRect[1].rect.top + 8;
            bottomOpponent = menuTemplate->touchscreenRect[1].rect.bottom - 8;
        } else {
            leftOpponent = -1;
            rightOpponent = -1;
            topOpponent = -1;
            bottomOpponent = -1;
        }

        if ((connectRange[BATTLER_PLAYER] == 1) && (connectRange[BATTLER_PLAYER2] == 1)) {
            leftPlayer = menuTemplate->touchscreenRect[BATTLER_PLAYER].rect.left + 8;
            rightPlayer = menuTemplate->touchscreenRect[BATTLER_PLAYER2].rect.right - 8;
            topPlayer = menuTemplate->touchscreenRect[BATTLER_PLAYER].rect.top + 8;
            bottomPlayer = menuTemplate->touchscreenRect[BATTLER_PLAYER].rect.bottom - 8;
        } else if ((connectRange[BATTLER_PLAYER] == 1) && (connectRange[BATTLER_PLAYER2] == 0)) {
            leftPlayer = menuTemplate->touchscreenRect[BATTLER_PLAYER].rect.left + 8;
            rightPlayer = menuTemplate->touchscreenRect[BATTLER_PLAYER].rect.right - 8;
            topPlayer = menuTemplate->touchscreenRect[BATTLER_PLAYER].rect.top + 8;
            bottomPlayer = menuTemplate->touchscreenRect[BATTLER_PLAYER].rect.bottom - 8;
        } else if ((connectRange[BATTLER_PLAYER] == 0) && (connectRange[BATTLER_PLAYER2] == 1)) {
            leftPlayer = menuTemplate->touchscreenRect[BATTLER_PLAYER2].rect.left + 8;
            rightPlayer = menuTemplate->touchscreenRect[BATTLER_PLAYER2].rect.right - 8;
            topPlayer = menuTemplate->touchscreenRect[BATTLER_PLAYER2].rect.top + 8;
            bottomPlayer = menuTemplate->touchscreenRect[BATTLER_PLAYER2].rect.bottom - 8;
        } else {
            leftPlayer = -1;
            rightPlayer = -1;
            topPlayer = -1;
            bottomPlayer = -1;
        }

        v17 = -1;
        v18 = -1;
        cursorLeftBottom = -1;
        cursorRightBottom = -1;

        if (leftOpponent == leftPlayer) {
            cursorLeft = leftOpponent;
        } else if ((leftOpponent != -1) && (leftPlayer == -1)) {
            cursorLeft = leftOpponent;
        } else if ((leftOpponent == -1) && (leftPlayer != -1)) {
            cursorLeft = leftPlayer;
        } else {
            cursorLeft = leftOpponent;
            v17 = leftPlayer;
            anim = 2;
        }

        if (rightOpponent == rightPlayer) {
            cursorRight = rightOpponent;
        } else if ((rightOpponent != -1) && (rightPlayer == -1)) {
            cursorRight = rightOpponent;
        } else if ((rightOpponent == -1) && (rightPlayer != -1)) {
            cursorRight = rightPlayer;
        } else {
            cursorRight = rightOpponent;
            v17 = rightPlayer;
            anim = 3;
        }

        if ((topOpponent != -1) && (topPlayer == -1)) {
            cursorTop = topOpponent;
        } else if ((topOpponent == -1) && (topPlayer != -1)) {
            cursorTop = topPlayer;
        } else {
            cursorTop = topOpponent;
            v18 = bottomOpponent;
        }

        if ((bottomOpponent != -1) && (bottomPlayer == -1)) {
            cursorBottom = bottomOpponent;
        } else if ((bottomOpponent == -1) && (bottomPlayer != -1)) {
            cursorBottom = bottomPlayer;
        } else {
            cursorBottom = bottomPlayer;
            v18 = bottomPlayer;

            if (anim == 2) {
                cursorRightBottom = bottomOpponent;
            } else {
                cursorLeftBottom = bottomOpponent;
            }
        }

        break;
    }

    if (param1 == 1) {
        if (multiTarget == FALSE) {
            if (cursorPos->monTargetType == battleInput->monTargetType) {
                cursor->menuX = cursorPos->targetX;
                cursor->menuY = cursorPos->targetY;
            } else if (moveRange[3] == 1) {
                cursor->menuX = 0;
                cursor->menuY = 0;
            } else if (moveRange[1] == 1) {
                cursor->menuX = 1;
                cursor->menuY = 0;
            } else if (moveRange[0] == 1) {
                cursor->menuX = 0;
                cursor->menuY = 1;
            } else {
                cursor->menuX = 1;
                cursor->menuY = 1;
            }

            input = sTargetMenuButtonInputArray[cursor->menuY][cursor->menuX];
            ov12_0226BB1C(battleInput->cursor, menuTemplate->touchscreenRect[input].rect.left + 8, menuTemplate->touchscreenRect[input].rect.right - 8, menuTemplate->touchscreenRect[input].rect.top + 8, menuTemplate->touchscreenRect[input].rect.bottom - 8, FX32_CONST(272));
        } else {
            cursor->menuX = 0;
            cursor->menuY = 0;

            if (((cursorRightBottom == -1) && (cursorLeftBottom == -1)) || (v17 == -1)) {
                ov12_0226BB1C(battleInput->cursor, cursorLeft, cursorRight, cursorTop, cursorBottom, FX32_CONST(272));
            } else if ((cursorRightBottom != -1) && (cursorLeftBottom == -1)) {
                ov12_0226BA4C(battleInput->cursor, cursorLeft, cursorTop, cursorRight, cursorTop, cursorLeft, cursorRightBottom, cursorRight, cursorBottom, FX32_CONST(272));
            } else {
                ov12_0226BA4C(battleInput->cursor, cursorLeft, cursorTop, cursorRight, cursorTop, cursorLeft, cursorBottom, cursorRight, cursorLeftBottom, FX32_CONST(272));
            }

            if (v17 != -1) {
                ov12_0226BB40(battleInput->cursor, v17, v18, anim, FX32_CONST(272));
            }
        }

        return TOUCH_MENU_NO_INPUT;
    }

    if (multiTarget == FALSE) {
        keyPressed = BattleCursor_CheckKeyInput(cursor, menuMaxX, menuMaxY, buttonInputArray[0]);
    } else {
        keyPressed = BattleCursor_CheckKeyInput(cursor, menuMaxX, menuMaxY, NULL);
    }

    switch (keyPressed) {
    case PAD_KEY_UP:
    case PAD_KEY_DOWN:
    case PAD_KEY_LEFT:
    case PAD_KEY_RIGHT:
        if (multiTarget == FALSE) {
            input = sTargetMenuButtonInputArray[cursor->menuY][cursor->menuX];
            ov12_0226BB1C(battleInput->cursor, menuTemplate->touchscreenRect[input].rect.left + 8, menuTemplate->touchscreenRect[input].rect.right - 8, menuTemplate->touchscreenRect[input].rect.top + 8, menuTemplate->touchscreenRect[input].rect.bottom - 8, FX32_CONST(272));
        } else {
            if (cursor->menuY == 0) {
                if (((cursorLeftBottom == -1) && (cursorRightBottom == -1)) || (v17 == -1)) {
                    ov12_0226BB1C(battleInput->cursor, cursorLeft, cursorRight, cursorTop, cursorBottom, FX32_CONST(272));
                } else if ((cursorRightBottom != -1) && (cursorLeftBottom == -1)) {
                    ov12_0226BA4C(battleInput->cursor, cursorLeft, cursorTop, cursorRight, cursorTop, cursorLeft, cursorRightBottom, cursorRight, cursorBottom, FX32_CONST(272));
                } else {
                    ov12_0226BA4C(battleInput->cursor, cursorLeft, cursorTop, cursorRight, cursorTop, cursorLeft, cursorBottom, cursorRight, cursorLeftBottom, FX32_CONST(272));
                }

                if (v17 != -1) {
                    ov12_0226BB40(battleInput->cursor, v17, v18, anim, FX32_CONST(272));
                } else {
                    ov12_0226BB84(battleInput->cursor);
                }
            } else {
                ov12_0226BB1C(battleInput->cursor, menuTemplate->touchscreenRect[4].rect.left + 8, menuTemplate->touchscreenRect[4].rect.right - 8, menuTemplate->touchscreenRect[4].rect.top + 8, menuTemplate->touchscreenRect[4].rect.bottom - 8, FX32_CONST(272));
                ov12_0226BB84(battleInput->cursor);
            }
        }
        break;
    case PAD_BUTTON_A:
        if (multiTarget == TRUE) {
            if (cursor->menuY > 0) {
                return CURSOR_INPUT_TARGET_CANCEL;
            } else {
                for (battler = BATTLER_PLAYER; battler < BATTLER_MAX; battler++) {
                    if (moveRange[battler] == 1) {
                        return CURSOR_INPUT_TARGET_PLAYER_LEFT + battler;
                    }
                }
            }
        } else {
            input = sTargetMenuButtonInputArray[cursor->menuY][cursor->menuX];

            if ((input == CURSOR_INPUT_TARGET_CANCEL) || (moveRange[input] == 1)) {
                return input;
            }
        }
        break;
    case PAD_BUTTON_B:
        return CURSOR_INPUT_TARGET_CANCEL;
    }

    return TOUCH_MENU_NO_INPUT;
}

static void BattleInput_CursorSave_TargetMenu(BattleInput *battleInput, int input) {
    BattleCursorPosition *cursorPos;
    int battler, x, y;

    if (input == CURSOR_INPUT_TARGET_CANCEL) {
        return;
    }

    battler = BattleSystem_GetBattlerFromBattlerType(battleInput->battleSystem, battleInput->battlerType);
    cursorPos = ov12_02261280(BattleSystem_GetOpponentData(battleInput->battleSystem, battler));

    cursorPos->monTargetType = battleInput->monTargetType;

    for (y = 0; y < 3; y++) {
        for (x = 0; x < 2; x++) {
            if (input == sTargetMenuButtonInputArray[y][x]) {
                cursorPos->targetX = x;
                cursorPos->targetY = y;

                return;
            }
        }
    }
}

static int BattleInput_CursorMove_TwoOptionsMenu(BattleInput *battleInput, int param1) {
    BattleMenuCursor *cursor;
    u32 keyPressed;
    const BattleMenuTemplate *menuTemplate;
    int input;

    cursor = &battleInput->menuCursor;
    menuTemplate = &sBattleMenuTemplates[battleInput->curMenuId];

    if (param1 == 1) {
        input = sTwoOptionsMenuCursorInput[cursor->menuY][cursor->menuX];
        ov12_0226BB1C(battleInput->cursor, menuTemplate->touchscreenRect[input].rect.left + 8, menuTemplate->touchscreenRect[input].rect.right - 8, menuTemplate->touchscreenRect[input].rect.top + 8, menuTemplate->touchscreenRect[input].rect.bottom - 8, FX32_CONST(272));
        return TOUCH_MENU_NO_INPUT;
    }

    keyPressed = BattleCursor_CheckKeyInput(cursor, 1, 2, sTwoOptionsMenuCursorInput[0]);

    switch (keyPressed) {
    case PAD_KEY_UP:
    case PAD_KEY_DOWN:
    case PAD_KEY_LEFT:
    case PAD_KEY_RIGHT:
        input = sTwoOptionsMenuCursorInput[cursor->menuY][cursor->menuX];
        ov12_0226BB1C(battleInput->cursor, menuTemplate->touchscreenRect[input].rect.left + 8, menuTemplate->touchscreenRect[input].rect.right - 8, menuTemplate->touchscreenRect[input].rect.top + 8, menuTemplate->touchscreenRect[input].rect.bottom - 8, FX32_CONST(272));
        break;
    case PAD_BUTTON_A:
        input = sTwoOptionsMenuCursorInput[cursor->menuY][cursor->menuX];
        return input;
    case PAD_BUTTON_B:
        return CURSOR_INPUT_TWO_OPTION_BOTTOM;
    }

    return TOUCH_MENU_NO_INPUT;
}

static u32 BattleCursor_CheckKeyInput(BattleMenuCursor *cursor, int xMax, int yMax, const u8 *moveData) {
    int y, x;
    u32 key;

    if (cursor->menuX >= xMax) {
        cursor->menuX = xMax - 1;
    }

    if (cursor->menuY >= yMax) {
        cursor->menuY = yMax - 1;
    }

    x = cursor->menuX;
    y = cursor->menuY;

    if (gSystem.newKeys & PAD_KEY_UP) {
        cursor->menuY--;

        if (cursor->menuY < 0) {
            cursor->menuY = 0;
        }

        if (moveData != NULL) {
            while (moveData[xMax * cursor->menuY + cursor->menuX] == 0xff) {
                cursor->menuY--;

                if (cursor->menuY < 0) {
                    cursor->menuY = y;
                    break;
                }
            }
        }

        key = PAD_KEY_UP;
    } else if (gSystem.newKeys & PAD_KEY_DOWN) {
        cursor->menuY++;

        if (cursor->menuY >= yMax) {
            cursor->menuY = yMax - 1;
        }

        if (moveData != NULL) {
            while (moveData[xMax * cursor->menuY + cursor->menuX] == 0xff) {
                cursor->menuY++;

                if (cursor->menuY >= yMax) {
                    cursor->menuY = y;
                    break;
                }
            }
        }

        key = PAD_KEY_DOWN;
    } else if (gSystem.newKeys & PAD_KEY_LEFT) {
        cursor->menuX--;

        if (cursor->menuX < 0) {
            cursor->menuX = 0;
        }

        if (moveData != NULL) {
            while (moveData[xMax * cursor->menuY + cursor->menuX] == 0xff) {
                cursor->menuX--;

                if (cursor->menuX < 0) {
                    cursor->menuX = x;
                    break;
                }
            }
        }

        key = PAD_KEY_LEFT;
    } else if (gSystem.newKeys & PAD_KEY_RIGHT) {
        cursor->menuX++;

        if (cursor->menuX >= xMax) {
            cursor->menuX = xMax - 1;
        }

        if (moveData != NULL) {
            while (moveData[xMax * cursor->menuY + cursor->menuX] == 0xff) {
                cursor->menuX++;

                if (cursor->menuX >= xMax) {
                    cursor->menuX = x;
                    break;
                }
            }
        }

        key = PAD_KEY_RIGHT;
    } else if (gSystem.newKeys & PAD_BUTTON_A) {
        key = PAD_BUTTON_A;
    } else if (gSystem.newKeys & PAD_BUTTON_B) {
        key = PAD_BUTTON_B;
    } else {
        return 0;
    }

    if (moveData != NULL) {
        int prevIndex, index;

        prevIndex = moveData[xMax * y + x];
        index = moveData[xMax * cursor->menuY + cursor->menuX];

        if (prevIndex == index) {
            cursor->menuX = x;
            cursor->menuY = y;
        }
    }

    if ((cursor->menuX != x) || (cursor->menuY != y)) {
        PlaySE(SEQ_SE_DP_SELECT);
    } else if (key & PAD_PLUS_KEY_MASK) {
        return 0;
    }

    return key;
}

int BattleInput_GetKeyPressed(BattleInput *battleInput) {
    return battleInput->keyPressed;
}

void BattleInput_SetKeyPressed(BattleInput *battleInput, int key) {
    battleInput->keyPressed = key;
}

static int (*const ov12_0226E260[2])(BattleInput *) = {
    BattleInput_CatchingTutorialCB_Fight,
    BattleInput_CatchingTutorialCB_Move
};

static int BattleInput_CatchingTutorialMain(BattleInput *battleInput) {
    SpriteSystem *spriteSystem = BattleSystem_GetSpriteSystem(battleInput->battleSystem);
    SpriteManager *spriteManager = BattleSystem_GetSpriteManager(battleInput->battleSystem);
    PaletteData *palette = BattleSystem_GetPaletteData(battleInput->battleSystem);
    int ret = TOUCH_MENU_NO_INPUT;

    if (ov12_0223BB04(battleInput->battleSystem) == 0) {
        GF_ASSERT(battleInput->tutorial.state < NELEMS(ov12_0226E260));
        ret = ov12_0226E260[battleInput->tutorial.state](battleInput);
    } else {
        ret = BattleInput_CatchingTutorialCB_Bag(battleInput);
    }

    if (ret != TOUCH_MENU_NO_INPUT) {
        battleInput->tutorial.substate = 0;
        battleInput->tutorial.delay = 0;
        battleInput->tutorial.state++;
    }

    return ret;
}

static int BattleInput_CatchingTutorialCB_Fight(BattleInput *battleInput) {
    switch (battleInput->tutorial.substate) {
    case 0:
        ov12_0226BCFC(battleInput->tutorial.finger, 128, 59, FX32_CONST(272));
        ov12_0226BD4C(battleInput->tutorial.finger, 60);
        battleInput->tutorial.substate++;
        break;
    default:
        if (ov12_0226BD50(battleInput->tutorial.finger) == TRUE) {
            battleInput->tutorial.substate++;
            return CURSOR_INPUT_FIGHT;
        }

        break;
    }

    return TOUCH_MENU_NO_INPUT;
}

static int BattleInput_CatchingTutorialCB_Move(BattleInput *battleInput) {
    switch (battleInput->tutorial.substate) {
    case 0:
        ov12_0226BCFC(battleInput->tutorial.finger, 64, 21, FX32_CONST(272));
        ov12_0226BD4C(battleInput->tutorial.finger, 60);
        battleInput->tutorial.substate++;
        break;
    default:
        if (ov12_0226BD50(battleInput->tutorial.finger) == TRUE) {
            battleInput->tutorial.substate++;
            return CURSOR_INPUT_MOVE_1;
        }
        break;
    }

    return TOUCH_MENU_NO_INPUT;
}

static int BattleInput_CatchingTutorialCB_Bag(BattleInput *battleInput) {
    switch (battleInput->tutorial.substate) {
    case 0:
        battleInput->tutorial.delay++;

        if (battleInput->tutorial.delay > 60) {
            battleInput->tutorial.delay = 0;
            battleInput->tutorial.substate++;
        }
        break;
    case 1:
        ov12_0226BCFC(battleInput->tutorial.finger, 40, 170 - 25, FX32_CONST(272));
        ov12_0226BD4C(battleInput->tutorial.finger, 60);
        battleInput->tutorial.substate++;
        break;
    default:
        if (ov12_0226BD50(battleInput->tutorial.finger) == 1) {
            battleInput->tutorial.substate++;
            return CURSOR_INPUT_BAG;
        }
        break;
    }

    return TOUCH_MENU_NO_INPUT;
}

void BattleInput_PrintSystemMessage(BattleInput *battleInput, int index) {
    BgConfig *bgConfig = BattleSystem_GetBgConfig(battleInput->battleSystem);
    PaletteData *palette = BattleSystem_GetPaletteData(battleInput->battleSystem);

    GF_ASSERT(battleInput->curMenuId == 18);

    LoadUserFrameGfx1(bgConfig, GF_BG_LYR_SUB_1, 0x20, 1, 0, HEAP_ID_BATTLE);
    PaletteData_LoadPaletteSlotFromHardware(palette, PLTTBUF_SUB_BG, 1 * 16, 0x20);

    int fillVal = 0x20, paletteNo = 1;
    int x, y, width, height;

    x = 1;
    y = 6;
    width = 30;
    height = 6;

    FillBgTilemapRect(bgConfig, 5, fillVal, x, y, 1, 1, paletteNo);
    FillBgTilemapRect(bgConfig, 5, fillVal + 1, x + 1, y, width - 2, 1, paletteNo);
    FillBgTilemapRect(bgConfig, 5, fillVal + 2, x + width - 1, y, 1, 1, paletteNo);
    FillBgTilemapRect(bgConfig, 5, fillVal + 3, x, y + 1, 1, height - 2, paletteNo);
    FillBgTilemapRect(bgConfig, 5, fillVal + 5, x + width - 1, y + 1, 1, height - 2, paletteNo);
    FillBgTilemapRect(bgConfig, 5, fillVal + 6, x, y + height - 1, 1, 1, paletteNo);
    FillBgTilemapRect(bgConfig, 5, fillVal + 7, x + 1, y + height - 1, width - 2, 1, paletteNo);
    FillBgTilemapRect(bgConfig, 5, fillVal + 8, x + width - 1, y + height - 1, 1, 1, paletteNo);
    FillBgTilemapRect(bgConfig, 5, fillVal + 4, x + 1, y + 1, width - 2, height - 2, paletteNo);
    ScheduleBgTilemapBufferTransfer(bgConfig, 5);

    String *src;
    MsgData *msgLoader = BattleSystem_GetMessageLoader(battleInput->battleSystem);
    int i;
    const u16 stopMsgId[][2] = {
        // Playback paused
        // Please wait
        { msg_0197_01261, msg_0197_01262 },
        // Data is corrupted
        // Playback canceled
        { msg_0197_01263, msg_0197_01264 },
        // Battle is too long
        // Playback canceled
        { msg_0197_01265, msg_0197_01266 },
    };

    for (i = 0; i < 2; i++) {
        if (battleInput->textObj[1 + i].textObj != NULL) {
            GF_ASSERT(FALSE);
            return;
        }

        src = NewString_ReadMsgData(msgLoader, stopMsgId[index][i]);

        BattleInput_CreateTextObject(battleInput, &battleInput->textObj[1 + i], src, 0, MAKE_TEXT_COLOR(1, 2, 0), 4, 20023, 1 * 8 + 8, 6 * 8 + 16 + 16 * i, 0, NULL);
        String_Delete(src);
    }
}

u8 BattleInput_GetCancelRunFlag(BattleInput *battleInput) {
    return battleInput->cancelRunDisplay;
}

static void BattleInput_CreateBugContestGraphics(BattleInput *battleInput) {
    GF_ASSERT(battleInput->spriteBugNet == NULL);

    SpriteSystem *spriteSystem = BattleSystem_GetSpriteSystem(battleInput->battleSystem);
    SpriteManager *spriteManager = BattleSystem_GetSpriteManager(battleInput->battleSystem);
    NARC *narc = NARC_New(NARC_a_0_0_8, HEAP_ID_BATTLE);

    // Bug catching contest net/ball graphics
    SpriteSystem_LoadCharResObjFromOpenNarc(spriteSystem, spriteManager, narc, 343, 1, NNS_G2D_VRAM_TYPE_2DSUB, 20040);
    SpriteSystem_LoadCellResObjFromOpenNarc(spriteSystem, spriteManager, narc, 344, 1, 20022);
    SpriteSystem_LoadAnimResObjFromOpenNarc(spriteSystem, spriteManager, narc, 345, 1, 20022);

    NARC_Delete(narc);

    battleInput->spriteSportBall = SpriteSystem_NewSprite(spriteSystem, spriteManager, &sSpriteTemplateSportBall);
    ManagedSprite_SetPositionXYWithSubscreenOffset(battleInput->spriteSportBall, 208, 16, 0x110000);
    ManagedSprite_TickFrame(battleInput->spriteSportBall);

    battleInput->spriteBugNet = SpriteSystem_NewSprite(spriteSystem, spriteManager, &sSpriteTemplateBugNet);
    Sprite_SetAnimCtrlSeq(battleInput->spriteBugNet->sprite, 1);
    ManagedSprite_SetPositionXYWithSubscreenOffset(battleInput->spriteBugNet, 88, 8, 0x110000);
    ManagedSprite_TickFrame(battleInput->spriteBugNet);
}

static void BattleInput_DeleteBugContestGraphics(BattleInput *battleInput) {
    if (battleInput->spriteBugNet == NULL || battleInput->spriteSportBall == NULL) {
        return;
    }

    SpriteManager *spriteManager = BattleSystem_GetSpriteManager(battleInput->battleSystem);

    Sprite_DeleteAndFreeResources(battleInput->spriteBugNet);
    Sprite_DeleteAndFreeResources(battleInput->spriteSportBall);

    battleInput->spriteBugNet = NULL;
    battleInput->spriteSportBall = NULL;

    SpriteManager_UnloadCharObjById(spriteManager, 20040);
    SpriteManager_UnloadCellObjById(spriteManager, 20022);
    SpriteManager_UnloadAnimObjById(spriteManager, 20022);
}

static BOOL BattleSystem_IsInFrontier(BattleSystem *battleSystem) {
    int battleType = BattleSystem_GetBattleType(battleSystem);
    return (battleType & BATTLE_TYPE_FRONTIER) && !(battleType & BATTLE_TYPE_13);
}
