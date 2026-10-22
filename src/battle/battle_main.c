#include "constants/game_stats.h"

#include "battle/battle_022378C0.h"
#include "battle/battle_input.h"
#include "battle/battle_system.h"

#include "filesystem_files_def.h"
#include "gf_gfx_planes.h"
#include "poke_overlay.h"
#include "render_text.h"
#include "sound_02004A44.h"
#include "system.h"
#include "unk_02026E84.h"
#include "unk_020379A0.h"
#include "unk_02037C94.h"
#include "unk_020755E8.h"
#include "unk_0208805C.h"
#include "vram_transfer_manager.h"

FS_EXTERN_OVERLAY(OVY_5);
FS_EXTERN_OVERLAY(OVY_6);
FS_EXTERN_OVERLAY(OVY_7);
FS_EXTERN_OVERLAY(OVY_8);
FS_EXTERN_OVERLAY(OVY_10);
FS_EXTERN_OVERLAY(OVY_18);
// static
void ov12_022387AC(BattleSystem *battleSys, BgConfig *bgConfig);
// static
void ov12_022389B8(BattleSystem *battleSys);
// static
void ov12_02238A30(BgConfig *bgConfig);
// static
void ov12_02238A64(BattleSystem *battleSystem);
// static
BOOL ov12_022395BC(u16 trainerClass);
// static
void ov12_022396E8(GF3DVramMan *pipelineBuffers);
// static
void ov12_02239730(void *inBattleSys);
// static
void ov12_022396F0(void);
// static
void ov12_0223A664(BattleSystem *battleSys, BattleSetup *dto);
// static
void ov12_0223A7A0(void);

typedef enum BattleState {
    BSTATE_INIT,
    BSTATE_LINK_INIT,
    BSTATE_LINK_MAIN,
    BSTATE_UNK_A_INIT,
    BSTATE_UNK_A_MAIN,
    BSTATE_UNK_B_INIT,
    BSTATE_UNK_B_MAIN,
    BSTATE_SYNC,
    BSTATE_BATTLE_INIT,
    BSTATE_BATTLE_MAIN,
    BSTATE_END_INIT,
    BSTATE_END_MAIN,
    BSTATE_END_WAIT,
    BSTATE_EVOLUTION_INIT,
    BSTATE_EVOLUTION_MAIN,
    BSTATE_EXIT
} BattleState;

BOOL Battle_Run(OverlayManager *man, int *state) {
    BattleSetup *setup = OverlayManager_GetArgs(man);

    switch (*state) {
    case BSTATE_INIT:
        Heap_Create(HEAP_ID_3, HEAP_ID_BATTLE, 0xB0000);
        if ((setup->battleType & BATTLE_TYPE_LINK) && !(setup->battleSpecial & BATTLE_SPECIAL_RECORDING)) {
            *state = BSTATE_LINK_INIT;
        } else {
            *state = BSTATE_UNK_A_INIT;
        }
        break;
    case BSTATE_LINK_INIT:
        ov12_022399D4(man, setup);
        sub_02039F68(setup->wifiHistory);
        if (!sub_02039998()) {
            GameStats_Inc(setup->gameStats, GAME_STAT_LOCAL_LINK_BATTLES);
            if (setup->battleType != 0x8F) {
                sub_02005BEC(1);
            }
        } else {
            GameStats_Inc(setup->gameStats, GAME_STAT_WIFI_BATTLES);
        }
        *state = BSTATE_LINK_MAIN;
        break;
    case BSTATE_LINK_MAIN:
        if (ov12_02239C28(man) == TRUE) {
            ov12_0223A088(man);
            *state = BSTATE_UNK_A_INIT;
        }
        break;
    case BSTATE_UNK_A_INIT:
        if (ov12_0223A0D4(man) == TRUE) {
            *state = BSTATE_UNK_A_MAIN;
        } else {
            *state = BSTATE_UNK_B_INIT;
        }
        break;
    case BSTATE_UNK_A_MAIN:
        if (ov12_0223A218(man) == TRUE) {
            *state = BSTATE_UNK_B_INIT;
        }
        break;
    case BSTATE_UNK_B_INIT:
        if (ov12_0223A260(man) == TRUE) {
            *state = BSTATE_UNK_B_MAIN;
        } else {
            *state = BSTATE_BATTLE_INIT;
        }
        break;
    case BSTATE_UNK_B_MAIN:
        if (ov12_0223A3A8(man) == TRUE) {
            UnloadOverlayByID(FS_OVERLAY_ID(OVY_5));
            *state = BSTATE_SYNC;
            sub_02037AC0(0x3D);
        }
        break;
    case BSTATE_SYNC:
        if (sub_02037B38(0x3D)) {
            *state = BSTATE_BATTLE_INIT;
        }
        break;
    case BSTATE_BATTLE_INIT:
        HandleLoadOverlay(FS_OVERLAY_ID(OVY_6), OVY_LOAD_ASYNC);
        HandleLoadOverlay(FS_OVERLAY_ID(OVY_7), OVY_LOAD_ASYNC);
        ov12_02237F18(man);
        *state = BSTATE_BATTLE_MAIN;
        break;
    case BSTATE_BATTLE_MAIN:
        if (ov12_02238358(man) == TRUE) {
            ov12_0223843C(man);
            sub_02005BEC(0);
            *state = BSTATE_END_INIT;
        }
        break;
    case BSTATE_END_INIT:
        if (ov12_0223A3F0(man) == TRUE) {
            *state = BSTATE_END_MAIN;
        } else {
            Heap_Destroy(HEAP_ID_BATTLE);
            *state = BSTATE_EVOLUTION_INIT;
        }
        break;
    case BSTATE_END_MAIN:
        if (ov12_0223A5E4(man) == TRUE) {
            UnloadOverlayByID(FS_OVERLAY_ID(OVY_5));
            Heap_Destroy(HEAP_ID_BATTLE);
            *state = BSTATE_END_WAIT;
        }
        break;
    case BSTATE_END_WAIT:
        *state = BSTATE_EXIT;
        break;
    case BSTATE_EVOLUTION_INIT: {
        int selectedMonIndex;
        int evolutionSpecies;
        int evolutionCondition;
        Pokemon *mon;

        evolutionSpecies = BattleSystem_CheckEvolution(setup, &selectedMonIndex, &evolutionCondition);

        if (evolutionSpecies) {
            Heap_Create(HEAP_ID_3, HEAP_ID_EVOLUTION, 0x30000);
            mon = Party_GetMonByIndex(setup->party[BATTLER_PLAYER], selectedMonIndex);
            setup->evolutionTaskData = sub_02075A7C(setup->party[BATTLER_PLAYER], mon, evolutionSpecies, setup->options, setup->unk_164, setup->pokedex, setup->bag, setup->gameStats, evolutionCondition, 3, HEAP_ID_EVOLUTION);
            *state = BSTATE_EVOLUTION_MAIN;
        } else {
            *state = BSTATE_EXIT;
        }
        break;
    }
    case BSTATE_EVOLUTION_MAIN: {
        void *data = setup->evolutionTaskData;
        if (sub_02075D3C(data) == TRUE) {
            sub_02075D4C(data);
            Heap_Destroy(HEAP_ID_EVOLUTION);
            *state = BSTATE_EVOLUTION_INIT;
        }
        break;
    }
    case BSTATE_EXIT:
        return TRUE;
    }
    return FALSE;
}

void BattleSystem_EnterSubMenu(BattleSystem *battleSystem) {
    BattleInput_Free(battleSystem->battleInput);
    BgConfig_CleanupBattleMenuBackgrounds(battleSystem->bgConfig);
    battleSystem->unk240E_F = 1;
    FontID_Release(4);
    BattleSystem_SetRenderMode(battleSystem, 3);

    if (battleSystem->unk2445 == 0) {
        UnloadOverlayByID(FS_OVERLAY_ID(OVY_7));
    } else {
        UnloadOverlayByID(FS_OVERLAY_ID(OVY_10));
    }
    HandleLoadOverlay(FS_OVERLAY_ID(OVY_8), OVY_LOAD_ASYNC);
}

void BattleSystem_FreeGraphics(BattleSystem *battleSystem) {
    Main_SetVBlankIntrCB(NULL, NULL);
    BattleInput_Free(battleSystem->battleInput);
    RemoveWindow(battleSystem->window);
    ov12_02238A30(battleSystem->bgConfig);
    ov12_02238A64(battleSystem);
    SpriteSystem_FreeResourcesAndManager(battleSystem->spriteRenderer, battleSystem->gfxHandler);
    SpriteSystem_Free(battleSystem->spriteRenderer);
    GF_DestroyVramTransferManager();
    FontID_Release(4);
}

void BattleSystem_ExitSubMenu(BattleSystem *battleSystem) {
    UnloadOverlayByID(FS_OVERLAY_ID(OVY_8));

    if (battleSystem->unk2445 == 0) {
        HandleLoadOverlay(FS_OVERLAY_ID(OVY_7), OVY_LOAD_ASYNC);
    } else {
        HandleLoadOverlay(FS_OVERLAY_ID(OVY_10), OVY_LOAD_ASYNC);
    }

    BattleSystem_SetRenderMode(battleSystem, 0);

    int size = sub_02026E9C();
    void *data = GetSubBgPlttAddr();
    MI_CpuClear16(data, size);

    NARC *unkNarcA = NARC_New(NARC_a_0_0_7, HEAP_ID_BATTLE);
    NARC *unkNarcB = NARC_New(NARC_a_0_0_8, HEAP_ID_BATTLE);

    battleSystem->battleInput = BattleInput_NewInit(unkNarcA, unkNarcB, battleSystem, BattleSystem_GetTrainerGender(battleSystem, ov12_0223BFC0(battleSystem)), battleSystem->unk1C0);

    FontID_Alloc(4, HEAP_ID_BATTLE);

    battleSystem->unk240F_1 = 1;

    BgConfig_InitBattleMenuBackgrounds(battleSystem->bgConfig);
    GfGfx_EngineBTogglePlanes(GX_PLANEMASK_OBJ, GF_PLANE_TOGGLE_ON);
    BattleInput_LoadDefaultResources(battleSystem->battleInput);
    BattleInput_ChangeMenu(unkNarcA, unkNarcB, battleSystem->battleInput, 0, TRUE, NULL);
    BattleInput_LoadBallGaugeResources(unkNarcB, battleSystem->battleInput);

    NARC_Delete(unkNarcA);
    NARC_Delete(unkNarcB);

    TextPrinter_SetDownArrowBaseTile(1);
    ov12_0223A620(battleSystem);

    G2dRenderer_SetSubSurfaceCoords(SpriteSystem_GetRenderer(battleSystem->spriteRenderer), 0, FX32_CONST(272));
}

