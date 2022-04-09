#ifndef NNS_SND_WAVEOUT_H_
#define NNS_SND_WAVEOUT_H_

#define NNS_SND_WAVEOUT_INVALID_HANDLE 0

#define NNS_SND_WAVEOUT_VOLUME_MIN   0
#define NNS_SND_WAVEOUT_VOLUME_MAX 127

#define NNS_SND_WAVEOUT_PAN_MIN   0
#define NNS_SND_WAVEOUT_PAN_MAX 127

typedef struct NNSSndWaveOut {
    int chNo;
    int sampleRate;
    BOOL activeFlag;
    BOOL startFlag;
    u32 startCommandTag;
} NNSSndWaveOut;

typedef enum NNSSndWaveFormat {
    NNS_SND_WAVE_FORMAT_PCM8,
    NNS_SND_WAVE_FORMAT_PCM16
} NNSSndWaveFormat;

struct NNSSndWaveOut;
typedef struct NNSSndWaveOut* NNSSndWaveOutHandle;

#endif //NNSYS_SND_WAVEOUT_H_
