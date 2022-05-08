#ifndef NITRO_SND_GLOBAL_H_
#define NITRO_SND_GLOBAL_H_

void SND_Enable(void);
void SND_Shutdown(void);
void SND_BeginSleep(void);
void SND_EndSleep(void);
void SND_SetMasterVolume(u8 volume);
void SND_SetOutputSelector(u8 lout, u8 rout, u8 mix1, u8 mix3);

#ifdef SDK_ARM7
static inline BOOL SND_IsEnabled(void) {
    return (reg_SND_SOUNDCNT_8 & REG_SND_SOUNDCNT_8_E_MASK) ? TRUE : FALSE;
}
#endif //SDK_ARM7

#endif //NITRO_SND_GLOBAL_H_
