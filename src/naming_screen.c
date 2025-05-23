#include "naming_screen.h"

#include "global.h"

#include "data/namein.naix"
#include "msgdata/msg.naix"
#include "msgdata/msg/msg_0197.h"
#include "msgdata/msg/msg_0249.h"
#include "msgdata/msg/msg_0254.h"

#include "bg_window.h"
#include "filesystem.h"
#include "font.h"
#include "gf_gfx_loader.h"
#include "gf_gfx_planes.h"
#include "launch_application.h"
#include "math_util.h"
#include "menu_input_state.h"
#include "message_format.h"
#include "msgdata.h"
#include "obj_char_transfer.h"
#include "obj_pltt_transfer.h"
#include "pokemon_icon_idx.h"
#include "sound_02004A44.h"
#include "systask_environment.h"
#include "system.h"
#include "text.h"
#include "unk_02005D10.h"
#include "unk_0200ACF0.h"
#include "unk_0200B150.h"
#include "unk_0200FA24.h"
#include "unk_02013534.h"
#include "unk_020163E0.h"
#include "vram_transfer_manager.h"

#define NAME_SCREEN_CONTROL_DAKU            0xD001 // unused
#define NAME_SCREEN_CONTROL_HANDAKU         0xD002 // unused
#define NAME_SCREEN_CONTROL_SPACE           0xD003 // unused
#define NAME_SCREEN_CONTROL_SKIP            0xD004 // unused but because it's greyed out
#define NAME_SCREEN_BUTTON_START            0xE001
#define NAME_SCREEN_BUTTON_PAGE_UPPER       0xE002
#define NAME_SCREEN_BUTTON_PAGE_LOWER       0xE003
#define NAME_SCREEN_BUTTON_PAGE_SYMBOLS     0xE004
#define NAME_SCREEN_BUTTON_PAGE_JP_UNUSED   0xE005
#define NAME_SCREEN_BUTTON_PAGE_JP_UNUSED_2 0xE006
#define NAME_SCREEN_BUTTON_BACK             0xE007
#define NAME_SCREEN_BUTTON_OK               0xE008

typedef enum NamingScreenInitState {
    NS_INIT_STATE_LOAD_GFX,
    NS_INIT_STATE_LOAD_MON_ICON,
} NamingScreenInitState;

typedef enum NamingScreenMainState {
    NS_MAIN_STATE_WAIT_FADE_IN,
    NS_MAIN_STATE_FINISH_INIT,
    NS_MAIN_STATE_INPUT_LOOP,
    NS_MAIN_STATE_WAIT_FADE_OUT,
} NamingScreenMainState;

typedef enum NamingScreenPageSwitchState {
    NS_PAGESWITCH_STATE_DRAW_NEW_PAGE,
    NS_PAGESWITCH_STATE_SET_INIT_POS,
    NS_PAGESWITCH_STATE_MOVE_BGS,
    NS_PAGESWITCH_STATE_FINISH_BGS,
    NS_PAGESWITCH_STATE_IDLE,
    NS_PAGESWITCH_STATE_PRINT_BATTLE_MESSAGE,
    NS_PAGESWITCH_STATE_WAIT_BATTLE_MESSAGE,
    NS_PAGESWITCH_STATE_DELAY_AND_FADE_OUT,
} NamingScreenPageSwitchState;

typedef struct NamingScreenCursor {
    int x;
    int y;
    int prevX;
    int prevY;
    int deltaX;
    BOOL showCursor; // always TRUE
    BOOL ignoreInput;
} NamingScreenCursor;

typedef struct NamingScreenAppData {
    NameScreenType type;
    int playerGenderOrMonSpecies;
    int monForm;
    int maxLen;
    int monGender;
    BOOL printedFromBattleGMM; // logic that makes this TRUE is unreachable
    Options *options;
    NamingScreenCursor kbCursor;
    u16 plttGlowEffectAngle;
    u16 keyboard[6][13];
    u8 filler_0D6[2];
    u16 entryBuf[0x20];
    u16 entryBufBak[0x20];
    u16 textCursorPos;
    u16 tmpBuf[3];
    BgConfig *bgConfig;       // 0x160
    BOOL unk_164;             // unused
    MessageFormat *msgFormat; // 0x168
    MsgData *msgData_249;     // 0x16C
    MsgData *msgData_254;     // 0x170
    MsgData *msgData_197;     // 0x174
    String *promptString;
    String *unkJapaneseString;
    String *battleMsgString;
    String *unk_184; // set to a message that was not localized
    SpriteList *spriteList;
    G2dRenderer g2dRender;
    GF_2DGfxResMan *gfxResMen[4];
    SpriteResource *gfxResObjs[2][4];
    SpriteResourcesHeader spriteResHdr_Main;
    SpriteResourcesHeader spriteResHdr_Sub;
    Sprite *uiSprites[14];
    Sprite *textEntrySprites[12];
    Sprite *iconSprites[2];
    SysTask *tasks[7];
    Window windows[10];
    int battleMessageTextPrinterId;
    int pageSwitchState;
    int pageNum;
    GFBgLayer activeKeyboardBgId; // alternates between main 0/1
    VecFx32 bgPosVecs[2];
    int unk_480; // unused
    int unk_484; // set but never used
    int unk_488; // set but never used
    int unk_48C; // set but never used
    BOOL spriteAnimUpdateReq[7];
    void *charDataRaw;
    NNSG2dCharacterData *charData;
    void *monIconCharDaraRaw;
    NNSG2dCharacterData *monIconCharData;
    void *plttDataRaw;
    NNSG2dPaletteData *plttData;
    u8 charBuf[0x100];
    UnkStruct_020163E0 *unk_5C4;
    BOOL isTouchInput;
    int delayCounter;
    MenuInputStateMgr *pMenuInputState;
} NamingScreenAppData; // size: 0x5D4

typedef struct UnkStruct_02102278 {
    u8 x;
    u8 y;
    u16 sizeParam : 2; // GameFreak tried to be size-efficient here, but
    u8 cursorX : 5;    // messed up the data types.
    u8 cursorY : 5;    // cursorX and cursorY should both be u16.
} NamingScreenTouchHitboxDef;

BOOL NamingScreenApp_Init(OVY_MANAGER *ovyMan, int *pState);
static void NamingScreen_LoadMonIcon(NNSG2dCharacterData *pCharData, NNSG2dPaletteData *pPlttData, int species, int form);
BOOL NamingScreenApp_Main(OVY_MANAGER *ovyMan, int *pState);
static NamingScreenMainState NamingScreen_HandleInput(NamingScreenAppData *data, NamingScreenMainState state);
static void NamingScreen_SetDefaultName(NamingScreenAppData *data, NamingScreenArgs *args);
static BOOL NamingScreen_PMCharArrayIsAllSpaces(const u16 *s);
BOOL NamingScreenApp_Exit(OVY_MANAGER *ovyMan, int *pState);
static void NamingScreen_VBlankCB(void *param);
static void NamingScreen_InitFromArgs(NamingScreenAppData *data, NamingScreenArgs *args);
static void NamingScreen_SetGraphicsBanks(void);
static void NamingScreen_SetBgModesAndInitBuffers(BgConfig *bgConfig);
static void NamingScreen_ToggleGfxPlanes(GFPlaneToggle enable);
static void NamingScreen_InitKeyboardAndEntryCursors(NamingScreenAppData *data, OVY_MANAGER *ovyMan);
static void NamingScreen_PrepareBattleMessage(NamingScreenAppData *data, OVY_MANAGER *ovyMan);
static void NamingScreen_UnloadBgGfx(BgConfig *bgConfig, Window *windows);
static void NamingScreen_CreateBgConfigAndLoadGfx(NamingScreenAppData *data, NARC *narc);
static void NamingScreen_InitObjCharPlttTransfer(void);
static void NamingScreen_LoadObjGfx(NamingScreenAppData *data, NARC *narc);
static void SysTask_NamingScreen_SubspritePosController(SysTask *task, void *taskData);
static void NamingScreen_CreateSprites(NamingScreenAppData *data);
static void NamingScreen_CreateIconSprite(NamingScreenAppData *data, SpriteTemplate *tmplate);
static void SysTask_NamingScreen_WiggleEffect(SysTask *task, void *taskData);
static void NamingScreen_HandlePageSwitch(BgConfig *bgConfig, Window *windows, int *pState, int pageNum, GFBgLayer *pBgId, VecFx32 *posVecs, Sprite **pSprites, void *pRawData);
static void NamingScreen_PrintMessageOnWindowLeftAlign(Window *window, NameScreenType unused, String *msg);
static void NamingScreen_PrintMessageOnWindowWithMargin(Window *window, NameScreenType unused, String *msg);
static void NamingScreen_InitWindows(NamingScreenAppData *data, OVY_MANAGER *ovyMan, NARC *narc);
static void NamingScreen_SetPageBgPriorities(BgConfig *bgConfig, GFBgLayer bgId, VecFx32 *pos);
static void NamingScreen_SetPagePgPosVecs(VecFx32 *posVecs, GFBgLayer bgId);
static int NamingScreen_WrapAroundWithinInterval(int val, int lo, int hi);
static void NamingScreen_MoveKeyboardCursor(NamingScreenAppData *data, int dpadMovement);
static void NamingScreen_GetPlayerInput(NamingScreenAppData *data);
static void NamingScreen_UpdateCursorSpritePosition(NamingScreenAppData *data, int dpadMovement);
static void NamingScreen_PaletteGlowEffect(u16 *pSinArg);
static void NamingScreen_BlitRawCharactersToWindow(Window *window, const u16 *rawChars, int x, int y, int spacing, int textSpeed, u32 color, u8 *buttonPixels);
static void *NamingScreen_PrintStringOnWindow_GetPixelBuffer(Window *window, String *string, FontID fontId, u32 color);
static void NamingScreen_PrintCharacterOnWindowAndOBJ(Window *windows, const u16 *tmpBuf, void *charBuf, String *string);
static void NamingScreen_PrintLastCharacterOfEntryBuf(Window *window, u16 *entryBuf, u16 cursorPos, u16 *tmpBuf, void *charBuf, String *string);
static void NamingScreen_LoadKeyboardLayout(u16 (*keyboard)[13], const int pageNum);
static NamingScreenMainState NamingScreen_HandleCharacterInput(NamingScreenAppData *data, u16 key, BOOL isButtonInput);
static void NamingScreen_UpdateFieldMenuInputState(NamingScreenAppData *data, BOOL toggle);
static int NamingScreen_SearchJpConvTableForNonSpace(const u16 *table, int pos);
static BOOL NamingScreen_JP_FlipAlphaCase(int tableStart, int tableEnd, u16 *pmCharBuf, int cursorPos);
static BOOL NamingScreen_JP_FlipDiacritic(int tableStart, int tableEnd, int convColno, int mode, u16 *pmCharBuf, int cursorPos);
static void NamingScreen_UpdateSprite_HighlightedCharacterInInputBuffer(Sprite **sprites, int cursorPos, int maxLen);
static void NamingScreen_DrawKeyboardOnWindow(Window *window, u16 fillVal, int pageNum, u32 textColor, u8 *pRawData);
static void NamingScreen_UpdateSpritesAnims(BOOL *req, Sprite **sprites, int pageNum);
static void NamingScreen_PlaceCursorSprite(NamingScreenAppData *data);
static BOOL NamingScreen_HandleTouchInput(NamingScreenAppData *data);

// set but never referenced, never cleaned up
static NamingScreenAppData *sAppData;

// sprite params
// [0]: x coord
// [1]: y coord
// [2]: anim
// [3]: priority
static const int sUISpritesParam[][4] = {
    { 0x04, 0x44, 0x03, 0x01 },
    { 0x24, 0x44, 0x08, 0x01 },
    { 0x44, 0x44, 0x0D, 0x01 },
    { 0x00, 0xC8, 0x12, 0x01 },
    { 0x65, 0x44, 0x14, 0x01 },
    { 0x88, 0x44, 0x17, 0x01 },
    { 0xB0, 0x44, 0x19, 0x01 },
    { 0x16, 0x38, 0x25, 0x02 },
    { 0x1A, 0x5B, 0x27, 0x00 },
};

static const u16 sKeyboardHomeRow_All[] = { NAME_SCREEN_BUTTON_PAGE_UPPER, NAME_SCREEN_BUTTON_PAGE_UPPER, NAME_SCREEN_BUTTON_PAGE_LOWER, NAME_SCREEN_BUTTON_PAGE_LOWER, NAME_SCREEN_BUTTON_PAGE_SYMBOLS, NAME_SCREEN_BUTTON_PAGE_SYMBOLS, NAME_SCREEN_CONTROL_SKIP, NAME_SCREEN_CONTROL_SKIP, NAME_SCREEN_BUTTON_BACK, NAME_SCREEN_BUTTON_BACK, NAME_SCREEN_BUTTON_BACK, NAME_SCREEN_BUTTON_OK, NAME_SCREEN_BUTTON_OK };

static const u16 sKeyboardHomeRow_Numpad[] = { NAME_SCREEN_CONTROL_SKIP, NAME_SCREEN_CONTROL_SKIP, NAME_SCREEN_CONTROL_SKIP, NAME_SCREEN_CONTROL_SKIP, NAME_SCREEN_CONTROL_SKIP, NAME_SCREEN_CONTROL_SKIP, NAME_SCREEN_CONTROL_SKIP, NAME_SCREEN_CONTROL_SKIP, NAME_SCREEN_BUTTON_BACK, NAME_SCREEN_BUTTON_BACK, NAME_SCREEN_BUTTON_BACK, NAME_SCREEN_BUTTON_OK, NAME_SCREEN_BUTTON_OK };

static const u16 *sKeyboardHomeRowLayoutPtrs[] = {
    sKeyboardHomeRow_All,
    sKeyboardHomeRow_All,
    sKeyboardHomeRow_All,
    sKeyboardHomeRow_All,
    sKeyboardHomeRow_Numpad,
};

// x coordinates
static const u16 sHomeRowCursorXCoords[] = {
    0x0019, // Upper
    0x0039, // Lower
    0x0059, // Symbols
    0x0061, // JP Symbols
    0x007A, // Numpad
    0x009E, // Back
    0x00C6, // OK
    0x0000,
};

// anim ids
static const u8 sHomeRowCursorAnimIDs[] = {
    0x28, // Upper
    0x28, // Lower
    0x28, // Symbols
    0x28, // JP Symbols
    0x29, // Numpad
    0x29, // Back
    0x29, // OK
};

static const u16 sKeyboardRow_Upper_1[] = { CHAR_A, CHAR_B, CHAR_C, CHAR_D, CHAR_E, CHAR_F, CHAR_G, CHAR_H, CHAR_I, CHAR_J, CHAR_SPACE, CHAR_COMMA, CHAR_PERIOD, EOS };

static const u16 sKeyboardRow_Upper_2[] = { CHAR_K, CHAR_L, CHAR_M, CHAR_N, CHAR_O, CHAR_P, CHAR_Q, CHAR_R, CHAR_S, CHAR_T, CHAR_SPACE, CHAR_RAPOST, CHAR_HYPHEN, EOS };

static const u16 sKeyboardRow_Upper_3[] = { CHAR_U, CHAR_V, CHAR_W, CHAR_X, CHAR_Y, CHAR_Z, CHAR_SPACE, CHAR_SPACE, CHAR_SPACE, CHAR_SPACE, CHAR_SPACE, CHAR_MALE, CHAR_FEMALE, EOS };

static const u16 sKeyboardRow_Upper_4[] = { CHAR_SPACE, CHAR_SPACE, CHAR_SPACE, CHAR_SPACE, CHAR_SPACE, CHAR_SPACE, CHAR_SPACE, CHAR_SPACE, CHAR_SPACE, CHAR_SPACE, CHAR_SPACE, CHAR_SPACE, CHAR_SPACE, EOS };

static const u16 sKeyboardRow_Upper_5[] = { CHAR_0, CHAR_1, CHAR_2, CHAR_3, CHAR_4, CHAR_5, CHAR_6, CHAR_7, CHAR_8, CHAR_9, CHAR_SPACE, CHAR_SPACE, CHAR_SPACE, EOS };

static const u16 sKeyboardRow_Lower_1[] = { CHAR_a, CHAR_b, CHAR_c, CHAR_d, CHAR_e, CHAR_f, CHAR_g, CHAR_h, CHAR_i, CHAR_j, CHAR_SPACE, CHAR_COMMA, CHAR_PERIOD, EOS };

