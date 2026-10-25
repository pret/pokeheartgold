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

ov57_02237AF8(OverlayManager *manager, int *state) {
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
