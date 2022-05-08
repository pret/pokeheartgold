#ifndef POKEHEARTGOLD_OVERLAY_01_ROCK_SMASH_ITEM_H
#define POKEHEARTGOLD_OVERLAY_01_ROCK_SMASH_ITEM_H

#define ROCK_SMASH_TYPE_DEFAULT       0
#define ROCK_SMASH_TYPE_RUINS_OF_ALPH 1
#define ROCK_SMASH_TYPE_CLIFF_CAVE    2

#define NUM_ROCK_SMASH_TYPE           3

void FieldSys_RockSmashItemCheck(FieldSystem *fsys, int followMonKnowsHm, u16 *itemFound, u16 *item);

#endif //POKEHEARTGOLD_OVERLAY_01_ROCK_SMASH_ITEM_H
