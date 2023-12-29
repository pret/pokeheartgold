#ifndef POKEHEARTGOLD_FIELD_BLACKTHORN_TUTORS_H
#define POKEHEARTGOLD_FIELD_BLACKTHORN_TUTORS_H

#include "player_data.h"
#include "pokemon_types_def.h"

#define MOVE_RELEARNER_TUTOR    0
#define MOVE_RELEARNER_RELEARN  1

typedef struct MoveRelearnerArgs { //todo: move to unk_0203E348?
    Pokemon *mon;
    PlayerProfile *profile;
    Options *options;
    u32 *unkC;
    u16 *eligibleMoves;
    u8 filler_14[5];
    u8 type;
    u8 padding_1A[2];
} MoveRelearnerArgs;

struct MoveRelearnerArgs *MoveRelearner_New(HeapID heapId);
void MoveRelearner_Delete(struct MoveRelearnerArgs *moveRelearner);
u16 *GetEligibleLevelUpMoves(Pokemon *mon, HeapID heapId);
BOOL sub_0209186C(const u16 *ptr);

#endif //POKEHEARTGOLD_FIELD_BLACKTHORN_TUTORS_H