static const u16 sKeyboardRow_Lower_2[] = { CHAR_k, CHAR_l, CHAR_m, CHAR_n, CHAR_o, CHAR_p, CHAR_q, CHAR_r, CHAR_s, CHAR_t, CHAR_SPACE, CHAR_RAPOST, CHAR_HYPHEN, EOS };

static const u16 sKeyboardRow_Lower_3[] = { CHAR_u, CHAR_v, CHAR_w, CHAR_x, CHAR_y, CHAR_z, CHAR_SPACE, CHAR_SPACE, CHAR_SPACE, CHAR_SPACE, CHAR_SPACE, CHAR_MALE, CHAR_FEMALE, EOS };

static const u16 sKeyboardRow_Lower_4[] = { CHAR_SPACE, CHAR_SPACE, CHAR_SPACE, CHAR_SPACE, CHAR_SPACE, CHAR_SPACE, CHAR_SPACE, CHAR_SPACE, CHAR_SPACE, CHAR_SPACE, CHAR_SPACE, CHAR_SPACE, CHAR_SPACE, EOS };

static const u16 sKeyboardRow_Lower_5[] = { CHAR_0, CHAR_1, CHAR_2, CHAR_3, CHAR_4, CHAR_5, CHAR_6, CHAR_7, CHAR_8, CHAR_9, CHAR_SPACE, CHAR_SPACE, CHAR_SPACE, EOS };

static const u16 sKeyboardRow_Symbols_1[] = { CHAR_COMMA, CHAR_PERIOD, CHAR_COLON, CHAR_SEMICOLON, CHAR_EXCL, CHAR_QMARK, CHAR_SPACE, CHAR_SPACE, CHAR_SPACE, CHAR_MALE, CHAR_FEMALE, CHAR_SPACE, CHAR_SPACE, EOS };

static const u16 sKeyboardRow_Symbols_2[] = { CHAR_LDQUOT, CHAR_RDQUOT, CHAR_LAPOST, CHAR_RAPOST, CHAR_LPAREN, CHAR_RPAREN, CHAR_SPACE, CHAR_SPACE, CHAR_SPACE, CHAR_SPACE, CHAR_SPACE, CHAR_SPACE, CHAR_SPACE, EOS };

static const u16 sKeyboardRow_Symbols_3[] = { CHAR_ELLIPSIS, CHAR_CTRDOT, CHAR_TILDE, CHAR_AT, CHAR_HASH, CHAR_PERCENT, CHAR_PLUS, CHAR_HYPHEN, CHAR_ASTERISK, CHAR_SLASH, CHAR_EQUALS, CHAR_SPACE, CHAR_SPACE, EOS };

static const u16 sKeyboardRow_Symbols_4[] = { CHAR_CIRCLE_DOT, CHAR_CIRCLE, CHAR_SQUARE, CHAR_TRIANGLE, CHAR_DIAMOND, CHAR_SPADE_SUIT, CHAR_HEART_SUIT, CHAR_DIAMOND_SUIT, CHAR_CLUB_SUIT, CHAR_STAR, CHAR_MUSIC_NOTE, CHAR_SPACE, CHAR_SPACE, EOS };

static const u16 sKeyboardRow_Symbols_5[] = { CHAR_SUN, CHAR_TREBLE_CLEF, CHAR_UMBRELLA, CHAR_SNOWMAN, CHAR_SMILEY, CHAR_LAUGHING, CHAR_ANGUISH, CHAR_ANGRY, CHAR_SNORING, CHAR_UP_ARROW, CHAR_DOWN_ARROW, CHAR_SPACE, CHAR_SPACE, EOS };

static const u16 sKeyboardRow_JPMisc_1[] = { CHAR_JP_0, CHAR_JP_1, CHAR_JP_2, CHAR_JP_3, CHAR_JP_4, CHAR_JP_5, CHAR_JP_6, CHAR_JP_7, CHAR_JP_8, CHAR_JP_9, CHAR_JP_SPACE, CHAR_JP_EXCLAM_MARK, CHAR_JP_QUESTION_MARK, EOS };

static const u16 sKeyboardRow_JPMisc_2[] = { CHAR_JP_COMMA, CHAR_JP_FULLSTOP, CHAR_JP_HW_COMMA, CHAR_JP_HW_PERIOD, CHAR_JP_ELLIPSIS, CHAR_JP_CENTER_DOT, CHAR_JP_TILDE, CHAR_JP_HW_COLON, CHAR_JP_HW_SEMICOLON, CHAR_JP_SLASH, CHAR_JP_SPACE, CHAR_JP_OTOKO, CHAR_JP_ONNA, EOS };

static const u16 sKeyboardRow_JPMisc_3[] = { CHAR_JP_OPEN_QUOT, CHAR_JP_CLOSE_QUOT, CHAR_JP_OPEN_DQUOT, CHAR_JP_CLOSE_DQUOT, CHAR_JP_OPEN_PAREN, CHAR_JP_CLOSE_PAREN, CHAR_JP_PLUS, CHAR_JP_HYPHEN, CHAR_JP_MULT, CHAR_JP_DIV, CHAR_JP_EQUAL, CHAR_JP_PERCENT, CHAR_JP_AT, EOS };

static const u16 sKeyboardRow_JPMisc_4[] = { CHAR_JP_CIRCLE_DOT, CHAR_JP_CIRCLE, CHAR_JP_SQUARE, CHAR_JP_TRIANGLE, CHAR_JP_DIAMOND, CHAR_JP_HEART_SUIT, CHAR_JP_SPADE_SUIT, CHAR_JP_DIAMOND_SUIT, CHAR_JP_CLUB_SUIT, CHAR_JP_STAR, CHAR_JP_MUSIC_NOTE, CHAR_JP_SPACE, CHAR_JP_SPACE, EOS };

static const u16 sKeyboardRow_JPMisc_5[] = { CHAR_JP_SUN, CHAR_JP_TREBLE_CLEF, CHAR_JP_UMBRELLA, CHAR_JP_SNOWMAN, CHAR_JP_SMILEY, CHAR_JP_LAUGHING, CHAR_JP_ANGUISH, CHAR_JP_ANGRY, CHAR_JP_SNORING, CHAR_JP_UP_ARROW, CHAR_JP_DOWN_ARROW, CHAR_JP_SPACE, CHAR_JP_SPACE, EOS };

static const u16 sKeyboardRow_Numpad_1[] = { CHAR_0, CHAR_1, CHAR_2, CHAR_3, CHAR_4, CHAR_JP_SPACE, CHAR_JP_SPACE, CHAR_JP_SPACE, CHAR_JP_SPACE, CHAR_JP_SPACE, CHAR_JP_SPACE, CHAR_JP_SPACE, CHAR_JP_SPACE, CHAR_JP_SPACE, CHAR_JP_SPACE, CHAR_JP_SPACE, CHAR_JP_SPACE, EOS };

static const u16 sKeyboardRow_Numpad_2[] = { CHAR_5, CHAR_6, CHAR_7, CHAR_8, CHAR_9, CHAR_JP_SPACE, CHAR_JP_SPACE, CHAR_JP_SPACE, CHAR_JP_SPACE, CHAR_JP_SPACE, CHAR_JP_SPACE, CHAR_JP_SPACE, CHAR_JP_SPACE, CHAR_JP_SPACE, CHAR_JP_SPACE, CHAR_JP_SPACE, CHAR_JP_SPACE, EOS };

static const u16 sKeyboardRow_Numpad_345[] = { CHAR_JP_SPACE, CHAR_JP_SPACE, CHAR_JP_SPACE, CHAR_JP_SPACE, CHAR_JP_SPACE, CHAR_JP_SPACE, CHAR_JP_SPACE, CHAR_JP_SPACE, CHAR_JP_SPACE, CHAR_JP_SPACE, CHAR_JP_SPACE, CHAR_JP_SPACE, CHAR_JP_SPACE, CHAR_JP_SPACE, CHAR_JP_SPACE, CHAR_JP_SPACE, CHAR_JP_SPACE, EOS };

static const u16 *sKeyboardLayoutPtrs[][5] = {
    { sKeyboardRow_Upper_1,   sKeyboardRow_Upper_2,   sKeyboardRow_Upper_3,    sKeyboardRow_Upper_4,    sKeyboardRow_Upper_5    },
    { sKeyboardRow_Lower_1,   sKeyboardRow_Lower_2,   sKeyboardRow_Lower_3,    sKeyboardRow_Lower_4,    sKeyboardRow_Lower_5    },
    { sKeyboardRow_Symbols_1, sKeyboardRow_Symbols_2, sKeyboardRow_Symbols_3,  sKeyboardRow_Symbols_4,  sKeyboardRow_Symbols_5  },
    { sKeyboardRow_JPMisc_1,  sKeyboardRow_JPMisc_2,  sKeyboardRow_JPMisc_3,   sKeyboardRow_JPMisc_4,   sKeyboardRow_JPMisc_5   },
    { sKeyboardRow_Numpad_1,  sKeyboardRow_Numpad_2,  sKeyboardRow_Numpad_345, sKeyboardRow_Numpad_345, sKeyboardRow_Numpad_345 },
};

// These arrays are used to convert Japanese characters in response to pressing R.
static const u16 sJpCharConvTable[][3] = {
    { CHAR_JP_HIRA_A,  CHAR_JP_SPACE,   CHAR_JP_HIRA_A_SMALL  },
    { CHAR_JP_HIRA_I,  CHAR_JP_SPACE,   CHAR_JP_HIRA_I_SMALL  },
    { CHAR_JP_HIRA_U,  CHAR_JP_SPACE,   CHAR_JP_HIRA_U_SMALL  },
    { CHAR_JP_HIRA_E,  CHAR_JP_SPACE,   CHAR_JP_HIRA_E_SMALL  },
    { CHAR_JP_HIRA_O,  CHAR_JP_SPACE,   CHAR_JP_HIRA_O_SMALL  },
    { CHAR_JP_KATA_A,  CHAR_JP_SPACE,   CHAR_JP_KATA_A_SMALL  },
    { CHAR_JP_KATA_I,  CHAR_JP_SPACE,   CHAR_JP_KATA_I_SMALL  },
    { CHAR_JP_KATA_U,  CHAR_JP_SPACE,   CHAR_JP_KATA_U_SMALL  },
    { CHAR_JP_KATA_E,  CHAR_JP_SPACE,   CHAR_JP_KATA_E_SMALL  },
    { CHAR_JP_KATA_O,  CHAR_JP_SPACE,   CHAR_JP_KATA_O_SMALL  },
    { CHAR_JP_HIRA_YA, CHAR_JP_SPACE,   CHAR_JP_HIRA_YA_SMALL },
    { CHAR_JP_HIRA_YU, CHAR_JP_SPACE,   CHAR_JP_HIRA_YU_SMALL },
    { CHAR_JP_HIRA_YO, CHAR_JP_SPACE,   CHAR_JP_HIRA_YO_SMALL },
    { CHAR_JP_KATA_YA, CHAR_JP_SPACE,   CHAR_JP_KATA_YA_SMALL },
    { CHAR_JP_KATA_YU, CHAR_JP_SPACE,   CHAR_JP_KATA_YU_SMALL },
    { CHAR_JP_KATA_YO, CHAR_JP_SPACE,   CHAR_JP_KATA_YO_SMALL },
    { CHAR_JP_A,       CHAR_JP_SPACE,   CHAR_JP_a             },
    { CHAR_JP_B,       CHAR_JP_SPACE,   CHAR_JP_b             },
    { CHAR_JP_C,       CHAR_JP_SPACE,   CHAR_JP_c             },
    { CHAR_JP_D,       CHAR_JP_SPACE,   CHAR_JP_d             },
    { CHAR_JP_E,       CHAR_JP_SPACE,   CHAR_JP_e             },
    { CHAR_JP_F,       CHAR_JP_SPACE,   CHAR_JP_f             },
    { CHAR_JP_G,       CHAR_JP_SPACE,   CHAR_JP_g             },
    { CHAR_JP_H,       CHAR_JP_SPACE,   CHAR_JP_h             },
    { CHAR_JP_I,       CHAR_JP_SPACE,   CHAR_JP_i             },
    { CHAR_JP_J,       CHAR_JP_SPACE,   CHAR_JP_j             },
    { CHAR_JP_K,       CHAR_JP_SPACE,   CHAR_JP_k             },
    { CHAR_JP_L,       CHAR_JP_SPACE,   CHAR_JP_l             },
    { CHAR_JP_M,       CHAR_JP_SPACE,   CHAR_JP_m             },
    { CHAR_JP_N,       CHAR_JP_SPACE,   CHAR_JP_n             },
    { CHAR_JP_O,       CHAR_JP_SPACE,   CHAR_JP_o             },
    { CHAR_JP_P,       CHAR_JP_SPACE,   CHAR_JP_p             },
    { CHAR_JP_Q,       CHAR_JP_SPACE,   CHAR_JP_q             },
    { CHAR_JP_R,       CHAR_JP_SPACE,   CHAR_JP_r             },
    { CHAR_JP_S,       CHAR_JP_SPACE,   CHAR_JP_s             },
    { CHAR_JP_T,       CHAR_JP_SPACE,   CHAR_JP_t             },
    { CHAR_JP_U,       CHAR_JP_SPACE,   CHAR_JP_u             },
    { CHAR_JP_V,       CHAR_JP_SPACE,   CHAR_JP_v             },
    { CHAR_JP_W,       CHAR_JP_SPACE,   CHAR_JP_w             },
    { CHAR_JP_X,       CHAR_JP_SPACE,   CHAR_JP_x             },
    { CHAR_JP_Y,       CHAR_JP_SPACE,   CHAR_JP_y             },
    { CHAR_JP_Z,       CHAR_JP_SPACE,   CHAR_JP_z             },
    { CHAR_JP_HIRA_TU, CHAR_JP_HIRA_DU, CHAR_JP_HIRA_TU_SMALL },
    { CHAR_JP_KATA_TU, CHAR_JP_KATA_DU, CHAR_JP_KATA_TU_SMALL },
    { CHAR_JP_HIRA_KA, CHAR_JP_HIRA_GA, CHAR_JP_SPACE         },
    { CHAR_JP_HIRA_KI, CHAR_JP_HIRA_GI, CHAR_JP_SPACE         },
    { CHAR_JP_HIRA_KU, CHAR_JP_HIRA_GU, CHAR_JP_SPACE         },
    { CHAR_JP_HIRA_KE, CHAR_JP_HIRA_GE, CHAR_JP_SPACE         },
    { CHAR_JP_HIRA_KO, CHAR_JP_HIRA_GO, CHAR_JP_SPACE         },
    { CHAR_JP_HIRA_SA, CHAR_JP_HIRA_ZA, CHAR_JP_SPACE         },
    { CHAR_JP_HIRA_SI, CHAR_JP_HIRA_ZI, CHAR_JP_SPACE         },
    { CHAR_JP_HIRA_SU, CHAR_JP_HIRA_ZU, CHAR_JP_SPACE         },
    { CHAR_JP_HIRA_SE, CHAR_JP_HIRA_ZE, CHAR_JP_SPACE         },
    { CHAR_JP_HIRA_SO, CHAR_JP_HIRA_ZO, CHAR_JP_SPACE         },
    { CHAR_JP_HIRA_TA, CHAR_JP_HIRA_DA, CHAR_JP_SPACE         },
    { CHAR_JP_HIRA_TI, CHAR_JP_HIRA_DI, CHAR_JP_SPACE         },
    { CHAR_JP_HIRA_TE, CHAR_JP_HIRA_DE, CHAR_JP_SPACE         },
    { CHAR_JP_HIRA_TO, CHAR_JP_HIRA_DO, CHAR_JP_SPACE         },
    { CHAR_JP_KATA_KA, CHAR_JP_KATA_GA, CHAR_JP_SPACE         },
    { CHAR_JP_KATA_KI, CHAR_JP_KATA_GI, CHAR_JP_SPACE         },
    { CHAR_JP_KATA_KU, CHAR_JP_KATA_GU, CHAR_JP_SPACE         },
    { CHAR_JP_KATA_KE, CHAR_JP_KATA_GE, CHAR_JP_SPACE         },
    { CHAR_JP_KATA_KO, CHAR_JP_KATA_GO, CHAR_JP_SPACE         },
    { CHAR_JP_KATA_SA, CHAR_JP_KATA_ZA, CHAR_JP_SPACE         },
    { CHAR_JP_KATA_SI, CHAR_JP_KATA_ZI, CHAR_JP_SPACE         },
    { CHAR_JP_KATA_SU, CHAR_JP_KATA_ZU, CHAR_JP_SPACE         },
    { CHAR_JP_KATA_SE, CHAR_JP_KATA_ZE, CHAR_JP_SPACE         },
    { CHAR_JP_KATA_SO, CHAR_JP_KATA_ZO, CHAR_JP_SPACE         },
    { CHAR_JP_KATA_TA, CHAR_JP_KATA_DA, CHAR_JP_SPACE         },
    { CHAR_JP_KATA_TI, CHAR_JP_KATA_DI, CHAR_JP_SPACE         },
    { CHAR_JP_KATA_TE, CHAR_JP_KATA_DE, CHAR_JP_SPACE         },
    { CHAR_JP_KATA_TO, CHAR_JP_KATA_DO, CHAR_JP_SPACE         },
    { CHAR_JP_HIRA_HA, CHAR_JP_HIRA_BA, CHAR_JP_HIRA_PA       },
    { CHAR_JP_HIRA_HI, CHAR_JP_HIRA_BI, CHAR_JP_HIRA_PI       },
    { CHAR_JP_HIRA_HU, CHAR_JP_HIRA_BU, CHAR_JP_HIRA_PU       },
    { CHAR_JP_HIRA_HE, CHAR_JP_HIRA_BE, CHAR_JP_HIRA_PE       },
    { CHAR_JP_HIRA_HO, CHAR_JP_HIRA_BO, CHAR_JP_HIRA_PO       },
    { CHAR_JP_KATA_HA, CHAR_JP_KATA_BA, CHAR_JP_KATA_PA       },
    { CHAR_JP_KATA_HI, CHAR_JP_KATA_BI, CHAR_JP_KATA_PI       },
    { CHAR_JP_KATA_HU, CHAR_JP_KATA_BU, CHAR_JP_KATA_PU       },
    { CHAR_JP_KATA_HE, CHAR_JP_KATA_BE, CHAR_JP_KATA_PE       },
    { CHAR_JP_KATA_HO, CHAR_JP_KATA_BO, CHAR_JP_KATA_PO       },
};