void BattleSystem_HideBattleScreen(BattleSystem *battleSystem) {
    RemoveWindow(battleSystem->window);

    GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG0, GF_PLANE_TOGGLE_OFF);
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG1, GF_PLANE_TOGGLE_OFF);
    FreeBgTilemapBuffer(battleSystem->bgConfig, GF_BG_LYR_MAIN_1);
    FreeBgTilemapBuffer(battleSystem->bgConfig, GF_BG_LYR_MAIN_2);
    FreeBgTilemapBuffer(battleSystem->bgConfig, GF_BG_LYR_MAIN_3);
    BattleSystem_SetHpBarDisabled(battleSystem);
}

extern BgTemplate ov12_0226C120[3];
void ov12_02237D00(BattleSystem *battleSys) {
    battleSys->unk240F_0 = 1;

    BgTemplate bgTemplates[3];

    bgTemplates = ov12_0226C120;

    InitBgFromTemplate(battleSys->bgConfig, 1, &bgTemplates[0], 0);
    BgClearTilemapBufferAndCommit(battleSys->bgConfig, 1);
    InitBgFromTemplate(battleSys->bgConfig, 2, &bgTemplates[1], 0);
    BgClearTilemapBufferAndCommit(battleSys->bgConfig, 2);
    InitBgFromTemplate(battleSys->bgConfig, 3, &bgTemplates[2], 0);
    BgClearTilemapBufferAndCommit(battleSys->bgConfig, 3);

    G2_SetBG0Priority(1);
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG0, TRUE);

    int frame = BattleSystem_GetFrame(battleSys);

    sub_0200EB80(battleSys->bgConfig, 1, 1, 10, (u8)frame, HEAP_ID_BATTLE);
    GfGfxLoader_LoadCharData(7, 3 + battleSys->backgroundId, battleSys->bgConfig, 3, 0, 0, 1, HEAP_ID_BATTLE);
    PaletteData_LoadNarc(battleSys->palette, 7, 176 + battleSys->backgroundId * 3 + ov12_0223B52C(battleSys), HEAP_ID_BATTLE, PLTTBUF_MAIN_BG, 0, 0);
    PaletteData_LoadNarc(battleSys->palette, 0x26, sub_0200E640(frame), HEAP_ID_BATTLE, PLTTBUF_MAIN_BG, 0x20, 0xA0);
    PaletteData_LoadNarc(battleSys->palette, 16, 8, HEAP_ID_BATTLE, PLTTBUF_MAIN_BG, 0x20, 0xB0);
    GfGfxLoader_LoadScrnData(7, 2, battleSys->bgConfig, 3, 0, 0, 1, HEAP_ID_BATTLE);

    GX_SetVisibleWnd(GX_WNDMASK_NONE);
    GXS_SetVisibleWnd(GX_WNDMASK_NONE);
    G2_SetWnd0InsidePlane(GX_WND_PLANEMASK_NONE, 0);
    G2_SetWndOutsidePlane(GX_WND_PLANEMASK_NONE, 0);

    GfGfx_BothDispOn();

    GfGfx_EngineATogglePlanes(GX_PLANEMASK_OBJ, TRUE);
    GfGfx_EngineBTogglePlanes(GX_PLANEMASK_OBJ, TRUE);
    Main_SetVBlankIntrCB(ov12_02239730, battleSys);

    battleSys->unk240F_1 = 1;

    AddWindowParameterized(battleSys->bgConfig, battleSys->window, 1, 2, 19, 27, 4, 11, (18 + 12) + 1);
    FillWindowPixelBuffer(battleSys->window, 0xFF);
    DrawFrameAndWindow2(&battleSys->window[0], 0, 1, 10);

    ov12_0223A620(battleSys);
}

void ov12_02237ED0(BattleSystem *battleSys, int flags) {
    GF_ASSERT(battleSys->unk2445 != flags);

    battleSys->unk2445 = flags;

    if (flags == FALSE) {
        UnloadOverlayByID(FS_OVERLAY_ID(OVY_10));
        HandleLoadOverlay(FS_OVERLAY_ID(OVY_7), 2);
    } else {
        UnloadOverlayByID(FS_OVERLAY_ID(OVY_7));
        HandleLoadOverlay(FS_OVERLAY_ID(OVY_10), 2);
    }
}

// static
GF3DVramMan *ov12_02239644();
extern const int ov12_0226C1C8[][3];
void ov12_02239810(SysTask *task, void *inBattleSys);
void ov12_02239854(SysTask *, void *);
void ov12_0223998C(SysTask *, void *);
extern OamManagerParam ov12_0226C060;
extern OamCharTransferParam ov12_0226C018;
extern SpriteResourceCountsListUnion ov12_0226C02C;

// static
void ov12_02237F18(OverlayManager *appMan) {
    BattleSystem *battleSys = OverlayManager_GetData(appMan);
    BattleSetup *dto = OverlayManager_GetArgs(appMan);
    int idx;

    MI_CpuFill16((void *)GetMainBgPlttAddr(), 0, sub_02026E8C());
    MI_CpuFill16((void *)GetSubBgPlttAddr(), 0, sub_02026E9C());

    battleSys->unk0 = ov12_02239644();

    HBlankInterruptDisable();
    FontID_Alloc(4, HEAP_ID_BATTLE);

    battleSys->hpNumPrinter = (BattleNumberPrinter *)MessagePrinter_New(14, 2, 15, HEAP_ID_BATTLE);

    battleSys->levelNumPrinter = battleSys->hpNumPrinter;
    battleSys->palette = PaletteData_Init(HEAP_ID_BATTLE);

    PaletteData_SetAutoTransparent(battleSys->palette, TRUE);
    PaletteData_AllocBuffers(battleSys->palette, PLTTBUF_MAIN_BG, 32 * 16, HEAP_ID_BATTLE);
    PaletteData_AllocBuffers(battleSys->palette, PLTTBUF_SUB_BG, 32 * 16, HEAP_ID_BATTLE);
    PaletteData_AllocBuffers(battleSys->palette, PLTTBUF_MAIN_OBJ, 32 * 14, HEAP_ID_BATTLE);
    PaletteData_AllocBuffers(battleSys->palette, PLTTBUF_SUB_OBJ, 32 * 16, HEAP_ID_BATTLE);

    battleSys->bgConfig = BgConfig_Alloc(HEAP_ID_BATTLE);
    battleSys->window = AllocWindows(HEAP_ID_BATTLE, 3);

    for (idx = 0; idx < 4; idx++) {
        battleSys->unk1D0[idx].unk0 = Heap_Alloc(HEAP_ID_BATTLE, 32 * 10 * 10);
    }

    GF_CreateVramTransferManager(64, HEAP_ID_BATTLE);

    NARC *bgNarc = NARC_New(7, HEAP_ID_BATTLE);
    NARC *objNarc = NARC_New(8, HEAP_ID_BATTLE);

    battleSys->battleInput = BattleInput_NewInit(bgNarc, objNarc, battleSys, BattleSystem_GetTrainerGender(battleSys, ov12_0223BFC0(battleSys)), battleSys->unk1C0);

    NARC_Delete(bgNarc);
    NARC_Delete(objNarc);

    ov12_022387AC(battleSys, battleSys->bgConfig);

    AddWindowParameterized(battleSys->bgConfig, &battleSys->window[0], 1, 2, 0x13, 27, 4, 11, (18 + 12) + 1);
    FillWindowPixelBuffer(&battleSys->window[0], 0xFF);
    DrawFrameAndWindow2(&battleSys->window[0], 0, 1, 10);

    battleSys->spriteRenderer = SpriteSystem_Alloc(HEAP_ID_BATTLE);

    SpriteSystem_Init(battleSys->spriteRenderer, &ov12_0226C060, &ov12_0226C018, 16 + 16);
    G2dRenderer_SetObjCharTransferReservedRegion(NNS_G2D_VRAM_TYPE_2DMAIN, GX_OBJVRAMMODE_CHAR_1D_64K);
    G2dRenderer_SetPlttTransferReservedRegion(NNS_G2D_VRAM_TYPE_2DMAIN);

    battleSys->gfxHandler = SpriteManager_New(battleSys->spriteRenderer);

    SpriteSystem_InitSprites(battleSys->spriteRenderer, battleSys->gfxHandler, 64 + 64);
    SpriteSystem_InitManagerWithCapacities(battleSys->spriteRenderer, battleSys->gfxHandler, &ov12_0226C02C);
    G2dRenderer_SetSubSurfaceCoords(SpriteSystem_GetRenderer(battleSys->spriteRenderer), 0, (192 + 80) << FX32_SHIFT);

    BattleInput_LoadDefaultResources(battleSys->battleInput);

    NARC *bgNarc2 = NARC_New(7, HEAP_ID_BATTLE);
    NARC *objNarc2 = NARC_New(8, HEAP_ID_BATTLE);

    BattleInput_ChangeMenu(bgNarc2, objNarc2, battleSys->battleInput, 0, 1, NULL);
    BattleInput_LoadBallGaugeResources(objNarc2, battleSys->battleInput);

    NARC_Delete(bgNarc2);
    NARC_Delete(objNarc2);

    battleSys->pokepicManager = PokepicManager_Create(HEAP_ID_BATTLE);
    PokepicManager_SetPlttBaseAddrAndSize(battleSys->pokepicManager, 0, 32 * 6);

    BattleSystem_HpBar_Init(battleSys);
    ov12_022396F0();

    battleSys->unk8C = ov07_0221BEDC(HEAP_ID_BATTLE);

    ov12_022389B8(battleSys);

    EnableTouchPad();
    InitializeTouchPad(4);

    battleSys->msgData = NewMsgDataFromNarc(1, 27, 0xc5, HEAP_ID_BATTLE);
    battleSys->unk10 = NewMsgDataFromNarc(1, 27, 3, HEAP_ID_BATTLE);
    battleSys->msgFormat = MessageFormat_New(HEAP_ID_BATTLE);
    battleSys->msgBuffer = String_New(2 * 160, HEAP_ID_BATTLE);

    MI_CpuCopy16(PaletteData_GetUnfadedBuf(battleSys->palette, 0), &battleSys->unk2228[0], 32 * 7);
    MI_CpuCopy16(PaletteData_GetUnfadedBuf(battleSys->palette, 2), &battleSys->unk2308[0], 32 * 7);

    int offset = ov12_0223B52C(battleSys);

    PaletteData_FillPaletteInBuffer(battleSys->palette, PLTTBUF_MAIN_BG, PLTTSEL_BOTH, ov12_0226C1C8[battleSys->backgroundId][offset], 0, 112);
    PaletteData_FillPaletteInBuffer(battleSys->palette, PLTTBUF_MAIN_BG, PLTTSEL_BOTH, ov12_0226C1C8[battleSys->backgroundId][offset], 0xC * 16, 0xC * 16 + 4 * 16);
    PaletteData_FillPaletteInBuffer(battleSys->palette, PLTTBUF_MAIN_OBJ, PLTTSEL_BOTH, ov12_0226C1C8[battleSys->backgroundId][offset], 0, ((16 - 2) * 16) - 1);

    PaletteData_FillPaletteInBuffer(battleSys->palette, PLTTBUF_MAIN_BG, 0, 0, 10 * 16, 10 * 16 + 2 * 16);
    PaletteData_FillPaletteInBuffer(battleSys->palette, PLTTBUF_SUB_BG, 0, 0, 0, 255);
    PaletteData_FillPaletteInBuffer(battleSys->palette, PLTTBUF_SUB_OBJ, 0, 0xFFFF, 0, 255);

    battleSys->msgIcon = sub_020163E0(battleSys->palette, 0, 11, HEAP_ID_BATTLE);
    sub_0201649C(battleSys->msgIcon, 1);

    battleSys->unk1C = SysTask_CreateOnMainQueue(ov12_02239810, battleSys, 60000);
    battleSys->unk20 = SysTask_CreateOnMainQueue(ov12_02239854, battleSys, 50000);
    battleSys->unk24 = SysTask_CreateOnVBlankQueue(ov12_0223998C, battleSys, 1200);
    battleSys->unk2438 = -51;

    ov12_0223A620(battleSys);
    BagCursor_Battle_Init(BattleSystem_GetBagCursor(battleSys));

    battleSys->unk1C8 = sub_02016EDC(HEAP_ID_BATTLE, 4, FALSE);
    battleSys->unk1CC = sub_02020654(4, HEAP_ID_BATTLE);

    if (battleSys->battleSpecial & 0x10) {
        for (idx = 0; idx < 4; idx++) {
            battleSys->chatotVoiceParam[idx] = dto->unk1BC[idx];
        }
    }
}

