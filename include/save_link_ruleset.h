#ifndef POKEHEARTGOLD_SAVE_LINK_RULESET_H
#define POKEHEARTGOLD_SAVE_LINK_RULESET_H

#include "pm_string.h"
#include "save.h"

#define NUM_SAVE_LINK_BATTLE_RULESETS (1)

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
    LINKBATTLERULE_DRAGON_RAGE_CLAUSE,
    LINKBATTLERULE_SOUL_DEW_CLAUSE,
} LinkBattleRule;

#define FLAG_RULESET_BAN_SOUL_DEW (0x8000)

typedef struct LinkBattleRuleset {
    u16 name[12];
    u16 totalLevel;           // maximum sum of party levels
                              // lower 12 bits hold level; bit 15 intended to ban soul dew
    u8 partyCount;            // exact number of mons required
    u8 maxLevel;              // max level for a single mon
    s8 heightLimit;           // if positive: minimum mon height; if negative, absolute value is maximum mon height
    s8 weightLimit;           // if positive: minimum mon weight; if negative, absolute value is maximum mon weight
    u8 evolvedPokemon : 1;    // if true, can only use unevolved pokemon
    u8 ubersClause : 1;       // if true, cannot use legendaries
    u8 speciesDupeClause : 1; // if true, can't have two Pokemon of the same species
    u8 itemDupeClause : 1;    // if true, can't have two Pokemon holding the same item
    u8 dragonRageClause : 1;  // if true, fixed-damage moves like SonicBoom and Dragon Rage will always fail
} LinkBattleRuleset;

typedef struct Save_LinkBattleRuleset {
    LinkBattleRuleset rules[NUM_SAVE_LINK_BATTLE_RULESETS];
} Save_LinkBattleRuleset;

u32 LinkBattleRuleset_sizeof(void);
u32 Save_LinkBattleRuleset_sizeof(void);
void LinkBattleRuleset_Copy(const LinkBattleRuleset *src, LinkBattleRuleset *dst);
void Save_LinkBattleRuleset_Init(Save_LinkBattleRuleset *ruleset);
void LinkBattleRuleset_CopyNameToString(const LinkBattleRuleset *rule, String *dest);
String *LinkBattleRuleset_CreateStringFromName(const LinkBattleRuleset *rule, HeapID heapId);
int LinkBattleRuleset_GetRuleValue(const LinkBattleRuleset *ruleset, LinkBattleRule rule);
LinkBattleRuleset *Save_LinkBattleRuleset_GetByIndex(SaveData *saveData, int a1);
void Save_LinkBattleRuleset_Set(SaveData *saveData, const LinkBattleRuleset *rule);

#endif // POKEHEARTGOLD_SAVE_LINK_RULESET_H
