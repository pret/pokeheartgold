#include "global.h"
#include "msgdata.h"
#include "msgdata/msg.naix"
#include "link_ruleset_data.h"
#include "msgdata/msg/msg_0182.h"

static u8 _0210F6F8[] = {
    STD_RULESET_STANDARD,
    STD_RULESET_FANCY,
    STD_RULESET_LITTLE,
    STD_RULESET_LIGHT,
    STD_RULESET_DOUBLE,
    0,  // unused
    STD_RULESET_STANDARD,
    STD_RULESET_STANDARD_2,
    STD_RULESET_LIGHT_2,
    STD_RULESET_DOUBLE_2,
    STD_RULESET_DOUBLE_3,  // unused
    STD_RULESET_GS
};

static LinkBattleRuleset _0210F704 = {
    .name = {EOS},
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

static LinkBattleRuleset _0210F724[] = {
    [STD_RULESET_STANDARD] = {
        .name = {EOS},
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
        .name = {EOS},
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
        .name = {EOS},
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
        .name = {EOS},
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
        .name = {EOS},
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
        .name = {EOS},
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
        .name = {EOS},
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
        .name = {EOS},
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
        .name = {EOS},
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
        .name = {EOS},
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
LinkBattleRuleset *sub_020291E8(SaveData *saveData, int a1) {
    if (a1 == 5) {
        Save_LinkBattleRuleset *linkBattleRuleset = SaveArray_Get(saveData, SAVE_LINK_BATTLE_RULESET);
        return &linkBattleRuleset->rules[0];
    } else if (a1 == 10) {
        return NULL;
    } else if (a1 < NELEMS(_0210F6F8)) {
        return &_0210F724[_0210F6F8[a1]];
    } else {
        return NULL;
    }
}

void sub_0202921C(SaveData *saveData, int a1, String *a2, HeapID heapId) {
    if (a1 == 5) {
        LinkBattleRuleset *ruleset = sub_020291A4(saveData, 0);
        sub_020290D4(ruleset, a2);
    } else if (a1 < NELEMS(_0210F6F8)) {
        MsgData *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, NARC_msg_msg_0182_bin, heapId);
        ReadMsgDataIntoString(msgData, msg_0182_00083 + _0210F6F8[a1], a2);
        DestroyMsgData(msgData);
    }
}
LinkBattleRuleset *sub_0202925C(void) {
    return &_0210F704;
}

int sub_02029264(const LinkBattleRuleset *ruleset) {
    if (ruleset == NULL) {
        return 0xFF;
    }
    for (int i = 0; i < NELEMS(_0210F724); ++i) {
        if (memcmp(ruleset, &_0210F724[i], sizeof(LinkBattleRuleset)) == 0) {
            for (int j = 0; j < NELEMS(_0210F6F8); ++j) {
                if (i == _0210F6F8[j]) {
                    return j;
                }
            }
        }
    }
    return 5;
}
