#ifndef POKEHEARTGOLD_ASSERT_H
#define POKEHEARTGOLD_ASSERT_H

void GF_AssertFail(void);

#define GF_ASSERT(expr) ((expr) ? (void)0 : GF_AssertFail())

#endif //POKEHEARTGOLD_ASSERT_H
