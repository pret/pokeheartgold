#include <nitro.h>
#include <nitro/sinit.h>

#include "global.h"

#include "application/capsule_menu/defs.h"

#include "bg_window.h"
#include "gf_3d_vramman.h"
#include "menu_input_state.h"
#include "poke_overlay.h"
#include "pokemon.h"
#include "touch_hitbox_controller.h"
#include "unk_020210A0.h"
#include "vram_transfer_manager.h"

FS_EXTERN_OVERLAY(OVY_6);
FS_EXTERN_OVERLAY(OVY_7);

static void NitroStaticInit(void) {
    HandleLoadOverlay(FS_OVERLAY_ID(OVY_6), OVY_LOAD_ASYNC);
    HandleLoadOverlay(FS_OVERLAY_ID(OVY_7), OVY_LOAD_ASYNC);
}

int CapsuleMenu_Init(OverlayManager *manager, int *state) {
    int i;
    Heap_Create(HEAP_ID_3, HEAP_ID_CAPSULE_MENU, 0x80000);
    CapsuleAppManager *appManager = OverlayManager_CreateAndGetData(manager, sizeof(CapsuleAppManager), HEAP_ID_CAPSULE_MENU);
    memset(appManager, 0, sizeof(CapsuleAppManager));
    appManager->appData = OverlayManager_GetArgs(manager);
    appManager->narc = NARC_New(NARC_a_1_8_0, HEAP_ID_CAPSULE_MENU);
    appManager->menuInputState = MenuInputStateMgr_GetState(appManager->appData->menuInputStatePtr);
    appManager->pokemon = AllocMonZeroed(HEAP_ID_CAPSULE_MENU);
    appManager->graphicsMan.index = 0xFF;
    appManager->sealPages.page = 0;
    BOOL hasPartialPage = FALSE;
    if (SealCase_CountUniqueSeals(appManager->appData->sealCase) % 8 != 0) {
        hasPartialPage = TRUE;
    }
    appManager->sealPages.maxPage = SealCase_CountUniqueSeals(appManager->appData->sealCase) / 8 + hasPartialPage;
    if (appManager->sealPages.maxPage > 10) {
        appManager->sealPages.maxPage = 10;
    }
    appManager->capsuleIndex[0] = CapsuleMenu_GetCapsuleIndex(appManager->appData);
    appManager->capsuleIndex[1] = CapsuleMenu_GetCapsuleIndex(appManager->appData);
    appManager->sealCount = SealCase_inventory_Get(appManager->appData->sealCase);
    for (i = 0; i < MAX_CAPSULES; ++i) {
        BallCapsule *capsule = SealCase_GetCapsuleI(appManager->appData->sealCase, i);
        appManager->capsules[i].partyIdx = 0xFF;
        appManager->capsules[i].capsule = capsule;
    }
    for (i = 0; i < PARTY_SIZE; ++i) {
        if (appManager->appData->mons[i] == NULL) {
            continue;
        }
        u32 capsule = GetMonData(appManager->appData->mons[i], MON_DATA_BALL_CAPSULE_ID, NULL);
        if (capsule != 0) {
            appManager->capsules[capsule - 1].partyIdx = i;
        }
    }
    CapsuleManager_InitGraphicsPlane(HEAP_ID_CAPSULE_MENU);
    CapsuleManager_SetNormalAlpha();
    appManager->graphicsMan.gf3dVramMan = CapsuleGraphics_PipelineInit();
    appManager->graphicsMan.bgConfig = BgConfig_Alloc(HEAP_ID_CAPSULE_MENU);
    GF_CreateVramTransferManager(0x40, HEAP_ID_CAPSULE_MENU);
    appManager->graphicsMan.paletteData = PaletteData_Init(HEAP_ID_CAPSULE_MENU);
    PaletteData_SetAutoTransparent(appManager->graphicsMan.paletteData, TRUE);
    PaletteData_AllocBuffers(appManager->graphicsMan.paletteData, PLTTBUF_MAIN_BG, 0x200, HEAP_ID_CAPSULE_MENU);
    PaletteData_AllocBuffers(appManager->graphicsMan.paletteData, PLTTBUF_SUB_BG, 0x200, HEAP_ID_CAPSULE_MENU);
    PaletteData_AllocBuffers(appManager->graphicsMan.paletteData, PLTTBUF_MAIN_OBJ, 0x200, HEAP_ID_CAPSULE_MENU);
    PaletteData_AllocBuffers(appManager->graphicsMan.paletteData, PLTTBUF_SUB_OBJ, 0x200, HEAP_ID_CAPSULE_MENU);
    CapsuleManager_InitBgConfig(appManager->graphicsMan.bgConfig);
    CapsuleGraphics_AllocTexPlttVram();
    appManager->graphicsMan.pokepicManager = PokepicManager_Create(HEAP_ID_CAPSULE_MENU);
    appManager->graphicsMan.pokepicAnimManager = sub_02016EDC(HEAP_ID_CAPSULE_MENU, 1, 0);
    u32 frame = Options_GetFrame(appManager->appData->options);
    CapsuleGraphics_LoadMainWindow(appManager->graphicsMan.bgConfig, appManager->graphicsMan.paletteData, frame);
    CapsuleGraphics_LoadSubWindow(appManager->graphicsMan.bgConfig, appManager->graphicsMan.paletteData, frame);
    CapsuleGraphics_InitSpriteManager(&appManager->graphicsMan);
    EnableTouchPad();
    InitializeTouchPad(4);
    ov57_0223BB84(appManager);
    Main_SetVBlankIntrCB(CapsuleManager_VBlankCallback, appManager);
    CapsuleGraphics_InitFontOAMManager(appManager);
    return TRUE;
}

