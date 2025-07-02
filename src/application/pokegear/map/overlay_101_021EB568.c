#include "global.h"

#include "application/pokegear/map/pokegear_map_internal.h"

#include "unk_02005D10.h"

BOOL ov101_021EB654(PokegearMapAppData *mapApp);
int ov101_021EB818(PokegearMapAppData *mapApp);
int ov101_021EBA44(PokegearMapAppData *mapApp, BOOL *pRetIsTouch);
int ov101_021EC0AC(PokegearMapAppData *mapApp);
int ov101_021EC304(PokegearMapAppData *mapApp);
int ov101_021EC778(PokegearMapAppData *mapApp);

int ov101_021EB568(PokegearMapAppData *mapApp) {
    int ret;

    if ((gSystem.newKeys & PAD_BUTTON_B) && !mapApp->unk_139_2) {
        mapApp->pokegear->cursorInAppSwitchZone = TRUE;
        PokegearAppSwitchCursor_SetCursorSpritesDrawState(mapApp->pokegear->appSwitch, 0, TRUE);
        PokegearAppSwitch_SetSpecIndexAndCursorPos(mapApp->pokegear->appSwitch, 0, ov100_021E5DC8(mapApp->pokegear));
        ov101_021EB2D8(mapApp);
        PlaySE(SEQ_SE_GS_GEARCANCEL);
        return -1;
    }

    ret = ov101_021EB818(mapApp);
    if (ret == 7) {
        return ret;
    }
    ov101_021EC304(mapApp);
    ov101_021EC778(mapApp);
    return -1;
}

int ov101_021EB5DC(PokegearMapAppData *mapApp, BOOL *pRetIsTouch) {
    int ret = -1;

    if (!mapApp->unk_139_3) {
        ret = PokegearApp_HandleTouchInput_SwitchApps(mapApp->pokegear);
    }
    if (ret != -1) {
        *pRetIsTouch = TRUE;
        return ret;
    }
    if (!mapApp->unk_139_3) {
        ret = ov101_021EBA44(mapApp, pRetIsTouch);
        if (*pRetIsTouch && mapApp->pokegear->cursorInAppSwitchZone == TRUE) {
            mapApp->pokegear->cursorInAppSwitchZone = FALSE;
            ov101_021EB2FC(mapApp);
        }
        if (ret == 7) {
            return ret;
        }
        ov101_021EC778(mapApp);
    } else {
        *pRetIsTouch = TRUE;
        ret = ov101_021EC0AC(mapApp);
    }
    return ret;
}

BOOL ov101_021EB654(PokegearMapAppData *mapApp) {
    u8 r4 = 0;
    int r5 = gSystem.heldKeys;
    UnkStruct_ov100_021E6E20_Sub8 *r1 = &mapApp->unk_084->unk_08[5];

    if (r5 & PAD_KEY_UP) {
        if (mapApp->unk_112 > mapApp->unk_104 + 1) {
            --mapApp->unk_112;
            mapApp->unk_13B |= 1;
            r4 = 1;
        }
    } else if (r5 & PAD_KEY_DOWN) {
        if (mapApp->unk_112 < mapApp->unk_106) {
            ++mapApp->unk_112;
            mapApp->unk_13B |= 2;
            r4 = 1;
        }
    }
    if (r5 & PAD_KEY_LEFT) {
        if (mapApp->unk_110 > mapApp->unk_100 + 1) {
            --mapApp->unk_110;
            mapApp->unk_13B |= 4;
            r4 = 1;
        }
    } else if (r5 & PAD_KEY_RIGHT) {
        if (mapApp->unk_110 < mapApp->unk_102 - 1) {
            ++mapApp->unk_110;
            mapApp->unk_13B |= 8;
            r4 = 1;
        }
    }
    if (r4) {
        mapApp->unk_13A = 2;
        mapApp->unk_139_0 = 1;
        mapApp->unk_139_2 = 1;
        mapApp->unk_114 = r1->unk_04;
        return TRUE;
    }
    return FALSE;
}