// static
int ov12_02238358(OverlayManager *appMan) {
    BattleSystem *battleSys = OverlayManager_GetData(appMan);
    int battler;

    if (battleSys->battleType & BATTLE_TYPE_LINK && (battleSys->battleSpecial & 0x10) == FALSE) {
        if (battleSys->unk23FC) {
            BattleContext_Main(battleSys, battleSys->ctx);
        }

        for (battler = 0; battler < battleSys->maxBattlers; battler++) {
            BattleSystem_ExecuteBattlerCommand(battleSys, battleSys->opponentData[battler]);
        }
    } else {
        if (battleSys->unk23FC) {
            battleSys->unk23FE = BattleContext_Main(battleSys, battleSys->ctx);
            BattleSystem_TryRecvMessage(battleSys, 1);
        }

        for (battler = 0; battler < battleSys->maxBattlers; battler++) {
            BattleSystem_ExecuteBattlerCommand(battleSys, battleSys->opponentData[battler]);
            BattleSystem_TryRecvMessage(battleSys, 0);
        }

        if (battleSys->unk23FE == FALSE) {
            if (battleSys->unk23FC) {
                battleSys->unk23FE = BattleContext_Main(battleSys, battleSys->ctx);
                BattleSystem_TryRecvMessage(battleSys, 1);
            }

            for (battler = 0; battler < battleSys->maxBattlers; battler++) {
                BattleSystem_ExecuteBattlerCommand(battleSys, battleSys->opponentData[battler]);
                BattleSystem_TryRecvMessage(battleSys, 0);
            }
        }
    }

    return battleSys->unk23FE;
}

// static
void ov12_0223843C(OverlayManager *appMan) {
    BattleSystem *battleSys = OverlayManager_GetData(appMan);
    BattleSetup *dto = OverlayManager_GetArgs(appMan);
    int battlerId;

    dto->unk_19C = battleSys->randTemp;
    dto->battleSpecial = battleSys->battleSpecial;

    if ((battleSys->battleSpecial & 0x10) == FALSE) {
        sub_020302A4(dto);
    }

    if (battleSys->unk2445 != FALSE) {
        ov12_02237ED0(battleSys, FALSE);
    }

    int color;

    if (dto->battleType & 0xAA4) {
        color = RGB_BLACK;
    } else if (battleSys->battleOutcomeFlag == 2 || battleSys->battleOutcomeFlag == 3) {
        color = RGB_WHITE;
    } else {
        color = RGB_BLACK;
    }

    sub_0200FBF4(0, color);
    sub_0200FBF4(1, color);
    BattleSystem_TryChangeForm(battleSys);

    if (battleSys->battleOutcomeFlag != BATTLE_RESULT_CAPTURED_MON) {
        ov12_0223B870(battleSys, Party_GetMonByIndex(battleSys->trainerParty[1], 0));
    }

    for (battlerId = 0; battlerId < 4; battlerId++) {
        Party_Copy(battleSys->trainerParty[battlerId], dto->party[battlerId]);
        Heap_Free(battleSys->trainerParty[battlerId]);
        PlayerProfile_Copy(battleSys->playerProfile[battlerId], dto->profile[battlerId]);
        Heap_Free(battleSys->playerProfile[battlerId]);
    }

    sub_020164C4(battleSys->msgIcon);
    Save_Bag_Copy(battleSys->bag, dto->bag);
    Heap_Free(battleSys->bag);
    Pokedex_Copy(battleSys->pokedex, dto->pokedex);
    Heap_Free(battleSys->pokedex);
    dto->storagePC = battleSys->storage;
    dto->bagCursor = battleSys->bagCursor;
    dto->unk1B8 = battleSys->unk1C0;
    dto->unk_128 = battleSys->unk98;
    dto->captureAttempt = battleSys->unk9C;
    dto->safariBalls = battleSys->safariBallCnt;
    dto->winFlag = battleSys->battleOutcomeFlag & (0xC0 ^ 0xFF);
    dto->unk_170 = battleSys->battlerIdCaught;
    dto->levelUpFlag = ov12_022581D4(battleSys, battleSys->ctx, 4, NULL);
    dto->unk138.unk_0 += ov12_022581D4(battleSys, battleSys->ctx, 3, NULL);
    dto->unk138.unk_4 += ov12_022581D4(battleSys, battleSys->ctx, 6, 0) + ov12_022581D4(battleSys, battleSys->ctx, 6, 2);
    dto->unk138.unk_8 += ov12_022581D4(battleSys, battleSys->ctx, 7, 0) + ov12_022581D4(battleSys, battleSys->ctx, 7, 2);
    dto->unk1B4 = ov12_022581D4(battleSys, battleSys->ctx, 3, NULL);
    dto->unk1C4 = battleSys->isRecordingPaused;

    for (battlerId = 0; battlerId < 4; battlerId++) {
        Heap_Free(battleSys->unk1D0[battlerId].unk0);
    }

    Heap_Free(battleSys->msgBuffer);
    PaletteData_FreeBuffers(battleSys->palette, 0);
    PaletteData_FreeBuffers(battleSys->palette, 1);
    PaletteData_FreeBuffers(battleSys->palette, 2);
    PaletteData_FreeBuffers(battleSys->palette, 3);
    PaletteData_Free(battleSys->palette);
    DestroyMsgData(battleSys->msgData);
    DestroyMsgData(battleSys->unk10);
    MessageFormat_Delete(battleSys->msgFormat);
    sub_02016F2C(battleSys->unk1C8);
    sub_02014F84();

    ov07_0221BFE0(battleSys->unk8C);
    BattleContext_Delete(battleSys->ctx);

    for (battlerId = 0; battlerId < battleSys->maxBattlers; battlerId++) {
        OpponentData_Delete(battleSys, battleSys->opponentData[battlerId], battleSys->unk23FD);
    }

    PokepicManager_Delete(battleSys->pokepicManager);

    if (battleSys->unk23FD != 2) {
        BattleSystem_FreeGraphics(battleSys);
    }

    TextFlags_SetCanABSpeedUpPrint(FALSE);
    TextFlags_SetAutoScrollParam(0);
    TextFlags_SetCanTouchSpeedUpPrint(FALSE);
    WindowArray_Delete(battleSys->window, 3);
    Heap_Free(battleSys->bgConfig);
    Heap_Free(battleSys->unk220);
    Heap_Free(battleSys->unk224);
    MessagePrinter_Delete((MessagePrinter *)battleSys->hpNumPrinter);
    SysTask_Destroy(battleSys->unk1C);
    SysTask_Destroy(battleSys->unk20);
    DisableTouchPad();

    ov12_022396E8(battleSys->unk0);

    SetLCRNGSeed(battleSys->unk2434);

    if (BattleSystem_GetCriticalHpMusicFlag(battleSys)) {
        StopSE(0x704, 0);
    }

    sub_0202067C(battleSys->unk1CC);

    if (BattleSystem_IsRecordingPaused(battleSys)) {
        Sound_SetMasterVolume(127);
    }

    if (battleSys->unk247C) {
        ov12_0226BEF0(battleSys->unk247C);
    }

    Heap_Free(battleSys);
    UnloadOverlayByID(FS_OVERLAY_ID(OVY_6));
    UnloadOverlayByID(FS_OVERLAY_ID(OVY_7));

    if (!sub_02039998()) {
        UnloadOverlayByID(FS_OVERLAY_ID(OVY_18));
    }
}

