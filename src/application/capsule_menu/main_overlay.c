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

int ov57_022378DC(OverlayManager *manager, int *state) {
    int i;
    Heap_Create(HEAP_ID_3, HEAP_ID_52, 0x80000);
    CapsuleAppManager *appManager = OverlayManager_CreateAndGetData(manager, sizeof(CapsuleAppManager), HEAP_ID_52);
    memset(appManager, 0, sizeof(CapsuleAppManager));
    appManager->appData = OverlayManager_GetArgs(manager);
    appManager->narc = NARC_New(NARC_a_1_8_0, HEAP_ID_52);
    appManager->menuInputState = MenuInputStateMgr_GetState(appManager->appData->menuInputStatePtr);
    appManager->pokemon = AllocMonZeroed(HEAP_ID_52);
    appManager->graphicsMan.index = 0xFF;
    appManager->sealPages.page = 0;
    BOOL r5 = FALSE;
    if (SealCase_CountUniqueSeals(appManager->appData->sealCase) % 8 != 0) {
        r5 = TRUE;
    }
    appManager->sealPages.maxPage = SealCase_CountUniqueSeals(appManager->appData->sealCase) / 8 + r5;
    if (appManager->sealPages.maxPage > 10) {
        appManager->sealPages.maxPage = 10;
    }
    appManager->capsuleIndex[0] = ov57_02237E78(appManager->appData);
    appManager->capsuleIndex[1] = ov57_02237E78(appManager->appData);
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
    ov57_02237CA8(HEAP_ID_52);
    ov57_0223BB5C();
    appManager->graphicsMan.gf3dVramMan = ov57_02238B28();
    appManager->graphicsMan.bgConfig = BgConfig_Alloc(HEAP_ID_52);
    GF_CreateVramTransferManager(0x40, HEAP_ID_52);
    appManager->graphicsMan.paletteData = PaletteData_Init(HEAP_ID_52);
    PaletteData_SetAutoTransparent(appManager->graphicsMan.paletteData, TRUE);
    PaletteData_AllocBuffers(appManager->graphicsMan.paletteData, PLTTBUF_MAIN_BG, 0x200, HEAP_ID_52);
    PaletteData_AllocBuffers(appManager->graphicsMan.paletteData, PLTTBUF_SUB_BG, 0x200, HEAP_ID_52);
    PaletteData_AllocBuffers(appManager->graphicsMan.paletteData, PLTTBUF_MAIN_OBJ, 0x200, HEAP_ID_52);
    PaletteData_AllocBuffers(appManager->graphicsMan.paletteData, PLTTBUF_SUB_OBJ, 0x200, HEAP_ID_52);
    ov57_02237CEC(appManager->graphicsMan.bgConfig);
    ov57_02238BCC();
    appManager->graphicsMan.pokepicManager = PokepicManager_Create(HEAP_ID_52);
    appManager->graphicsMan.pokepicAnimManager = sub_02016EDC(HEAP_ID_52, 1, 0);
    u32 frame = Options_GetFrame(appManager->appData->options);
    ov57_022395B8(appManager->graphicsMan.bgConfig, appManager->graphicsMan.paletteData, frame);
    ov57_02239670(appManager->graphicsMan.bgConfig, appManager->graphicsMan.paletteData, frame);
    ov57_02239058(&appManager->graphicsMan);
    EnableTouchPad();
    InitializeTouchPad(4);
    ov57_0223BB84(appManager);
    Main_SetVBlankIntrCB(ov57_02237E38, appManager);
    ov57_022386F0(appManager);
    return TRUE;
}

int ov57_02237AF8(OverlayManager *manager, int *state) {
    CapsuleAppManager *appManager = OverlayManager_GetData(manager);
    if (!ov57_0223A0E0(appManager)) {
        return TRUE;
    }
    PokepicManager_DrawAll(appManager->graphicsMan.pokepicManager);
    ov57_02238C0C();
    return FALSE;
}

int ov57_02237B20(OverlayManager *manager, int *state) {
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
    ov57_02237E80(appManager->appData, appManager->capsuleIndex[0]);
    Heap_Free(appManager->pokemon);
    ov57_022383AC(appManager);
    TouchHitboxController_Destroy(appManager->graphicsMan.touchHitboxController);
    PokepicManager_Delete(appManager->graphicsMan.pokepicManager);
    sub_02016F2C(appManager->graphicsMan.pokepicAnimManager);
    ov57_02238714(appManager);
    ov57_022390F4(&appManager->graphicsMan);
    GF_DestroyVramTransferManager();
    GF_3DVramMan_Delete(appManager->graphicsMan.gf3dVramMan);
    ov57_02237CDC(HEAP_ID_52);
    NARC_Delete(appManager->narc);
    MenuInputStateMgr_SetState(appManager->appData->menuInputStatePtr, appManager->menuInputState);
    OverlayManager_FreeData(manager);
    DisableTouchPad();
    Heap_Destroy(HEAP_ID_52);
    UnloadOverlayByID(FS_OVERLAY_ID(OVY_6));
    UnloadOverlayByID(FS_OVERLAY_ID(OVY_7));
    return TRUE;
}

