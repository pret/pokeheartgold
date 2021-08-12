#ifndef POKEHEARTGOLD_GLOBAL_H
#define POKEHEARTGOLD_GLOBAL_H

#include <nitro.h>

void GF_AssertFail(void);

#define GF_ASSERT(expr) ((expr) ? (void)0 : GF_AssertFail())

#endif //POKEHEARTGOLD_GLOBAL_H
