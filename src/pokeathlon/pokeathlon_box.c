#include "pokeathlon/pokeathlon_box.h"

#include "font.h"
#include "gf_gfx_planes.h"
#include "heap.h"
#include "nnsys.h"
#include "obj_char_transfer.h"
#include "obj_pltt_transfer.h"
#include "pokemon.h"
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
void sub_02093594(u32);

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
    sub_02093440(data->unk8, data->bgConfig, pcStorage, party, 0, 0, r6, 0x12, &PokeathlonBox_GetLightBoxMon, &PokeathlonBox_GetBoxName, &data->unk10, &ov97_0221EC14, data);

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

void ov97_0221E864(PokeathlonBox* data) {
    NNS_G2dInitOamManagerModule();
    OamManager_Create(0, 0x7e, 0, 0x20, 1, 0x7e, 0, 0x20, HEAP_ID_POKEATHLON);
}

void ov97_0221E88C(void* data) {
    sub_02093594(((PokeathlonBox*) data)->unk8);
}

BOOL PokeathlonBox_GetBoxMon(PCStorage* storage, u32 boxno, u32 slotno, PokeathlonBox_BoxMon* ptr) {
    BoxPokemon* boxMon = PCStorage_GetMonByIndexPair(storage, boxno, slotno);
    if (GetBoxMonData(boxMon, MON_DATA_SPECIES_EXISTS, NULL) != 0) {
        ptr->species = GetBoxMonData(boxMon, MON_DATA_SPECIES, NULL);
        ptr->personality = GetBoxMonData(boxMon, MON_DATA_PERSONALITY, NULL);
        ptr->isEgg = GetBoxMonData(boxMon, MON_DATA_IS_EGG, NULL);
        ptr->form = GetBoxMonData(boxMon, MON_DATA_FORM, NULL);
        ptr->unkC = 0;
        ptr->unkE = 0;
        GetBoxMonData(boxMon, MON_DATA_NICKNAME, ptr->nickname);
        ptr->isShiny = BoxMonIsShiny(boxMon);
        ptr->gender = GetBoxMonData(boxMon, MON_DATA_GENDER, NULL);
        return TRUE;
    }
    ptr->species = 0;
    ptr->personality = 0;
    ptr->isEgg = 0;
    ptr->form = 0;
    ptr->unkC = 0;
    ptr->unkE = 0;
    ptr->isShiny = 0;
    ptr->gender = 0;
    return FALSE;
}

BOOL PokeathlonBox_GetLightBoxMon(PCStorage* storage, u32 boxno, u32 slotno, PokeathlonBox_BoxMon* ptr) {
    BoxPokemon* boxMon = PCStorage_GetMonByIndexPair(storage, boxno, slotno);
    if (GetBoxMonData(boxMon, MON_DATA_SPECIES_EXISTS, NULL) != 0) {
        ptr->species = GetBoxMonData(boxMon, MON_DATA_SPECIES, NULL);
        ptr->personality = 0;
        ptr->isEgg = GetBoxMonData(boxMon, MON_DATA_IS_EGG, NULL);
        ptr->form = GetBoxMonData(boxMon, MON_DATA_FORM, NULL);
        ptr->unkC = 0;
        ptr->unkE = 0;
        ptr->isShiny = 0;
        ptr->gender = 0;
        return TRUE;
    }
    ptr->species = 0;
    ptr->personality = 0;
    ptr->isEgg = 0;
    ptr->form = 0;
    ptr->unkC = 0;
    ptr->unkE = 0;
    ptr->isShiny = 0;
    ptr->gender = 0;
    return FALSE;
}

void PokeathlonBox_GetBoxName(String *dest, PCStorage *storage, u32 boxno) {
    PCStorage_GetBoxName(storage, boxno, dest);
}
