#include "voltorb_flip/voltorb_flip.h"

#include "global.h"

#include "constants/game_stats.h"
#include "constants/sndseq.h"

#include "application/voltorb_flip.naix"
#include "msgdata/msg.naix"
#include "msgdata/msg/msg_0039.h"
#include "voltorb_flip/voltorb_flip_app_data.h"
#include "voltorb_flip/voltorb_flip_game.h"
#include "voltorb_flip/voltorb_flip_input.h"
#include "voltorb_flip/voltorb_flip_internal.h"
#include "voltorb_flip/voltorb_flip_tasks.h"

#include "bg_window.h"
#include "brightness.h"
#include "coins.h"
#include "font.h"
#include "game_stats.h"
#include "gf_gfx_loader.h"
#include "list_menu_items.h"
#include "math_util.h"
#include "menu_input_state.h"
#include "message_format.h"
#include "options.h"
#include "overlay_manager.h"
#include "render_text.h"
#include "render_window.h"
#include "sound_02004A44.h"
#include "sprite.h"
#include "sprite_system.h"
#include "system.h"
#include "text.h"
#include "touchscreen.h"
#include "touchscreen_list_menu.h"
#include "unk_02005D10.h"
#include "unk_02009D48.h"
#include "unk_0200FA24.h"
#include "yes_no_prompt.h"

typedef enum CoinDisplay {
    COIN_DISPLAY_TOTAL,
    COIN_DISPLAY_PAYOUT,
} CoinDisplay;

#define MEMO_VOLTORB (1 << 0)
#define MEMO_ONE     (1 << 1)
#define MEMO_TWO     (1 << 2)
#define MEMO_THREE   (1 << 3)

#define FLIP_ANIM_SINGLE 0
#define FLIP_ANIM_REVEAL 1
#define FLIP_ANIM_CLEAR  2
#define FLIP_ANIM_HIDE   3

#define wMain                     windows[0]
#define wSmall                    windows[1]
#define wMemo                     windows[2]
#define wQuit                     windows[3]
#define wCurrentLevel             windows[4]
#define wFlipCardsAndCollectCoins windows[5]
#define wx1x2x3                   windows[6]
#define wGameOver                 windows[7]
#define wCollectedCoins           windows[8]
#define wPayout                   windows[9]
#define wTutorialQuit             windows[10]
#define wTutorialIfYouFlipCards   windows[11]
#define wTutorialIfYouSelectQuit  windows[12]
#define wTutorialIfYouFindVoltorb windows[13]
#define wHint                     windows[14]
#define wAboutMemoOpen            windows[15]
#define wAboutMemoTouchOpen       windows[16]

typedef void (*RenderScreenCB)(VoltorbFlipAppData *a0);

typedef struct MsgNoList {
    const u8 *msgNos;
    int size;
} MsgNoList;

typedef struct MemoRenderOverride {
    int xOffset;
    int yOffset;
    int tileId;
} MemoRenderOverride;

static void VoltorbFlip_RenderCoinPayoutScreen(VoltorbFlipAppData *work);
static void VoltorbFlip_RenderHowToPlayScreen(VoltorbFlipAppData *work);
static void VoltorbFlip_RenderHintScreen(VoltorbFlipAppData *work);
static void VoltorbFlip_RenderAboutMemoScreen(VoltorbFlipAppData *work);
static BOOL VoltorbFlip_PrintAndAwaitMessage(VoltorbFlipTaskEngine *workflow, VoltorbFlipAppData *work, int msgNo);
static BOOL VoltorbFlip_TutorialScreenTransition(VoltorbFlipTaskEngine *workflow, VoltorbFlipAppData *work, RenderScreenCB cb);
static BOOL VoltorbFlipTaskEngine_Memo_SetUp(VoltorbFlipTaskEngine *workflow, VoltorbFlipAppData *work);
static BOOL VoltorbFlip_AddCoinsToPayout(VoltorbFlipAppData *work);
static BOOL VoltorbFlip_AwardPayoutToPlayer(VoltorbFlipAppData *work);
static void ov122_021E6B38(VoltorbFlipAppData *work);
static void VoltorbFlip_PrintCoins(VoltorbFlipAppData *work, CoinDisplay type, int amount);
static void VoltorbFlip_RenderCardMemo(VoltorbFlipAppData *work, int cardId, int memoFlag);
static void VoltorbFlip_PrintBoardVoltorbs(VoltorbFlipAppData *work);
static void VoltorbFlip_PrintBoardPoints(VoltorbFlipAppData *work);
static int GetCardFaceUpTile(u8 cardType, u8 frame);
static void SetTile(u16 *tiles3x3, int baseTile);
static void DrawCardFaceUp(BgConfig *bgConfig, VoltorbFlipGameState *game, int cardId, int mode);
static void DrawCardFaceDown(BgConfig *bgConfig, VoltorbFlipGameState *game, int cardId, int mode);
static void VFCardFlipAnim_FlipSingle(VFCardFlipAnim *anim);
static BOOL VFCardFlipAnim_FlipAll(VFCardFlipAnim *anim);
static void VFCardFlipAnim_FlipRow(VFCardFlipAnim *anim);
static BOOL VFCardFlipAnim_HideAll(VFCardFlipAnim *anim);
static void VFCardFlipAnim_RenderStep(VFCardFlipAnim *anim);
static void VoltorbFlip_PrintBoardVoltorbsAndPoints(VoltorbFlipAppData *work);
static void VFCardFlipAnim_Set(VFCardFlipAnim *anim, int cursorPos, int mode, VoltorbFlipAppData *work);
static BOOL VFCardFlipAnim_Play(VFCardFlipAnim *anim);
static void VoltorbFlip_AnimateOpenMenu(VoltorbFlipAppData *work);
static void VoltorbFlip_AnimateCloseMenu(VoltorbFlipAppData *work);
static void VoltorbFlip_SetMemoSpritesDrawFlag(VoltorbFlipAppData *work, BOOL flag);
static void VoltorbFlip_UpdateMemoInputPanelStates(VoltorbFlipAppData *work);
static BOOL VoltorbFlip_TryToggleCardMemo(VoltorbFlipAppData *work, int cardId, int memoId);
static void VoltorbFlip_CreateListMenuSpawnerAndItems(VoltorbFlipAppData *work);
static void VoltorbFlip_DestroyListMenuSpawnerAndItems(VoltorbFlipAppData *work);
static void VoltorbFlip_CreateListMenu(VoltorbFlipAppData *work, int whichList);
static int VoltorbFlip_HandleListMenuInput(VoltorbFlipAppData *work);
static void VoltorbFlip_RenderTopScreen(VoltorbFlipAppData *work);
static void VoltorbFlip_AddWindows(VoltorbFlipAppData *work);
static void VoltorbFlip_RemoveWindows(VoltorbFlipAppData *work);
static void VoltorbFlip_PaintMessageOnWindow(VoltorbFlipAppData *work, FontID fontId, u8 msgNo, Window *window, u8 x, u8 y);
static void VoltorbFlip_PrintMessageOnWindow(VoltorbFlipAppData *work, FontID fontId, u8 msgNo, Window *window, u8 x, u8 y, u32 textColor);
static void VoltorbFlip_PrintMessageToSmallWindow(VoltorbFlipAppData *work, int msgNo);
static void VoltorbFlip_PrintTextWindow(VoltorbFlipAppData *work, int msgNo, BOOL clearWindow);
static BOOL VoltorbFlip_IsPrinterFinished(VoltorbFlipAppData *work);
static void VoltorbFlip_FormatGameLevel(VoltorbFlipAppData *work, int idx);
static void VoltorbFlip_DimLayersExceptBG3(u8 *isDimmed);
static void VoltorbFlip_UndimLayersExceptBG3(u8 *isDimmed);
static void ov122_021E78DC(u8 *a0);
static void ov122_021E7904(u8 *a0);
static void VoltorbFlip_InitBgs(VoltorbFlipAppData *work);
static void VoltorbFlip_UnloadBgs(VoltorbFlipAppData *work);
static void VoltorbFlip_LoadBgGfx(VoltorbFlipAppData *work);
static void VoltorbFlip_CreateSpriteSystem(VoltorbFlipAppData *work);
static void VoltorbFlip_FreeSpriteSystem(VoltorbFlipAppData *work);
static void VoltorbFlip_LoadObjectGfx(VoltorbFlipAppData *work);
static ManagedSprite *VoltorbFlip_CreateSprite_Main(SpriteSystem *spriteSystem, SpriteManager *spriteManager, u16 x, u16 y, u16 animation, u16 drawPriority);
static ManagedSprite *VoltorbFlip_CreateSprite_Sub(SpriteSystem *spriteSystem, SpriteManager *spriteManager, u16 x, u16 y, u16 animation, u16 drawPriority);
static void VoltorbFlip_CreateSprites(VoltorbFlipAppData *work);
static void VoltorbFlip_DeleteSprites(VoltorbFlipAppData *work);
static void VoltorbFlip_Sprite_SetAnimCtrlTime(Sprite *sprite, fx32 animCtrlTime);
static BOOL ov122_021E7F70(VoltorbFlipAppData *work);
static CardType VoltorbFlip_GetSelectedCardType(VoltorbFlipAppData *work);
static int MemoFlagToIdx(int memoFlag);
static void VoltorbFlip_VBlankIntr(void *data);
static void SetGXBanks(void);
static void VF_RenderingOff(void);
static void ov122_021E8094(OverlayManager *man);
static void FreeOverlayData(OverlayManager *man);

const u8 sMainMenuMsgNos[] = {
    // Play
    msg_0039_00017,
    // Game Info
    msg_0039_00018,
    // Quit
    msg_0039_00019
};
const u8 sGameInfoMsgNos[] = {
    // How to Play
    msg_0039_00021,
    // Hint!
    msg_0039_00022,
    // About Memos
    msg_0039_00023,
    // Return
    msg_0039_00024
};

const u8 ov122_021E9270[] = {
    GF_BG_LYR_MAIN_0,
    GF_BG_LYR_MAIN_1,
    GF_BG_LYR_MAIN_2,
    GF_BG_LYR_MAIN_3,
    GF_BG_LYR_SUB_0,
    GF_BG_LYR_SUB_1,
};

const u8 sCardFaceUpTileIDs[5][2] = {
    // 45º       Face up
    { 0x77, 0x17 },
    { 0x74, 0x14 },
    { 0x71, 0x11 },
    { 0x6E, 0x0E },
    { 0x6B, 0x0B },
};

const TouchscreenListMenuTemplate sListMenuTemplate = {
    .wrapAround = TRUE,
    .centered = TRUE,
    .xOffset = 0,
    .bgId = GF_BG_LYR_MAIN_3,
    .plttOffset = 11,
    .unk4 = 0,
    .unk5 = 0,
    .baseTile = 58,
    .charOffset = 31,
    .unkA = 104,
};

// clang-format off
const u16 ov122_021E92A0[] = {
    0x00A0, 0x00A1,
    0x00C0, 0x00C1,
    0x00E0, 0x00E1,
    0x0100, 0x0101,
};
// clang-format on

const MsgNoList sMenuMsgNos[] = {
    { sMainMenuMsgNos, NELEMS(sMainMenuMsgNos) },
    { sGameInfoMsgNos, NELEMS(sGameInfoMsgNos) },
};

const struct GraphicsModes sVoltorbFlipBgModeSet = {
    GX_DISPMODE_GRAPHICS,
    GX_BGMODE_0,
    GX_BGMODE_0,
    GX_BG0_AS_2D,
};

const u8 sMemoInputGridDrawParam[4][4] = {
    // memoOffAnim, memoOnAnim, spriteID, memoMask
    { 12, 8,  VF_SPRITE_TOGGLE_MEMO_VOLTORB, MEMO_VOLTORB },
    { 15, 11, VF_SPRITE_TOGGLE_MEMO_ONE,     MEMO_ONE     },
    { 14, 10, VF_SPRITE_TOGGLE_MEMO_TWO,     MEMO_TWO     },
    { 13, 9,  VF_SPRITE_TOGGLE_MEMO_THREE,   MEMO_THREE   },
};

const OamCharTransferParam sOamCharTransferParam = {
    0,
    0x00020000,
    0x00004000,
    GX_OBJVRAMMODE_CHAR_1D_32K,
    GX_OBJVRAMMODE_CHAR_1D_32K,
};

const SpriteResourceCountsListUnion sResourceCounts = { 2, 2, 2, 2, 0, 0 };

const OamManagerParam sOamManagerParam = { 0, 126, 0, 32, 1, 126, 0, 32 };

const GraphicsBanks sVoltorbFlipGraphicsBanks = {
    GX_VRAM_BG_128_B,
    GX_VRAM_BGEXTPLTT_NONE,
    GX_VRAM_SUB_BG_128_C,
    GX_VRAM_SUB_BGEXTPLTT_NONE,
    GX_VRAM_OBJ_128_A,
    GX_VRAM_OBJEXTPLTT_NONE,
    GX_VRAM_SUB_OBJ_16_I,
    GX_VRAM_SUB_OBJEXTPLTT_NONE,
    GX_VRAM_TEX_NONE,
    GX_VRAM_TEXPLTT_NONE,
};

const MemoRenderOverride sMemoRenderOverrides[4] = {
    { 0, 0, 0x21 }, // VOLTORB
    { 2, 0, 0x22 }, // ONE
    { 0, 2, 0x23 }, // TWO
    { 2, 2, 0x24 }, // THREE
};

const ManagedSpriteTemplate sSpriteTemplate_Sub = {
    0,
    0,
    0,
    0,
    0,
    0xFFFF,
    NNS_G2D_VRAM_TYPE_2DSUB,
    {
      1,
      1,
      1,
      1,
      0,
      0,
      },
    0,
    0,
};

const ManagedSpriteTemplate sSpriteTemplate_Main = {
    0,
    0,
    0,
    0,
    0,
    0xFFFF,
    NNS_G2D_VRAM_TYPE_2DMAIN,
    {
      0,
      0,
      0,
      0,
      0,
      0,
      },
    3,
    0,
};

