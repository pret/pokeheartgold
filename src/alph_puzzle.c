#include "alph_puzzle.h"

#include "global.h"

#include "constants/sndseq.h"

#include "application/annon/puzzle_gra.naix"
#include "data/resdat.naix"
#include "msgdata/msg.naix"
#include "msgdata/msg/msg_0002.h"

#include "font.h"
#include "gf_gfx_loader.h"
#include "gf_gfx_planes.h"
#include "menu_input_state.h"
#include "options.h"
#include "palette.h"
#include "player_data.h"
#include "render_window.h"
#include "save_vars_flags.h"
#include "sound_02004A44.h"
#include "sprite.h"
#include "sprite_system.h"
#include "sys_flags.h"
#include "system.h"
#include "text.h"
#include "touchscreen.h"
#include "unk_02005D10.h"
#include "unk_0200B150.h"
#include "unk_0200FA24.h"
#include "unk_020210A0.h"
#include "vram_transfer_manager.h"
#include "yes_no_prompt.h"

typedef enum AlphPuzzleStates {
    ALPH_PUZZLE_STATE_FADE_IN,
    ALPH_PUZZLE_STATE_WAIT_FOR_INPUT,
    ALPH_PUZZLE_STATE_PICKUP_TILE,
    ALPH_PUZZLE_STATE_HOLDING_TILE,
    ALPH_PUZZLE_STATE_ROTATE_TILE,
    ALPH_PUZZLE_STATE_QUIT,
    ALPH_PUZZLE_STATE_CLEAR,
    ALPH_PUZZLE_STATE_FADE_OUT,
    ALPH_PUZZLE_STATE_END
} AlphPuzzleStates;

// Indexes into sButtonHitboxes
#define TS_HITBOX_ALPH_QUIT 0

// The puzzle grid is a 6x6 layout, with
// the center 4x4 representing the solution
// space. The corners are blocked from use.
#define ALPH_PUZZLE_TILES_HIGH 6
#define ALPH_PUZZLE_TILES_WIDE 6

// Sprite objects
#define ALPH_SPRITE_RES_CURSORS     0
#define ALPH_SPRITE_RES_PUZZLETILES 1

#define ALPH_SPRITE_INDEX_DROP_CURSOR 0
#define ALPH_SPRITE_INDEX_PREV_CURSOR 1
#define ALPH_SPRITE_INDEX_TILE_00     2
#define ALPH_SPRITE_INDEX_TILE_01     3
#define ALPH_SPRITE_INDEX_TILE_02     4
#define ALPH_SPRITE_INDEX_TILE_03     5
#define ALPH_SPRITE_INDEX_TILE_04     6
#define ALPH_SPRITE_INDEX_TILE_05     7
#define ALPH_SPRITE_INDEX_TILE_06     8
#define ALPH_SPRITE_INDEX_TILE_07     9
#define ALPH_SPRITE_INDEX_TILE_08     10
#define ALPH_SPRITE_INDEX_TILE_09     11
#define ALPH_SPRITE_INDEX_TILE_10     12
#define ALPH_SPRITE_INDEX_TILE_11     13
#define ALPH_SPRITE_INDEX_TILE_12     14
#define ALPH_SPRITE_INDEX_TILE_13     15
#define ALPH_SPRITE_INDEX_TILE_14     16
#define ALPH_SPRITE_INDEX_TILE_15     17
#define ALPH_SPRITE_INDEX_MAX         18

// Windows
#define ALPH_WINDOW_UNUSED       0
#define ALPH_WINDOW_CONFIRM_QUIT 1
#define ALPH_WINDOW_FLAVOR_TEXT  2

typedef struct AlphPuzzleTile {
    u8 x;
    u8 y;
    u8 rotation;
    u8 isImmovable;
    Sprite *sprite;
} AlphPuzzleTile;

typedef struct AlphPuzzleData {
    HeapID heapId;
    MenuInputState menuInputState;
    int unkState;
    u16 subState;
    u16 sceneTimer;
    AlphPuzzleArgs *args;
    BgConfig *bgConfig;
    u8 unk18;
    u8 puzzleIndex;
    u8 quitTaskActive;
    u8 selectedTileIndex;
    s16 tileHoverPixelX;
    s16 tileHoverPixelY;
    u8 tileLastHoverPixelX;
    u8 tileLastHoverPixelY;
    u8 tileHoverTileX;
    u8 tileHoverTileY;
    u8 textPrinterId;
    u8 textFrameDelay;
    u8 frame;
    u8 puzzleSolved;
    MsgData *msgData;
    MessageFormat *messageFormat;
    String *unk30;
    String *quitText;
    String *hintText[ALPH_PUZZLE_MAX];
    String *confirmQuitText[1];
    Window window[3];
    YesNoPrompt *yesNoPrompt;
    PaletteData *palette;
    SpriteSystem *spriteRenderer;
    void *spriteGfxHandler;
    Sprite *sprites[ALPH_SPRITE_INDEX_MAX];
    NNSG2dScreenData *screenData;
    void *screenDataAlloc;
    AlphPuzzleTile tileGrid[16];
    AlphPuzzleTile *selectedTile;
} AlphPuzzleData;

typedef struct AlphPuzzleInitTileData {
    u8 index : 5;
    u8 rotation : 2;
    u8 isImmovable : 1;
} AlphPuzzleInitTileData;

typedef AlphPuzzleInitTileData AlphPuzzle[ALPH_PUZZLE_TILES_WIDE];

static void AlphPuzzle_ScreenOff(void);
static void AlphPuzzle_InitTextOptionsAndPuzzleIndex(AlphPuzzleData *data);
static void AlphPuzzle_Finish(AlphPuzzleData *data);
static BOOL AlphPuzzle_OverlayEnterStep(AlphPuzzleData *data);
static BOOL AlphPuzzle_OverlayExitStep(AlphPuzzleData *data);
static int AlphPuzzleMainSeq_FadeIn(AlphPuzzleData *data);
static int AlphPuzzleMainSeq_FadeOut(AlphPuzzleData *data);
static int AlphPuzzleMainSeq_WaitForInput(AlphPuzzleData *data);
static int AlphPuzzleMainSeq_PickupTile(AlphPuzzleData *data);
static int AlphPuzzleMainSeq_HoldingTile(AlphPuzzleData *data);
static int AlphPuzzleMainSeq_RotateTile(AlphPuzzleData *data);
static int AlphPuzzleMainSeq_Quit(AlphPuzzleData *data);
static int AlphPuzzleMainSeq_Clear(AlphPuzzleData *data);
static void AlphPuzzle_SetupGraphics(AlphPuzzleData *data);
static void AlphPuzzle_TeardownGraphics(AlphPuzzleData *data);
static void AlphPuzzle_DrawHintTextAndHideCursor(AlphPuzzleData *data);
static int AlphPuzzle_CheckInput(AlphPuzzleData *data);
static int AlphPuzzleMainSeq_PickupTile_impl(AlphPuzzleData *data);
static s32 AlphPuzzle_TrySelectTileTouchScreen(AlphPuzzleData *data, u16 touchX, u16 touchY);
static BOOL AlphPuzzle_GetTileDropCoords(AlphPuzzleData *data, u8 *xOut, u8 *yOut);
static int AlphPuzzleMainSeq_HoldingTile_impl(AlphPuzzleData *data);
static int AlphPuzzleMainSeq_RotateTile_impl(AlphPuzzleData *data);
static int AlphPuzzleMainSeq_Quit_impl(AlphPuzzleData *data);
static int AlphPuzzleMainSeq_Clear_impl(AlphPuzzleData *data);
static void AlphPuzzle_VBlankCB(void *dat);
static void AlphPuzzle_InitTileData(AlphPuzzleData *data);
static void AlphPuzzle_SetGraphicsBanks();
static void AlphPuzzle_AllocBackgroundBuffers(AlphPuzzleData *data);
static void AlphPuzzle_FreeBackgroundBuffers(AlphPuzzleData *data);
static void AlphPuzzle_LoadBackgroundGraphics(AlphPuzzleData *data);
static void AlphPuzzle_FreeBackgroundGraphics(AlphPuzzleData *data);
static void AlphPuzzle_InitText(AlphPuzzleData *data);
static void AlphPuzzle_DeleteText(AlphPuzzleData *data);
static void AlphPuzzle_CreateWindows(AlphPuzzleData *data);
static void AlphPuzzle_DestroyWindows(AlphPuzzleData *data);
static void AlphPuzzle_InitSpriteGraphics(AlphPuzzleData *data);
static void AlphPuzzle_DestroySpriteGraphicsEngine(AlphPuzzleData *data);
static void AlphPuzzle_CreateSpriteGraphics(AlphPuzzleData *data);
static void AlphPuzzle_DeleteSpriteGraphics(AlphPuzzleData *data);
static void AlphPuzzle_CreateSprites(AlphPuzzleData *data);
static void AlphPuzzle_DeleteSprites(AlphPuzzleData *data);
static BOOL AlphPuzzle_CheckComplete(AlphPuzzleData *data);
static void AlphPuzzle_ToggleDropCursorSprite(AlphPuzzleData *data, int a1);
static void AlphPuzzle_PrintConfirmQuitText(AlphPuzzleData *data, int a1, int a2, u8 textFrameDelay);
static void AlphPuzzle_PrintHintText(AlphPuzzleData *data);
static void AlphPuzzle_ClearOrSetBgTilesAtCoords(AlphPuzzleData *data, u8 x, u8 y, int a3);
static void AlphPuzzle_UpdateHoverGraphicOnBg(AlphPuzzleData *data, u8 x, u8 y);
static void AlphPuzzle_Quit_CreateYesNoPrompt(AlphPuzzleData *data);
static AlphPuzzleStates AlphPuzzle_Quit_HandleYesNoPrompt(AlphPuzzleData *data);
static void AlphPuzzle_SetSpritePosition_HandleRotation(AlphPuzzleTile *tile, s16 x, s16 y);
static void AlphPuzzle_PlaceTileInGrid(AlphPuzzleData *data, s16 tileIndex, u8 x, u8 y, u8 rotation);
static void AlphPuzzle_UpdateSelectedTile(AlphPuzzleData *data, u8 tileIndex, BOOL isSelecting);
static void AlphPuzzle_CreateQuitTask(AlphPuzzleData *data);
static void Task_AlphPuzzle_WaitDropCursorAnimOnQuit(SysTask *task, void *_data);

