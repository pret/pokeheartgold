#include "global.h"

#include "application/pokegear/map/pokegear_map_internal.h"

#include "gf_gfx_loader.h"
#include "unk_02005D10.h"
#include "unk_0200FA24.h"
#include "unk_0208805C.h"

void ov101_021E8264(PokegearMapAppData *mapApp);
void ov101_021E8354(PokegearMapAppData *mapApp);
void ov101_021E8370(PokegearMapAppData *mapApp, u8 a1);
void ov101_021E84B8(PokegearMapAppData *mapApp);
void ov101_021E84FC(PokegearMapAppData *mapApp);
void ov101_021E857C(PokegearMapAppData *mapApp);
void ov101_021E85A8(PokegearMapAppData *mapApp);
void ov101_021E862C(PokegearMapAppData *mapApp);
void ov101_021E8774(PokegearMapAppData *mapApp);
void ov101_021E8790(PokegearMapAppData *mapApp, u8 a1);
void ov101_021E886C(PokegearMapAppData *mapApp);
void ov101_021E88A8(PokegearMapAppData *mapApp);
void ov101_021E8E20(PokegearMapAppData *mapApp);
void ov101_021E8E34(PokegearMapAppData *mapApp);
void ov101_021E8E3C(PokegearMapAppData *mapApp);
void ov101_021E8E4C(PokegearMapAppData *mapApp);
void ov101_021E8E58(PokegearMapAppData *mapApp);
void ov101_021E90A8(PokegearMapAppData *mapApp);
void ov101_021E9264(PokegearMapAppData *mapApp, int a1);
void ov101_021E933C(PokegearMapAppData *mapApp);
void ov101_021E9FDC(PokegearMapAppData *mapApp, int a1);
BOOL ov101_021EA0D8(PokegearMapAppData *mapApp, int a1);

extern const WindowTemplate ov101_021F7B64[];

BOOL ov101_021E7FF4(PokegearMapAppData *mapApp) {
    switch (mapApp->substate) {
    case 0:
        ov101_021E8264(mapApp);
        break;
    case 1:
        ov101_021E8370(mapApp, mapApp->pokegear->unk_008);
        ov101_021E84FC(mapApp);
        ov101_021E85A8(mapApp);
        break;
    case 2:
        ov101_021E886C(mapApp);
        ov101_021E8790(mapApp, mapApp->pokegear->unk_008);
        ov101_021E8E34(mapApp);
        break;
    case 3:
        if (mapApp->unk_00C == 1) {
            ov101_021E90A8(mapApp);
        } else {
            ov101_021E8E58(mapApp);
        }
        mapApp->pokegear->unk_058 = ov101_021E9270;
        mapApp->substate = 0;
        return TRUE;
    }

    ++mapApp->substate;
    return FALSE;
}

BOOL ov101_021E8070(PokegearMapAppData *mapApp) {
    mapApp->pokegear->unk_058 = NULL;
    if (mapApp->pokegear->appReturnCode == GEAR_RETURN_CANCEL) {
        ov101_021E8774(mapApp);
        ov101_021E8E20(mapApp);
    }
    ov101_021E8E4C(mapApp);
    ov101_021E88A8(mapApp);
    ov101_021E862C(mapApp);
    ov101_021E857C(mapApp);
    ov101_021E84B8(mapApp);
    ov101_021E8354(mapApp);
    return TRUE;
}

BOOL ov101_021E80B4(PokegearMapAppData *mapApp) {
    BOOL r5;
    BOOL r0;

    switch (mapApp->substate) {
    case 0:
        ov101_021E933C(mapApp);
        ov101_021E9D74(mapApp, 1);
        BeginNormalPaletteFade(3, 0, 0, RGB_BLACK, 6, 1, mapApp->heapId);
        break;
    case 1:
        r5 = IsPaletteFadeFinished();
        r0 = ov101_021E9E90(mapApp, 1);
        if (!r5 || !r0) {
            return FALSE;
        }
        ov101_021E8E3C(mapApp);
        break;
    case 2:
        ov101_021E9264(mapApp, 1);
        ov101_021E90A8(mapApp);
        BeginNormalPaletteFade(3, 1, 1, RGB_BLACK, 6, 1, mapApp->heapId);
        ov101_021E9FDC(mapApp, 0);
        break;
    case 3:
        if (!IsPaletteFadeFinished()) {
            return FALSE;
        }
        PlaySE(SEQ_SE_GS_GEARYBUTTON);
        break;
    case 4:
        if (!ov101_021EA0D8(mapApp, 0)) {
            return FALSE;
        }
        mapApp->substate = 0;
        return TRUE;
    }

    ++mapApp->substate;
    return FALSE;
}

