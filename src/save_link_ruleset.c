#include "save_link_ruleset.h"

#include "global.h"

u32 LinkBattleRuleset_sizeof(void) {
    return sizeof(LinkBattleRuleset);
}

u32 Save_LinkBattleRuleset_sizeof(void) {
    return sizeof(Save_LinkBattleRuleset);
}

void LinkBattleRuleset_Copy(const LinkBattleRuleset *src, LinkBattleRuleset *dst) {
    MI_CpuCopy8(src, dst, sizeof(LinkBattleRuleset));
}

void Save_LinkBattleRuleset_Init(Save_LinkBattleRuleset *ruleset) {
    memset(ruleset, 0, sizeof(Save_LinkBattleRuleset));
}

void LinkBattleRuleset_CopyNameToString(const LinkBattleRuleset *rule, String *dest) {
    CopyU16ArrayToStringN(dest, rule->name, 12);
}

String *LinkBattleRuleset_CreateStringFromName(const LinkBattleRuleset *rule, enum HeapID heapID) {
    String *ret = String_New(24, heapID);
    CopyU16ArrayToString(ret, rule->name);
    return ret;
}

int LinkBattleRuleset_GetRuleValue(const LinkBattleRuleset *ruleset, LinkBattleRule rule) {
    int ret = 0;
    switch (rule) {
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
    case LINKBATTLERULE_EVOLVED_POKEMON:
        ret = ruleset->evolvedPokemon;
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
    case LINKBATTLERULE_DRAGON_RAGE_CLAUSE:
        ret = ruleset->dragonRageClause;
        break;
    case LINKBATTLERULE_SOUL_DEW_CLAUSE:
        ret = ruleset->totalLevel
#ifdef BUGFIX_SOUL_DEW_BAN
            & FLAG_RULESET_BAN_SOUL_DEW
#endif // BUGFIX_SOUL_DEW_BAN
            ;
        break;
    }
    return ret;
}

LinkBattleRuleset *Save_LinkBattleRuleset_GetByIndex(SaveData *saveData, int rulesetNum) {
    Save_LinkBattleRuleset *saveRuleset = NULL;
    GF_ASSERT(rulesetNum < NUM_SAVE_LINK_BATTLE_RULESETS);
    saveRuleset = SaveArray_Get(saveData, SAVE_LINK_BATTLE_RULESET);
    if (LinkBattleRuleset_GetRuleValue(&saveRuleset->rules[rulesetNum], LINKBATTLERULE_PARTY_COUNT) != 0) {
        return &saveRuleset->rules[rulesetNum];
    }
    return NULL;
}

void Save_LinkBattleRuleset_Set(SaveData *saveData, const LinkBattleRuleset *ruleset) {
    Save_LinkBattleRuleset *saveRulesets = SaveArray_Get(saveData, SAVE_LINK_BATTLE_RULESET);
    LinkBattleRuleset_Copy(ruleset, &saveRulesets->rules[0]);
}
