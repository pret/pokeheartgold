#ifndef POKEHEARTGOLD_TRAINER_MEMO_H
#define POKEHEARTGOLD_TRAINER_MEMO_H

#include "heap.h"
#include "pokemon_types_def.h"

typedef struct Unk0208E614 {
    int unk0;
    String *nature;
    int unk8;
    String *dateLocationMet;
    int unk10;
    String *characteristic;
    int unk18;
    String *flavorPreference;
    int unk20;
    String *eggWatch;
} Unk0208E614;

typedef struct Unk0208E600 {
    HeapID heapId;
    MsgData *msgData;
    MessageFormat *msgFmt;
    Pokemon *mon;
    BOOL isMine;
    Unk0208E614 unk14;
} Unk0208E600;

void MonSetTrainerMemo(Pokemon *mon, PlayerProfile *profile, int strat, int mapsec, HeapID heapId);
void BoxMonSetTrainerMemo(BoxPokemon *boxMon, PlayerProfile *profile, int strat, int mapsec, HeapID heapId);
BOOL MonMetadataMatchesEvent(u8 eventNo, Pokemon *mon, BOOL isMine);
Unk0208E600 *sub_0208E600(Pokemon *a0, int a1, HeapID a2, int a3);
void sub_0208E994(Unk0208E600 *a0);

#endif //POKEHEARTGOLD_TRAINER_MEMO_H