extern GraphicsBanks ov12_0226C0A8;
extern GraphicsModes ov12_0226BFE8;
extern BgTemplate ov12_0226C174[3];
// static
void ov12_022387AC(BattleSystem *battleSys, BgConfig *bgConfig) {
    GfGfx_DisableEngineAPlanes();

    GraphicsBanks banks = ov12_0226C0A8;

    GfGfx_SetBanks(&banks);

    MI_CpuClear32((void *)HW_BG_VRAM, HW_BG_VRAM_SIZE);
    MI_CpuClear32((void *)HW_DB_BG_VRAM, HW_DB_BG_VRAM_SIZE);
    MI_CpuClear32((void *)HW_OBJ_VRAM, HW_OBJ_VRAM_SIZE);
    MI_CpuClear32((void *)HW_DB_OBJ_VRAM, HW_DB_OBJ_VRAM_SIZE);

    SetMasterBrightnessNeutral(0);
    SetMasterBrightnessNeutral(1);

    GraphicsModes graphicsModes = ov12_0226BFE8;

    SetBothScreensModesAndDisable(&graphicsModes);

    battleSys->unk240F_0 = 1;

    BgTemplate bgTemplates[3];
    bgTemplates = ov12_0226C174;

    InitBgFromTemplate(bgConfig, 1, &bgTemplates[0], 0);
    BgClearTilemapBufferAndCommit(bgConfig, 1);
    InitBgFromTemplate(bgConfig, 2, &bgTemplates[1], 0);
    BgClearTilemapBufferAndCommit(bgConfig, 2);
    InitBgFromTemplate(bgConfig, 3, &bgTemplates[2], 0);
    BgClearTilemapBufferAndCommit(bgConfig, 3);

    G2_SetBG0Priority(1);
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG0, TRUE);

    BgConfig_InitBattleMenuBackgrounds(bgConfig);

    int frame = BattleSystem_GetFrame(battleSys);

    sub_0200EB80(bgConfig, 1, 1, 10, (u8)frame, HEAP_ID_BATTLE);
    GfGfxLoader_LoadCharData(7, 3 + battleSys->backgroundId, bgConfig, 3, 0, 0, 1, HEAP_ID_BATTLE);
    PaletteData_LoadNarc(battleSys->palette, 7, 176 + battleSys->backgroundId * 3 + ov12_0223B52C(battleSys), HEAP_ID_BATTLE, PLTTBUF_MAIN_BG, 0, 0);
    PaletteData_LoadNarc(battleSys->palette, 38, sub_0200E640(frame), HEAP_ID_BATTLE, PLTTBUF_MAIN_BG, 32, 10 * 16);
    PaletteData_LoadNarc(battleSys->palette, 16, 8, HEAP_ID_BATTLE, PLTTBUF_MAIN_BG, 32, 11 * 16);
    GfGfxLoader_LoadScrnData(7, 2, bgConfig, 3, 0, 0, 1, HEAP_ID_BATTLE);

    GX_SetVisibleWnd(GX_WNDMASK_NONE);
    GXS_SetVisibleWnd(GX_WNDMASK_NONE);
    G2_SetWnd0InsidePlane(0, NULL);
    G2_SetWndOutsidePlane(0, NULL);

    GfGfx_BothDispOn();
    GfGfx_EngineATogglePlanes(16, TRUE);
    GfGfx_EngineBTogglePlanes(16, TRUE);
    Main_SetVBlankIntrCB(ov12_02239730, battleSys);
}

// static
void ov12_022389B8(BattleSystem *battleSys) {
    int terrain = BattleSystem_GetTerrainId(battleSys);
    int selectedPartySlot;
    Pokemon *mon;

    ov12_02265FD4(&battleSys->unk17C[0], battleSys, 0, terrain);
    ov12_02265FD4(&battleSys->unk17C[1], battleSys, 1, terrain);

    BattleContext *battleCtx = BattleSystem_GetBattleContext(battleSys);

    for (int battler = 0; battler < battleSys->maxBattlers; battler++) {
        selectedPartySlot = ov12_022581D4(battleSys, battleCtx, 2, battler);
        mon = BattleSystem_GetPartyMon(battleSys, battler, selectedPartySlot);
        ov12_02258DB0(battleSys, battleSys->opponentData[battler], BattleSystem_GetMonBall(battleSys, mon), selectedPartySlot);
    }

    ov12_0223A7A0();
}

// static
void ov12_02238A30(BgConfig *bgConfig) {
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG0, FALSE);
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG1, FALSE);
    FreeBgTilemapBuffer(bgConfig, 1);
    FreeBgTilemapBuffer(bgConfig, 2);
    FreeBgTilemapBuffer(bgConfig, 3);

    BgConfig_CleanupBattleMenuBackgrounds(bgConfig);
}

// static
void ov12_02238A64(BattleSystem *battleSystem) {
}

typedef struct BattlerInitData {
    u8 battler;
    u8 battlerType;
} BattlerInitData;

extern u8 _0226BFD8[2];
extern u8 ov12_0226C2DC[4];
extern u8 ov12_0226BFDC[2][2];
extern u8 ov12_0226BFE0[2][4];
extern u8 ov12_0226C008[4][4];