const WindowTemplate sVoltorbFlipWindowTemplates[17] = {
    {
     .bgId = GF_BG_LYR_MAIN_3,
     .left = 2,
     .top = 19,
     .width = 27,
     .height = 4,
     .palette = 12,
     .baseTile = 0x0A2,

     },
    {
     .bgId = GF_BG_LYR_MAIN_3,
     .left = 2,
     .top = 21,
     .width = 27,
     .height = 2,
     .palette = 12,
     .baseTile = 0x0A2,

     },
    {
     .bgId = GF_BG_LYR_MAIN_1,
     .left = 25,
     .top = 4,
     .width = 6,
     .height = 6,
     .palette = 14,
     .baseTile = 0x10E,

     },
    {
     .bgId = GF_BG_LYR_MAIN_1,
     .left = 25,
     .top = 21,
     .width = 6,
     .height = 2,
     .palette = 14,
     .baseTile = 0x132,

     },
    {
     .bgId = GF_BG_LYR_SUB_1,
     .left = 1,
     .top = 1,
     .width = 30,
     .height = 2,
     .palette = 12,
     .baseTile = 0x001,

     },
    {
     .bgId = GF_BG_LYR_SUB_1,
     .left = 1,
     .top = 3,
     .width = 30,
     .height = 2,
     .palette = 12,
     .baseTile = 0x03D,

     },
    {
     .bgId = GF_BG_LYR_SUB_1,
     .left = 13,
     .top = 6,
     .width = 18,
     .height = 3,
     .palette = 12,
     .baseTile = 0x079,

     },
    {
     .bgId = GF_BG_LYR_SUB_1,
     .left = 13,
     .top = 10,
     .width = 18,
     .height = 3,
     .palette = 12,
     .baseTile = 0x0AF,

     },
    {
     .bgId = GF_BG_LYR_SUB_1,
     .left = 1,
     .top = 14,
     .width = 19,
     .height = 4,
     .palette = 12,
     .baseTile = 0x0E5,

     },
    {
     .bgId = GF_BG_LYR_SUB_1,
     .left = 1,
     .top = 19,
     .width = 19,
     .height = 4,
     .palette = 12,
     .baseTile = 0x131,

     },
    {
     .bgId = GF_BG_LYR_SUB_1,
     .left = 1,
     .top = 15,
     .width = 7,
     .height = 2,
     .palette = 13,
     .baseTile = 0x001,

     },
    {
     .bgId = GF_BG_LYR_SUB_1,
     .left = 1,
     .top = 5,
     .width = 30,
     .height = 6,
     .palette = 12,
     .baseTile = 0x00F,

     },
    {
     .bgId = GF_BG_LYR_SUB_1,
     .left = 10,
     .top = 14,
     .width = 21,
     .height = 4,
     .palette = 12,
     .baseTile = 0x0C3,

     },
    {
     .bgId = GF_BG_LYR_SUB_1,
     .left = 10,
     .top = 19,
     .width = 21,
     .height = 4,
     .palette = 12,
     .baseTile = 0x117,

     },
    {
     .bgId = GF_BG_LYR_SUB_1,
     .left = 1,
     .top = 17,
     .width = 30,
     .height = 6,
     .palette = 12,
     .baseTile = 0x001,

     },
    {
     .bgId = GF_BG_LYR_SUB_1,
     .left = 2,
     .top = 7,
     .width = 6,
     .height = 6,
     .palette = 13,
     .baseTile = 0x001,

     },
    {
     .bgId = GF_BG_LYR_SUB_1,
     .left = 1,
     .top = 15,
     .width = 30,
     .height = 8,
     .palette = 12,
     .baseTile = 0x025,

     },
};

static void VoltorbFlip_RenderCoinPayoutScreen(VoltorbFlipAppData *work) {
    BgClearTilemapBufferAndCommit(work->bgConfig, 5);
    GfGfxLoader_LoadScrnDataFromOpenNarc(work->narc, NARC_voltorb_flip_voltorb_flip_00000006_NSCR_lz, work->bgConfig, GF_BG_LYR_SUB_0, 0, 0, TRUE, work->heapID);

    int payout = VoltorbFlipGameState_GetGamePayout(work->game);
    u16 coins = (u32)Coins_GetValue(work->coins);

    VoltorbFlip_PrintCoins(work, COIN_DISPLAY_PAYOUT, payout);
    VoltorbFlip_PrintCoins(work, COIN_DISPLAY_TOTAL, coins);

    ManagedSprite_SetDrawFlag(work->sprites[VF_SPRITE_11], 0);
    ManagedSprite_SetDrawFlag(work->sprites[VF_SPRITE_12], 0);

    VoltorbFlip_RenderTopScreen(work);
}

static void VoltorbFlip_RenderHowToPlayScreen(VoltorbFlipAppData *work) {
    BgClearTilemapBufferAndCommit(work->bgConfig, 5);
    GfGfxLoader_LoadScrnDataFromOpenNarc(work->narc, NARC_voltorb_flip_voltorb_flip_00000008_NSCR_lz, work->bgConfig, GF_BG_LYR_SUB_0, 0, 0, TRUE, work->heapID);

    // "Quit" (on blue button)
    VoltorbFlip_PaintMessageOnWindow(work, 4, msg_0039_00008, &work->wTutorialQuit, 0, 0);
    // "If you flip all the cards in this order..."
    VoltorbFlip_PaintMessageOnWindow(work, 0, msg_0039_00011, &work->wTutorialIfYouFlipCards, 0, 0);
    // "If you select quit, you'll keep those..."
    VoltorbFlip_PaintMessageOnWindow(work, 0, msg_0039_00012, &work->wTutorialIfYouSelectQuit, 0, 0);
    // "But if you find Voltorb, you'll lose all..."
    VoltorbFlip_PaintMessageOnWindow(work, 0, msg_0039_00013, &work->wTutorialIfYouFindVoltorb, 0, 0);
}

static void VoltorbFlip_RenderHintScreen(VoltorbFlipAppData *work) {
    BgClearTilemapBufferAndCommit(work->bgConfig, 5);
    GfGfxLoader_LoadScrnDataFromOpenNarc(work->narc, NARC_voltorb_flip_voltorb_flip_00000007_NSCR_lz, work->bgConfig, GF_BG_LYR_SUB_0, 0, 0, TRUE, work->heapID);

    // {ALN_CENTER}By looking at the numbers on the sides of\n{ALN_CENTER}the cards, you can see the hidden number\n{ALN_CENTER}and VOLTORB totals.
    VoltorbFlip_PaintMessageOnWindow(work, 0, msg_0039_00009, &work->wHint, 0, 0);
}

static void VoltorbFlip_RenderAboutMemoScreen(VoltorbFlipAppData *work) {
    BgClearTilemapBufferAndCommit(work->bgConfig, 5);
    GfGfxLoader_LoadScrnDataFromOpenNarc(work->narc, NARC_voltorb_flip_voltorb_flip_00000009_NSCR_lz, work->bgConfig, GF_BG_LYR_SUB_0, 0, 0, TRUE, work->heapID);

    // {ALN_CENTER}Open\n{ALN_CENTER}Memo
    VoltorbFlip_PaintMessageOnWindow(work, 4, msg_0039_00006, &work->wAboutMemoOpen, 0, 0);
    // {ALN_CENTER}Touch "Open Memo" to open the Memo Window.\n{ALN_CENTER}Touch the cards to add and remove marks.
    VoltorbFlip_PaintMessageOnWindow(work, 0, msg_0039_00010, &work->wAboutMemoTouchOpen, 0, 0);

    ManagedSprite_SetDrawFlag(work->sprites[VF_SPRITE_11], 1);
    ManagedSprite_SetDrawFlag(work->sprites[VF_SPRITE_12], 1);
}

static BOOL VoltorbFlip_PrintAndAwaitMessage(VoltorbFlipTaskEngine *workflow, VoltorbFlipAppData *work, int msgNo) {
    int state = VoltorbFlipTaskEngine_CurrentTaskState(workflow);
    switch (state) {
    case 0:
        VoltorbFlip_DimLayersExceptBG3(&work->screenIsDimmed);
        VoltorbFlip_PrintTextWindow(work, msgNo, TRUE);
        VoltorbFlipTaskEngine_IncrementTaskState(workflow);
        break;
    case 1:
        if (VoltorbFlip_IsPrinterFinished(work)) {
            return TRUE;
        }
        break;
    }
    return FALSE;
}

// Applies the wiper palette fade and calls callback to render the screen.
static BOOL VoltorbFlip_TutorialScreenTransition(VoltorbFlipTaskEngine *workflow, VoltorbFlipAppData *work, RenderScreenCB cb) {
    int state = VoltorbFlipTaskEngine_CurrentTaskState(workflow);
    switch (state) {
    case 0:
        BeginNormalPaletteFade(4, 20, 20, RGB_BLACK, 4, 1, work->heapID);
        VoltorbFlipTaskEngine_IncrementTaskState(workflow);
        break;
    case 1:
        if (IsPaletteFadeFinished()) {
            cb(work);
            BeginNormalPaletteFade(4, 21, 21, RGB_BLACK, 4, 1, work->heapID);
            VoltorbFlipTaskEngine_IncrementTaskState(workflow);
        }
        break;
    case 2:
        if (IsPaletteFadeFinished()) {
            return TRUE;
        }
        break;
    default:
        GF_ASSERT(FALSE);
    }
    return FALSE;
}

static BOOL VoltorbFlipTaskEngine_Memo_SetUp(VoltorbFlipTaskEngine *workflow, VoltorbFlipAppData *work) {
    int state = VoltorbFlipTaskEngine_CurrentTaskState(workflow);
    switch (state) {
    case 0:
        if (work->memoOpen) {
            return TRUE;
        }
        VoltorbFlip_AnimateOpenMenu(work);
        VoltorbFlipTaskEngine_IncrementTaskState(workflow);
        break;
    case 1:
        if (ManagedSprite_IsAnimated(work->sprites[VF_SPRITE_MEMO]) == 0) {
            return TRUE;
        }
        break;
    default:
        GF_ASSERT(FALSE);
    }
    return FALSE;
}

BOOL VoltorbFlipTaskEngine_InitChecks_Begin(VoltorbFlipTaskEngine *workflow, VoltorbFlipAppData *work) {
    u32 coins = Coins_GetValue(work->coins);
    if (coins >= 50000) {
        // You've gathered 50,000 Coins.\nYou cannot gather any more.\r
        VoltorbFlip_PrintTextWindow(work, msg_0039_00014, TRUE);
        VoltorbFlipTaskEngine_Enqueue(workflow, WORKFLOW_TERMINATE);
    } else {
        VoltorbFlipTaskEngine_Enqueue(workflow, WORKFLOW_NEW_ROUND);
    }
    return TRUE;
}

BOOL VoltorbFlipTaskEngine_InitChecks_Main(VoltorbFlipTaskEngine *workflow, VoltorbFlipAppData *work) {
    if (!VoltorbFlip_IsPrinterFinished(work)) {
        return FALSE;
    }
    return TRUE;
}

BOOL VoltorbFlipTaskEngine_NewRound_Begin(VoltorbFlipTaskEngine *workflow, VoltorbFlipAppData *work) {
    VoltorbFlipGameState_NewBoard(work->game);
    VoltorbFlipTaskEngine_Enqueue(workflow, WORKFLOW_SELECT_MAIN_MENU);

    if (!work->hasPlayedOneLeve) {
        return TRUE;
    }

    int levelDiff = VoltorbFlipGameState_CalculateLevelsGained(work->game);
    VoltorbFlip_FormatGameLevel(work, 0);
    // {ALN_CENTER}VOLTORB Flip Lv. {STRVAR_1 50, 0, 0}
    VoltorbFlip_PrintMessageOnWindow(work, 0, msg_0039_00000, &work->wCurrentLevel, 0, 0, MAKE_TEXT_COLOR(15, 1, 0));
    BgCommitTilemapBufferToVram(work->bgConfig, 5);
    Sound_SetSceneAndPlayBGM(64, 0, 0);

    if (levelDiff != 0) {
        if (levelDiff > 0) {
            VoltorbFlip_DimLayersExceptBG3(&work->screenIsDimmed);
            // Advanced to Game Lv. {STRVAR_1 50, 0, 0}!\r
            VoltorbFlip_PrintTextWindow(work, msg_0039_00041, TRUE);
            PlaySE(SEQ_SE_GS_SLOT01);
        } else {
            VoltorbFlip_DimLayersExceptBG3(&work->screenIsDimmed);
            // Dropped to Game Lv. {STRVAR_1 50, 0, 0}.\r
            VoltorbFlip_PrintTextWindow(work, msg_0039_00043, TRUE);
            PlaySE(SEQ_SE_GS_SLOT03);
        }
    }
    return TRUE;
}

BOOL VoltorbFlipTaskEngine_NewRound_Main(VoltorbFlipTaskEngine *workflow, VoltorbFlipAppData *work) {
    int state = VoltorbFlipTaskEngine_CurrentTaskState(workflow);
    if (!work->hasPlayedOneLeve) {
        return TRUE;
    }

    switch (state) {
    case 0: {
        BOOL printerFinished = VoltorbFlip_IsPrinterFinished(work);
        if (printerFinished) {
            if (VoltorbFlipGameState_CalculateLevelsGained(work->game) > 0) {
                if (work->printedCanGetMoreCoinsMessage) {
                    return TRUE;
                }
                work->printedCanGetMoreCoinsMessage = TRUE;
                // Congratulations!\rYou can receive even more Coins\nin the next game!\r
                VoltorbFlip_PrintTextWindow(work, msg_0039_00042, TRUE);
                VoltorbFlipTaskEngine_IncrementTaskState(workflow);
            } else {
                return TRUE;
            }
        }
        break;
    }
    case 1:
        if (VoltorbFlip_IsPrinterFinished(work)) {
            return TRUE;
        }
        break;
    default:
        GF_ASSERT(FALSE);
    }
    return FALSE;
}

BOOL VoltorbFlipTaskEngine_NewRound_TidyUp(VoltorbFlipTaskEngine *workflow, VoltorbFlipAppData *work) {
    int state = VoltorbFlipTaskEngine_CurrentTaskState(workflow);
    switch (state) {
    case 0:
        BgClearTilemapBufferAndCommit(work->bgConfig, 3);
        VoltorbFlipTaskEngine_IncrementTaskState(workflow);
        // fallthrough
    case 1:
        if (!IsSEPlaying(SEQ_SE_GS_SLOT01) || !IsSEPlaying(SEQ_SE_GS_SLOT02)) {
            Sound_SetSceneAndPlayBGM(70, 0, 0);
            return TRUE;
        }
        break;
    default:
        GF_ASSERT(FALSE);
    }
    return FALSE;
}

