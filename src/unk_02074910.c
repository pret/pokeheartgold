#include "unk_02074910.h"

BOOL SavArray_IsNatDexEnabled(SAVEDATA* savedata) {
    return Pokedex_IsNatDexEnabled(Sav2_Pokedex_get(savedata));
}

BOOL Pokedex_IsNatDexEnabled(const POKEDEX* pokedex) {
    return (Pokedex_GetNatDexFlag(pokedex) == TRUE);
}

u32 sub_02074930(BOOL natDexFlag, u32 species) {
    if (natDexFlag == FALSE) {
        return SpeciesToJohtoDexNo(species);
    }
    return species;
}

