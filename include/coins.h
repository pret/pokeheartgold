#ifndef POKEHEARTGOLD_COINS_H
#define POKEHEARTGOLD_COINS_H

#define MAX_COINS 50000

void InitCoins(u16* coins);
u16 CheckCoins(u16* coins);
BOOL GiveCoins(u16* coins, u16 amount);
BOOL CanGiveCoins(u16* coins, u16 amount);
BOOL TakeCoins(u16* coins, u16 amount);

#endif
