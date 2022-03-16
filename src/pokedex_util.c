#include "pokedex_util.h"
#include "pokemon.h"

BOOL SavArray_IsNatDexEnabled(SAVEDATA* savedata) {
    return Pokedex_IsNatDexEnabled(Sav2_Pokedex_get(savedata));
}

BOOL Pokedex_IsNatDexEnabled(const POKEDEX* pokedex) {
    return (Pokedex_GetNatDexFlag(pokedex) == TRUE);
}

u32 Pokedex_ConvertToCurrentDexNo(BOOL natDexFlag, u32 species) {
    if (natDexFlag == FALSE) {
        return SpeciesToJohtoDexNo((u16) species);
    }
    return species;
}

