#include "global.h"
#include "brightness.h"
#include <nitro/gx/g2.h>

static BrightnessData sMainScreenBrightnessData;
static BrightnessData sSubScreenBrightnessData;

void DoBrightnessTransitionStep(BrightnessData *brightness) {
    BOOL transitionFinished = FALSE;

    if ((brightness->targetBrightness != brightness->currentBrightness + brightness->transitionDirection * brightness->stepSizeInteger) && brightness->currentBrightness != brightness->targetBrightness) {
        brightness->currentBrightness += brightness->transitionDirection * brightness->stepSizeInteger;
        brightness->fractionalCount += brightness->stepSizeFractional;

        if (brightness->fractionalCount >= brightness->stepCount) {
            brightness->currentBrightness += brightness->transitionDirection;
            if (brightness->currentBrightness != brightness->targetBrightness) {
                brightness->fractionalCount -= brightness->stepCount;
            } else {
                transitionFinished = TRUE;
            }
        }
    } else {
        brightness->currentBrightness = brightness->targetBrightness;
        transitionFinished = TRUE;
    }

    if (brightness->screenMask & SCREEN_MASK_MAIN) {
        G2_SetBlendBrightness(brightness->surfaceMask, brightness->currentBrightness);
    } else if (brightness->screenMask & SCREEN_MASK_SUB) {
        G2S_SetBlendBrightness(brightness->surfaceMask, brightness->currentBrightness);
    }

    if (transitionFinished == TRUE) {
        brightness->transitionActive = FALSE;
    }
}

void InitBrightnessTransition(BrightnessData *brightnessData, u16 stepCount, s16 targetBrightness, s16 startBrightness, GXBlendPlaneMask surfaceMask, u32 screenMask) {
    GF_ASSERT(!brightnessData->transitionActive);

    brightnessData->transitionActive = TRUE;
    brightnessData->surfaceMask = (GXBlendPlaneMask)(u8)surfaceMask;
    brightnessData->screenMask = (u8)screenMask;
    brightnessData->stepCount = stepCount;
    brightnessData->targetBrightness = targetBrightness;
    brightnessData->currentBrightness = startBrightness;
    brightnessData->brightnessDiff = startBrightness - targetBrightness;

    if (brightnessData->brightnessDiff > 0) {
        brightnessData->transitionDirection = -1;
    } else {
        brightnessData->transitionDirection = 1;
        brightnessData->brightnessDiff *= -1;
    }

    brightnessData->stepSizeInteger = brightnessData->brightnessDiff / stepCount;
    brightnessData->stepSizeFractional = brightnessData->brightnessDiff % stepCount;
    brightnessData->fractionalCount = 0;
}

void StartBrightnessTransition(u16 stepCount, s16 targetBrightness, s16 startBrightness, GXBlendPlaneMask surfaceMask, u32 screenMask) {
    if (stepCount != 0) {
        if (screenMask & SCREEN_MASK_MAIN) {
            G2_SetBlendBrightness(surfaceMask, startBrightness);
            InitBrightnessTransition(&sMainScreenBrightnessData, stepCount, targetBrightness, startBrightness, surfaceMask, SCREEN_MASK_MAIN);
        }

        if (screenMask & SCREEN_MASK_SUB) {
            G2S_SetBlendBrightness(surfaceMask, startBrightness);
            InitBrightnessTransition(&sSubScreenBrightnessData, stepCount, targetBrightness, startBrightness, surfaceMask, SCREEN_MASK_SUB);
        }
    }
}

void SetBlendBrightness(fx32 brightness, GXBlendPlaneMask surfaceMask, u32 screenMask) {
    if (screenMask & SCREEN_MASK_MAIN) {
        G2_SetBlendBrightness(surfaceMask, brightness);
    }

    if (screenMask & SCREEN_MASK_SUB) {
        G2S_SetBlendBrightness(surfaceMask, brightness);
    }

    InitScreenBrightnessData(screenMask);
}

void ScreenBrightnessData_InitAll(void) {
    MI_CpuFill8(&sMainScreenBrightnessData, 0, sizeof(BrightnessData));
    MI_CpuFill8(&sSubScreenBrightnessData, 0, sizeof(BrightnessData));

    sMainScreenBrightnessData.transitionActive = FALSE;
    sSubScreenBrightnessData.transitionActive = FALSE;
}

void InitScreenBrightnessData(u32 screenMask) {
    if (screenMask & SCREEN_MASK_MAIN) {
        MI_CpuFill8(&sMainScreenBrightnessData, 0, sizeof(BrightnessData));
        sMainScreenBrightnessData.transitionActive = FALSE;
    }

    if (screenMask & SCREEN_MASK_SUB) {
        MI_CpuFill8(&sSubScreenBrightnessData, 0, sizeof(BrightnessData));
        sSubScreenBrightnessData.transitionActive = FALSE;
    }
}

void DoAllScreenBrightnessTransitionStep(void) {
    if (sMainScreenBrightnessData.transitionActive) {
        DoBrightnessTransitionStep(&sMainScreenBrightnessData);
    }

    if (sSubScreenBrightnessData.transitionActive) {
        DoBrightnessTransitionStep(&sSubScreenBrightnessData);
    }
}

BOOL IsBrightnessTransitionActive(u32 screenMask) {
    if (screenMask == (SCREEN_MASK_MAIN | SCREEN_MASK_SUB)) {
        if (!sMainScreenBrightnessData.transitionActive && !sSubScreenBrightnessData.transitionActive) {
            return TRUE;
        }
    } else if (screenMask == SCREEN_MASK_MAIN) {
        if (!sMainScreenBrightnessData.transitionActive) {
            return TRUE;
        }
    } else if (screenMask == SCREEN_MASK_SUB) {
        if (!sSubScreenBrightnessData.transitionActive) {
            return TRUE;
        }
    }

    return FALSE;
}

void UpdateMainScreenBrightnessSurface(GXBlendPlaneMask mask1, GXBlendPlaneMask mask2) {
    GXBlendPlaneMask mask = (GXBlendPlaneMask)(mask1 | mask2 << 8);
    sMainScreenBrightnessData.surfaceMask = mask;
}
