#ifndef POKEHEARTGOLD_OPTIONS_H
#define POKEHEARTGOLD_OPTIONS_H

#include "heap.h"
#include "save.h"

typedef struct Options {
    u16 textSpeed : 4;
    u16 soundMethod : 2;
    u16 battleStyle : 1;
    u16 battleScene : 1;
    u16 buttonMode : 2;
    u16 frame : 5;
    u16 dummy : 1;
} Options;

Options *Options_New(HeapID heapId);
void Options_Copy(Options *src, Options *dest);
void Options_Init(Options *options);
void Options_SetButtonModeOnMain(SaveData *saveData, u32 buttonMode);
u32 Options_GetTextSpeed(Options *options);
void Options_SetTextSpeed(Options *options, u32 textSpeed);
u8 Options_GetTextFrameDelay(Options *options);
u32 Options_GetSoundMethod(Options *options);
void Options_SetSoundMethod(Options *options, u32 soundMethod);
u32 Options_GetBattleScene(Options *options);
void Options_SetBattleScene(Options *options, u32 battleScene);
u32 Options_GetBattleStyle(Options *options);
void Options_SetBattleStyle(Options *options, u32 battleStyle);
u32 Options_GetButtonMode(Options *options);
void Options_SetButtonMode(Options *options, u32 buttonMode);
u32 Options_GetFrame(Options *options);
void Options_SetFrame(Options *options, u32 frame);

#endif // POKEHEARTGOLD_OPTIONS_H