#define CHARCONVTBL_ALPHA_BEGIN   0
#define CHARCONVTBL_DAKU_BEGIN    42
#define CHARCONVTBL_HANDAKU_BEGIN 72

static const u16 sDakutenTable[][2] = {
    { CHAR_JP_HIRA_TU_SMALL, CHAR_JP_HIRA_DU },
    { CHAR_JP_KATA_TU_SMALL, CHAR_JP_KATA_DU },
    { CHAR_JP_HIRA_PA,       CHAR_JP_HIRA_BA },
    { CHAR_JP_HIRA_PI,       CHAR_JP_HIRA_BI },
    { CHAR_JP_HIRA_PU,       CHAR_JP_HIRA_BU },
    { CHAR_JP_HIRA_PE,       CHAR_JP_HIRA_BE },
    { CHAR_JP_HIRA_PO,       CHAR_JP_HIRA_BO },
    { CHAR_JP_KATA_PA,       CHAR_JP_KATA_BA },
    { CHAR_JP_KATA_PI,       CHAR_JP_KATA_BI },
    { CHAR_JP_KATA_PU,       CHAR_JP_KATA_BU },
    { CHAR_JP_KATA_PE,       CHAR_JP_KATA_BE },
    { CHAR_JP_KATA_PO,       CHAR_JP_KATA_BO },
};

static const u16 sHandakutenTable[][2] = {
    { CHAR_JP_HIRA_BA, CHAR_JP_HIRA_PA },
    { CHAR_JP_HIRA_BI, CHAR_JP_HIRA_PI },
    { CHAR_JP_HIRA_BU, CHAR_JP_HIRA_PU },
    { CHAR_JP_HIRA_BE, CHAR_JP_HIRA_PE },
    { CHAR_JP_HIRA_BO, CHAR_JP_HIRA_PO },
    { CHAR_JP_KATA_BA, CHAR_JP_KATA_PA },
    { CHAR_JP_KATA_BI, CHAR_JP_KATA_PI },
    { CHAR_JP_KATA_BU, CHAR_JP_KATA_PU },
    { CHAR_JP_KATA_BE, CHAR_JP_KATA_PE },
    { CHAR_JP_KATA_BO, CHAR_JP_KATA_PO },
};

// offsets for GXS_LoadOBJ
static const int sSpriteGfxOffsets[] = {
    0x00000070,
    0x0000004C,
    0x00000048,
};

static const u8 sKeyboardFrameColors[] = {
    0x04,
    0x07,
    0x0D,
    0x0A,
};

// These were intended for the Japanese build, but their purpose was replaced with GMM.
// The arrays still appear in the final English ROM.
const u16 sPrompt_YourName[] = { CHAR_JP_HIRA_A, CHAR_JP_HIRA_NA, CHAR_JP_HIRA_TA, CHAR_JP_HIRA_NO, CHAR_JP_SPACE, CHAR_JP_HIRA_NA, CHAR_JP_HIRA_MA, CHAR_JP_HIRA_E, CHAR_JP_HIRA_HA, CHAR_JP_QUESTION_MARK, EOS };

const u16 sPrompt_PokemonsNickname[] = { CHAR_JP_KATA_PO, CHAR_JP_KATA_KE, CHAR_JP_KATA_MO, CHAR_JP_KATA_N_, CHAR_JP_HIRA_NO, CHAR_JP_SPACE, CHAR_JP_KATA_NI, CHAR_JP_KATA_TU_SMALL, CHAR_JP_KATA_KU, CHAR_JP_KATA_NE, CHAR_JP_HYPHEN, CHAR_JP_KATA_MU, CHAR_JP_HIRA_HA, CHAR_JP_QUESTION_MARK, EOS };

const u16 sPrompt_BoxName[] = { CHAR_JP_KATA_BO, CHAR_JP_KATA_TU_SMALL, CHAR_JP_KATA_KU, CHAR_JP_KATA_SU, CHAR_JP_HIRA_NO, CHAR_JP_SPACE, CHAR_JP_HIRA_NA, CHAR_JP_HIRA_MA, CHAR_JP_HIRA_E, CHAR_JP_HIRA_HA, CHAR_JP_QUESTION_MARK, EOS };

// Required to force the above three arrays to appear in the final ROM.
// This pointer array does not appear in the final ROM.
static const u16 *sDeadstrippedPointersTable[] = {
    sPrompt_YourName,
    sPrompt_PokemonsNickname,
    sPrompt_BoxName,
};

// These are the GMMs that replace the above.
static const int _021020B4[] = {
    msg_0249_00000,
    msg_0249_00001,
    msg_0249_00002,
    msg_0249_00003,
    msg_0249_00004,
    msg_0249_00005,
    msg_0249_00006,
    msg_0249_00008,
};

const OVY_MGR_TEMPLATE gOverlayTemplate_NamingScreen = {
    NamingScreenApp_Init,
    NamingScreenApp_Main,
    NamingScreenApp_Exit,
    FS_OVERLAY_ID_NONE,
};

BOOL NamingScreenApp_Init(OVY_MANAGER *ovyMan, int *pState) {
    NamingScreenAppData *data;
    NARC *narc;
    switch ((NamingScreenInitState)*pState) {
    case NS_INIT_STATE_LOAD_GFX:
        Main_SetVBlankIntrCB(NULL, NULL);
        HBlankInterruptDisable();
        GfGfx_DisableEngineAPlanes();
        GfGfx_DisableEngineBPlanes();
        GX_SetVisiblePlane(0);
        GXS_SetVisiblePlane(0);
        CreateHeap(HEAP_ID_3, HEAP_ID_NAMING_SCREEN, 0x28000);

        data = OverlayManager_CreateAndGetData(ovyMan, sizeof(NamingScreenAppData), HEAP_ID_NAMING_SCREEN);
        memset(data, 0, sizeof(NamingScreenAppData));
        data->bgConfig = BgConfig_Alloc(HEAP_ID_NAMING_SCREEN);
        narc = NARC_New(NARC_data_namein, HEAP_ID_NAMING_SCREEN);
        data->msgFormat = MessageFormat_New(HEAP_ID_NAMING_SCREEN);
        data->msgData_249 = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, NARC_msg_msg_0249_bin, HEAP_ID_NAMING_SCREEN);
        data->msgData_254 = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0254_bin, HEAP_ID_NAMING_SCREEN);
        data->msgData_197 = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0197_bin, HEAP_ID_NAMING_SCREEN);
        SetKeyRepeatTimers(4, 8);
        NamingScreen_SetGraphicsBanks();
        NamingScreen_SetBgModesAndInitBuffers(data->bgConfig);
        NamingScreen_InitFromArgs(data, OverlayManager_GetArgs(ovyMan));
        NamingScreen_CreateBgConfigAndLoadGfx(data, narc);
        FontID_Alloc(2, HEAP_ID_NAMING_SCREEN);
        Main_SetVBlankIntrCB(NamingScreen_VBlankCB, NULL);
        NamingScreen_InitKeyboardAndEntryCursors(data, ovyMan);
        FontID_SetAccessDirect(0, HEAP_ID_NAMING_SCREEN);
        NamingScreen_InitObjCharPlttTransfer();
        NamingScreen_LoadObjGfx(data, narc);
        NamingScreen_CreateSprites(data);
        NamingScreen_InitWindows(data, ovyMan, narc);
        NamingScreen_PrintLastCharacterOfEntryBuf(&data->windows[4], data->entryBuf, data->textCursorPos, data->tmpBuf, data->charBuf, data->unkJapaneseString);
        Sound_SetSceneAndPlayBGM(0x34, 0, 0);
        BeginNormalPaletteFade(0, 1, 1, RGB_BLACK, 16, 1, HEAP_ID_NAMING_SCREEN);
        NamingScreen_ToggleGfxPlanes(GF_PLANE_TOGGLE_ON);
        GfGfx_SetMainDisplay(PM_LCD_BOTTOM);
        NARC_Delete(narc);
        ++(*pState);
        break;
    case NS_INIT_STATE_LOAD_MON_ICON:
        data = OverlayManager_GetData(ovyMan);
        if (data->type == NAME_SCREEN_POKEMON) {
            NamingScreen_LoadMonIcon(data->monIconCharData, data->plttData, data->playerGenderOrMonSpecies, data->monForm);
        }
        sAppData = data;
        data->unk_5C4 = sub_020163E0(NULL, PM_LCD_BOTTOM, 12, HEAP_ID_NAMING_SCREEN);
        *pState = NS_MAIN_STATE_WAIT_FADE_IN;
        return TRUE;
    }

    return FALSE;
}

static void NamingScreen_LoadMonIcon(NNSG2dCharacterData *pCharData, NNSG2dPaletteData *pPlttData, int species, int form) {
    GX_LoadOBJ(pCharData->pRawData, 0x57E0, 0x200);
    const u16 *rawPltt = pPlttData->pRawData;
    u32 plttNo = GetMonIconPaletteEx(species, form, FALSE);
    GX_LoadOBJPltt(rawPltt + 16 * plttNo, 0xC0, 0x20);
}

BOOL NamingScreenApp_Main(OVY_MANAGER *ovyMan, int *pState) {
    NamingScreenAppData *data = OverlayManager_GetData(ovyMan);

    switch ((NamingScreenMainState)*pState) {
    case NS_MAIN_STATE_WAIT_FADE_IN:
        if (IsPaletteFadeFinished()) {
            *pState = NS_MAIN_STATE_FINISH_INIT;
            data->delayCounter = 0;
        }
        break;
    case NS_MAIN_STATE_FINISH_INIT:
        ++data->delayCounter;
        NamingScreen_PlaceCursorSprite(data);
        NamingScreen_UpdateSpritesAnims(data->spriteAnimUpdateReq, data->uiSprites, data->pageNum);
        if (data->delayCounter > 5) {
            *pState = NS_MAIN_STATE_INPUT_LOOP;
            data->delayCounter = 0;
        }
        break;
    case NS_MAIN_STATE_INPUT_LOOP:
        switch (data->pageSwitchState) {
        case NS_PAGESWITCH_STATE_DRAW_NEW_PAGE:
        case NS_PAGESWITCH_STATE_SET_INIT_POS:
        case NS_PAGESWITCH_STATE_MOVE_BGS:
        case NS_PAGESWITCH_STATE_FINISH_BGS:
            break;
        case NS_PAGESWITCH_STATE_IDLE:
            if (!data->kbCursor.ignoreInput) {
                *pState = NamingScreen_HandleInput(data, (NamingScreenMainState)*pState);
            }
            NamingScreen_PlaceCursorSprite(data);
            break;
        case NS_PAGESWITCH_STATE_PRINT_BATTLE_MESSAGE:
            NamingScreen_PrepareBattleMessage(data, ovyMan);
            FillWindowPixelBuffer(&data->windows[9], 15);
            DrawFrameAndWindow2(&data->windows[9], FALSE, 256, 10);
            data->battleMessageTextPrinterId = AddTextPrinterParameterized(&data->windows[9], 1, data->battleMsgString, 0, 0, 1, NULL);
            CopyWindowToVram(&data->windows[9]);
            data->pageSwitchState = NS_PAGESWITCH_STATE_WAIT_BATTLE_MESSAGE;
            break;
        case NS_PAGESWITCH_STATE_WAIT_BATTLE_MESSAGE:
            if (!TextPrinterCheckActive(data->battleMessageTextPrinterId)) {
                PlaySE(SEQ_SE_DP_PIRORIRO);
                ++data->spriteAnimUpdateReq[6];
                data->delayCounter = 0;
                data->pageSwitchState = NS_PAGESWITCH_STATE_DELAY_AND_FADE_OUT;
            }
            break;
        case NS_PAGESWITCH_STATE_DELAY_AND_FADE_OUT:
            ++data->delayCounter;
            if (data->delayCounter > 30) {
                BeginNormalPaletteFade(2, 0, 0, RGB_BLACK, 16, 1, HEAP_ID_NAMING_SCREEN);
                *pState = NS_MAIN_STATE_WAIT_FADE_OUT;
            }
            break;
        }
        NamingScreen_HandlePageSwitch(data->bgConfig, data->windows, &data->pageSwitchState, data->pageNum, &data->activeKeyboardBgId, data->bgPosVecs, data->uiSprites, data->charData->pRawData);
        NamingScreen_UpdateSpritesAnims(data->spriteAnimUpdateReq, data->uiSprites, data->pageNum);
        NamingScreen_PaletteGlowEffect(&data->plttGlowEffectAngle);
        break;
    case NS_MAIN_STATE_WAIT_FADE_OUT:
        if (IsPaletteFadeFinished()) {
            return TRUE;
        }
        break;
    }

    SpriteList_RenderAndAnimateSprites(data->spriteList);
    return FALSE;
}

static NamingScreenMainState NamingScreen_HandleInput(NamingScreenAppData *data, NamingScreenMainState state) {
    NamingScreenMainState ret = state;

    NamingScreen_GetPlayerInput(data);
    if (gSystem.newKeys & PAD_BUTTON_SELECT) {
        if (!Sprite_GetDrawFlag(data->uiSprites[8])) {
            Sprite_SetDrawFlag(data->uiSprites[8], TRUE);
            return ret;
        }
        if (data->type != NAME_SCREEN_UNK4) {
            data->pageSwitchState = NS_PAGESWITCH_STATE_DRAW_NEW_PAGE;
            ++data->pageNum;
            if (data->pageNum >= 3) {
                data->pageNum = 0;
            }
            ++data->spriteAnimUpdateReq[data->pageNum];
            NamingScreen_LoadKeyboardLayout(data->keyboard, data->pageNum);
            PlaySE(SEQ_SE_DP_SYU03);
            data->kbCursor.showCursor = TRUE;
        }
        ++data->spriteAnimUpdateReq[data->pageNum];
        NamingScreen_LoadKeyboardLayout(data->keyboard, data->pageNum);
        PlaySE(SEQ_SE_DP_SYU03);
    } else if (gSystem.newKeys & PAD_BUTTON_A) {
        ret = NamingScreen_HandleCharacterInput(data, data->keyboard[data->kbCursor.y][data->kbCursor.x], TRUE);
        data->kbCursor.showCursor = TRUE;
    } else if (data->isTouchInput == TRUE) {
        ret = NamingScreen_HandleCharacterInput(data, data->keyboard[data->kbCursor.y][data->kbCursor.x], FALSE);
    } else if (gSystem.newKeys & PAD_BUTTON_B) {
        ret = NamingScreen_HandleCharacterInput(data, NAME_SCREEN_BUTTON_BACK, TRUE);
    } else if (gSystem.newKeys & PAD_BUTTON_R) {
        ret = NamingScreen_HandleCharacterInput(data, NAME_SCREEN_BUTTON_PAGE_JP_UNUSED_2, TRUE);
    }
    return ret;
}

