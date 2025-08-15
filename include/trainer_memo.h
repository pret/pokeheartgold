#ifndef POKEHEARTGOLD_TRAINER_MEMO_H
#define POKEHEARTGOLD_TRAINER_MEMO_H

#include "heap.h"
#include "message_format.h"
#include "msgdata.h"
#include "pokemon_types_def.h"

typedef struct MemoNotepadString {
    int line;
    String *string;
} MemoNotepadString;

typedef struct PokemonInfoDisplayStruct {
    HeapID heapID;
    MsgData *msgData;
    MessageFormat *msgFmt;
    Pokemon *mon;
    BOOL isMine;
    MemoNotepadString nature;
    MemoNotepadString metDateAndLocation;
    MemoNotepadString characteristic;
    MemoNotepadString flavorPreference;
    MemoNotepadString eggWatch;
} PokemonInfoDisplayStruct;

void MonSetTrainerMemo(Pokemon *mon, PlayerProfile *profile, int strat, int mapsec, HeapID heapId);
void BoxMonSetTrainerMemo(BoxPokemon *boxMon, PlayerProfile *profile, int strat, int mapsec, HeapID heapId);
BOOL MonMetadataMatchesEvent(u8 eventNo, Pokemon *mon, BOOL isMine);
PokemonInfoDisplayStruct *sub_0208E600(Pokemon *a0, int a1, HeapID a2, int a3);
void sub_0208E994(PokemonInfoDisplayStruct *infoDisplay);

#endif // POKEHEARTGOLD_TRAINER_MEMO_H
