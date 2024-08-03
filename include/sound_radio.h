#ifndef POKEHEARTGOLD_SOUND_RADIO_H
#define POKEHEARTGOLD_SOUND_RADIO_H

void SndRadio_Init(NNSSndHeapHandle *heap_p);
BOOL SndRadio_StartSeq(int seqNo);
void SndRadio_StopSeq(int fadeFrame);
int SndRadio_GetSeqNo(void);
void SndRadio_PausePlayer(BOOL flag);
int SndRadio_CountPlayingSeq(void);

#endif // POKEHEARTGOLD_SOUND_RADIO_H
