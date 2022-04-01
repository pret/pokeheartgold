#ifndef POKEHEARTGOLD_OPTIONS_H
#define POKEHEARTGOLD_OPTIONS_H

#include "heap.h"
#include "save.h"

typedef struct OPTIONS {
    u16 textSpeed:4;
    u16 soundMethod:2;
    u16 battleStyle:1;
    u16 battleScene:1;
    u16 buttonMode:2;
    u16 frame:5;
    u16 dummy:1;
} OPTIONS;

OPTIONS* Options_new(HeapID heap_id);
void Options_copy(OPTIONS* src, OPTIONS* dest);
void Options_init(OPTIONS* options);
void Options_SetButtonModeOnMain(SAVEDATA* savedata, u32 buttonMode);
u16 Options_GetTextSpeed(OPTIONS* options);
void Options_SetTextSpeed(OPTIONS* options, u32 textSpeed);
u8 Options_GetTextFrameDelay(OPTIONS* options);
u16 Options_GetSoundMethod(OPTIONS* options);
void Options_SetSoundMethod(OPTIONS* options, u32 soundMethod);
u16 Options_GetBattleScene(OPTIONS* options);
void Options_SetBattleScene(OPTIONS* options, u32 battleScene);
u16 Options_GetBattleStyle(OPTIONS* options);
void Options_SetBattleStyle(OPTIONS* options, u32 battleStyle);
u16 Options_GetButtonMode(OPTIONS* options);
void Options_SetButtonMode(OPTIONS* options, u32 buttonMode);
u16 Options_GetFrame(OPTIONS* options);
void Options_SetFrame(OPTIONS* options, u32 frame);

#endif //POKEHEARTGOLD_OPTIONS_H