// Used to detect hovering over corners
static const u8 sCornerCoords[4][2] = {
    { 0, 0 },
    { 5, 0 },
    { 0, 5 },
    { 5, 5 },
};

// Region occupied by the QUIT button
static const TouchscreenHitbox sButtonHitboxes[] = {
    { .rect = { 169, 191, 209, 255 } },
    { .rect = { TOUCHSCREEN_RECTLIST_END } },
};

static const s8 sTileRotationXYOffsets[4][2] = {
    { 0,  0  },
    { -1, 0  },
    { -1, -1 },
    { 0,  -1 },
};

#define ALPH_TILE_BLANK ((AlphPuzzleInitTileData) { 0, 0, FALSE })

static const AlphPuzzle sAlphKabutoPuzzle[ALPH_PUZZLE_TILES_HIGH] = {
    {
     ALPH_TILE_BLANK,
     ALPH_TILE_BLANK,
     ALPH_TILE_BLANK,
     ALPH_TILE_BLANK,
     ALPH_TILE_BLANK,
     ALPH_TILE_BLANK,
     },
    {
     { 6, 1, FALSE },
     { 1, 0, TRUE },
     ALPH_TILE_BLANK,
     { 3, 0, TRUE },
     { 4, 0, TRUE },
     ALPH_TILE_BLANK,
     },
    {
     ALPH_TILE_BLANK,
     { 5, 0, TRUE },
     ALPH_TILE_BLANK,
     { 7, 0, TRUE },
     { 8, 0, TRUE },
     { 11, 2, FALSE },
     },
    {
     ALPH_TILE_BLANK,
     ALPH_TILE_BLANK,
     { 10, 0, TRUE },
     ALPH_TILE_BLANK,
     { 12, 0, TRUE },
     ALPH_TILE_BLANK,
     },
    {
     { 2, 3, FALSE },
     { 13, 0, TRUE },
     { 14, 0, TRUE },
     { 15, 0, TRUE },
     { 16, 0, TRUE },
     ALPH_TILE_BLANK,
     },
    {
     ALPH_TILE_BLANK,
     ALPH_TILE_BLANK,
     ALPH_TILE_BLANK,
     ALPH_TILE_BLANK,
     { 9, 1, FALSE },
     ALPH_TILE_BLANK,
     },
};

static const AlphPuzzle sAlphAerodactylPuzzle[ALPH_PUZZLE_TILES_HIGH] = {
    {
     ALPH_TILE_BLANK,
     { 10, 3, FALSE },
     ALPH_TILE_BLANK,
     { 14, 2, FALSE },
     ALPH_TILE_BLANK,
     ALPH_TILE_BLANK,
     },
    {
     ALPH_TILE_BLANK,
     ALPH_TILE_BLANK,
     ALPH_TILE_BLANK,
     { 3, 0, TRUE },
     { 4, 0, TRUE },
     ALPH_TILE_BLANK,
     },
    {
     ALPH_TILE_BLANK,
     ALPH_TILE_BLANK,
     ALPH_TILE_BLANK,
     { 7, 0, TRUE },
     { 8, 0, TRUE },
     { 16, 3, FALSE },
     },
    {
     { 2, 3, FALSE },
     { 9, 0, TRUE },
     ALPH_TILE_BLANK,
     { 11, 0, TRUE },
     { 12, 0, TRUE },
     ALPH_TILE_BLANK,
     },
    {
     ALPH_TILE_BLANK,
     { 13, 0, TRUE },
     ALPH_TILE_BLANK,
     { 15, 0, TRUE },
     ALPH_TILE_BLANK,
     { 6, 2, FALSE },
     },
    {
     ALPH_TILE_BLANK,
     ALPH_TILE_BLANK,
     { 1, 2, FALSE },
     ALPH_TILE_BLANK,
     { 5, 1, FALSE },
     ALPH_TILE_BLANK,
     },
};

static const AlphPuzzle sAlphOmanytePuzzle[ALPH_PUZZLE_TILES_HIGH] = {
    {
     ALPH_TILE_BLANK,
     ALPH_TILE_BLANK,
     { 11, 1, FALSE },
     ALPH_TILE_BLANK,
     { 10, 0, FALSE },
     ALPH_TILE_BLANK,
     },
    {
     { 9, 0, FALSE },
     ALPH_TILE_BLANK,
     { 2, 0, TRUE },
     { 3, 0, TRUE },
     { 4, 0, TRUE },
     ALPH_TILE_BLANK,
     },
    {
     ALPH_TILE_BLANK,
     { 5, 0, TRUE },
     { 6, 0, TRUE },
     ALPH_TILE_BLANK,
     ALPH_TILE_BLANK,
     { 14, 2, FALSE },
     },
    {
     { 8, 0, FALSE },
     ALPH_TILE_BLANK,
     ALPH_TILE_BLANK,
     ALPH_TILE_BLANK,
     ALPH_TILE_BLANK,
     { 13, 3, FALSE },
     },
    {
     { 1, 3, FALSE },
     ALPH_TILE_BLANK,
     ALPH_TILE_BLANK,
     { 15, 0, TRUE },
     { 16, 0, TRUE },
     ALPH_TILE_BLANK,
     },
    {
     ALPH_TILE_BLANK,
     { 7, 2, FALSE },
     { 12, 1, FALSE },
     ALPH_TILE_BLANK,
     ALPH_TILE_BLANK,
     ALPH_TILE_BLANK,
     },
};