void ov57_02237CA8(enum HeapID heapId) {
    Main_SetVBlankIntrCB(NULL, NULL);
    HBlankInterruptDisable();
    GfGfx_DisableEngineAPlanes();
    GfGfx_DisableEngineBPlanes();
    GX_SetVisiblePlane(GX_PLANEMASK_NONE);
    GXS_SetVisiblePlane(GX_PLANEMASK_NONE);
}

void ov57_02237CDC(enum HeapID heapId) {
    Main_SetVBlankIntrCB(NULL, NULL);
    HBlankInterruptDisable();
}

void ov57_02237CEC(BgConfig *bgConfig) {
    GfGfx_DisableEngineAPlanes();

    GraphicsBanks sp10 = {
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
    GfGfx_SetBanks(&sp10);

    MI_CpuClear32((void *)HW_BG_VRAM, HW_BG_VRAM_SIZE);
    MI_CpuClear32((void *)HW_DB_BG_VRAM, HW_DB_BG_VRAM_SIZE);
    MI_CpuClear32((void *)HW_OBJ_VRAM, HW_OBJ_VRAM_SIZE);
    MI_CpuClear32((void *)HW_DB_OBJ_VRAM, HW_DB_OBJ_VRAM_SIZE);

    GraphicsModes sp00 = {
        GX_DISPMODE_GRAPHICS,
        GX_BGMODE_0,
        GX_BGMODE_0,
        GX_BG0_AS_3D,
    };
    SetBothScreensModesAndDisable(&sp00);

    BgTemplate spA8[3] = {
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
    InitBgFromTemplate(bgConfig, GF_BG_LYR_MAIN_1, &spA8[0], GF_BG_TYPE_TEXT);
    InitBgFromTemplate(bgConfig, GF_BG_LYR_MAIN_2, &spA8[1], GF_BG_TYPE_TEXT);
    InitBgFromTemplate(bgConfig, GF_BG_LYR_MAIN_3, &spA8[2], GF_BG_TYPE_TEXT);
    BgClearTilemapBufferAndCommit(bgConfig, GF_BG_LYR_MAIN_1);
    BgClearTilemapBufferAndCommit(bgConfig, GF_BG_LYR_MAIN_2);
    BgClearTilemapBufferAndCommit(bgConfig, GF_BG_LYR_MAIN_3);
    G2_SetBG0Priority(1);
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG0, GF_PLANE_TOGGLE_ON);

    BgTemplate sp38[4] = {
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
    InitBgFromTemplate(bgConfig, GF_BG_LYR_SUB_0, &sp38[0], GF_BG_TYPE_TEXT);
    InitBgFromTemplate(bgConfig, GF_BG_LYR_SUB_1, &sp38[1], GF_BG_TYPE_TEXT);
    InitBgFromTemplate(bgConfig, GF_BG_LYR_SUB_2, &sp38[2], GF_BG_TYPE_TEXT);
    InitBgFromTemplate(bgConfig, GF_BG_LYR_SUB_3, &sp38[3], GF_BG_TYPE_TEXT);
    BgClearTilemapBufferAndCommit(bgConfig, GF_BG_LYR_SUB_0);
    BgClearTilemapBufferAndCommit(bgConfig, GF_BG_LYR_SUB_1);
    BgClearTilemapBufferAndCommit(bgConfig, GF_BG_LYR_SUB_2);
    BgClearTilemapBufferAndCommit(bgConfig, GF_BG_LYR_SUB_3);
    GfGfx_EngineBTogglePlanes(GX_PLANEMASK_BG2, GF_PLANE_TOGGLE_OFF);
}

void ov57_02237E38(void *cbArg) {
    CapsuleAppManager *appManager = cbArg;
    PokepicManager_HandleLoadImgAndOrPltt(appManager->graphicsMan.pokepicManager);
    SpriteSystem_TransferOam();
    PaletteData_PushTransparentBuffers(appManager->graphicsMan.paletteData);
    DoScheduledBgGpuUpdates(appManager->graphicsMan.bgConfig);
    GF_RunVramTransferTasks();
    OS_SetIrqCheckFlag(OS_IE_V_BLANK);
}

u8 ov57_02237E78(CapsuleAppData *appData) {
    return appData->unk30;
}

void ov57_02237E80(CapsuleAppData *appData, u8 a1) {
    appData->unk30 = a1;
}

void ov57_02237E88(CapsuleAppData *appData, u8 a1) {
    appData->unk31 = a1;
}