BOOL ov101_021E818C(PokegearMapAppData *mapApp) {
    BOOL r5;
    BOOL r0;

    switch (mapApp->substate) {
    case 0:
        ov101_021E9FDC(mapApp, 1);
        PlaySE(SEQ_SE_GS_GEARYBUTTON);
        break;
    case 1:
        if (!ov101_021EA0D8(mapApp, 1)) {
            return FALSE;
        }
        BeginNormalPaletteFade(3, 0, 0, RGB_BLACK, 6, 1, mapApp->heapId);
        break;
    case 2:
        if (!IsPaletteFadeFinished()) {
            return FALSE;
        }
        ov101_021E8774(mapApp);
        ov101_021E8E20(mapApp);
        break;
    case 3:
        ov101_021E9264(mapApp, 0);
        ov101_021E8E58(mapApp);
        ov101_021E9D74(mapApp, 0);
        BeginNormalPaletteFade(3, 1, 1, RGB_BLACK, 6, 1, mapApp->heapId);
        break;
    case 4:
        r5 = IsPaletteFadeFinished();
        r0 = ov101_021E9E90(mapApp, 0);
        if (!r5 || !r0) {
            return FALSE;
        }
        mapApp->substate = 0;
        return TRUE;
    }

    ++mapApp->substate;
    return FALSE;
}

void ov101_021E8264(PokegearMapAppData *mapApp) {
    int i;

    GX_SetGraphicsMode(GX_DISPMODE_GRAPHICS, GX_BGMODE_5, GX_BG0_AS_2D);

    {
        extern const BgTemplate ov101_021F7D10[6];
        BgTemplate bgTemplates[6];
        ARRAY_ASSIGN(bgTemplates, ov101_021F7D10);

        InitBgFromTemplateEx(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_1, &bgTemplates[0], GF_BG_TYPE_TEXT, FALSE);
        InitBgFromTemplateEx(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_2, &bgTemplates[1], GF_BG_TYPE_256x16PLTT, FALSE);
        InitBgFromTemplateEx(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_3, &bgTemplates[2], GF_BG_TYPE_256x16PLTT, FALSE);
        InitBgFromTemplateEx(mapApp->pokegear->bgConfig, GF_BG_LYR_SUB_1, &bgTemplates[3], GF_BG_TYPE_TEXT, FALSE);
        InitBgFromTemplateEx(mapApp->pokegear->bgConfig, GF_BG_LYR_SUB_2, &bgTemplates[4], GF_BG_TYPE_TEXT, FALSE);
        InitBgFromTemplateEx(mapApp->pokegear->bgConfig, GF_BG_LYR_SUB_3, &bgTemplates[5], GF_BG_TYPE_TEXT, FALSE);
    }

    for (i = 0; i < 3; ++i) {
        BgClearTilemapBufferAndCommit(mapApp->pokegear->bgConfig, i + GF_BG_LYR_MAIN_1);
        BG_ClearCharDataRange(i + GF_BG_LYR_MAIN_1, 0x40, 0, mapApp->heapId);
        BgClearTilemapBufferAndCommit(mapApp->pokegear->bgConfig, i + GF_BG_LYR_SUB_1);
        BG_ClearCharDataRange(i + GF_BG_LYR_SUB_1, 0x20, 0, mapApp->heapId);
        BgCommitTilemapBufferToVram(mapApp->pokegear->bgConfig, i + GF_BG_LYR_MAIN_1);
        BgCommitTilemapBufferToVram(mapApp->pokegear->bgConfig, i + GF_BG_LYR_SUB_1);
    }
}