// static
void ov12_02238A68(BattleSystem *battleSys, BattleSetup *dto) {
    int i, slot;
    BattlerInitData battlerInitData;
    Pokemon *mon;

    battleSys->battleType = dto->battleType;

    for (i = 0; i < 4; i++) {
        battleSys->playerProfile[i] = PlayerProfile_New(HEAP_ID_BATTLE);
        PlayerProfile_Copy(dto->profile[i], battleSys->playerProfile[i]);
        battleSys->chatotVoice[i] = dto->chatot[i];
    }

    battleSys->unk2446 = dto->unk1B0;

    for (i = 0; i < 4; i++) {
        battleSys->unk2464[i] = dto->unk_1A0[i];
    }

    battleSys->unk2434 = GetLCRNGSeed();
    battleSys->rand = dto->unk_19C;
    battleSys->randTemp = dto->unk_19C;
    battleSys->battleSpecial = dto->battleSpecial;
    battleSys->bag = Save_Bag_New(HEAP_ID_BATTLE);

    Save_Bag_Copy(dto->bag, battleSys->bag);
    battleSys->pokedex = Pokedex_New(HEAP_ID_BATTLE);
    Pokedex_Copy(dto->pokedex, battleSys->pokedex);

    battleSys->storage = dto->storagePC;
    battleSys->options = dto->options;
    battleSys->unk1B8 = (u32 *)dto->palPad;
    battleSys->bagCursor = dto->bagCursor;
    battleSys->unk1C0 = dto->unk1B8;
    battleSys->unk98 = dto->unk_128;
    battleSys->unk2424 = dto->evolutionLocation;
    battleSys->unk9C = dto->captureAttempt;
    battleSys->safariBallCnt = dto->safariBalls;
    battleSys->terrain = dto->terrain;
    battleSys->backgroundId = dto->battleBg;
    battleSys->location = dto->mapSection;
    battleSys->timezone = (u32)dto->timeOfDay;
    battleSys->unk241C = dto->fixedDamaageMovesBanned;
    battleSys->unk2428 = dto->unk_164;
    battleSys->metBill = dto->metBill;
    battleSys->unk2474_1 = dto->momsSavingsActive;
    battleSys->isFishing = dto->unk_1D0;
    battleSys->weather = dto->weatherType;
    battleSys->gameStats = dto->gameStats;

    GF_ASSERT(dto->gameStats != NULL);

    battleSys->bugContestCaughtMon = dto->bugContestMon;

    for (i = 0; i < 4; i++) {
        battleSys->trainerId[i] = dto->trainerId[i];
        battleSys->trainers[i] = dto->trainer[i];
    }

    battleSys->ctx = BattleContext_New(battleSys);

    for (i = 0; i < 4; i++) {
        battleSys->trainerParty[i] = SaveArray_Party_Alloc(HEAP_ID_BATTLE);
        battleSys->unk248C[i] = dto->unk1CC[i];
    }

    int gender;

    for (i = 0; i < 4; i++) {
        for (slot = 0; slot < Party_GetCount(dto->party[i]); slot++) {
            mon = Party_GetMonByIndex(dto->party[i], slot);
            gender = GetMonGender(mon);
            SetMonData(mon, MON_DATA_GENDER, &gender);
        }
    }

    if (battleSys->battleType & BATTLE_TYPE_LINK) {
        sub_02074E5C(battleSys);
        u8 networkID = ov12_0223BFC0(battleSys);

        ov12_0223A664(battleSys, dto);

        if (battleSys->battleType & BATTLE_TYPE_FRONTIER) {
            for (i = 0; i < 4; i++) {
                battlerInitData.battler = i;
                battlerInitData.battlerType = ov12_0226C2DC[i];
                battleSys->opponentData[i] = ov12_02258D74(battleSys, &battlerInitData);
            }

            battleSys->maxBattlers = i;

            for (i = 0; i < 4; i++) {
                OpponentData_SetTaskFuncs(battleSys, battleSys->opponentData[i]);
                Party_Copy(dto->party[i], battleSys->trainerParty[i]);
            }

            for (i = 0; i < battleSys->maxBattlers; i++) {
                for (slot = 0; slot < Party_GetCount(battleSys->trainerParty[i]); slot++) {
                    mon = Party_GetMonByIndex(battleSys->trainerParty[i], slot);

                    if (GetMonData(mon, MON_DATA_SPECIES, NULL)
                        && GetMonData(mon, MON_DATA_IS_EGG, NULL) == FALSE
                        && GetMonData(mon, MON_DATA_HP, NULL)) {
                        break;
                    }
                }

                ov12_022582B8(battleSys, battleSys->ctx, 2, i, slot);
            }

            ov12_02256F28(battleSys, battleSys->ctx);
        } else if (battleSys->battleType & BATTLE_TYPE_MULTI) {
            for (i = 0; i < 4; i++) {
                battlerInitData.battler = i;
                battlerInitData.battlerType = ov12_0226C008[ov12_0223BFCC(battleSys, networkID)][ov12_0223BFCC(battleSys, i)];
                battleSys->opponentData[i] = ov12_02258D74(battleSys, &battlerInitData);
            }

            battleSys->maxBattlers = i;

            for (i = 0; i < 4; i++) {
                OpponentData_SetTaskFuncs(battleSys, battleSys->opponentData[i]);
                Party_Copy(dto->party[i], battleSys->trainerParty[i]);
            }

            for (i = 0; i < battleSys->maxBattlers; i++) {
                for (slot = 0; slot < Party_GetCount(battleSys->trainerParty[i]); slot++) {
                    mon = Party_GetMonByIndex(battleSys->trainerParty[i], slot);

                    if (GetMonData(mon, MON_DATA_SPECIES, NULL)
                        && GetMonData(mon, MON_DATA_IS_EGG, NULL) == FALSE
                        && GetMonData(mon, MON_DATA_HP, NULL)) {
                        break;
                    }
                }

                ov12_022582B8(battleSys, battleSys->ctx, 2, i, slot);
            }

            ov12_02256F28(battleSys, battleSys->ctx);
        } else if (battleSys->battleType & BATTLE_TYPE_DOUBLES) {
            for (i = 0; i < 4; i++) {
                battlerInitData.battler = i;
                battlerInitData.battlerType = ov12_0226BFE0[networkID][i];
                battleSys->opponentData[i] = ov12_02258D74(battleSys, &battlerInitData);
                OpponentData_SetTaskFuncs(battleSys, battleSys->opponentData[i]);
            }

            battleSys->maxBattlers = i;

            for (i = 0; i < 4; i++) {
                Party_Copy(dto->party[i], battleSys->trainerParty[i]);
            }

            for (i = 0; i < battleSys->maxBattlers; i++) {
                for (slot = 0; slot < Party_GetCount(battleSys->trainerParty[i & 1]); slot++) {
                    mon = Party_GetMonByIndex(battleSys->trainerParty[i & 1], slot);

                    if (i > 1) {
                        if ((ov12_022581D4(battleSys, battleSys->ctx, 2, i & 1) != slot)
                            && GetMonData(mon, MON_DATA_SPECIES, NULL)
                            && GetMonData(mon, MON_DATA_IS_EGG, NULL) == FALSE
                            && GetMonData(mon, MON_DATA_HP, NULL)) {
                            break;
                        }
                    } else {
                        if (GetMonData(mon, MON_DATA_SPECIES, NULL)
                            && GetMonData(mon, MON_DATA_IS_EGG, NULL) == FALSE
                            && GetMonData(mon, MON_DATA_HP, NULL)) {
                            break;
                        }
                    }
                }

                ov12_022582B8(battleSys, battleSys->ctx, 2, i, slot);
            }
        } else {
            for (i = 0; i < 2; i++) {
                battlerInitData.battler = i;
                battlerInitData.battlerType = ov12_0226BFDC[networkID][i];
                battleSys->opponentData[i] = ov12_02258D74(battleSys, &battlerInitData);
                OpponentData_SetTaskFuncs(battleSys, battleSys->opponentData[i]);
            }

            battleSys->maxBattlers = i;

            for (i = 0; i < 4; i++) {
                Party_Copy(dto->party[i], battleSys->trainerParty[i]);

                for (slot = 0; slot < Party_GetCount(battleSys->trainerParty[i]); slot++) {
                    mon = Party_GetMonByIndex(battleSys->trainerParty[i], slot);

                    if (GetMonData(mon, MON_DATA_SPECIES, NULL)
                        && GetMonData(mon, MON_DATA_IS_EGG, NULL) == FALSE
                        && GetMonData(mon, MON_DATA_HP, NULL)) {
                        break;
                    }
                }

                ov12_022582B8(battleSys, battleSys->ctx, 2, i, slot);
            }
        }
        ov12_02256F28(battleSys, battleSys->ctx);
    } else if (battleSys->battleType & BATTLE_TYPE_TAG) {
        int playerSlot;

        for (i = 0; i < 4; i++) {
            battlerInitData.battler = i;
            battlerInitData.battlerType = ov12_0226C2DC[i];
            battleSys->opponentData[i] = ov12_02258D74(battleSys, &battlerInitData);
            OpponentData_SetTaskFuncs(battleSys, battleSys->opponentData[i]);
        }

        battleSys->maxBattlers = i;

        for (i = 0; i < 4; i++) {
            Party_Copy(dto->party[i], battleSys->trainerParty[i]);
        }

        for (i = 0; i < battleSys->maxBattlers; i++) {
            for (slot = 0; slot < BattleSystem_GetPartySize(battleSys, i); slot++) {
                mon = BattleSystem_GetPartyMon(battleSys, i, slot);

                if (i == 2) {
                    if (GetMonData(mon, MON_DATA_SPECIES, NULL)
                        && GetMonData(mon, MON_DATA_IS_EGG, NULL) == FALSE
                        && GetMonData(mon, MON_DATA_HP, NULL)
                        && playerSlot != slot) {
                        break;
                    }
                } else {
                    if (GetMonData(mon, MON_DATA_SPECIES, NULL)
                        && GetMonData(mon, MON_DATA_IS_EGG, NULL) == FALSE
                        && GetMonData(mon, MON_DATA_HP, NULL)) {
                        break;
                    }
                }
            }

            ov12_022582B8(battleSys, battleSys->ctx, 2, i, slot);

            if (i == 0) {
                playerSlot = slot;
            }
        }
        ov12_02256F28(battleSys, battleSys->ctx);
        battleSys->unk23FC = 1;
    } else if (battleSys->battleType & BATTLE_TYPE_MULTI) {
        for (i = 0; i < 4; i++) {
            battlerInitData.battler = i;
            battlerInitData.battlerType = ov12_0226C2DC[i];
            battleSys->opponentData[i] = ov12_02258D74(battleSys, &battlerInitData);
            OpponentData_SetTaskFuncs(battleSys, battleSys->opponentData[i]);
        }

        battleSys->maxBattlers = i;

        for (i = 0; i < 4; i++) {
            Party_Copy(dto->party[i], battleSys->trainerParty[i]);
        }

        for (i = 0; i < battleSys->maxBattlers; i++) {
            for (slot = 0; slot < Party_GetCount(battleSys->trainerParty[i]); slot++) {
                mon = Party_GetMonByIndex(battleSys->trainerParty[i], slot);

                if (GetMonData(mon, MON_DATA_SPECIES, NULL)
                    && GetMonData(mon, MON_DATA_IS_EGG, NULL) == FALSE
                    && GetMonData(mon, MON_DATA_HP, NULL)) {
                    break;
                }
            }

            ov12_022582B8(battleSys, battleSys->ctx, 2, i, slot);
        }

        ov12_02256F28(battleSys, battleSys->ctx);
        battleSys->unk23FC = 1;
    } else if (battleSys->battleType & BATTLE_TYPE_DOUBLES) {
        for (i = 0; i < 4; i++) {
            battlerInitData.battler = i;
            battlerInitData.battlerType = ov12_0226C2DC[i];
            battleSys->opponentData[i] = ov12_02258D74(battleSys, &battlerInitData);
            OpponentData_SetTaskFuncs(battleSys, battleSys->opponentData[i]);
        }

        battleSys->maxBattlers = i;

        for (i = 0; i < 4; i++) {
            Party_Copy(dto->party[i], battleSys->trainerParty[i]);
        }

        for (i = 0; i < battleSys->maxBattlers; i++) {
            for (slot = 0; slot < Party_GetCount(battleSys->trainerParty[i & 1]); slot++) {
                mon = Party_GetMonByIndex(battleSys->trainerParty[i & 1], slot);

                if (i > 1) {
                    if (ov12_022581D4(battleSys, battleSys->ctx, 2, i & 1) != slot
                        && GetMonData(mon, MON_DATA_SPECIES, NULL)
                        && GetMonData(mon, MON_DATA_IS_EGG, NULL) == FALSE
                        && GetMonData(mon, MON_DATA_HP, NULL)) {
                        break;
                    }
                } else {
                    if (GetMonData(mon, MON_DATA_SPECIES, NULL)
                        && GetMonData(mon, MON_DATA_IS_EGG, NULL) == FALSE
                        && GetMonData(mon, MON_DATA_HP, NULL)) {
                        break;
                    }
                }
            }

            ov12_022582B8(battleSys, battleSys->ctx, 2, i, slot);
        }

        ov12_02256F28(battleSys, battleSys->ctx);
        battleSys->unk23FC = 1;
    } else {
        for (i = 0; i < 2; i++) {
            battlerInitData.battler = i;
            battlerInitData.battlerType = _0226BFD8[i];
            battleSys->opponentData[i] = ov12_02258D74(battleSys, &battlerInitData);
            OpponentData_SetTaskFuncs(battleSys, battleSys->opponentData[i]);
        }

        battleSys->maxBattlers = i;

        for (i = 0; i < 4; i++) {
            Party_Copy(dto->party[i], battleSys->trainerParty[i]);

            for (slot = 0; slot < Party_GetCount(battleSys->trainerParty[i]); slot++) {
                mon = Party_GetMonByIndex(battleSys->trainerParty[i], slot);

                if (GetMonData(mon, MON_DATA_SPECIES, NULL)
                    && GetMonData(mon, MON_DATA_IS_EGG, NULL) == FALSE
                    && GetMonData(mon, MON_DATA_HP, NULL)) {
                    break;
                }
            }

            ov12_022582B8(battleSys, battleSys->ctx, 2, i, slot);
        }

        ov12_02256F28(battleSys, battleSys->ctx);
        battleSys->unk23FC = 1;
    }

    if (battleSys->battleType & BATTLE_TYPE_PAL_PARK) {
        mon = Party_GetMonByIndex(battleSys->trainerParty[1], 0);
        GetMonData(mon, MON_DATA_OT_NAME, (u8 *)&battleSys->trainers[1].name);
    }

    if (battleSys->battleType & BATTLE_TYPE_TRAINER) {
        if (ov12_022395BC(battleSys->trainers[1].data.trainerClass) == TRUE
            || ov12_022395BC(battleSys->trainers[3].data.trainerClass) == TRUE) {
            for (i = 0; i < Party_GetCount(battleSys->trainerParty[0]); i++) {
                mon = Party_GetMonByIndex(battleSys->trainerParty[0], i);
                MonApplyFriendshipMod(mon, 3, battleSys->location);
                ApplyMonMoodModifier(mon, 2);
            }

            for (i = 0; i < Party_GetCount(battleSys->trainerParty[2]); i++) {
                mon = Party_GetMonByIndex(battleSys->trainerParty[2], i);
                MonApplyFriendshipMod(mon, 3, battleSys->location);
                ApplyMonMoodModifier(mon, 2);
            }
        }
    }

    battleSys->unk2478 = 0;
    battleSys->unk2474_2 = 0;

    u32 flag = 0;
    for (int i = 0; i < battleSys->maxBattlers; i++) {
        u32 version = PlayerProfile_GetVersion(BattleSystem_GetPlayerProfile(battleSys, i));
        if (version != GAME_VERSION) {
            flag = 1;
        }
        if (version != VERSION_HEARTGOLD && version != VERSION_SOULSILVER) {
            battleSys->unk2474_2 = 1;
        }
    }

    if (battleSys->unk23FC) {
        battleSys->unk2478 = flag;
    } else {
        battleSys->unk2478 = 0;
    }
}

// static
BOOL ov12_022395BC(u16 trainerClass) {
    switch (trainerClass) {
    case TRAINERCLASS_LEADER_FALKNER:
    case TRAINERCLASS_LEADER_BUGSY:
    case TRAINERCLASS_LEADER_WHITNEY:
    case TRAINERCLASS_LEADER_MORTY:
    case TRAINERCLASS_LEADER_CHUCK:
    case TRAINERCLASS_LEADER_PRYCE:
    case TRAINERCLASS_LEADER_JASMINE:
    case TRAINERCLASS_LEADER_CLAIR:
    case TRAINERCLASS_ELITE_FOUR_WILL:
    case TRAINERCLASS_ELITE_FOUR_BRUNO:
    case TRAINERCLASS_ELITE_FOUR_KOGA:
    case TRAINERCLASS_ELITE_FOUR_KAREN:
    case TRAINERCLASS_CHAMPION:
    case TRAINERCLASS_LEADER_BROCK:
    case TRAINERCLASS_LEADER_MISTY:
    case TRAINERCLASS_LEADER_LT_SURGE:
    case TRAINERCLASS_LEADER_ERIKA:
    case TRAINERCLASS_LEADER_JANINE:
    case TRAINERCLASS_LEADER_SABRINA:
    case TRAINERCLASS_LEADER_BLAINE:
    case TRAINERCLASS_LEADER_BLUE:
        return TRUE;
        break;
    }

    return FALSE;
}