BOOL VoltorbFlipTaskEngine_SelectMainMenu_SetUp(VoltorbFlipTaskEngine *workflow, VoltorbFlipAppData *work) {
    int msgNo;

    int state = VoltorbFlipTaskEngine_CurrentTaskState(workflow);
    if (state == 0) {
        VoltorbFlip_DimLayersExceptBG3(&work->screenIsDimmed);
    }

    VoltorbFlip_FormatGameLevel(work, 0);
    if (work->hasPlayedOneLeve) {
        // Play VOLTORB Flip Lv. {STRVAR_1 50, 0, 0}?
        msgNo = msg_0039_00016;
    } else {
        // Play VOLTORB Flip Lv. {STRVAR_1 50, 0, 0}?
        msgNo = msg_0039_00015;
    }

    return VoltorbFlip_PrintAndAwaitMessage(workflow, work, msgNo);
}

BOOL VoltorbFlipTaskEngine_SelectMainMenu_Begin(VoltorbFlipTaskEngine *workflow, VoltorbFlipAppData *work) {
    VoltorbFlip_CreateListMenu(work, 0);
    return TRUE;
}

BOOL VoltorbFlipTaskEngine_SelectMainMenu_Main(VoltorbFlipTaskEngine *workflow, VoltorbFlipAppData *work) {
    int var1 = VoltorbFlip_HandleListMenuInput(work);
    switch (var1 + 2) {
    case 2: // Play
        VoltorbFlip_UndimLayersExceptBG3(&work->screenIsDimmed);
        VoltorbFlipTaskEngine_Enqueue(workflow, WORKFLOW_RENDER_BOARD);
        return TRUE;
    case 1:
        break;
    case 3: // Game Info
        VoltorbFlipTaskEngine_Enqueue(workflow, WORKFLOW_SELECT_GAME_INFO);
        return TRUE;
    case 0:
    case 4: // Quit
        VoltorbFlipTaskEngine_Enqueue(workflow, WORKFLOW_TERMINATE);
        return TRUE;
    default:
        GF_ASSERT(FALSE);
    }
    return FALSE;
}

BOOL VoltorbFlipTaskEngine_SelectGameInfo_SetUp(VoltorbFlipTaskEngine *workflow, VoltorbFlipAppData *work) {
    // Which set of info?
    return VoltorbFlip_PrintAndAwaitMessage(workflow, work, msg_0039_00020);
}

BOOL VoltorbFlipTaskEngine_SelectGameInfo_Begin(VoltorbFlipTaskEngine *workflow, VoltorbFlipAppData *work) {
    VoltorbFlip_CreateListMenu(work, 1);
    return TRUE;
}

BOOL VoltorbFlipTaskEngine_SelectGameInfo_Main(VoltorbFlipTaskEngine *workflow, VoltorbFlipAppData *work) {
    int var1 = VoltorbFlip_HandleListMenuInput(work);
    switch (var1 + 2) {
    case 1:
        break;
    case 2:
        VoltorbFlipTaskEngine_Enqueue(workflow, WORKFLOW_HOW_TO_PLAY);
        return TRUE;
    case 3:
        VoltorbFlipTaskEngine_Enqueue(workflow, WORKFLOW_HINT);
        return TRUE;
    case 4:
        VoltorbFlipTaskEngine_Enqueue(workflow, WORKFLOW_ABOUT_MEMO);
        return TRUE;
    case 0:
    case 5:
        VoltorbFlipTaskEngine_Enqueue(workflow, WORKFLOW_SELECT_MAIN_MENU);
        return TRUE;
    default:
        GF_ASSERT(FALSE);
    }
    return FALSE;
}

BOOL VoltorbFlipTaskEngine_HowToPlayScreen_SetUp(VoltorbFlipTaskEngine *workflow, VoltorbFlipAppData *work) {
    return VoltorbFlip_TutorialScreenTransition(workflow, work, VoltorbFlip_RenderHowToPlayScreen);
}

BOOL VoltorbFlipTaskEngine_HowToPlayScreen_Main(VoltorbFlipTaskEngine *workflow, VoltorbFlipAppData *work) {
    // VOLTORB Flip is a game in which you flip\nover cards to find numbers hidden\fbeneath them.\rThe cards are hiding the numbers\n1 through 3...and VOLTORB as well.\rThe first number you flip over will give\nyou that many Coins.\rFrom then on, the next number you\nfind will multiply the total amount of\fCoins you've collected by that number.\rIf it's a 2, your total will be multiplied\nby "x2."\rIf it's a 3, your total will be multiplied\nby "x3."\rBut if you flip over a VOLTORB, it's\ngame over.\rWhen that happens, you'll lose all the\nCoins you've collected in the\fcurrent game.\rIf you select "Quit," you'll withdraw\nfrom the game.\rIf you get to a difficult spot, you might\nwant to end the game early.\rOnce you've found all the hidden\n2 and 3 cards, you've cleared\fthe game.\rOnce you've flipped over all these\ncards, then you'll advance to the\fnext level.\rAs you move up in levels, you will be\nable to receive more Coins.\fDo your best!\r
    return VoltorbFlip_PrintAndAwaitMessage(workflow, work, msg_0039_00025);
}

BOOL VoltorbFlipTaskEngine_HintScreen_SetUp(VoltorbFlipTaskEngine *workflow, VoltorbFlipAppData *work) {
    return VoltorbFlip_TutorialScreenTransition(workflow, work, VoltorbFlip_RenderHintScreen);
}

BOOL VoltorbFlipTaskEngine_HintScreen_Main(VoltorbFlipTaskEngine *workflow, VoltorbFlipAppData *work) {
    // The numbers at the side of the board\ngive you a clue about the numbers\fhidden on the backs of the panels.\rThe larger the number, the more likely\nit is that there are many large numbers\fhidden in that row or column.\rIn the same way, you can tell how many\nVOLTORB are hidden in the row\for column.\rConsider the hidden number totals and\nthe VOLTORB totals carefully as you flip\fover panels.\r
    return VoltorbFlip_PrintAndAwaitMessage(workflow, work, msg_0039_00026);
}

BOOL VoltorbFlipTaskEngine_AboutMemoScreen_SetUp(VoltorbFlipTaskEngine *workflow, VoltorbFlipAppData *work) {
    return VoltorbFlip_TutorialScreenTransition(workflow, work, VoltorbFlip_RenderAboutMemoScreen);
}

BOOL VoltorbFlipTaskEngine_AboutMemoScreen_Main(VoltorbFlipTaskEngine *workflow, VoltorbFlipAppData *work) {
    // Select "Open Memo" to mark\nthe cards.\rYou can mark the cards with the\nnumbers 1 through 3, but also with a\fVOLTORB mark.\rWhen you have an idea of the numbers\nhidden on the back of the cards, touch\r"Open Memo" and select the cards\nto mark.\rIf you want to remove a mark, touch the\nmark again, and it will disappear.\r
    return VoltorbFlip_PrintAndAwaitMessage(workflow, work, msg_0039_00027);
}

BOOL VoltorbFlipTaskEngine_TutorialScreens_TidyUp(VoltorbFlipTaskEngine *workflow, VoltorbFlipAppData *work) {
    if (VoltorbFlip_TutorialScreenTransition(workflow, work, VoltorbFlip_RenderCoinPayoutScreen)) {
        VoltorbFlipTaskEngine_Enqueue(workflow, WORKFLOW_SELECT_GAME_INFO);
        return TRUE;
    }
    return FALSE;
}

BOOL VoltorbFlipTaskEngine_RenderBoard_Main(VoltorbFlipTaskEngine *workflow, VoltorbFlipAppData *work) {
    BgClearTilemapBufferAndCommit(work->bgConfig, GF_BG_LYR_MAIN_3);
    VoltorbFlip_PrintBoardVoltorbsAndPoints(work);
    VoltorbFlipInputHandler_SetBoardFocused(work->inputHandler, TRUE);
    VoltorbFlipTaskEngine_Enqueue(workflow, WORKFLOW_AWAIT_BOARD_INTERACT);
    return TRUE;
}

BOOL VoltorbFlipTaskEngine_BoardInteraction_Main(VoltorbFlipTaskEngine *workflow, VoltorbFlipAppData *work) {
    int input = VoltorbFlipInputHandler_HandleInput(work->inputHandler);
    switch (input) {
    case 0:
        break;
    case 1: {
        int cardId = VoltorbFlipInputHandler_GetCursorPos(work->inputHandler);
        if (VoltorbFlipGameState_IsCardFlipped(work->game, cardId)) {
            PlaySE(SEQ_SE_DP_BOX03);
        } else {
            VoltorbFlipTaskEngine_Enqueue(workflow, WORKFLOW_FLIP_CARD);
            return TRUE;
        }
        break;
    }
    case 4:
        PlaySE(SEQ_SE_DP_SELECT);
        ManagedSprite_SetAnim(work->sprites[VF_SPRITE_02], 6);
        if (VoltorbFlipInputHandler_GetTouchNew(work->inputHandler)) {
            VoltorbFlipTaskEngine_Enqueue(workflow, WORKFLOW_MEMO_TOUCH); // open memo
        } else {
            VoltorbFlipTaskEngine_Enqueue(workflow, WORKFLOW_MEMO_BUTTONS);
        }
        return TRUE;
    case 2:
    case 3:
        PlaySE(SEQ_SE_DP_DECIDE);
        ManagedSprite_SetAnim(work->sprites[VF_SPRITE_03], 3);
        VoltorbFlipTaskEngine_Enqueue(workflow, WORKFLOW_QUIT_ROUND);
        return TRUE;
    default:
        GF_ASSERT(FALSE);
    }
    return FALSE;
}

BOOL VoltorbFlipTaskEngine_BoardInteraction_TidyUp(VoltorbFlipTaskEngine *workflow, VoltorbFlipAppData *work) {
    if (ov122_021E7F70(work)) {
        return TRUE;
    }
    return FALSE;
}

// If the selected row and column both have Voltorbs and if at least 75% of the
// unflipped cards in the selected row or column are Voltorbs, play suspenseful
// music.
BOOL VoltrbFlipWorkflow_CardFlipEffect_SetUp(VoltorbFlipTaskEngine *workflow, VoltorbFlipAppData *work) {
    int state = VoltorbFlipTaskEngine_CurrentTaskState(workflow);
    switch (state) {
    case 0: {
        int cardId = VoltorbFlipInputHandler_GetCursorPos(work->inputHandler);
        s16 col = cardId % 5;
        s16 row = cardId / 5;

        // Unused
        VoltorbFlipGameState_GetMultiplierCardsFlipped(work->game);
        VoltorbFlipGameState_GetMultiplierCards(work->game);

        int voltorbsInCol = VoltorbFlipGameState_GetVoltorbsAlongAxis(work->game, AXIS_COL, col);
        int voltorbsInRow = VoltorbFlipGameState_GetVoltorbsAlongAxis(work->game, AXIS_ROW, row);

        // Unused
        VoltorbFlipGameStates_GetPointsAlongAxis(work->game, AXIS_COL, col);
        VoltorbFlipGameStates_GetPointsAlongAxis(work->game, AXIS_ROW, row);

        if (voltorbsInCol != 0 && voltorbsInRow != 0) {
            MTRandom(); // unused

            int flippedInCol = VoltorbFlipGameState_CountFlippedCardsAlongAxis(work->game, AXIS_COL, col);
            int flippedInRow = VoltorbFlipGameState_CountFlippedCardsAlongAxis(work->game, AXIS_ROW, row);

            if ((100 * voltorbsInCol / (5 - flippedInCol)) >= 75 || (voltorbsInRow * 100) / (5 - flippedInRow) >= 75) {
                // Is this what you're expecting?!
                VoltorbFlip_PrintMessageToSmallWindow(work, msg_0039_00029);
                PlayFanfare(SEQ_ME_CARDGAME1);
            }
        }
        VoltorbFlipTaskEngine_IncrementTaskState(workflow);
        break;
    }
    case 1:
        if (!IsSEPlaying(SEQ_SE_GS_PANERU_MEKURUMAE) && !IsFanfarePlaying()) {
            return TRUE;
        }
        break;
    }
    return FALSE;
}

BOOL VoltorbFlipTaskEngine_CardFlipEffect_Begin(VoltorbFlipTaskEngine *work, VoltorbFlipAppData *workflow) {
    int cursorPos = VoltorbFlipInputHandler_GetCursorPos(workflow->inputHandler);
    VFCardFlipAnim_Set(&workflow->cardFlipControl, cursorPos, FLIP_ANIM_SINGLE, workflow);
    PlaySE(SEQ_SE_GS_PANERU_MEKURU);
    return TRUE;
}

