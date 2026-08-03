#ifndef POKEHEARTGOLD_SCREEN_FADE_H
#define POKEHEARTGOLD_SCREEN_FADE_H

#include "heap.h"

enum FadeMode {
    FADE_BOTH_SCREENS = 0,
    FADE_MAIN_THEN_SUB,
    FADE_SUB_THEN_MAIN,
    FADE_MAIN_ONLY,
    FADE_SUB_ONLY,
};

enum FadeType {
    FADE_TYPE_BRIGHTNESS_OUT = 0,
    FADE_TYPE_BRIGHTNESS_IN,
    FADE_TYPE_DOWNWARD_OUT,
    FADE_TYPE_DOWNWARD_IN,
    FADE_TYPE_UPWARD_OUT,
    FADE_TYPE_UNK_5, // Used in intro movie scene 5.
    FADE_TYPE_UNK_6,
    FADE_TYPE_UNK_7,
    FADE_TYPE_UNK_8,       // Used for camera shutter out.
    FADE_TYPE_UNK_9,       // Used for camera shutter in.
    FADE_TYPE_UNK_20 = 20, // Used in Voltorb Flip.
    FADE_TYPE_UNK_21,
    FADE_TYPE_UNK_43 = 43,
};

void BeginNormalPaletteFade(enum FadeMode fadeMode, enum FadeType typeMain, enum FadeType typeSub, u16 color, int steps, int framesPerStep, enum HeapID heapID);
void HandleFadeUpdateFrame(void);
BOOL IsPaletteFadeFinished(void);
void sub_0200FB70(void);
void ResetVisibleHardwareWindows(PMLCDTarget screen);
void SetMasterBrightnessNeutral(PMLCDTarget screen);
void sub_0200FBF4(PMLCDTarget screen, u16 color);

#endif // POKEHEARTGOLD_SCREEN_FADE_H
