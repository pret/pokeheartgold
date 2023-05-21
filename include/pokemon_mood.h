#ifndef POKEHEARTGOLD_POKEMON_MOOD_H
#define POKEHEARTGOLD_POKEMON_MOOD_H

#include "pokemon.h"

void ApplyItemEffectOnMonMood(Pokemon *mon, u16 itemId);
void ApplyMonMoodModifier(Pokemon *mon, int modifierId);

#endif //POKEHEARTGOLD_POKEMON_MOOD_H
