#ifndef POKEHEARTGOLD_POKEMON_MOOD_H
#define POKEHEARTGOLD_POKEMON_MOOD_H

#include "pokemon.h"

typedef enum MonMoodModifier {
    MON_MOOD_MODIFIER_LEVEL_UP_IN_BATTLE,
    MON_MOOD_MODIFIER_1,
    MON_MOOD_MODIFIER_2,
    MON_MOOD_MODIFIER_LEARN_TMHM,
    MON_MOOD_MODIFIER_4,
    MON_MOOD_MODIFIER_SURVIVED_PSN,
    MON_MOOD_MODIFIER_6,
    MON_MOOD_MODIFIER_7,
} MonMoodModifier;

void ApplyItemEffectOnMonMood(Pokemon *mon, u16 itemId);
void ApplyMonMoodModifier(Pokemon *mon, int modifierId);

#endif // POKEHEARTGOLD_POKEMON_MOOD_H
