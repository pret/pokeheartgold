#ifndef NITRO_SND_COMMON_CAPTURE_H_
#define NITRO_SND_COMMON_CAPTURE_H_

typedef enum {
    SND_CAPTURE_0,
    SND_CAPTURE_1
} SNDCapture;

typedef enum {
    SND_CAPTURE_FORMAT_PCM16,
    SND_CAPTURE_FORMAT_PCM8
} SNDCaptureFormat;

typedef enum {
    SND_CAPTURE_REPEAT_YES,
    SND_CAPTURE_REPEAT_NO
} SNDCaptureRepeat;

typedef enum {
    SND_CAPTURE_IN_MIXER,
    SND_CAPTURE_IN_CHANNEL,

    SND_CAPTURE_IN_MIXER_L = SND_CAPTURE_IN_MIXER,
    SND_CAPTURE_IN_MIXER_R = SND_CAPTURE_IN_MIXER,
    SND_CAPTURE_IN_CHANNEL0 = SND_CAPTURE_IN_CHANNEL,
    SND_CAPTURE_IN_CHANNEL2 = SND_CAPTURE_IN_CHANNEL
} SNDCaptureIn;

typedef enum {
    SND_CAPTURE_OUT_NORMAL,
    SND_CAPTURE_OUT_CHANNEL_MIX,

    SND_CAPTURE_OUT_CHANNEL0_MIX = SND_CAPTURE_OUT_CHANNEL_MIX,
    SND_CAPTURE_OUT_CHANNEL2_MIX = SND_CAPTURE_OUT_CHANNEL_MIX
} SNDCaptureOut;

void SND_SetupCapture(int idx, int format, void *captureData, int size, BOOL loop, int capCtrlSrc, int capCtrlDst);
BOOL SND_IsCaptureActive(int idx);

#ifdef SDK_ARM7
static inline void SND_StartCapture(SNDCapture capture) {
    REGType8v *reg = (REGType8v *)(REG_SNDCAP0CNT_ADDR + capture);

    *reg |= REG_SND_SNDCAP0CNT_E_MASK;
}

static inline void SND_StartCaptureBoth(void) {
    reg_SND_SNDCAPCNT |= REG_SND_SNDCAPCNT_CAP0_E_MASK | REG_SND_SNDCAPCNT_CAP1_E_MASK;
}

static inline void SND_StopCapture(SNDCapture capture) {
    (*(REGType8v *)(REG_SNDCAP0CNT_ADDR + capture)) = 0;
}
#endif //SDK_ARM7

#endif //NITRO_SND_COMMON_CAPTURE_H_
