#include <nitro.h>

void OS_GetLowEntropyData(u32 buffer[8]) {
    const OSSystemWork *work = OS_GetSystemWork();
    const u8 *macAddress = (u8 *)((u32)(work->nvramUserInfo) + ((sizeof(NVRAMConfig) + 3) & ~0x00000003));
    buffer[0] = (GX_GetVCount() << 16) | OS_GetTickLo();
    buffer[1] = (*(u16 *)(macAddress + 4) << 16) ^ OSi_TickCounter;
    buffer[2] = (OSi_TickCounter >> 32) ^ *(u32 *)macAddress ^ work->vblankCount;
#ifdef reg_G3X_GXSTAT
    buffer[2] ^= reg_G3X_GXSTAT;
#endif
    buffer[3] = *(u32 *)(&work->real_time_clock[0]);
    buffer[4] = *(u32 *)(&work->real_time_clock[4]);
    buffer[5] = ((work->mic_sampling_data) << 16) ^ work->mic_last_address;
    buffer[6] = (*(u16 *)(&work->touch_panel[0]) << 16) | *(u16 *)(&work->touch_panel[2]);
    buffer[7] = (work->wm_rssi_pool << 16) | (reg_PAD_KEYINPUT | *(vu16 *)HW_BUTTON_XY_BUF);
}