static const AlphPuzzle sAlphHoOhPuzzle[ALPH_PUZZLE_TILES_HIGH] = {
    {
     ALPH_TILE_BLANK,
     ALPH_TILE_BLANK,
     { 9, 0, FALSE },
     { 14, 3, FALSE },
     { 1, 3, FALSE },
     ALPH_TILE_BLANK,
     },
    {
     { 15, 2, FALSE },
     ALPH_TILE_BLANK,
     ALPH_TILE_BLANK,
     { 3, 0, TRUE },
     { 4, 0, TRUE },
     ALPH_TILE_BLANK,
     },
    {
     { 13, 2, FALSE },
     { 5, 0, TRUE },
     { 6, 0, TRUE },
     { 7, 0, TRUE },
     ALPH_TILE_BLANK,
     { 10, 3, FALSE },
     },
    {
     { 2, 3, FALSE },
     ALPH_TILE_BLANK,
     ALPH_TILE_BLANK,
     ALPH_TILE_BLANK,
     { 12, 0, TRUE },
     ALPH_TILE_BLANK,
     },
    {
     ALPH_TILE_BLANK,
     ALPH_TILE_BLANK,
     ALPH_TILE_BLANK,
     ALPH_TILE_BLANK,
     { 16, 0, TRUE },
     { 11, 3, FALSE },
     },
    {
     ALPH_TILE_BLANK,
     { 5, 2, FALSE },
     { 8, 1, FALSE },
     ALPH_TILE_BLANK,
     ALPH_TILE_BLANK,
     ALPH_TILE_BLANK,
     },
};

static const AlphPuzzle *dAlphPuzzles[ALPH_PUZZLE_MAX] = {
    sAlphKabutoPuzzle,
    sAlphAerodactylPuzzle,
    sAlphOmanytePuzzle,
    sAlphHoOhPuzzle,
};

static const GraphicsBanks sGraphicsBanks = {
    GX_VRAM_BG_128_A,
    GX_VRAM_BGEXTPLTT_NONE,
    GX_VRAM_SUB_BG_128_C,
    GX_VRAM_SUB_BGEXTPLTT_NONE,
    GX_VRAM_OBJ_64_E,
    GX_VRAM_OBJEXTPLTT_NONE,
    GX_VRAM_SUB_OBJ_16_I,
    GX_VRAM_SUB_OBJEXTPLTT_NONE,
    GX_VRAM_TEX_NONE,
    GX_VRAM_TEXPLTT_NONE,
};

static const GraphicsModes sGraphicsMode = {
    GX_DISPMODE_GRAPHICS,
    GX_BGMODE_0,
    GX_BGMODE_0,
    GX_BG0_AS_2D,
};

static const BgTemplate sBgTemplate5 = {
    0,
    0,
    GF_BG_BUF_SIZE_256x256_4BPP,
    0x000,
    GF_BG_SCR_SIZE_256x256,
    GX_BG_COLORMODE_16,
    GX_BG_SCRBASE_0xf000,
    GX_BG_CHARBASE_0x00000,
    GX_BG_EXTPLTT_01,
    2,
    GX_BG_AREAOVER_XLU,
    0,
    FALSE,
};

static const BgTemplate sBgTemplate1 = {
    0,
    0,
    GF_BG_BUF_SIZE_256x256_4BPP,
    0x000,
    GF_BG_SCR_SIZE_256x256,
    GX_BG_COLORMODE_16,
    GX_BG_SCRBASE_0xf800,
    GX_BG_CHARBASE_0x10000,
    GX_BG_EXTPLTT_01,
    1,
    GX_BG_AREAOVER_XLU,
    0,
    FALSE,
};

static const BgTemplate sBgTemplate6 = {
    0,
    0,
    GF_BG_BUF_SIZE_256x256_4BPP,
    0x000,
    GF_BG_SCR_SIZE_256x256,
    GX_BG_COLORMODE_16,
    GX_BG_SCRBASE_0xe800,
    GX_BG_CHARBASE_0x00000,
    GX_BG_EXTPLTT_01,
    3,
    GX_BG_AREAOVER_XLU,
    0,
    FALSE,
};

static const BgTemplate sBgTemplate2 = {
    0,
    0,
    GF_BG_BUF_SIZE_256x256_4BPP,
    0x000,
    GF_BG_SCR_SIZE_256x256,
    GX_BG_COLORMODE_16,
    GX_BG_SCRBASE_0xf000,
    GX_BG_CHARBASE_0x00000,
    GX_BG_EXTPLTT_01,
    2,
    GX_BG_AREAOVER_XLU,
    0,
    FALSE,
};

static const BgTemplate sBgTemplate3 = {
    0,
    0,
    GF_BG_BUF_SIZE_256x256_4BPP,
    0x000,
    GF_BG_SCR_SIZE_256x256,
    GX_BG_COLORMODE_16,
    GX_BG_SCRBASE_0xe800,
    GX_BG_CHARBASE_0x00000,
    GX_BG_EXTPLTT_01,
    3,
    GX_BG_AREAOVER_XLU,
    0,
    FALSE,
};

static const BgTemplate sBgTemplate4 = {
    0,
    0,
    GF_BG_BUF_SIZE_256x256_4BPP,
    0x000,
    GF_BG_SCR_SIZE_256x256,
    GX_BG_COLORMODE_16,
    GX_BG_SCRBASE_0xf800,
    GX_BG_CHARBASE_0x10000,
    GX_BG_EXTPLTT_01,
    0,
    GX_BG_AREAOVER_XLU,
    0,
    FALSE,
};

static const WindowTemplate sWindowTemplates[3] = {
    { 2, 26, 21, 6,  3, 3, 0x3EE },
    { 0, 2,  19, 27, 4, 4, 0x05B },
    { 4, 4,  15, 24, 6, 3, 0x001 },
};

static const OamManagerParam ov110_021E6EA4 = { 0, 128, 0, 32, 0, 128, 0, 32 };

static const OamCharTransferParam ov110_021E6DD0 = { 5, 0, 0, GX_OBJVRAMMODE_CHAR_1D_32K, GX_OBJVRAMMODE_CHAR_1D_32K };

static const u16 sResdatInfo[7] = {
    NARC_resdat_resdat_00000010_bin, // GF_GFX_RES_TYPE_CHAR
    NARC_resdat_resdat_00000011_bin, // GF_GFX_RES_TYPE_PLTT
    NARC_resdat_resdat_00000009_bin, // GF_GFX_RES_TYPE_CELL
    NARC_resdat_resdat_00000008_bin, // GF_GFX_RES_TYPE_ANIM
    0xFFFF,                          // GF_GFX_RES_TYPE_MCEL
    0xFFFF,                          // GF_GFX_RES_TYPE_MANM
    NARC_resdat_resdat_00000074_bin,
};

static const UnmanagedSpriteTemplate sSpriteTemplates[3] = {
    // Drop cursor
    { ALPH_SPRITE_RES_CURSORS,     208, 168, 0, 0, 3, 0, NNS_G2D_VRAM_TYPE_2DMAIN, 1, 0, 0, 0 },
    // Origin cursor
    { ALPH_SPRITE_RES_CURSORS,     208, 168, 0, 3, 1, 0, NNS_G2D_VRAM_TYPE_2DMAIN, 1, 0, 0, 0 },
    // Tile
    { ALPH_SPRITE_RES_PUZZLETILES, 208, 168, 0, 0, 2, 0, NNS_G2D_VRAM_TYPE_2DMAIN, 1, 0, 0, 0 }
};

static const u32 sQuitButtonTextColors[3] = {
    MAKE_TEXT_COLOR(1, 2, 0),
    MAKE_TEXT_COLOR(3, 4, 0),
    MAKE_TEXT_COLOR(5, 6, 0),
};

BOOL AlphPuzzle_Init(OverlayManager *man, int *state) {
    switch (*state) {
    case 0:
        AlphPuzzle_ScreenOff();
        CreateHeap(HEAP_ID_3, HEAP_ID_ALPH_PUZZLE, 0x20000);
        AlphPuzzleData *data = OverlayManager_CreateAndGetData(man, sizeof(AlphPuzzleData), HEAP_ID_ALPH_PUZZLE);
        MI_CpuFill8(data, 0, sizeof(AlphPuzzleData));
        data->heapId = HEAP_ID_ALPH_PUZZLE;
        data->args = OverlayManager_GetArgs(man);
        Sound_SetSceneAndPlayBGM(74, 0, 0);
        AlphPuzzle_InitTextOptionsAndPuzzleIndex(data);
        (*state)++;
        break;
    case 1:
        if (AlphPuzzle_OverlayEnterStep(OverlayManager_GetData(man))) {
            return TRUE;
        }
        break;
    }
    return FALSE;
}

