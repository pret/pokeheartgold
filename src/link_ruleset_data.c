#include "link_ruleset_data.h"

#include "global.h"

#include "msgdata/msg.naix"
#include "msgdata/msg/msg_0182.h"

#include "msgdata.h"

static u8 sRulesetIndexes[] = {
    STD_RULESET_STANDARD,
    STD_RULESET_FANCY,
    STD_RULESET_LITTLE,
    STD_RULESET_LIGHT,
    STD_RULESET_DOUBLE,
    0, // unused
    STD_RULESET_STANDARD,
    STD_RULESET_STANDARD_2,
    STD_RULESET_LIGHT_2,
    STD_RULESET_DOUBLE_2,
    STD_RULESET_DOUBLE_3, // unused
    STD_RULESET_GS
};

static LinkBattleRuleset sDefaultRuleset = {
    .name = { EOS },
    .totalLevel = 0,
    .partyCount = 6,
    .maxLevel = 100,
    .heightLimit = 0,
    .weightLimit = 0,
    .evolvedPokemon = TRUE,
    .ubersClause = TRUE,
    .speciesDupeClause = TRUE,
    .itemDupeClause = TRUE,
    .dragonRageClause = FALSE,
};

static LinkBattleRuleset sAlternateRulesets[] = {
    [STD_RULESET_STANDARD] = {
                              .name = { EOS },
                              .totalLevel = 0,
                              .partyCount = 3,
                              .maxLevel = 50,
                              .heightLimit = 0,
                              .weightLimit = 0,
                              .evolvedPokemon = TRUE,
                              .ubersClause = FALSE,
                              .speciesDupeClause = FALSE,
                              .itemDupeClause = FALSE,
                              .dragonRageClause = FALSE,
                              },
    [STD_RULESET_FANCY] = {
                              .name = { EOS },
                              .totalLevel = 80,
                              .partyCount = 3,
                              .maxLevel = 30,
                              .heightLimit = -20,
                              .weightLimit = -20,
                              .evolvedPokemon = FALSE,
                              .ubersClause = FALSE,
                              .speciesDupeClause = FALSE,
                              .itemDupeClause = FALSE,
                              .dragonRageClause = FALSE,
                              },
    [STD_RULESET_LITTLE] = {
                              .name = { EOS },
                              .totalLevel = 0,
                              .partyCount = 3,
                              .maxLevel = 5,
                              .heightLimit = 0,
                              .weightLimit = 0,
                              .evolvedPokemon = FALSE,
                              .ubersClause = FALSE,
                              .speciesDupeClause = FALSE,
                              .itemDupeClause = FALSE,
                              .dragonRageClause = TRUE,
                              },
    [STD_RULESET_LIGHT] = {
                              .name = { EOS },
                              .totalLevel = 0,
                              .partyCount = 3,
                              .maxLevel = 50,
                              .heightLimit = 0,
                              .weightLimit = -99,
                              .evolvedPokemon = FALSE,
                              .ubersClause = FALSE,
                              .speciesDupeClause = FALSE,
                              .itemDupeClause = FALSE,
                              .dragonRageClause = FALSE,
                              },
    [STD_RULESET_DOUBLE] = {
                              .name = { EOS },
                              .totalLevel = 0,
                              .partyCount = 4,
                              .maxLevel = 50,
                              .heightLimit = 0,
                              .weightLimit = 0,
                              .evolvedPokemon = TRUE,
                              .ubersClause = FALSE,
                              .speciesDupeClause = FALSE,
                              .itemDupeClause = FALSE,
                              .dragonRageClause = FALSE,
                              },
    [STD_RULESET_STANDARD_2] = {
                              .name = { EOS },
                              .totalLevel = 0,
                              .partyCount = 3,
                              .maxLevel = 100,
                              .heightLimit = 0,
                              .weightLimit = 0,
                              .evolvedPokemon = TRUE,
                              .ubersClause = FALSE,
                              .speciesDupeClause = FALSE,
                              .itemDupeClause = FALSE,
                              .dragonRageClause = FALSE,
                              },
    [STD_RULESET_LIGHT_2] = {
                              .name = { EOS },
                              .totalLevel = 0,
                              .partyCount = 3,
                              .maxLevel = 100,
                              .heightLimit = 0,
                              .weightLimit = -99,
                              .evolvedPokemon = FALSE,
                              .ubersClause = FALSE,
                              .speciesDupeClause = FALSE,
                              .itemDupeClause = FALSE,
                              .dragonRageClause = FALSE,
                              },
    [STD_RULESET_DOUBLE_2] = {
                              .name = { EOS },
                              .totalLevel = 0,
                              .partyCount = 4,
                              .maxLevel = 100,
                              .heightLimit = 0,
                              .weightLimit = 0,
                              .evolvedPokemon = TRUE,
                              .ubersClause = FALSE,
                              .speciesDupeClause = FALSE,
                              .itemDupeClause = FALSE,
                              .dragonRageClause = FALSE,
                              },
    [STD_RULESET_DOUBLE_3] = {
                              .name = { EOS },
                              .totalLevel = 0,
                              .partyCount = 4,
                              .maxLevel = 200,
                              .heightLimit = 0,
                              .weightLimit = 0,
                              .evolvedPokemon = TRUE,
                              .ubersClause = FALSE,
                              .speciesDupeClause = FALSE,
                              .itemDupeClause = FALSE,
                              .dragonRageClause = FALSE,
                              },
    [STD_RULESET_GS] = {
                              .name = { EOS },
                              .totalLevel = 0 | FLAG_RULESET_BAN_SOUL_DEW,
                              .partyCount = 4,
                              .maxLevel = 100,
                              .heightLimit = 0,
                              .weightLimit = 0,
                              .evolvedPokemon = TRUE,
                              .ubersClause = TRUE,
                              .speciesDupeClause = FALSE,
                              .itemDupeClause = FALSE,
                              .dragonRageClause = FALSE,
                              },
};
LinkBattleRuleset *sub_020291E8(SaveData *saveData, int index) {
    if (index == 5) {
        Save_LinkBattleRuleset *linkBattleRuleset = SaveArray_Get(saveData, SAVE_LINK_BATTLE_RULESET);
        return &linkBattleRuleset->rules[0];
    } else if (index == 10) {
        return NULL;
    } else if (index < NELEMS(sRulesetIndexes)) {
        return &sAlternateRulesets[sRulesetIndexes[index]];
    } else {
        return NULL;
    }
}

void sub_0202921C(SaveData *saveData, int index, String *string, enum HeapID heapID) {
    if (index == 5) {
        LinkBattleRuleset *ruleset = Save_LinkBattleRuleset_GetByIndex(saveData, 0);
        LinkBattleRuleset_CopyNameToString(ruleset, string);
    } else if (index < NELEMS(sRulesetIndexes)) {
        MsgData *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, NARC_msg_msg_0182_bin, heapID);
        ReadMsgDataIntoString(msgData, msg_0182_00083 + sRulesetIndexes[index], string);
        DestroyMsgData(msgData);
    }
}
LinkBattleRuleset *sub_0202925C(void) {
    return &sDefaultRuleset;
}

int sub_02029264(const LinkBattleRuleset *ruleset) {
    if (ruleset == NULL) {
        return 0xFF;
    }
    for (int i = 0; i < NELEMS(sAlternateRulesets); ++i) {
        if (memcmp(ruleset, &sAlternateRulesets[i], sizeof(LinkBattleRuleset)) == 0) {
            for (int j = 0; j < NELEMS(sRulesetIndexes); ++j) {
                if (i == sRulesetIndexes[j]) {
                    return j;
                }
            }
        }
    }
    return 5;
}
