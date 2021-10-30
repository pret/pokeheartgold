#ifndef GUARD_PLAYER_H
#define GUARD_PLAYER_H

typedef struct NNSSndHandle
{
    struct NNSSndSeqPlayer* player;
} NNSSndHandle;

void NNS_SndHandleInit(NNSSndHandle *handle);
void NNS_SndHandleReleaseSeq(NNSSndHandle *handle);
void NNS_SndPlayerStopSeqByPlayerNo(int playerNo, int fadeFrame);
void NNS_SndPlayerSetAllocatableChannel(int playerNo, u32 chBitFlag);
void NNS_SndPlayerSetPlayableSeqCount(int playerNo, int seqCount);
BOOL NNS_SndPlayerCreateHeap(int playerNo, NNSSndHeapHandle heap, u32 size);
void NNS_SndPlayerPauseByPlayerNo(int playerNo, BOOL flag);
int NNS_SndPlayerCountPlayingSeqByPlayerNo(int playerNo);

#endif //GUARD_PLAYER_H
