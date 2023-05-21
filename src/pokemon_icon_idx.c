#include "pokemon.h"
#include "pokemon_icon_idx.h"
#include "constants/species.h"

static u16 _BoxMonGetForme(BoxPokemon *boxMon);

u32 Boxmon_GetIconNaix(BoxPokemon *boxMon) {
    BOOL encry;
    int species;
    BOOL isEgg;
    int forme;
    u32 ret;

    encry = AcquireBoxMonLock(boxMon);
    species = GetBoxMonData(boxMon, MON_DATA_SPECIES, NULL);
    isEgg = GetBoxMonData(boxMon, MON_DATA_IS_EGG, NULL);
    forme = _BoxMonGetForme(boxMon);
    ret = GetMonIconNaixEx(species, isEgg, forme);
    ReleaseBoxMonLock(boxMon, encry);
    return ret;
}

u32 Pokemon_GetIconNaix(Pokemon *mon) {
    return Boxmon_GetIconNaix(Mon_GetBoxMon(mon));
}

u32 GetMonIconNaixEx(u32 species, BOOL isEgg, u32 forme) {
    if (isEgg == TRUE) {
        if (species == SPECIES_MANAPHY) {
            return 502;
        } else {
            return 501;
        }
    }

    forme = sub_02070438(species, forme);
    if (forme != 0) {
        if (species == SPECIES_DEOXYS) {
            return forme + 503 - 1;
        } else if (species == SPECIES_UNOWN) {
            return forme + 507 - 1;
        } else if (species == SPECIES_BURMY) {
            return forme + 534 - 1;
        } else if (species == SPECIES_WORMADAM) {
            return forme + 536 - 1;
        } else if (species == SPECIES_SHELLOS) {
            return forme + 538 - 1;
        } else if (species == SPECIES_GASTRODON) {
            return forme + 539 - 1;
        } else if (species == SPECIES_GIRATINA) {
            return forme + 540 - 1;
        } else if (species == SPECIES_SHAYMIN) {
            return forme + 541 - 1;
        } else if (species == SPECIES_ROTOM) {
            return forme + 542 - 1;
        }
    }
    if (species > MAX_SPECIES) {
        species = 0;
    }
    return species + 7;
}

u32 GetBattleMonIconNaixEx(u32 species, BOOL isEgg, u32 forme) {
    if (!isEgg) {
        if (species == SPECIES_CASTFORM) {
            forme = sub_02070438(species, forme);
            if (forme != 0) {
                return forme + 547 - 1;
            }
        } else if (species == SPECIES_CHERRIM) {
            forme = sub_02070438(species, forme);
            if (forme != 0) {
                return forme + 550 - 1;
            }
        }
    }
    return GetMonIconNaixEx(species, isEgg, forme);
}

static u16 _BoxMonGetForme(BoxPokemon *boxMon) {
    switch (GetBoxMonData(boxMon, MON_DATA_SPECIES2, NULL)) {
    case SPECIES_UNOWN:
        return GetBoxMonUnownLetter(boxMon);
    case SPECIES_DEOXYS:
    case SPECIES_SHELLOS:
    case SPECIES_GASTRODON:
    case SPECIES_BURMY:
    case SPECIES_WORMADAM:
    case SPECIES_GIRATINA:
    case SPECIES_SHAYMIN:
    case SPECIES_ROTOM:
        return GetBoxMonData(boxMon, MON_DATA_FORME, NULL);
    default:
        return 0;
    }
}