BOOL AlphPuzzle_Main(OverlayManager *man, int *state) {
    AlphPuzzleData *data = OverlayManager_GetData(man);
    switch (*state) {
    case ALPH_PUZZLE_STATE_FADE_IN:
        *state = AlphPuzzleMainSeq_FadeIn(data);
        break;
    case ALPH_PUZZLE_STATE_WAIT_FOR_INPUT:
        *state = AlphPuzzleMainSeq_WaitForInput(data);
        break;
    case ALPH_PUZZLE_STATE_PICKUP_TILE:
        *state = AlphPuzzleMainSeq_PickupTile(data);
        break;
    case ALPH_PUZZLE_STATE_HOLDING_TILE:
        *state = AlphPuzzleMainSeq_HoldingTile(data);
        break;
    case ALPH_PUZZLE_STATE_ROTATE_TILE:
        *state = AlphPuzzleMainSeq_RotateTile(data);
        break;
    case ALPH_PUZZLE_STATE_QUIT:
        *state = AlphPuzzleMainSeq_Quit(data);
        break;
    case ALPH_PUZZLE_STATE_CLEAR:
        *state = AlphPuzzleMainSeq_Clear(data);
        break;
    case ALPH_PUZZLE_STATE_FADE_OUT:
        *state = AlphPuzzleMainSeq_FadeOut(data);
        break;
    case ALPH_PUZZLE_STATE_END:
        return TRUE;
    }
    SpriteSystem_DrawSprites(data->spriteGfxHandler);
    return FALSE;
}

BOOL AlphPuzzle_Exit(OverlayManager *man, int *state) {
    AlphPuzzleData *data = OverlayManager_GetData(man);
    if (!AlphPuzzle_OverlayExitStep(data)) {
        return FALSE;
    }
    AlphPuzzle_ScreenOff();
    AlphPuzzle_Finish(data);
    OverlayManager_FreeData(man);
    DestroyHeap(HEAP_ID_ALPH_PUZZLE);
    return TRUE;
}

static void AlphPuzzle_ScreenOff(void) {
    Main_SetVBlankIntrCB(NULL, NULL);
    HBlankInterruptDisable();
    GfGfx_DisableEngineAPlanes();
    GfGfx_DisableEngineBPlanes();
    GX_SetVisiblePlane(0);
    GXS_SetVisiblePlane(0);
    sub_0200FBF4(0, 0);
    sub_0200FBF4(1, 0);
    sub_0200FBDC(0);
    sub_0200FBDC(1);
}

static void AlphPuzzle_InitTextOptionsAndPuzzleIndex(AlphPuzzleData *data) {
    data->menuInputState = MenuInputStateMgr_GetState(data->args->menuInputStatePtr);
    Options *options = Save_PlayerData_GetOptionsAddr(data->args->saveData);
    data->textFrameDelay = Options_GetTextFrameDelay(options);
    data->frame = Options_GetFrame(options);
    data->puzzleIndex = data->args->puzzle;
}

static void AlphPuzzle_Finish(AlphPuzzleData *data) {
    MenuInputStateMgr_SetState(data->args->menuInputStatePtr, data->menuInputState);
    if (data->puzzleSolved) {
        Save_VarsFlags_SetAlphPuzzleFlag(Save_VarsFlags_Get(data->args->saveData), data->puzzleIndex);
    }
}

static BOOL AlphPuzzle_OverlayEnterStep(AlphPuzzleData *data) {
    switch (data->unkState) {
    case 0:
        AlphPuzzle_SetupGraphics(data);
        data->unkState++;
        break;
    case 1:
        AlphPuzzle_DrawHintTextAndHideCursor(data);
        sub_020210BC();
        sub_02021148(1);
        data->unkState = 0;
        return TRUE;
    }
    return FALSE;
}

static BOOL AlphPuzzle_OverlayExitStep(AlphPuzzleData *data) {
    sub_02021238();
    AlphPuzzle_TeardownGraphics(data);
    return TRUE;
}

static int AlphPuzzleMainSeq_FadeIn(AlphPuzzleData *data) {
    switch (data->unkState) {
    case 0:
        BeginNormalPaletteFade(0, 1, 1, 0, 6, 1, data->heapId);
        data->unkState++;
        break;
    case 1:
        if (IsPaletteFadeFinished()) {
            data->unkState = 0;
            return ALPH_PUZZLE_STATE_WAIT_FOR_INPUT;
        }
        break;
    }
    return ALPH_PUZZLE_STATE_FADE_IN;
}

static int AlphPuzzleMainSeq_FadeOut(AlphPuzzleData *data) {
    switch (data->unkState) {
    case 0:
        BeginNormalPaletteFade(0, 0, 0, 0, 6, 1, data->heapId);
        data->unkState++;
        break;
    case 1:
        if (IsPaletteFadeFinished()) {
            data->unkState = 0;
            return ALPH_PUZZLE_STATE_END;
        }
        break;
    }
    return ALPH_PUZZLE_STATE_FADE_OUT;
}

static int AlphPuzzleMainSeq_WaitForInput(AlphPuzzleData *data) {
    return AlphPuzzle_CheckInput(data);
}

static int AlphPuzzleMainSeq_PickupTile(AlphPuzzleData *data) {
    return AlphPuzzleMainSeq_PickupTile_impl(data);
}

static int AlphPuzzleMainSeq_HoldingTile(AlphPuzzleData *data) {
    return AlphPuzzleMainSeq_HoldingTile_impl(data);
}

static int AlphPuzzleMainSeq_RotateTile(AlphPuzzleData *data) {
    return AlphPuzzleMainSeq_RotateTile_impl(data);
}

static int AlphPuzzleMainSeq_Quit(AlphPuzzleData *data) {
    return AlphPuzzleMainSeq_Quit_impl(data);
}

static int AlphPuzzleMainSeq_Clear(AlphPuzzleData *data) {
    return AlphPuzzleMainSeq_Clear_impl(data);
}

static void AlphPuzzle_SetupGraphics(AlphPuzzleData *data) {
    AlphPuzzle_InitTileData(data);
    AlphPuzzle_AllocBackgroundBuffers(data);
    AlphPuzzle_LoadBackgroundGraphics(data);
    AlphPuzzle_InitText(data);
    AlphPuzzle_CreateWindows(data);
    AlphPuzzle_CreateSpriteGraphics(data);
    Main_SetVBlankIntrCB(AlphPuzzle_VBlankCB, data);
}

static void AlphPuzzle_TeardownGraphics(AlphPuzzleData *data) {
    AlphPuzzle_DeleteSpriteGraphics(data);
    AlphPuzzle_DestroyWindows(data);
    AlphPuzzle_DeleteText(data);
    AlphPuzzle_FreeBackgroundGraphics(data);
    AlphPuzzle_FreeBackgroundBuffers(data);
}

static void AlphPuzzle_DrawHintTextAndHideCursor(AlphPuzzleData *data) {
    AlphPuzzle_ToggleDropCursorSprite(data, 0);
    AlphPuzzle_PrintHintText(data);
    ScheduleBgTilemapBufferTransfer(data->bgConfig, 2);
    ScheduleBgTilemapBufferTransfer(data->bgConfig, 4);
}

static int AlphPuzzle_CheckInput(AlphPuzzleData *data) {
    if (!System_GetTouchNew()) {
        return ALPH_PUZZLE_STATE_WAIT_FOR_INPUT;
    }
    if (TouchscreenHitbox_FindRectAtTouchNew(sButtonHitboxes) == TS_HITBOX_ALPH_QUIT) {
        data->menuInputState = MENU_INPUT_STATE_TOUCH;
        AlphPuzzle_CreateQuitTask(data);
        PlaySE(SEQ_SE_DP_SELECT);
        return ALPH_PUZZLE_STATE_QUIT;
    }
    s32 tileIndex = AlphPuzzle_TrySelectTileTouchScreen(data, gSystem.touchX, gSystem.touchY);
    if (tileIndex < 0) {
        return ALPH_PUZZLE_STATE_WAIT_FOR_INPUT;
    }
    AlphPuzzle_UpdateSelectedTile(data, tileIndex, TRUE);
    PlaySE(SEQ_SE_GS_SEKIBAN_SENTAKU);
    data->menuInputState = MENU_INPUT_STATE_TOUCH;
    return ALPH_PUZZLE_STATE_PICKUP_TILE;
}

