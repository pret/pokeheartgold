#ifndef NITRO_SPI_ARM9_PM_H_
#define NITRO_SPI_ARM9_PM_H_

typedef enum {
    PM_BACKLIGHT_OFF = 0,
    PM_BACKLIGHT_ON = 1
} PMBackLightSwitch;

typedef enum {
    PM_AMP_OFF = 0,
    PM_AMP_ON = 1
} PMAmpSwitch;

typedef enum {
    PM_AMPGAIN_20 = 0,
    PM_AMPGAIN_40 = 1,
    PM_AMPGAIN_80 = 2,
    PM_AMPGAIN_160 = 3,
    PM_AMPGAIN_DEFAULT = PM_AMPGAIN_40
} PMAmpGain;

void PM_Init(void);
u32 PM_SetAmp(PMAmpSwitch sw);
u32 PM_SetAmpGain(PMAmpGain gain);
void PM_GetBackLight(PMBackLightSwitch *top, PMBackLightSwitch *bottom);

#endif //NITRO_SPI_ARM9_PM_H_
