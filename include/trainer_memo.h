#ifndef POKEHEARTGOLD_TRAINER_MEMO_H
#define POKEHEARTGOLD_TRAINER_MEMO_H

#include "heap.h"
#include "message_format.h"
#include "msgdata.h"
#include "pokemon_types_def.h"

// Each string in the notepad and which line it starts on.
typedef struct MemoNotepad {
    int natureLine;
    String *nature;
    int dateLocationMetLine;
    String *dateLocationMet;
    int characteristicLine;
    String *characteristic;
    int flavorPreferenceLine;
    String *flavorPreference;
    int eggWatchLine;
    String *eggWatch;
} MemoNotepad;

typedef struct Unk0208E600 {
    HeapID heapId;
    MsgData *msgData;
    MessageFormat *msgFmt;
    Pokemon *mon;
    BOOL isMine;
    MemoNotepad notepad;
} Unk0208E600;

void MonSetTrainerMemo(Pokemon *mon, PlayerProfile *profile, int strat, int mapsec, HeapID heapId);
void BoxMonSetTrainerMemo(BoxPokemon *boxMon, PlayerProfile *profile, int strat, int mapsec, HeapID heapId);
BOOL MonMetadataMatchesEvent(u8 eventNo, Pokemon *mon, BOOL isMine);
Unk0208E600 *sub_0208E600(Pokemon *a0, int a1, HeapID a2, int a3);
void sub_0208E994(Unk0208E600 *a0);

#endif // POKEHEARTGOLD_TRAINER_MEMO_H
