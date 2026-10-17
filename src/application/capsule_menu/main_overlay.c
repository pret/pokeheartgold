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
    CapsuleAppManager *data = OverlayManager_CreateAndGetData(manager, sizeof(CapsuleAppManager), HEAP_ID_52);
    memset(data, 0, sizeof(CapsuleAppManager));
    data->unk_000 = OverlayManager_GetArgs(manager);
    data->unk_45C = NARC_New(NARC_a_1_8_0, HEAP_ID_52);
    data->unk_40C = MenuInputStateMgr_GetState(data->unk_000->menuInputStatePtr);
    data->unk_458 = AllocMonZeroed(HEAP_ID_52);
    data->unk_0D4.unk_000 = 0xFF;
    data->unk_448 = 0;
    BOOL r5 = FALSE;
    if (SealCase_CountUniqueSeals(data->unk_000->sealCase) % 8 != 0) {
        r5 = TRUE;
    }
    data->unk_44C = SealCase_CountUniqueSeals(data->unk_000->sealCase) / 8 + r5;
    if (data->unk_44C > 10) {
        data->unk_44C = 10;
    }
    data->unk_3EC = ov57_02237E78(data->unk_000);
    data->unk_3F0 = ov57_02237E78(data->unk_000);
    data->unk_064 = SealCase_inventory_Get(data->unk_000->sealCase);
    for (i = 0; i < MAX_CAPSULES; ++i) {
        BallCapsule *capsule = SealCase_GetCapsuleI(data->unk_000->sealCase, i);
        data->unk_004[i].partyIdx = 0xFF;
        data->unk_004[i].capsule = capsule;
    }
    for (i = 0; i < PARTY_SIZE; ++i) {
        if (data->unk_000->mons[i] == NULL) {
            continue;
        }
        u32 capsule = GetMonData(data->unk_000->mons[i], MON_DATA_BALL_CAPSULE_ID, NULL);
        if (capsule != 0) {
            data->unk_004[capsule - 1].partyIdx = i;
        }
    }
    ov57_02237CA8(HEAP_ID_52);
    ov57_0223BB5C();
    data->unk_258 = ov57_02238B28();
    data->unk_0D4.unk_010 = BgConfig_Alloc(HEAP_ID_52);
    GF_CreateVramTransferManager(0x40, HEAP_ID_52);
    data->unk_0D4.unk_014 = PaletteData_Init(HEAP_ID_52);
    PaletteData_SetAutoTransparent(data->unk_0D4.unk_014, TRUE);
    PaletteData_AllocBuffers(data->unk_0D4.unk_014, PLTTBUF_MAIN_BG, 0x200, HEAP_ID_52);
    PaletteData_AllocBuffers(data->unk_0D4.unk_014, PLTTBUF_SUB_BG, 0x200, HEAP_ID_52);
    PaletteData_AllocBuffers(data->unk_0D4.unk_014, PLTTBUF_MAIN_OBJ, 0x200, HEAP_ID_52);
    PaletteData_AllocBuffers(data->unk_0D4.unk_014, PLTTBUF_SUB_OBJ, 0x200, HEAP_ID_52);
    ov57_02237CEC(data->unk_0D4.unk_010);
    ov57_02238BCC();
    data->unk_0D4.unk_0F0 = PokepicManager_Create(HEAP_ID_52);
    data->unk_284 = sub_02016EDC(HEAP_ID_52, 1, 0);
    u32 frame = Options_GetFrame(data->unk_000->options);
    ov57_022395B8(data->unk_0D4.unk_010, data->unk_0D4.unk_014, frame);
    ov57_02239670(data->unk_0D4.unk_010, data->unk_0D4.unk_014, frame);
    ov57_02239058(&data->unk_0D4);
    EnableTouchPad();
    InitializeTouchPad(4);
    ov57_0223BB84(data);
    Main_SetVBlankIntrCB(ov57_02237E38, data);
    ov57_022386F0(data);
    return TRUE;
}

ov57_02237AF8(OverlayManager *manager, int *state) {
    CapsuleAppManager *data = OverlayManager_GetData(manager);
    if (!ov57_0223A0E0(data)) {
        return TRUE;
    }
    PokepicManager_DrawAll(data->unk_0D4.unk_0F0);
    ov57_02238C0C();
    return FALSE;
}

int ov57_02237B20(OverlayManager *manager, int *state) {
    CapsuleAppManager *data = OverlayManager_GetData(manager);
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG0, GF_PLANE_TOGGLE_OFF);
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG1, GF_PLANE_TOGGLE_OFF);
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG2, GF_PLANE_TOGGLE_OFF);
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG3, GF_PLANE_TOGGLE_OFF);
    GfGfx_EngineBTogglePlanes(GX_PLANEMASK_BG0, GF_PLANE_TOGGLE_OFF);
    GfGfx_EngineBTogglePlanes(GX_PLANEMASK_BG1, GF_PLANE_TOGGLE_OFF);
    GfGfx_EngineBTogglePlanes(GX_PLANEMASK_BG2, GF_PLANE_TOGGLE_OFF);
    GfGfx_EngineBTogglePlanes(GX_PLANEMASK_BG3, GF_PLANE_TOGGLE_OFF);
    FreeBgTilemapBuffer(data->unk_0D4.unk_010, GF_BG_LYR_MAIN_1);
    FreeBgTilemapBuffer(data->unk_0D4.unk_010, GF_BG_LYR_MAIN_2);
    FreeBgTilemapBuffer(data->unk_0D4.unk_010, GF_BG_LYR_MAIN_3);
    FreeBgTilemapBuffer(data->unk_0D4.unk_010, GF_BG_LYR_SUB_0);
    FreeBgTilemapBuffer(data->unk_0D4.unk_010, GF_BG_LYR_SUB_1);
    FreeBgTilemapBuffer(data->unk_0D4.unk_010, GF_BG_LYR_SUB_2);
    FreeBgTilemapBuffer(data->unk_0D4.unk_010, GF_BG_LYR_SUB_3);
    Heap_Free(data->unk_0D4.unk_010);
    PaletteData_FreeBuffers(data->unk_0D4.unk_014, PLTTBUF_MAIN_BG);
    PaletteData_FreeBuffers(data->unk_0D4.unk_014, PLTTBUF_SUB_BG);
    PaletteData_FreeBuffers(data->unk_0D4.unk_014, PLTTBUF_MAIN_OBJ);
    PaletteData_FreeBuffers(data->unk_0D4.unk_014, PLTTBUF_SUB_OBJ);
    PaletteData_Free(data->unk_0D4.unk_014);
    ov57_02237E80(data->unk_000, data->unk_3EC);
    Heap_Free(data->unk_458);
    ov57_022383AC(data);
    TouchHitboxController_Destroy(data->unk_0D4.unk_118);
    PokepicManager_Delete(data->unk_0D4.unk_0F0);
    sub_02016F2C(data->unk_284);
    ov57_02238714(data);
    ov57_022390F4(&data->unk_0D4);
    GF_DestroyVramTransferManager();
    GF_3DVramMan_Delete(data->unk_258);
    ov57_02237CDC(HEAP_ID_52);
    NARC_Delete(data->unk_45C);
    MenuInputStateMgr_SetState(data->unk_000->menuInputStatePtr, data->unk_40C);
    OverlayManager_FreeData(manager);
    DisableTouchPad();
    Heap_Destroy(HEAP_ID_52);
    UnloadOverlayByID(FS_OVERLAY_ID(OVY_6));
    UnloadOverlayByID(FS_OVERLAY_ID(OVY_7));
    return TRUE;
}