static int AlphPuzzleMainSeq_PickupTile_impl(AlphPuzzleData *data) {
    if (!System_GetTouchHeld()) {
        data->sceneTimer = 0;
        return ALPH_PUZZLE_STATE_ROTATE_TILE;
    }
    if (data->sceneTimer++ >= 2) {
        data->sceneTimer = 0;
        data->tileHoverPixelX = (data->selectedTile->x * 32) + 64;
        data->tileHoverPixelY = (data->selectedTile->y * 32) + 32;
        data->tileHoverTileX = data->selectedTile->x;
        data->tileHoverTileY = data->selectedTile->y;
        AlphPuzzle_ClearOrSetBgTilesAtCoords(data, data->selectedTile->x, data->selectedTile->y, 3);
        return ALPH_PUZZLE_STATE_HOLDING_TILE;
    }
    return ALPH_PUZZLE_STATE_PICKUP_TILE;
}

s32 AlphPuzzle_TrySelectTileTouchScreen(AlphPuzzleData *data, u16 touchX, u16 touchY) {
    u16 x = touchX;
    u16 y = touchY;

    if (x < 32 || x >= 224) {
        return -1;
    }

    x = (x - 32) / 32;
    y = y / 32;

    for (s32 i = 0; i < 16; i++) {
        if (data->tileGrid[i].x == x && data->tileGrid[i].y == y) {
            if (data->tileGrid[i].isImmovable) {
                return -1;
            }
            return i;
        }
    }

    return -1;
}

// Returns TRUE if the coords are updated,
// FALSE otherwise.
// Note: This return value goes unused in
// code. Instead, it always checks whether
// the coords actually updated.
static BOOL AlphPuzzle_GetTileDropCoords(AlphPuzzleData *data, u8 *xOut, u8 *yOut) {
    int i;

    *xOut = 0;
    *yOut = 0;

    s16 x = data->tileHoverPixelX;
    u16 x2;
    u16 y2;

    // x coords out of bound
    if (x < 32 || x >= 224) {
        return FALSE;
    }

    // no y bounds check because the screen height takes care of that

    x2 = (x - 32) / 32;
    y2 = data->tileHoverPixelY / 32;

    // Can't place on a corner
    for (i = 0; i < 4; i++) {
        if (x2 == sCornerCoords[i][0] && y2 == sCornerCoords[i][1]) {
            return FALSE;
        }
    }

    // Can't place on an occupied tile
    for (i = 0; i < 16; i++) {
        if (data->selectedTileIndex != i && data->tileGrid[i].x == x2 && data->tileGrid[i].y == y2) {
            return FALSE;
        }
    }

    *xOut = x2;
    *yOut = y2;

    return TRUE;
}

static int AlphPuzzleMainSeq_HoldingTile_impl(AlphPuzzleData *data) {
    if (!System_GetTouchHeld()) {
        AlphPuzzle_ClearOrSetBgTilesAtCoords(data, data->selectedTile->x, data->selectedTile->y, 0);
        AlphPuzzle_ClearOrSetBgTilesAtCoords(data, data->tileHoverTileX, data->tileHoverTileY, 0);
        ScheduleBgTilemapBufferTransfer(data->bgConfig, 2);
        if (data->tileHoverTileX == 0 && data->tileHoverTileY == 0) {
            PlaySE(SEQ_SE_DP_BOX01);
            AlphPuzzle_PlaceTileInGrid(data, data->selectedTileIndex, data->selectedTile->x, data->selectedTile->y, data->selectedTile->rotation);
        } else {
            PlaySE(SEQ_SE_GS_SEKIBAN_SENTAKU); // SE Slate Select
            AlphPuzzle_PlaceTileInGrid(data, data->selectedTileIndex, data->tileHoverTileX, data->tileHoverTileY, data->selectedTile->rotation);
        }
        AlphPuzzle_UpdateSelectedTile(data, -1, FALSE);
        if (AlphPuzzle_CheckComplete(data)) {
            return ALPH_PUZZLE_STATE_CLEAR;
        }
        return ALPH_PUZZLE_STATE_WAIT_FOR_INPUT;
    }

    s16 x = gSystem.touchX;
    s16 y = gSystem.touchY;

    data->tileLastHoverPixelX = data->tileHoverPixelX;
    data->tileLastHoverPixelY = data->tileHoverPixelY;

    if (y < 16) {
        y = 16;
    } else if (y > 176) {
        y = 176;
    }

    if (x < 48) {
        x = 48;
    } else if (x > 208) {
        x = 208;
    }

    Sprite_SetPositionXY(data->sprites[ALPH_SPRITE_INDEX_PREV_CURSOR], x, y);
    AlphPuzzle_SetSpritePosition_HandleRotation(data->selectedTile, x - 2, y - 2);

    u8 xOut;
    u8 yOut;

    data->tileHoverPixelX = x;
    data->tileHoverPixelY = y;

    AlphPuzzle_GetTileDropCoords(data, &xOut, &yOut);

    if (data->tileHoverTileX != xOut || data->tileHoverTileY != yOut) {
        AlphPuzzle_UpdateHoverGraphicOnBg(data, xOut, yOut);
        data->tileHoverTileX = xOut;
        data->tileHoverTileY = yOut;
    }

    return ALPH_PUZZLE_STATE_HOLDING_TILE;
}

static int AlphPuzzleMainSeq_RotateTile_impl(AlphPuzzleData *data) {
    switch (data->subState) {
    case 0:
        PlaySE(SEQ_SE_GS_SEKIBAN_KAITEN);
        data->subState++;
        break;
    case 1: {
        u16 rotationOffset = (data->sceneTimer++) * 0x800;
        u16 rotation = data->selectedTile->rotation * 0x4000 + rotationOffset;
        Sprite_SetAffineZRotation(data->selectedTile->sprite, rotation);
        if (data->sceneTimer >= 8) {
            data->subState++;
        }
        break;
    }
    case 2:
        data->selectedTile->rotation = (data->selectedTile->rotation + 1) % 4;

        AlphPuzzle_UpdateSelectedTile(data, -1, FALSE);

        data->sceneTimer = 0;
        data->subState = 0;

        if (AlphPuzzle_CheckComplete(data)) {
            return ALPH_PUZZLE_STATE_CLEAR;
        }
        return ALPH_PUZZLE_STATE_WAIT_FOR_INPUT;
    }
    return ALPH_PUZZLE_STATE_ROTATE_TILE;
}

static int AlphPuzzleMainSeq_Quit_impl(AlphPuzzleData *data) {
    switch (data->subState) {
    case 0:
        if (!data->quitTaskActive) {
            AlphPuzzle_PrintConfirmQuitText(data, 0, 1, data->textFrameDelay);
            data->subState++;
        }
        break;
    case 1:
        if (!TextPrinterCheckActive(data->textPrinterId)) {
            AlphPuzzle_Quit_CreateYesNoPrompt(data);
            data->subState++;
        }
        break;
    case 2: {
        AlphPuzzleStates ret = AlphPuzzle_Quit_HandleYesNoPrompt(data);
        if (ret != ALPH_PUZZLE_STATE_QUIT) {
            data->subState = 0;
            return ret;
        }
        break;
    }
    }
    return ALPH_PUZZLE_STATE_QUIT;
}

static int AlphPuzzleMainSeq_Clear_impl(AlphPuzzleData *data) {
    switch (data->subState) {
    case 0:
        PlaySE(SEQ_SE_GS_PUZZLETOKU);
        data->subState++;
        break;
    case 1:
        PaletteData_BlendPalette(data->palette, PLTTBUF_MAIN_OBJ, 0x2b, 5, data->sceneTimer, 0x7FFF);
        if (data->sceneTimer++ >= 15) {
            data->subState++;
        }
        break;
    case 2:
        PaletteData_BlendPalette(data->palette, PLTTBUF_MAIN_OBJ, 0x2b, 5, data->sceneTimer, 0x7FFF);
        if (data->sceneTimer-- == 0) {
            data->subState++;
        }
        break;
    default:
        data->subState = 0;
        data->sceneTimer = 0;
        data->puzzleSolved = 1;
        return ALPH_PUZZLE_STATE_FADE_OUT;
    }

    return ALPH_PUZZLE_STATE_CLEAR;
}

