#include <nitro.h>

BOOL PADi_XYButtonAvailable = FALSE;
// OSAlarm PADi_XYButtonAlarm = {};
extern OSAlarm PADi_XYButtonAlarm;

void PADi_XYButton_Callback(void);

BOOL PAD_InitXYButton(void) {
    if (!OS_IsTickAvailable() || !OS_IsAlarmAvailable()) {
        return FALSE;
    }
    if (PADi_XYButtonAvailable) {
        return FALSE;
    }
    OS_CreateAlarm(&PADi_XYButtonAlarm);
    OS_SetPeriodicAlarm(&PADi_XYButtonAlarm, OS_GetTick() + 2094ll, 2094ll, (OSAlarmHandler)PADi_XYButton_Callback, NULL);
    PADi_XYButtonAvailable = TRUE;
    return TRUE;
}

void PADi_XYButton_Callback(void) {
    u16 rcnt0_h;
    u16 data_r7 = 0;
    EXIi_SelectRcnt(EXI_GPIOIF_GPIO);
    rcnt0_h = reg_EXI_RCNT0_H;
    if (rcnt0_h & REG_EXI_RCNT0_H_DATA_R7_MASK) {
        data_r7 = 0x8000;
    }
    *(u16 *)HW_BUTTON_XY_BUF = data_r7 | ((rcnt0_h & (REG_EXI_RCNT0_H_DATA_R3_MASK | REG_EXI_RCNT0_H_DATA_R1_MASK | REG_EXI_RCNT0_H_DATA_R0_MASK)) << 10);
}
