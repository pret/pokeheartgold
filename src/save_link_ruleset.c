#include "global.h"
#include "save_link_ruleset.h"

u32 sub_020290B4(void) {
    return sizeof(LinkBattleRuleset);
}

u32 Save_LinkBattleRuleset_sizeof(void) {
    return sizeof(Save_LinkBattleRuleset);
}

void sub_020290BC(const LinkBattleRuleset *src, LinkBattleRuleset *dst) {
    MI_CpuCopy8(src, dst, sizeof(LinkBattleRuleset));
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

int LinkBattleRuleset_GetRuleValue(LinkBattleRuleset *ruleset, LinkBattleRule rule) {
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
    case LINKBATTLERULE_12:
        ret = ruleset->unk_1E_4;
        break;
    case LINKBATTLERULE_SOUL_DEW_CLAUSE:
        ret = ruleset->totalLevel
        #ifdef BUGFIX_SOUL_DEW_BAN
        & FLAG_RULESET_BAN_SOUL_DEW
        #endif //BUGFIX_SOUL_DEW_BAN
        ;
        break;
    }
    return ret;
}

#ifdef NONMATCHING  // https://decomp.me/scratch/48H9N
LinkBattleRuleset *sub_020291A4(SaveData *saveData, int rulesetNum) {
    Save_LinkBattleRuleset *saveRuleset = NULL;
    GF_ASSERT(rulesetNum < NUM_SAVE_LINK_BATTLE_RULESETS);
    saveRuleset = SaveArray_Get(saveData, SAVE_LINK_BATTLE_RULESET);
    if (LinkBattleRuleset_GetRuleValue(&saveRuleset->rules[rulesetNum], LINKBATTLERULE_PARTY_COUNT) != 0) {
        return &saveRuleset->rules[rulesetNum];
    }
    return NULL;
}
#else
// clang-format off
asm LinkBattleRuleset *sub_020291A4(SaveData *saveData, int rulesetNum) {
    push {r3, r4, r5, lr}
	add r5, r1, #0
	add r4, r0, #0
	cmp r5, #1
	blt _020291B2
	bl GF_AssertFail
_020291B2:
	add r0, r4, #0
	mov r1, #0xb
	bl SaveArray_Get
	add r4, r0, #0
	lsl r5, r5, #5
	add r0, r4, r5
	mov r1, #1
	bl LinkBattleRuleset_GetRuleValue
	cmp r0, #0
	beq _020291CE
	add r0, r4, r5
	pop {r3, r4, r5, pc}
_020291CE:
	mov r0, #0
	pop {r3, r4, r5, pc}
}
// clang-format on
#endif //NONMATCHING

void sub_020291D4(SaveData *saveData, const LinkBattleRuleset *ruleset) {
    sub_020290BC(ruleset, SaveArray_Get(saveData, SAVE_LINK_BATTLE_RULESET));
}
