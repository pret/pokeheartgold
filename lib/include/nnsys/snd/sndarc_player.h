#ifndef NNSYS_SND_SNDARC_PLAYER_H_
#define NNSYS_SND_SNDARC_PLAYER_H_

struct NNSSndHandle;

BOOL NNS_SndArcPlayerSetup(NNSSndHeapHandle heap);
BOOL NNS_SndArcPlayerStartSeqEx(struct NNSSndHandle* handle, int playerNo, int bankNo, int playerPrio, int seqNo);

#endif //NNSYS_SND_SNDARC_PLAYER_H_
