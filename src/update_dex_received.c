#include "game_stats.h"
#include "pokedex.h"
#include "pokewalker.h"
#include "constants/pokemon.h"
#include "constants/pokewalker_courses.h"
#include "constants/species.h"

void UpdatePokedexWithReceivedSpecies(SAVEDATA *saveData, Pokemon *pokemon) {
    BOOL isEgg;
    u16 species;
    isEgg = GetMonData(pokemon, MON_DATA_IS_EGG, NULL);
    if (!isEgg) {
        species = GetMonData(pokemon, MON_DATA_SPECIES, NULL);
        POKEDEX *pokedex = Sav2_Pokedex_get(saveData);
        GAME_STATS *gameStats = Sav2_GameStats_get(saveData);
        GameStats_IncSpeciesCaught(gameStats, pokedex, species);
        Pokedex_SetMonCaughtFlag(pokedex, pokemon);
        if (species == SPECIES_JIRACHI) {
            POKEWALKER *pokeWalker = Sav2_Pokewalker_get(saveData);
            Pokewalker_UnlockCourse(pokeWalker, WALKER_COURSE_NIGHT_SKY_S_EDGE);
        }
    }
}