#ifdef HEARTGOLD
#define FIRST_DEFAULT_NAME_MALE   msg_0254_00000
#define FIRST_DEFAULT_NAME_FEMALE msg_0254_00018
#define FIRST_DEFAULT_NAME_RIVAL  msg_0254_00084
#else
#define FIRST_DEFAULT_NAME_MALE   msg_0254_00042
#define FIRST_DEFAULT_NAME_FEMALE msg_0254_00060
#define FIRST_DEFAULT_NAME_RIVAL  msg_0254_00085
#endif // HEARTGOLD

// Called when the input is empty
static void NamingScreen_SetDefaultName(NamingScreenAppData *data, NamingScreenArgs *args) {
    String *string;

    if (data->type == NAME_SCREEN_PLAYER) {
        if (data->playerGenderOrMonSpecies == PLAYER_GENDER_MALE) {
            string = NewString_ReadMsgData(data->msgData_254, FIRST_DEFAULT_NAME_MALE + (LCRandom() % 18));
        } else if (data->playerGenderOrMonSpecies == PLAYER_GENDER_FEMALE) {
            string = NewString_ReadMsgData(data->msgData_254, FIRST_DEFAULT_NAME_FEMALE + (LCRandom() % 18));
        }
        // UB: Nonbinary players will not initialize string.
        String_Copy(args->nameInputString, string);
        String_Delete(string);
        CopyStringToU16Array(args->nameInputString, args->nameInputFlat, 10);
    } else if (data->type == NAME_SCREEN_RIVAL) {
        string = NewString_ReadMsgData(data->msgData_254, FIRST_DEFAULT_NAME_RIVAL);
        String_Copy(args->nameInputString, string);
        String_Delete(string);
        CopyStringToU16Array(args->nameInputString, args->nameInputFlat, 10);
    } else {
        // Remaining cases have their own separate handlers.
        args->noInput = TRUE;
    }
}

static BOOL NamingScreen_PMCharArrayIsAllSpaces(const u16 *s) {
    BOOL ret = TRUE;
    int i;

    for (i = 0;; ++i) {
        if (s[i] == EOS) {
            break;
        }
        if (s[i] != CHAR_SPACE) {
            ret = FALSE;
            // break;
        }
    }
    return ret;
}

BOOL NamingScreenApp_Exit(OVY_MANAGER *ovyMan, int *pState) {
    NamingScreenAppData *data = OverlayManager_GetData(ovyMan);
    NamingScreenArgs *args = OverlayManager_GetArgs(ovyMan);

    data->entryBuf[data->textCursorPos] = EOS;
    if (data->type == NAME_SCREEN_POKEMON) {
        Pokemon *mon = AllocMonZeroed(HEAP_ID_NAMING_SCREEN);
        CreateMon(mon, data->playerGenderOrMonSpecies, 5, 10, 10, 10, 10, 10);
        // wtf
        FreeToHeap(mon);
    }
    if (data->textCursorPos == 0 || !StringNotEqual(data->entryBuf, data->entryBufBak) || NamingScreen_PMCharArrayIsAllSpaces(data->entryBuf)) {
        NamingScreen_SetDefaultName(data, args);
    } else {
        CopyU16StringArray(data->entryBufBak, data->entryBuf);
        CopyU16StringArray(args->nameInputFlat, data->entryBuf);
        CopyU16ArrayToString(args->nameInputString, data->entryBuf);
    }
    String_Delete(data->unk_184);
    for (int i = 0; i < 7; ++i) {
        DestroySysTaskAndEnvironment(data->tasks[i]);
    }
    sub_0200AEB0(data->gfxResObjs[PM_LCD_TOP][GF_GFX_RES_TYPE_CHAR]);
    sub_0200AEB0(data->gfxResObjs[PM_LCD_BOTTOM][GF_GFX_RES_TYPE_CHAR]);
    sub_0200B0A8(data->gfxResObjs[PM_LCD_TOP][GF_GFX_RES_TYPE_PLTT]);
    sub_0200B0A8(data->gfxResObjs[PM_LCD_BOTTOM][GF_GFX_RES_TYPE_PLTT]);
    for (int i = 0; i < 4; ++i) {
        Destroy2DGfxResObjMan(data->gfxResMen[i]);
    }
    SpriteList_Delete(data->spriteList);
    OamManager_Free();
    FreeToHeapExplicit(HEAP_ID_NAMING_SCREEN, data->charDataRaw);
    if (data->type == NAME_SCREEN_POKEMON) {
        FreeToHeapExplicit(HEAP_ID_NAMING_SCREEN, data->monIconCharDaraRaw);
        FreeToHeapExplicit(HEAP_ID_NAMING_SCREEN, data->plttDataRaw);
    }
    FreeBgTilemapBuffer(data->bgConfig, GF_BG_LYR_SUB_3);
    ObjCharTransfer_Destroy();
    ObjPlttTransfer_Destroy();
    NamingScreen_UnloadBgGfx(data->bgConfig, data->windows);
    FontID_SetAccessLazy(0);
    GX_SetVisibleWnd(GX_WNDMASK_NONE);
    FontID_Release(2);
    if (data->battleMsgString != NULL) {
        String_Delete(data->battleMsgString);
    }
    String_Delete(data->promptString);
    String_Delete(data->unkJapaneseString);
    DestroyMsgData(data->msgData_197);
    DestroyMsgData(data->msgData_254);
    DestroyMsgData(data->msgData_249);
    MessageFormat_Delete(data->msgFormat);
    OverlayManager_FreeData(ovyMan);
    Main_SetVBlankIntrCB(NULL, NULL);
    DestroyHeap(HEAP_ID_NAMING_SCREEN);
    GfGfx_SetMainDisplay(PM_LCD_TOP);
    return TRUE;
}

// -------------------------------
// Public functions
// -------------------------------

NamingScreenArgs *NamingScreen_CreateArgs(HeapID heapId, NameScreenType kind, int param, int maxLen, Options *options, MenuInputStateMgr *pMenuInputState) {
    NamingScreenArgs *ret = AllocFromHeap(heapId, sizeof(NamingScreenArgs));
    ret->kind = kind;
    ret->playerGenderOrMonSpecies = param;
    ret->maxLen = maxLen;
    ret->noInput = FALSE;
    ret->nameInputFlat[0] = EOS;
    ret->nameInputString = String_New(32, heapId);
    ret->battleMsgId = 0;
    ret->pcStorage = 0;
    ret->monGender = 0;
    ret->options = options;
    ret->monForm = 0;
    ret->pMenuInputState = pMenuInputState;
    return ret;
}

void NamingScreen_DeleteArgs(NamingScreenArgs *namingScreenArgs) {
    GF_ASSERT(namingScreenArgs->nameInputString != NULL);
    GF_ASSERT(namingScreenArgs != NULL); // UB: should check this first
    String_Delete(namingScreenArgs->nameInputString);
    FreeToHeap(namingScreenArgs);
}

// -------------------------------
// Back to private scope
// -------------------------------

static void NamingScreen_VBlankCB(void *param) {
    GF_RunVramTransferTasks();
    OamManager_ApplyAndResetBuffers();
    OS_SetIrqCheckFlag(OS_IE_V_BLANK);
}

static void NamingScreen_InitFromArgs(NamingScreenAppData *data, NamingScreenArgs *args) {
    data->type = args->kind;
    data->playerGenderOrMonSpecies = args->playerGenderOrMonSpecies;
    data->monForm = args->monForm;
    data->maxLen = args->maxLen;
    data->monGender = args->monGender;
    data->options = args->options;
    data->pMenuInputState = args->pMenuInputState;
}

static void NamingScreen_SetGraphicsBanks(void) {
    GraphicsBanks graphicsBanks = {
        GX_VRAM_BG_128_A,
        GX_VRAM_BGEXTPLTT_NONE,
        GX_VRAM_SUB_BG_128_C,
        GX_VRAM_SUB_BGEXTPLTT_NONE,
        GX_VRAM_OBJ_128_B,
        GX_VRAM_OBJEXTPLTT_NONE,
        GX_VRAM_SUB_OBJ_16_I,
        GX_VRAM_SUB_OBJEXTPLTT_NONE,
        GX_VRAM_TEX_NONE,
        GX_VRAM_TEXPLTT_NONE,
    };
    ;
    GfGfx_SetBanks(&graphicsBanks);
}

static void NamingScreen_SetBgModesAndInitBuffers(BgConfig *bgConfig) {
    {
        GraphicsModes graphicsModes = {
            GX_DISPMODE_GRAPHICS,
            GX_BGMODE_0,
            GX_BGMODE_0,
            GX_BG0_AS_2D,
        };
        SetBothScreensModesAndDisable(&graphicsModes);
    }

    {
        BgTemplate bgTemplate = {
            .x = 0x00000000,
            .y = 0x00000000,
            .bufferSize = GF_BG_BUF_SIZE_512x256_4BPP,
            .baseTile = 0x00000000,
            .size = GF_BG_SCR_SIZE_512x256,
            .colorMode = GX_BG_COLORMODE_16,
            .screenBase = GX_BG_SCRBASE_0xf000,
            .charBase = GX_BG_CHARBASE_0x10000,
            .bgExtPltt = GX_BG_EXTPLTT_01,
            .priority = 1,
            .areaOver = GX_BG_AREAOVER_XLU,
            .mosaic = 0x00000000,
        };
        InitBgFromTemplate(bgConfig, GF_BG_LYR_MAIN_0, &bgTemplate, GF_BG_TYPE_TEXT);
        BgClearTilemapBufferAndCommit(bgConfig, GF_BG_LYR_MAIN_0);
    }

    {
        BgTemplate bgTemplate = {
            .x = 0x00000000,
            .y = 0x00000000,
            .bufferSize = GF_BG_BUF_SIZE_512x256_4BPP,
            .baseTile = 0x00000000,
            .size = GF_BG_SCR_SIZE_512x256,
            .colorMode = GX_BG_COLORMODE_16,
            .screenBase = GX_BG_SCRBASE_0xe000,
            .charBase = GX_BG_CHARBASE_0x10000,
            .bgExtPltt = GX_BG_EXTPLTT_01,
            .priority = 2,
            .areaOver = GX_BG_AREAOVER_XLU,
            .mosaic = 0x00000000,
        };
        InitBgFromTemplate(bgConfig, GF_BG_LYR_MAIN_1, &bgTemplate, GF_BG_TYPE_TEXT);
        BgClearTilemapBufferAndCommit(bgConfig, GF_BG_LYR_MAIN_1);
    }

    {
        BgTemplate bgTemplate = {
            .x = 0x00000000,
            .y = 0x00000000,
            .bufferSize = GF_BG_BUF_SIZE_256x256_4BPP,
            .baseTile = 0x00000000,
            .size = GF_BG_SCR_SIZE_256x256,
            .colorMode = GX_BG_COLORMODE_16,
            .screenBase = GX_BG_SCRBASE_0xd000,
            .charBase = GX_BG_CHARBASE_0x00000,
            .bgExtPltt = GX_BG_EXTPLTT_01,
            .priority = 3,
            .areaOver = GX_BG_AREAOVER_XLU,
            .mosaic = 0x00000000,
        };
        InitBgFromTemplate(bgConfig, GF_BG_LYR_MAIN_2, &bgTemplate, GF_BG_TYPE_TEXT);
        BgClearTilemapBufferAndCommit(bgConfig, GF_BG_LYR_MAIN_2);
    }

    {
        BgTemplate bgTemplate = {
            .x = 0x00000000,
            .y = 0x00000000,
            .bufferSize = GF_BG_BUF_SIZE_256x256_4BPP,
            .baseTile = 0x00000000,
            .size = GF_BG_SCR_SIZE_256x256,
            .colorMode = GX_BG_COLORMODE_16,
            .screenBase = GX_BG_SCRBASE_0xf800,
            .charBase = GX_BG_CHARBASE_0x10000,
            .bgExtPltt = GX_BG_EXTPLTT_01,
            .priority = 0,
            .areaOver = GX_BG_AREAOVER_XLU,
            .mosaic = 0x00000000,
        };
        InitBgFromTemplate(bgConfig, GF_BG_LYR_SUB_0, &bgTemplate, GF_BG_TYPE_TEXT);
        BgClearTilemapBufferAndCommit(bgConfig, GF_BG_LYR_SUB_0);
    }

    NamingScreen_ToggleGfxPlanes(GF_PLANE_TOGGLE_OFF);
    BG_ClearCharDataRange(GF_BG_LYR_MAIN_0, 0x20, 0, HEAP_ID_NAMING_SCREEN);
    BG_ClearCharDataRange(GF_BG_LYR_SUB_0, 0x20, 0, HEAP_ID_NAMING_SCREEN);
    GX_SetVisibleWnd(GX_WNDMASK_W0);
    G2_SetWnd0InsidePlane(GX_WND_PLANEMASK_BG2 | GX_WND_PLANEMASK_OBJ, 1);
    G2_SetWndOutsidePlane(GX_WND_PLANEMASK_BG0 | GX_WND_PLANEMASK_BG1 | GX_WND_PLANEMASK_BG2 | GX_WND_PLANEMASK_BG3 | GX_WND_PLANEMASK_OBJ,
        1);
    G2_SetWnd0Position(0, 0, 255, 64);
    G2S_BlendNone();
}

static void NamingScreen_ToggleGfxPlanes(GFPlaneToggle enable) {
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG0, enable);
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG1, enable);
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG2, enable);
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG3, GF_PLANE_TOGGLE_OFF);
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_OBJ, enable);
    GfGfx_EngineBTogglePlanes(GX_PLANEMASK_BG0, enable);
    GfGfx_EngineBTogglePlanes(GX_PLANEMASK_BG1, GF_PLANE_TOGGLE_OFF);
    GfGfx_EngineBTogglePlanes(GX_PLANEMASK_OBJ, GF_PLANE_TOGGLE_OFF);
}

static void NamingScreen_InitKeyboardAndEntryCursors(NamingScreenAppData *data, OVY_MANAGER *ovyMan) {
    NamingScreenArgs *args = OverlayManager_GetArgs(ovyMan);

    data->pageSwitchState = NS_PAGESWITCH_STATE_IDLE;
    NamingScreen_SetPagePgPosVecs(data->bgPosVecs, GF_BG_LYR_MAIN_0);
    BgSetPosTextAndCommit(data->bgConfig, data->activeKeyboardBgId, BG_POS_OP_SET_X, data->bgPosVecs[data->activeKeyboardBgId].x);
    BgSetPosTextAndCommit(data->bgConfig, data->activeKeyboardBgId, BG_POS_OP_SET_Y, data->bgPosVecs[data->activeKeyboardBgId].y);
    BgSetPosTextAndCommit(data->bgConfig, data->activeKeyboardBgId ^ 1, BG_POS_OP_SET_X, data->bgPosVecs[data->activeKeyboardBgId ^ 1].x);
    BgSetPosTextAndCommit(data->bgConfig, data->activeKeyboardBgId ^ 1, BG_POS_OP_SET_Y, data->bgPosVecs[data->activeKeyboardBgId ^ 1].y);
    data->entryBufBak[0] = EOS;
    if (args->nameInputString != NULL) {
        CopyStringToU16Array(args->nameInputString, data->entryBufBak, 32);
    }
    MI_CpuFill16(data->entryBuf, 1, sizeof(data->entryBuf));
    if (data->type == NAME_SCREEN_POKEMON) {
        Pokemon *mon = AllocMonZeroed(HEAP_ID_NAMING_SCREEN);
        CreateMon(mon, data->playerGenderOrMonSpecies, 5, 10, 10, 10, 10, 10);
        BufferBoxMonSpeciesName(data->msgFormat, 0, Mon_GetBoxMon(mon));
        FreeToHeap(mon);
    }
    if (args->battleMsgId != 0) {
        data->printedFromBattleGMM = TRUE;
    }
    data->promptString = ReadMsgData_ExpandPlaceholders(data->msgFormat, data->msgData_249, _021020B4[data->type], HEAP_ID_NAMING_SCREEN);
    data->unkJapaneseString = ReadMsgData_ExpandPlaceholders(data->msgFormat, data->msgData_249, msg_0249_00009, HEAP_ID_NAMING_SCREEN);
    data->unk_184 = NewString_ReadMsgData(data->msgData_249, msg_0249_00007);
    data->textCursorPos = StringLength(data->entryBufBak);
    data->kbCursor.x = 0;
    data->kbCursor.y = 1;
    data->kbCursor.prevX = -1;
    data->kbCursor.prevY = -1;
    data->kbCursor.showCursor = TRUE;
    data->kbCursor.ignoreInput = FALSE;
    data->unk_484 = -1;
    data->unk_488 = 0;
    data->unk_48C = 0;
    data->entryBuf[data->maxLen] = EOS;
    for (int i = 0; i < 7; ++i) {
        data->spriteAnimUpdateReq[i] = 0;
    }
    if (data->type == NAME_SCREEN_UNK4) {
        data->spriteAnimUpdateReq[3] = 1;
    } else {
        data->spriteAnimUpdateReq[0] = 1;
    }
}

