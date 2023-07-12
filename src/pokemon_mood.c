#include "global.h"
#include "pokemon.h"
#include "pokemon_mood.h"
#include "constants/items.h"

static const s8 sMoodModifiers[] = {
    40,
    8,
    50,
    40,
    -80,
    -50,
    -100,
    30
};

static void MonAdjustMood(Pokemon *mon, s8 unk1) {
    s8 mood;
    s32 adjustedMood;

    mood = GetMonData(mon, MON_DATA_MOOD, NULL);
    adjustedMood = mood + unk1;

    if (adjustedMood > 127) {
        adjustedMood = 127;
    } else if (adjustedMood < -127) {
        adjustedMood = -127;
    }

    mood = adjustedMood;

    SetMonData(mon, MON_DATA_MOOD, &mood);
}

static s8 ItemIdGetMoodEffect(u16 itemId) {
    s8 moodEffect = 0;

    switch (itemId) {
    case ITEM_RARE_CANDY:
        moodEffect = 40;
        break;
    case ITEM_ENERGYPOWDER:
        moodEffect = -20;
        break;
    case ITEM_ENERGY_ROOT:
        moodEffect = -30;
        break;
    case ITEM_HEAL_POWDER:
        moodEffect = -20;
        break;
    case ITEM_REVIVAL_HERB:
        moodEffect = -40;
        break;
    case ITEM_HP_UP:
    case ITEM_PROTEIN:
    case ITEM_IRON:
    case ITEM_CARBOS:
    case ITEM_CALCIUM:
    case ITEM_ZINC:
        moodEffect = 8;
        break;
    case ITEM_GUARD_SPEC_:
    case ITEM_DIRE_HIT:
    case ITEM_X_ATTACK:
    case ITEM_X_DEFENSE:
    case ITEM_X_SPEED:
    case ITEM_X_ACCURACY:
    case ITEM_X_SPECIAL:
    case ITEM_X_SP__DEF:
        moodEffect = 10;
        break;
    case ITEM_ETHER:
    case ITEM_MAX_ETHER:
    case ITEM_ELIXIR:
    case ITEM_MAX_ELIXIR:
    case ITEM_LAVA_COOKIE:
    case ITEM_BERRY_JUICE:
    case ITEM_SACRED_ASH:
    case ITEM_PP_UP:
    case ITEM_PP_MAX:
    case ITEM_OLD_GATEAU:
        moodEffect = 0;
        break;
    }
    return moodEffect;
}

void ApplyItemEffectOnMonMood(Pokemon *mon, u16 itemId) {
    s8 moodEffect = ItemIdGetMoodEffect(itemId);
    if (moodEffect != 0) {
        MonAdjustMood(mon, moodEffect);
    }
}

void ApplyMonMoodModifier(Pokemon *mon, int modifierId) {
    s8 mood;
    u16 species;
    s32 adjustedMood;

    species = GetMonData(mon, MON_DATA_SPECIES_OR_EGG, NULL);

    if (species != SPECIES_NONE && species != SPECIES_EGG) {
        mood = GetMonData(mon, MON_DATA_MOOD, NULL);

        adjustedMood = mood + sMoodModifiers[modifierId];

        if (adjustedMood < -127) {
            adjustedMood = -127;
        } else if (adjustedMood > 127) {
            adjustedMood = 127;
        }

        mood = adjustedMood;

        SetMonData(mon, MON_DATA_MOOD, &mood);
    }
}
