#ifndef POKEHEARTGOLD_ASSERT_H
#define POKEHEARTGOLD_ASSERT_H

/*
 * Assert statements. If the expression evaluates false,
 * the software will terminate.
 */
#define GF_ASSERT(expr) ((expr) ? (void)0 : GF_AssertFail())

/*
 * void GF_AssertFail(void)
 *
 * Called when an assertion fails.
 * Do not use this directly.
 * Instead, use the GF_ASSERT macro defined above.
 */
void GF_AssertFail(void);

#endif //POKEHEARTGOLD_ASSERT_H