// static
void ov12_02239664(void);

// static
GF3DVramMan *ov12_02239644(void) {
    return GF_3DVramMan_Create(HEAP_ID_BATTLE, 0, 2, 0, 2, ov12_02239664);
}

// static
void ov12_02239664(void) {
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG0, TRUE);

    G2_SetBG0Priority(1);
    G3X_SetShading(GX_SHADING_TOON);
    G3X_AntiAlias(TRUE);
    G3X_AlphaTest(FALSE, 0);
    G3X_AlphaBlend(TRUE);
    G3X_EdgeMarking(FALSE);
    G3X_SetFog(FALSE, GX_FOGBLEND_COLOR_ALPHA, GX_FOGSLOPE_0x8000, 0);
    G3X_SetClearColor(GX_RGB(0, 0, 0), 0, 0x7FFF, 63, 0);
    G3_ViewPort(0, 0, HW_LCD_WIDTH - 1, HW_LCD_HEIGHT - 1);
}

// static
void ov12_022396E8(GF3DVramMan *pipelineBuffers) {
    GF_3DVramMan_Delete(pipelineBuffers);
}

// static
void ov12_022396F0(void) {
    NNSGfdTexKey texKey = NNS_GfdAllocTexVram(0x2000 * 4, 0, 0);
    NNSGfdPlttKey plttKey = NNS_GfdAllocPlttVram(0x20 * (4 + 2), 0, 0);

    GF_ASSERT(texKey != NNS_GFD_ALLOC_ERROR_TEXKEY);
    GF_ASSERT(plttKey != NNS_GFD_ALLOC_ERROR_PLTTKEY);

    sub_02014DA0();
}

extern GraphicsBanks ov12_0226C0D0;
extern GraphicsBanks ov12_0226C0F8;
// static
void ov12_02239730(void *inBattleSys) {
    BattleSystem *battleSys = inBattleSys;

    if (battleSys->unk240F_0) {
        battleSys->unk240F_0 = 0;
        G2_BlendNone();
        G2S_BlendNone();
    }

    if (battleSys->unk240F_1) {
        battleSys->unk240F_1 = 0;

        GraphicsBanks banks;
        banks = ov12_0226C0D0;

        GfGfx_SetBanks(&banks);
    }

    if (battleSys->unk240E_F) {
        battleSys->unk240E_F = 0;

        GraphicsBanks banks;
        banks = ov12_0226C0F8;

        GfGfx_SetBanks(&banks);
    }

    PokepicManager_HandleLoadImgAndOrPltt(battleSys->pokepicManager);
    GF_RunVramTransferTasks();
    SpriteSystem_TransferOam();
    PaletteData_PushTransparentBuffers(battleSys->palette);
    DoScheduledBgGpuUpdates(battleSys->bgConfig);

    OS_SetIrqCheckFlag(OS_IE_V_BLANK);
}

typedef struct LinkBattleCommState {
    BattleSetup *dto;
    BgConfig *bgConfig;
    Window *window;
    PaletteData *paletteData;
    void *palPad[4];
    u8 sendBuffer[0x1000];
    u8 recvCount;
    u8 handshakeStep;
    u16 syncTimer;
    void *waitDial;
} LinkBattleCommState;

// static
void ov12_022397E4(void *commState) {
    LinkBattleCommState *linkBattleCommState = commState;

    PaletteData_PushTransparentBuffers(linkBattleCommState->paletteData);
    GF_RunVramTransferTasks();
    DoScheduledBgGpuUpdates(linkBattleCommState->bgConfig);

    OS_SetIrqCheckFlag(OS_IE_V_BLANK);
}

// static
void ov12_02239810(SysTask *task, void *inBattleSys) {
    BattleSystem *battleSys = inBattleSys;

    sub_020399FC(HEAP_ID_BATTLE, battleSys->bgConfig);

    if (battleSys->unk23FD == 0 || battleSys->unk23FD == 3) {
        if (battleSys->unk23FD == 0) {
            ov06_0221BAF0();
        }

        PokepicManager_DrawAll(battleSys->pokepicManager);
        SpriteSystem_DrawSprites(battleSys->gfxHandler);
        SpriteSystem_UpdateTransfer();
        RequestSwap3DBuffers(GX_SORTMODE_MANUAL, GX_BUFFERMODE_Z);
    }
}

// static
void ov12_02239854(SysTask *task, void *inBattleSys) {
    BattleSystem *battleSys = inBattleSys;
    OpponentData *battlerData;
    BattleHpBar *healthbox;

    int maxBattlers = BattleSystem_GetMaxBattlers(battleSys);
    int flags = 0;
    int redHPSoundFlag = BattleSystem_GetCriticalHpMusicFlag(battleSys);

    if (BattleSystem_GetBattleType(battleSys) & (BATTLE_TYPE_SAFARI | BATTLE_TYPE_PAL_PARK)) {
        return;
    }

    if (redHPSoundFlag & 2) {
        if (redHPSoundFlag & 1) {
            StopSE(0x704, 0);
            BattleSystem_SetCriticalHpMusicFlag(battleSys, 2);
        }

        return;
    }

    for (int i = 0; i < maxBattlers; i++) {
        battlerData = BattleSystem_GetOpponentData(battleSys, i);

        if ((ov12_02261264(battlerData) == 0 && (BattleSystem_GetBattleSpecial(battleSys) & 0x10) == FALSE)
            || (BattleSystem_GetFieldSide(battleSys, i) == 0 && BattleSystem_GetBattleSpecial(battleSys) & 0x10)) {
            healthbox = OpponentData_GetHpBar(battlerData);

            if (healthbox != NULL) {
                if (CalculateHpBarColor(healthbox->hp, healthbox->maxHp, 8 * 6) == 1) {
                    flags |= MaskOfFlagNo(i);
                }
            }
        }
    }

    if (flags && BattleSystem_GetCriticalHpMusicFlag(battleSys) == FALSE) {
        PlaySE(0x704);
        BattleSystem_SetCriticalHpMusicFlag(battleSys, 1);
        BattleSystem_SetCriticalHpMusicDelay(battleSys, 4);
    } else if (flags == 0 && BattleSystem_GetCriticalHpMusicFlag(battleSys)) {
        StopSE(0x704, 0);
        BattleSystem_SetCriticalHpMusicFlag(battleSys, 0);
    }

    if (BattleSystem_GetCriticalHpMusicFlag(battleSys)) {
        int delay = BattleSystem_GetCriticalHpMusicDelay(battleSys);

        if (IsSEPlaying(0x704) == FALSE) {
            if (--delay == 0) {
                PlaySE(0x704);
                BattleSystem_SetCriticalHpMusicDelay(battleSys, 4);
            } else {
                BattleSystem_SetCriticalHpMusicDelay(battleSys, delay);
            }
        }
    }
}

// static
void ov12_0223998C(SysTask *task, void *inBattleSys) {
    BattleSystem *battleSys = inBattleSys;

    battleSys->unk2438 += 3;
    BgSetPosTextAndCommit(battleSys->bgConfig, 1, 3, battleSys->unk2438);

    if (battleSys->unk2438 == 0) {
        SysTask_Destroy(task);
    }
}

// static
void ov12_022399BC(void) {
    if (!sub_02039998()) {
        HandleLoadOverlay(FS_OVERLAY_ID(OVY_18), 2);
    }
}

extern void ov12_022397E4();

extern GraphicsBanks ov12_0226C080;
extern GraphicsModes ov12_0226BFF8;
extern BgTemplate ov12_0226C044;

// static
void ov12_022399D4(OverlayManager *appMan, BattleSetup *dto) {
    LinkBattleCommState *linkBattleCommState = OverlayManager_CreateAndGetData(appMan, sizeof(LinkBattleCommState), HEAP_ID_BATTLE);

    linkBattleCommState->dto = dto;
    linkBattleCommState->recvCount = 0;
    linkBattleCommState->handshakeStep = 0;
    linkBattleCommState->syncTimer = 0;
    linkBattleCommState->paletteData = PaletteData_Init(HEAP_ID_BATTLE);

    PaletteData_SetAutoTransparent(linkBattleCommState->paletteData, TRUE);
    PaletteData_AllocBuffers(linkBattleCommState->paletteData, PLTTBUF_MAIN_BG, 0x200, HEAP_ID_BATTLE);
    PaletteData_FillPaletteInBuffer(linkBattleCommState->paletteData, PLTTBUF_MAIN_BG, PLTTSEL_BOTH, 0, 0, 256);

    linkBattleCommState->bgConfig = BgConfig_Alloc(HEAP_ID_BATTLE);
    linkBattleCommState->window = AllocWindows(HEAP_ID_BATTLE, 1);

    sub_02074EC4(linkBattleCommState);
    GfGfx_DisableEngineAPlanes();

    GraphicsBanks banks = ov12_0226C080;

    GfGfx_SetBanks(&banks);

    MI_CpuClear32((void *)HW_BG_VRAM, HW_BG_VRAM_SIZE);
    MI_CpuClear32((void *)HW_DB_BG_VRAM, HW_DB_BG_VRAM_SIZE);
    MI_CpuClear32((void *)HW_OBJ_VRAM, HW_OBJ_VRAM_SIZE);
    MI_CpuClear32((void *)HW_DB_OBJ_VRAM, HW_DB_OBJ_VRAM_SIZE);
    MI_CpuFill16((void *)HW_BG_PLTT, 0, HW_BG_PLTT_SIZE);

    GraphicsModes graphicsModes = ov12_0226BFF8;

    SetBothScreensModesAndDisable(&graphicsModes);

    BgTemplate bgTemplate = ov12_0226C044;

    InitBgFromTemplate(linkBattleCommState->bgConfig, 1, &bgTemplate, 0);
    BgClearTilemapBufferAndCommit(linkBattleCommState->bgConfig, 1);

    int frame = Options_GetFrame(dto->options);

    sub_0200EB80(linkBattleCommState->bgConfig, 1, 1, 10, (u8)frame, HEAP_ID_BATTLE);
    PaletteData_LoadNarc(linkBattleCommState->paletteData, 16, 8, HEAP_ID_BATTLE, PLTTBUF_MAIN_BG, 32, 11 * 16);
    PaletteData_LoadNarc(linkBattleCommState->paletteData, 38, sub_0200E640(frame), HEAP_ID_BATTLE, PLTTBUF_MAIN_BG, 32, 160);
    PaletteData_FillPaletteInBuffer(linkBattleCommState->paletteData, PLTTBUF_MAIN_BG, 0, 0, 0, 256);

    GfGfx_BothDispOn();
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_OBJ, TRUE);
    GX_SetDispSelect(1);
    AddWindowParameterized(linkBattleCommState->bgConfig, linkBattleCommState->window, 1, 2, 0x13, 27, 4, 11, (18 + 12) + 1);
    FillWindowPixelBuffer(linkBattleCommState->window, 0xFF);
    DrawFrameAndWindow2(linkBattleCommState->window, 0, 1, 10);

    MsgData *msgLoader = NewMsgDataFromNarc(1, 0x1b, 0xc5, HEAP_ID_BATTLE);
    String *string = String_New(0x100, HEAP_ID_BATTLE);

    ReadMsgDataIntoString(msgLoader, 0x39b, string);
    AddTextPrinterParameterized(linkBattleCommState->window, FONT_MESSAGE, string, 0, 0, NULL, NULL);

    String_Delete(string);
    DestroyMsgData(msgLoader);

    Main_SetVBlankIntrCB(ov12_022397E4, linkBattleCommState);
    PaletteData_BeginPaletteFade(linkBattleCommState->paletteData, PLTTBUF_MAIN_BG_F | PLTTBUF_MAIN_OBJ_F, 0xFFFF, 0, 16, 0, 0);

    linkBattleCommState->waitDial = WaitingIcon_New(linkBattleCommState->window, 1);

    ov12_0223A7A0();
}

