#include "overlay_57.h"

#include "bg_window.h"
#include "gf_3d_vramman.h"
#include "menu_input_state.h"
#include "poke_overlay.h"
#include "pokemon.h"
#include "touchscreen_list_menu.h"
#include "unk_020210A0.h"
#include "vram_transfer_manager.h"

FS_EXTERN_OVERLAY(OVY_6);
FS_EXTERN_OVERLAY(OVY_7);

typedef struct Overlay57Data_Sub004 {
    int partyIdx;
    CAPSULE *capsule;
} Overlay57Data_Sub004;

typedef struct Overlay57Data_Sub0D4 {
    int unk_000;
    u8 filler_004[4];
    SpriteSystem *unk_008;
    SpriteManager *unk_00C;
    BgConfig *unk_010;
    PaletteData *unk_014;
    u8 filler_018[0xD8];
    PokepicManager *unk_0F0;
    u8 filler_0F4[0x80];
    TouchscreenListMenuSpawner *unk_174;
} Overlay57Data_Sub0D4;

typedef struct Overlay57Data {
    UnkStruct_0206B984 *unk_000;
    Overlay57Data_Sub004 unk_004[MAX_CAPSULES];
    SEALBAG *unk_064;
    u8 filler_068[0x6C];
    Overlay57Data_Sub0D4 unk_0D4;
    u8 filler_24C[12];
    GF3DVramMan *unk_258;
    u8 filler_25C[0x28];
    void *unk_284;
    u8 filler_288[0x164];
    int unk_3EC;
    int unk_3F0;
    u8 filler_3F4[0x18];
    MenuInputState unk_40C;
    u8 filler_410[0x38];
    int unk_448;
    int unk_44C;
    u8 filler_450[8];
    Pokemon *unk_458;
    NARC *unk_45C;
} Overlay57Data; // size: 0x460

void ov57_022378C0(void);
void ov57_02237CA8(enum HeapID heapId);
void ov57_02237CEC(BgConfig *bgConfig);
u8 ov57_02237E78(UnkStruct_0206B984 *a0);
void ov57_02237E38(void *cbArg);
void ov57_022386F0(Overlay57Data *data);
GF3DVramMan *ov57_02238B28(void);
void ov57_02238BCC(void);
void ov57_02239058(Overlay57Data_Sub0D4 *a0);
void ov57_022395B8(BgConfig *bgConfig, PaletteData *plttData, u32 frame);
void ov57_02239670(BgConfig *bgConfig, PaletteData *plttData, u32 frame);
void ov57_0223BB5C(void);
void ov57_0223BB84(Overlay57Data *data);

void ov57_022378C0(void) {
    HandleLoadOverlay(FS_OVERLAY_ID(OVY_6), OVY_LOAD_ASYNC);
    HandleLoadOverlay(FS_OVERLAY_ID(OVY_7), OVY_LOAD_ASYNC);
}

int ov57_022378DC(OverlayManager *manager, int *state) {
    int i;
    Heap_Create(HEAP_ID_3, HEAP_ID_52, 0x80000);
    Overlay57Data *data = OverlayManager_CreateAndGetData(manager, sizeof(Overlay57Data), HEAP_ID_52);
    memset(data, 0, sizeof(Overlay57Data));
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
        CAPSULE *capsule = SealCase_GetCapsuleI(data->unk_000->sealCase, i);
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