static void AlphPuzzle_VBlankCB(void *dat) {
    AlphPuzzleData *data = dat;
    if (data->palette) {
        PaletteData_PushTransparentBuffers(data->palette);
    }
    if (data->spriteRenderer) {
        SpriteSystem_TransferOam();
    }

    NNS_GfdDoVramTransfer();
    DoScheduledBgGpuUpdates(data->bgConfig);

    OS_SetIrqCheckFlag(OS_IE_VBLANK);
}

static void AlphPuzzle_InitTileData(AlphPuzzleData *data) {
    int y;
    int x;

    AlphPuzzleTile *tile;
    const AlphPuzzle *puzzle = dAlphPuzzles[data->puzzleIndex];

    for (y = 0; y < ALPH_PUZZLE_TILES_HIGH; y++) {
        for (x = 0; x < ALPH_PUZZLE_TILES_WIDE; x++) {
            u32 pos = y * ALPH_PUZZLE_TILES_WIDE + x;
            if ((*puzzle)[pos].index != 0 && (*puzzle)[pos].index <= 16) {
                tile = &data->tileGrid[(*puzzle)[pos].index - 1];
                tile->x = x;
                tile->y = y;
                tile->rotation = (*puzzle)[pos].rotation;
                tile->isImmovable = (*puzzle)[pos].isImmovable;
                tile->sprite = NULL;
            }
        }
    }
}

static void AlphPuzzle_SetGraphicsBanks() {
    GraphicsBanks banks = sGraphicsBanks;
    GfGfx_SetBanks(&banks);
}

static void AlphPuzzle_AllocBackgroundBuffers(AlphPuzzleData *data) {
    AlphPuzzle_SetGraphicsBanks();
    data->bgConfig = BgConfig_Alloc(data->heapId);

    GraphicsModes mode = sGraphicsMode;

    SetBothScreensModesAndDisable(&mode);

    GX_SetDispSelect(GX_DISP_SELECT_SUB_MAIN);

    BgTemplate temp = sBgTemplate1;
    InitBgFromTemplate(data->bgConfig, 4, &temp, 0);
    BgClearTilemapBufferAndCommit(data->bgConfig, 4);

    BgTemplate temp2 = sBgTemplate2;
    InitBgFromTemplate(data->bgConfig, 6, &temp2, 0);
    BgClearTilemapBufferAndCommit(data->bgConfig, 6);

    BgTemplate temp3 = sBgTemplate3;
    InitBgFromTemplate(data->bgConfig, 7, &temp3, 0);
    BgClearTilemapBufferAndCommit(data->bgConfig, 7);

    BgTemplate temp4 = sBgTemplate4;
    InitBgFromTemplate(data->bgConfig, 0, &temp4, 0);
    BgClearTilemapBufferAndCommit(data->bgConfig, 0);

    BgTemplate temp5 = sBgTemplate5;
    InitBgFromTemplate(data->bgConfig, 2, &temp5, 0);
    BgClearTilemapBufferAndCommit(data->bgConfig, 2);

    BgTemplate temp6 = sBgTemplate6;
    InitBgFromTemplate(data->bgConfig, 3, &temp6, 0);
    BgClearTilemapBufferAndCommit(data->bgConfig, 3);

    BG_ClearCharDataRange(4, 32, 0, data->heapId);
    BG_ClearCharDataRange(7, 32, 0, data->heapId);
    BG_ClearCharDataRange(0, 32, 0, data->heapId);
    BG_ClearCharDataRange(3, 64, 0, data->heapId);
}

static void AlphPuzzle_FreeBackgroundBuffers(AlphPuzzleData *data) {
    FreeBgTilemapBuffer(data->bgConfig, 3);
    FreeBgTilemapBuffer(data->bgConfig, 2);
    FreeBgTilemapBuffer(data->bgConfig, 0);
    FreeBgTilemapBuffer(data->bgConfig, 7);
    FreeBgTilemapBuffer(data->bgConfig, 6);
    FreeBgTilemapBuffer(data->bgConfig, 4);
    Heap_Free(data->bgConfig);

    GX_SetDispSelect(GX_DISP_SELECT_MAIN_SUB);
}

static void AlphPuzzle_LoadBackgroundGraphics(AlphPuzzleData *data) {
    NARC *narc = NARC_New(NARC_application_annon_puzzle_gra, data->heapId);
    data->palette = PaletteData_Init(data->heapId);

    PaletteData_AllocBuffers(data->palette, PLTTBUF_MAIN_BG, 256, data->heapId);
    PaletteData_AllocBuffers(data->palette, PLTTBUF_SUB_BG, 256, data->heapId);
    PaletteData_AllocBuffers(data->palette, PLTTBUF_MAIN_OBJ, 256, data->heapId);

    PaletteData_LoadFromOpenNarc(data->palette, narc, NARC_puzzle_gra_puzzle_gra_00000010_NCLR, data->heapId, PLTTBUF_MAIN_BG, 256, 0, 0);
    PaletteData_LoadFromOpenNarc(data->palette, narc, NARC_puzzle_gra_puzzle_gra_00000010_NCLR, data->heapId, PLTTBUF_SUB_BG, 256, 0, 0);
    PaletteData_LoadFromOpenNarc(data->palette, narc, NARC_puzzle_gra_puzzle_gra_00000000_NCLR, data->heapId, PLTTBUF_MAIN_OBJ, 256, 0, 0);

    GfGfxLoader_LoadCharDataFromOpenNarc(narc, NARC_puzzle_gra_puzzle_gra_00000011_NCGR, data->bgConfig, GF_BG_LYR_SUB_3, 0, 0, 0, data->heapId);
    GfGfxLoader_LoadScrnDataFromOpenNarc(narc, NARC_puzzle_gra_puzzle_gra_00000014_NSCR, data->bgConfig, GF_BG_LYR_SUB_3, 0, 0, 0, data->heapId);
    GfGfxLoader_LoadScrnDataFromOpenNarc(narc, NARC_puzzle_gra_puzzle_gra_00000015_NSCR, data->bgConfig, GF_BG_LYR_SUB_2, 0, 0, 0, data->heapId);
    GfGfxLoader_LoadCharDataFromOpenNarc(narc, NARC_puzzle_gra_puzzle_gra_00000011_NCGR, data->bgConfig, GF_BG_LYR_MAIN_3, 0, 0, 0, data->heapId);

    GfGfxLoader_LoadScrnDataFromOpenNarc(narc, NARC_puzzle_gra_puzzle_gra_00000012_NSCR, data->bgConfig, GF_BG_LYR_MAIN_3, 0, 0, 0, data->heapId);
    data->screenDataAlloc = GfGfxLoader_GetScrnDataFromOpenNarc(narc, NARC_puzzle_gra_puzzle_gra_00000013_NSCR, 0, &data->screenData, data->heapId);

    NARC_Delete(narc);

    PaletteData_LoadNarc(data->palette, NARC_a_0_3_8, data->frame + 26, data->heapId, PLTTBUF_MAIN_BG, 32, 80);
    PaletteData_LoadNarc(data->palette, NARC_graphic_font, 8, data->heapId, PLTTBUF_MAIN_BG, 32, 64);

    LoadUserFrameGfx2(data->bgConfig, GF_BG_LYR_MAIN_0, 1, 5, data->frame, data->heapId);
    PaletteData_SetAutoTransparent(data->palette, TRUE);
    PaletteData_PushTransparentBuffers(data->palette);
}

static void AlphPuzzle_FreeBackgroundGraphics(AlphPuzzleData *data) {
    Heap_Free(data->screenDataAlloc);
    PaletteData_FreeBuffers(data->palette, PLTTBUF_MAIN_OBJ);
    PaletteData_FreeBuffers(data->palette, PLTTBUF_SUB_BG);
    PaletteData_FreeBuffers(data->palette, PLTTBUF_MAIN_BG);
    PaletteData_Free(data->palette);
}

