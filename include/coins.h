#ifndef POKEHEARTGOLD_COINS_H
#define POKEHEARTGOLD_COINS_H

#include "global.h"

#define MAX_COINS 50000

/*
 * Initialize the player's coin case
 *
 * @param coins:    Pointer to coin case amount
 */
void Coins_Init(u16 *coins);

/*
 * Gets the amount of coins owned
 *
 * @param coins:    Pointer to coin case amount
 *
 * @returns: The amount of coins owned
 */
u16 Coins_GetValue(u16 *coins);

/*
 * Adds an amount of coins. It will fail if the
 * coin case would overflow.
 *
 * @param coins:    Pointer to coin case amount
 * @param amount:   Number of coins to add
 *
 * @returns: TRUE if success, otherwise FALSE
 */
BOOL Coins_Add(u16 *coins, u16 amount);

/*
 * Checks if a certain amount of coins can be
 * added to the coin case without making it overflow.
 *
 * @param coins:    Pointer to coin case amount
 * @param amount:   Number of coins to add
 *
 * @returns: TRUE if success, otherwise FALSE
 */
BOOL Coins_CanAdd(u16 *coins, u16 amount);

/*
 * Subtracts an amount of coins. It will fail if the
 * coin case would overflow.
 *
 * @param coins:    Pointer to coin case amount
 * @param amount:   Number of coins to subtract
 *
 * @returns: TRUE if success, otherwise FALSE
 */
BOOL Coins_Subtract(u16 *coins, u16 amount);

#endif // POKEHEARTGOLD_COINS_H
