#include "battle/battle_main.h"

#include "constants/game_stats.h"

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

static void BattleMain_InitGraphics(OverlayManager *appMan);
static int BattleMain_ExecuteBattlerCommands(OverlayManager *appMan);
static void BattleMain_CopyBattleSysToBattleSetupAndFree(OverlayManager *appMan);
static void BattleMain_InitBattleGraphics(BattleSystem *battleSystem, BgConfig *bgConfig);
static void BattleMain_InitTerrainsBattleMain_InitTerrains(BattleSystem *battleSystem);
static void BattleMain_FreeBgLayers(BgConfig *bgConfig);
static void ov12_02238A64(BattleSystem *battleSystem);
static void BattleSystem_New(BattleSystem *battleSystem, BattleSetup *battleSetup);
static BOOL TrainerClass_IsEliteTrainer(u16 trainerClass);
static GF3DVramMan *InitG3DPipelineBuffers(void);
static void G3DPipeline_SetupCallback(void);
static void FreeG3DPipelineBuffers(GF3DVramMan *pipelineBuffers);
static void BattleMain_InitParticleSystem(void);
static void BattleMain_VBlankCallback(void *inBattleSys);
static void BattleMain_LinkCommVBlankCallback(void *commState);
static void SysTask_DrawSprites(SysTask *task, void *inBattleSys);
static void SysTask_UpdateCriticalHpMusic(SysTask *task, void *inBattleSys);
static void SysTask_FlyInMessageBox(SysTask *task, void *inBattleSys);
static void BattleMain_InitLinkCommScreen(OverlayManager *appMan, BattleSetup *battleSetup);
static BOOL BattleMain_HandleLinkCommHandshake(OverlayManager *appMan);
static void BattleMain_FreeeLinkCommScreen(OverlayManager *appMan);
static BOOL BattleMain_InitPartnerIntro(OverlayManager *appMan);
static BOOL BattleMain_WaitPartnerIntro(OverlayManager *appMan);
static BOOL BattleMain_InitTrainerIntro(OverlayManager *appMan);
static BOOL BattleMain_WaitTrainerIntro(OverlayManager *appMan);
static BOOL BattleMain_HandleLinkBattleResult(OverlayManager *appMan);
static BOOL BattleMain_WaitLinkBattleEnd(OverlayManager *appMan);
static void BattleSys_SetRenderControlFlags(BattleSystem *battleSystem);
static void BattleMain_AssignRecordingRoles(BattleSystem *battleSystem, BattleSetup *battleSetup);
static void BattleMain_SetNetworkIconStrength(void);

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
        BattleMain_InitLinkCommScreen(man, setup);
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
        if (BattleMain_HandleLinkCommHandshake(man) == TRUE) {
            BattleMain_FreeeLinkCommScreen(man);
            *state = BSTATE_UNK_A_INIT;
        }
        break;
    case BSTATE_UNK_A_INIT:
        if (BattleMain_InitPartnerIntro(man) == TRUE) {
            *state = BSTATE_UNK_A_MAIN;
        } else {
            *state = BSTATE_UNK_B_INIT;
        }
        break;
    case BSTATE_UNK_A_MAIN:
        if (BattleMain_WaitPartnerIntro(man) == TRUE) {
            *state = BSTATE_UNK_B_INIT;
        }
        break;
    case BSTATE_UNK_B_INIT:
        if (BattleMain_InitTrainerIntro(man) == TRUE) {
            *state = BSTATE_UNK_B_MAIN;
        } else {
            *state = BSTATE_BATTLE_INIT;
        }
        break;
    case BSTATE_UNK_B_MAIN:
        if (BattleMain_WaitTrainerIntro(man) == TRUE) {
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
        BattleMain_InitGraphics(man);
        *state = BSTATE_BATTLE_MAIN;
        break;
    case BSTATE_BATTLE_MAIN:
        if (BattleMain_ExecuteBattlerCommands(man) == TRUE) {
            BattleMain_CopyBattleSysToBattleSetupAndFree(man);
            sub_02005BEC(0);
            *state = BSTATE_END_INIT;
        }
        break;
    case BSTATE_END_INIT:
        if (BattleMain_HandleLinkBattleResult(man) == TRUE) {
            *state = BSTATE_END_MAIN;
        } else {
            Heap_Destroy(HEAP_ID_BATTLE);
            *state = BSTATE_EVOLUTION_INIT;
        }
        break;
    case BSTATE_END_MAIN:
        if (BattleMain_WaitLinkBattleEnd(man) == TRUE) {
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
    BattleMain_FreeBgLayers(battleSystem->bgConfig);
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
    BattleSys_SetRenderControlFlags(battleSystem);

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
void BattleSystem_SetupBattleScreen(BattleSystem *battleSystem) {
    battleSystem->unk240F_0 = 1;

    BgTemplate bgTemplates[3];

    bgTemplates = ov12_0226C120;

    InitBgFromTemplate(battleSystem->bgConfig, 1, &bgTemplates[0], 0);
    BgClearTilemapBufferAndCommit(battleSystem->bgConfig, 1);
    InitBgFromTemplate(battleSystem->bgConfig, 2, &bgTemplates[1], 0);
    BgClearTilemapBufferAndCommit(battleSystem->bgConfig, 2);
    InitBgFromTemplate(battleSystem->bgConfig, 3, &bgTemplates[2], 0);
    BgClearTilemapBufferAndCommit(battleSystem->bgConfig, 3);

    G2_SetBG0Priority(1);
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG0, TRUE);

    int frame = BattleSystem_GetFrame(battleSystem);

    sub_0200EB80(battleSystem->bgConfig, 1, 1, 10, (u8)frame, HEAP_ID_BATTLE);
    GfGfxLoader_LoadCharData(7, 3 + battleSystem->backgroundId, battleSystem->bgConfig, 3, 0, 0, 1, HEAP_ID_BATTLE);
    PaletteData_LoadNarc(battleSystem->palette, 7, 176 + battleSystem->backgroundId * 3 + ov12_0223B52C(battleSystem), HEAP_ID_BATTLE, PLTTBUF_MAIN_BG, 0, 0);
    PaletteData_LoadNarc(battleSystem->palette, 0x26, sub_0200E640(frame), HEAP_ID_BATTLE, PLTTBUF_MAIN_BG, 0x20, 0xA0);
    PaletteData_LoadNarc(battleSystem->palette, 16, 8, HEAP_ID_BATTLE, PLTTBUF_MAIN_BG, 0x20, 0xB0);
    GfGfxLoader_LoadScrnData(7, 2, battleSystem->bgConfig, 3, 0, 0, 1, HEAP_ID_BATTLE);

    GX_SetVisibleWnd(GX_WNDMASK_NONE);
    GXS_SetVisibleWnd(GX_WNDMASK_NONE);
    G2_SetWnd0InsidePlane(GX_WND_PLANEMASK_NONE, 0);
    G2_SetWndOutsidePlane(GX_WND_PLANEMASK_NONE, 0);

    GfGfx_BothDispOn();

    GfGfx_EngineATogglePlanes(GX_PLANEMASK_OBJ, TRUE);
    GfGfx_EngineBTogglePlanes(GX_PLANEMASK_OBJ, TRUE);
    Main_SetVBlankIntrCB(BattleMain_VBlankCallback, battleSystem);

    battleSystem->unk240F_1 = 1;

    AddWindowParameterized(battleSystem->bgConfig, battleSystem->window, 1, 2, 19, 27, 4, 11, (18 + 12) + 1);
    FillWindowPixelBuffer(battleSystem->window, 0xFF);
    DrawFrameAndWindow2(&battleSystem->window[0], 0, 1, 10);

    BattleSys_SetRenderControlFlags(battleSystem);
}

void BattleSystem_LoadFightOverlay(BattleSystem *battleSystem, int flags) {
    GF_ASSERT(battleSystem->unk2445 != flags);

    battleSystem->unk2445 = flags;

    if (flags == FALSE) {
        UnloadOverlayByID(FS_OVERLAY_ID(OVY_10));
        HandleLoadOverlay(FS_OVERLAY_ID(OVY_7), 2);
    } else {
        UnloadOverlayByID(FS_OVERLAY_ID(OVY_7));
        HandleLoadOverlay(FS_OVERLAY_ID(OVY_10), 2);
    }
}

extern const int ov12_0226C1C8[][3];
extern OamManagerParam ov12_0226C060;
extern OamCharTransferParam ov12_0226C018;
extern SpriteResourceCountsListUnion ov12_0226C02C;

static void BattleMain_InitGraphics(OverlayManager *appMan) {
    BattleSystem *battleSystem = OverlayManager_GetData(appMan);
    BattleSetup *battleSetup = OverlayManager_GetArgs(appMan);
    int idx;

    MI_CpuFill16((void *)GetMainBgPlttAddr(), 0, sub_02026E8C());
    MI_CpuFill16((void *)GetSubBgPlttAddr(), 0, sub_02026E9C());

    battleSystem->unk0 = InitG3DPipelineBuffers();

    HBlankInterruptDisable();
    FontID_Alloc(4, HEAP_ID_BATTLE);

    battleSystem->hpNumPrinter = (BattleNumberPrinter *)MessagePrinter_New(14, 2, 15, HEAP_ID_BATTLE);

    battleSystem->levelNumPrinter = battleSystem->hpNumPrinter;
    battleSystem->palette = PaletteData_Init(HEAP_ID_BATTLE);

    PaletteData_SetAutoTransparent(battleSystem->palette, TRUE);
    PaletteData_AllocBuffers(battleSystem->palette, PLTTBUF_MAIN_BG, 32 * 16, HEAP_ID_BATTLE);
    PaletteData_AllocBuffers(battleSystem->palette, PLTTBUF_SUB_BG, 32 * 16, HEAP_ID_BATTLE);
    PaletteData_AllocBuffers(battleSystem->palette, PLTTBUF_MAIN_OBJ, 32 * 14, HEAP_ID_BATTLE);
    PaletteData_AllocBuffers(battleSystem->palette, PLTTBUF_SUB_OBJ, 32 * 16, HEAP_ID_BATTLE);

    battleSystem->bgConfig = BgConfig_Alloc(HEAP_ID_BATTLE);
    battleSystem->window = AllocWindows(HEAP_ID_BATTLE, 3);

    for (idx = 0; idx < 4; idx++) {
        battleSystem->unk1D0[idx].unk0 = Heap_Alloc(HEAP_ID_BATTLE, 32 * 10 * 10);
    }

    GF_CreateVramTransferManager(64, HEAP_ID_BATTLE);

    NARC *bgNarc = NARC_New(7, HEAP_ID_BATTLE);
    NARC *objNarc = NARC_New(8, HEAP_ID_BATTLE);

    battleSystem->battleInput = BattleInput_NewInit(bgNarc, objNarc, battleSystem, BattleSystem_GetTrainerGender(battleSystem, ov12_0223BFC0(battleSystem)), battleSystem->unk1C0);

    NARC_Delete(bgNarc);
    NARC_Delete(objNarc);

    BattleMain_InitBattleGraphics(battleSystem, battleSystem->bgConfig);

    AddWindowParameterized(battleSystem->bgConfig, &battleSystem->window[0], 1, 2, 0x13, 27, 4, 11, (18 + 12) + 1);
    FillWindowPixelBuffer(&battleSystem->window[0], 0xFF);
    DrawFrameAndWindow2(&battleSystem->window[0], 0, 1, 10);

    battleSystem->spriteRenderer = SpriteSystem_Alloc(HEAP_ID_BATTLE);

    SpriteSystem_Init(battleSystem->spriteRenderer, &ov12_0226C060, &ov12_0226C018, 16 + 16);
    G2dRenderer_SetObjCharTransferReservedRegion(NNS_G2D_VRAM_TYPE_2DMAIN, GX_OBJVRAMMODE_CHAR_1D_64K);
    G2dRenderer_SetPlttTransferReservedRegion(NNS_G2D_VRAM_TYPE_2DMAIN);

    battleSystem->gfxHandler = SpriteManager_New(battleSystem->spriteRenderer);

    SpriteSystem_InitSprites(battleSystem->spriteRenderer, battleSystem->gfxHandler, 64 + 64);
    SpriteSystem_InitManagerWithCapacities(battleSystem->spriteRenderer, battleSystem->gfxHandler, &ov12_0226C02C);
    G2dRenderer_SetSubSurfaceCoords(SpriteSystem_GetRenderer(battleSystem->spriteRenderer), 0, (192 + 80) << FX32_SHIFT);

    BattleInput_LoadDefaultResources(battleSystem->battleInput);

    NARC *bgNarc2 = NARC_New(7, HEAP_ID_BATTLE);
    NARC *objNarc2 = NARC_New(8, HEAP_ID_BATTLE);

    BattleInput_ChangeMenu(bgNarc2, objNarc2, battleSystem->battleInput, 0, 1, NULL);
    BattleInput_LoadBallGaugeResources(objNarc2, battleSystem->battleInput);

    NARC_Delete(bgNarc2);
    NARC_Delete(objNarc2);

    battleSystem->pokepicManager = PokepicManager_Create(HEAP_ID_BATTLE);
    PokepicManager_SetPlttBaseAddrAndSize(battleSystem->pokepicManager, 0, 32 * 6);

    BattleSystem_HpBar_Init(battleSystem);
    BattleMain_InitParticleSystem();

    battleSystem->unk8C = ov07_0221BEDC(HEAP_ID_BATTLE);

    BattleMain_InitTerrainsBattleMain_InitTerrains(battleSystem);

    EnableTouchPad();
    InitializeTouchPad(4);

    battleSystem->msgData = NewMsgDataFromNarc(1, 27, 0xc5, HEAP_ID_BATTLE);
    battleSystem->unk10 = NewMsgDataFromNarc(1, 27, 3, HEAP_ID_BATTLE);
    battleSystem->msgFormat = MessageFormat_New(HEAP_ID_BATTLE);
    battleSystem->msgBuffer = String_New(2 * 160, HEAP_ID_BATTLE);

    MI_CpuCopy16(PaletteData_GetUnfadedBuf(battleSystem->palette, 0), &battleSystem->unk2228[0], 32 * 7);
    MI_CpuCopy16(PaletteData_GetUnfadedBuf(battleSystem->palette, 2), &battleSystem->unk2308[0], 32 * 7);

    int offset = ov12_0223B52C(battleSystem);

    PaletteData_FillPaletteInBuffer(battleSystem->palette, PLTTBUF_MAIN_BG, PLTTSEL_BOTH, ov12_0226C1C8[battleSystem->backgroundId][offset], 0, 112);
    PaletteData_FillPaletteInBuffer(battleSystem->palette, PLTTBUF_MAIN_BG, PLTTSEL_BOTH, ov12_0226C1C8[battleSystem->backgroundId][offset], 0xC * 16, 0xC * 16 + 4 * 16);
    PaletteData_FillPaletteInBuffer(battleSystem->palette, PLTTBUF_MAIN_OBJ, PLTTSEL_BOTH, ov12_0226C1C8[battleSystem->backgroundId][offset], 0, ((16 - 2) * 16) - 1);

    PaletteData_FillPaletteInBuffer(battleSystem->palette, PLTTBUF_MAIN_BG, 0, 0, 10 * 16, 10 * 16 + 2 * 16);
    PaletteData_FillPaletteInBuffer(battleSystem->palette, PLTTBUF_SUB_BG, 0, 0, 0, 255);
    PaletteData_FillPaletteInBuffer(battleSystem->palette, PLTTBUF_SUB_OBJ, 0, 0xFFFF, 0, 255);

    battleSystem->msgIcon = sub_020163E0(battleSystem->palette, 0, 11, HEAP_ID_BATTLE);
    sub_0201649C(battleSystem->msgIcon, 1);

    battleSystem->unk1C = SysTask_CreateOnMainQueue(SysTask_DrawSprites, battleSystem, 60000);
    battleSystem->unk20 = SysTask_CreateOnMainQueue(SysTask_UpdateCriticalHpMusic, battleSystem, 50000);
    battleSystem->unk24 = SysTask_CreateOnVBlankQueue(SysTask_FlyInMessageBox, battleSystem, 1200);
    battleSystem->unk2438 = -51;

    BattleSys_SetRenderControlFlags(battleSystem);
    BagCursor_Battle_Init(BattleSystem_GetBagCursor(battleSystem));

    battleSystem->unk1C8 = sub_02016EDC(HEAP_ID_BATTLE, 4, FALSE);
    battleSystem->unk1CC = sub_02020654(4, HEAP_ID_BATTLE);

    if (battleSystem->battleSpecial & 0x10) {
        for (idx = 0; idx < 4; idx++) {
            battleSystem->chatotVoiceParam[idx] = battleSetup->unk1BC[idx];
        }
    }
}

static int BattleMain_ExecuteBattlerCommands(OverlayManager *appMan) {
    BattleSystem *battleSystem = OverlayManager_GetData(appMan);
    int battler;

    if (battleSystem->battleType & BATTLE_TYPE_LINK && (battleSystem->battleSpecial & 0x10) == FALSE) {
        if (battleSystem->unk23FC) {
            BattleContext_Main(battleSystem, battleSystem->ctx);
        }

        for (battler = 0; battler < battleSystem->maxBattlers; battler++) {
            BattleSystem_ExecuteBattlerCommand(battleSystem, battleSystem->opponentData[battler]);
        }
    } else {
        if (battleSystem->unk23FC) {
            battleSystem->unk23FE = BattleContext_Main(battleSystem, battleSystem->ctx);
            BattleSystem_TryRecvMessage(battleSystem, 1);
        }

        for (battler = 0; battler < battleSystem->maxBattlers; battler++) {
            BattleSystem_ExecuteBattlerCommand(battleSystem, battleSystem->opponentData[battler]);
            BattleSystem_TryRecvMessage(battleSystem, 0);
        }

        if (battleSystem->unk23FE == FALSE) {
            if (battleSystem->unk23FC) {
                battleSystem->unk23FE = BattleContext_Main(battleSystem, battleSystem->ctx);
                BattleSystem_TryRecvMessage(battleSystem, 1);
            }

            for (battler = 0; battler < battleSystem->maxBattlers; battler++) {
                BattleSystem_ExecuteBattlerCommand(battleSystem, battleSystem->opponentData[battler]);
                BattleSystem_TryRecvMessage(battleSystem, 0);
            }
        }
    }

    return battleSystem->unk23FE;
}

static void BattleMain_CopyBattleSysToBattleSetupAndFree(OverlayManager *appMan) {
    BattleSystem *battleSystem = OverlayManager_GetData(appMan);
    BattleSetup *battleSetup = OverlayManager_GetArgs(appMan);
    int battlerId;

    battleSetup->rand = battleSystem->randTemp;
    battleSetup->battleSpecial = battleSystem->battleSpecial;

    if ((battleSystem->battleSpecial & 0x10) == FALSE) {
        sub_020302A4(battleSetup);
    }

    if (battleSystem->unk2445 != FALSE) {
        BattleSystem_LoadFightOverlay(battleSystem, FALSE);
    }

    int color;

    if (battleSetup->battleType & 0xAA4) {
        color = RGB_BLACK;
    } else if (battleSystem->battleOutcomeFlag == 2 || battleSystem->battleOutcomeFlag == 3) {
        color = RGB_WHITE;
    } else {
        color = RGB_BLACK;
    }

    sub_0200FBF4(0, color);
    sub_0200FBF4(1, color);
    BattleSystem_TryChangeForm(battleSystem);

    if (battleSystem->battleOutcomeFlag != BATTLE_RESULT_CAPTURED_MON) {
        BattleSystem_InitCaptureAttempt(battleSystem, Party_GetMonByIndex(battleSystem->trainerParty[1], 0));
    }

    for (battlerId = 0; battlerId < 4; battlerId++) {
        Party_Copy(battleSystem->trainerParty[battlerId], battleSetup->party[battlerId]);
        Heap_Free(battleSystem->trainerParty[battlerId]);
        PlayerProfile_Copy(battleSystem->playerProfile[battlerId], battleSetup->profile[battlerId]);
        Heap_Free(battleSystem->playerProfile[battlerId]);
    }

    sub_020164C4(battleSystem->msgIcon);
    Save_Bag_Copy(battleSystem->bag, battleSetup->bag);
    Heap_Free(battleSystem->bag);
    Pokedex_Copy(battleSystem->pokedex, battleSetup->pokedex);
    Heap_Free(battleSystem->pokedex);
    battleSetup->storagePC = battleSystem->storage;
    battleSetup->bagCursor = battleSystem->bagCursor;
    battleSetup->unk1B8 = battleSystem->unk1C0;
    battleSetup->unk_128 = battleSystem->unk98;
    battleSetup->captureAttempt = battleSystem->captureAttempt;
    battleSetup->safariBalls = battleSystem->safariBallCnt;
    battleSetup->winFlag = battleSystem->battleOutcomeFlag & (0xC0 ^ 0xFF);
    battleSetup->battlerIdCaught = battleSystem->battlerIdCaught;
    battleSetup->levelUpFlag = BattleContext_Get(battleSystem, battleSystem->ctx, 4, NULL);
    battleSetup->unk138.unk_0 += BattleContext_Get(battleSystem, battleSystem->ctx, 3, NULL);
    battleSetup->unk138.unk_4 += BattleContext_Get(battleSystem, battleSystem->ctx, 6, 0) + BattleContext_Get(battleSystem, battleSystem->ctx, 6, 2);
    battleSetup->unk138.unk_8 += BattleContext_Get(battleSystem, battleSystem->ctx, 7, 0) + BattleContext_Get(battleSystem, battleSystem->ctx, 7, 2);
    battleSetup->unk1B4 = BattleContext_Get(battleSystem, battleSystem->ctx, 3, NULL);
    battleSetup->isRecordingPaused = battleSystem->isRecordingPaused;

    for (battlerId = 0; battlerId < 4; battlerId++) {
        Heap_Free(battleSystem->unk1D0[battlerId].unk0);
    }

    Heap_Free(battleSystem->msgBuffer);
    PaletteData_FreeBuffers(battleSystem->palette, 0);
    PaletteData_FreeBuffers(battleSystem->palette, 1);
    PaletteData_FreeBuffers(battleSystem->palette, 2);
    PaletteData_FreeBuffers(battleSystem->palette, 3);
    PaletteData_Free(battleSystem->palette);
    DestroyMsgData(battleSystem->msgData);
    DestroyMsgData(battleSystem->unk10);
    MessageFormat_Delete(battleSystem->msgFormat);
    sub_02016F2C(battleSystem->unk1C8);
    sub_02014F84();

    ov07_0221BFE0(battleSystem->unk8C);
    BattleContext_Delete(battleSystem->ctx);

    for (battlerId = 0; battlerId < battleSystem->maxBattlers; battlerId++) {
        OpponentData_Delete(battleSystem, battleSystem->opponentData[battlerId], battleSystem->unk23FD);
    }

    PokepicManager_Delete(battleSystem->pokepicManager);

    if (battleSystem->unk23FD != 2) {
        BattleSystem_FreeGraphics(battleSystem);
    }

    TextFlags_SetCanABSpeedUpPrint(FALSE);
    TextFlags_SetAutoScrollParam(0);
    TextFlags_SetCanTouchSpeedUpPrint(FALSE);
    WindowArray_Delete(battleSystem->window, 3);
    Heap_Free(battleSystem->bgConfig);
    Heap_Free(battleSystem->unk220);
    Heap_Free(battleSystem->unk224);
    MessagePrinter_Delete((MessagePrinter *)battleSystem->hpNumPrinter);
    SysTask_Destroy(battleSystem->unk1C);
    SysTask_Destroy(battleSystem->unk20);
    DisableTouchPad();

    FreeG3DPipelineBuffers(battleSystem->unk0);

    SetLCRNGSeed(battleSystem->unk2434);

    if (BattleSystem_GetCriticalHpMusicFlag(battleSystem)) {
        StopSE(0x704, 0);
    }

    sub_0202067C(battleSystem->unk1CC);

    if (BattleSystem_IsRecordingPaused(battleSystem)) {
        Sound_SetMasterVolume(127);
    }

    if (battleSystem->unk247C) {
        ov12_0226BEF0(battleSystem->unk247C);
    }

    Heap_Free(battleSystem);
    UnloadOverlayByID(FS_OVERLAY_ID(OVY_6));
    UnloadOverlayByID(FS_OVERLAY_ID(OVY_7));

    if (!sub_02039998()) {
        UnloadOverlayByID(FS_OVERLAY_ID(OVY_18));
    }
}

extern GraphicsBanks ov12_0226C0A8;
extern GraphicsModes ov12_0226BFE8;
extern BgTemplate ov12_0226C174[3];
static void BattleMain_InitBattleGraphics(BattleSystem *battleSystem, BgConfig *bgConfig) {
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

    battleSystem->unk240F_0 = 1;

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

    int frame = BattleSystem_GetFrame(battleSystem);

    sub_0200EB80(bgConfig, 1, 1, 10, (u8)frame, HEAP_ID_BATTLE);
    GfGfxLoader_LoadCharData(7, 3 + battleSystem->backgroundId, bgConfig, 3, 0, 0, 1, HEAP_ID_BATTLE);
    PaletteData_LoadNarc(battleSystem->palette, 7, 176 + battleSystem->backgroundId * 3 + ov12_0223B52C(battleSystem), HEAP_ID_BATTLE, PLTTBUF_MAIN_BG, 0, 0);
    PaletteData_LoadNarc(battleSystem->palette, 38, sub_0200E640(frame), HEAP_ID_BATTLE, PLTTBUF_MAIN_BG, 32, 10 * 16);
    PaletteData_LoadNarc(battleSystem->palette, 16, 8, HEAP_ID_BATTLE, PLTTBUF_MAIN_BG, 32, 11 * 16);
    GfGfxLoader_LoadScrnData(7, 2, bgConfig, 3, 0, 0, 1, HEAP_ID_BATTLE);

    GX_SetVisibleWnd(GX_WNDMASK_NONE);
    GXS_SetVisibleWnd(GX_WNDMASK_NONE);
    G2_SetWnd0InsidePlane(0, NULL);
    G2_SetWndOutsidePlane(0, NULL);

    GfGfx_BothDispOn();
    GfGfx_EngineATogglePlanes(16, TRUE);
    GfGfx_EngineBTogglePlanes(16, TRUE);
    Main_SetVBlankIntrCB(BattleMain_VBlankCallback, battleSystem);
}

static void BattleMain_InitTerrainsBattleMain_InitTerrains(BattleSystem *battleSystem) {
    int terrain = BattleSystem_GetTerrainId(battleSystem);
    int selectedPartySlot;
    Pokemon *mon;

    ov12_02265FD4(&battleSystem->unk17C[0], battleSystem, 0, terrain);
    ov12_02265FD4(&battleSystem->unk17C[1], battleSystem, 1, terrain);

    BattleContext *battleCtx = BattleSystem_GetBattleContext(battleSystem);

    for (int battler = 0; battler < battleSystem->maxBattlers; battler++) {
        selectedPartySlot = BattleContext_Get(battleSystem, battleCtx, 2, battler);
        mon = BattleSystem_GetPartyMon(battleSystem, battler, selectedPartySlot);
        ov12_02258DB0(battleSystem, battleSystem->opponentData[battler], BattleSystem_GetMonBall(battleSystem, mon), selectedPartySlot);
    }

    BattleMain_SetNetworkIconStrength();
}

static void BattleMain_FreeBgLayers(BgConfig *bgConfig) {
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG0, FALSE);
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG1, FALSE);
    FreeBgTilemapBuffer(bgConfig, 1);
    FreeBgTilemapBuffer(bgConfig, 2);
    FreeBgTilemapBuffer(bgConfig, 3);

    BgConfig_CleanupBattleMenuBackgrounds(bgConfig);
}

