#ifndef POKEHEARTGOLD_MOVE_RELEARNER_H
#define POKEHEARTGOLD_MOVE_RELEARNER_H

#include "menu_input_state.h"
#include "player_data.h"
#include "pokemon_types_def.h"

#define MOVE_RELEARNER_TUTOR   0
#define MOVE_RELEARNER_RELEARN 1

typedef struct MoveRelearnerArgs {
    Pokemon *mon;
    PlayerProfile *profile;
    Options *options;
    MenuInputStateMgr *menuInputStatePtr;
    u16 *eligibleMoves;
    u8 filler_14[5];
    u8 type;
    u8 padding_1A[2];
} MoveRelearnerArgs;

MoveRelearnerArgs *MoveRelearner_New(HeapID heapId);
void MoveRelearner_Delete(MoveRelearnerArgs *moveRelearner);
u16 *MoveRelearner_GetEligibleLevelUpMoves(Pokemon *mon, HeapID heapId);
BOOL MoveRelearner_IsValidMove(const u16 *ptr);

#endif // POKEHEARTGOLD_MOVE_RELEARNER_H
