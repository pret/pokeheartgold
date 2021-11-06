#ifndef NNSYS_SND_SNDARC_LOADER_H_
#define NNSYS_SND_SNDARC_LOADER_H_

BOOL NNS_SndArcLoadGroup(int groupNo, NNSSndHeapHandle heap);
BOOL NNS_SndArcLoadSeq(int seqNo, NNSSndHeapHandle heap);
BOOL NNS_SndArcLoadBank(int bankNo, NNSSndHeapHandle heap);
BOOL NNS_SndArcLoadWaveArc(int waveArcNo, NNSSndHeapHandle heap);
BOOL NNS_SndArcLoadSeqEx(int seqNo, u32 loadFlag, NNSSndHeapHandle heap);
BOOL NNS_SndArcLoadBankEx(int bankNo, u32 loadFlag, NNSSndHeapHandle heap);

#endif //NNSYS_SND_SNDARC_LOADER_H_
