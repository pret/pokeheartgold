#ifndef POKEDIAMOND_POKEMON_H
#define POKEDIAMOND_POKEMON_H

#include "pokemon_types_def.h"
#include "sprite_system.h"
#include "unk_02016EDC.h"
// Enums

#include "constants/pokemon.h"
#include "constants/species.h"

#include "filesystem.h"
#include "player_data.h"
#include "pm_string.h"
#include "sound_chatot.h"

#define LEVEL_UP_LEARNSET_END 0xFFFF
#define LEVEL_UP_LEARNSET_MAX 21

#define LEVEL_UP_LEARNSET_MOVEID_MASK  0x01FF
#define LEVEL_UP_LEARNSET_MOVEID_SHIFT 0
#define LEVEL_UP_LEARNSET_LEVEL_MASK   0xFE00
#define LEVEL_UP_LEARNSET_LEVEL_SHIFT  9

#define LEVEL_UP_LEARNSET_MOVE(x) ((u16)(((x) & LEVEL_UP_LEARNSET_MOVEID_MASK) >> LEVEL_UP_LEARNSET_MOVEID_SHIFT))
#define LEVEL_UP_LEARNSET_LVL(x)  (((x) & LEVEL_UP_LEARNSET_LEVEL_MASK) >> LEVEL_UP_LEARNSET_LEVEL_SHIFT)

#define MOVE_APPEND_FULL  0xFFFFu
#define MOVE_APPEND_KNOWN 0xFFFEu

#define BATTLE_FRONTIER_BANLIST_SIZE 18

extern const s8 gNatureStatModifiers[NATURE_COUNT][NUM_EV_STATS];

void Pokemon_Init(Pokemon *mon);
void BoxPokemon_Init(BoxPokemon *boxMon);
u32 Pokemon_Size(void);
Pokemon *Pokemon_New(enum HeapID heapID);
BOOL Pokemon_DecryptData(Pokemon *mon);
BOOL Pokemon_EncryptData(Pokemon *mon, BOOL encrypt);
BOOL BoxPokemon_DecryptData(BoxPokemon *boxMon);
BOOL BoxPokemon_EncryptData(BoxPokemon *boxMon, BOOL encrypt);
void Pokemon_InitWithParams(Pokemon *mon, int species, int level, int ivs, BOOL hasFixedPersonality, int personality, int otIDType, int otID);
void BoxPokemon_InitWithParams(BoxPokemon *boxMon, int species, int level, int ivs, BOOL hasFixedPersonality, int personality, int otIDType, int otID);
void Pokemon_InitWithNature(Pokemon *mon, u16 species, u8 level, u8 ivs, u8 nature);
void Pokemon_InitWithGenderNatureLetter(Pokemon *mon, u16 species, u8 level, u8 fixedIv, u8 gender, u8 nature, u8 letter);
u32 Personality_CreateFromGenderAndNature(u16 species, u8 gender, u8 nature);
void Pokemon_InitAndCalcStats(Pokemon *mon, int species, int level, int combinedIVs, int personality);
void Pokemon_CalcLevelAndStats(Pokemon *mon);
void Pokemon_CalcStats(Pokemon *mon);
u32 Pokemon_GetData(Pokemon *mon, int param, void *ptr);
u32 BoxPokemon_GetData(BoxPokemon *boxMon, int param, void *ptr);
void Pokemon_SetData(Pokemon *mon, int param, void *ptr);
void BoxPokemon_SetData(BoxPokemon *boxMon, int attr, void *ptr);
void Pokemon_IncreaseData(Pokemon *mon, int attr, int amount);
// void AddBoxMonData(BoxPokemon *boxMon, int attr, int amount);
SpeciesData *SpeciesData_NewFromForm(int species, int form, enum HeapID heapID);
SpeciesData *SpeciesData_NewFromSpecies(int species, enum HeapID heapID);
int SpeciesData_GetValue(SpeciesData *speciesData, int param);
void SpeciesData_Free(SpeciesData *speciesData);
int Species_GetFormValue(int species, int form, int stat_id);
int Species_GetValue(int species, int param);
u8 Pokemon_CalcPercentToNextLevel(Pokemon *mon);
u32 Pokemon_CalcExpToNextLevel(Pokemon *mon);
u32 BoxPokemon_CalcExpToNextLevel(BoxPokemon *boxMon);
u32 Pokemon_GetCurrentLevelBaseExp(Pokemon *mon);
u32 Species_GetExpAtLevel(int species, int level);
void ExpRate_LoadTable(int rate, u32 *dest);
u32 ExpRate_GetExpAtLevel(int rate, int level);
int Pokemon_CalcLevel(Pokemon *mon);
int BoxPokemon_CalcLevel(BoxPokemon *boxMon);
int Species_CalcLevelByExp(u16 species, u32 experience);
int SpeciesData_CalcLevelByExp(SpeciesData *speciesData, u16 unused_species, u32 exp);
u8 BoxPokemon_GetNature(BoxPokemon *boxMon);
u8 Pokemon_GetNature(Pokemon *mon);
u8 Personality_GetNature(u32 personality);
void Pokemon_UpdateFriendship(Pokemon *mon, u8 kind, u16 location);
u8 Pokemon_GetGender(Pokemon *mon);
u8 BoxPokemon_GetGender(BoxPokemon *boxMon);
u8 Species_GetGenderFromPersonality(u16 species, u32 personality);
u8 Pokemon_IsShiny(Pokemon *mon);
u8 BoxPokemon_IsShiny(BoxPokemon *boxMon);
u8 Personality_IsShiny(u32 otID, u32 personality);
u32 Personality_GenerateShiny(u32 otID);
u32 HoldEffect_GetArceusType(u16 holdEffect);
u8 BoxPokemon_GetForm(BoxPokemon *boxMon);
u8 Pokemon_GetForm(Pokemon *mon);
u32 Pokemon_TryAppendMove(Pokemon *mon, u16 move);
u32 BoxPokemon_TryAppendMove(BoxPokemon *boxMon, u16 move);
void BoxPokemon_SetMoveInSlot(BoxPokemon *boxMon, u16 move, u8 slot);
void Pokemon_ForceAppendMove(Pokemon *mon, u16 move);
void BoxPokemon_ForceAppendMove(BoxPokemon *boxMon, u16 move);
void Species_LoadLevelUpLearnset(int species, int form, u16 *levelUpLearnset);
void Pokemon_SwapMoveSlots(Pokemon *mon, int slot1, int slot2);
void BoxPokemon_SwapMoveSlots(BoxPokemon *boxMon, int slot1, int slot2);
BoxPokemon *Pokemon_GetBoxMon(Pokemon *mon);