static void ov12_02238A64(BattleSystem *battleSystem) {
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

static void BattleSystem_New(BattleSystem *battleSystem, BattleSetup *battleSetup) {
    int i, slot;
    BattlerInitData battlerInitData;
    Pokemon *mon;

    battleSystem->battleType = battleSetup->battleType;

    for (i = 0; i < 4; i++) {
        battleSystem->playerProfile[i] = PlayerProfile_New(HEAP_ID_BATTLE);
        PlayerProfile_Copy(battleSetup->profile[i], battleSystem->playerProfile[i]);
        battleSystem->chatotVoice[i] = battleSetup->chatot[i];
    }

    battleSystem->unk2446 = battleSetup->unk1B0;

    for (i = 0; i < 4; i++) {
        battleSystem->unk2464[i] = battleSetup->unk_1A0[i];
    }

    battleSystem->unk2434 = GetLCRNGSeed();
    battleSystem->rand = battleSetup->rand;
    battleSystem->randTemp = battleSetup->rand;
    battleSystem->battleSpecial = battleSetup->battleSpecial;
    battleSystem->bag = Save_Bag_New(HEAP_ID_BATTLE);

    Save_Bag_Copy(battleSetup->bag, battleSystem->bag);
    battleSystem->pokedex = Pokedex_New(HEAP_ID_BATTLE);
    Pokedex_Copy(battleSetup->pokedex, battleSystem->pokedex);

    battleSystem->storage = battleSetup->storagePC;
    battleSystem->options = battleSetup->options;
    battleSystem->unk1B8 = (u32 *)battleSetup->palPad;
    battleSystem->bagCursor = battleSetup->bagCursor;
    battleSystem->unk1C0 = battleSetup->unk1B8;
    battleSystem->unk98 = battleSetup->unk_128;
    battleSystem->evolutionLocation = battleSetup->evolutionLocation;
    battleSystem->captureAttempt = battleSetup->captureAttempt;
    battleSystem->safariBallCnt = battleSetup->safariBalls;
    battleSystem->terrain = battleSetup->terrain;
    battleSystem->backgroundId = battleSetup->battleBg;
    battleSystem->location = battleSetup->mapSection;
    battleSystem->timezone = (u32)battleSetup->timeOfDay;
    battleSystem->unk241C = battleSetup->fixedDamaageMovesBanned;
    battleSystem->unk2428 = battleSetup->unk_164;
    battleSystem->metBill = battleSetup->metBill;
    battleSystem->momsSavingsActive = battleSetup->momsSavingsActive;
    battleSystem->isFishing = battleSetup->isFishing;
    battleSystem->weather = battleSetup->weatherType;
    battleSystem->gameStats = battleSetup->gameStats;

    GF_ASSERT(battleSetup->gameStats != NULL);

    battleSystem->bugContestCaughtMon = battleSetup->bugContestMon;

    for (i = 0; i < 4; i++) {
        battleSystem->trainerId[i] = battleSetup->trainerId[i];
        battleSystem->trainers[i] = battleSetup->trainer[i];
    }

    battleSystem->ctx = BattleContext_New(battleSystem);

    for (i = 0; i < 4; i++) {
        battleSystem->trainerParty[i] = SaveArray_Party_Alloc(HEAP_ID_BATTLE);
        battleSystem->unk248C[i] = battleSetup->unk1CC[i];
    }

    int gender;

    for (i = 0; i < 4; i++) {
        for (slot = 0; slot < Party_GetCount(battleSetup->party[i]); slot++) {
            mon = Party_GetMonByIndex(battleSetup->party[i], slot);
            gender = GetMonGender(mon);
            SetMonData(mon, MON_DATA_GENDER, &gender);
        }
    }

    if (battleSystem->battleType & BATTLE_TYPE_LINK) {
        sub_02074E5C(battleSystem);
        u8 networkID = ov12_0223BFC0(battleSystem);

        BattleMain_AssignRecordingRoles(battleSystem, battleSetup);

        if (battleSystem->battleType & BATTLE_TYPE_FRONTIER) {
            for (i = 0; i < 4; i++) {
                battlerInitData.battler = i;
                battlerInitData.battlerType = ov12_0226C2DC[i];
                battleSystem->opponentData[i] = ov12_02258D74(battleSystem, &battlerInitData);
            }

            battleSystem->maxBattlers = i;

            for (i = 0; i < 4; i++) {
                OpponentData_SetTaskFuncs(battleSystem, battleSystem->opponentData[i]);
                Party_Copy(battleSetup->party[i], battleSystem->trainerParty[i]);
            }

            for (i = 0; i < battleSystem->maxBattlers; i++) {
                for (slot = 0; slot < Party_GetCount(battleSystem->trainerParty[i]); slot++) {
                    mon = Party_GetMonByIndex(battleSystem->trainerParty[i], slot);

                    if (GetMonData(mon, MON_DATA_SPECIES, NULL)
                        && GetMonData(mon, MON_DATA_IS_EGG, NULL) == FALSE
                        && GetMonData(mon, MON_DATA_HP, NULL)) {
                        break;
                    }
                }

                ov12_022582B8(battleSystem, battleSystem->ctx, 2, i, slot);
            }

            ov12_02256F28(battleSystem, battleSystem->ctx);
        } else if (battleSystem->battleType & BATTLE_TYPE_MULTI) {
            for (i = 0; i < 4; i++) {
                battlerInitData.battler = i;
                battlerInitData.battlerType = ov12_0226C008[ov12_0223BFCC(battleSystem, networkID)][ov12_0223BFCC(battleSystem, i)];
                battleSystem->opponentData[i] = ov12_02258D74(battleSystem, &battlerInitData);
            }

            battleSystem->maxBattlers = i;

            for (i = 0; i < 4; i++) {
                OpponentData_SetTaskFuncs(battleSystem, battleSystem->opponentData[i]);
                Party_Copy(battleSetup->party[i], battleSystem->trainerParty[i]);
            }

            for (i = 0; i < battleSystem->maxBattlers; i++) {
                for (slot = 0; slot < Party_GetCount(battleSystem->trainerParty[i]); slot++) {
                    mon = Party_GetMonByIndex(battleSystem->trainerParty[i], slot);

                    if (GetMonData(mon, MON_DATA_SPECIES, NULL)
                        && GetMonData(mon, MON_DATA_IS_EGG, NULL) == FALSE
                        && GetMonData(mon, MON_DATA_HP, NULL)) {
                        break;
                    }
                }

                ov12_022582B8(battleSystem, battleSystem->ctx, 2, i, slot);
            }

            ov12_02256F28(battleSystem, battleSystem->ctx);
        } else if (battleSystem->battleType & BATTLE_TYPE_DOUBLES) {
            for (i = 0; i < 4; i++) {
                battlerInitData.battler = i;
                battlerInitData.battlerType = ov12_0226BFE0[networkID][i];
                battleSystem->opponentData[i] = ov12_02258D74(battleSystem, &battlerInitData);
                OpponentData_SetTaskFuncs(battleSystem, battleSystem->opponentData[i]);
            }

            battleSystem->maxBattlers = i;

            for (i = 0; i < 4; i++) {
                Party_Copy(battleSetup->party[i], battleSystem->trainerParty[i]);
            }

            for (i = 0; i < battleSystem->maxBattlers; i++) {
                for (slot = 0; slot < Party_GetCount(battleSystem->trainerParty[i & 1]); slot++) {
                    mon = Party_GetMonByIndex(battleSystem->trainerParty[i & 1], slot);

                    if (i > 1) {
                        if ((BattleContext_Get(battleSystem, battleSystem->ctx, 2, i & 1) != slot)
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

                ov12_022582B8(battleSystem, battleSystem->ctx, 2, i, slot);
            }
        } else {
            for (i = 0; i < 2; i++) {
                battlerInitData.battler = i;
                battlerInitData.battlerType = ov12_0226BFDC[networkID][i];
                battleSystem->opponentData[i] = ov12_02258D74(battleSystem, &battlerInitData);
                OpponentData_SetTaskFuncs(battleSystem, battleSystem->opponentData[i]);
            }

            battleSystem->maxBattlers = i;

            for (i = 0; i < 4; i++) {
                Party_Copy(battleSetup->party[i], battleSystem->trainerParty[i]);

                for (slot = 0; slot < Party_GetCount(battleSystem->trainerParty[i]); slot++) {
                    mon = Party_GetMonByIndex(battleSystem->trainerParty[i], slot);

                    if (GetMonData(mon, MON_DATA_SPECIES, NULL)
                        && GetMonData(mon, MON_DATA_IS_EGG, NULL) == FALSE
                        && GetMonData(mon, MON_DATA_HP, NULL)) {
                        break;
                    }
                }

                ov12_022582B8(battleSystem, battleSystem->ctx, 2, i, slot);
            }
        }
        ov12_02256F28(battleSystem, battleSystem->ctx);
    } else if (battleSystem->battleType & BATTLE_TYPE_TAG) {
        int playerSlot;

        for (i = 0; i < 4; i++) {
            battlerInitData.battler = i;
            battlerInitData.battlerType = ov12_0226C2DC[i];
            battleSystem->opponentData[i] = ov12_02258D74(battleSystem, &battlerInitData);
            OpponentData_SetTaskFuncs(battleSystem, battleSystem->opponentData[i]);
        }

        battleSystem->maxBattlers = i;

        for (i = 0; i < 4; i++) {
            Party_Copy(battleSetup->party[i], battleSystem->trainerParty[i]);
        }

        for (i = 0; i < battleSystem->maxBattlers; i++) {
            for (slot = 0; slot < BattleSystem_GetPartySize(battleSystem, i); slot++) {
                mon = BattleSystem_GetPartyMon(battleSystem, i, slot);

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

            ov12_022582B8(battleSystem, battleSystem->ctx, 2, i, slot);

            if (i == 0) {
                playerSlot = slot;
            }
        }
        ov12_02256F28(battleSystem, battleSystem->ctx);
        battleSystem->unk23FC = 1;
    } else if (battleSystem->battleType & BATTLE_TYPE_MULTI) {
        for (i = 0; i < 4; i++) {
            battlerInitData.battler = i;
            battlerInitData.battlerType = ov12_0226C2DC[i];
            battleSystem->opponentData[i] = ov12_02258D74(battleSystem, &battlerInitData);
            OpponentData_SetTaskFuncs(battleSystem, battleSystem->opponentData[i]);
        }

        battleSystem->maxBattlers = i;

        for (i = 0; i < 4; i++) {
            Party_Copy(battleSetup->party[i], battleSystem->trainerParty[i]);
        }

        for (i = 0; i < battleSystem->maxBattlers; i++) {
            for (slot = 0; slot < Party_GetCount(battleSystem->trainerParty[i]); slot++) {
                mon = Party_GetMonByIndex(battleSystem->trainerParty[i], slot);

                if (GetMonData(mon, MON_DATA_SPECIES, NULL)
                    && GetMonData(mon, MON_DATA_IS_EGG, NULL) == FALSE
                    && GetMonData(mon, MON_DATA_HP, NULL)) {
                    break;
                }
            }

            ov12_022582B8(battleSystem, battleSystem->ctx, 2, i, slot);
        }

        ov12_02256F28(battleSystem, battleSystem->ctx);
        battleSystem->unk23FC = 1;
    } else if (battleSystem->battleType & BATTLE_TYPE_DOUBLES) {
        for (i = 0; i < 4; i++) {
            battlerInitData.battler = i;
            battlerInitData.battlerType = ov12_0226C2DC[i];
            battleSystem->opponentData[i] = ov12_02258D74(battleSystem, &battlerInitData);
            OpponentData_SetTaskFuncs(battleSystem, battleSystem->opponentData[i]);
        }

        battleSystem->maxBattlers = i;

        for (i = 0; i < 4; i++) {
            Party_Copy(battleSetup->party[i], battleSystem->trainerParty[i]);
        }

        for (i = 0; i < battleSystem->maxBattlers; i++) {
            for (slot = 0; slot < Party_GetCount(battleSystem->trainerParty[i & 1]); slot++) {
                mon = Party_GetMonByIndex(battleSystem->trainerParty[i & 1], slot);

                if (i > 1) {
                    if (BattleContext_Get(battleSystem, battleSystem->ctx, 2, i & 1) != slot
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

            ov12_022582B8(battleSystem, battleSystem->ctx, 2, i, slot);
        }

        ov12_02256F28(battleSystem, battleSystem->ctx);
        battleSystem->unk23FC = 1;
    } else {
        for (i = 0; i < 2; i++) {
            battlerInitData.battler = i;
            battlerInitData.battlerType = _0226BFD8[i];
            battleSystem->opponentData[i] = ov12_02258D74(battleSystem, &battlerInitData);
            OpponentData_SetTaskFuncs(battleSystem, battleSystem->opponentData[i]);
        }

        battleSystem->maxBattlers = i;

        for (i = 0; i < 4; i++) {
            Party_Copy(battleSetup->party[i], battleSystem->trainerParty[i]);

            for (slot = 0; slot < Party_GetCount(battleSystem->trainerParty[i]); slot++) {
                mon = Party_GetMonByIndex(battleSystem->trainerParty[i], slot);

                if (GetMonData(mon, MON_DATA_SPECIES, NULL)
                    && GetMonData(mon, MON_DATA_IS_EGG, NULL) == FALSE
                    && GetMonData(mon, MON_DATA_HP, NULL)) {
                    break;
                }
            }

            ov12_022582B8(battleSystem, battleSystem->ctx, 2, i, slot);
        }

        ov12_02256F28(battleSystem, battleSystem->ctx);
        battleSystem->unk23FC = 1;
    }

    if (battleSystem->battleType & BATTLE_TYPE_PAL_PARK) {
        mon = Party_GetMonByIndex(battleSystem->trainerParty[1], 0);
        GetMonData(mon, MON_DATA_OT_NAME, (u8 *)&battleSystem->trainers[1].name);
    }

    if (battleSystem->battleType & BATTLE_TYPE_TRAINER) {
        if (TrainerClass_IsEliteTrainer(battleSystem->trainers[1].data.trainerClass) == TRUE
            || TrainerClass_IsEliteTrainer(battleSystem->trainers[3].data.trainerClass) == TRUE) {
            for (i = 0; i < Party_GetCount(battleSystem->trainerParty[0]); i++) {
                mon = Party_GetMonByIndex(battleSystem->trainerParty[0], i);
                MonApplyFriendshipMod(mon, 3, battleSystem->location);
                ApplyMonMoodModifier(mon, 2);
            }

            for (i = 0; i < Party_GetCount(battleSystem->trainerParty[2]); i++) {
                mon = Party_GetMonByIndex(battleSystem->trainerParty[2], i);
                MonApplyFriendshipMod(mon, 3, battleSystem->location);
                ApplyMonMoodModifier(mon, 2);
            }
        }
    }

    battleSystem->unk2478 = 0;
    battleSystem->unk2474_2 = 0;

    u32 flag = 0;
    for (int i = 0; i < battleSystem->maxBattlers; i++) {
        u32 version = PlayerProfile_GetVersion(BattleSystem_GetPlayerProfile(battleSystem, i));
        if (version != GAME_VERSION) {
            flag = 1;
        }
        if (version != VERSION_HEARTGOLD && version != VERSION_SOULSILVER) {
            battleSystem->unk2474_2 = 1;
        }
    }

    if (battleSystem->unk23FC) {
        battleSystem->unk2478 = flag;
    } else {
        battleSystem->unk2478 = 0;
    }
}

static BOOL TrainerClass_IsEliteTrainer(u16 trainerClass) {
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

static GF3DVramMan *InitG3DPipelineBuffers(void) {
    return GF_3DVramMan_Create(HEAP_ID_BATTLE, 0, 2, 0, 2, G3DPipeline_SetupCallback);
}

static void G3DPipeline_SetupCallback(void) {
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

static void FreeG3DPipelineBuffers(GF3DVramMan *pipelineBuffers) {
    GF_3DVramMan_Delete(pipelineBuffers);
}

static void BattleMain_InitParticleSystem(void) {
    NNSGfdTexKey texKey = NNS_GfdAllocTexVram(0x2000 * 4, 0, 0);
    NNSGfdPlttKey plttKey = NNS_GfdAllocPlttVram(0x20 * (4 + 2), 0, 0);

    GF_ASSERT(texKey != NNS_GFD_ALLOC_ERROR_TEXKEY);
    GF_ASSERT(plttKey != NNS_GFD_ALLOC_ERROR_PLTTKEY);

    sub_02014DA0();
}

extern GraphicsBanks ov12_0226C0D0;
extern GraphicsBanks ov12_0226C0F8;
static void BattleMain_VBlankCallback(void *inBattleSys) {
    BattleSystem *battleSystem = inBattleSys;

    if (battleSystem->unk240F_0) {
        battleSystem->unk240F_0 = 0;
        G2_BlendNone();
        G2S_BlendNone();
    }

    if (battleSystem->unk240F_1) {
        battleSystem->unk240F_1 = 0;

        GraphicsBanks banks;
        banks = ov12_0226C0D0;

        GfGfx_SetBanks(&banks);
    }

    if (battleSystem->unk240E_F) {
        battleSystem->unk240E_F = 0;

        GraphicsBanks banks;
        banks = ov12_0226C0F8;

        GfGfx_SetBanks(&banks);
    }

    PokepicManager_HandleLoadImgAndOrPltt(battleSystem->pokepicManager);
    GF_RunVramTransferTasks();
    SpriteSystem_TransferOam();
    PaletteData_PushTransparentBuffers(battleSystem->palette);
    DoScheduledBgGpuUpdates(battleSystem->bgConfig);

    OS_SetIrqCheckFlag(OS_IE_V_BLANK);
}

typedef struct LinkBattleCommState {
    BattleSetup *battleSetup;
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

static void BattleMain_LinkCommVBlankCallback(void *commState) {
    LinkBattleCommState *linkBattleCommState = commState;

    PaletteData_PushTransparentBuffers(linkBattleCommState->paletteData);
    GF_RunVramTransferTasks();
    DoScheduledBgGpuUpdates(linkBattleCommState->bgConfig);

    OS_SetIrqCheckFlag(OS_IE_V_BLANK);
}

static void SysTask_DrawSprites(SysTask *task, void *inBattleSys) {
    BattleSystem *battleSystem = inBattleSys;

    sub_020399FC(HEAP_ID_BATTLE, battleSystem->bgConfig);

    if (battleSystem->unk23FD == 0 || battleSystem->unk23FD == 3) {
        if (battleSystem->unk23FD == 0) {
            ov06_0221BAF0();
        }

        PokepicManager_DrawAll(battleSystem->pokepicManager);
        SpriteSystem_DrawSprites(battleSystem->gfxHandler);
        SpriteSystem_UpdateTransfer();
        RequestSwap3DBuffers(GX_SORTMODE_MANUAL, GX_BUFFERMODE_Z);
    }
}

static void SysTask_UpdateCriticalHpMusic(SysTask *task, void *inBattleSys) {
    BattleSystem *battleSystem = inBattleSys;
    OpponentData *battlerData;
    BattleHpBar *healthbox;

    int maxBattlers = BattleSystem_GetMaxBattlers(battleSystem);
    int flags = 0;
    int redHPSoundFlag = BattleSystem_GetCriticalHpMusicFlag(battleSystem);

    if (BattleSystem_GetBattleType(battleSystem) & (BATTLE_TYPE_SAFARI | BATTLE_TYPE_PAL_PARK)) {
        return;
    }

    if (redHPSoundFlag & 2) {
        if (redHPSoundFlag & 1) {
            StopSE(0x704, 0);
            BattleSystem_SetCriticalHpMusicFlag(battleSystem, 2);
        }

        return;
    }

    for (int i = 0; i < maxBattlers; i++) {
        battlerData = BattleSystem_GetOpponentData(battleSystem, i);

        if ((ov12_02261264(battlerData) == 0 && (BattleSystem_GetBattleSpecial(battleSystem) & 0x10) == FALSE)
            || (BattleSystem_GetFieldSide(battleSystem, i) == 0 && BattleSystem_GetBattleSpecial(battleSystem) & 0x10)) {
            healthbox = OpponentData_GetHpBar(battlerData);

            if (healthbox != NULL) {
                if (CalculateHpBarColor(healthbox->hp, healthbox->maxHp, 8 * 6) == 1) {
                    flags |= MaskOfFlagNo(i);
                }
            }
        }
    }

    if (flags && BattleSystem_GetCriticalHpMusicFlag(battleSystem) == FALSE) {
        PlaySE(0x704);
        BattleSystem_SetCriticalHpMusicFlag(battleSystem, 1);
        BattleSystem_SetCriticalHpMusicDelay(battleSystem, 4);
    } else if (flags == 0 && BattleSystem_GetCriticalHpMusicFlag(battleSystem)) {
        StopSE(0x704, 0);
        BattleSystem_SetCriticalHpMusicFlag(battleSystem, 0);
    }

    if (BattleSystem_GetCriticalHpMusicFlag(battleSystem)) {
        int delay = BattleSystem_GetCriticalHpMusicDelay(battleSystem);

        if (IsSEPlaying(0x704) == FALSE) {
            if (--delay == 0) {
                PlaySE(0x704);
                BattleSystem_SetCriticalHpMusicDelay(battleSystem, 4);
            } else {
                BattleSystem_SetCriticalHpMusicDelay(battleSystem, delay);
            }
        }
    }
}

static void SysTask_FlyInMessageBox(SysTask *task, void *inBattleSys) {
    BattleSystem *battleSystem = inBattleSys;

    battleSystem->unk2438 += 3;
    BgSetPosTextAndCommit(battleSystem->bgConfig, 1, 3, battleSystem->unk2438);

    if (battleSystem->unk2438 == 0) {
        SysTask_Destroy(task);
    }
}

void NitroStaticInit(void) {
    if (!sub_02039998()) {
        HandleLoadOverlay(FS_OVERLAY_ID(OVY_18), 2);
    }
}

extern GraphicsBanks ov12_0226C080;
extern GraphicsModes ov12_0226BFF8;
extern BgTemplate ov12_0226C044;

static void BattleMain_InitLinkCommScreen(OverlayManager *appMan, BattleSetup *battleSetup) {
    LinkBattleCommState *linkBattleCommState = OverlayManager_CreateAndGetData(appMan, sizeof(LinkBattleCommState), HEAP_ID_BATTLE);

    linkBattleCommState->battleSetup = battleSetup;
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

    int frame = Options_GetFrame(battleSetup->options);

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

    Main_SetVBlankIntrCB(BattleMain_LinkCommVBlankCallback, linkBattleCommState);
    PaletteData_BeginPaletteFade(linkBattleCommState->paletteData, PLTTBUF_MAIN_BG_F | PLTTBUF_MAIN_OBJ_F, 0xFFFF, 0, 16, 0, 0);

    linkBattleCommState->waitDial = WaitingIcon_New(linkBattleCommState->window, 1);

    BattleMain_SetNetworkIconStrength();
}

static BOOL BattleMain_HandleLinkCommHandshake(OverlayManager *appMan) {
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
        if ((linkBattleCommState->battleSetup->battleType & BATTLE_TYPE_FRONTIER) == 0) {
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

static void BattleMain_FreeeLinkCommScreen(OverlayManager *appMan) {
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

static BOOL BattleMain_InitPartnerIntro(OverlayManager *appMan) {
    BattleSystem *battleSystem = OverlayManager_CreateAndGetData(appMan, sizeof(BattleSystem), HEAP_ID_BATTLE);
    BattleSetup *battleSetup = OverlayManager_GetArgs(appMan);
    u8 netID;

    MI_CpuClearFast(battleSystem, sizeof(BattleSystem));
    BattleSystem_New(battleSystem, battleSetup);

    if ((battleSystem->battleType & BATTLE_TYPE_LINK) == FALSE
        || battleSystem->battleSpecial & 0x10
        || battleSystem->battleType & BATTLE_TYPE_FRONTIER) {
        sub_0203A914();
        return FALSE;
    }

    HandleLoadOverlay(FS_OVERLAY_ID(OVY_5), 2);

    if ((battleSystem->battleType & BATTLE_TYPE_MULTI) == FALSE) {
        return FALSE;
    }

    battleSystem->unk1C4 = Heap_Alloc(HEAP_ID_BATTLE, sizeof(TrainerIntroData));
    MI_CpuClearFast(battleSystem->unk1C4, sizeof(TrainerIntroData));
    netID = CommSystem_GetCurNetId();

    switch (sub_020378AC(netID)) {
    case 0:
    case 3:
        battleSystem->unk1C4->party[0] = battleSystem->trainerParty[netID];
        battleSystem->unk1C4->party[2] = battleSystem->trainerParty[BattleSystem_GetBattlerIdPartner(battleSystem, netID)];
        break;
    case 1:
    case 2:
        battleSystem->unk1C4->party[0] = battleSystem->trainerParty[BattleSystem_GetBattlerIdPartner(battleSystem, netID)];
        battleSystem->unk1C4->party[2] = battleSystem->trainerParty[netID];
        break;
    }

    battleSystem->unk1C4->heapID = HEAP_ID_BATTLE;
    battleSystem->unk1C4->mode = 0;

    switch (sub_020378AC(netID)) {
    case 0:
    case 3:
        battleSystem->unk1C4->playerSide = 0;
        break;
    case 1:
    case 2:
        battleSystem->unk1C4->playerSide = 1;
        break;
    }

    ov05_0221BA00(battleSystem->unk1C4);

    return TRUE;
}

static BOOL BattleMain_WaitPartnerIntro(OverlayManager *appMan) {
    BattleSystem *battleSystem = OverlayManager_GetData(appMan);

    if (battleSystem->unk1C4->isDone) {
        for (int i = 0; i < 4; i++) {
            if (battleSystem->unk1C4->trainerNames[i] != NULL) {
                Heap_Free(battleSystem->unk1C4->trainerNames[i]);
            }
        }

        Heap_Free(battleSystem->unk1C4);
        return TRUE;
    }

    return FALSE;
}

static BOOL BattleMain_InitTrainerIntro(OverlayManager *appMan) {
    BattleSystem *battleSystem = OverlayManager_GetData(appMan);
    BattleSetup *battleSetup = OverlayManager_GetArgs(appMan);

    if ((battleSystem->battleType & BATTLE_TYPE_LINK) == FALSE
        || battleSystem->battleSpecial & 0x10
        || battleSystem->battleType & BATTLE_TYPE_FRONTIER) {
        sub_0203A914();
        return FALSE;
    }

    u8 netID = CommSystem_GetCurNetId();
    battleSystem->unk1C4 = Heap_Alloc(HEAP_ID_BATTLE, sizeof(TrainerIntroData));

    MI_CpuClearFast(battleSystem->unk1C4, sizeof(TrainerIntroData));

    if (battleSystem->battleType & BATTLE_TYPE_MULTI) {
        for (int i = 0; i < 4; i++) {
            battleSystem->unk1C4->party[sub_020378AC(i)] = battleSystem->trainerParty[i];
            battleSystem->unk1C4->trainerNames[sub_020378AC(i)] = PlayerProfile_GetPlayerName_NewString(battleSystem->playerProfile[i], HEAP_ID_BATTLE);
        }

        battleSystem->unk1C4->heapID = HEAP_ID_BATTLE;
        battleSystem->unk1C4->mode = 1;
        battleSystem->unk1C4->playerSide = 1;
    } else {
        battleSystem->unk1C4->party[sub_020378AC(netID)] = battleSystem->trainerParty[netID];
        battleSystem->unk1C4->party[sub_020378AC(netID ^ 1)] = battleSystem->trainerParty[netID ^ 1];
        battleSystem->unk1C4->trainerNames[sub_020378AC(netID)] = PlayerProfile_GetPlayerName_NewString(battleSystem->playerProfile[netID], HEAP_ID_BATTLE);
        battleSystem->unk1C4->trainerNames[sub_020378AC(netID ^ 1)] = PlayerProfile_GetPlayerName_NewString(battleSystem->playerProfile[netID ^ 1], HEAP_ID_BATTLE);
        battleSystem->unk1C4->heapID = HEAP_ID_BATTLE;
        battleSystem->unk1C4->mode = 1;
        battleSystem->unk1C4->playerSide = 0;
    }

    ov05_0221BA00(battleSystem->unk1C4);

    return TRUE;
}

static BOOL BattleMain_WaitTrainerIntro(OverlayManager *appMan) {
    BattleSystem *battleSystem = OverlayManager_GetData(appMan);

    if (battleSystem->unk1C4->isDone) {
        for (int i = 0; i < 4; i++) {
            if (battleSystem->unk1C4->trainerNames[i] != NULL) {
                Heap_Free(battleSystem->unk1C4->trainerNames[i]);
            }
        }

        Heap_Free(battleSystem->unk1C4);
        return TRUE;
    }

    return FALSE;
}

static BOOL BattleMain_HandleLinkBattleResult(OverlayManager *appMan) {
    BattleSetup *battleSetup = OverlayManager_GetArgs(appMan);

    if ((battleSetup->battleType & BATTLE_TYPE_LINK) == FALSE
        || battleSetup->battleSpecial & 0x10
        || battleSetup->battleType & BATTLE_TYPE_FRONTIER) {
        return FALSE;
    }

    u8 netID = CommSystem_GetCurNetId();
    HandleLoadOverlay(FS_OVERLAY_ID(OVY_5), 2);
    TrainerIntroData *trainerIntroData = Heap_Alloc(HEAP_ID_BATTLE, sizeof(TrainerIntroData));

    battleSetup->evolutionTaskData = trainerIntroData;
    MI_CpuClearFast(trainerIntroData, sizeof(TrainerIntroData));
    trainerIntroData->battleSetup = battleSetup;

    switch (battleSetup->winFlag) {
    case BATTLE_RESULT_WIN:
        if (!sub_02039998()) {
            GameStats_Inc(battleSetup->gameStats, 22);
        } else {
            GameStats_Inc(battleSetup->gameStats, 27);
        }
        break;
    case BATTLE_RESULT_LOSE:
        if (!sub_02039998()) {
            GameStats_Inc(battleSetup->gameStats, 23);
        } else {
            GameStats_Inc(battleSetup->gameStats, 28);
        }
        break;
    case BATTLE_RESULT_DRAW:
    case BATTLE_RESULT_PLAYER_FLED:
        if (!sub_02039998()) {
            GameStats_Inc(battleSetup->gameStats, 24);
        } else {
            GameStats_Inc(battleSetup->gameStats, 29);
        }
        break;
    }

    if (battleSetup->battleType & BATTLE_TYPE_MULTI) {
        for (int i = 0; i < 4; i++) {
            trainerIntroData->party[sub_020378AC(i)] = battleSetup->party[i];
            trainerIntroData->trainerNames[sub_020378AC(i)] = PlayerProfile_GetPlayerName_NewString(battleSetup->profile[i], HEAP_ID_BATTLE);
        }

        trainerIntroData->heapID = HEAP_ID_BATTLE;
        trainerIntroData->mode = 2;
        trainerIntroData->playerSide = 1;

        if (battleSetup->winFlag != BATTLE_RESULT_PLAYER_FLED) {
            trainerIntroData->battleResult = battleSetup->winFlag;
        } else {
            trainerIntroData->battleResult = 3;
        }
    } else {
        trainerIntroData->party[sub_020378AC(netID)] = battleSetup->party[netID];
        trainerIntroData->party[sub_020378AC(netID ^ 1)] = battleSetup->party[netID ^ 1];
        trainerIntroData->trainerNames[sub_020378AC(netID)] = PlayerProfile_GetPlayerName_NewString(battleSetup->profile[netID], HEAP_ID_BATTLE);
        trainerIntroData->trainerNames[sub_020378AC(netID ^ 1)] = PlayerProfile_GetPlayerName_NewString(battleSetup->profile[netID ^ 1], HEAP_ID_BATTLE);
        trainerIntroData->heapID = HEAP_ID_BATTLE;
        trainerIntroData->mode = 2;
        trainerIntroData->playerSide = 0;

        if (battleSetup->winFlag != BATTLE_RESULT_PLAYER_FLED) {
            trainerIntroData->battleResult = battleSetup->winFlag;
        } else {
            trainerIntroData->battleResult = 3;
        }
    }

    trainerIntroData->recordingType = battleSetup->unk1B2;

    ov05_0221BA00(trainerIntroData);

    return TRUE;
}

static BOOL BattleMain_WaitLinkBattleEnd(OverlayManager *appMan) {
    BattleSetup *battleSetup = OverlayManager_GetArgs(appMan);
    TrainerIntroData *unk1C4 = battleSetup->evolutionTaskData;

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

static void BattleSys_SetRenderControlFlags(BattleSystem *battleSystem) {
    if ((battleSystem->battleType & (BATTLE_TYPE_LINK | BATTLE_TYPE_TUTORIAL))
        || battleSystem->battleSpecial & 0x10) {
        TextFlags_SetAutoScrollParam(1);
        TextFlags_SetCanABSpeedUpPrint(TRUE);
        TextFlags_SetCanTouchSpeedUpPrint(FALSE);
    } else {
        TextFlags_SetAutoScrollParam(3);
        TextFlags_SetCanABSpeedUpPrint(TRUE);
        TextFlags_SetCanTouchSpeedUpPrint(TRUE);
    }
}

static void BattleMain_AssignRecordingRoles(BattleSystem *battleSystem, BattleSetup *battleSetup) {
    int i, j, temp;
    int netIDs[4];
    int versions[4];

    if (battleSystem->battleSpecial & 0x10) {
        battleSystem->unk23FC = 1;
        return;
    }

    for (i = 0; i < 4; i++) {
        netIDs[i] = i;
        versions[i] = battleSetup->filler_17C[i];
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
        battleSystem->unk23FC = 1;
    } else {
        if ((battleSystem->battleType & BATTLE_TYPE_FRONTIER) == FALSE) {
            if (battleSystem->battleType & BATTLE_TYPE_MULTI) {
                temp = sub_020378AC(netID);

                switch (sub_020378AC(netIDs[0])) {
                case 0:
                case 2:
                    if (temp & 1) {
                        battleSystem->battleSpecial |= 0x20;
                    }
                    break;
                case 1:
                case 3:
                    if ((temp & 1) == 0) {
                        battleSystem->battleSpecial |= 0x20;
                    }
                    break;
                }
            } else {
                battleSystem->battleSpecial |= 0x20;
            }
        }
    }
}

static void BattleMain_SetNetworkIconStrength(void) {
    sub_0203A880();

    if (sub_02039998()) {
        sub_0203A930(WM_LINK_LEVEL_3 - DWC_GetLinkLevel());
    } else if (sub_02035650()) {
        sub_0203A930(WM_LINK_LEVEL_3 - WM_GetLinkLevel());
    }
}
