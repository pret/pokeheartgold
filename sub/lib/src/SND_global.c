#include <nitro.h>

extern void SVC_SetSoundBias(int mask);
extern void SVC_ResetSoundBias(int mask);

void SND_Enable(void) {
    reg_SND_SOUNDCNT_8 |= REG_SND_SOUNDCNT_8_E_MASK;
}

void SND_Shutdown(void) {
    int i;

    reg_SND_SOUNDCNT_8 &= ~REG_SND_SOUNDCNT_8_E_MASK;
    for (i = 0; i < SND_CHANNEL_NUM; i++) {
        SND_StopChannel(i, 1);
    }
    reg_SND_SNDCAP0CNT = 0;
    reg_SND_SNDCAP1CNT = 0;
}

void SND_BeginSleep(void) {
    reg_SND_SOUNDCNT_8 &= ~REG_SND_SOUNDCNT_8_E_MASK;
    SVC_ResetSoundBias(0x80);
    OS_SpinWait(0x40000);
    PMi_ResetControl(1);
    reg_SND_POWCNT &= ~REG_SND_POWCNT_SPE_MASK;
}

void SND_EndSleep(void) {
    reg_SND_POWCNT |= REG_SND_POWCNT_SPE_MASK;
    PMi_SetControl(1);
    SVC_SetSoundBias(0x100);
    OS_SpinWait(0x7AB80);
    reg_SND_SOUNDCNT_8 |= REG_SND_SOUNDCNT_8_E_MASK;
}

void SND_SetMasterVolume(u8 volume) {
    reg_SND_SOUNDCNT_VOL = volume;
}

void SND_SetOutputSelector(u8 lout, u8 rout, u8 mix1, u8 mix3) {
    BOOL isEnabled = SND_IsEnabled();
    reg_SND_SOUNDCNT_8 = REG_SND_SOUNDCNT_8_FIELD(
        isEnabled,
        mix3,
        mix1,
        rout,
        lout
    );
}