static void NamingScreen_PrepareBattleMessage(NamingScreenAppData *data, OVY_MANAGER *ovyMan) {
    NamingScreenArgs *args = OverlayManager_GetArgs(ovyMan);
    if (args->battleMsgId != 0) {
        String *string = String_New(200, HEAP_ID_NAMING_SCREEN);
        data->battleMsgString = NULL;
        int boxno = PCStorage_GetActiveBox(args->pcStorage);
        int nextOpenBoxNo = PCStorage_FindFirstBoxWithEmptySlot(args->pcStorage);
        BufferPCBoxName(data->msgFormat, 1, args->pcStorage, boxno);
        if (boxno != nextOpenBoxNo) {
            BufferPCBoxName(data->msgFormat, 2, args->pcStorage, nextOpenBoxNo);
            args->battleMsgId += 2;
        } else {
            BufferPCBoxName(data->msgFormat, 2, args->pcStorage, boxno);
        }
        if (data->textCursorPos == 0 || NamingScreen_PMCharArrayIsAllSpaces(data->entryBuf)) {
            Pokemon *mon = AllocMonZeroed(HEAP_ID_NAMING_SCREEN);
            CreateMon(mon, data->playerGenderOrMonSpecies, 1, 0, 0, 0, 0, 0);
            BufferBoxMonSpeciesName(data->msgFormat, 0, Mon_GetBoxMon(mon));
            FreeToHeap(mon);
        } else {
            data->entryBuf[data->textCursorPos] = EOS;
            CopyU16ArrayToString(string, data->entryBuf);
            BufferString(data->msgFormat, 0, string, 0, 0, 0);
        }
        data->battleMsgString = ReadMsgData_ExpandPlaceholders(data->msgFormat, data->msgData_197, args->battleMsgId, HEAP_ID_NAMING_SCREEN);
        data->printedFromBattleGMM = TRUE;
        String_Delete(string);
    }
}

static void NamingScreen_UnloadBgGfx(BgConfig *bgConfig, Window *windows) {
    for (int i = 0; i < 10; ++i) {
        RemoveWindow(&windows[i]);
    }
    FreeBgTilemapBuffer(bgConfig, GF_BG_LYR_SUB_0);
    FreeBgTilemapBuffer(bgConfig, GF_BG_LYR_MAIN_2);
    FreeBgTilemapBuffer(bgConfig, GF_BG_LYR_MAIN_1);
    FreeBgTilemapBuffer(bgConfig, GF_BG_LYR_MAIN_0);
    FreeToHeapExplicit(HEAP_ID_NAMING_SCREEN, bgConfig);
}

static void NamingScreen_CreateBgConfigAndLoadGfx(NamingScreenAppData *data, NARC *narc) {
    BgConfig *bgConfig = data->bgConfig;

    GfGfxLoader_GXLoadPalFromOpenNarc(narc, NARC_namein_namein_00000000_NCLR, GF_PAL_LOCATION_MAIN_BG, (enum GFPalSlotOffset)0, 0x60, HEAP_ID_NAMING_SCREEN);
    GfGfxLoader_GXLoadPal(NARC_a_0_1_4, 71, GF_PAL_LOCATION_SUB_BG, (enum GFPalSlotOffset)0, 0x20, HEAP_ID_NAMING_SCREEN);
    BG_SetMaskColor(GF_BG_LYR_SUB_0, RGB_BLACK);

    GfGfxLoader_LoadCharDataFromOpenNarc(narc, NARC_namein_namein_00000002_NCGR_lz, bgConfig, GF_BG_LYR_MAIN_2, 0, 0x2000, TRUE, HEAP_ID_NAMING_SCREEN);
    GfGfxLoader_LoadScrnDataFromOpenNarc(narc, NARC_namein_namein_00000004_NSCR_lz, bgConfig, GF_BG_LYR_MAIN_2, 0, 0x600, TRUE, HEAP_ID_NAMING_SCREEN);

    GfGfxLoader_LoadCharDataFromOpenNarc(narc, NARC_namein_namein_00000002_NCGR_lz, bgConfig, GF_BG_LYR_MAIN_1, 0, 0x2000, TRUE, HEAP_ID_NAMING_SCREEN);
    GfGfxLoader_LoadScrnDataFromOpenNarc(narc, NARC_namein_namein_00000006_NSCR_lz, bgConfig, GF_BG_LYR_MAIN_1, 0, 0x380, TRUE, HEAP_ID_NAMING_SCREEN);

    GfGfxLoader_LoadScrnDataFromOpenNarc(narc, NARC_namein_namein_00000007_NSCR_lz, bgConfig, GF_BG_LYR_MAIN_0, 0, 0x380, TRUE, HEAP_ID_NAMING_SCREEN);

    LoadFontPal1(GF_PAL_LOCATION_MAIN_BG, (enum GFPalSlotOffset)0x180, HEAP_ID_NAMING_SCREEN);
    LoadUserFrameGfx2(data->bgConfig, GF_BG_LYR_SUB_0, 0x100, 10, Options_GetFrame(data->options), HEAP_ID_NAMING_SCREEN);
    LoadFontPal1(GF_PAL_LOCATION_SUB_BG, (enum GFPalSlotOffset)0x180, HEAP_ID_NAMING_SCREEN);

    data->charDataRaw = GfGfxLoader_GetCharDataFromOpenNarc(narc, NARC_namein_namein_00000016_NCGR_lz, TRUE, &data->charData, HEAP_ID_NAMING_SCREEN);
}

static void NamingScreen_InitObjCharPlttTransfer(void) {
    ObjCharTransferTemplate tmplate = {
        .maxTasks = 20,
        .sizeMain = 0x800,
        .sizeSub = 0x800,
        .heapId = HEAP_ID_NAMING_SCREEN,
    };
    ObjCharTransfer_Init(&tmplate);
    ObjPlttTransfer_Init(20, HEAP_ID_NAMING_SCREEN);
    ObjCharTransfer_ClearBuffers();
    ObjPlttTransfer_Reset();
}

static void NamingScreen_LoadObjGfx(NamingScreenAppData *data, NARC *narc) {
    NNS_G2dInitOamManagerModule();
    GX_SetOBJVRamModeChar(GX_OBJVRAMMODE_CHAR_1D_32K);
    GXS_SetOBJVRamModeChar(GX_OBJVRAMMODE_CHAR_1D_32K);
    OamManager_Create(0, 128, 0, 32, 0, 128, 0, 32, HEAP_ID_NAMING_SCREEN);
    data->spriteList = G2dRenderer_Init(44, &data->g2dRender, HEAP_ID_NAMING_SCREEN);
    G2dRenderer_SetSubSurfaceCoords(&data->g2dRender, 0, FX32_CONST(256));

    for (int i = 0; i < 4; ++i) {
        data->gfxResMen[i] = Create2DGfxResObjMan(2, (GfGfxResType)i, HEAP_ID_NAMING_SCREEN);
    }

    data->gfxResObjs[PM_LCD_TOP][GF_GFX_RES_TYPE_CHAR] = AddCharResObjFromOpenNarc(data->gfxResMen[GF_GFX_RES_TYPE_CHAR], narc, NARC_namein_namein_00000010_NCGR_lz, TRUE, 0, NNS_G2D_VRAM_TYPE_2DMAIN, HEAP_ID_NAMING_SCREEN);
    data->gfxResObjs[PM_LCD_TOP][GF_GFX_RES_TYPE_PLTT] = AddPlttResObjFromOpenNarc(data->gfxResMen[GF_GFX_RES_TYPE_PLTT], narc, NARC_namein_namein_00000001_NCLR, FALSE, 0, NNS_G2D_VRAM_TYPE_2DMAIN, 9, HEAP_ID_NAMING_SCREEN);
    data->gfxResObjs[PM_LCD_TOP][GF_GFX_RES_TYPE_CELL] = AddCellOrAnimResObjFromOpenNarc(data->gfxResMen[GF_GFX_RES_TYPE_CELL], narc, NARC_namein_namein_00000012_NCER_lz, TRUE, 0, GF_GFX_RES_TYPE_CELL, HEAP_ID_NAMING_SCREEN);
    data->gfxResObjs[PM_LCD_TOP][GF_GFX_RES_TYPE_ANIM] = AddCellOrAnimResObjFromOpenNarc(data->gfxResMen[GF_GFX_RES_TYPE_ANIM], narc, NARC_namein_namein_00000014_NANR_lz, TRUE, 0, GF_GFX_RES_TYPE_ANIM, HEAP_ID_NAMING_SCREEN);
    if (data->type == NAME_SCREEN_POKEMON) {
        data->monIconCharDaraRaw = GfGfxLoader_GetCharData(NARC_poketool_icongra_poke_icon, GetMonIconNaixEx(data->playerGenderOrMonSpecies, FALSE, data->monForm), FALSE, &data->monIconCharData, HEAP_ID_NAMING_SCREEN);
        DC_FlushRange(data->monIconCharData, 0x200);
        data->plttDataRaw = GfGfxLoader_GetPlttData(NARC_poketool_icongra_poke_icon, sub_02074490(), &data->plttData, HEAP_ID_NAMING_SCREEN);
        DC_FlushRange(data->plttData, 0x80);
    }

    data->gfxResObjs[PM_LCD_BOTTOM][GF_GFX_RES_TYPE_CHAR] = AddCharResObjFromOpenNarc(data->gfxResMen[GF_GFX_RES_TYPE_CHAR], narc, NARC_namein_namein_00000011_NCGR_lz, TRUE, 1, NNS_G2D_VRAM_TYPE_2DSUB, HEAP_ID_NAMING_SCREEN);
    data->gfxResObjs[PM_LCD_BOTTOM][GF_GFX_RES_TYPE_PLTT] = AddPlttResObjFromOpenNarc(data->gfxResMen[GF_GFX_RES_TYPE_PLTT], narc, NARC_namein_namein_00000001_NCLR, FALSE, 1, NNS_G2D_VRAM_TYPE_2DSUB, 3, HEAP_ID_NAMING_SCREEN);
    data->gfxResObjs[PM_LCD_BOTTOM][GF_GFX_RES_TYPE_CELL] = AddCellOrAnimResObjFromOpenNarc(data->gfxResMen[GF_GFX_RES_TYPE_CELL], narc, NARC_namein_namein_00000013_NCER_lz, TRUE, 1, GF_GFX_RES_TYPE_CELL, HEAP_ID_NAMING_SCREEN);
    data->gfxResObjs[PM_LCD_BOTTOM][GF_GFX_RES_TYPE_ANIM] = AddCellOrAnimResObjFromOpenNarc(data->gfxResMen[GF_GFX_RES_TYPE_ANIM], narc, NARC_namein_namein_00000015_NANR_lz, TRUE, 1, GF_GFX_RES_TYPE_ANIM, HEAP_ID_NAMING_SCREEN);

    sub_0200ACF0(data->gfxResObjs[PM_LCD_TOP][GF_GFX_RES_TYPE_CHAR]);
    sub_0200ACF0(data->gfxResObjs[PM_LCD_BOTTOM][GF_GFX_RES_TYPE_CHAR]);
    sub_0200AF94(data->gfxResObjs[PM_LCD_TOP][GF_GFX_RES_TYPE_PLTT]);
    sub_0200AF94(data->gfxResObjs[PM_LCD_BOTTOM][GF_GFX_RES_TYPE_PLTT]);
}

typedef struct SubspritePosControllerTaskData {
    Sprite *parent;
    Sprite *child;
    fx32 dx;
    int i;
} SubspritePosControllerTaskData;

static void SysTask_NamingScreen_SubspritePosController(SysTask *task, void *taskData) {
    SubspritePosControllerTaskData *data = taskData;
    VecFx32 *pMatrix = Sprite_GetMatrixPtr(data->parent);
    VecFx32 matrix;
    matrix.x = pMatrix->x + data->dx;
    matrix.y = FX32_ONE * sUISpritesParam[data->i][1];
    matrix.z = 0;
    Sprite_SetMatrix(data->child, &matrix);
}

static void NamingScreen_CreateSprites(NamingScreenAppData *data) {
    int i;
    CreateSpriteResourcesHeader(&data->spriteResHdr_Main, 0, 0, 0, 0, -1, -1, 0, 1, data->gfxResMen[GF_GFX_RES_TYPE_CHAR], data->gfxResMen[GF_GFX_RES_TYPE_PLTT], data->gfxResMen[GF_GFX_RES_TYPE_CELL], data->gfxResMen[GF_GFX_RES_TYPE_ANIM], NULL, NULL);
    CreateSpriteResourcesHeader(&data->spriteResHdr_Sub, 1, 1, 1, 1, -1, -1, 0, 0, data->gfxResMen[GF_GFX_RES_TYPE_CHAR], data->gfxResMen[GF_GFX_RES_TYPE_PLTT], data->gfxResMen[GF_GFX_RES_TYPE_CELL], data->gfxResMen[GF_GFX_RES_TYPE_ANIM], NULL, NULL);
    {
        SpriteTemplate spriteTemplate;
        spriteTemplate.spriteList = data->spriteList;
        spriteTemplate.header = &data->spriteResHdr_Main;
        spriteTemplate.position.x = FX32_CONST(32);
        spriteTemplate.position.y = FX32_CONST(96);
        spriteTemplate.position.z = 0;
        spriteTemplate.scale.x = FX32_ONE;
        spriteTemplate.scale.y = FX32_ONE;
        spriteTemplate.scale.z = FX32_ONE;
        spriteTemplate.rotation = 0;
        spriteTemplate.priority = 1;
        spriteTemplate.whichScreen = NNS_G2D_VRAM_TYPE_2DMAIN;
        spriteTemplate.heapId = HEAP_ID_NAMING_SCREEN;

        for (i = 0; i < 9; ++i) {
            spriteTemplate.position.x = sUISpritesParam[i][0] * FX32_ONE;
            spriteTemplate.position.y = sUISpritesParam[i][1] * FX32_ONE;
            data->uiSprites[i] = Sprite_CreateAffine(&spriteTemplate);
            Sprite_SetAnimActiveFlag(data->uiSprites[i], TRUE);
            Sprite_SetAnimCtrlSeq(data->uiSprites[i], sUISpritesParam[i][2]);
            Sprite_SetDrawPriority(data->uiSprites[i], sUISpritesParam[i][3]);
        }
        Sprite_SetDrawFlag(data->uiSprites[4], FALSE);
        for (i = 0; i < 7; ++i) {
            data->tasks[i] = CreateSysTaskAndEnvironment(SysTask_NamingScreen_SubspritePosController, sizeof(SubspritePosControllerTaskData), 5, HEAP_ID_NAMING_SCREEN);
            SubspritePosControllerTaskData *taskData = SysTask_GetData(data->tasks[i]);
            taskData->parent = data->uiSprites[7];
            taskData->child = data->uiSprites[i];
            taskData->dx = sUISpritesParam[i][0] * FX32_ONE;
            taskData->i = i;
        }
        for (i = 0; i < data->maxLen; ++i) {
            spriteTemplate.position.x = FX32_ONE * (80 + i * 12);
            spriteTemplate.position.y = FX32_ONE * 39;
            data->textEntrySprites[i] = Sprite_CreateAffine(&spriteTemplate);
            Sprite_SetAnimActiveFlag(data->textEntrySprites[i], TRUE);
            Sprite_SetAnimCtrlSeq(data->textEntrySprites[i], 43);
        }
        NamingScreen_UpdateSprite_HighlightedCharacterInInputBuffer(data->textEntrySprites, data->textCursorPos, data->maxLen);
        NamingScreen_CreateIconSprite(data, &spriteTemplate);
    }
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_OBJ, GF_PLANE_TOGGLE_ON);
    GfGfx_EngineBTogglePlanes(GX_PLANEMASK_OBJ, GF_PLANE_TOGGLE_ON);
}

