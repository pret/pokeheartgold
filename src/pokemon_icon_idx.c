#include "global.h"
#include "pokemon.h"
#include "pokemon_icon_idx.h"
#include "constants/species.h"

static u16 BoxMonGetForm(BoxPokemon *boxMon);

u32 Boxmon_GetIconNaix(BoxPokemon *boxMon) {
    BOOL encry;
    int species;
    BOOL isEgg;
    int form;
    u32 ret;

    encry = AcquireBoxMonLock(boxMon);
    species = GetBoxMonData(boxMon, MON_DATA_SPECIES, NULL);
    isEgg = GetBoxMonData(boxMon, MON_DATA_IS_EGG, NULL);
    form = BoxMonGetForm(boxMon);
    ret = GetMonIconNaixEx(species, isEgg, form);
    ReleaseBoxMonLock(boxMon, encry);
    return ret;
}

u32 Pokemon_GetIconNaix(Pokemon *mon) {
    return Boxmon_GetIconNaix(Mon_GetBoxMon(mon));
}

u32 GetMonIconNaixEx(u32 species, BOOL isEgg, u32 form) {
    if (isEgg == TRUE) {
        if (species == SPECIES_MANAPHY) {
            return 502;
        } else {
            return 501;
        }
    }

    form = sub_02070438(species, form);
    if (form != 0) {
        if (species == SPECIES_DEOXYS) {
            return form + 503 - 1;
        } else if (species == SPECIES_UNOWN) {
            return form + 507 - 1;
        } else if (species == SPECIES_BURMY) {
            return form + 534 - 1;
        } else if (species == SPECIES_WORMADAM) {
            return form + 536 - 1;
        } else if (species == SPECIES_SHELLOS) {
            return form + 538 - 1;
        } else if (species == SPECIES_GASTRODON) {
            return form + 539 - 1;
        } else if (species == SPECIES_GIRATINA) {
            return form + 540 - 1;
        } else if (species == SPECIES_SHAYMIN) {
            return form + 541 - 1;
        } else if (species == SPECIES_ROTOM) {
            return form + 542 - 1;
        }
    }
    if (species > MAX_SPECIES) {
        species = 0;
    }
    return species + 7;
}

u32 GetBattleMonIconNaixEx(u32 species, BOOL isEgg, u32 form) {
    if (!isEgg) {
        if (species == SPECIES_CASTFORM) {
            form = sub_02070438(species, form);
            if (form != 0) {
                return form + 547 - 1;
            }
        } else if (species == SPECIES_CHERRIM) {
            form = sub_02070438(species, form);
            if (form != 0) {
                return form + 550 - 1;
            }
        }
    }
    return GetMonIconNaixEx(species, isEgg, form);
}

static u16 BoxMonGetForm(BoxPokemon *boxMon) {
    switch (GetBoxMonData(boxMon, MON_DATA_SPECIES_OR_EGG, NULL)) {
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
        return GetBoxMonData(boxMon, MON_DATA_FORM, NULL);
    default:
        return 0;
    }
}

static const u8 sPokemonPalNoBySpeciesAndForm[] = {
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

const u8 GetMonIconPaletteEx(u32 species, u32 form, u32 isEgg) {
    if (isEgg == TRUE) {
        if (species == SPECIES_MANAPHY) {
            species = 495;
        } else {
            species = 494;
        }
    } else if (species > MAX_SPECIES) {
        species = 0;
    } else if (form != 0) {
        if (species == SPECIES_DEOXYS) {
            species = 496 + form - 1;
        } else if (species == SPECIES_UNOWN) {
            species = 499 + form - 1;
        } else if (species == SPECIES_BURMY) {
            species = 527 + form - 1;
        } else if (species == SPECIES_WORMADAM) {
            species = 529 + form - 1;
        } else if (species == SPECIES_SHELLOS) {
            species = 531 + form - 1;
        } else if (species == SPECIES_GASTRODON) {
            species = 532 + form - 1;
        } else if (species == SPECIES_GIRATINA) {
            species = 533 + form - 1;
        } else if (species == SPECIES_SHAYMIN) {
            species = 534 + form - 1;
        } else if (species == SPECIES_ROTOM) {
            species = 535 + form - 1;
        }
    }
    return sPokemonPalNoBySpeciesAndForm[species];
}

const u8 GetBattleMonIconPaletteEx(u32 species, u32 form, BOOL isEgg) {
    if (!isEgg) {
        if (species == SPECIES_CASTFORM) {
            if (form != 0) {
                return sPokemonPalNoBySpeciesAndForm[540 + form - 1];
            }
        } else if (species == SPECIES_CHERRIM) {
            if (form != 0) {
                return sPokemonPalNoBySpeciesAndForm[543 + form - 1];
            }
        }
    }
    return GetMonIconPaletteEx(species, form, isEgg);
}

const u8 Boxmon_GetIconPalette(BoxPokemon *boxMon) {
    BOOL encry;
    u32 species;
    u32 form;
    BOOL isEgg;

    encry = AcquireBoxMonLock(boxMon);
    form = BoxMonGetForm(boxMon);
    species = GetBoxMonData(boxMon, MON_DATA_SPECIES, NULL);
    isEgg = GetBoxMonData(boxMon, MON_DATA_IS_EGG, NULL);
    ReleaseBoxMonLock(boxMon, encry);
    return GetMonIconPaletteEx(species, form, isEgg);
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
