#ifndef POKEHEARTGOLD_APRICORN_TREE_H
#define POKEHEARTGOLD_APRICORN_TREE_H

#include "save_misc_data.h"
#include "script.h"

void ApricornTrees_init(APRICORN_TREE *trees);
void sub_0202AE0C(APRICORN_TREE *trees);
void sub_0202AE30(APRICORN_TREE *tree);
u8 sub_0202AE38(const APRICORN_TREE *trees, int idx);
u8 ApricornTrees_TryGetApricorn(const APRICORN_TREE *trees, int idx);
int ApricornTrees_GetApricorn(const APRICORN_TREE *trees, int idx);
void sub_0202AE68(APRICORN_TREE *trees, int idx);
void sub_0202AE74(APRICORN_TREE *trees);
void sub_0202AE74(APRICORN_TREE *trees);

#endif //POKEHEARTGOLD_APRICORN_TREE_H
