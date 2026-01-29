#ifndef POKEHEARTGOLD_APRICORN_TREE_H
#define POKEHEARTGOLD_APRICORN_TREE_H

#include "save_misc_data.h"
#include "script.h"

void ApricornTrees_Init(APRICORN_TREE *trees);
void ApricornTrees_SetToDefaultState(APRICORN_TREE *trees);
void ApricornTrees_ResetTree(APRICORN_TREE *tree);
u8 sub_0202AE38(const APRICORN_TREE *trees, int idx);
u8 ApricornTrees_TryGetApricorn(const APRICORN_TREE *trees, int idx);
int ApricornTrees_GetApricorn(const APRICORN_TREE *trees, int idx);
void ApricornTrees_ResetTreeIndex(APRICORN_TREE *trees, int idx);
void ApricornTrees_AwakenTrees(APRICORN_TREE *trees);
void ApricornTrees_AwakenTrees(APRICORN_TREE *trees);

#endif // POKEHEARTGOLD_APRICORN_TREE_H