u16 Pokemon_GetEvolutionTarget(Party *party, Pokemon *mon, u8 context, u16 evoParam, int *methodRet);
u16 ReadFromPersonalPmsNarc(u16 species);
u16 GetEggSpecies(u16 species);
void Pokemon_SetMoveInSlot(Pokemon *mon, u16 move, u8 slot);
void BoxPokemon_CopyToPokemon(const BoxPokemon *src, Pokemon *dest);
u8 Party_GetMaxLevel(Party *party);
u16 SpeciesToSinnohDexNo(u16 species);
u16 SinnohDexNoToSpecies(u16 sinnoh_dex);
u16 *LoadSpeciesToJohtoDexNoLUT(void);
void Pokemon_Copy(const Pokemon *src, Pokemon *dest);
void BoxPokemon_Copy(const BoxPokemon *src, BoxPokemon *dest);
void Pokemon_CopyToBoxPokemon(const Pokemon *src, BoxPokemon *dest);
s8 Pokemon_GetFlavorAffinity(Pokemon *mon, int flavor);
s8 Personality_GetFlavorAffinity(u32 personality, int flavor);
int Species_LoadLearnsetTable(u32 species, u32 form, u16 *dest);
void Party_GivePokerusAtRandom(Party *party);
u8 Party_MaskHasPokerus(Party *party, u8 partyMask);
void Party_UpdatePokerus(Party *party, int daysPassed);
void Party_SpreadPokerus(Party *party);
BOOL Pokemon_HasPokerus(Pokemon *mon);
BOOL BoxPokemon_HasPokerus(BoxPokemon *boxMon);
BOOL Pokemon_IsImmuneToPokerus(Pokemon *mon);
BOOL BoxPokemon_IsImmuneToPokerus(BoxPokemon *boxMon);
void Pokemon_UpdateArceusForm(Pokemon *mon);
void BoxPokemon_UpdateArceusForm(BoxPokemon *boxMon);
s32 Pokemon_UpdateGiratinaForm(Pokemon *mon);
s32 BoxPokemon_UpdateGiratinaForm(BoxPokemon *boxMon);
void Pokemon_UpdateShayminForm(Pokemon *mon, int form);
void BoxPokemon_UpdateShayminForm(BoxPokemon *boxMon, int form);
void Pokemon_UpdateAbility(Pokemon *mon);
void BoxPokemon_UpdateAbility(BoxPokemon *boxMon);
int LowestFlagNo(u32 mask);
BOOL Species_IsBattleFrontierBanned(u16 species, u16 form);
u16 BattleFrontier_GetBanlistEntry(u32 index);
void Pokemon_RemoveCapsule(Pokemon *mon);
void BoxPokemon_RestorePP(BoxPokemon *boxMon);
BOOL SetTrMonCapsule(int a0, Pokemon *mon, enum HeapID heapID);

