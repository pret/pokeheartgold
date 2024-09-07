#ifndef GUARD_POKEHEARTGOLD_UNK_02074944_H
#define GUARD_POKEHEARTGOLD_UNK_02074944_H

#include "dex_mon_measures.h"
#include "pokedex.h"

typedef enum BattleRegulationComplianceMessage {
    BTL_REG_COMPLIANCE_OK,
    BTL_REG_COMPLIANCE_FAIL_MAX_TOTAL_LEVEL,
    BTL_REG_COMPLIANCE_FAIL_SPECIES_DUPE,
    BTL_REG_COMPLIANCE_FAIL_ITEMS_DUPE,
    BTL_REG_COMPLIANCE_FAIL_NUM_MONS,
    BTL_REG_COMPLIANCE_FAIL_5,
    BTL_REG_COMPLIANCE_FAIL_TOO_MANY_LEGENDS,
    BTL_REG_COMPLIANCE_FAIL_7,
    BTL_REG_COMPLIANCE_FAIL_SOUL_DEW,
} BattleRegulationComplianceMessage;

typedef struct LinkBattleRuleset LinkBattleRuleset;

PokedexData *PokedexData_CreateAndLoad(HeapID heapId);
void PokedexData_UnloadAndDelete(PokedexData *pokedex);
BOOL sub_0207496C(LinkBattleRuleset *ruleset, Pokemon *pokemon, PokedexData *pokedex);
BattleRegulationComplianceMessage LinkBattleRuleset_GetPartySelectionComplianceMessage(LinkBattleRuleset *ruleset, Party *party, PokedexData *pokedex, u8 *a3);
int sub_02074CD0(LinkBattleRuleset *ruleset, Party *party, PokedexData *pokedex);

#endif // GUARD_POKEHEARTGOLD_UNK_02074944_H