static void NamingScreen_CreateIconSprite(NamingScreenAppData *data, SpriteTemplate *tmplate) {
    tmplate->position.x = FX32_CONST(24);
    tmplate->position.y = FX32_CONST(8);
    data->iconSprites[0] = Sprite_CreateAffine(tmplate);
    Sprite_SetAnimActiveFlag(data->iconSprites[0], TRUE);

    switch (data->type) {
    case NAME_SCREEN_PLAYER:
        if (data->playerGenderOrMonSpecies == PLAYER_GENDER_MALE) {
            Sprite_SetAnimCtrlSeq(data->iconSprites[0], 48);
        } else {
            Sprite_SetAnimCtrlSeq(data->iconSprites[0], 49);
        }
        break;
    case NAME_SCREEN_RIVAL:
        Sprite_SetAnimCtrlSeq(data->iconSprites[0], 51);
        break;
    case NAME_SCREEN_UNK6:
        Sprite_SetAnimCtrlSeq(data->iconSprites[0], 55);
        break;
    case NAME_SCREEN_GROUP:
        Sprite_SetAnimCtrlSeq(data->iconSprites[0], 54);
        break;
    case NAME_SCREEN_UNK4:
    case NAME_SCREEN_UNK7:
        Sprite_SetAnimCtrlSeq(data->iconSprites[0], 53);
        break;
    case NAME_SCREEN_BOX:
        Sprite_SetAnimCtrlSeq(data->iconSprites[0], 47);
        break;
    case NAME_SCREEN_POKEMON:
        Sprite_SetAnimCtrlSeq(data->iconSprites[0], 50);
        if (data->monGender != 2) {
            tmplate->position.x = (13 * data->maxLen + 80) * FX32_ONE;
            tmplate->position.y = FX32_CONST(27);
            data->iconSprites[1] = Sprite_CreateAffine(tmplate);
            if (data->monGender == 0) {
                Sprite_SetAnimCtrlSeq(data->iconSprites[1], 45);
            } else {
                Sprite_SetAnimCtrlSeq(data->iconSprites[1], 46);
            }
        }
        break;
    }
}

typedef struct WiggleEffectTaskData {
    Sprite *sprite;
    int state;
    fx32 x;
    int y;
} WiggleEffectTaskData;

static void SysTask_NamingScreen_WiggleEffect(SysTask *task, void *taskData) {
    WiggleEffectTaskData
        *data
        = taskData;

    VecFx32 matrix;

    matrix.y = data->y;
    matrix.z = 0;
    switch (data->state) {
    case 0:
        matrix.x = data->x + FX32_CONST(4);
        Sprite_SetMatrix(data->sprite, &matrix);
        break;
    case 2:
        matrix.x = data->x - FX32_CONST(3);
        Sprite_SetMatrix(data->sprite, &matrix);
        break;
    case 4:
        matrix.x = data->x + FX32_CONST(2);
        Sprite_SetMatrix(data->sprite, &matrix);
        break;
    case 6:
        matrix.x = data->x;
        Sprite_SetMatrix(data->sprite, &matrix);
        DestroySysTaskAndEnvironment(task); // invalidates data
        break;
    }
    ++data->state; // UB: potential use after free
}

static void NamingScreen_HandlePageSwitch(BgConfig *bgConfig, Window *windows, int *pState, int pageNum, GFBgLayer *pBgId, VecFx32 *posVecs, Sprite **pSprites, void *pRawData) {
    GFBgLayer bgId_prev = *pBgId;
    GFBgLayer bgId_curr = (GFBgLayer)(bgId_prev ^ 1);

    switch (*pState) {
    case NS_PAGESWITCH_STATE_DRAW_NEW_PAGE: {
        u16 fillVal = sKeyboardFrameColors[pageNum] | (sKeyboardFrameColors[pageNum] << 4);
        GfGfxLoader_LoadScrnData(NARC_data_namein, pageNum + 6, bgConfig, bgId_prev, 0, 0x380, TRUE, HEAP_ID_NAMING_SCREEN);
        NamingScreen_SetPagePgPosVecs(posVecs, bgId_prev);
        NamingScreen_DrawKeyboardOnWindow(&windows[bgId_prev], fillVal, pageNum, MAKE_TEXT_COLOR(14, 15, 0), pRawData);
        ++(*pState);
        break;
    }
    case NS_PAGESWITCH_STATE_SET_INIT_POS:
        BgSetPosTextAndCommit(bgConfig, bgId_prev, BG_POS_OP_SET_X, 238);
        BgSetPosTextAndCommit(bgConfig, bgId_prev, BG_POS_OP_SET_Y, -80);
        ++*(pState);
        break;
    case NS_PAGESWITCH_STATE_MOVE_BGS:
        posVecs[bgId_prev].x -= 24;
        if (posVecs[bgId_prev].x < -1) {
            WiggleEffectTaskData
                *data;
            SysTask *task;

            task = CreateSysTaskAndEnvironment(SysTask_NamingScreen_WiggleEffect, sizeof(WiggleEffectTaskData), 0, HEAP_ID_NAMING_SCREEN);
            data = SysTask_GetData(task);
            data->sprite = pSprites[7];
            data->state = 0;
            data->x = Sprite_GetMatrixPtr(pSprites[7])->x;
            data->y = Sprite_GetMatrixPtr(pSprites[7])->y;
            posVecs[bgId_prev].x = -11;
            ++(*pState);
        }
        posVecs[bgId_curr].y -= 10;
        if (posVecs[bgId_curr].y < -196) {
            posVecs[bgId_curr].y = -196;
        }
        BgSetPosTextAndCommit(bgConfig, bgId_prev, BG_POS_OP_SET_X, posVecs[bgId_prev].x);
        BgSetPosTextAndCommit(bgConfig, bgId_curr, BG_POS_OP_SET_Y, posVecs[bgId_curr].y);
        break;
    case NS_PAGESWITCH_STATE_FINISH_BGS:
        posVecs[bgId_curr].y -= 10;
        if (posVecs[bgId_curr].y < -196) {
            posVecs[bgId_curr].y = -196;
        }
        BgSetPosTextAndCommit(bgConfig, bgId_prev, BG_POS_OP_SET_X, posVecs[bgId_prev].x);
        BgSetPosTextAndCommit(bgConfig, bgId_curr, BG_POS_OP_SET_Y, posVecs[bgId_curr].y);
        if (posVecs[bgId_prev].x == -11 && posVecs[bgId_curr].y == -196) {
            ++(*pState);
            (*pBgId) ^= 1;
            NamingScreen_SetPageBgPriorities(bgConfig, *pBgId, posVecs);
            PlaySE(SEQ_SE_DP_NAMEIN_01);
        }
        break;
    case NS_PAGESWITCH_STATE_IDLE:
        break;
    }
}

static void NamingScreen_PrintMessageOnWindowLeftAlign(Window *window, NameScreenType unused, String *msg) {
    DrawFrameAndWindow2(window, FALSE, 0x100, 10);
    AddTextPrinterParameterized(window, 1, msg, 0, 0, TEXT_SPEED_INSTANT, NULL);
    CopyWindowToVram(window);
}

static void NamingScreen_PrintMessageOnWindowWithMargin(Window *window, NameScreenType unused, String *msg) {
    int x = 16;
    int width = FontID_String_GetWidth(0, msg, 0);
    int windowWidth = GetWindowWidth(window) * 8;
    if (width + 16 > windowWidth) {
        x = windowWidth - width;
    }
    FillWindowPixelBuffer(window, 1);
    AddTextPrinterParameterizedWithColor(window, 0, msg, x, 0, TEXT_SPEED_INSTANT, MAKE_TEXT_COLOR(14, 15, 1), NULL);
    CopyWindowToVram(window);
}

static void NamingScreen_InitWindows(NamingScreenAppData *data, OVY_MANAGER *ovyMan, NARC *narc) {
    AddWindowParameterized(data->bgConfig, &data->windows[0], GF_BG_LYR_MAIN_0, 2, 1, 26, 12, 1, 0x100);
    AddWindowParameterized(data->bgConfig, &data->windows[1], GF_BG_LYR_MAIN_1, 2, 1, 26, 12, 1, 0x238);

    if (data->type == NAME_SCREEN_UNK4) {
        GfGfxLoader_LoadScrnDataFromOpenNarc(narc, NARC_namein_namein_00000009_NSCR_lz, data->bgConfig, GF_BG_LYR_MAIN_1, 0, 0x380, TRUE, HEAP_ID_NAMING_SCREEN);
        data->pageNum = 4;
        NamingScreen_LoadKeyboardLayout(data->keyboard, 4);
        NamingScreen_DrawKeyboardOnWindow(&data->windows[1], 0x0A0A, 4, MAKE_TEXT_COLOR(14, 15, 0), data->charData->pRawData);
    } else {
        data->pageNum = 0;
        NamingScreen_LoadKeyboardLayout(data->keyboard, 0);
        NamingScreen_DrawKeyboardOnWindow(&data->windows[1], 0x0404, 0, MAKE_TEXT_COLOR(14, 15, 0), data->charData->pRawData);
    }

    AddWindowParameterized(data->bgConfig, &data->windows[2], GF_BG_LYR_MAIN_2, 7, 2, 22, 2, 0, 0x370);

    int win3Width = (data->maxLen * 12) / 8 + 1;
    AddWindowParameterized(data->bgConfig, &data->windows[3], GF_BG_LYR_MAIN_2, 10, 3, win3Width, 2, 0, 0x39C);
    FillWindowPixelBuffer(&data->windows[3], 1);

    AddWindowParameterized(data->bgConfig, &data->windows[8], GF_BG_LYR_MAIN_2, win3Width + 9, 3, 7, 2, 0, 0x3C0);
    FillWindowPixelBuffer(&data->windows[8], 1);

    if (data->type == NAME_SCREEN_GROUP) {
        NamingScreen_PrintMessageOnWindowWithMargin(&data->windows[8], data->type, data->unk_184);
        CopyWindowToVram(&data->windows[8]);
    }

    AddWindowParameterized(data->bgConfig, &data->windows[9], GF_BG_LYR_SUB_0, 2, 19, 27, 4, 12, 0x084);
    FillWindowPixelBuffer(&data->windows[9], 15);
    NamingScreen_PrintMessageOnWindowLeftAlign(&data->windows[9], data->type, data->promptString);

    OverlayManager_GetArgs(ovyMan);

    if (data->entryBufBak[0] != EOS) {
        CopyU16StringArray(data->entryBuf, data->entryBufBak);
        NamingScreen_BlitRawCharactersToWindow(&data->windows[3], data->entryBuf, 0, 0, 12, TEXT_SPEED_INSTANT, MAKE_TEXT_COLOR(14, 15, 1), NULL);
    }

    for (int i = 0; i < 3; ++i) {
        AddWindowParameterized(data->bgConfig, &data->windows[i + 4], GF_BG_LYR_MAIN_2, 0, 0, 2, 2, 0, 0x078);
        FillWindowPixelBuffer(&data->windows[i + 4], 0);
    }

    AddWindowParameterized(data->bgConfig, &data->windows[7], GF_BG_LYR_MAIN_2, 0, 0, 16, 2, 0, 0x084);
    FillWindowPixelBuffer(&data->windows[7], 0);
}

static void NamingScreen_SetPageBgPriorities(BgConfig *bgConfig, GFBgLayer bgId, VecFx32 *pos) {
    SetBgPriority(bgId, 1);
    SetBgPriority(bgId ^ 1, 2);
}

static void NamingScreen_SetPagePgPosVecs(VecFx32 *posVecs, GFBgLayer bgId) {
    posVecs[bgId].x = 238;
    posVecs[bgId].y = -80;
    posVecs[bgId ^ 1].x = -11;
    posVecs[bgId ^ 1].y = -80;
}

static const int sDpadMovementCoordDeltas[][2] = {
    { 0,  0  },
    { 0,  -1 },
    { 0,  1  },
    { -1, 0  },
    { 1,  0  },
};

// If val is outside the range, clamp to the opposite side of that range
// The interval is right half open.
static int NamingScreen_WrapAroundWithinInterval(int val, int lo, int hi) {
    if (val >= hi) {
        val = lo;
    }
    if (val < lo) {
        val = hi - 1;
    }
    return val;
}

static void NamingScreen_MoveKeyboardCursor(NamingScreenAppData *data, int dpadMovement) {
    // Only run this logic if the keyboard cursor is moving in response to dpad input.
    if (dpadMovement == 0) {
        return;
    }

    u16 prevKey = data->keyboard[data->kbCursor.y][data->kbCursor.x];
    int newX = NamingScreen_WrapAroundWithinInterval(data->kbCursor.x + sDpadMovementCoordDeltas[dpadMovement][0], 0, 13);
    int newY = NamingScreen_WrapAroundWithinInterval(data->kbCursor.y + sDpadMovementCoordDeltas[dpadMovement][1], 0, 6);
    while (data->keyboard[newY][newX] == NAME_SCREEN_CONTROL_SKIP || (data->keyboard[newY][newX] == prevKey && data->keyboard[newY][newX] > NAME_SCREEN_BUTTON_START)) {
        if (data->kbCursor.prevY == 0 && data->keyboard[newY][newX] == NAME_SCREEN_CONTROL_SKIP && sDpadMovementCoordDeltas[dpadMovement][1] != 0) {
            newX = NamingScreen_WrapAroundWithinInterval(newX + data->kbCursor.deltaX, 0, 13);
        } else {
            newX = NamingScreen_WrapAroundWithinInterval(newX + sDpadMovementCoordDeltas[dpadMovement][0], 0, 13);
            newY = NamingScreen_WrapAroundWithinInterval(newY + sDpadMovementCoordDeltas[dpadMovement][1], 0, 6);
        }
    }
    data->kbCursor.x = newX;
    data->kbCursor.y = newY;
}

static void NamingScreen_GetPlayerInput(NamingScreenAppData *data) {
    int doUpdateCursor = 0;
    int dpadMovement = 0;
    BOOL buttonInputIsTransition = FALSE;
    if (!Sprite_GetDrawFlag(data->uiSprites[8])) {
        buttonInputIsTransition = TRUE;
    }

    if (gSystem.newAndRepeatedKeys & PAD_KEY_UP) {
        PlaySE(SEQ_SE_DP_SELECT);
        Sprite_SetDrawFlag(data->uiSprites[8], TRUE);
        dpadMovement = 1;
        ++doUpdateCursor;
    }
    if (gSystem.newAndRepeatedKeys & PAD_KEY_DOWN) {
        PlaySE(SEQ_SE_DP_SELECT);
        Sprite_SetDrawFlag(data->uiSprites[8], TRUE);
        dpadMovement = 2;
        ++doUpdateCursor;
    }
    if (gSystem.newAndRepeatedKeys & PAD_KEY_LEFT) {
        PlaySE(SEQ_SE_DP_SELECT);
        Sprite_SetDrawFlag(data->uiSprites[8], TRUE);
        dpadMovement = 3;
        ++doUpdateCursor;
    }
    if (gSystem.newAndRepeatedKeys & PAD_KEY_RIGHT) {
        PlaySE(SEQ_SE_DP_SELECT);
        Sprite_SetDrawFlag(data->uiSprites[8], TRUE);
        dpadMovement = 4;
        ++doUpdateCursor;
    }
    if (gSystem.newKeys & PAD_BUTTON_START) {
        PlaySE(SEQ_SE_DP_SELECT);
        Sprite_SetDrawFlag(data->uiSprites[8], TRUE);
        data->kbCursor.x = 12;
        data->kbCursor.y = 0;
        ++doUpdateCursor;
    }
    data->isTouchInput = NamingScreen_HandleTouchInput(data);
    if (data->isTouchInput == TRUE) {
        dpadMovement = 0;
        ++doUpdateCursor;
    }
    if (buttonInputIsTransition == TRUE) {
        doUpdateCursor = 0;
        NamingScreen_UpdateCursorSpritePosition(data, dpadMovement);
    }
    if (doUpdateCursor) {
        NamingScreen_MoveKeyboardCursor(data, dpadMovement);
        NamingScreen_UpdateCursorSpritePosition(data, dpadMovement);
    }
}