static void AlphPuzzle_InitText(AlphPuzzleData *data) {
    FontID_Alloc(4, data->heapId);

    data->msgData = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, NARC_msg_msg_0002_bin, data->heapId);
    data->messageFormat = MessageFormat_New_Custom(6, 16, data->heapId);
    data->unk30 = String_New(0x80, data->heapId);

    data->quitText = NewString_ReadMsgData(data->msgData, msg_0002_00000);

    for (int i = 0; i < 4; i++) {
        data->hintText[i] = NewString_ReadMsgData(data->msgData, i + msg_0002_00001);
    }

    data->confirmQuitText[0] = NewString_ReadMsgData(data->msgData, msg_0002_00005);
}

static void AlphPuzzle_DeleteText(AlphPuzzleData *data) {
    String_Delete(data->confirmQuitText[0]);
    for (int i = 0; i < 4; i++) {
        String_Delete(data->hintText[i]);
    }
    String_Delete(data->quitText);
    String_Delete(data->unk30);
    MessageFormat_Delete(data->messageFormat);
    DestroyMsgData(data->msgData);
    FontID_Release(4);
}

static void AlphPuzzle_CreateWindows(AlphPuzzleData *data) {
    for (int i = 0; i < 3; i++) {
        AddWindow(data->bgConfig, &data->window[i], &sWindowTemplates[i]);
        FillWindowPixelBuffer(&data->window[i], 0);
    }
    data->yesNoPrompt = YesNoPrompt_Create(data->heapId);
}

static void AlphPuzzle_DestroyWindows(AlphPuzzleData *data) {
    for (int i = 0; i < 3; i++) {
        ClearWindowTilemapAndCopyToVram(&data->window[i]);
        RemoveWindow(&data->window[i]);
    }
    YesNoPrompt_Destroy(data->yesNoPrompt);
}

static void AlphPuzzle_InitSpriteGraphics(AlphPuzzleData *data) {
    GF_CreateVramTransferManager(32, data->heapId);
    data->spriteRenderer = SpriteSystem_Alloc(data->heapId);
    SpriteSystem_Init(data->spriteRenderer, &ov110_021E6EA4, &ov110_021E6DD0, 3);
    sub_0200B2E0(data->heapId);
    sub_0200B2E8(data->heapId);
    data->spriteGfxHandler = SpriteManager_New(data->spriteRenderer);
    SpriteSystem_InitSprites(data->spriteRenderer, data->spriteGfxHandler, ALPH_SPRITE_INDEX_MAX);
    sub_0200D2A4(data->spriteRenderer, data->spriteGfxHandler, sResdatInfo, 2, 1);
}

static void AlphPuzzle_DestroySpriteGraphicsEngine(AlphPuzzleData *data) {
    SpriteSystem_DestroySpriteManager(data->spriteRenderer, data->spriteGfxHandler);
    data->spriteGfxHandler = NULL;
    SpriteSystem_Free(data->spriteRenderer);
    data->spriteRenderer = NULL;
    GF_DestroyVramTransferManager();
    sub_0200B2E0(data->heapId);
}

static void AlphPuzzle_CreateSpriteGraphics(AlphPuzzleData *data) {
    AlphPuzzle_InitSpriteGraphics(data);
    AlphPuzzle_CreateSprites(data);
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_OBJ, GF_PLANE_TOGGLE_ON);
}

static void AlphPuzzle_DeleteSpriteGraphics(AlphPuzzleData *data) {
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_OBJ, GF_PLANE_TOGGLE_OFF);
    AlphPuzzle_DeleteSprites(data);
    AlphPuzzle_DestroySpriteGraphicsEngine(data);
}

static void AlphPuzzle_CreateSprites(AlphPuzzleData *data) {
    int i;
    for (i = ALPH_SPRITE_INDEX_DROP_CURSOR; i <= ALPH_SPRITE_INDEX_PREV_CURSOR; i++) {
        data->sprites[i] = SpriteSystem_CreateSpriteFromResourceHeader(data->spriteRenderer, data->spriteGfxHandler, &sSpriteTemplates[i]);
        Sprite_SetAnimSpeed(data->sprites[i], FX32_ONE);
    }
    Sprite_SetDrawFlag(data->sprites[ALPH_SPRITE_INDEX_DROP_CURSOR], TRUE);
    Sprite_SetDrawFlag(data->sprites[ALPH_SPRITE_INDEX_PREV_CURSOR], FALSE);
    Sprite_SetAnimActiveFlag(data->sprites[ALPH_SPRITE_INDEX_DROP_CURSOR], TRUE);
    Sprite_SetOamMode(data->sprites[ALPH_SPRITE_INDEX_PREV_CURSOR], GX_OAM_MODE_NORMAL);
    Sprite_SetPriority(data->sprites[ALPH_SPRITE_INDEX_PREV_CURSOR], 2);
    Sprite_SetOamMode(data->sprites[ALPH_SPRITE_INDEX_PREV_CURSOR], GX_OAM_MODE_XLU);
    SpriteSystem_ReplaceCharResObj(data->spriteRenderer, data->spriteGfxHandler, NARC_application_annon_puzzle_gra, data->puzzleIndex + NARC_puzzle_gra_puzzle_gra_00000004_NCGR, 0, 1);
    for (i = 0; i < 16; i++) {
        u8 index = i + ALPH_SPRITE_INDEX_TILE_00;
        data->sprites[index] = SpriteSystem_CreateSpriteFromResourceHeader(data->spriteRenderer, data->spriteGfxHandler, &sSpriteTemplates[ALPH_SPRITE_INDEX_TILE_00]);
        Sprite_SetDrawFlag(data->sprites[index], 1);
        Sprite_SetAnimCtrlSeq(data->sprites[index], i);
        Sprite_SetOamMode(data->sprites[index], GX_OAM_MODE_NORMAL);
        Sprite_SetAffineOverwriteMode(data->sprites[index], 2);
        data->tileGrid[i].sprite = data->sprites[index];
        AlphPuzzle_PlaceTileInGrid(data, (u8)i, data->tileGrid[i].x, data->tileGrid[i].y, data->tileGrid[i].rotation);
    }
}

static void AlphPuzzle_DeleteSprites(AlphPuzzleData *data) {
    for (int i = 0; i < ALPH_SPRITE_INDEX_MAX; i++) {
        Sprite_Delete(data->sprites[i]);
    }
}

static BOOL AlphPuzzle_CheckComplete(AlphPuzzleData *data) {
    for (int i = 0; i < 16; i++) {
        if (data->tileGrid[i].rotation == 0) {
            if ((i % 4) + 1 == data->tileGrid[i].x && (i / 4) + 1 == data->tileGrid[i].y) {
                continue;
            }
        }
        return FALSE;
    }
    return TRUE;
}

void AlphPuzzle_ToggleDropCursorSprite(AlphPuzzleData *data, int a1) {
    FillWindowPixelBuffer(data->window, 0);
    Sprite_SetAnimCtrlSeq(data->sprites[ALPH_SPRITE_INDEX_DROP_CURSOR], a1);
    if (a1 == 1) {
        Sprite_ResetAnimCtrlState(data->sprites[ALPH_SPRITE_INDEX_DROP_CURSOR]);
        Sprite_SetAnimActiveFlag(data->sprites[ALPH_SPRITE_INDEX_DROP_CURSOR], 1);
    } else {
        Sprite_SetAnimActiveFlag(data->sprites[ALPH_SPRITE_INDEX_DROP_CURSOR], 0);
    }

    u32 width = FontID_String_GetWidth(4, data->quitText, 0);
    AddTextPrinterParameterizedWithColor(data->window, 4, data->quitText, (48 - width) / 2, 4, 0xFF, sQuitButtonTextColors[a1], NULL);
    ScheduleWindowCopyToVram(data->window);
}

static void AlphPuzzle_PrintConfirmQuitText(AlphPuzzleData *data, int a1, int a2, u8 textFrameDelay) {
    if (a2) {
        DrawFrameAndWindow2(&data->window[ALPH_WINDOW_CONFIRM_QUIT], 1, 1, 5);
    }
    FillWindowPixelBuffer(&data->window[ALPH_WINDOW_CONFIRM_QUIT], 15);
    if (textFrameDelay == 0) {
        AddTextPrinterParameterizedWithColor(&data->window[ALPH_WINDOW_CONFIRM_QUIT], 1, data->confirmQuitText[a1], 0, 0, 0xFF, 0x1020F, 0);
    } else {
        data->textPrinterId = AddTextPrinterParameterizedWithColor(&data->window[ALPH_WINDOW_CONFIRM_QUIT], 1, data->confirmQuitText[a1], 0, 0, textFrameDelay, MAKE_TEXT_COLOR(1, 2, 15), NULL);
    }
    ScheduleWindowCopyToVram(&data->window[ALPH_WINDOW_CONFIRM_QUIT]);
}

