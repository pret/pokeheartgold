#include "constants/items.h"
#include "global.h"
#include "pokedex_02074944.h"
#include "dex_mon_measures.h"
#include "party.h"
#include "pokemon.h"
#include "unk_020290B4.h"

BOOL sub_02074C50(u16 *a0, u16 *a1, u16 *a2, int a3, int a4, int a5, int a6);

PokedexData *sub_02074944(HeapID heapId) {
    PokedexData *pokedex = PokedexData_Create(heapId);
    PokedexData_LoadAll(pokedex, 0, heapId);
    return pokedex;
}

void sub_0207495C(PokedexData *pokedex) {
    PokedexData_UnloadAll(pokedex);
    PokedexData_Delete(pokedex);
}

BOOL sub_0207496C(UnkStruct_02074944 *a0, Pokemon *pokemon, PokedexData *pokedex) {
    u16 species = GetMonData(pokemon, MON_DATA_SPECIES, NULL);
    if (a0 == NULL) {
        return TRUE;
    }

    int r5 = sub_020290FC(a0, 2);
    if (GetMonData(pokemon, MON_DATA_LEVEL, NULL) > r5) {
        return FALSE;
    }
    if (GetMonData(pokemon, MON_DATA_IS_EGG, NULL)) {
        return FALSE;
    }

    r5 = sub_020290FC(a0, 4);
    if (r5 == 0) {
        if (species != GetEggSpecies(species)) {
            return FALSE;
        }
    }

    r5 = sub_020290FC(a0, 5);
    if (r5 != 0) {
        int height = PokedexData_GetHeight(pokedex, species);
        if (r5 > 0) {
            if (height < r5) {
                return FALSE;
            }
        } else {
            if (height > -r5) {
                return FALSE;
            }
        }
    }

    r5 = 10 * sub_020290FC(a0, 7);
    if (r5 != 0) {
        int weight = PokedexData_GetWeight(pokedex, species);
        if (r5 > 0) {
            if (weight < r5) {
                return FALSE;
            }
        } else {
            if (weight > -r5) {
                return FALSE;
            }
        }
    }

    r5 = sub_020290FC(a0, 13);
    if (r5 == 0x8000) {
        return SpeciesIsMythical(species) != TRUE;
    }

    r5 = sub_020290FC(a0, 11);
    if (r5 == 0) {
        if (MonCheckFrontierIneligibility(pokemon)) {
            return FALSE;
        }
    }

    return TRUE;
}

int sub_02074A6C(UnkStruct_02074944 *a0, Party *party, PokedexData *pokedex, u8 *selectedOrder) {
    Pokemon *mon;
    int rule;
    int numMons = 0;
    int j;
    int i;
    int totalLevel = 0;
    u16 species[PARTY_SIZE];
    u16 heldItems[PARTY_SIZE];

    if (a0 == NULL) {
        return FALSE;
    }

    for (i = 0; i < PARTY_SIZE; ++i) {
        species[i] = SPECIES_NONE;
        heldItems[i] = ITEM_NONE;
        if (selectedOrder[i] != 0) {
            ++numMons;
        }
    }
    rule = sub_020290FC(a0, 1);
    if (numMons != rule) {
        return 4;
    }

    for (i = 0; i < PARTY_SIZE; ++i) {
        if (selectedOrder[i] != 0) {
            mon = Party_GetMonByIndex(party, selectedOrder[i] - 1);
            if (!sub_0207496C(a0, mon, pokedex)) {
                return 5;
            }
            species[i] = GetMonData(mon, MON_DATA_SPECIES, NULL);
            heldItems[i] = GetMonData(mon, MON_DATA_HELD_ITEM, NULL);
            totalLevel += GetMonData(mon, MON_DATA_LEVEL, NULL);
        }
    }
    rule = sub_020290FC(a0, 3);
    if (totalLevel > rule && rule != 0) {
        return 1;
    }

    rule = sub_020290FC(a0, 13);
    if (rule == 0x8000) {
        j = 0;
        for (i = 0; i < PARTY_SIZE; ++i) {
            if (species[i] != SPECIES_NONE && IsPokemonBannedFromBattleFrontier(species[i], 0) && !SpeciesIsMythical(species[i])) {
                ++j;
            }
        }
        if (j > 2) {
            return 6;
        }
    }

    rule = sub_020290FC(a0, 10);
    if (rule == 0 && numMons > 1) {
        for (i = 0; i < PARTY_SIZE - 1; ++i) {
            for (j = i + 1; j < PARTY_SIZE; ++j) {
                if (species[i] == species[j] && species[i] != SPECIES_NONE) {
                    return 2;
                }
            }
        }
    }

    rule = sub_020290FC(a0, 13);
    if (rule == 0x8000) {
        for (i = 0; i < PARTY_SIZE; ++i) {
            if (heldItems[i] == ITEM_SOUL_DEW && species[i] != SPECIES_NONE && heldItems[i] != ITEM_NONE) {
                return 8;
            }
        }
    }

    rule = sub_020290FC(a0, 9);
    if (rule == 0 && numMons > 1) {
        for (i = 0; i < PARTY_SIZE - 1; ++i) {
            for (j = i + 1; j < PARTY_SIZE; ++j) {
                if (heldItems[i] == heldItems[j] && species[i] != SPECIES_NONE && heldItems[i] != ITEM_NONE) {
                    return 3;
                }
            }
        }
    }

    return 0;
}

