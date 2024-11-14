#include "global.h"

#include "constants/pokemon.h"
#include "constants/pokewalker_courses.h"
#include "constants/species.h"

#include "game_stats.h"
#include "pokedex.h"
#include "pokewalker.h"

void UpdatePokedexWithReceivedSpecies(SaveData *saveData, Pokemon *mon) {
    BOOL isEgg;
    u16 species;
    isEgg = GetMonData(mon, MON_DATA_IS_EGG, NULL);
    if (!isEgg) {
        species = GetMonData(mon, MON_DATA_SPECIES, NULL);
        Pokedex *pokedex = Save_Pokedex_Get(saveData);
        GameStats *gameStats = Save_GameStats_Get(saveData);
        GameStats_IncSpeciesCaught(gameStats, pokedex, species);
        Pokedex_SetMonCaughtFlag(pokedex, mon);
        if (species == SPECIES_JIRACHI) {
            POKEWALKER *pokeWalker = Save_Pokewalker_Get(saveData);
            Pokewalker_UnlockCourse(pokeWalker, WALKER_COURSE_NIGHT_SKY_S_EDGE);
        }
    }
}
