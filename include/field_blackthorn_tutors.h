#ifndef POKEHEARTGOLD_FIELD_BLACKTHORN_TUTORS_H
#define POKEHEARTGOLD_FIELD_BLACKTHORN_TUTORS_H

#include "player_data.h"
#include "pokemon_types_def.h"

struct MoveRelearner {
    POKEMON *pokemon;
    PLAYERPROFILE *profile;
    OPTIONS *options;
    u8 filler_0C[4];
    u16 *eligibleMoves;
    u8 filler_14[5];
    u8 unk_19;
    u8 padding_1A[2];
};

struct MoveRelearner *MoveRelearner_new(HeapID heapId);
void MoveRelearner_delete(struct MoveRelearner *moveRelearner);
u16 *GetEligibleLevelUpMoves(POKEMON *pokemon, HeapID heapId);
BOOL sub_0209186C(const u16 *ptr);

#endif //POKEHEARTGOLD_FIELD_BLACKTHORN_TUTORS_H
