#include "global.h"
#include "save_link_ruleset.h"

struct Save_LinkBattleRuleset {
    LinkBattleRuleset rules[1];
};

u32 sub_020290B4(void) {
    return sizeof(LinkBattleRuleset);
}

u32 Save_LinkBattleRuleset_sizeof(void) {
    return sizeof(Save_LinkBattleRuleset);
}

void sub_020290BC(const LinkBattleRuleset *src, Save_LinkBattleRuleset *dst) {
    MI_CpuCopy8(src, &dst->rules[0], sizeof(LinkBattleRuleset));
}

void Save_LinkBattleRuleset_Init(Save_LinkBattleRuleset *ruleset) {
    memset(ruleset, 0, sizeof(Save_LinkBattleRuleset));
}

void sub_020290D4(const LinkBattleRuleset *rule, String *dest) {
    CopyU16ArrayToStringN(dest, rule->name, 12);
}

String *sub_020290E4(const LinkBattleRuleset *rule, HeapID heapId) {
    String *ret = String_New(24, heapId);
    CopyU16ArrayToString(ret, rule->name);
    return ret;
}

int LinkBattleRuleset_GetRuleValue(LinkBattleRuleset *ruleset, int a1) {
    int ret = 0;
    switch (a1) {
    case LINKBATTLERULE_NONE:
        break;
    case LINKBATTLERULE_PARTY_COUNT:
        ret = ruleset->partyCount;
        break;
    case LINKBATTLERULE_MAX_LEVEL:
        ret = ruleset->maxLevel;
        break;
    case LINKBATTLERULE_MAX_TOTAL_LEVEL:
        ret = ruleset->totalLevel & 0xFFF;
        break;
    case LINKBATTLERULE_BABY_CUP:
        ret = ruleset->babyCup;
        break;
    case LINKBATTLERULE_HEIGHT_LIMIT:
        ret = ruleset->heightLimit;
        break;
    case LINKBATTLERULE_HEIGHT_LIMIT_COMPARE:
        if (ruleset->heightLimit > 0) {
            ret = 1;
        } else if (ruleset->heightLimit < 0) {
            ret = -1;
        }
        break;
    case LINKBATTLERULE_WEIGHT_LIMIT:
        ret = ruleset->weightLimit;
        break;
    case LINKBATTLERULE_WEIGHT_LIMIT_COMPARE:
        if (ruleset->weightLimit > 0) {
            ret = 1;
        } else if (ruleset->weightLimit < 0) {
            ret = -1;
        }
        break;
    case LINKBATTLERULE_ITEM_DUPE_CLAUSE:
        ret = ruleset->itemDupeClause;
        break;
    case LINKBATTLERULE_SPECIES_DUPE_CLAUSE:
        ret = ruleset->speciesDupeClause;
        break;
    case LINKBATTLERULE_UBERS_CLAUSE:
        ret = ruleset->ubersClause;
        break;
    case LINKBATTLERULE_12:
        ret = ruleset->unk_1E_4;
        break;
    case LINKBATTLERULE_SOUL_DEW_CLAUSE:
        ret = ruleset->totalLevel;
        break;
    }
    return ret;
}
