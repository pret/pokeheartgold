#include "system.h"
#include "options.h"
#include "player_data.h"

OPTIONS* Options_new(HeapID heap_id) {
    OPTIONS* ret = AllocFromHeap(heap_id, sizeof(OPTIONS));
    Options_init(ret);
    return ret;
}

void Options_copy(OPTIONS* src, OPTIONS* dest) {
    MI_CpuCopy8(src, dest, sizeof(OPTIONS));
}

void Options_init(OPTIONS* options) {
    MI_CpuClear8(options, sizeof(OPTIONS));

    options->textSpeed = 1;   // mid speed
    options->soundMethod = 0; // stereo
    options->battleStyle = 0; // shift
    options->battleScene = 0; // on
    options->buttonMode = 0;  // normal
    options->frame = 0;       // frame 1
}

void Options_SetButtonModeOnMain(SAVEDATA* savedata, u32 buttonMode) {
    if (savedata != NULL) {
        buttonMode = Options_GetButtonMode(Sav2_PlayerData_GetOptionsAddr(savedata));
    }

    switch (buttonMode) {
        case 1:
            gSystem.buttonMode = 3;
            break;
        case 0:
        default:
            gSystem.buttonMode = 0;
            break;
    }
}

u16 Options_GetTextSpeed(OPTIONS* options) {
    return options->textSpeed;
}

void Options_SetTextSpeed(OPTIONS* options, u32 textSpeed) {
    options->textSpeed = textSpeed;
}

u8 Options_GetTextFrameDelay(OPTIONS* options) {
    u16 textSpeed = Options_GetTextSpeed(options);

    if (textSpeed == 0) {
        return 8;
    }

    if (textSpeed == 1) {
        return 4;
    }

    return 1;
}

u16 Options_GetSoundMethod(OPTIONS* options) {
    return options->soundMethod;
}

void Options_SetSoundMethod(OPTIONS* options, u32 soundMethod) {
    options->soundMethod = soundMethod;
}

u16 Options_GetBattleScene(OPTIONS* options) {
    return options->battleScene;
}

void Options_SetBattleScene(OPTIONS* options, u32 battleScene) {
    options->battleScene = battleScene;
}

u16 Options_GetBattleStyle(OPTIONS* options) {
    return options->battleStyle;
}

void Options_SetBattleStyle(OPTIONS* options, u32 battleStyle) {
    options->battleStyle = battleStyle;
}

u16 Options_GetButtonMode(OPTIONS* options) {
    return options->buttonMode;
}

void Options_SetButtonMode(OPTIONS* options, u32 buttonMode) {
    options->buttonMode = buttonMode;
}

u16 Options_GetFrame(OPTIONS* options) {
    return options->frame;
}

void Options_SetFrame(OPTIONS* options, u32 frame) {
    options->frame = frame;
}
