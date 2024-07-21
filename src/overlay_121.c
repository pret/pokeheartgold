#include "bg_window.h"
#include "font.h"
#include "global.h"
#include "overlay_121.h"
#include "obj_char_transfer.h"
#include "system.h"
#include "unk_02009D48.h"
#include "unk_0200A090.h"
#include "unk_0200ACF0.h"
#include "unk_0200B150.h"
#include "unk_0200FA24.h"
#include "unk_02022588.h"
#include "unk_02023694.h"
#include "unk_0202E4B0.h"
#include "unk_02097D3C.h"
#include "yes_no_prompt.h"

typedef struct Overlay121Appdata {
    BgConfig *unk_000;
    Window unk_004[6];
    u8 filler_064[0x30];
    YesNoPrompt *unk_094;
    SpriteList *unk_098;
    u8 filler_09C[0x128];
    GF_2DGfxResMan *unk_1C4[6];
    GF_2DGfxResObj *unk_1DC;
    GF_2DGfxResObj *unk_1E0;
    u8 filler_1E4[0x48];
    void *unk_22C;
    u8 unk_230;
    u8 filler_231[0x7];
    UnkStruct_0202E4B0 *unk_238[7];
    void *unk_254;
    u8 filler_258[6];
    u8 unk_25E;
} Overlay121AppData;

void ov121_021E5AEC(OVY_MANAGER *man, int *pState);
BOOL ov121_021E5C50(Overlay121AppData *appData);
void ov121_021E5CB4(Overlay121AppData *appData);
void ov121_021E611C(Overlay121AppData *appData);
void ov121_021E6A4C(Overlay121AppData *appData);
BOOL ov121_021E6F78(Overlay121AppData *appData);

BOOL ov121_021E5900(OVY_MANAGER *man, int *pState) {
    ov121_021E5AEC(man, pState);
    return TRUE;
}

BOOL ov121_021E590C(OVY_MANAGER *man, int *pState) {
    Overlay121AppData *appData = OverlayManager_GetData(man);
    switch (appData->unk_230) {
    case 0:
        BeginNormalPaletteFade(0, 1, 1, RGB_BLACK, 6, 1, HEAP_ID_9E);
        appData->unk_230 = 1;
        break;
    case 1:
        if (IsPaletteFadeFinished()) {
            appData->unk_230 = 2;
        }
        break;
    case 2:
        if (ov121_021E5C50(appData)) {
            appData->unk_230 = 3;
        }
        break;
    case 3:
        BeginNormalPaletteFade(0, 0, 0, RGB_BLACK, 6, 1, HEAP_ID_9E);
        appData->unk_230 = 4;
        break;
    case 4:
        if (IsPaletteFadeFinished()) {
            ov121_021E6F78(appData);
            return TRUE;
        }
        break;
    }

    ov121_021E5CB4(appData);
    return FALSE;
}

BOOL ov121_021E59BC(OVY_MANAGER *man, int *pState) {
    Overlay121AppData *appData = OverlayManager_GetData(man);

    gSystem.screensFlipped = FALSE;
    GfGfx_SwapDisplay();
    Main_SetVBlankIntrCB(NULL, NULL);
    G2_BlendNone();
    ov121_021E6A4C(appData);
    RemoveWindow(&appData->unk_004[0]);
    RemoveWindow(&appData->unk_004[1]);
    RemoveWindow(&appData->unk_004[2]);
    RemoveWindow(&appData->unk_004[3]);
    RemoveWindow(&appData->unk_004[4]);
    RemoveWindow(&appData->unk_004[5]);
    FreeBgTilemapBuffer(appData->unk_000, GF_BG_LYR_MAIN_0);
    FreeBgTilemapBuffer(appData->unk_000, GF_BG_LYR_MAIN_1);
    FreeBgTilemapBuffer(appData->unk_000, GF_BG_LYR_MAIN_2);
    FreeBgTilemapBuffer(appData->unk_000, GF_BG_LYR_MAIN_3);
    FreeBgTilemapBuffer(appData->unk_000, GF_BG_LYR_SUB_0);
    ov121_021E611C(appData);
    sub_0200AEB0(appData->unk_1DC);
    sub_0200B0A8(appData->unk_1E0);
    for (int i = 0; i < 6; ++i) {
        Destroy2DGfxResObjMan(appData->unk_1C4[i]);
    }
    SpriteList_Delete(appData->unk_098);
    FontID_Release(4);
    OamManager_Free();
    ObjCharTransfer_Destroy();
    sub_02022608();
    YesNoPrompt_Destroy(appData->unk_094);
    FreeToHeap(appData->unk_22C);
    FreeToHeap(appData->unk_000);
    for (int i = 0; i < appData->unk_25E + 1; ++i) {
        sub_0202EAFC(appData->unk_238[i]);
    }
    FreeToHeap(appData->unk_254);
    FreeToHeap(appData);
    DestroyHeap(HEAP_ID_9E);
    return TRUE;
}
