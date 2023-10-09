#ifndef POKEHEARTGOLD_FIELD_BLACKTHORN_TUTORS_H
#define POKEHEARTGOLD_FIELD_BLACKTHORN_TUTORS_H

#include "player_data.h"
#include "pokemon_types_def.h"
typedef struct MoveRelearnerAppArgs { //todo: move to unk_0203E348? rename to MoveRelearnerAppData?
    Pokemon *mon;
    PlayerProfile *profile;
    Options *options;
    u32 *unkC;
    u16 *eligibleMoves;
    u8 filler_14[5];
    u8 unk_19;
    u8 padding_1A[2];
} MoveRelearnerAppArgs;

struct MoveRelearnerAppArgs *MoveRelearner_New(HeapID heapId);
void MoveRelearner_Delete(struct MoveRelearnerAppArgs *moveRelearner);
u16 *GetEligibleLevelUpMoves(Pokemon *mon, HeapID heapId);
BOOL sub_0209186C(const u16 *ptr);

#endif //POKEHEARTGOLD_FIELD_BLACKTHORN_TUTORS_H