int CapsuleMenu_Main(OverlayManager *manager, int *state) {
    CapsuleAppManager *appManager = OverlayManager_GetData(manager);
    if (!CapsuleManager_CallFunction(appManager)) {
        return TRUE;
    }
    PokepicManager_DrawAll(appManager->graphicsMan.pokepicManager);
    CapsuleGraphics_SwapBuffers();
    return FALSE;
}

int CapsuleMenu_Exit(OverlayManager *manager, int *state) {
    CapsuleAppManager *appManager = OverlayManager_GetData(manager);
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG0, GF_PLANE_TOGGLE_OFF);
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG1, GF_PLANE_TOGGLE_OFF);
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG2, GF_PLANE_TOGGLE_OFF);
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG3, GF_PLANE_TOGGLE_OFF);
    GfGfx_EngineBTogglePlanes(GX_PLANEMASK_BG0, GF_PLANE_TOGGLE_OFF);
    GfGfx_EngineBTogglePlanes(GX_PLANEMASK_BG1, GF_PLANE_TOGGLE_OFF);
    GfGfx_EngineBTogglePlanes(GX_PLANEMASK_BG2, GF_PLANE_TOGGLE_OFF);
    GfGfx_EngineBTogglePlanes(GX_PLANEMASK_BG3, GF_PLANE_TOGGLE_OFF);
    FreeBgTilemapBuffer(appManager->graphicsMan.bgConfig, GF_BG_LYR_MAIN_1);
    FreeBgTilemapBuffer(appManager->graphicsMan.bgConfig, GF_BG_LYR_MAIN_2);
    FreeBgTilemapBuffer(appManager->graphicsMan.bgConfig, GF_BG_LYR_MAIN_3);
    FreeBgTilemapBuffer(appManager->graphicsMan.bgConfig, GF_BG_LYR_SUB_0);
    FreeBgTilemapBuffer(appManager->graphicsMan.bgConfig, GF_BG_LYR_SUB_1);
    FreeBgTilemapBuffer(appManager->graphicsMan.bgConfig, GF_BG_LYR_SUB_2);
    FreeBgTilemapBuffer(appManager->graphicsMan.bgConfig, GF_BG_LYR_SUB_3);
    Heap_Free(appManager->graphicsMan.bgConfig);
    PaletteData_FreeBuffers(appManager->graphicsMan.paletteData, PLTTBUF_MAIN_BG);
    PaletteData_FreeBuffers(appManager->graphicsMan.paletteData, PLTTBUF_SUB_BG);
    PaletteData_FreeBuffers(appManager->graphicsMan.paletteData, PLTTBUF_MAIN_OBJ);
    PaletteData_FreeBuffers(appManager->graphicsMan.paletteData, PLTTBUF_SUB_OBJ);
    PaletteData_Free(appManager->graphicsMan.paletteData);
    CapsuleMenu_SetCapsuleIndex(appManager->appData, appManager->capsuleIndex[0]);
    Heap_Free(appManager->pokemon);
    SealPlacement_FreeInactiveSeals(appManager);
    TouchHitboxController_Destroy(appManager->graphicsMan.touchHitboxController);
    PokepicManager_Delete(appManager->graphicsMan.pokepicManager);
    sub_02016F2C(appManager->graphicsMan.pokepicAnimManager);
    CapsuleGraphics_FreeFonts(appManager);
    CapsuleGraphics_FreeSpriteSystem(&appManager->graphicsMan);
    GF_DestroyVramTransferManager();
    GF_3DVramMan_Delete(appManager->graphicsMan.gf3dVramMan);
    CapsuleManager_Deinit(HEAP_ID_CAPSULE_MENU);
    NARC_Delete(appManager->narc);
    MenuInputStateMgr_SetState(appManager->appData->menuInputStatePtr, appManager->menuInputState);
    OverlayManager_FreeData(manager);
    DisableTouchPad();
    Heap_Destroy(HEAP_ID_CAPSULE_MENU);
    UnloadOverlayByID(FS_OVERLAY_ID(OVY_6));
    UnloadOverlayByID(FS_OVERLAY_ID(OVY_7));
    return TRUE;
}

