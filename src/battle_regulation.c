#include "battle_regulation.h"

#include "global.h"

#include "constants/items.h"

#include "dex_mon_measures.h"
#include "party.h"
#include "pokemon.h"

static BOOL sub_02074C50(u16 *a0, u16 *a1, u16 *a2, int a3, int a4, int a5, int a6);

PokedexData *PokedexData_CreateAndLoad(enum HeapID heapID) {
    PokedexData *pokedex = PokedexData_Create(heapID);
    PokedexData_LoadAll(pokedex, 0, heapID);
    return pokedex;
}

void PokedexData_UnloadAndDelete(PokedexData *pokedex) {
    PokedexData_UnloadAll(pokedex);
    PokedexData_Delete(pokedex);
}

BOOL LinkBattleRuleset_CheckDexBasedRules(LinkBattleRuleset *ruleset, Pokemon *pokemon, PokedexData *pokedex) {
    u16 species = GetMonData(pokemon, MON_DATA_SPECIES, NULL);
    if (ruleset == NULL) {
        return TRUE;
    }

    int rule = LinkBattleRuleset_GetRuleValue(ruleset, LINKBATTLERULE_MAX_LEVEL);
    if (GetMonData(pokemon, MON_DATA_LEVEL, NULL) > rule) {
        return FALSE;
    }
    if (GetMonData(pokemon, MON_DATA_IS_EGG, NULL)) {
        return FALSE;
    }

    rule = LinkBattleRuleset_GetRuleValue(ruleset, LINKBATTLERULE_EVOLVED_POKEMON);
    if (rule == 0) {
        if (species != GetEggSpecies(species)) {
            return FALSE;
        }
    }

    rule = LinkBattleRuleset_GetRuleValue(ruleset, LINKBATTLERULE_HEIGHT_LIMIT);
    if (rule != 0) {
        int height = PokedexData_GetHeight(pokedex, species);
        if (rule > 0) {
            if (height < rule) {
                return FALSE;
            }
        } else {
            if (height > -rule) {
                return FALSE;
            }
        }
    }

    rule = 10 * LinkBattleRuleset_GetRuleValue(ruleset, LINKBATTLERULE_WEIGHT_LIMIT);
    if (rule != 0) {
        int weight = PokedexData_GetWeight(pokedex, species);
        if (rule > 0) {
            if (weight < rule) {
                return FALSE;
            }
        } else {
            if (weight > -rule) {
                return FALSE;
            }
        }
    }

    rule = LinkBattleRuleset_GetRuleValue(ruleset, LINKBATTLERULE_SOUL_DEW_CLAUSE);
    if (rule == 0x8000) {
        return SpeciesIsMythical(species) != TRUE;
    }

    rule = LinkBattleRuleset_GetRuleValue(ruleset, LINKBATTLERULE_UBERS_CLAUSE);
    if (rule == 0) {
        if (MonCheckFrontierIneligibility(pokemon)) {
            return FALSE;
        }
    }

    return TRUE;
}

BattleRegulationComplianceMessage LinkBattleRuleset_GetPartySelectionComplianceMessage(LinkBattleRuleset *ruleset, Party *party, PokedexData *pokedex, u8 *selectedOrder) {
    Pokemon *mon;
    int rule;
    int numMons = 0;
    int j;
    int i;
    int totalLevel = 0;
    u16 species[PARTY_SIZE];
    u16 heldItems[PARTY_SIZE];

    if (ruleset == NULL) {
        return BTL_REG_COMPLIANCE_OK;
    }

    for (i = 0; i < PARTY_SIZE; ++i) {
        species[i] = SPECIES_NONE;
        heldItems[i] = ITEM_NONE;
        if (selectedOrder[i] != 0) {
            ++numMons;
        }
    }
    rule = LinkBattleRuleset_GetRuleValue(ruleset, LINKBATTLERULE_PARTY_COUNT);
    if (numMons != rule) {
        return BTL_REG_COMPLIANCE_FAIL_NUM_MONS;
    }

    for (i = 0; i < PARTY_SIZE; ++i) {
        if (selectedOrder[i] != 0) {
            mon = Party_GetMonByIndex(party, selectedOrder[i] - 1);
            if (!LinkBattleRuleset_CheckDexBasedRules(ruleset, mon, pokedex)) {
                return BTL_REG_COMPLIANCE_FAIL_SPECIAL_CONSTRAINTS;
            }
            species[i] = GetMonData(mon, MON_DATA_SPECIES, NULL);
            heldItems[i] = GetMonData(mon, MON_DATA_HELD_ITEM, NULL);
            totalLevel += GetMonData(mon, MON_DATA_LEVEL, NULL);
        }
    }
    rule = LinkBattleRuleset_GetRuleValue(ruleset, LINKBATTLERULE_MAX_TOTAL_LEVEL);
    if (totalLevel > rule && rule != 0) {
        return BTL_REG_COMPLIANCE_FAIL_MAX_TOTAL_LEVEL;
    }

    rule = LinkBattleRuleset_GetRuleValue(ruleset, LINKBATTLERULE_SOUL_DEW_CLAUSE);
    if (rule == 0x8000) {
        j = 0;
        for (i = 0; i < PARTY_SIZE; ++i) {
            if (species[i] != SPECIES_NONE && IsPokemonBannedFromBattleFrontier(species[i], 0) && !SpeciesIsMythical(species[i])) {
                ++j;
            }
        }
        if (j > 2) {
            return BTL_REG_COMPLIANCE_FAIL_TOO_MANY_LEGENDS;
        }
    }

    rule = LinkBattleRuleset_GetRuleValue(ruleset, LINKBATTLERULE_SPECIES_DUPE_CLAUSE);
    if (rule == 0 && numMons > 1) {
        for (i = 0; i < PARTY_SIZE - 1; ++i) {
            for (j = i + 1; j < PARTY_SIZE; ++j) {
                if (species[i] == species[j] && species[i] != SPECIES_NONE) {
                    return BTL_REG_COMPLIANCE_FAIL_SPECIES_DUPE;
                }
            }
        }
    }

    rule = LinkBattleRuleset_GetRuleValue(ruleset, LINKBATTLERULE_SOUL_DEW_CLAUSE);
    if (rule == 0x8000) {
        for (i = 0; i < PARTY_SIZE; ++i) {
            if (heldItems[i] == ITEM_SOUL_DEW && species[i] != SPECIES_NONE && heldItems[i] != ITEM_NONE) {
                return BTL_REG_COMPLIANCE_FAIL_SOUL_DEW;
            }
        }
    }

    rule = LinkBattleRuleset_GetRuleValue(ruleset, LINKBATTLERULE_ITEM_DUPE_CLAUSE);
    if (rule == 0 && numMons > 1) {
        for (i = 0; i < PARTY_SIZE - 1; ++i) {
            for (j = i + 1; j < PARTY_SIZE; ++j) {
                if (heldItems[i] == heldItems[j] && species[i] != SPECIES_NONE && heldItems[i] != ITEM_NONE) {
                    return BTL_REG_COMPLIANCE_FAIL_ITEMS_DUPE;
                }
            }
        }
    }

    return BTL_REG_COMPLIANCE_OK;
}

