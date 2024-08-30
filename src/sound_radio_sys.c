#include "sound.h"
#include "sound_radio.h"

int sRadioSeqNo         = 0;
NNSSndHandle sSndHandle = { NULL };

static void StopMusic(void) {
    GF_SndStopPlayerField();
    GF_SndStopPlayerBgm();
}

void SndRadio_Init(NNSSndHeapHandle *heap_p) {
    NNS_SndHandleInit(&sSndHandle);
    NNS_SndPlayerSetAllocatableChannel(PLAYER_RADIO, 0xA7FE);
    NNS_SndPlayerSetPlayableSeqCount(PLAYER_RADIO, 1);
    GF_ASSERT(NNS_SndPlayerCreateHeap(PLAYER_RADIO, *heap_p, 0x2EE0) == TRUE);
    sRadioSeqNo = FALSE;
}

BOOL SndRadio_StartSeq(int seqNo) {
    BOOL result;

    StopMusic();
    result = NNS_SndArcPlayerStartSeqEx(&sSndHandle, PLAYER_RADIO, NNS_SndArcGetSeqParam(seqNo)->bankNo, 65, seqNo);
    if (result != TRUE) {
        seqNo = 0;
    }
    sRadioSeqNo = seqNo;
    return result;
}

void SndRadio_StopSeq(int fadeFrame) {
    NNS_SndPlayerStopSeqByPlayerNo(PLAYER_RADIO, fadeFrame);
    sRadioSeqNo = 0;
}

int SndRadio_GetSeqNo(void) {
    return sRadioSeqNo;
}

void SndRadio_PausePlayer(BOOL flag) {
    NNS_SndPlayerPauseByPlayerNo(PLAYER_RADIO, flag);
}

int SndRadio_CountPlayingSeq(void) {
    return NNS_SndPlayerCountPlayingSeqByPlayerNo(PLAYER_RADIO);
}
