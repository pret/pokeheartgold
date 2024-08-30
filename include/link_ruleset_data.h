#ifndef POKEHEARTGOLD_LINK_RULESET_DATA_H
#define POKEHEARTGOLD_LINK_RULESET_DATA_H

#include "save_link_ruleset.h"

typedef enum StdLinkBattleRuleset {
    STD_RULESET_STANDARD,
    STD_RULESET_FANCY,
    STD_RULESET_LITTLE,
    STD_RULESET_LIGHT,
    STD_RULESET_DOUBLE,
    STD_RULESET_STANDARD_2,
    STD_RULESET_LIGHT_2,
    STD_RULESET_DOUBLE_2,
    STD_RULESET_DOUBLE_3,
    STD_RULESET_GS,
} StdLinkBattleRuleset;

LinkBattleRuleset *sub_020291E8(SaveData *saveData, int a1);
void sub_0202921C(SaveData *saveData, int a1, String *a2, HeapID heapId);
LinkBattleRuleset *sub_0202925C(void);
int sub_02029264(const LinkBattleRuleset *ruleset);

#endif // POKEHEARTGOLD_LINK_RULESET_DATA_H
