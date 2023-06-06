#include "game_stats.h"
#include "pokedex.h"
#include "pokewalker.h"
#include "constants/pokemon.h"
#include "constants/pokewalker_courses.h"
#include "constants/species.h"

void UpdatePokedexWithReceivedSpecies(SAVEDATA *saveData, Pokemon *mon) {
    BOOL isEgg;
    u16 species;
    isEgg = GetMonData(mon, MON_DATA_IS_EGG, NULL);
    if (!isEgg) {
        species = GetMonData(mon, MON_DATA_SPECIES, NULL);
        POKEDEX *pokedex = Save_Pokedex_get(saveData);
        GAME_STATS *gameStats = Save_GameStats_get(saveData);
        GameStats_IncSpeciesCaught(gameStats, pokedex, species);
        Pokedex_SetMonCaughtFlag(pokedex, mon);
        if (species == SPECIES_JIRACHI) {
            POKEWALKER *pokeWalker = Save_Pokewalker_get(saveData);
            Pokewalker_UnlockCourse(pokeWalker, WALKER_COURSE_NIGHT_SKY_S_EDGE);
        }
    }
}