static void NamingScreen_UpdateCursorSpritePosition(NamingScreenAppData *data, int dpadMovement) {
    if (data->kbCursor.y != 0) {
        if (data->kbCursor.prevY == 0 && data->kbCursor.prevY != data->kbCursor.y) {
            Sprite_SetAnimCtrlSeq(data->uiSprites[8], 39);
        }
        if (dpadMovement != 0) {
            Sprite_SetAnimCtrlSeq(data->uiSprites[8], 39);
        }

        VecFx32 vec;
        vec.x = (data->kbCursor.x * 16 + 26) * FX32_ONE;
        vec.y = ((data->kbCursor.y - 1) * 19 + 91) * FX32_ONE;
        // vec.z = 0;
        Sprite_SetMatrix(data->uiSprites[8], &vec);
    } else {
        int buttonId = data->keyboard[data->kbCursor.y][data->kbCursor.x] - NAME_SCREEN_BUTTON_PAGE_UPPER;
        VecFx32 vec;

        vec.x = sHomeRowCursorXCoords[buttonId] * FX32_ONE;
        vec.y = FX32_CONST(68);
        // vec.z = 0;
        Sprite_SetAnimCtrlSeq(data->uiSprites[8], sHomeRowCursorAnimIDs[buttonId]);
        Sprite_SetMatrix(data->uiSprites[8], &vec);
    }

    data->plttGlowEffectAngle = 180;
    Sprite_SetAnimationFrame(data->uiSprites[8], 0);
    data->kbCursor.prevX = data->kbCursor.x;
    data->kbCursor.prevY = data->kbCursor.y;
    if (sDpadMovementCoordDeltas[dpadMovement][0] != 0) {
        data->kbCursor.deltaX = sDpadMovementCoordDeltas[dpadMovement][0];
    }
}

static void NamingScreen_PaletteGlowEffect(u16 *pSinArg) {
    *pSinArg += 20;
    if (*pSinArg > 360) {
        *pSinArg = 0;
    }
    int val = ((GF_SinDeg(*pSinArg) * 10) / FX32_ONE) + 15;
    u16 col = RGB(29, val, 0);
    GX_LoadOBJPltt(&col, 0x3A, sizeof(col));
}

static void NamingScreen_BlitRawCharactersToWindow(Window *window, const u16 *rawChars, int x, int y, int spacing, int textSpeed, u32 color, u8 *buttonPixels) {
    int i = 0;
    int width;
    int centerX;
    u16 pmCharBuf[2];
    String *string = String_New(2, HEAP_ID_NAMING_SCREEN);
    while (rawChars[i] != EOS) {
        if (rawChars[i] == NAME_SCREEN_CONTROL_DAKU || rawChars[i] == NAME_SCREEN_CONTROL_HANDAKU || rawChars[i] == NAME_SCREEN_CONTROL_SPACE) {
            // This is unreachable outside of Japan.
            u16 buttonId = rawChars[i] - NAME_SCREEN_CONTROL_DAKU;
            BlitBitmapRectToWindow(window, buttonPixels + (buttonId * 256) / 2, 0, 0, 12, 12, x + i * spacing, y + 2, 12, 12);
        } else if (rawChars[i] == NAME_SCREEN_CONTROL_SKIP) {
            ++i;
            continue;
        } else {
            pmCharBuf[0] = rawChars[i];
            pmCharBuf[1] = EOS;
            width = FontID_FlatArray_GetWidth(0, pmCharBuf, 0);
            CopyU16ArrayToString(string, pmCharBuf);
            centerX = x + i * spacing + ((spacing - width) / 2);
            AddTextPrinterParameterizedWithColor(window, 0, string, centerX, y, textSpeed, color, NULL);
        }
        ++i;
    }
    String_Delete(string);
}

static const u8 _02101D3C[] = { 0x60, 0x68, 0x50, 0x58 };

static void *NamingScreen_PrintStringOnWindow_GetPixelBuffer(Window *window, String *string, FontID fontId, u32 color) {
    AddTextPrinterParameterizedWithColor(window, fontId, string, 0, 0, TEXT_SPEED_NOTRANSFER, color, NULL);
    return window->pixelBuffer;
}

static void NamingScreen_PrintCharacterOnWindowAndOBJ(Window *windows, const u16 *tmpBuf, void *charBuf, String *string) {
    u16 curCharBuf[21];
    u16 i;
    void *ptr;
    String *string2;

    FillWindowPixelBuffer(&windows[3], 0);
    ptr = NamingScreen_PrintStringOnWindow_GetPixelBuffer(&windows[3], string, 2, MAKE_TEXT_COLOR(13, 14, 15));
    DC_FlushRange(ptr, 0x800);

    for (i = 0; i < 4; ++i) {
        sub_02013A50(&windows[3], 4, 2, i * 4, 0, charBuf);
        DC_FlushRange(charBuf, 0x100);
        GXS_LoadOBJ(charBuf, _02101D3C[i] * 32, 0x100);
    }

    string2 = String_New(21, HEAP_ID_NAMING_SCREEN);
    for (i = 0; i < 3; ++i) {
        curCharBuf[0] = tmpBuf[i];
        curCharBuf[1] = EOS;

        FillWindowPixelBuffer(&windows[i], 0);
        CopyU16ArrayToString(string2, curCharBuf);
        ptr = NamingScreen_PrintStringOnWindow_GetPixelBuffer(&windows[i], string2, 2, MAKE_TEXT_COLOR(13, 14, 15));
        DC_FlushRange(ptr, 0x80);
        GXS_LoadOBJ(ptr, sSpriteGfxOffsets[i] * 32, 0x80);
    }

    String_Delete(string2);
}

static void NamingScreen_PrintLastCharacterOfEntryBuf(Window *window, u16 *entryBuf, u16 cursorPos, u16 *tmpBuf, void *charBuf, String *string) {
    int i;
    int j;
    u16 character;

    if (cursorPos == 0) {
        character = NAME_SCREEN_CONTROL_SPACE;
    } else {
        character = entryBuf[cursorPos - 1];
    }

    switch (character) {
    case NAME_SCREEN_CONTROL_DAKU:
    case NAME_SCREEN_CONTROL_HANDAKU:
    case NAME_SCREEN_CONTROL_SPACE:
    case NAME_SCREEN_CONTROL_SKIP:
    case NAME_SCREEN_BUTTON_PAGE_UPPER:
    case NAME_SCREEN_BUTTON_PAGE_LOWER:
    case NAME_SCREEN_BUTTON_PAGE_SYMBOLS:
    case NAME_SCREEN_BUTTON_PAGE_JP_UNUSED:
    case NAME_SCREEN_BUTTON_PAGE_JP_UNUSED_2:
    case NAME_SCREEN_BUTTON_BACK:
    case NAME_SCREEN_BUTTON_OK:
        character = CHAR_JP_SPACE;
        break;
    }

    for (i = 0; i < 3; ++i) {
        tmpBuf[i] = CHAR_JP_SPACE;
    }

    tmpBuf[0] = character;
    if (character != CHAR_JP_SPACE) {
        for (i = 0; i < NELEMS(sJpCharConvTable); ++i) {
            if (character == sJpCharConvTable[i][0]) {
                for (j = 0; j < 3; ++j) {
                    tmpBuf[j] = sJpCharConvTable[i][j];
                }
                break;
            }
            if (character == sJpCharConvTable[i][2]) {
                for (j = 0; j < 3; ++j) {
                    tmpBuf[j] = sJpCharConvTable[i][j];
                }
                break;
            }
        }
    }

    NamingScreen_PrintCharacterOnWindowAndOBJ(window, tmpBuf, charBuf, string);
}

static void NamingScreen_LoadKeyboardLayout(u16 (*keyboard)[13], const int pageNum) {
    int i;
    int j;

    for (i = 0; i < 13; ++i) {
        keyboard[0][i] = sKeyboardHomeRowLayoutPtrs[pageNum][i];
    }
    for (j = 0; j < 5; ++j) {
        for (i = 0; i < 13; ++i) {
            keyboard[j + 1][i] = sKeyboardLayoutPtrs[pageNum][j][i];
        }
    }
}

static NamingScreenMainState NamingScreen_HandleCharacterInput(NamingScreenAppData *data, u16 key, BOOL isButtonInput) {
    if (key == NAME_SCREEN_CONTROL_SPACE || key == NAME_SCREEN_CONTROL_SKIP) {
        key = CHAR_JP_SPACE;
    }
    if (data->type == NAME_SCREEN_UNK4) {
        if (key == NAME_SCREEN_BUTTON_PAGE_UPPER || key == NAME_SCREEN_BUTTON_PAGE_LOWER || key == NAME_SCREEN_BUTTON_PAGE_SYMBOLS || key == NAME_SCREEN_BUTTON_PAGE_JP_UNUSED) {
            key = CHAR_JP_SPACE;
        }
    }
    if (!Sprite_GetDrawFlag(data->uiSprites[8]) && gSystem.touchNew == 0) {
        Sprite_SetDrawFlag(data->uiSprites[8], TRUE);
        return NS_MAIN_STATE_INPUT_LOOP;
    }

    switch (key) {
    case NAME_SCREEN_CONTROL_DAKU:
        if (NamingScreen_JP_FlipDiacritic(CHARCONVTBL_DAKU_BEGIN, NELEMS(sJpCharConvTable), 1, NAME_SCREEN_CONTROL_DAKU, data->entryBuf, data->textCursorPos)) {
            FillWindowPixelBuffer(&data->windows[3], 1);
            NamingScreen_BlitRawCharactersToWindow(&data->windows[3], data->entryBuf, 0, 0, 12, TEXT_SPEED_INSTANT, MAKE_TEXT_COLOR(14, 15, 1), NULL);
            PlaySE(SEQ_SE_DP_BOX02);
        }
        break;
    case NAME_SCREEN_CONTROL_HANDAKU:
        if (NamingScreen_JP_FlipDiacritic(CHARCONVTBL_HANDAKU_BEGIN, NELEMS(sJpCharConvTable), 2, NAME_SCREEN_CONTROL_HANDAKU, data->entryBuf, data->textCursorPos)) {
            FillWindowPixelBuffer(&data->windows[3], 1);
            NamingScreen_BlitRawCharactersToWindow(&data->windows[3], data->entryBuf, 0, 0, 12, TEXT_SPEED_INSTANT, MAKE_TEXT_COLOR(14, 15, 1), NULL);
            PlaySE(SEQ_SE_DP_BOX02);
        }
        break;
    case NAME_SCREEN_BUTTON_PAGE_JP_UNUSED_2:
        if (NamingScreen_JP_FlipAlphaCase(CHARCONVTBL_ALPHA_BEGIN, NELEMS(sJpCharConvTable), data->entryBuf, data->textCursorPos)) {
            FillWindowPixelBuffer(&data->windows[3], 1);
            NamingScreen_BlitRawCharactersToWindow(&data->windows[3], data->entryBuf, 0, 0, 12, TEXT_SPEED_INSTANT, MAKE_TEXT_COLOR(14, 15, 1), NULL);
            ++data->spriteAnimUpdateReq[4];
            PlaySE(SEQ_SE_DP_BOX02);
        }
        break;
    case NAME_SCREEN_BUTTON_PAGE_UPPER:
    case NAME_SCREEN_BUTTON_PAGE_LOWER:
    case NAME_SCREEN_BUTTON_PAGE_SYMBOLS:
    case NAME_SCREEN_BUTTON_PAGE_JP_UNUSED:
        if (data->pageNum != key - NAME_SCREEN_BUTTON_PAGE_UPPER) {
            data->pageSwitchState = NS_PAGESWITCH_STATE_DRAW_NEW_PAGE;
            data->pageNum = key - NAME_SCREEN_BUTTON_PAGE_UPPER;
            NamingScreen_LoadKeyboardLayout(data->keyboard, data->pageNum);
            ++data->spriteAnimUpdateReq[key - NAME_SCREEN_BUTTON_PAGE_UPPER];
            PlaySE(SEQ_SE_DP_SYU03);
        }
        break;
    case NAME_SCREEN_BUTTON_BACK:
        if (data->textCursorPos != 0) {
            data->entryBuf[data->textCursorPos - 1] = EOS;
            --data->textCursorPos;
            FillWindowPixelBuffer(&data->windows[3], 1);
            if (data->textCursorPos == 0) {
                CopyWindowToVram(&data->windows[3]);
            } else {
                NamingScreen_BlitRawCharactersToWindow(&data->windows[3], data->entryBuf, 0, 0, 12, TEXT_SPEED_INSTANT, MAKE_TEXT_COLOR(14, 15, 1), NULL);
            }
            NamingScreen_PrintLastCharacterOfEntryBuf(&data->windows[4], data->entryBuf, data->textCursorPos, data->tmpBuf, data->charBuf, data->unkJapaneseString);
            NamingScreen_UpdateSprite_HighlightedCharacterInInputBuffer(data->textEntrySprites, data->textCursorPos, data->maxLen);
            ++data->spriteAnimUpdateReq[5];
            PlaySE(SEQ_SE_DP_SELECT);
        }
        break;
    case NAME_SCREEN_BUTTON_OK:
        sub_020164C4(data->unk_5C4);
        if (!data->printedFromBattleGMM) {
            PlaySE(SEQ_SE_DP_PIRORIRO);
            ++data->spriteAnimUpdateReq[6];
            BeginNormalPaletteFade(2, 0, 0, RGB_BLACK, 16, 1, HEAP_ID_NAMING_SCREEN);
            NamingScreen_UpdateFieldMenuInputState(data, isButtonInput);
            return NS_MAIN_STATE_WAIT_FADE_OUT;
        } else {
            data->pageSwitchState = NS_PAGESWITCH_STATE_PRINT_BATTLE_MESSAGE;
        }
        break;
    default:
        if (data->pageNum == 4 && key == CHAR_JP_SPACE) {
            return NS_MAIN_STATE_INPUT_LOOP;
        }
        if (data->textCursorPos != data->maxLen) {
            data->entryBuf[data->textCursorPos] = key;
            FillWindowPixelBuffer(&data->windows[3], 1);
            NamingScreen_BlitRawCharactersToWindow(&data->windows[3], data->entryBuf, 0, 0, 12, TEXT_SPEED_INSTANT, MAKE_TEXT_COLOR(14, 15, 1), NULL);
            ++data->textCursorPos;
            NamingScreen_UpdateSprite_HighlightedCharacterInInputBuffer(data->textEntrySprites, data->textCursorPos, data->maxLen);
            PlaySE(SEQ_SE_DP_BOX02);
            Sprite_SetDrawFlag(data->uiSprites[8], TRUE);
            Sprite_SetOamMode(data->uiSprites[8], GX_OAM_MODE_XLU);
            G2_SetBlendAlpha(0, GX_BLEND_PLANEMASK_BG0 | GX_BLEND_PLANEMASK_BG1 | GX_BLEND_PLANEMASK_BG2, 8, 8);
            Sprite_SetAnimCtrlSeq(data->uiSprites[8], 60);
            if (data->textCursorPos == data->maxLen) {
                data->kbCursor.ignoreInput = TRUE;
            }
            NamingScreen_PrintLastCharacterOfEntryBuf(&data->windows[4], data->entryBuf, data->textCursorPos, data->tmpBuf, data->charBuf, data->unkJapaneseString);
        }
        break;
    }

    return NS_MAIN_STATE_INPUT_LOOP;
}

static void NamingScreen_UpdateFieldMenuInputState(NamingScreenAppData *data, BOOL toggle) {
    if (data->pMenuInputState != NULL) {
        if (toggle == TRUE) {
            MenuInputStateMgr_SetState(data->pMenuInputState, MENU_INPUT_STATE_BUTTONS);
        } else {
            MenuInputStateMgr_SetState(data->pMenuInputState, MENU_INPUT_STATE_TOUCH);
        }
    }
}

