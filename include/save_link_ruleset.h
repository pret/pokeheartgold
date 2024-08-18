#ifndef POKEHEARTGOLD_SAVE_LINK_RULESET_H
#define POKEHEARTGOLD_SAVE_LINK_RULESET_H

#include "pm_string.h"
#include "save.h"

#define NUM_SAVE_LINK_BATTLE_RULESETS       (1)

typedef enum LinkBattleRule {
    LINKBATTLERULE_NONE,
    LINKBATTLERULE_PARTY_COUNT,
    LINKBATTLERULE_MAX_LEVEL,
    LINKBATTLERULE_MAX_TOTAL_LEVEL,
    LINKBATTLERULE_EVOLVED_POKEMON,
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

#define FLAG_RULESET_BAN_SOUL_DEW         (0x8000)

typedef struct LinkBattleRuleset {
    u16 name[12];
    u16 totalLevel;  // lower 12 bits hold level; bit 15 intended to ban soul dew
    u8 partyCount;
    u8 maxLevel;
    s8 heightLimit;
    s8 weightLimit;
    u8 evolvedPokemon:1;
    u8 ubersClause:1;
    u8 speciesDupeClause:1;
    u8 itemDupeClause:1;
    u8 unk_1E_4:1;
} LinkBattleRuleset;

typedef struct Save_LinkBattleRuleset {
    LinkBattleRuleset rules[NUM_SAVE_LINK_BATTLE_RULESETS];
} Save_LinkBattleRuleset;

u32 sub_020290B4(void);
u32 Save_LinkBattleRuleset_sizeof(void);
void sub_020290BC(const LinkBattleRuleset *src, LinkBattleRuleset *dst);
void Save_LinkBattleRuleset_Init(Save_LinkBattleRuleset *ruleset);
void sub_020290D4(const LinkBattleRuleset *rule, String *dest);
String *sub_020290E4(const LinkBattleRuleset *rule, HeapID heapId);
int LinkBattleRuleset_GetRuleValue(LinkBattleRuleset *ruleset, LinkBattleRule rule);
LinkBattleRuleset *sub_020291A4(SaveData *saveData, int a1);
void sub_020291D4(SaveData *saveData, const LinkBattleRuleset *rule);

#endif //POKEHEARTGOLD_SAVE_LINK_RULESET_H