BOOL sub_02074C50(u16 *a0, u16 *a1, u16 *a2, int a3, int a4, int a5, int a6) {
    int sp14 = a3;
    int i;
    int sp10 = a5;
    if (a0[a4] != 0 && a2[a4]== 0) {
        sp14 -= a1[a4];
        if (sp14 < 0) {
            return FALSE;
        }
        --sp10;
        if (sp10 == 0) {
            return TRUE;
        }
        a2[a4] = 1;
    }
    for (i = a4 + 1; i < a6; ++i) {
        if (sub_02074C50(a0, a1, a2, sp14, i, sp10, a6)) {
            return TRUE;
        }
    }
    a2[a4] = 0;
    return FALSE;
}

int sub_02074CD0(UnkStruct_02074944 *a0, Party *party, PokedexData *pokedex) {
    Pokemon *mon;
    int rule;
    int sp20;
    int j;
    int i;
    u16 sp48[PARTY_SIZE];
    u16 sp3C[PARTY_SIZE];
    u16 sp30[PARTY_SIZE];
    int r6;
    int r7;

    sp20 = Party_GetCount(party);
    r6 = sp20;
    MI_CpuClear8(sp30, sizeof(sp30));
    for (i = 0; i < sp20; ++i) {
        mon = Party_GetMonByIndex(party, i);
        sp48[i] = GetMonData(mon, MON_DATA_SPECIES, NULL);
        sp3C[i] = GetMonData(mon, MON_DATA_LEVEL, NULL);
        if (!sub_0207496C(a0, mon, pokedex)) {
            sp48[i] = SPECIES_NONE;
            --r6;
        }
    }

    rule = sub_020290FC(a0, 10);
    if (rule == 0 && sp20 > 1) {
        for (i = 0; i < sp20 - 1; ++i) {
            for (j = i + 1; j < sp20; ++j) {
                if (sp48[i] == sp48[j] && sp48[i] != SPECIES_NONE) {
                    if (sp3C[i] > sp3C[j]) {
                        sp48[i] = SPECIES_NONE;
                    } else {
                        sp48[j] = SPECIES_NONE;
                    }
                    --r6;
                }
            }
        }
    }

    rule = sub_020290FC(a0, 13);
    if (rule == 0x8000) {
        r7 = 0;
        for (i = 0; i < PARTY_SIZE; ++i) {
            if (sp48[i] != SPECIES_NONE && SpeciesIsMythical(sp48[i]) == FALSE && IsPokemonBannedFromBattleFrontier(sp48[i], 0) == TRUE) {
                ++r7;
                if (r7 > 2) {
                    sp48[i] = SPECIES_NONE;
                    --r6;
                }
            }
        }
    }

    rule = sub_020290FC(a0, 1);
    if (r6 < rule) {
        return 4;
    }
    r6 = rule;

    rule = sub_020290FC(a0, 3);
    if (rule == 0) {
        return 0;
    }

    for (i = 0; i < sp20; ++i) {
        if (sub_02074C50(sp48, sp3C, sp30, rule, i, r6, sp20)) {
            return 0;
        }
    }

    return 1;
}
