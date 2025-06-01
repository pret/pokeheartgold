#include "global.h"

#include "application/pokegear/map/pokegear_map_internal.h"

#include "unk_02005D10.h"
#include "unk_0200FA24.h"

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
