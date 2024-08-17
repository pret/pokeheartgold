#ifndef POKEHEARTGOLD_SAVE_LINK_RULESET_H
#define POKEHEARTGOLD_SAVE_LINK_RULESET_H

#include "pm_string.h"
#include "save.h"

typedef enum LinkBattleRule {
    LINKBATTLERULE_NONE,
    LINKBATTLERULE_PARTY_COUNT,
    LINKBATTLERULE_MAX_LEVEL,
    LINKBATTLERULE_MAX_TOTAL_LEVEL,
    LINKBATTLERULE_BABY_CUP,
    LINKBATTLERULE_HEIGHT_LIMIT,
    LINKBATTLERULE_HEIGHT_LIMIT_COMPARE,
    LINKBATTLERULE_WEIGHT_LIMIT,
    LINKBATTLERULE_WEIGHT_LIMIT_COMPARE,
    LINKBATTLERULE_ITEM_DUPE_CLAUSE,
    LINKBATTLERULE_SPECIES_DUPE_CLAUSE,
    LINKBATTLERULE_UBERS_CLAUSE,
    LINKBATTLERULE_12,
    LINKBATTLERULE_SOUL_DEW_CLAUSE,
} LinkBattleRule;

typedef struct LinkBattleRuleset {
    u16 name[12];
    u16 totalLevel;  // overloaded with soul dew clause
    u8 partyCount;
    u8 maxLevel;
    s8 heightLimit;
    s8 weightLimit;
    u8 babyCup:1;
    u8 ubersClause:1;
    u8 speciesDupeClause:1;
    u8 itemDupeClause:1;
    u8 unk_1E_4:1;
} LinkBattleRuleset;
typedef struct Save_LinkBattleRuleset Save_LinkBattleRuleset;

u32 sub_020290B4(void);
u32 Save_LinkBattleRuleset_sizeof(void);
void sub_020290BC(const LinkBattleRuleset *src, Save_LinkBattleRuleset *dst);
void Save_LinkBattleRuleset_Init(Save_LinkBattleRuleset *ruleset);
void sub_020290D4(const LinkBattleRuleset *rule, String *dest);
void sub_020291D4(SaveData *saveData, LinkBattleRuleset *rule);
String *sub_020290E4(const LinkBattleRuleset *rule, HeapID heapId);
BOOL sub_020291A4(SaveData *saveData, int a1);
u32 sub_02029264(void *a0);
int LinkBattleRuleset_GetRuleValue(LinkBattleRuleset *ruleset, int a1);

#endif //POKEHEARTGOLD_SAVE_LINK_RULESET_H