BOOL VoltorbFlipTaskEngine_CardFlipEffect_Main(VoltorbFlipTaskEngine *workflow, VoltorbFlipAppData *work) {
    int state = VoltorbFlipTaskEngine_CurrentTaskState(workflow);
    switch (state) {
    case 0:
        if (VFCardFlipAnim_Play(&work->cardFlipControl)) {
            VoltorbFlipTaskEngine_IncrementTaskState(workflow);
        }
        break;
    case 1: {
        int cardId = VoltorbFlipInputHandler_GetCursorPos(work->inputHandler);
        CardType type = VoltorbFlipGameState_GetCardType(work->game, cardId);

        s16 column = ((cardId % 5) * 4 + 1);
        s16 x = column * 8 + 12;

        s16 row = ((cardId / 5) * 4 + 1);
        s16 y = row * 8 + 12;

        ManagedSprite_SetDrawFlag(work->sprites[VF_SPRITE_FLIPPING_CARD], TRUE);
        VoltorbFlipGameState_FlipCard(work->game, cardId);
        if (type == CARD_TYPE_VOLTORB) {
            ManagedSprite_SetPositionXY(work->sprites[VF_SPRITE_FLIPPING_CARD], x, y);
            ManagedSprite_SetAnim(work->sprites[VF_SPRITE_FLIPPING_CARD], 1);
            // Plays Voltorb explosion SE
            PlaySE(SEQ_SE_GS_COIN_HAZURE);
        } else {
            int payoutBefore = VoltorbFlipGameState_GetGamePayout(work->game);

            VoltorbFlipGameState_MultiplyPayoutAndUpdateCardsFlipped(work->game, type);

            int payoutAfter = VoltorbFlipGameState_GetGamePayout(work->game);

            BufferIntegerAsString(work->msgFmt, 0, type, 1, PRINTING_MODE_LEFT_ALIGN, 1);
            BufferIntegerAsString(work->msgFmt, 1, payoutAfter, 5, PRINTING_MODE_LEFT_ALIGN, 1);
            ManagedSprite_SetPositionXY(work->sprites[VF_SPRITE_FLIPPING_CARD], x, y);
            ManagedSprite_SetAnim(work->sprites[VF_SPRITE_FLIPPING_CARD], 0);

            if (payoutBefore == 0) {
                // {STRVAR_1 50, 0, 0}! Received {STRVAR_1 50, 0, 0} Coin(s)!
                VoltorbFlip_PrintMessageToSmallWindow(work, msg_0039_00030);
            } else if (IS_NOT_ONE_CARD(VoltorbFlip_GetSelectedCardType(work))) {
                // x{STRVAR_1 50, 0, 0}! Received {STRVAR_1 53, 1, 0} Coins!
                VoltorbFlip_PrintMessageToSmallWindow(work, msg_0039_00031);
            } else {
                return TRUE;
            }
        }
        VoltorbFlipTaskEngine_IncrementTaskState(workflow);
        break;
    }
    case 2:
        if (GF_IsAnySEPlaying() == 0) {
            VoltorbFlipTaskEngine_IncrementTaskState(workflow);
        }
        break;
    case 3:
        if (VoltorbFlip_GetSelectedCardType(work) == CARD_TYPE_VOLTORB) {
            PlayFanfare(SEQ_ME_CARDGAME2);
            // Oh no! You get 0 Coins!
            VoltorbFlip_PrintMessageToSmallWindow(work, msg_0039_00032);
            VoltorbFlip_PrintCoins(work, COIN_DISPLAY_PAYOUT, 0);
            VoltorbFlipTaskEngine_IncrementTaskState(workflow);
        } else if (VoltorbFlip_AddCoinsToPayout(work)) {
            VoltorbFlipTaskEngine_IncrementTaskState(workflow);
        }
        break;
    case 4:
        if (VoltorbFlip_GetSelectedCardType(work) == CARD_TYPE_VOLTORB) {
            if (!IsFanfarePlaying()) {
                return TRUE;
            }
        } else if (System_GetTouchNew() || gSystem.newKeys != 0) {
            return TRUE;
        }
        break;
    default:
        GF_ASSERT(FALSE);
    }
    return FALSE;
}

BOOL VoltorbFlipTaskEngine_CardFlipEffect_End(VoltorbFlipTaskEngine *workflow, VoltorbFlipAppData *work) {
    if (VoltorbFlip_GetSelectedCardType(work) == CARD_TYPE_VOLTORB) {
        VoltorbFlipGameState_SetRoundOutcome(work->game, ROUND_OUTCOME_LOST);
        VoltorbFlipTaskEngine_Enqueue(workflow, WORKFLOW_REVEAL_BOARD);
    } else if (VoltorbFlipGameState_HasEarnedMaxPayout(work->game)) {
        VoltorbFlipTaskEngine_Enqueue(workflow, WORKFLOW_WIN_ROUND);
    } else {
        VoltorbFlipTaskEngine_Enqueue(workflow, WORKFLOW_AWAIT_BOARD_INTERACT);
    }
    BgClearTilemapBufferAndCommit(work->bgConfig, 3);
    return TRUE;
}

BOOL VoltorbFlipTaskEngine_WinRound_Main(VoltorbFlipTaskEngine *workflow, VoltorbFlipAppData *work) {
    int state = VoltorbFlipTaskEngine_CurrentTaskState(workflow);
    switch (state) {
    case 0:
        // Game clear!\rYou've found all of the hidden x2 and\nx3 cards.\rThis means you've found all the Coins\nin this game, so the game is now over.\r
        VoltorbFlip_PrintTextWindow(work, msg_0039_00033, TRUE);
        VoltorbFlip_DimLayersExceptBG3(&work->screenIsDimmed);
        PlayFanfare(SEQ_ME_MUSHITORI3);
        VoltorbFlipTaskEngine_IncrementTaskState(workflow);
        // fallthrough
    case 1:
        if (!IsFanfarePlaying() && VoltorbFlip_IsPrinterFinished(work)) {
            VoltorbFlipGameState_SetRoundOutcome(work->game, ROUND_OUTCOME_WON);
            VoltorbFlipTaskEngine_Enqueue(workflow, WORKFLOW_AWARD_COINS);
            return TRUE;
        }
        break;
    default:
        GF_ASSERT(FALSE);
    }
    return FALSE;
}

BOOL VoltorbFlipTaskEngine_AwardCoins_Main(VoltorbFlipTaskEngine *workflow, VoltorbFlipAppData *work) {
    int state = VoltorbFlipTaskEngine_CurrentTaskState(workflow);
    switch (state) {
    case 0: {
        int var2 = VoltorbFlipGameState_GetGamePayout(work->game);
        BufferIntegerAsString(work->msgFmt, 0, var2, 5, PRINTING_MODE_LEFT_ALIGN, 1);
        BufferPlayersName(work->msgFmt, 1, work->profile);
        // {STRVAR_1 3, 1, 0}\nreceived {STRVAR_1 53, 0, 0} Coin(s)!\r
        VoltorbFlip_PrintTextWindow(work, msg_0039_00040, TRUE);
        VoltorbFlip_DimLayersExceptBG3(&work->screenIsDimmed);
        Sound_SetSceneAndPlayBGM(64, 0, 0);
        PlaySE(SEQ_SE_GS_COIN_PAYOUT_ONE);
        VoltorbFlipTaskEngine_IncrementTaskState(workflow);
    }
        // fallthrough
    case 1:
        if (VoltorbFlip_AwardPayoutToPlayer(work)) {
            VoltorbFlipTaskEngine_IncrementTaskState(workflow);
        }
        break;
    case 2:
        if (!GF_IsAnySEPlaying() && VoltorbFlip_IsPrinterFinished(work)) {
            Sound_SetSceneAndPlayBGM(70, 0, 0);
            BgClearTilemapBufferAndCommit(work->bgConfig, 3);
            VoltorbFlip_UndimLayersExceptBG3(&work->screenIsDimmed);
            VoltorbFlipTaskEngine_Enqueue(workflow, WORKFLOW_REVEAL_BOARD);
            return TRUE;
        }
        break;
    default:
        GF_ASSERT(FALSE);
    }
    return FALSE;
}

BOOL VoltorbFlipTaskEngine_RevealBoard_Main(VoltorbFlipTaskEngine *workflow, VoltorbFlipAppData *work) {
    int state = VoltorbFlipTaskEngine_CurrentTaskState(workflow);
    switch (state) {
    case 0:
        VFCardFlipAnim_Set(&work->cardFlipControl, 0, FLIP_ANIM_REVEAL, work);
        PlaySE(SEQ_SE_GS_PANERU_MEKURU);
        VoltorbFlipTaskEngine_IncrementTaskState(workflow);
        break;
    case 1:
        if (VFCardFlipAnim_Play(&work->cardFlipControl)) {
            VoltorbFlipTaskEngine_IncrementTaskState(workflow);
        }
        break;
    case 2:
        if (System_GetTouchNew() != 0 || gSystem.newKeys != 0) {
            VFCardFlipAnim_Set(&work->cardFlipControl, 0, FLIP_ANIM_CLEAR, work);
            VoltorbFlipTaskEngine_IncrementTaskState(workflow);
        }
        break;
    case 3:
        if (VFCardFlipAnim_Play(&work->cardFlipControl)) {
            VoltorbFlipTaskEngine_Enqueue(work->workflow, WORKFLOW_COIN_CASE_FULL);
            return TRUE;
        }
        break;
    default:
        GF_ASSERT(FALSE);
    }
    return FALSE;
}

BOOL VoltorbFlipTaskEngine_RevealBoard_End(VoltorbFlipTaskEngine *workflow, VoltorbFlipAppData *work) {
    VoltorbFlipGameState_UpdateHistoryAndReset(work->game);
    VoltorbFlipInputHandler_SetBoardFocused(work->inputHandler, FALSE);
    VoltorbFlipInputHandler_SetGridCursor0(work->inputHandler);

    int payout = VoltorbFlipGameState_GetGamePayout(work->game);
    u16 coins = (u32)Coins_GetValue(work->coins);

    VoltorbFlip_PrintCoins(work, COIN_DISPLAY_PAYOUT, payout);
    VoltorbFlip_PrintCoins(work, COIN_DISPLAY_TOTAL, coins);
    VoltorbFlip_PrintBoardVoltorbsAndPoints(work);

    work->hasPlayedOneLeve = TRUE;
    return TRUE;
}

BOOL VoltorbFlipTaskEngine_MemoTouch_SetUp(VoltorbFlipTaskEngine *workflow, VoltorbFlipAppData *work) {
    return VoltorbFlipTaskEngine_Memo_SetUp(workflow, work);
}

BOOL VoltorbFlipTaskEngine_MemoTouch_Run(VoltorbFlipTaskEngine *workflow, VoltorbFlipAppData *work) {
    int input = VoltorbFlipInputHandler_HandleInput(work->inputHandler);
    switch (input) {
    case 1:
        PlaySE(SEQ_SE_DP_SELECT);
        if (!VoltorbFlipInputHandler_GetTouchNew(work->inputHandler)) {
            VoltorbFlipTaskEngine_Enqueue(workflow, WORKFLOW_MEMO_BUTTONS);
            return TRUE;
        }
        break;
    case 3:
    case 4:
        PlaySE(SEQ_SE_DP_SELECT);
        work->memoOpen = FALSE;
        ManagedSprite_SetAnim(work->sprites[VF_SPRITE_02], 6);
        VoltorbFlipTaskEngine_Enqueue(workflow, WORKFLOW_AWAIT_BOARD_INTERACT);
        return TRUE;
    case 2:
        PlaySE(SEQ_SE_DP_DECIDE);
        work->memoOpen = FALSE;
        ManagedSprite_SetAnim(work->sprites[VF_SPRITE_03], 3);
        VoltorbFlipTaskEngine_Enqueue(workflow, WORKFLOW_QUIT_ROUND);
        return TRUE;
    case 5:
    case 6:
    case 7:
    case 8: {
        int cardId = VoltorbFlipInputHandler_GetCursorPos(work->inputHandler);

        u8 var3 = input - 5;
        VoltorbFlip_TryToggleCardMemo(work, cardId, var3);
        break;
    }
    case 0:
        VoltorbFlip_UpdateMemoInputPanelStates(work);
        break;
    default:
        GF_ASSERT(FALSE);
    }
    return FALSE;
}

BOOL VoltorbFlipTaskEngine_MemoButtons_SetUp(VoltorbFlipTaskEngine *workflow, VoltorbFlipAppData *work) {
    int state = VoltorbFlipTaskEngine_CurrentTaskState(workflow);
    if (state == 0) {
        ov122_021E78DC(&work->screenIsDimmed);
        VoltorbFlipInputHandler_SetMemoFocused(work->inputHandler, TRUE);
    }
    return VoltorbFlipTaskEngine_Memo_SetUp(workflow, work);
}

BOOL VoltorbFlipTaskEngine_MemoButtons_Begin(VoltorbFlipTaskEngine *workflow, VoltorbFlipAppData *work) {
    return TRUE;
}

BOOL VoltorbFlipTaskEngine_MemoTouch_Main(VoltorbFlipTaskEngine *workflow, VoltorbFlipAppData *work) {
    int input = VoltorbFlipInputHandler_HandleInput(work->inputHandler);
    switch (input) {
    case 1: {
        int cardId = VoltorbFlipInputHandler_GetCursorPos(work->inputHandler);
        int memoId = VoltorbFlipInputHandler_GetMemoButtonID(work->inputHandler);
        if (VoltorbFlip_TryToggleCardMemo(work, cardId, memoId)) {
            VoltorbFlipTaskEngine_Enqueue(workflow, WORKFLOW_MEMO_TOUCH);
            return TRUE;
        }
        break;
    }
    case 4:
        PlaySE(SEQ_SE_DP_SELECT);
        work->memoOpen = FALSE;
        ManagedSprite_SetAnim(work->sprites[VF_SPRITE_02], 6);
        VoltorbFlipTaskEngine_Enqueue(workflow, WORKFLOW_AWAIT_BOARD_INTERACT);
        return TRUE;
    case 3:
        PlaySE(SEQ_SE_DP_BUTTON3);
        ManagedSprite_SetAnim(work->sprites[VF_SPRITE_MEMO_CURSOR], 17);
        VoltorbFlipTaskEngine_Enqueue(workflow, WORKFLOW_MEMO_TOUCH);
        return TRUE;
    case 2:
        PlaySE(SEQ_SE_DP_DECIDE);
        work->memoOpen = FALSE;
        ManagedSprite_SetAnim(work->sprites[VF_SPRITE_03], 3);
        VoltorbFlipTaskEngine_Enqueue(workflow, WORKFLOW_QUIT_ROUND);
        return TRUE;
    case 0:
        VoltorbFlip_UpdateMemoInputPanelStates(work);
        break;
    default:
        GF_ASSERT(FALSE);
    }
    return FALSE;
}

BOOL VoltorbFlipTaskEngine_MemoTouch_End(VoltorbFlipTaskEngine *workflow, VoltorbFlipAppData *work) {
    return TRUE;
}

