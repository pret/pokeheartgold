#ifndef POKEHEARTGOLD_FIELD_BLACKTHORN_TUTORS_H
#define POKEHEARTGOLD_FIELD_BLACKTHORN_TUTORS_H

#include "player_data.h"

struct MoveRelearner {
    int unk0;
    PLAYERPROFILE *profile;
    OPTIONS *options;
    u8 filler_0C[4];
    int unk_10;
    u8 filler_14[5];
    u8 unk_19;
    u8 padding_1A[2];
};

#endif //POKEHEARTGOLD_FIELD_BLACKTHORN_TUTORS_H