static int NamingScreen_SearchJpConvTableForNonSpace(const u16 *table, int pos) {
    do {
        pos = NamingScreen_WrapAroundWithinInterval(pos + 1, 0, 3);
    } while (table[pos] == CHAR_JP_SPACE);
    return table[pos];
}

static BOOL NamingScreen_JP_FlipAlphaCase(int tableStart, int tableEnd, u16 *pmCharBuf, int cursorPos) {
    int i;
    int j;
    u16 key;

    if (cursorPos == 0) {
        return FALSE;
    }
    key = pmCharBuf[cursorPos - 1];
    for (i = tableStart; i < tableEnd; ++i) {
        for (j = 0; j < 3; ++j) {
            // This whole loop could be bypassed by simply checking whether key is space up-front
            if (key == sJpCharConvTable[i][j] && key != CHAR_JP_SPACE) {
                pmCharBuf[cursorPos - 1] = NamingScreen_SearchJpConvTableForNonSpace(sJpCharConvTable[i], j);
                return TRUE;
            }
        }
    }

    return FALSE;
}

static BOOL NamingScreen_JP_FlipDiacritic(int tableStart, int tableEnd, int convColno, int mode, u16 *pmCharBuf, int cursorPos) {
    int i;
    u16 key;

    if (cursorPos == 0 || pmCharBuf[cursorPos - 1] == CHAR_JP_SPACE) {
        return FALSE;
    }
    key = pmCharBuf[cursorPos - 1];
    for (i = tableStart; i < tableEnd; ++i) {
        if (key == sJpCharConvTable[i][0]) {
            pmCharBuf[cursorPos - 1] = sJpCharConvTable[i][convColno];
            return TRUE;
        }
    }
    for (i = tableStart; i < tableEnd; ++i) {
        if (key == sJpCharConvTable[i][convColno]) {
            pmCharBuf[cursorPos - 1] = sJpCharConvTable[i][0];
            return TRUE;
        }
    }
    switch (mode) {
    case NAME_SCREEN_CONTROL_DAKU:
        for (i = 0; i < NELEMS(sDakutenTable); ++i) {
            if (key == sDakutenTable[i][0]) {
                pmCharBuf[cursorPos - 1] = sDakutenTable[i][1];
                return TRUE;
            }
        }
        break;
    case NAME_SCREEN_CONTROL_HANDAKU:
        for (i = 0; i < NELEMS(sHandakutenTable); ++i) {
            if (key == sHandakutenTable[i][0]) {
                pmCharBuf[cursorPos - 1] = sHandakutenTable[i][1];
                return TRUE;
            }
        }
        break;
    case NAME_SCREEN_BUTTON_PAGE_JP_UNUSED_2:
        if (key == CHAR_JP_HIRA_DU) {
            pmCharBuf[cursorPos - 1] = CHAR_JP_HIRA_TU_SMALL;
            return TRUE;
        }
        if (key == CHAR_JP_KATA_DU) {
            pmCharBuf[cursorPos - 1] = CHAR_JP_KATA_TU_SMALL;
            return TRUE;
        }
        break;
    }

    return FALSE;
}

static void NamingScreen_UpdateSprite_HighlightedCharacterInInputBuffer(Sprite **sprites, int cursorPos, int maxLen) {
    for (int i = 0; i < maxLen; ++i) {
        Sprite_SetAnimCtrlSeq(sprites[i], 43);
    }
    if (cursorPos != maxLen) {
        Sprite_SetAnimCtrlSeq(sprites[cursorPos], 44);
    }
}

static const u8 sKeyboardFillValues[] = { 0x03, 0x06, 0x0C, 0x09, 0x09 };

static void NamingScreen_DrawKeyboardOnWindow(Window *window, u16 fillVal, int pageNum, u32 textColor, u8 *pRawData) {
    FillWindowPixelBuffer(window, fillVal);

    for (int i = 0; i < 6; ++i) {
        FillWindowPixelRect(window, sKeyboardFillValues[pageNum], 32 * i + 16, 0, 16, 19);
        FillWindowPixelRect(window, sKeyboardFillValues[pageNum], 32 * i + 16, 38, 16, 19);
        FillWindowPixelRect(window, sKeyboardFillValues[pageNum], 32 * i + 16, 76, 16, 19);
    }

    for (int i = 0; i < 7; ++i) {
        FillWindowPixelRect(window, sKeyboardFillValues[pageNum], 32 * i, 19, 16, 19);
        FillWindowPixelRect(window, sKeyboardFillValues[pageNum], 32 * i, 57, 16, 19);
    }

    for (int i = 0; i < 5; ++i) {
        NamingScreen_BlitRawCharactersToWindow(window, sKeyboardLayoutPtrs[pageNum][i], 0, 19 * i + 4, 16, TEXT_SPEED_NOTRANSFER, textColor, pRawData);
    }

    CopyWindowToVram(window);
}

static void NamingScreen_UpdateSpritesAnims(BOOL *req, Sprite **sprites, int pageNum) {
    for (int i = 0; i < 3; ++i) {
        if (req[i]) {
            for (int j = 0; j < 3; ++j) {
                Sprite_SetAnimCtrlSeq(sprites[j], sUISpritesParam[j][2]);
            }
            Sprite_SetAnimCtrlSeq(sprites[i], sUISpritesParam[i][2] - 3);
            break;
        }
    }
    for (int i = 5; i < 7; ++i) {
        if (req[i]) {
            Sprite_SetAnimCtrlSeq(sprites[i], sUISpritesParam[i][2] + 1);
        }
    }
    for (int i = 0; i < 7; ++i) {
        req[i] = FALSE;
    }
}

static void NamingScreen_PlaceCursorSprite(NamingScreenAppData *data) {
    if (Sprite_IsAnimated(data->uiSprites[8])) {
        return;
    }

    if (data->textCursorPos == data->maxLen) {
        data->kbCursor.x = 12;
        data->kbCursor.y = 0;
        Sprite_SetAnimCtrlSeq(data->uiSprites[8], 39);
        data->kbCursor.ignoreInput = FALSE;
    } else {
        Sprite_SetAnimCtrlSeq(data->uiSprites[8], 39);
    }
    if (!data->kbCursor.showCursor) {
        Sprite_SetDrawFlag(data->uiSprites[8], FALSE);
    } else {
        NamingScreen_UpdateCursorSpritePosition(data, 0);
    }
    Sprite_SetOamMode(data->uiSprites[8], GX_OAM_MODE_NORMAL);
}

static const NamingScreenTouchHitboxDef sTouchHitboxDef[] = {
    { .x = 0x19, .y = 0x3C, .sizeParam = 0, .cursorX = 0,  .cursorY = 0 },
    { .x = 0x39, .y = 0x3C, .sizeParam = 0, .cursorX = 2,  .cursorY = 0 },
    { .x = 0x59, .y = 0x3C, .sizeParam = 0, .cursorX = 4,  .cursorY = 0 },
    { .x = 0x00, .y = 0xC0, .sizeParam = 0, .cursorX = 4,  .cursorY = 0 },
    { .x = 0x9D, .y = 0x3C, .sizeParam = 1, .cursorX = 8,  .cursorY = 0 },
    { .x = 0xC5, .y = 0x3C, .sizeParam = 1, .cursorX = 11, .cursorY = 0 },
    { .x = 0x1C, .y = 0x58, .sizeParam = 2, .cursorX = 0,  .cursorY = 1 },
    { .x = 0x2C, .y = 0x58, .sizeParam = 2, .cursorX = 1,  .cursorY = 1 },
    { .x = 0x3C, .y = 0x58, .sizeParam = 2, .cursorX = 2,  .cursorY = 1 },
    { .x = 0x4C, .y = 0x58, .sizeParam = 2, .cursorX = 3,  .cursorY = 1 },
    { .x = 0x5C, .y = 0x58, .sizeParam = 2, .cursorX = 4,  .cursorY = 1 },
    { .x = 0x6C, .y = 0x58, .sizeParam = 2, .cursorX = 5,  .cursorY = 1 },
    { .x = 0x7C, .y = 0x58, .sizeParam = 2, .cursorX = 6,  .cursorY = 1 },
    { .x = 0x8C, .y = 0x58, .sizeParam = 2, .cursorX = 7,  .cursorY = 1 },
    { .x = 0x9C, .y = 0x58, .sizeParam = 2, .cursorX = 8,  .cursorY = 1 },
    { .x = 0xAC, .y = 0x58, .sizeParam = 2, .cursorX = 9,  .cursorY = 1 },
    { .x = 0xBC, .y = 0x58, .sizeParam = 2, .cursorX = 10, .cursorY = 1 },
    { .x = 0xCC, .y = 0x58, .sizeParam = 2, .cursorX = 11, .cursorY = 1 },
    { .x = 0xDC, .y = 0x58, .sizeParam = 2, .cursorX = 12, .cursorY = 1 },
    { .x = 0x1C, .y = 0x6B, .sizeParam = 2, .cursorX = 0,  .cursorY = 2 },
    { .x = 0x2C, .y = 0x6B, .sizeParam = 2, .cursorX = 1,  .cursorY = 2 },
    { .x = 0x3C, .y = 0x6B, .sizeParam = 2, .cursorX = 2,  .cursorY = 2 },
    { .x = 0x4C, .y = 0x6B, .sizeParam = 2, .cursorX = 3,  .cursorY = 2 },
    { .x = 0x5C, .y = 0x6B, .sizeParam = 2, .cursorX = 4,  .cursorY = 2 },
    { .x = 0x6C, .y = 0x6B, .sizeParam = 2, .cursorX = 5,  .cursorY = 2 },
    { .x = 0x7C, .y = 0x6B, .sizeParam = 2, .cursorX = 6,  .cursorY = 2 },
    { .x = 0x8C, .y = 0x6B, .sizeParam = 2, .cursorX = 7,  .cursorY = 2 },
    { .x = 0x9C, .y = 0x6B, .sizeParam = 2, .cursorX = 8,  .cursorY = 2 },
    { .x = 0xAC, .y = 0x6B, .sizeParam = 2, .cursorX = 9,  .cursorY = 2 },
    { .x = 0xBC, .y = 0x6B, .sizeParam = 2, .cursorX = 10, .cursorY = 2 },
    { .x = 0xCC, .y = 0x6B, .sizeParam = 2, .cursorX = 11, .cursorY = 2 },
    { .x = 0xDC, .y = 0x6B, .sizeParam = 2, .cursorX = 12, .cursorY = 2 },
    { .x = 0x1C, .y = 0x7E, .sizeParam = 2, .cursorX = 0,  .cursorY = 3 },
    { .x = 0x2C, .y = 0x7E, .sizeParam = 2, .cursorX = 1,  .cursorY = 3 },
    { .x = 0x3C, .y = 0x7E, .sizeParam = 2, .cursorX = 2,  .cursorY = 3 },
    { .x = 0x4C, .y = 0x7E, .sizeParam = 2, .cursorX = 3,  .cursorY = 3 },
    { .x = 0x5C, .y = 0x7E, .sizeParam = 2, .cursorX = 4,  .cursorY = 3 },
    { .x = 0x6C, .y = 0x7E, .sizeParam = 2, .cursorX = 5,  .cursorY = 3 },
    { .x = 0x7C, .y = 0x7E, .sizeParam = 2, .cursorX = 6,  .cursorY = 3 },
    { .x = 0x8C, .y = 0x7E, .sizeParam = 2, .cursorX = 7,  .cursorY = 3 },
    { .x = 0x9C, .y = 0x7E, .sizeParam = 2, .cursorX = 8,  .cursorY = 3 },
    { .x = 0xAC, .y = 0x7E, .sizeParam = 2, .cursorX = 9,  .cursorY = 3 },
    { .x = 0xBC, .y = 0x7E, .sizeParam = 2, .cursorX = 10, .cursorY = 3 },
    { .x = 0xCC, .y = 0x7E, .sizeParam = 2, .cursorX = 11, .cursorY = 3 },
    { .x = 0xDC, .y = 0x7E, .sizeParam = 2, .cursorX = 12, .cursorY = 3 },
    { .x = 0x1C, .y = 0x91, .sizeParam = 2, .cursorX = 0,  .cursorY = 4 },
    { .x = 0x2C, .y = 0x91, .sizeParam = 2, .cursorX = 1,  .cursorY = 4 },
    { .x = 0x3C, .y = 0x91, .sizeParam = 2, .cursorX = 2,  .cursorY = 4 },
    { .x = 0x4C, .y = 0x91, .sizeParam = 2, .cursorX = 3,  .cursorY = 4 },
    { .x = 0x5C, .y = 0x91, .sizeParam = 2, .cursorX = 4,  .cursorY = 4 },
    { .x = 0x6C, .y = 0x91, .sizeParam = 2, .cursorX = 5,  .cursorY = 4 },
    { .x = 0x7C, .y = 0x91, .sizeParam = 2, .cursorX = 6,  .cursorY = 4 },
    { .x = 0x8C, .y = 0x91, .sizeParam = 2, .cursorX = 7,  .cursorY = 4 },
    { .x = 0x9C, .y = 0x91, .sizeParam = 2, .cursorX = 8,  .cursorY = 4 },
    { .x = 0xAC, .y = 0x91, .sizeParam = 2, .cursorX = 9,  .cursorY = 4 },
    { .x = 0xBC, .y = 0x91, .sizeParam = 2, .cursorX = 10, .cursorY = 4 },
    { .x = 0xCC, .y = 0x91, .sizeParam = 2, .cursorX = 11, .cursorY = 4 },
    { .x = 0xDC, .y = 0x91, .sizeParam = 2, .cursorX = 12, .cursorY = 4 },
    { .x = 0x1C, .y = 0xA4, .sizeParam = 2, .cursorX = 0,  .cursorY = 5 },
    { .x = 0x2C, .y = 0xA4, .sizeParam = 2, .cursorX = 1,  .cursorY = 5 },
    { .x = 0x3C, .y = 0xA4, .sizeParam = 2, .cursorX = 2,  .cursorY = 5 },
    { .x = 0x4C, .y = 0xA4, .sizeParam = 2, .cursorX = 3,  .cursorY = 5 },
    { .x = 0x5C, .y = 0xA4, .sizeParam = 2, .cursorX = 4,  .cursorY = 5 },
    { .x = 0x6C, .y = 0xA4, .sizeParam = 2, .cursorX = 5,  .cursorY = 5 },
    { .x = 0x7C, .y = 0xA4, .sizeParam = 2, .cursorX = 6,  .cursorY = 5 },
    { .x = 0x8C, .y = 0xA4, .sizeParam = 2, .cursorX = 7,  .cursorY = 5 },
    { .x = 0x9C, .y = 0xA4, .sizeParam = 2, .cursorX = 8,  .cursorY = 5 },
    { .x = 0xAC, .y = 0xA4, .sizeParam = 2, .cursorX = 9,  .cursorY = 5 },
    { .x = 0xBC, .y = 0xA4, .sizeParam = 2, .cursorX = 10, .cursorY = 5 },
    { .x = 0xCC, .y = 0xA4, .sizeParam = 2, .cursorX = 11, .cursorY = 5 },
    { .x = 0xDC, .y = 0xA4, .sizeParam = 2, .cursorX = 12, .cursorY = 5 },
};

static BOOL NamingScreen_HandleTouchInput(NamingScreenAppData *data) {
    int i;
    int start = 0;
    u8 x;
    u8 y;
    u8 x0;
    u8 y0;
    u8 dx;
    u8 dy;
    if (data->type == NAME_SCREEN_UNK4) {
        start = 4;
    }
    if (gSystem.touchNew) {
        x = gSystem.touchX;
        y = gSystem.touchY;

        for (i = start; i < NELEMS(sTouchHitboxDef); ++i) {
            x0 = sTouchHitboxDef[i].x;
            y0 = sTouchHitboxDef[i].y;
            switch (sTouchHitboxDef[i].sizeParam) {
            case 0:
                dx = 31;
                dy = 22;
                break;
            case 1:
                dx = 32;
                dy = 22;
                break;
            case 2:
                dx = 16;
                dy = 19;
                break;
            }
            if (x >= x0 && y >= y0 && x <= x0 + dx && y <= y0 + dy) {
                data->kbCursor.x = sTouchHitboxDef[i].cursorX;
                data->kbCursor.y = sTouchHitboxDef[i].cursorY;
                return TRUE;
            }
        }
    }

    return FALSE;
}