// static
BOOL ov12_02239C28(OverlayManager *appMan) {
    LinkBattleCommState *linkBattleCommState = OverlayManager_GetData(appMan);

    sub_020399FC(HEAP_ID_BATTLE, linkBattleCommState->bgConfig);

    BOOL result = 0;

    switch (linkBattleCommState->handshakeStep) {
    case 0:
        SetMasterBrightnessNeutral(0);
        sub_02037930(1);
        linkBattleCommState->handshakeStep++;
        break;
    case 1:
        if (PaletteData_GetSelectedBuffersBitmask(linkBattleCommState->paletteData) == 0) {
            linkBattleCommState->handshakeStep++;
        }
        break;
    case 2:
        sub_02037AC0(50);
        linkBattleCommState->handshakeStep++;
        break;
    case 3:
        if (sub_02037B38(50)) {
            sub_02037AC0(51);
            linkBattleCommState->syncTimer = 0;
            linkBattleCommState->handshakeStep++;
        } else {
            linkBattleCommState->syncTimer++;

            if (linkBattleCommState->syncTimer > (60 * 30)) {
                sub_02039AD8(1);
            }
        }
        break;
    case 4:
        if (sub_02075074(linkBattleCommState, 5 << 6) == 1) {
            linkBattleCommState->handshakeStep++;
        }
        break;
    case 6:
        if (sub_020750E0(linkBattleCommState) == TRUE) {
            sub_02037AC0(52);
            linkBattleCommState->handshakeStep++;
        }
        break;
    case 7:
        if (sub_02075108(linkBattleCommState) == TRUE) {
            linkBattleCommState->handshakeStep++;
        }
        break;
    case 9:
        if (sub_0207514C(linkBattleCommState) == TRUE) {
            sub_02037AC0(53);
            linkBattleCommState->handshakeStep++;
        }
        break;
    case 10:
        if (sub_02075178(linkBattleCommState) == TRUE) {
            linkBattleCommState->handshakeStep++;
        }
        break;
    case 12:
        if (sub_020751B8(linkBattleCommState) == TRUE) {
            sub_02037AC0(54);
            linkBattleCommState->handshakeStep++;
        }
        break;
    case 13:
        if (sub_020751DC(linkBattleCommState) == TRUE) {
            linkBattleCommState->handshakeStep++;
        }
        break;
    case 15:
        if (sub_02075220(linkBattleCommState) == TRUE) {
            sub_02037AC0(55);
            linkBattleCommState->handshakeStep++;
        }
        break;
    case 16:
        if (sub_02075248(linkBattleCommState) == TRUE) {
            linkBattleCommState->handshakeStep++;
        }
        break;
    case 18:
        if (sub_0207527C(linkBattleCommState) == TRUE) {
            sub_02037AC0(56);
            linkBattleCommState->handshakeStep++;
        }
        break;
    case 19:
        if (sub_020752D8(linkBattleCommState) == TRUE) {
            linkBattleCommState->handshakeStep++;
        }
        break;
    case 21:
        if ((linkBattleCommState->dto->battleType & BATTLE_TYPE_FRONTIER) == 0) {
            linkBattleCommState->handshakeStep = 33;
        } else {
            if (CommSystem_GetCurNetId()) {
                sub_02037AC0(57);
                linkBattleCommState->handshakeStep++;
            } else if (sub_0207531C(linkBattleCommState, 1) == TRUE) {
                sub_02037AC0(57);
                linkBattleCommState->handshakeStep++;
            }
        }
        break;
    case 22:
        linkBattleCommState->recvCount = 1;

        if (CommSystem_GetCurNetId()) {
            if (sub_02037B38(57) == TRUE) {
                linkBattleCommState->handshakeStep++;
            }
        } else if (sub_02075350(linkBattleCommState, 1, 57) == TRUE) {
            linkBattleCommState->handshakeStep++;
        }
        break;
    case 24:
        if (CommSystem_GetCurNetId()) {
            sub_02037AC0(58);
            linkBattleCommState->handshakeStep++;
        } else if (sub_0207531C(linkBattleCommState, 3) == TRUE) {
            sub_02037AC0(58);
            linkBattleCommState->handshakeStep++;
        }
        break;
    case 25:
        linkBattleCommState->recvCount = 1;

        if (CommSystem_GetCurNetId()) {
            if (sub_02037B38(58) == TRUE) {
                linkBattleCommState->handshakeStep++;
            }
        } else if (sub_02075350(linkBattleCommState, 3, 58) == TRUE) {
            linkBattleCommState->handshakeStep++;
        }
        break;
    case 27:
        if (CommSystem_GetCurNetId()) {
            sub_02037AC0(59);
            linkBattleCommState->handshakeStep++;
        } else if (sub_020753A8(linkBattleCommState, 1) == TRUE) {
            sub_02037AC0(59);
            linkBattleCommState->handshakeStep++;
        }
        break;
    case 28:
        linkBattleCommState->recvCount = 1;

        if (CommSystem_GetCurNetId()) {
            if (sub_02037B38(59) == TRUE) {
                linkBattleCommState->handshakeStep++;
            }
        } else if (sub_020753D4(linkBattleCommState, 1, 59) == TRUE) {
            linkBattleCommState->handshakeStep++;
        }
        break;
    case 30:
        if (CommSystem_GetCurNetId()) {
            sub_02037AC0(60);
            linkBattleCommState->handshakeStep++;
        } else if (sub_020753A8(linkBattleCommState, 3) == TRUE) {
            sub_02037AC0(60);
            linkBattleCommState->handshakeStep++;
        }
        break;
    case 31:
        linkBattleCommState->recvCount = 1;

        if (CommSystem_GetCurNetId()) {
            if (sub_02037B38(60) == TRUE) {
                linkBattleCommState->handshakeStep++;
            }
        } else if (sub_020753D4(linkBattleCommState, 3, 60) == TRUE) {
            linkBattleCommState->handshakeStep++;
        }
        break;
    case 5:
    case 8:
    case 11:
    case 14:
    case 17:
    case 20:
    case 23:
    case 26:
    case 29:
    case 32:
        if (linkBattleCommState->recvCount == CommSystem_GetConnectedCount()) {
            if (linkBattleCommState->handshakeStep == 20) {
                int i;

                for (i = 0; i < 4; i++) {
                    Heap_Free(linkBattleCommState->palPad[i]);
                }
            }

            linkBattleCommState->recvCount = 0;
            linkBattleCommState->syncTimer = 0;
            linkBattleCommState->handshakeStep++;

            if (linkBattleCommState->handshakeStep == 33) {
                PaletteData_BeginPaletteFade(linkBattleCommState->paletteData, PLTTBUF_MAIN_BG_F | PLTTBUF_MAIN_OBJ_F, 0xFFFF, 0, 0, 16, 0);
            }
        } else {
            linkBattleCommState->syncTimer++;

            if (linkBattleCommState->syncTimer > (60 * 30)) {
                sub_02039AD8(1);
            }
        }
        break;
    case 33:
        if (PaletteData_GetSelectedBuffersBitmask(linkBattleCommState->paletteData) == 0) {
            result = 1;
            sub_0200F450(linkBattleCommState->waitDial);
            sub_02037930(0);
        }
        break;
    }

    return result;
}

// static
void ov12_0223A088(OverlayManager *appMan) {
    LinkBattleCommState *linkBattleCommState = OverlayManager_GetData(appMan);

    Main_SetVBlankIntrCB(NULL, NULL);
    sub_0200FBF4(0, RGB_BLACK);
    PaletteData_FreeBuffers(linkBattleCommState->paletteData, PLTTBUF_MAIN_BG);
    PaletteData_Free(linkBattleCommState->paletteData);
    WindowArray_Delete(linkBattleCommState->window, 1);
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG1, FALSE);
    FreeBgTilemapBuffer(linkBattleCommState->bgConfig, 1);
    Heap_Free(linkBattleCommState->bgConfig);
    Heap_Free(linkBattleCommState);
}

// static
BOOL ov12_0223A0D4(OverlayManager *appMan) {
    BattleSystem *battleSys = OverlayManager_CreateAndGetData(appMan, sizeof(BattleSystem), HEAP_ID_BATTLE);
    BattleSetup *dto = OverlayManager_GetArgs(appMan);
    u8 netID;

    MI_CpuClearFast(battleSys, sizeof(BattleSystem));
    ov12_02238A68(battleSys, dto);

    if ((battleSys->battleType & BATTLE_TYPE_LINK) == FALSE
        || battleSys->battleSpecial & 0x10
        || battleSys->battleType & BATTLE_TYPE_FRONTIER) {
        sub_0203A914();
        return FALSE;
    }

    HandleLoadOverlay(FS_OVERLAY_ID(OVY_5), 2);

    if ((battleSys->battleType & BATTLE_TYPE_MULTI) == FALSE) {
        return FALSE;
    }

    battleSys->unk1C4 = Heap_Alloc(HEAP_ID_BATTLE, sizeof(TrainerIntroData));
    MI_CpuClearFast(battleSys->unk1C4, sizeof(TrainerIntroData));
    netID = CommSystem_GetCurNetId();

    switch (sub_020378AC(netID)) {
    case 0:
    case 3:
        battleSys->unk1C4->party[0] = battleSys->trainerParty[netID];
        battleSys->unk1C4->party[2] = battleSys->trainerParty[BattleSystem_GetBattlerIdPartner(battleSys, netID)];
        break;
    case 1:
    case 2:
        battleSys->unk1C4->party[0] = battleSys->trainerParty[BattleSystem_GetBattlerIdPartner(battleSys, netID)];
        battleSys->unk1C4->party[2] = battleSys->trainerParty[netID];
        break;
    }

    battleSys->unk1C4->heapID = HEAP_ID_BATTLE;
    battleSys->unk1C4->mode = 0;

    switch (sub_020378AC(netID)) {
    case 0:
    case 3:
        battleSys->unk1C4->playerSide = 0;
        break;
    case 1:
    case 2:
        battleSys->unk1C4->playerSide = 1;
        break;
    }

    ov05_0221BA00(battleSys->unk1C4);

    return TRUE;
}

