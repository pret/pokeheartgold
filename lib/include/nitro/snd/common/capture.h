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

void SND_SetupCapture(int idx, int format, void *captureData, int size, BOOL loop, int capCtrlSrc, int capCtrlDst);
BOOL SND_IsCaptureActive(int idx);

#endif //NITRO_SND_COMMON_CAPTURE_H_