void ov101_021E8354(PokegearMapAppData *mapApp) {
    Pokegear_ClearAppBgLayers(mapApp->pokegear);
    G2_SetBlendAlpha(0, 0, 0, 0);
}

void ov101_021E8370(PokegearMapAppData *mapApp, u8 a1) {
    NARC *narc = NARC_New(NARC_a_1_4_4, mapApp->heapId);
    sub_0208820C(mapApp->pokegear->bgConfig, mapApp->heapId, narc, NARC_a_1_4_4, a1 + 26, GF_BG_LYR_MAIN_1, 0, 0, 0);
    sub_0208820C(mapApp->pokegear->bgConfig, mapApp->heapId, narc, NARC_a_1_4_4, 10, GF_BG_LYR_MAIN_2, 0, 0, 0);
    sub_0208820C(mapApp->pokegear->bgConfig, mapApp->heapId, narc, NARC_a_1_4_4, a1 + 50, GF_BG_LYR_SUB_2, 0, 0, 0);
    sub_0208820C(mapApp->pokegear->bgConfig, mapApp->heapId, narc, NARC_a_1_4_4, 12, GF_BG_LYR_SUB_3, 0, 0, 0);
    mapApp->unk_154[0] = GfGfxLoader_GetScrnDataFromOpenNarc(narc, a1 + 56, FALSE, &mapApp->unk_16C[0], mapApp->heapId);
    mapApp->unk_154[1] = GfGfxLoader_GetScrnDataFromOpenNarc(narc, 11, FALSE, &mapApp->unk_16C[1], mapApp->heapId);
    mapApp->unk_154[2] = GfGfxLoader_GetScrnDataFromOpenNarc(narc, 13, FALSE, &mapApp->unk_16C[2], mapApp->heapId);
    mapApp->unk_154[3] = GfGfxLoader_GetScrnDataFromOpenNarc(narc, a1 + 32, FALSE, &mapApp->unk_16C[3], mapApp->heapId);
    mapApp->unk_154[4] = GfGfxLoader_GetScrnDataFromOpenNarc(narc, a1 + 38, FALSE, &mapApp->unk_16C[4], mapApp->heapId);
    mapApp->unk_154[5] = GfGfxLoader_GetScrnDataFromOpenNarc(narc, a1 + 44, FALSE, &mapApp->unk_16C[5], mapApp->heapId);
    NARC_Delete(narc);
    ScheduleBgTilemapBufferTransfer(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_1);
    ScheduleBgTilemapBufferTransfer(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_2);
}

void ov101_021E84B8(PokegearMapAppData *mapApp) {
    FreeToHeap(mapApp->unk_154[5]);
    FreeToHeap(mapApp->unk_154[4]);
    FreeToHeap(mapApp->unk_154[3]);
    FreeToHeap(mapApp->unk_154[2]);
    FreeToHeap(mapApp->unk_154[1]);
    FreeToHeap(mapApp->unk_154[0]);
}

void ov101_021E84FC(PokegearMapAppData *mapApp) {
    int i;

    for (i = 0; i <= 7; ++i) {
        AddWindowParameterized(mapApp->pokegear->bgConfig, &mapApp->unk_184[i], ov101_021F7B64[i].bgId, ov101_021F7B64[i].left, ov101_021F7B64[i].top, ov101_021F7B64[i].width, ov101_021F7B64[i].height, ov101_021F7B64[i].palette, ov101_021F7B64[i].baseTile);
        FillWindowPixelBuffer(&mapApp->unk_184[i], 0);
    }
    InitWindow(&mapApp->unk_204);
    AddTextWindowTopLeftCorner(mapApp->pokegear->bgConfig, &mapApp->unk_204, 11, 2, 0x3C5, 0);
    FillWindowPixelBufferText_AssumeTileSize32(&mapApp->unk_204, 0);
}

void ov101_021E857C(PokegearMapAppData *mapApp) {
    int i;

    for (i = 0; i < 8; ++i) {
        ClearWindowTilemapAndCopyToVram(&mapApp->unk_184[i]);
        RemoveWindow(&mapApp->unk_184[i]);
    }
    RemoveWindow(&mapApp->unk_204);
}
