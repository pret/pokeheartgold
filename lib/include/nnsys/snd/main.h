#ifndef NNSYS_SND_MAIN_H_
#define NNSYS_SND_MAIN_H_

void NNS_SndInit(void);
void NNS_SndMain(void);
BOOL NNS_SndUpdateDriverInfo(void);
BOOL NNS_SndReadDriverChannelInfo(int chNo, SNDChannelInfo* info);
BOOL NNS_SndPlayerReadDriverTrackInfo(NNSSndHandle* handle, int trackNo, struct SNDTrackInfo* info);

#endif //NNSYS_SND_MAIN_H_