static const u8 sPokemonPalNoBySpeciesAndForme[] = {
    0, 1, 1, 1, 0, 0, 0, 0, 2, 2, 1, 1, 0, 1, 2, 2,
    0, 0, 0, 2, 1, 0, 0, 2, 2, 2, 0, 2, 2, 2, 2, 2,
    2, 2, 2, 0, 0, 2, 1, 0, 0, 2, 2, 1, 0, 0, 0, 0,
    0, 2, 2, 2, 1, 1, 1, 2, 1, 2, 0, 0, 0, 0, 0, 2,
    2, 2, 0, 2, 0, 1, 1, 1, 2, 2, 1, 1, 1, 0, 0, 0,
    0, 0, 0, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
    2, 1, 2, 2, 0, 0, 0, 1, 1, 1, 2, 2, 1, 2, 2, 1,
    1, 0, 0, 1, 0, 0, 0, 0, 2, 2, 0, 1, 2, 1, 0, 2,
    2, 0, 0, 2, 2, 2, 0, 0, 0, 0, 0, 0, 2, 2, 0, 1,
    0, 0, 0, 0, 0, 2, 2, 0, 1, 1, 1, 1, 1, 1, 2, 2,
    2, 2, 2, 2, 2, 0, 0, 1, 0, 2, 2, 0, 0, 0, 1, 2,
    2, 0, 0, 2, 0, 0, 1, 2, 2, 1, 1, 1, 1, 2, 2, 1,
    1, 1, 0, 0, 2, 2, 2, 0, 0, 0, 0, 1, 0, 2, 2, 2,
    0, 0, 2, 0, 0, 1, 2, 0, 0, 2, 0, 0, 2, 2, 0, 0,
    0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 2, 1, 2, 2, 1, 1,
    1, 1, 1, 0, 2, 0, 1, 0, 1, 0, 1, 1, 1, 0, 1, 0,
    0, 0, 0, 0, 0, 2, 2, 2, 2, 0, 2, 0, 2, 1, 1, 1,
    1, 1, 1, 0, 2, 2, 0, 0, 1, 1, 1, 2, 0, 1, 1, 2,
    2, 1, 1, 1, 1, 0, 2, 2, 2, 1, 2, 0, 0, 2, 2, 2,
    2, 2, 2, 0, 0, 1, 0, 0, 0, 0, 2, 0, 1, 2, 0, 0,
    2, 0, 1, 0, 1, 0, 2, 1, 1, 1, 1, 1, 1, 0, 0, 0,
    2, 1, 0, 0, 0, 0, 0, 1, 0, 2, 0, 0, 0, 2, 0, 0,
    1, 0, 0, 0, 0, 1, 0, 0, 0, 2, 0, 2, 2, 0, 0, 0,
    0, 1, 0, 2, 2, 0, 0, 0, 0, 2, 2, 0, 0, 2, 2, 0,
    1, 0, 0, 1, 1, 1, 1, 0, 0, 2, 2, 0, 0, 0, 0, 2,
    2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 1, 1, 0, 0,
    0, 0, 0, 0, 1, 0, 0, 0, 2, 2, 2, 2, 2, 0, 1, 0,
    2, 0, 2, 2, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 2, 2,
    2, 1, 1, 0, 2, 0, 0, 1, 0, 0, 0, 1, 1, 0, 0, 1,
    0, 2, 1, 0, 2, 1, 1, 0, 2, 2, 0, 1, 0, 2, 2, 0,
    0, 0, 0, 2, 2, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 2,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
    0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1,
};

const u8 GetMonIconPaletteEx(u32 species, u32 forme, u32 isEgg) {
    if (isEgg == TRUE) {
        if (species == SPECIES_MANAPHY) {
            species = 495;
        } else {
            species = 494;
        }
    } else if (species > MAX_SPECIES) {
        species = 0;
    } else if (forme != 0) {
        if (species == SPECIES_DEOXYS) {
            species = 496 + forme - 1;
        } else if (species == SPECIES_UNOWN) {
            species = 499 + forme - 1;
        } else if (species == SPECIES_BURMY) {
            species = 527 + forme - 1;
        } else if (species == SPECIES_WORMADAM) {
            species = 529 + forme - 1;
        } else if (species == SPECIES_SHELLOS) {
            species = 531 + forme - 1;
        } else if (species == SPECIES_GASTRODON) {
            species = 532 + forme - 1;
        } else if (species == SPECIES_GIRATINA) {
            species = 533 + forme - 1;
        } else if (species == SPECIES_SHAYMIN) {
            species = 534 + forme - 1;
        } else if (species == SPECIES_ROTOM) {
            species = 535 + forme - 1;
        }
    }
    return sPokemonPalNoBySpeciesAndForme[species];
}

const u8 GetBattleMonIconPaletteEx(u32 species, u32 forme, BOOL isEgg) {
    if (!isEgg) {
        if (species == SPECIES_CASTFORM) {
            if (forme != 0) {
                return sPokemonPalNoBySpeciesAndForme[540 + forme - 1];
            }
        } else if (species == SPECIES_CHERRIM) {
            if (forme != 0) {
                return sPokemonPalNoBySpeciesAndForme[543 + forme - 1];
            }
        }
    }
    return GetMonIconPaletteEx(species, forme, isEgg);
}

const u8 Boxmon_GetIconPalette(BoxPokemon *boxMon) {
    BOOL encry;
    u32 species;
    u32 forme;
    BOOL isEgg;

    encry = AcquireBoxMonLock(boxMon);
    forme = _BoxMonGetForme(boxMon);
    species = GetBoxMonData(boxMon, MON_DATA_SPECIES, NULL);
    isEgg = GetBoxMonData(boxMon, MON_DATA_IS_EGG, NULL);
    ReleaseBoxMonLock(boxMon, encry);
    return GetMonIconPaletteEx(species, forme, isEgg);
}

const u8 Pokemon_GetIconPalette(Pokemon *mon) {
    return Boxmon_GetIconPalette(Mon_GetBoxMon(mon));
}

u32 sub_02074490(void) {
    return 0;
}

u32 sub_02074494(void) {
    return 2;
}

u32 sub_02074498(void) {
    return 4;
}

u32 sub_0207449C(void) {
    return 6;
}

u32 sub_020744A0(void) {
    return 1;
}

u32 sub_020744A4(void) {
    return 3;
}

u32 sub_020744A8(void) {
    return 5;
}
