#include "unk_02074910.h"

BOOL SavArray_IsNatDexEnabled(SAVEDATA* savedata) {
    return Pokedex_IsNatDexEnabled(Sav2_Pokedex_get(savedata));
}

BOOL Pokedex_IsNatDexEnabled(const POKEDEX* pokedex) {
    return (Pokedex_GetNatDexFlag(pokedex) == 1);
}

u32 sub_02074930(BOOL natDexFlag, u32 monData) {
    if(natDexFlag == 0)  {
        return SpeciesToJohtoDexNo((u16) monData);
    }
    return monData;
}