int Species_GetFormValueFromNarc(NARC *narc, int species, int form, int param);
u16 Nature_ModifyStatValue(u8 nature, u16 value, u8 stat);
u8 SpeciesData_GetGenderFromPersonality(SpeciesData *speciesData, u16 unused_species, u32 pid);
BOOL BoxPokemon_IsHoldingMail(BoxPokemon *boxMon);
void Pokemon_BuildSpriteTemplate(PokemonSpriteTemplate *template, Pokemon *mon, u8 face);
void BoxPokemon_BuildSpriteTemplateDP(PokemonSpriteTemplate *template, BoxPokemon *boxMon, u8 face);
void BoxPokemon_BuildSpriteTemplate(PokemonSpriteTemplate *template, BoxPokemon *boxMon, u8 face, BOOL preferDP);
void Species_BuildSpriteTemplate(PokemonSpriteTemplate *template, u16 species, u8 gender, u8 face, u8 shiny, u8 form, u32 personality);
u8 Species_SanitizeFormId(u16 species, u8 form);
void sub_02070560(PokemonSpriteTemplate *template, u16 species, u8 face, u8 gender, u32 shiny);
u8 sub_0207083C(BoxPokemon *boxMon, u8 face);
u8 sub_02070848(BoxPokemon *boxMon, u8 face);
u8 BoxPokemon_SpriteYOffset(BoxPokemon *boxMon, u8 face, BOOL preferDP);
u8 Species_LoadSpriteYOffset(u16 species, u8 gender, u8 face, u8 form, u32 pid);
u8 GetMonPicHeightBySpeciesGenderForme_PBR(u16 species, u8 gender, u8 face, u8 form, u32 pid);
struct ManagedSprite *sub_02070C24(SpriteSystem *renderer, SpriteManager *gfxHandler, PaletteData *plttData, int x, int y, int trainerClass, int battlerPosition, BOOL isLink, int resTag, enum HeapID heapID);
void sub_02070D3C(s32 trainer_class, s32 a1, BOOL a2, struct UnkStruct_02070D3C *a3);
void sub_02070D84(s32 trainer_class, s32 a1, struct UnkStruct_02070D3C *a2);
u32 Pokemon_Size2(void);
u32 BoxPokemon_Size(void);
BoxPokemon *Pokemon_GetBoxMon(Pokemon *mon);
BOOL Pokemon_TryLevelUp(Pokemon *mon);
void BoxPokemon_SetDefaultMoves(BoxPokemon *boxMon);
void Pokemon_SetMoveInSlot_ResetPPUp(Pokemon *mon, u16 move, u8 slot);
u32 Pokemon_TryLevelUpMove(Pokemon *mon, int *last_i, u16 *sp0);
void Pokemon_ClearMoveSlot(Pokemon *mon, u32 slot);
u16 SpeciesToJohtoDexNo(u16 species);
void Pokemon_ForceSetGiratinaOriginForm(Pokemon *mon);
void Party_UpdateGiratinaForms(Party *party, BOOL forceOrigin);
BOOL Pokemon_CanShayminSkyForm(Pokemon *mon);
void Party_SetShayminLandForms(Party *party);
BOOL Party_UpdateShayminForms(Party *party, int minutesDiff, const RTCTime *time);
BOOL Pokemon_UpdateRotomForm(Pokemon *mon, int form, int moveSlot);
void sub_02071FDC(SOUND_CHATOT *r6, u32 r5, u16 r4, s32 unused, s32 sp18, u32 sp1C, u32 sp20, u32 sp24);
void sub_0207204C(SOUND_CHATOT *r7, u32 r6, u16 r5, s32 r4, s32 sp20, u32 sp24, u32 sp28, u32 sp2C, u8 sp30);
void sub_020720D4(Pokemon *mon);
void sub_020720FC(Pokemon *mon, PlayerProfile *a1, u32 pokeball, u32 a3, u32 encounterType, enum HeapID heapID);
void sub_0207213C(BoxPokemon *boxMon, PlayerProfile *playerProfile, u32 pokeball, u32 a3, u32 encounterType, enum HeapID heapID);
void sub_0207217C(Pokemon *mon, PlayerProfile *a1, u32 pokeball, u32 a3, u32 encounterType, enum HeapID heapID);
void sub_02072190(BoxPokemon *boxMon, PlayerProfile *a1, u32 pokeball, u32 a3, u32 encounterType, enum HeapID heapID);
void Pokemon_GiveWildHeldItem(Pokemon *mon, u32 battleType, u32 itemRates);
BOOL Pokemon_CanLearnTMHM(Pokemon *mon, u8 tmHM);
BOOL BoxPokemon_CanLearnTMHM(BoxPokemon *boxMon, u8 tmHM);
BOOL Species_CanLearnTMHM(u16 species, u32 form, u8 tmHM);
void Pokemon_SetPersonality(Pokemon *mon, u32 personality);
u32 Personality_ChangeNatureGenderAbility(u32 personality, u16 species, u8 nature, u8 gender, u8 ability, BOOL gen_mode);
void SpeciesData_LoadSpecies(int species, SpeciesData *personal);
void SpeciesData_LoadForm(int species, int form, SpeciesData *speciesData);
void Species_LoadEvolutions(u16 species, Evolution *dest);
void MonEncryptSegment(void *data, u32 size, u32 seed);
void MonDecryptSegment(void *data, u32 size, u32 seed);
u32 CalcMonChecksum(void *_data, u32 size);
int Species_GetFormNarcIndex(int species, int form);
u32 MaskOfFlagNo(int flagno);
BOOL Species_IsMythical(u16 species);
BOOL Pokemon_IsBattleFrontierBanned(Pokemon *mon);
BOOL BoxPokemon_BelongsToPlayer(BoxPokemon *boxMon, PlayerProfile *player, enum HeapID heapID);
int TrainerClassToBackpicID(int trainerClass, BOOL a1);
void NARC_ReadPokepicAnimScript(NARC *narc, PokepicAnimScript *dest, u16 species, u16 a3);
void sub_0207294C(NARC *narc, void *a1, void *a2, u16 a3, int a4, int a5, int a6);
void sub_020729A4(NARC *narc, u8 *ret, u16 a2, u16 a3);
void sub_020729D8(NARC *narc, s8 *ret, u16 a2, u16 a3);
void sub_020729FC(NARC *narc, s8 *ret, u16 a2, u16 a3);
void sub_02072A20(NARC *narc, u8 *ret, u16 a2, u16 a3);
void sub_02072A98(Pokemon *mon, struct UnkPokemonStruct_02072A98 *dest);
void sub_02072D64(const struct UnkPokemonStruct_02072A98 *src, Pokemon *mon);
u32 _u32_getDigitN(u32 num, u8 digit);
s16 PokeathlonStatScoreToStars(s16 a0);
void CalcBoxMonPokeathlonPerformance(BoxPokemon *boxMon, struct PokeathlonTodayPerformance *dest);
void CalcMonPokeathlonPerformance(Pokemon *mon, struct PokeathlonTodayPerformance *dest);
void CalcBoxmonPokeathlonStars(struct PokeathlonPerformanceStars *dest, BoxPokemon *boxMon, const s8 *aprijuice, enum HeapID heapID);
void CalcMonPokeathlonStars(struct PokeathlonPerformanceStars *dest, Pokemon *mon, const s8 *aprijuice, enum HeapID heapID);

#endif // POKEDIAMOND_POKEMON_H
