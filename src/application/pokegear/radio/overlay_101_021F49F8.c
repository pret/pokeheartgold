#include "global.h"

#include "application/pokegear/radio/radio_internal.h"

#include "sound.h"

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