void CapsuleManager_InitGraphicsPlane(enum HeapID heapId) {
    Main_SetVBlankIntrCB(NULL, NULL);
    HBlankInterruptDisable();
    GfGfx_DisableEngineAPlanes();
    GfGfx_DisableEngineBPlanes();
    GX_SetVisiblePlane(GX_PLANEMASK_NONE);
    GXS_SetVisiblePlane(GX_PLANEMASK_NONE);
}

void CapsuleManager_Deinit(enum HeapID heapId) {
    Main_SetVBlankIntrCB(NULL, NULL);
    HBlankInterruptDisable();
}

void CapsuleManager_InitBgConfig(BgConfig *bgConfig) {
    GfGfx_DisableEngineAPlanes();

    GraphicsBanks gxBanks = {
        GX_VRAM_BG_128_A,
        GX_VRAM_BGEXTPLTT_NONE,
        GX_VRAM_SUB_BG_32_H,
        GX_VRAM_SUB_BGEXTPLTT_NONE,
        GX_VRAM_OBJ_64_E,
        GX_VRAM_OBJEXTPLTT_NONE,
        GX_VRAM_SUB_OBJ_16_I,
        GX_VRAM_SUB_OBJEXTPLTT_NONE,
        GX_VRAM_TEX_01_BC,
        GX_VRAM_TEXPLTT_01_FG,
    };
    GfGfx_SetBanks(&gxBanks);

    MI_CpuClear32((void *)HW_BG_VRAM, HW_BG_VRAM_SIZE);
    MI_CpuClear32((void *)HW_DB_BG_VRAM, HW_DB_BG_VRAM_SIZE);
    MI_CpuClear32((void *)HW_OBJ_VRAM, HW_OBJ_VRAM_SIZE);
    MI_CpuClear32((void *)HW_DB_OBJ_VRAM, HW_DB_OBJ_VRAM_SIZE);

    GraphicsModes graphicsModes = {
        GX_DISPMODE_GRAPHICS,
        GX_BGMODE_0,
        GX_BGMODE_0,
        GX_BG0_AS_3D,
    };
    SetBothScreensModesAndDisable(&graphicsModes);

    BgTemplate bgMainTemplates[3] = {
        {
         .x = 0,
         .y = 0,
         .bufferSize = 0x800,
         .baseTile = 0,
         .size = GF_BG_SCR_SIZE_256x256,
         .colorMode = GX_BG_COLORMODE_16,
         .screenBase = GX_BG_SCRBASE_0x0000,
         .charBase = GX_BG_CHARBASE_0x04000,
         .bgExtPltt = GX_BG_EXTPLTT_01,
         .priority = 0,
         .areaOver = 0,
         .mosaic = FALSE,
         },
        {
         .x = 0,
         .y = 0,
         .bufferSize = 0x2000,
         .baseTile = 0,
         .size = GF_BG_SCR_SIZE_256x256,
         .colorMode = GX_BG_COLORMODE_16,
         .screenBase = GX_BG_SCRBASE_0x1000,
         .charBase = GX_BG_CHARBASE_0x0c000,
         .bgExtPltt = GX_BG_EXTPLTT_01,
         .priority = 2,
         .areaOver = 0,
         .mosaic = FALSE,
         },
        {
         .x = 0,
         .y = 0,
         .bufferSize = 0x1000,
         .baseTile = 0,
         .size = GF_BG_SCR_SIZE_256x256,
         .colorMode = GX_BG_COLORMODE_16,
         .screenBase = GX_BG_SCRBASE_0x3000,
         .charBase = GX_BG_CHARBASE_0x10000,
         .bgExtPltt = GX_BG_EXTPLTT_01,
         .priority = 3,
         .areaOver = 0,
         .mosaic = FALSE,
         },
    };
    InitBgFromTemplate(bgConfig, GF_BG_LYR_MAIN_1, &bgMainTemplates[0], GF_BG_TYPE_TEXT);
    InitBgFromTemplate(bgConfig, GF_BG_LYR_MAIN_2, &bgMainTemplates[1], GF_BG_TYPE_TEXT);
    InitBgFromTemplate(bgConfig, GF_BG_LYR_MAIN_3, &bgMainTemplates[2], GF_BG_TYPE_TEXT);
    BgClearTilemapBufferAndCommit(bgConfig, GF_BG_LYR_MAIN_1);
    BgClearTilemapBufferAndCommit(bgConfig, GF_BG_LYR_MAIN_2);
    BgClearTilemapBufferAndCommit(bgConfig, GF_BG_LYR_MAIN_3);
    G2_SetBG0Priority(1);
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG0, GF_PLANE_TOGGLE_ON);

    BgTemplate bgSubTemplates[4] = {
        {
         .x = 0,
         .y = 0,
         .bufferSize = 0x800,
         .baseTile = 0,
         .size = GF_BG_SCR_SIZE_256x256,
         .colorMode = GX_BG_COLORMODE_16,
         .screenBase = GX_BG_SCRBASE_0x6800,
         .charBase = GX_BG_CHARBASE_0x00000,
         .bgExtPltt = GX_BG_EXTPLTT_01,
         .priority = 0,
         .areaOver = 0,
         .mosaic = FALSE,
         },
        {
         .x = 0,
         .y = 0,
         .bufferSize = 0x800,
         .baseTile = 0,
         .size = GF_BG_SCR_SIZE_256x256,
         .colorMode = GX_BG_COLORMODE_16,
         .screenBase = GX_BG_SCRBASE_0x7000,
         .charBase = GX_BG_CHARBASE_0x04000,
         .bgExtPltt = GX_BG_EXTPLTT_01,
         .priority = 2,
         .areaOver = 0,
         .mosaic = FALSE,
         },
        {
         .x = 0,
         .y = 0,
         .bufferSize = 0x800,
         .baseTile = 0,
         .size = GF_BG_SCR_SIZE_256x256,
         .colorMode = GX_BG_COLORMODE_16,
         .screenBase = GX_BG_SCRBASE_0x6000,
         .charBase = GX_BG_CHARBASE_0x00000,
         .bgExtPltt = GX_BG_EXTPLTT_01,
         .priority = 1,
         .areaOver = 0,
         .mosaic = FALSE,
         },
        {
         .x = 0,
         .y = 0,
         .bufferSize = 0x800,
         .baseTile = 0,
         .size = GF_BG_SCR_SIZE_256x256,
         .colorMode = GX_BG_COLORMODE_16,
         .screenBase = GX_BG_SCRBASE_0x7800,
         .charBase = GX_BG_CHARBASE_0x04000,
         .bgExtPltt = GX_BG_EXTPLTT_01,
         .priority = 3,
         .areaOver = 0,
         .mosaic = FALSE,
         },
    };
    InitBgFromTemplate(bgConfig, GF_BG_LYR_SUB_0, &bgSubTemplates[0], GF_BG_TYPE_TEXT);
    InitBgFromTemplate(bgConfig, GF_BG_LYR_SUB_1, &bgSubTemplates[1], GF_BG_TYPE_TEXT);
    InitBgFromTemplate(bgConfig, GF_BG_LYR_SUB_2, &bgSubTemplates[2], GF_BG_TYPE_TEXT);
    InitBgFromTemplate(bgConfig, GF_BG_LYR_SUB_3, &bgSubTemplates[3], GF_BG_TYPE_TEXT);
    BgClearTilemapBufferAndCommit(bgConfig, GF_BG_LYR_SUB_0);
    BgClearTilemapBufferAndCommit(bgConfig, GF_BG_LYR_SUB_1);
    BgClearTilemapBufferAndCommit(bgConfig, GF_BG_LYR_SUB_2);
    BgClearTilemapBufferAndCommit(bgConfig, GF_BG_LYR_SUB_3);
    GfGfx_EngineBTogglePlanes(GX_PLANEMASK_BG2, GF_PLANE_TOGGLE_OFF);
}

void CapsuleManager_VBlankCallback(void *cbArg) {
    CapsuleAppManager *appManager = cbArg;
    PokepicManager_HandleLoadImgAndOrPltt(appManager->graphicsMan.pokepicManager);
    SpriteSystem_TransferOam();
    PaletteData_PushTransparentBuffers(appManager->graphicsMan.paletteData);
    DoScheduledBgGpuUpdates(appManager->graphicsMan.bgConfig);
    GF_RunVramTransferTasks();
    OS_SetIrqCheckFlag(OS_IE_V_BLANK);
}

u8 CapsuleMenu_GetCapsuleIndex(CapsuleAppData *appData) {
    return appData->capsuleIndex;
}

void CapsuleMenu_SetCapsuleIndex(CapsuleAppData *appData, u8 capsuleIndex) {
    appData->capsuleIndex = capsuleIndex;
}

void CapsuleMenu_SetAction(CapsuleAppData *appData, u8 action) {
    appData->action = action;
}
