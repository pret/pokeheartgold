#ifndef NNSYS_SND_WAVEOUT_H_
#define NNSYS_SND_WAVEOUT_H_

typedef enum NNSSndWaveFormat {
    NNS_SND_WAVE_FORMAT_PCM8,
    NNS_SND_WAVE_FORMAT_PCM16
} NNSSndWaveFormat;

struct NNSSndWaveOut;
typedef struct NNSSndWaveOut* NNSSndWaveOutHandle;

#endif //NNSYS_SND_WAVEOUT_H_