static BOOL sub_02074C50(u16 *species, u16 *levels, u16 *visited, int numMonsLeft, int curIdx, int totalLevel, int totalNumMons) {
    // called recursively
    int cur_numMonsLeft = numMonsLeft;
    int i;
    int cur_totalLevel = totalLevel;
    if (species[curIdx] != 0 && visited[curIdx] == 0) {
        cur_numMonsLeft -= levels[curIdx];
        if (cur_numMonsLeft < 0) {
            return FALSE;
        }
        --cur_totalLevel;
        if (cur_totalLevel == 0) {
            return TRUE;
        }
        visited[curIdx] = 1;
    }
    for (i = curIdx + 1; i < totalNumMons; ++i) {
        if (sub_02074C50(species, levels, visited, cur_numMonsLeft, i, cur_totalLevel, totalNumMons)) {
            return TRUE;
        }
    }
    visited[curIdx] = 0;
    return FALSE;
}

int sub_02074CD0(LinkBattleRuleset *ruleset, Party *party, PokedexData *pokedex) {
    Pokemon *mon;
    int rule;
    int partyCount;
    int j;
    int i;
    u16 species[PARTY_SIZE];
    u16 levels[PARTY_SIZE];
    u16 sp30[PARTY_SIZE];
    int numLegalMons;
    int numBannedMons;

    partyCount = Party_GetCount(party);
    numLegalMons = partyCount;
    MI_CpuClear8(sp30, sizeof(sp30));
    for (i = 0; i < partyCount; ++i) {
        mon = Party_GetMonByIndex(party, i);
        species[i] = GetMonData(mon, MON_DATA_SPECIES, NULL);
        levels[i] = GetMonData(mon, MON_DATA_LEVEL, NULL);
        if (!LinkBattleRuleset_CheckDexBasedRules(ruleset, mon, pokedex)) {
            species[i] = SPECIES_NONE;
            --numLegalMons;
        }
    }

    rule = LinkBattleRuleset_GetRuleValue(ruleset, LINKBATTLERULE_SPECIES_DUPE_CLAUSE);
    if (rule == 0 && partyCount > 1) {
        for (i = 0; i < partyCount - 1; ++i) {
            for (j = i + 1; j < partyCount; ++j) {
                if (species[i] == species[j] && species[i] != SPECIES_NONE) {
                    if (levels[i] > levels[j]) {
                        species[i] = SPECIES_NONE;
                    } else {
                        species[j] = SPECIES_NONE;
                    }
                    --numLegalMons;
                }
            }
        }
    }

    rule = LinkBattleRuleset_GetRuleValue(ruleset, LINKBATTLERULE_SOUL_DEW_CLAUSE);
    if (rule == 0x8000) {
        numBannedMons = 0;
        for (i = 0; i < PARTY_SIZE; ++i) {
            if (species[i] != SPECIES_NONE && SpeciesIsMythical(species[i]) == FALSE && IsPokemonBannedFromBattleFrontier(species[i], 0) == TRUE) {
                ++numBannedMons;
                if (numBannedMons > 2) {
                    species[i] = SPECIES_NONE;
                    --numLegalMons;
                }
            }
        }
    }

    rule = LinkBattleRuleset_GetRuleValue(ruleset, LINKBATTLERULE_PARTY_COUNT);
    if (numLegalMons < rule) {
        return 4;
    }
    numLegalMons = rule;

    rule = LinkBattleRuleset_GetRuleValue(ruleset, LINKBATTLERULE_MAX_TOTAL_LEVEL);
    if (rule == 0) {
        return 0;
    }

    for (i = 0; i < partyCount; ++i) {
        if (sub_02074C50(species, levels, sp30, rule, i, numLegalMons, partyCount)) {
            return 0;
        }
    }

    return 1;
}
