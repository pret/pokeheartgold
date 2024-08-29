#ifndef POKEHEARTGOLD_COINS_H
#define POKEHEARTGOLD_COINS_H

#include "global.h"

#define MAX_COINS 50000

/*
 * void InitCoins(u16 *coins)
 *
 * Initialize the player's coin case
 *
 * @param coins:       Pointer to coin case amount
 */
void InitCoins(u16 *coins);

/*
 * u16 CheckCoins(u16* coins)
 *
 * Gets the amount of coins owned
 *
 * @param coins:       Pointer to coin case amount
 *
 * @returns: The amount of coins owned
 */
u16 CheckCoins(u16 *coins);

/*
 * BOOL GiveCoins(u16* coins, u16 amount)
 * BOOL CanGiveCoins(u16* coins, u16 amount)
 * BOOL TakeCoins(u16* coins, u16 amount)
 *
 * GiveCoins adds an amount of coins. It will fail if the
 *   coin case would overflow.
 * CanGiveCoins follows the same logic but does not modify
 *   the coin case, instead only reports success or failure.
 * TakeCoins deducts the amount of coins. It will fail if
 *   the coin case would underflow.
 *
 * @param coins:       Pointer to coin case amount
 * @param amount:      Number of coins to adjust by
 *
 * @returns: TRUE if success, otherwise FALSE
 */
BOOL GiveCoins(u16 *coins, u16 amount);
BOOL CanGiveCoins(u16 *coins, u16 amount);
BOOL TakeCoins(u16 *coins, u16 amount);

#endif // POKEHEARTGOLD_COINS_H