BOOL VoltorbFlipTaskEngine_Memo_TidyUp(VoltorbFlipTaskEngine *workflow, VoltorbFlipAppData *work) {
    int state = VoltorbFlipTaskEngine_CurrentTaskState(workflow);
    switch (state) {
    case 0:
        VoltorbFlip_UpdateMemoInputPanelStates(work);
        VoltorbFlipTaskEngine_IncrementTaskState(workflow);
        // fallthrough
    case 1:
        if (ov122_021E7F70(work)) {
            if (VoltorbFlipTaskEngine_CurrentWorkflow(workflow) == WORKFLOW_MEMO_BUTTONS) {
                VoltorbFlipInputHandler_SetMemoCursor0(work->inputHandler);
                VoltorbFlipInputHandler_SetMemoFocused(work->inputHandler, FALSE);
                ov122_021E7904(&work->screenIsDimmed);
            }
            VoltorbFlipTaskEngine_IncrementTaskState(workflow);
        }
        break;
    case 2:
        if (!work->memoOpen) {
            VoltorbFlip_AnimateCloseMenu(work);
            VoltorbFlipTaskEngine_IncrementTaskState(workflow);
        } else {
            return TRUE;
        }
        break;
    case 3:
        if (ManagedSprite_IsAnimated(work->sprites[VF_SPRITE_MEMO]) == 0) {
            ManagedSprite_SetDrawFlag(work->sprites[VF_SPRITE_MEMO], 0);
            return TRUE;
        }
        break;
    default:
        GF_ASSERT(FALSE);
    }
    return FALSE;
}

BOOL VoltorbFlipTaskEngine_QuitRound_SetUp(VoltorbFlipTaskEngine *workflow, VoltorbFlipAppData *work) {
    int msgNo;

    int state = VoltorbFlipTaskEngine_CurrentTaskState(workflow);
    switch (state) {
    case 0: {
        int payout = VoltorbFlipGameState_GetGamePayout(work->game);
        if (payout == 0) {
            // You haven't found any Coins!\nAre you sure you want to quit?
            msgNo = msg_0039_00037;
        } else {
            // If you quit now, you will\nreceive {STRVAR_1 53, 0, 0} Coin(s).\fWill you quit?
            msgNo = msg_0039_00034;
            BufferIntegerAsString(work->msgFmt, 0, payout, 5, PRINTING_MODE_LEFT_ALIGN, 1);
        }
        VoltorbFlip_DimLayersExceptBG3(&work->screenIsDimmed);
        VoltorbFlip_PrintTextWindow(work, msgNo, TRUE);
        VoltorbFlipTaskEngine_IncrementTaskState(workflow);
        break;
    }
    case 1:
        if (VoltorbFlip_IsPrinterFinished(work)) {
            return TRUE;
        }
        break;
    default:
        GF_ASSERT(FALSE);
    }
    return FALSE;
}

BOOL VoltorbFlipTaskEngine_QuitRound_Begin(VoltorbFlipTaskEngine *workflow, VoltorbFlipAppData *work) {
    YesNoPromptTemplate yesNoTemplate = { 0 };

    yesNoTemplate.bgConfig = work->bgConfig;
    yesNoTemplate.bgId = 3;
    yesNoTemplate.tileStart = 31;
    yesNoTemplate.plttSlot = 9;
    yesNoTemplate.x = 25;
    yesNoTemplate.y = 10;
    yesNoTemplate.initialCursorPos = 0;

    YesNoPrompt_InitFromTemplate(work->yesNoPrompt, &yesNoTemplate);
    return TRUE;
}

BOOL VoltorbFlipTaskEngine_QuitRound_Run(VoltorbFlipTaskEngine *workflow, VoltorbFlipAppData *work) {
    int input = YesNoPrompt_HandleInput(work->yesNoPrompt);
    switch (input) {
    case YESNORESPONSE_YES: {
        int payout = VoltorbFlipGameState_GetGamePayout(work->game);

        VoltorbFlipGameState_SetRoundOutcome(work->game, ROUND_OUTCOME_QUIT);
        if (payout == 0) {
            BgClearTilemapBufferAndCommit(work->bgConfig, 3);
            VoltorbFlip_UndimLayersExceptBG3(&work->screenIsDimmed);
            VoltorbFlipTaskEngine_Enqueue(workflow, WORKFLOW_REVEAL_BOARD);
        } else {
            VoltorbFlipTaskEngine_Enqueue(workflow, WORKFLOW_AWARD_COINS);
        }
        return TRUE;
    }
    case YESNORESPONSE_NO:
        BgClearTilemapBufferAndCommit(work->bgConfig, 3);
        VoltorbFlip_UndimLayersExceptBG3(&work->screenIsDimmed);
        if (work->memoOpen) {
            VoltorbFlipTaskEngine_Enqueue(workflow, WORKFLOW_MEMO_TOUCH);
        } else {
            VoltorbFlipTaskEngine_Enqueue(workflow, WORKFLOW_AWAIT_BOARD_INTERACT);
        }
        return TRUE;
    }
    return FALSE;
}

BOOL VoltorbFlipTaskEngine_QuitRound_End(VoltorbFlipTaskEngine *workflow, VoltorbFlipAppData *work) {
    YesNoPrompt_Reset(work->yesNoPrompt);
    return TRUE;
}

static BOOL VoltorbFlip_AddCoinsToPayout(VoltorbFlipAppData *work) {
    u32 payout = VoltorbFlipGameState_GetGamePayout(work->game);
    if (System_GetTouchNew() || gSystem.newKeys != 0) {
        VoltorbFlip_PrintCoins(work, COIN_DISPLAY_PAYOUT, payout);
    } else if (payout > work->payoutDisplay) {
        if ((work->payoutDisplay % 4) == 0) {
            PlaySE(SEQ_SE_GS_OKOZUKAI);
        }
        VoltorbFlip_PrintCoins(work, COIN_DISPLAY_PAYOUT, ++work->payoutDisplay);
    } else {
        PlaySE(SEQ_SE_GS_OKOZUKAI);
        return TRUE;
    }
    return FALSE;
}

// Returns TRUE when all the payout has been given to the player.
static BOOL VoltorbFlip_AwardPayoutToPlayer(VoltorbFlipAppData *work) {
    BOOL payoutDeducted; // only TRUE for incremental deduction

    u16 coins = (u32)Coins_GetValue(work->coins);
    u16 payout = VoltorbFlipGameState_GetGamePayout(work->game);

    if (System_GetTouchNew() || gSystem.newKeys != 0 || coins >= 50000) {
        VoltorbFlipGameState_DeductFromPayout(work->game, (u8)payout);
        Coins_Add(work->coins, payout);

        int newTotal = coins + payout;
        if (newTotal > 50000) {
            newTotal = 50000;
        }

        VoltorbFlip_PrintCoins(work, COIN_DISPLAY_PAYOUT, 0);
        VoltorbFlip_PrintCoins(work, COIN_DISPLAY_TOTAL, (u16)newTotal);
        payoutDeducted = FALSE;
    } else {
        payoutDeducted = VoltorbFlipGameState_DeductFromPayout(work->game, 1);
    }

    if (payoutDeducted) {
        Coins_Add(work->coins, 1);
        VoltorbFlip_PrintCoins(work, COIN_DISPLAY_PAYOUT, (u16)(payout - 1));
        VoltorbFlip_PrintCoins(work, COIN_DISPLAY_TOTAL, (u16)(coins + 1));
        if (payout % 4 == 0) {
            PlaySE(SEQ_SE_GS_COIN_PAYOUT_ONE);
        }
    } else {
        PlaySE(SEQ_SE_GS_COIN_PAYOUT_LAST);
        return TRUE;
    }
    return FALSE;
}

static void ov122_021E6B38(VoltorbFlipAppData *work) {
    int i;
    int j;

    for (i = 0; i < 10; i++) {
        for (j = 0; j < 8; j++) {
            work->unk188[i][j] = ov122_021E92A0[j] + i * 2;
        }
    }
}

static void VoltorbFlip_PrintCoins(VoltorbFlipAppData *work, CoinDisplay type, int amount) {
    int y;
    u8 buf[5];

    buf[0] = amount / 10000;
    buf[1] = (amount / 1000) % 10;
    buf[2] = (amount / 100) % 10;
    buf[3] = (amount / 10) % 10;
    buf[4] = amount % 10;

    int i = 0;
    int x = 21;
    for (; i < 5; i++) {
        if (type != COIN_DISPLAY_TOTAL) {
            y = 19;
        } else {
            y = 14;
        }

        LoadRectToBgTilemapRect(work->bgConfig, GF_BG_LYR_SUB_0, &work->unk188[buf[i]][0], x, y, 2, 4);
        x += 2;
    }

    if (type != COIN_DISPLAY_TOTAL) {
        work->payoutDisplay = amount;
    }

    BgCommitTilemapBufferToVram(work->bgConfig, GF_BG_LYR_SUB_0);
}

static void VoltorbFlip_RenderCardMemo(VoltorbFlipAppData *work, int cardId, int memoFlag) {
    u16 temp1[1];

    int idx = MemoFlagToIdx(memoFlag);
    int x = (cardId % 5) * 4 + 1 + sMemoRenderOverrides[idx].xOffset;
    int y = (cardId / 5) * 4 + 1 + sMemoRenderOverrides[idx].yOffset;

    if (VoltorbFlipGameState_IsCardMemoFlagOn(work->game, cardId, memoFlag) != 0) {
        temp1[0] = sMemoRenderOverrides[idx].tileId;
        LoadRectToBgTilemapRect(work->bgConfig, GF_BG_LYR_MAIN_2, temp1, x, y, 1, 1);
    } else {
        FillBgTilemapRect(work->bgConfig, GF_BG_LYR_MAIN_2, 0, x, y, 1, 1, 0);
    }

    BgCommitTilemapBufferToVram(work->bgConfig, GF_BG_LYR_MAIN_2);
}

static void VoltorbFlip_PrintBoardVoltorbs(VoltorbFlipAppData *work) {
    int i;
    u16 buf[4];

    // Rows
    i = 0;
    int y = 2;
    for (; i < 5; i++) {
        int voltorbs = VoltorbFlipGameState_GetVoltorbsAlongAxis(work->game, AXIS_ROW, i);
        buf[2] = voltorbs + 203;
        buf[3] = voltorbs + 235;
        LoadRectToBgTilemapRect(work->bgConfig, GF_BG_LYR_MAIN_2, &buf[2], 23, y, 1, 2);

        y += 4;
    }

    // Columns
    i = 0;
    int x = 3;
    for (; i < 5; i++) {
        int voltorbs = VoltorbFlipGameState_GetVoltorbsAlongAxis(work->game, AXIS_COL, i);
        buf[0] = voltorbs + 203;
        buf[1] = voltorbs + 235;
        LoadRectToBgTilemapRect(work->bgConfig, GF_BG_LYR_MAIN_2, buf, x, 22, 1, 2);

        x += 4;
    }
}

static void VoltorbFlip_PrintBoardPoints(VoltorbFlipAppData *work) {
    int i;
    u16 buf[4];

    // Rows
    i = 0;
    int y = 1;
    for (; i < 5; i++) {
        int points = VoltorbFlipGameStates_GetPointsAlongAxis(work->game, AXIS_ROW, i);

        buf[2] = points / 10 + 1;
        buf[3] = points % 10 + 1;
        LoadRectToBgTilemapRect(work->bgConfig, GF_BG_LYR_MAIN_2, &buf[2], 22, y, 2, 1);

        y += 4;
    }

    // Columns
    i = 0;
    int x = 2;
    for (; i < 5; i++) {
        int points = VoltorbFlipGameStates_GetPointsAlongAxis(work->game, AXIS_COL, i);

        buf[0] = points / 10 + 1;
        buf[1] = points % 10 + 1;
        LoadRectToBgTilemapRect(work->bgConfig, GF_BG_LYR_MAIN_2, &buf[0], x, 21, 2, 1);

        x += 4;
    }
}

static int GetCardFaceUpTile(u8 cardType, u8 frame) {
    GF_ASSERT(frame < 2);
    GF_ASSERT(cardType < 5);

    return sCardFaceUpTileIDs[cardType][frame];
}

static void SetTile(u16 *tiles3x3, int baseTile) {
    for (int i = 0; i < 9; i++) {
        tiles3x3[i] = baseTile + (i / 3) * 32 + i % 3;
    }
}

static void DrawCardFaceUp(BgConfig *bgConfig, VoltorbFlipGameState *game, int cardId, int mode) {
    u16 temp1[9];

    int x = (cardId % 5) * 4 + 1;
    int y = (cardId / 5) * 4 + 1;
    int cardType = VoltorbFlipGameState_GetCardType(game, cardId);

    switch (mode) {
    case 0:
        SetTile(temp1, 119);
        break;
    case 1:
        SetTile(temp1, 26);
        break;
    case 2:
        SetTile(temp1, GetCardFaceUpTile(cardType, 0));
        break;
    case 3:
        SetTile(temp1, GetCardFaceUpTile(cardType, 1));
        break;
    default:
        GF_ASSERT(FALSE);
    }

    LoadRectToBgTilemapRect(bgConfig, GF_BG_LYR_MAIN_0, temp1, x, y, 3, 3);
}

static void DrawCardFaceDown(BgConfig *bgConfig, VoltorbFlipGameState *game, int cardId, int mode) {
    u16 tiles3x3[9];

    int x = (cardId % 5) * 4 + 1;
    int y = (cardId / 5) * 4 + 1;
    int cardType = VoltorbFlipGameState_GetCardType(game, cardId);

    switch (mode) {
    case 0:
        SetTile(tiles3x3, GetCardFaceUpTile(cardType, 0));
        break;
    case 1:
        SetTile(tiles3x3, 26);
        break;
    case 2:
        SetTile(tiles3x3, 119);
        break;
    case 3:
        SetTile(tiles3x3, 23);
        break;
    default:
        GF_ASSERT(FALSE);
    }

    LoadRectToBgTilemapRect(bgConfig, GF_BG_LYR_MAIN_0, tiles3x3, x, y, 3, 3);
}

static void VFCardFlipAnim_FlipSingle(VFCardFlipAnim *anim) {
    DrawCardFaceUp(anim->bgConfig, anim->game, anim->cursorPos, anim->step);
}

static BOOL VFCardFlipAnim_FlipAll(VFCardFlipAnim *anim) {
    BOOL ret = FALSE;

    for (int i = 0; i < 25; i++) {
        if (!VoltorbFlipGameState_IsCardFlipped(anim->game, i & 0xFF)) {
            ret = TRUE;
            DrawCardFaceUp(anim->bgConfig, anim->game, (u8)i, anim->step);
        }
    }

    return ret;
}

static void VFCardFlipAnim_FlipRow(VFCardFlipAnim *anim) {
    for (int i = 0; i < 5; i++) {
        DrawCardFaceDown(anim->bgConfig, anim->game, (u8)(anim->row + 5 * i), anim->step);
    }
}

