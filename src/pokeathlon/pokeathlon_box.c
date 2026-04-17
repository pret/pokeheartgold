#include "pokeathlon/pokeathlon_box.h"

#include "font.h"
#include "gf_gfx_planes.h"
#include "heap.h"
#include "obj_char_transfer.h"
#include "obj_pltt_transfer.h"
#include "save_arrays.h"
#include "system.h"
#include "text.h"
#include "unk_0200B150.h"
#include "unk_0200FA24.h"
#include "unk_0203A3B0.h"

// functions in asm:
int sub_020935E0(int);
void sub_02093A40(u32);
void sub_02093354(u32);
u32 sub_020932E0(u32, u32, u32);
void sub_02093440(u32, BgConfig*, PCStorage*, Party*, u32, u32, BOOL, u32, void*, void*, void*, void*, PokeathlonBox*);

extern const GraphicsBanks pokeathlonBoxGraphicsBanks;
extern const GraphicsModes pokeathlonBoxGraphicsModes;
extern const ObjCharTransferTemplate pokeathlonBoxObjCharTransferTemplate;

BOOL PokeathlonBox_Init(OverlayManager *manager) {
    if (ov97_0221E6DC(manager) != FALSE) {
        return TRUE;
    }
    return FALSE;
}

BOOL PokeathlonBox_Main(OverlayManager *manager) {
    PokeathlonBox* data = OverlayManager_GetData(manager);
    
    switch (data->state) {
        case 0:
            data->state = 1;
            break;

        case 1:
            BeginNormalPaletteFade(0, 1, 1, 0, 6, 1, HEAP_ID_POKEATHLON);
            data->state = 2;
            break;

        case 2:
            if (IsPaletteFadeFinished()) {
                data->state = 3;
            }
            break;

        case 3:
            int res = sub_020935E0(data->unk8);
            if (res == 2) {
                data->unk28 = FALSE;
                data->state = 4;
            } else if (res == 3) {
                data->unk28 = TRUE;
                data->state = 4;
            }
            break;

        case 4:
            BeginNormalPaletteFade(0, 0, 0, 0, 6, 1, HEAP_ID_POKEATHLON);
            data->state = 5;
            break;

        case 5:
            if (IsPaletteFadeFinished()) {
                PokeathlonCourseArgs* args = OverlayManager_GetArgs(manager);
                ov97_0221E98C(data, args);
                return TRUE;
            }
            break;
    }

    sub_02093A40(data->unk8);
    ov97_0221F010(data->unkC);
    return FALSE;
}

BOOL PokeathlonBox_Exit(OverlayManager *manager) {
    PokeathlonBox* data = OverlayManager_GetData(manager);

    Main_SetVBlankIntrCB(NULL, NULL);
    ov97_0221F020(data->unkC);
    sub_02093354(data->unk8);
    FontID_Release(2);
    OamManager_Free();
    ObjCharTransfer_Destroy();
    ObjPlttTransfer_Destroy();
    Heap_Free(data->bgConfig);
    Heap_Free(data);

    return TRUE;
}

BOOL ov97_0221E6DC(OverlayManager *manager) {
    PokeathlonCourseArgs* args = OverlayManager_GetArgs(manager);

    do {
        if (ov97_0221E700(manager) != FALSE) {
            return TRUE;
        }
    } while (args->saveData->saveFileExists == 0);

    return FALSE;
}

BOOL ov97_0221E700(OverlayManager *manager) {
    PokeathlonBox* data;
    SaveData* saveData;
    PokeathlonCourseArgs* args;
    
    args = OverlayManager_GetArgs(manager);
    saveData = args->saveData;
    data = OverlayManager_CreateAndGetData(manager, sizeof(PokeathlonBox), HEAP_ID_POKEATHLON);
    
    memset(data, 0, sizeof(PokeathlonBox));

    data->bgConfig = BgConfig_Alloc(HEAP_ID_POKEATHLON);
    data->flashChipDetected = saveData->flashChipDetected;
    data->unk30 = args->field_84;

    PokeathlonBox_SetGraphicsBanks();

    data->unk8 = sub_020932E0(HEAP_ID_POKEATHLON, HEAP_ID_3, 0x13);
    data->unkC = ov97_0221EE84(HEAP_ID_POKEATHLON);
    
    PokeathlonBox_SetGraphicsModes(data->bgConfig);
    PokeathlonBox_SetObjCharTransferTemplate();

    ov97_0221E864(data);

    BOOL r6 = FALSE;
    if (args->saveData->saveFileExists == FALSE) {
        r6 = TRUE;
    }

    // There is an issue here (the cast to `(SaveData*)` makes it obvious it's not correct)
    PCStorage* pcStorage = SaveArray_PCStorage_Get((SaveData*)saveData->flashChipDetected);
    Party* party = SaveArray_Party_Get((SaveData*)saveData->flashChipDetected);
    sub_02093440(data->unk8, data->bgConfig, pcStorage, party, 0, 0, r6, 0x12, &ov97_0221E91C, &ov97_0221E97C, &data->unk10, &ov97_0221EC14, data);

    sub_0203A994(2);
    ov97_0221EEA4(data->unkC, data->bgConfig, (u8) data->unk30, saveData->statusFlagsBytes[3]);
    Main_SetVBlankIntrCB(&ov97_0221E88C, data);
    data->state = 0;

    ResetAllTextPrinters();
    LoadFontPal0(GF_PAL_LOCATION_MAIN_BG, GF_PAL_SLOT_15_OFFSET, HEAP_ID_POKEATHLON);
    FontID_Alloc(2, HEAP_ID_POKEATHLON);

    return TRUE;
}

void PokeathlonBox_SetGraphicsBanks() {
    GraphicsBanks banks = pokeathlonBoxGraphicsBanks;
    GfGfx_SetBanks(&banks);
}

void PokeathlonBox_SetGraphicsModes(BgConfig* bgConfig) {
    GraphicsModes modes = pokeathlonBoxGraphicsModes;
    SetBothScreensModesAndDisable(&modes);
}

void PokeathlonBox_SetObjCharTransferTemplate() {
    ObjCharTransferTemplate template = pokeathlonBoxObjCharTransferTemplate;
    ObjCharTransfer_Init(&template);
    ObjPlttTransfer_Init(0x14, HEAP_ID_POKEATHLON);
    ObjCharTransfer_ClearBuffers();
    ObjPlttTransfer_Reset();
}
