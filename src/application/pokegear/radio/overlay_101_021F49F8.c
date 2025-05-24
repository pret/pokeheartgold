#include "global.h"

#include "application/pokegear/radio/radio_internal.h"

#include "font.h"
#include "gf_gfx_loader.h"
#include "sound.h"
#include "unk_0208805C.h"

void ov101_021F4AEC(PokegearRadioAppData *radioApp);
void ov101_021F4BBC(PokegearRadioAppData *radioApp);
void ov101_021F4BC8(PokegearRadioAppData *radioApp);
void ov101_021F4CD8(PokegearRadioAppData *radioApp);
void ov101_021F4CE8(PokegearRadioAppData *radioApp);
void ov101_021F4DC8(PokegearRadioAppData *radioApp);
void ov101_021F4E48(PokegearRadioAppData *radioApp);
void ov101_021F4E6C(PokegearRadioAppData *radioApp);
void ov101_021F4E78(PokegearRadioAppData *radioApp);
void ov101_021F4E84(PokegearRadioAppData *radioApp);
void ov101_021F4EE8(PokegearRadioAppData *radioApp);
void ov101_021F4F00(PokegearRadioAppData *radioApp);

BOOL ov101_021F49F8(PokegearRadioAppData *radioApp) {
    switch (radioApp->unk_08) {
    case 0:
        ov101_021F4AEC(radioApp);
        ov101_021F4BC8(radioApp);
        ov101_021F4DC8(radioApp);
        ov101_021F4E6C(radioApp);
        ov101_021F4CE8(radioApp);
        break;
    case 1:
        ov101_021F4E84(radioApp);
        ov101_021F4F00(radioApp);
        radioApp->pokegear->unk_058 = ov101_021F50D8;
        radioApp->unk_08 = 0;
        return TRUE;
    }

    ++radioApp->unk_08;
    return FALSE;
}

BOOL ov101_021F4A4C(PokegearRadioAppData *radioApp) {
    switch (radioApp->unk_08) {
    case 0:
        if (ov101_021F54AC(radioApp, radioApp->unk_28, radioApp->unk_2A, 0) == 0xFF || radioApp->unk_60->unk_66_3 || radioApp->unk_60->unk_59 == 11) {
            GF_SndStartFadeOutBGM(0, 4);
        } else {
            radioApp->unk_08 = 2;
            break;
        }
        ++radioApp->unk_08;
        break;
    case 1:
        if (GF_SndGetFadeTimer() != 0) {
            break;
        }
        PlayBGM(radioApp->pokegear->args->mapMusicID);
        sub_0203E354();
        ++radioApp->unk_08;
        break;
    case 2:
        radioApp->pokegear->unk_058 = NULL;
        ov101_021F4EE8(radioApp);
        ov101_021F4E78(radioApp);
        ov101_021F4E48(radioApp);
        ov101_021F4CD8(radioApp);
        ov101_021F4BBC(radioApp);
        radioApp->unk_08 = 0;
        return TRUE;
    }

    return FALSE;
}

void ov101_021F4AEC(PokegearRadioAppData *radioApp) {
    GX_SetGraphicsMode(GX_DISPMODE_GRAPHICS, GX_BGMODE_0, GX_BG0_AS_2D);

    {
        extern const BgTemplate ov101_021F87F4[6];
        BgTemplate bgTemplates[6];
        ARRAY_ASSIGN(bgTemplates, ov101_021F87F4);

        InitBgFromTemplateEx(radioApp->pokegear->bgConfig, GF_BG_LYR_MAIN_1, &bgTemplates[0], GF_BG_TYPE_TEXT, FALSE);
        InitBgFromTemplateEx(radioApp->pokegear->bgConfig, GF_BG_LYR_MAIN_2, &bgTemplates[1], GF_BG_TYPE_TEXT, FALSE);
        InitBgFromTemplateEx(radioApp->pokegear->bgConfig, GF_BG_LYR_MAIN_3, &bgTemplates[2], GF_BG_TYPE_TEXT, FALSE);
        InitBgFromTemplateEx(radioApp->pokegear->bgConfig, GF_BG_LYR_SUB_1, &bgTemplates[3], GF_BG_TYPE_TEXT, FALSE);
        InitBgFromTemplateEx(radioApp->pokegear->bgConfig, GF_BG_LYR_SUB_2, &bgTemplates[4], GF_BG_TYPE_TEXT, FALSE);
        InitBgFromTemplateEx(radioApp->pokegear->bgConfig, GF_BG_LYR_SUB_3, &bgTemplates[5], GF_BG_TYPE_TEXT, FALSE);
    }

    for (int i = 0; i < 3; ++i) {
        BgClearTilemapBufferAndCommit(radioApp->pokegear->bgConfig, GF_BG_LYR_MAIN_1 + i);
        BG_ClearCharDataRange(GF_BG_LYR_MAIN_1 + i, 0x20, 0, radioApp->heapId);
        BgClearTilemapBufferAndCommit(radioApp->pokegear->bgConfig, GF_BG_LYR_SUB_1 + i);
        BG_ClearCharDataRange(GF_BG_LYR_SUB_1 + i, 0x20, 0, radioApp->heapId);
    }
}

void ov101_021F4BBC(PokegearRadioAppData *radioApp) {
    ov100_021E5CA4(radioApp->pokegear);
}

void ov101_021F4BC8(PokegearRadioAppData *radioApp) {
    FontID_Alloc(4, radioApp->heapId);
    NARC *narc = NARC_New(NARC_a_1_4_7, radioApp->heapId);
    sub_0208820C(radioApp->pokegear->bgConfig, radioApp->heapId, narc, NARC_a_1_4_7, radioApp->unk_25 + 16, GF_BG_LYR_MAIN_2, 0, 0, 0);
    sub_0208820C(radioApp->pokegear->bgConfig, radioApp->heapId, narc, NARC_a_1_4_7, radioApp->unk_25 + 34, GF_BG_LYR_SUB_3, 0, 0, 0);
    sub_0208820C(radioApp->pokegear->bgConfig, radioApp->heapId, narc, NARC_a_1_4_7, radioApp->unk_25 + 22, GF_BG_LYR_MAIN_2, 1, 0x800, 0);
    sub_0208820C(radioApp->pokegear->bgConfig, radioApp->heapId, narc, NARC_a_1_4_7, radioApp->unk_25 + 28, GF_BG_LYR_MAIN_3, 1, 0x800, 0);
    sub_0208820C(radioApp->pokegear->bgConfig, radioApp->heapId, narc, NARC_a_1_4_7, radioApp->unk_25 + 40, GF_BG_LYR_SUB_3, 1, 0x800, 0);
    radioApp->unk_64 = GfGfxLoader_GetScrnDataFromOpenNarc(narc, radioApp->unk_25 + 22, FALSE, &radioApp->unk_68, radioApp->heapId);
    NARC_Delete(narc);
    ScheduleBgTilemapBufferTransfer(radioApp->pokegear->bgConfig, GF_BG_LYR_MAIN_2);
    ScheduleBgTilemapBufferTransfer(radioApp->pokegear->bgConfig, GF_BG_LYR_SUB_3);
}