static BOOL VFCardFlipAnim_HideAll(VFCardFlipAnim *anim) {
    BOOL ret = FALSE;

    for (int i = 0; i < 25; i++) {
        if (!VoltorbFlipGameState_IsCardFlipped(anim->game, i & 0xFF)) {
            ret = TRUE;
            DrawCardFaceDown(anim->bgConfig, anim->game, (u8)i, anim->step);
        }
    }

    return ret;
}

static void VFCardFlipAnim_RenderStep(VFCardFlipAnim *state) {
    BOOL shouldPlaySound = TRUE;

    switch (state->mode) {
    case FLIP_ANIM_SINGLE:
        VFCardFlipAnim_FlipSingle(state);
        break;
    case FLIP_ANIM_REVEAL:
        shouldPlaySound = VFCardFlipAnim_FlipAll(state);
        break;
    case FLIP_ANIM_CLEAR:
        VFCardFlipAnim_FlipRow(state);
        break;
    case FLIP_ANIM_HIDE:
        shouldPlaySound = VFCardFlipAnim_HideAll(state);
        break;
    }

    if (state->step == 0 && shouldPlaySound) {
        PlaySE(SEQ_SE_GS_PANERU_MEKURU);
    }

    BgCommitTilemapBufferToVram(state->bgConfig, GF_BG_LYR_MAIN_0);
}

static void VoltorbFlip_PrintBoardVoltorbsAndPoints(VoltorbFlipAppData *work) {
    BgClearTilemapBufferAndCommit(work->bgConfig, GF_BG_LYR_MAIN_2);
    VoltorbFlip_PrintBoardVoltorbs(work);
    VoltorbFlip_PrintBoardPoints(work);
    BgCommitTilemapBufferToVram(work->bgConfig, GF_BG_LYR_MAIN_2);
}

static void VFCardFlipAnim_Set(VFCardFlipAnim *anim, int cursorPos, int mode, VoltorbFlipAppData *work) {
    anim->bgConfig = work->bgConfig;
    anim->inputHandler = work->inputHandler;
    anim->game = work->game;
    anim->mode = mode;
    anim->cursorPos = cursorPos;
    anim->step = 0;
    anim->frame = 0;
    anim->row = 5;

    switch (mode) {
    case FLIP_ANIM_SINGLE: {
        int x = (anim->cursorPos % 5) * 4 + 1;
        int y = (anim->cursorPos / 5) * 4 + 1;

        FillBgTilemapRect(work->bgConfig, GF_BG_LYR_MAIN_2, 0, x, y, 3, 3, 0);
        BgCommitTilemapBufferToVram(work->bgConfig, GF_BG_LYR_MAIN_2);
        break;
    }
    case FLIP_ANIM_REVEAL:
        FillBgTilemapRect(work->bgConfig, GF_BG_LYR_MAIN_2, 0, 1, 1, 20, 20, 0);
        BgCommitTilemapBufferToVram(work->bgConfig, GF_BG_LYR_MAIN_2);
        break;
    case FLIP_ANIM_CLEAR:
        anim->row = 0;
        break;
    case FLIP_ANIM_HIDE:
        break;
    default:
        GF_ASSERT(FALSE);
        break;
    }
}

static BOOL VFCardFlipAnim_Play(VFCardFlipAnim *state) {
    if (state->frame % 3 != 0) {
        VFCardFlipAnim_RenderStep(state);
        if (++state->step >= 4) {
            state->step = 0;
            if (++state->row >= 5) {
                return TRUE;
            }
        }
    }
    state->frame++;
    return FALSE;
}

static void VoltorbFlip_AnimateOpenMenu(VoltorbFlipAppData *work) {
    GF_ASSERT(!work->memoOpen);

    VoltorbFlipInputHandler_SetMemoCursor0(work->inputHandler);
    VoltorbFlipInputHandler_SetMemoOpen(work->inputHandler, TRUE);
    ManagedSprite_SetDrawFlag(work->sprites[VF_SPRITE_MEMO], TRUE);
    ManagedSprite_SetAnim(work->sprites[VF_SPRITE_MEMO], 20);
    // {ALN_CENTER}Close\n{ALN_CENTER}Memo
    VoltorbFlip_PaintMessageOnWindow(work, 4, msg_0039_00007, &work->wMemo, 0, 0);
    work->memoOpen = TRUE;
    PlaySE(SEQ_SE_DP_CARD2);
}

static void VoltorbFlip_AnimateCloseMenu(VoltorbFlipAppData *work) {
    GF_ASSERT(!work->memoOpen);

    VoltorbFlipInputHandler_SetMemoOpen(work->inputHandler, FALSE);
    VoltorbFlipInputHandler_SetMemoCursor0(work->inputHandler);
    VoltorbFlip_SetMemoSpritesDrawFlag(work, FALSE);
    ManagedSprite_SetAnim(work->sprites[VF_SPRITE_MEMO], 21);
    // {ALN_CENTER}Open\n{ALN_CENTER}Memo
    VoltorbFlip_PaintMessageOnWindow(work, 4, msg_0039_00006, &work->wMemo, 0, 0);
    PlaySE(SEQ_SE_DP_CARD2);
}

static void VoltorbFlip_SetMemoSpritesDrawFlag(VoltorbFlipAppData *work, BOOL flag) {
    ManagedSprite_SetDrawFlag(work->sprites[VF_SPRITE_TOGGLE_MEMO_VOLTORB], flag);
    ManagedSprite_SetDrawFlag(work->sprites[VF_SPRITE_TOGGLE_MEMO_ONE], flag);
    ManagedSprite_SetDrawFlag(work->sprites[VF_SPRITE_TOGGLE_MEMO_TWO], flag);
    ManagedSprite_SetDrawFlag(work->sprites[VF_SPRITE_TOGGLE_MEMO_THREE], flag);

    if (flag) {
        if (VoltorbFlipTaskEngine_CurrentWorkflow(work->workflow) == WORKFLOW_MEMO_BUTTONS) {
            flag = TRUE;
        } else {
            flag = FALSE;
        }
    }

    ManagedSprite_SetDrawFlag(work->sprites[VF_SPRITE_MEMO_CURSOR], flag);
}

static void VoltorbFlip_UpdateMemoInputPanelStates(VoltorbFlipAppData *work) {
    int cursorPos = VoltorbFlipInputHandler_GetCursorPos(work->inputHandler);

    if (VoltorbFlipInputHandler_IsCursorInGridRange(work->inputHandler)) {
        for (int i = 0; i < 4; i++) {
            GF_ASSERT(sMemoInputGridDrawParam[i][2] < VF_SPRITE_NUM);

            int spriteIdx = sMemoInputGridDrawParam[i][2];
            ManagedSprite *sprite = work->sprites[spriteIdx];
            BOOL memoFlag = VoltorbFlipGameState_IsCardMemoFlagOn(work->game, cursorPos, sMemoInputGridDrawParam[i][3]);
            ManagedSprite_SetAnim(sprite, sMemoInputGridDrawParam[i][memoFlag]);
        }
        VoltorbFlip_SetMemoSpritesDrawFlag(work, TRUE);
    } else {
        VoltorbFlip_SetMemoSpritesDrawFlag(work, FALSE);
    }
}

// Returns TRUE if the player pressed the Back button.
static BOOL VoltorbFlip_TryToggleCardMemo(VoltorbFlipAppData *work, int cardId, int memoId) {
    if (VoltorbFlipGameState_IsCardFlipped(work->game, cardId)) {
        PlaySE(SEQ_SE_DP_BOX03);
        return FALSE;
    }

    PlaySE(SEQ_SE_DP_BOX01);
    switch (memoId) {
    case 4: // Back button
        return TRUE;
    case 0: // Voltorb button
        VoltorbFlipGameState_ToggleCardMemo(work->game, cardId, MEMO_VOLTORB);
        VoltorbFlip_RenderCardMemo(work, cardId, MEMO_VOLTORB);
        break;
    case 1: // 1 button
        VoltorbFlipGameState_ToggleCardMemo(work->game, cardId, MEMO_ONE);
        VoltorbFlip_RenderCardMemo(work, cardId, MEMO_ONE);
        break;
    case 2: // 2 button
        VoltorbFlipGameState_ToggleCardMemo(work->game, cardId, MEMO_TWO);
        VoltorbFlip_RenderCardMemo(work, cardId, MEMO_TWO);
        break;
    case 3: // 3 button
        VoltorbFlipGameState_ToggleCardMemo(work->game, cardId, MEMO_THREE);
        VoltorbFlip_RenderCardMemo(work, cardId, MEMO_THREE);
        break;
    default:
        GF_ASSERT(FALSE);
    }
    return FALSE;
}

static void VoltorbFlip_CreateListMenuSpawnerAndItems(VoltorbFlipAppData *work) {
    work->listMenuSpawner = TouchscreenListMenuSpawner_Create(work->heapID, 0);

    for (int i = 0; i < 2; i++) {
        work->menuItems[i] = ListMenuItems_New(sMenuMsgNos[i].size, work->heapID);

        for (int j = 0; j < sMenuMsgNos[i].size; j++) {
            const u8 *msgNos = sMenuMsgNos[i].msgNos;
            ListMenuItems_AppendFromMsgData(work->menuItems[i], work->msgData, msgNos[j], j);
        }
    }
}

static void VoltorbFlip_DestroyListMenuSpawnerAndItems(VoltorbFlipAppData *work) {
    for (int i = 0; i < 2; i++) {
        ListMenuItems_Delete(work->menuItems[i]);
        work->menuItems[i] = NULL;
    }
    TouchscreenListMenuSpawner_Destroy(work->listMenuSpawner);
}

static void VoltorbFlip_CreateListMenu(VoltorbFlipAppData *work, int whichList) {
    TouchscreenListMenuHeader header = { 0 };
    const MsgNoList *ptr = &sMenuMsgNos[whichList];
    GF_ASSERT(work->bgConfig != NULL);

    header.template = sListMenuTemplate;

    header.listMenuItems = work->menuItems[whichList];
    header.bgConfig = work->bgConfig;
    header.numWindows = ptr->size;

    work->menu = TouchscreenListMenu_Create(work->listMenuSpawner, &header, work->menuInputState, 17, 17 - ptr->size * 3, 13, 0);
}

static int VoltorbFlip_HandleListMenuInput(VoltorbFlipAppData *work) {
    int input = TouchscreenListMenu_HandleInput(work->menu);
    if (input == -1) {
        return -1;
    }

    work->menuInputState = TouchscreenListMenu_WasLastInputTouch(work->menu);
    TouchscreenListMenu_Destroy(work->menu);
    return input;
}

static void VoltorbFlip_RenderTopScreen(VoltorbFlipAppData *work) {
    // {ALN_CENTER}Open\n{ALN_CENTER}Memo
    VoltorbFlip_PaintMessageOnWindow(work, 4, msg_0039_00006, &work->wMemo, 0, 0);
    // {ALN_CENTER}Quit
    VoltorbFlip_PaintMessageOnWindow(work, 4, msg_0039_00008, &work->wQuit, 0, 0);
    BgCommitTilemapBufferToVram(work->bgConfig, GF_BG_LYR_MAIN_1);

    BufferIntegerAsString(work->msgFmt, 0, 1, 1, PRINTING_MODE_LEFT_ALIGN, 1);

    // {ALN_CENTER}VOLTORB Flip Lv. {STRVAR_1 50, 0, 0}
    VoltorbFlip_PrintMessageOnWindow(work, 0, msg_0039_00000, &work->wCurrentLevel, 0, 0, MAKE_TEXT_COLOR(15, 1, 0));
    // {ALN_CENTER}Flip the Cards and Collect Coins!
    VoltorbFlip_PrintMessageOnWindow(work, 0, msg_0039_00001, &work->wFlipCardsAndCollectCoins, 0, 0, MAKE_TEXT_COLOR(15, 1, 0));
    BufferPlayersName(work->msgFmt, 0, work->profile);

    // ...x1! ...x2! ...x3!
    VoltorbFlip_PrintMessageOnWindow(work, 0, msg_0039_00002, &work->wx1x2x3, 0, 4, MAKE_TEXT_COLOR(15, 1, 0));
    // Game Over! 0!
    VoltorbFlip_PrintMessageOnWindow(work, 0, msg_0039_00003, &work->wGameOver, 0, 4, MAKE_TEXT_COLOR(15, 1, 0));
    // {ALN_CENTER}{STRVAR_1 3, 0, 0}'\n{ALN_CENTER}Collected Coins
    VoltorbFlip_PaintMessageOnWindow(work, 0, msg_0039_00004, &work->wCollectedCoins, 0, 0);
    // {ALN_CENTER}Coins Collected in\n{ALN_CENTER}Current Game
    VoltorbFlip_PaintMessageOnWindow(work, 0, msg_0039_00005, &work->wPayout, 0, 0);
    BgCommitTilemapBufferToVram(work->bgConfig, GF_BG_LYR_SUB_1);
}

static void VoltorbFlip_AddWindows(VoltorbFlipAppData *work) {
    for (int i = 0; i < 17; i++) {
        AddWindow(work->bgConfig, &work->windows[i], &sVoltorbFlipWindowTemplates[i]);
        FillWindowPixelBuffer(&work->windows[i], 0);
    }
    VoltorbFlip_RenderTopScreen(work);
}

static void VoltorbFlip_RemoveWindows(VoltorbFlipAppData *work) {
    for (int i = 0; i < 17; i++) {
        ClearWindowTilemapAndCopyToVram(&work->windows[i]);
        RemoveWindow(&work->windows[i]);
    }
}

// Like PrintMessageOnWindow but it gets printed all at once.
static void VoltorbFlip_PaintMessageOnWindow(VoltorbFlipAppData *work, FontID fontId, u8 msgNo, Window *window, u8 x, u8 y) {
    VoltorbFlip_PrintMessageOnWindow(work, fontId, msgNo, window, x, y, MAKE_TEXT_COLOR(1, 2, 0));
}

static void VoltorbFlip_PrintMessageOnWindow(VoltorbFlipAppData *work, FontID fontId, u8 msgNo, Window *window, u8 x, u8 y, u32 textColor) {
    FillWindowPixelBuffer(window, 0);

    String *str = ReadMsgData_ExpandPlaceholders(work->msgFmt, work->msgData, msgNo, work->heapID);
    AddTextPrinterParameterizedWithColor(window, fontId, str, x, y, TEXT_SPEED_NOTRANSFER, textColor, NULL);

    ScheduleWindowCopyToVram(window);
    String_Delete(str);
}