static void AlphPuzzle_PrintHintText(AlphPuzzleData *data) {
    FillWindowPixelBuffer(&data->window[ALPH_WINDOW_FLAVOR_TEXT], 0);
    AddTextPrinterParameterizedWithColor(&data->window[ALPH_WINDOW_FLAVOR_TEXT], 4, data->hintText[data->puzzleIndex], 0, 0, 0xFF, MAKE_TEXT_COLOR(2, 1, 0), NULL);
    ScheduleWindowCopyToVram(&data->window[ALPH_WINDOW_FLAVOR_TEXT]);
}

void AlphPuzzle_ClearOrSetBgTilesAtCoords(AlphPuzzleData *data, u8 x, u8 y, int a3) {
    if (a3 == 0) {
        FillBgTilemapRect(data->bgConfig, 2, 0, 4 * x + 4, 4 * y, 4, 4, 0);
    } else {
        CopyToBgTilemapRect(data->bgConfig, 2, 4 * x + 4, y * 4, 4, 4, &data->screenData->rawData, 4 * (a3 - 1), 0, data->screenData->screenWidth / 8, data->screenData->screenHeight / 8);
    }
}

static void AlphPuzzle_UpdateHoverGraphicOnBg(AlphPuzzleData *data, u8 x, u8 y) {
    if (data->selectedTile->x == data->tileHoverTileX && data->selectedTile->y == data->tileHoverTileY) {
        AlphPuzzle_ClearOrSetBgTilesAtCoords(data, data->tileHoverTileX, data->tileHoverTileY, 2);
    } else {
        AlphPuzzle_ClearOrSetBgTilesAtCoords(data, data->tileHoverTileX, data->tileHoverTileY, 0);
    }
    ScheduleBgTilemapBufferTransfer(data->bgConfig, 2);
    if (x != 0 || y != 0) {
        if (data->selectedTile->x == x && data->selectedTile->y == y) {
            AlphPuzzle_ClearOrSetBgTilesAtCoords(data, x, y, 3);
        } else {
            AlphPuzzle_ClearOrSetBgTilesAtCoords(data, x, y, 1);
        }
    }
}

static void AlphPuzzle_Quit_CreateYesNoPrompt(AlphPuzzleData *data) {
    YesNoPromptTemplate unkStruct;
    MI_CpuFill8(&unkStruct, 0, sizeof(YesNoPromptTemplate));
    unkStruct.bgConfig = data->bgConfig;
    unkStruct.tileStart = 31;
    unkStruct.plttSlot = 6;
    unkStruct.bgId = 0;
    unkStruct.x = 25;
    unkStruct.y = 10;
    unkStruct.ignoreTouchFlag = data->menuInputState;
    unkStruct.initialCursorPos = 1;
    unkStruct.shapeParam = 0;
    YesNoPrompt_InitFromTemplateWithPalette(data->yesNoPrompt, &unkStruct, data->palette);
}

static AlphPuzzleStates AlphPuzzle_Quit_HandleYesNoPrompt(AlphPuzzleData *data) {
    AlphPuzzleStates ret;
    switch (YesNoPrompt_HandleInput(data->yesNoPrompt)) {
    case YESNORESPONSE_YES:
        ret = ALPH_PUZZLE_STATE_FADE_OUT;
        break;
    case YESNORESPONSE_NO:
        ret = ALPH_PUZZLE_STATE_WAIT_FOR_INPUT;
        break;
    default:
        return ALPH_PUZZLE_STATE_QUIT;
    }
    data->menuInputState = YesNoPrompt_IsInTouchMode(data->yesNoPrompt);
    YesNoPrompt_Reset(data->yesNoPrompt);
    ClearFrameAndWindow2(&data->window[ALPH_WINDOW_CONFIRM_QUIT], 1);
    FillWindowPixelBuffer(&data->window[ALPH_WINDOW_CONFIRM_QUIT], 0);
    ScheduleWindowCopyToVram(&data->window[ALPH_WINDOW_CONFIRM_QUIT]);
    ScheduleBgTilemapBufferTransfer(data->bgConfig, 0);
    return ret;
}

void AlphPuzzle_SetSpritePosition_HandleRotation(AlphPuzzleTile *tile, s16 x, s16 y) {
    Sprite_SetPositionXY(tile->sprite, sTileRotationXYOffsets[tile->rotation][0] + x, sTileRotationXYOffsets[tile->rotation][1] + y);
}

void AlphPuzzle_PlaceTileInGrid(AlphPuzzleData *data, s16 tileIndex, u8 x, u8 y, u8 rotation) {
    AlphPuzzleTile *tile = &data->tileGrid[tileIndex];
    tile->x = x;
    tile->y = y;
    tile->rotation = rotation;
    AlphPuzzle_SetSpritePosition_HandleRotation(tile, x * 32 + 48, y * 32 + 16);
    Sprite_SetAffineZRotation(tile->sprite, (rotation % 4u) * 0x4000);
}

static void AlphPuzzle_UpdateSelectedTile(AlphPuzzleData *data, u8 tileIndex, BOOL isSelecting) {
    if (isSelecting) {
        data->selectedTileIndex = tileIndex;
        data->selectedTile = &data->tileGrid[data->selectedTileIndex];
        Sprite_SetDrawPriority(data->selectedTile->sprite, 0);
        Sprite_OffsetPositionXY(data->selectedTile->sprite, -2, -2);
        Sprite_SetDrawFlag(data->sprites[ALPH_SPRITE_INDEX_PREV_CURSOR], 1);
        Sprite_SetPositionXY(data->sprites[ALPH_SPRITE_INDEX_PREV_CURSOR], data->selectedTile->x * 32 + 48, data->selectedTile->y * 32 + 16);
        AlphPuzzle_ToggleDropCursorSprite(data, 2);
    } else {
        Sprite_SetDrawPriority(data->selectedTile->sprite, 2);
        AlphPuzzle_PlaceTileInGrid(data, data->selectedTileIndex, data->selectedTile->x, data->selectedTile->y, data->selectedTile->rotation);
        Sprite_SetDrawFlag(data->sprites[ALPH_SPRITE_INDEX_PREV_CURSOR], 0);
        AlphPuzzle_ToggleDropCursorSprite(data, 0);
        data->tileHoverTileX = 0;
        data->tileHoverTileY = 0;
        data->selectedTile = NULL;
        data->selectedTileIndex = 0;
    }
}

typedef struct AlphPuzzleQuitTaskData {
    AlphPuzzleData *data;
    u32 unk4;
} AlphPuzzleQuitTaskData;

static void AlphPuzzle_CreateQuitTask(AlphPuzzleData *data) {
    AlphPuzzleQuitTaskData *unkStruct = AllocFromHeapAtEnd(data->heapId, sizeof(AlphPuzzleQuitTaskData));
    MI_CpuFill8(unkStruct, 0, sizeof(AlphPuzzleQuitTaskData));
    unkStruct->data = data;
    SysTask_CreateOnMainQueue(Task_AlphPuzzle_WaitDropCursorAnimOnQuit, unkStruct, 0);
    AlphPuzzle_ToggleDropCursorSprite(data, 1);
    data->quitTaskActive = 1;
}

static void Task_AlphPuzzle_WaitDropCursorAnimOnQuit(SysTask *task, void *_data) {
    AlphPuzzleQuitTaskData *data = _data;
    if (!Sprite_IsAnimated(data->data->sprites[ALPH_SPRITE_INDEX_DROP_CURSOR])) {
        AlphPuzzle_ToggleDropCursorSprite(data->data, 0);
        data->data->quitTaskActive = 0;
        MI_CpuFill8(data, 0, sizeof(AlphPuzzleQuitTaskData));
        Heap_Free(data);
        SysTask_Destroy(task);
    }
}
