#ifndef POKEHEARTGOLD_MOVE_RELEARNER_H
#define POKEHEARTGOLD_MOVE_RELEARNER_H

#include "player_data.h"
#include "pokemon_types_def.h"

typedef struct MoveRelearner {
    Pokemon *mon;
    PlayerProfile *profile;
    Options *options;
    u8 filler_0C[4];
    u16 *eligibleMoves;
    u8 filler_14[5];
    u8 unk_19;
    u8 padding_1A[2];
} MoveRelearner;

MoveRelearner *MoveRelearner_New(HeapID heapId);
void MoveRelearner_Delete(MoveRelearner *moveRelearner);
u16 *MoveRelearner_GetEligibleLevelUpMoves(Pokemon *mon, HeapID heapId);
BOOL MoveRelearner_IsValidMove(const u16 *ptr);

#endif //POKEHEARTGOLD_MOVE_RELEARNER_H