static void VoltorbFlip_PrintMessageToSmallWindow(VoltorbFlipAppData *work, int msgNo) {
    Window *window = &work->wSmall;

    FillWindowPixelBuffer(window, 15);

    String *str = ReadMsgData_ExpandPlaceholders(work->msgFmt, work->msgData, msgNo, work->heapID);

    FillBgTilemapRect(work->bgConfig, GF_BG_LYR_MAIN_3, 0, 0, 20, 32, 4, 0);
    DrawFrameAndWindow2(window, TRUE, 1, 13);

    AddTextPrinterParameterized(window, 1, str, 0, 0, 0xff, NULL);
    ScheduleWindowCopyToVram(window);
    String_Delete(str);
    BgCommitTilemapBufferToVram(work->bgConfig, GF_BG_LYR_MAIN_3);
}

// Prints a message in the main text window.
static void VoltorbFlip_PrintTextWindow(VoltorbFlipAppData *work, int msgNo, BOOL clearWindow) {
    String *str;
    Window *window = &work->wMain;

    GF_ASSERT(work->string == NULL);

    FillWindowPixelBuffer(window, 15);
    if (msgNo == msg_0039_00025) {
        str = NewString_ReadMsgData(work->msgData, msgNo);
    } else {
        str = ReadMsgData_ExpandPlaceholders(work->msgFmt, work->msgData, msgNo, work->heapID);
    }

    if (clearWindow) {
        FillBgTilemapRect(work->bgConfig, GF_BG_LYR_MAIN_3, 0, 0, 18, 32, 6, 0);
        DrawFrameAndWindow2(window, TRUE, 1, 13);
    }

    work->printerId = AddTextPrinterParameterized(window, 1, str, 0, 0, work->unk22A, NULL);
    GF_ASSERT(work->printerId != 0xff);

    ScheduleWindowCopyToVram(window);
    work->string = str;
}

static BOOL VoltorbFlip_IsPrinterFinished(VoltorbFlipAppData *work) {
    if (!TextPrinterCheckActive(work->printerId)) {
        if (work->string != NULL) {
            String_Delete(work->string);
            work->string = NULL;
        }
        return TRUE;
    }
    return FALSE;
}

static void VoltorbFlip_FormatGameLevel(VoltorbFlipAppData *work, int idx) {
    u8 displayLevel = 8 - VoltorbFlipGameState_GetGameLevel(work->game);

    BufferIntegerAsString(work->msgFmt, idx, displayLevel, 1, PRINTING_MODE_LEFT_ALIGN, 1);
}

static void VoltorbFlip_DimLayersExceptBG3(u8 *isDimmed) {
    if (!*isDimmed) {
        InitScreenBrightnessData(SCREEN_MASK_MAIN);
        StartBrightnessTransition(4, -8, 0, (GXBlendPlaneMask)(GX_BLEND_PLANEMASK_BD | GX_BLEND_PLANEMASK_OBJ | GX_BLEND_PLANEMASK_BG2 | GX_BLEND_PLANEMASK_BG1 | GX_BLEND_PLANEMASK_BG0), SCREEN_MASK_MAIN);
        *isDimmed = TRUE;
    }
}

static void VoltorbFlip_UndimLayersExceptBG3(u8 *isDimmed) {
    InitScreenBrightnessData(SCREEN_MASK_MAIN);
    StartBrightnessTransition(4, 0, -8, (GXBlendPlaneMask)(GX_BLEND_PLANEMASK_BD | GX_BLEND_PLANEMASK_OBJ | GX_BLEND_PLANEMASK_BG2 | GX_BLEND_PLANEMASK_BG1 | GX_BLEND_PLANEMASK_BG0), SCREEN_MASK_MAIN);
    *isDimmed = FALSE;
}

static void ov122_021E78DC(u8 *a0) {
    if (!*a0) {
        InitScreenBrightnessData(SCREEN_MASK_MAIN);
        StartBrightnessTransition(1, -6, 0, (GXBlendPlaneMask)(GX_BLEND_PLANEMASK_BD | GX_BLEND_PLANEMASK_BG0), SCREEN_MASK_MAIN);
        *a0 = TRUE;
    }
}

static void ov122_021E7904(u8 *a0) {
    InitScreenBrightnessData(SCREEN_MASK_MAIN);
    StartBrightnessTransition(1, 0, -6, (GXBlendPlaneMask)(GX_BLEND_PLANEMASK_BD | GX_BLEND_PLANEMASK_BG0), SCREEN_MASK_MAIN);
    *a0 = FALSE;
}

static void VoltorbFlip_InitBgs(VoltorbFlipAppData *work) {
    work->bgConfig = BgConfig_Alloc(work->heapID);

    const struct GraphicsModes graphicsModes = sVoltorbFlipBgModeSet;
    SetBothScreensModesAndDisable(&graphicsModes);

    BgTemplate bgTemplates[] = {
        {
         .x = 0,
         .y = 0,
         .bufferSize = 0x0800,
         .baseTile = 0,
         .size = GF_BG_SCR_SIZE_256x256,
         .colorMode = GX_BG_COLORMODE_16,
         .screenBase = GX_BG_SCRBASE_0x0000,
         .charBase = GX_BG_CHARBASE_0x04000,
         .bgExtPltt = GX_BG_EXTPLTT_01,
         .priority = 3,
         .areaOver = GX_BG_AREAOVER_XLU,
         .dummy = 0,
         .mosaic = FALSE,
         },
        {
         .x = 0,
         .y = 0,
         .bufferSize = 0x0800,
         .baseTile = 0,
         .size = GF_BG_SCR_SIZE_256x256,
         .colorMode = GX_BG_COLORMODE_16,
         .screenBase = GX_BG_SCRBASE_0x0800,
         .charBase = GX_BG_CHARBASE_0x08000,
         .bgExtPltt = GX_BG_EXTPLTT_01,
         .priority = 2,
         .areaOver = GX_BG_AREAOVER_XLU,
         .dummy = 0,
         .mosaic = FALSE,
         },
        {
         .x = 0,
         .y = 0,
         .bufferSize = 0x0800,
         .baseTile = 0,
         .size = GF_BG_SCR_SIZE_256x256,
         .colorMode = GX_BG_COLORMODE_16,
         .screenBase = GX_BG_SCRBASE_0x1000,
         .charBase = GX_BG_CHARBASE_0x0c000,
         .bgExtPltt = GX_BG_EXTPLTT_01,
         .priority = 1,
         .areaOver = GX_BG_AREAOVER_XLU,
         .dummy = 0,
         .mosaic = FALSE,
         },
        {
         .x = 0,
         .y = 0,
         .bufferSize = 0x0800,
         .baseTile = 0,
         .size = GF_BG_SCR_SIZE_256x256,
         .colorMode = GX_BG_COLORMODE_16,
         .screenBase = GX_BG_SCRBASE_0x1800,
         .charBase = GX_BG_CHARBASE_0x10000,
         .bgExtPltt = GX_BG_EXTPLTT_01,
         .priority = 0,
         .areaOver = GX_BG_AREAOVER_XLU,
         .dummy = 0,
         .mosaic = FALSE,
         },
        {
         .x = 0,
         .y = 0,
         .bufferSize = 0x0800,
         .baseTile = 0,
         .size = GF_BG_SCR_SIZE_256x256,
         .colorMode = GX_BG_COLORMODE_16,
         .screenBase = GX_BG_SCRBASE_0x0000,
         .charBase = GX_BG_CHARBASE_0x04000,
         .bgExtPltt = GX_BG_EXTPLTT_01,
         .priority = 1,
         .areaOver = GX_BG_AREAOVER_XLU,
         .dummy = 0,
         .mosaic = FALSE,
         },
        {
         .x = 0,
         .y = 0,
         .bufferSize = 0x0800,
         .baseTile = 0,
         .size = GF_BG_SCR_SIZE_256x256,
         .colorMode = GX_BG_COLORMODE_16,
         .screenBase = GX_BG_SCRBASE_0x0800,
         .charBase = GX_BG_CHARBASE_0x08000,
         .bgExtPltt = GX_BG_EXTPLTT_01,
         .priority = 0,
         .areaOver = GX_BG_AREAOVER_XLU,
         .dummy = 0,
         .mosaic = FALSE,
         },
    };

    for (int i = 0; i < 6; i++) {
        InitBgFromTemplate(work->bgConfig, ov122_021E9270[i], &bgTemplates[i], 0);
        BgClearTilemapBufferAndCommit(work->bgConfig, ov122_021E9270[i]);
        BG_FillCharDataRange(work->bgConfig, (GFBgLayer)ov122_021E9270[i], 0, 1, 0);
        ToggleBgLayer(ov122_021E9270[i], GF_PLANE_TOGGLE_ON);
    }
}

static void VoltorbFlip_UnloadBgs(VoltorbFlipAppData *work) {
    for (int i = 0; i < 6; i++) {
        FreeBgTilemapBuffer(work->bgConfig, ov122_021E9270[i]);
    }

    FontID_Release(4);
    Heap_Free(work->bgConfig);
}

static void VoltorbFlip_LoadBgGfx(VoltorbFlipAppData *work) {
    FontID_Alloc(4, work->heapID);
    GF_ASSERT(work->narc != 0);

    GfGfxLoader_GXLoadPalFromOpenNarc(work->narc, NARC_voltorb_flip_voltorb_flip_00000000_NCLR, GF_PAL_LOCATION_MAIN_BG, GF_PAL_SLOT_0_OFFSET, 0, work->heapID);
    GfGfxLoader_GXLoadPal(NARC_graphic_font, 9, GF_PAL_LOCATION_MAIN_BG, GF_PAL_SLOT_14_OFFSET, 32, work->heapID);
    LoadFontPal1(GF_PAL_LOCATION_MAIN_BG, GF_PAL_SLOT_12_OFFSET, work->heapID);
    LoadFontPal0(GF_PAL_LOCATION_SUB_BG, GF_PAL_SLOT_12_OFFSET, work->heapID);
    GfGfxLoader_GXLoadPal(NARC_graphic_font, 9, GF_PAL_LOCATION_SUB_BG, GF_PAL_SLOT_13_OFFSET, 32, work->heapID);
    LoadUserFrameGfx2(work->bgConfig, GF_BG_LYR_MAIN_3, 1, 13, work->unk229, work->heapID);
    GfGfxLoader_LoadCharDataFromOpenNarc(work->narc, NARC_voltorb_flip_voltorb_flip_00000002_NCGR_lz, work->bgConfig, GF_BG_LYR_MAIN_0, 0, 0, TRUE, work->heapID);
    GfGfxLoader_LoadScrnDataFromOpenNarc(work->narc, NARC_voltorb_flip_voltorb_flip_00000004_NSCR_lz, work->bgConfig, GF_BG_LYR_MAIN_0, 0, 0, TRUE, work->heapID);
    GfGfxLoader_LoadCharDataFromOpenNarc(work->narc, NARC_voltorb_flip_voltorb_flip_00000002_NCGR_lz, work->bgConfig, GF_BG_LYR_MAIN_2, 0, 0, TRUE, work->heapID);
    GfGfxLoader_GXLoadPalFromOpenNarc(work->narc, NARC_voltorb_flip_voltorb_flip_00000001_NCLR, GF_PAL_LOCATION_SUB_BG, GF_PAL_SLOT_0_OFFSET, 0, work->heapID);
    GfGfxLoader_LoadCharDataFromOpenNarc(work->narc, NARC_voltorb_flip_voltorb_flip_00000003_NCGR_lz, work->bgConfig, GF_BG_LYR_SUB_0, 0, 0, TRUE, work->heapID);
    GfGfxLoader_LoadScrnDataFromOpenNarc(work->narc, NARC_voltorb_flip_voltorb_flip_00000006_NSCR_lz, work->bgConfig, GF_BG_LYR_SUB_0, 0, 0, TRUE, work->heapID);
}

static void VoltorbFlip_CreateSpriteSystem(VoltorbFlipAppData *work) {
    SpriteResourceCountsListUnion resourceCounts = sResourceCounts;
    OamManagerParam oamManagerParam = sOamManagerParam;
    OamCharTransferParam oamCharTransferParam = sOamCharTransferParam;
    oamCharTransferParam.maxTasks = 0x80;

    work->spriteRenderer = SpriteSystem_Alloc(work->heapID);
    work->spriteGfxHandler = SpriteManager_New(work->spriteRenderer);

    SpriteSystem_Init(work->spriteRenderer, &oamManagerParam, &oamCharTransferParam, 32);
    SpriteSystem_InitSprites(work->spriteRenderer, work->spriteGfxHandler, 0x80);
    SpriteSystem_InitManagerWithCapacities(work->spriteRenderer, work->spriteGfxHandler, &resourceCounts);

    G2dRenderer_SetSubSurfaceCoords(SpriteSystem_GetRenderer(work->spriteRenderer), 0, 0x20c000);
}

static void VoltorbFlip_FreeSpriteSystem(VoltorbFlipAppData *work) {
    GF_ASSERT(work->spriteRenderer != 0);
    GF_ASSERT(work->spriteGfxHandler != 0);

    VoltorbFlip_DeleteSprites(work);
    SpriteSystem_FreeResourcesAndManager(work->spriteRenderer, work->spriteGfxHandler);
    SpriteSystem_Free(work->spriteRenderer);
}

