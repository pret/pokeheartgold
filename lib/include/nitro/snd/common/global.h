#ifndef NITRO_SND_GLOBAL_H_
#define NITRO_SND_GLOBAL_H_

typedef enum SNDChannelOut {
    SND_CHANNEL_OUT_MIXER,
    SND_CHANNEL_OUT_BYPASS
} SNDChannelOut;

typedef enum SNDOutput {
    SND_OUTPUT_MIXER,
    SND_OUTPUT_CHANNEL1,
    SND_OUTPUT_CHANNEL3,
    SND_OUTPUT_CHANNEL1_3
} SNDOutput;

void SND_Enable(void);
void SND_Shutdown(void);
void SND_BeginSleep(void);
void SND_EndSleep(void);
void SND_SetMasterVolume(int volume);
void SND_SetOutputSelector(SNDOutput left, SNDOutput right, SNDChannelOut channel1, SNDChannelOut channel3);

#ifdef SDK_ARM7
static inline BOOL SND_IsEnabled(void) {
    return (reg_SND_SOUNDCNT_8 & REG_SND_SOUNDCNT_8_E_MASK) ? TRUE : FALSE;
}
#endif //SDK_ARM7

#endif //NITRO_SND_GLOBAL_H_