// static
BOOL ov12_0223A218(OverlayManager *appMan) {
    BattleSystem *battleSys = OverlayManager_GetData(appMan);

    if (battleSys->unk1C4->isDone) {
        for (int i = 0; i < 4; i++) {
            if (battleSys->unk1C4->trainerNames[i] != NULL) {
                Heap_Free(battleSys->unk1C4->trainerNames[i]);
            }
        }

        Heap_Free(battleSys->unk1C4);
        return TRUE;
    }

    return FALSE;
}

// static
BOOL ov12_0223A260(OverlayManager *appMan) {
    BattleSystem *battleSys = OverlayManager_GetData(appMan);
    BattleSetup *dto = OverlayManager_GetArgs(appMan);

    if ((battleSys->battleType & BATTLE_TYPE_LINK) == FALSE
        || battleSys->battleSpecial & 0x10
        || battleSys->battleType & BATTLE_TYPE_FRONTIER) {
        sub_0203A914();
        return FALSE;
    }

    u8 netID = CommSystem_GetCurNetId();
    battleSys->unk1C4 = Heap_Alloc(HEAP_ID_BATTLE, sizeof(TrainerIntroData));

    MI_CpuClearFast(battleSys->unk1C4, sizeof(TrainerIntroData));

    if (battleSys->battleType & BATTLE_TYPE_MULTI) {
        for (int i = 0; i < 4; i++) {
            battleSys->unk1C4->party[sub_020378AC(i)] = battleSys->trainerParty[i];
            battleSys->unk1C4->trainerNames[sub_020378AC(i)] = PlayerProfile_GetPlayerName_NewString(battleSys->playerProfile[i], HEAP_ID_BATTLE);
        }

        battleSys->unk1C4->heapID = HEAP_ID_BATTLE;
        battleSys->unk1C4->mode = 1;
        battleSys->unk1C4->playerSide = 1;
    } else {
        battleSys->unk1C4->party[sub_020378AC(netID)] = battleSys->trainerParty[netID];
        battleSys->unk1C4->party[sub_020378AC(netID ^ 1)] = battleSys->trainerParty[netID ^ 1];
        battleSys->unk1C4->trainerNames[sub_020378AC(netID)] = PlayerProfile_GetPlayerName_NewString(battleSys->playerProfile[netID], HEAP_ID_BATTLE);
        battleSys->unk1C4->trainerNames[sub_020378AC(netID ^ 1)] = PlayerProfile_GetPlayerName_NewString(battleSys->playerProfile[netID ^ 1], HEAP_ID_BATTLE);
        battleSys->unk1C4->heapID = HEAP_ID_BATTLE;
        battleSys->unk1C4->mode = 1;
        battleSys->unk1C4->playerSide = 0;
    }

    ov05_0221BA00(battleSys->unk1C4);

    return TRUE;
}

// static
BOOL ov12_0223A3A8(OverlayManager *appMan) {
    BattleSystem *battleSys = OverlayManager_GetData(appMan);

    if (battleSys->unk1C4->isDone) {
        for (int i = 0; i < 4; i++) {
            if (battleSys->unk1C4->trainerNames[i] != NULL) {
                Heap_Free(battleSys->unk1C4->trainerNames[i]);
            }
        }

        Heap_Free(battleSys->unk1C4);
        return TRUE;
    }

    return FALSE;
}

// static
BOOL ov12_0223A3F0(OverlayManager *appMan) {
    BattleSetup *dto = OverlayManager_GetArgs(appMan);

    if ((dto->battleType & BATTLE_TYPE_LINK) == FALSE
        || dto->battleSpecial & 0x10
        || dto->battleType & BATTLE_TYPE_FRONTIER) {
        return FALSE;
    }

    u8 netID = CommSystem_GetCurNetId();
    HandleLoadOverlay(FS_OVERLAY_ID(OVY_5), 2);
    TrainerIntroData *trainerIntroData = Heap_Alloc(HEAP_ID_BATTLE, sizeof(TrainerIntroData));

    dto->evolutionTaskData = trainerIntroData;
    MI_CpuClearFast(trainerIntroData, sizeof(TrainerIntroData));
    trainerIntroData->dto = dto;

    switch (dto->winFlag) {
    case BATTLE_RESULT_WIN:
        if (!sub_02039998()) {
            GameStats_Inc(dto->gameStats, 22);
        } else {
            GameStats_Inc(dto->gameStats, 27);
        }
        break;
    case BATTLE_RESULT_LOSE:
        if (!sub_02039998()) {
            GameStats_Inc(dto->gameStats, 23);
        } else {
            GameStats_Inc(dto->gameStats, 28);
        }
        break;
    case BATTLE_RESULT_DRAW:
    case BATTLE_RESULT_PLAYER_FLED:
        if (!sub_02039998()) {
            GameStats_Inc(dto->gameStats, 24);
        } else {
            GameStats_Inc(dto->gameStats, 29);
        }
        break;
    }

    if (dto->battleType & BATTLE_TYPE_MULTI) {
        for (int i = 0; i < 4; i++) {
            trainerIntroData->party[sub_020378AC(i)] = dto->party[i];
            trainerIntroData->trainerNames[sub_020378AC(i)] = PlayerProfile_GetPlayerName_NewString(dto->profile[i], HEAP_ID_BATTLE);
        }

        trainerIntroData->heapID = HEAP_ID_BATTLE;
        trainerIntroData->mode = 2;
        trainerIntroData->playerSide = 1;

        if (dto->winFlag != BATTLE_RESULT_PLAYER_FLED) {
            trainerIntroData->battleResult = dto->winFlag;
        } else {
            trainerIntroData->battleResult = 3;
        }
    } else {
        trainerIntroData->party[sub_020378AC(netID)] = dto->party[netID];
        trainerIntroData->party[sub_020378AC(netID ^ 1)] = dto->party[netID ^ 1];
        trainerIntroData->trainerNames[sub_020378AC(netID)] = PlayerProfile_GetPlayerName_NewString(dto->profile[netID], HEAP_ID_BATTLE);
        trainerIntroData->trainerNames[sub_020378AC(netID ^ 1)] = PlayerProfile_GetPlayerName_NewString(dto->profile[netID ^ 1], HEAP_ID_BATTLE);
        trainerIntroData->heapID = HEAP_ID_BATTLE;
        trainerIntroData->mode = 2;
        trainerIntroData->playerSide = 0;

        if (dto->winFlag != BATTLE_RESULT_PLAYER_FLED) {
            trainerIntroData->battleResult = dto->winFlag;
        } else {
            trainerIntroData->battleResult = 3;
        }
    }

    trainerIntroData->recordingType = dto->unk1B2;

    ov05_0221BA00(trainerIntroData);

    return TRUE;
}

// static
BOOL ov12_0223A5E4(OverlayManager *appMan) {
    BattleSetup *dto = OverlayManager_GetArgs(appMan);
    TrainerIntroData *unk1C4 = dto->evolutionTaskData;

    if (unk1C4->isDone) {
        for (int i = 0; i < 4; i++) {
            if (unk1C4->trainerNames[i] != NULL) {
                Heap_Free(unk1C4->trainerNames[i]);
            }
        }

        Heap_Free(unk1C4);
        return TRUE;
    }

    return FALSE;
}

// static
void ov12_0223A620(BattleSystem *battleSys) {
    if ((battleSys->battleType & (BATTLE_TYPE_LINK | BATTLE_TYPE_TUTORIAL))
        || battleSys->battleSpecial & 0x10) {
        TextFlags_SetAutoScrollParam(1);
        TextFlags_SetCanABSpeedUpPrint(TRUE);
        TextFlags_SetCanTouchSpeedUpPrint(FALSE);
    } else {
        TextFlags_SetAutoScrollParam(3);
        TextFlags_SetCanABSpeedUpPrint(TRUE);
        TextFlags_SetCanTouchSpeedUpPrint(TRUE);
    }
}

// static
void ov12_0223A664(BattleSystem *battleSys, BattleSetup *dto) {
    int i, j, temp;
    int netIDs[4];
    int versions[4];

    if (battleSys->battleSpecial & 0x10) {
        battleSys->unk23FC = 1;
        return;
    }

    for (i = 0; i < 4; i++) {
        netIDs[i] = i;
        versions[i] = dto->filler_17C[i];
    }

    int netID = CommSystem_GetCurNetId();
    int connectedCount = CommSystem_GetConnectedCount();

    for (i = 0; i < connectedCount - 1; i++) {
        for (j = i + 1; j < connectedCount; j++) {
            if (versions[i] < versions[j]) {
                temp = netIDs[i];
                netIDs[i] = netIDs[j];
                netIDs[j] = temp;
                temp = versions[i];
                versions[i] = versions[j];
                versions[j] = temp;
            }
        }
    }

    if (netIDs[0] == netID) {
        battleSys->unk23FC = 1;
    } else {
        if ((battleSys->battleType & BATTLE_TYPE_FRONTIER) == FALSE) {
            if (battleSys->battleType & BATTLE_TYPE_MULTI) {
                temp = sub_020378AC(netID);

                switch (sub_020378AC(netIDs[0])) {
                case 0:
                case 2:
                    if (temp & 1) {
                        battleSys->battleSpecial |= 0x20;
                    }
                    break;
                case 1:
                case 3:
                    if ((temp & 1) == 0) {
                        battleSys->battleSpecial |= 0x20;
                    }
                    break;
                }
            } else {
                battleSys->battleSpecial |= 0x20;
            }
        }
    }
}

// static
void ov12_0223A7A0(void) {
    sub_0203A880();

    if (sub_02039998()) {
        sub_0203A930(WM_LINK_LEVEL_3 - DWC_GetLinkLevel());
    } else if (sub_02035650()) {
        sub_0203A930(WM_LINK_LEVEL_3 - WM_GetLinkLevel());
    }
}