static void VoltorbFlip_LoadObjectGfx(VoltorbFlipAppData *work) {
    GF_ASSERT(work->narc != 0);

    SpriteSystem *renderer = work->spriteRenderer;
    SpriteManager *gfxHandler = work->spriteGfxHandler;
    NNS_G2D_VRAM_TYPE vram;

    vram = NNS_G2D_VRAM_TYPE_2DMAIN;

    SpriteSystem_LoadPlttResObjFromOpenNarc(renderer, gfxHandler, work->narc, NARC_voltorb_flip_voltorb_flip_00000010_NCLR, FALSE, 5, vram, 0);
    SpriteSystem_LoadCharResObjFromOpenNarc(renderer, gfxHandler, work->narc, NARC_voltorb_flip_voltorb_flip_00000011_NCGR_lz, TRUE, vram, 0);
    SpriteSystem_LoadCellResObjFromOpenNarc(renderer, gfxHandler, work->narc, NARC_voltorb_flip_voltorb_flip_00000012_NCER_lz, TRUE, 0);
    SpriteSystem_LoadAnimResObjFromOpenNarc(renderer, gfxHandler, work->narc, NARC_voltorb_flip_voltorb_flip_00000013_NANR_lz, TRUE, 0);

    vram = NNS_G2D_VRAM_TYPE_2DSUB;
    SpriteSystem_LoadPlttResObjFromOpenNarc(renderer, gfxHandler, work->narc, NARC_voltorb_flip_voltorb_flip_00000014_NCLR, FALSE, 1, vram, 1);
    SpriteSystem_LoadCharResObjFromOpenNarc(renderer, gfxHandler, work->narc, NARC_voltorb_flip_voltorb_flip_00000015_NCGR_lz, TRUE, vram, 1);
    SpriteSystem_LoadCellResObjFromOpenNarc(renderer, gfxHandler, work->narc, NARC_voltorb_flip_voltorb_flip_00000016_NCER_lz, TRUE, 1);
    SpriteSystem_LoadAnimResObjFromOpenNarc(renderer, gfxHandler, work->narc, NARC_voltorb_flip_voltorb_flip_00000017_NANR_lz, TRUE, 1);
}

static ManagedSprite *VoltorbFlip_CreateSprite_Main(SpriteSystem *spriteSystem, SpriteManager *spriteManager, u16 x, u16 y, u16 animation, u16 drawPriority) {
    ManagedSpriteTemplate spriteTemplate = sSpriteTemplate_Main;

    GF_ASSERT(spriteSystem != NULL);
    GF_ASSERT(spriteManager != NULL);

    spriteTemplate.x = x;
    spriteTemplate.y = y;
    spriteTemplate.animation = animation;
    spriteTemplate.drawPriority = drawPriority;

    ManagedSprite *sprite = SpriteSystem_NewSpriteWithYOffset(spriteSystem, spriteManager, &spriteTemplate, FX32_CONST(524));
    ManagedSprite_SetAnimateFlag(sprite, TRUE);
    ManagedSprite_SetDrawFlag(sprite, FALSE);
    return sprite;
}

static ManagedSprite *VoltorbFlip_CreateSprite_Sub(SpriteSystem *spriteSystem, SpriteManager *spriteManager, u16 x, u16 y, u16 animation, u16 drawPriority) {
    ManagedSpriteTemplate spriteTemplate = sSpriteTemplate_Sub;

    GF_ASSERT(spriteSystem != NULL);
    GF_ASSERT(spriteManager != NULL);

    spriteTemplate.x = x;
    spriteTemplate.y = y;
    spriteTemplate.animation = animation;
    spriteTemplate.drawPriority = drawPriority;

    ManagedSprite *sprite = SpriteSystem_NewSpriteWithYOffset(spriteSystem, spriteManager, &spriteTemplate, FX32_CONST(524));
    ManagedSprite_SetAnimateFlag(sprite, TRUE);
    ManagedSprite_SetDrawFlag(sprite, FALSE);
    return sprite;
}

static void VoltorbFlip_CreateSprites(VoltorbFlipAppData *work) {
    work->sprites[VF_SPRITE_00] = VoltorbFlip_CreateSprite_Main(work->spriteRenderer, work->spriteGfxHandler, 0, 0, 18, 1);
    work->sprites[VF_SPRITE_FLIPPING_CARD] = VoltorbFlip_CreateSprite_Main(work->spriteRenderer, work->spriteGfxHandler, 0, 0, 0, 0);
    work->sprites[VF_SPRITE_02] = VoltorbFlip_CreateSprite_Main(work->spriteRenderer, work->spriteGfxHandler, 0xe0, 0x28, 5, 2);
    work->sprites[VF_SPRITE_03] = VoltorbFlip_CreateSprite_Main(work->spriteRenderer, work->spriteGfxHandler, 0xe0, 0xb0, 2, 2);
    work->sprites[VF_SPRITE_MEMO] = VoltorbFlip_CreateSprite_Main(work->spriteRenderer, work->spriteGfxHandler, 0x80, 0x60, 20, 5);
    work->sprites[VF_SPRITE_TOGGLE_MEMO_VOLTORB] = VoltorbFlip_CreateSprite_Main(work->spriteRenderer, work->spriteGfxHandler, 0xc8, 0x50, 12, 4);
    work->sprites[VF_SPRITE_TOGGLE_MEMO_ONE] = VoltorbFlip_CreateSprite_Main(work->spriteRenderer, work->spriteGfxHandler, 0xe0, 0x50, 15, 4);
    work->sprites[VF_SPRITE_TOGGLE_MEMO_TWO] = VoltorbFlip_CreateSprite_Main(work->spriteRenderer, work->spriteGfxHandler, 0xc8, 0x68, 14, 4);
    work->sprites[VF_SPRITE_TOGGLE_MEMO_THREE] = VoltorbFlip_CreateSprite_Main(work->spriteRenderer, work->spriteGfxHandler, 0xe0, 0x68, 13, 4);
    work->sprites[VF_SPRITE_MEMO_CURSOR] = VoltorbFlip_CreateSprite_Main(work->spriteRenderer, work->spriteGfxHandler, 0xe0, 0x80, 16, 3);
    work->sprites[VF_SPRITE_10] = VoltorbFlip_CreateSprite_Main(work->spriteRenderer, work->spriteGfxHandler, 0xc8, 0x50, 18, 1);
    work->sprites[VF_SPRITE_11] = VoltorbFlip_CreateSprite_Sub(work->spriteRenderer, work->spriteGfxHandler, 0x48, 0x38, 0, 0);
    work->sprites[VF_SPRITE_12] = VoltorbFlip_CreateSprite_Sub(work->spriteRenderer, work->spriteGfxHandler, 0x88, 0x28, 0, 0);

    VoltorbFlip_Sprite_SetAnimCtrlTime(work->sprites[VF_SPRITE_12]->sprite, FX32_CONST(32));

    ManagedSprite_SetDrawFlag(work->sprites[VF_SPRITE_02], TRUE);
    ManagedSprite_SetDrawFlag(work->sprites[VF_SPRITE_03], TRUE);
    ManagedSprite_SetPriority(work->sprites[VF_SPRITE_FLIPPING_CARD], 1);
    ManagedSprite_SetPaletteOverride(work->sprites[VF_SPRITE_10], 4);
}

static void VoltorbFlip_DeleteSprites(VoltorbFlipAppData *work) {
    for (int i = 0; i < 13; i++) {
        Sprite_DeleteAndFreeResources(work->sprites[i]);
    }
}

static void VoltorbFlip_Sprite_SetAnimCtrlTime(Sprite *sprite, fx32 animCtrlTime) {
    NNSG2dCellAnimation *ptr = Sprite_GetCellAnim(sprite);
    ptr->animCtrl.currentTime = animCtrlTime;
}

static BOOL ov122_021E7F70(VoltorbFlipAppData *work) {
    return !ManagedSprite_IsAnimated(work->sprites[VF_SPRITE_03]) && !ManagedSprite_IsAnimated(work->sprites[VF_SPRITE_02]) && !ManagedSprite_IsAnimated(work->sprites[VF_SPRITE_MEMO_CURSOR]);
}

static CardType VoltorbFlip_GetSelectedCardType(VoltorbFlipAppData *work) {
    return VoltorbFlipGameState_GetCardType(work->game, VoltorbFlipInputHandler_GetCursorPos(work->inputHandler));
}

static int MemoFlagToIdx(int memoFlag) {
    switch (memoFlag) {
    case MEMO_VOLTORB:
        return 0;
    case MEMO_ONE:
        return 1;
    case MEMO_TWO:
        return 2;
    case MEMO_THREE:
        return 3;
    default:
        GF_ASSERT(FALSE);
        GF_ASSERT(FALSE);
        return 0;
    }
}

static void VoltorbFlip_VBlankIntr(void *data) {
    VoltorbFlipAppData *work = data;
    GF_ASSERT(work != NULL);
    GF_ASSERT(work->spriteGfxHandler != NULL);

    SpriteSystem_DrawSprites(work->spriteGfxHandler);
    SpriteSystem_TransferOam();
    DoScheduledBgGpuUpdates(work->bgConfig);

    OS_SetIrqCheckFlag(OS_IE_V_BLANK);
}

static void SetGXBanks(void) {
    GraphicsBanks banks = sVoltorbFlipGraphicsBanks;
    GfGfx_SetBanks(&banks);
}

static void VF_RenderingOff(void) {
    HBlankInterruptDisable();
    GfGfx_DisableEngineAPlanes();
    GfGfx_DisableEngineBPlanes();

    GX_SetVisiblePlane(0);
    GXS_SetVisiblePlane(0);
}

static void ov122_021E8094(OverlayManager *man) {
    VoltorbFlipArgs *args = OverlayManager_GetArgs(man);
    GF_ASSERT(args != NULL);

    Main_SetVBlankIntrCB(NULL, NULL);
    GX_SetDispSelect(GX_DISP_SELECT_SUB_MAIN);

    VF_RenderingOff();
    SetGXBanks();

    Heap_Create(HEAP_ID_3, HEAP_ID_VOLTORB_FLIP, 0x50000);

    VoltorbFlipAppData *work = OverlayManager_CreateAndGetData(man, sizeof(VoltorbFlipAppData), HEAP_ID_VOLTORB_FLIP);
    MI_CpuFill8(work, 0, sizeof(VoltorbFlipAppData));
    work->heapID = HEAP_ID_VOLTORB_FLIP;
    work->options = args->options;
    work->coins = args->coins;
    work->menuInputStatePtr = args->menuInputStatePtr;
    work->profile = args->profile;
    work->menuInputState = MenuInputStateMgr_GetState(work->menuInputStatePtr);
    work->unk229 = Options_GetFrame(work->options);
    work->unk22A = Options_GetTextFrameDelay(work->options);

    work->narc = NARC_New(NARC_application_voltorb_flip, work->heapID);
    work->msgData = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, NARC_msg_msg_0039_bin, work->heapID);
    work->msgFmt = MessageFormat_New(work->heapID);
    work->yesNoPrompt = YesNoPrompt_Create(work->heapID);

    VoltorbFlip_InitBgs(work);
    VoltorbFlip_LoadBgGfx(work);
    VoltorbFlip_AddWindows(work);
    VoltorbFlip_CreateListMenuSpawnerAndItems(work);
    ov122_021E6B38(work);

    u16 coins = (u32)Coins_GetValue(work->coins);
    VoltorbFlip_PrintCoins(work, COIN_DISPLAY_TOTAL, coins);
    VoltorbFlip_CreateSpriteSystem(work);
    VoltorbFlip_LoadObjectGfx(work);
    VoltorbFlip_CreateSprites(work);

    work->workflow = VoltorbFlipTaskEngine_Create(work->heapID, (VoltorbFlipTasks *)&sVoltorbFlipWorkflows, NELEMS(sVoltorbFlipWorkflows), work);
    work->inputHandler = VoltorbFlipInputHandler_Create(work->heapID, work->sprites[VF_SPRITE_00], work->sprites[VF_SPRITE_10]);
    work->game = VoltorbFlip_CreateGameState(work->heapID);
    VoltorbFlip_PrintBoardVoltorbsAndPoints(work);

    Sound_SetSceneAndPlayBGM(0x46, 0, 0);
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_OBJ, GF_PLANE_TOGGLE_ON);
    GfGfx_EngineBTogglePlanes(GX_PLANEMASK_OBJ, GF_PLANE_TOGGLE_ON);
    sub_0200FBDC(0);
    sub_0200FBDC(1);
    TextFlags_SetCanABSpeedUpPrint(TRUE);
    TextFlags_SetCanTouchSpeedUpPrint(TRUE);

    Main_SetVBlankIntrCB(VoltorbFlip_VBlankIntr, work);
    GameStats_AddScore(Save_GameStats_Get(args->saveData), SCORE_EVENT_6);
}

static void FreeOverlayData(OverlayManager *man) {
    VoltorbFlipAppData *work = OverlayManager_GetData(man);
    Main_SetVBlankIntrCB(NULL, NULL);
    VoltorbFlip_FreeGameState(work->game);
    VoltorbFlipInputHandler_Free(work->inputHandler);
    VoltorbFlipTaskEngine_Free(work->workflow);
    VoltorbFlip_FreeSpriteSystem(work);

    YesNoPrompt_Destroy(work->yesNoPrompt);
    VoltorbFlip_DestroyListMenuSpawnerAndItems(work);
    VoltorbFlip_RemoveWindows(work);
    VoltorbFlip_UnloadBgs(work);

    MessageFormat_Delete(work->msgFmt);
    DestroyMsgData(work->msgData);
    NARC_Delete(work->narc);
    VF_RenderingOff();
    OverlayManager_FreeData(man);
    Heap_Destroy(HEAP_ID_VOLTORB_FLIP);
}

BOOL VoltorbFlip_Init(OverlayManager *man, int *state) {
    switch (*state) {
    case 0:
        ov122_021E8094(man);
        *state += 1;
        break;
    case 1: {
        VoltorbFlipAppData *work = OverlayManager_GetData(man);
        BeginNormalPaletteFade(0, 0x15, 0x15, RGB_BLACK, 6, 1, work->heapID);
        *state += 1;
        break;
    }
    case 2:
        if (IsPaletteFadeFinished() != 0) {
            return TRUE;
        }
        break;
    default:
        GF_ASSERT(FALSE);
    }
    return FALSE;
}

BOOL VoltorbFlip_Exit(OverlayManager *man, int *state) {
    VoltorbFlipAppData *work = OverlayManager_GetData(man);
    switch (*state) {
    case 0:
        BeginNormalPaletteFade(0, 0x14, 0x14, RGB_BLACK, 6, 1, work->heapID);
        *state += 1;
        break;
    case 1:
        if (IsPaletteFadeFinished() != 0) {
            FreeOverlayData(man);
            return TRUE;
        }
        break;
    default:
        GF_ASSERT(FALSE);
        break;
    }
    return FALSE;
}

BOOL VoltorbFlip_Main(OverlayManager *man, int *state) {
    VoltorbFlipAppData *work = OverlayManager_GetData(man);
    if (VoltorbFlipTaskEngine_Run(work->workflow)) {
        return TRUE;
    }
    return FALSE;
}
