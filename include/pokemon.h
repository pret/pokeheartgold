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

#define NUM_BANNED_BATTLE_FRONTIER 18

extern const s8 gNatureStatMods[NATURE_NUM][NUM_EV_STATS];

void ZeroMonData(Pokemon *mon);
void ZeroBoxMonData(BoxPokemon *boxMon);
u32 SizeOfStructPokemon(void);
Pokemon *AllocMonZeroed(HeapID heapId);
BOOL AcquireMonLock(Pokemon *mon);
BOOL ReleaseMonLock(Pokemon *mon, BOOL decrypt_result);
BOOL AcquireBoxMonLock(BoxPokemon *boxMon);
BOOL ReleaseBoxMonLock(BoxPokemon *boxMon, BOOL decrypt_result);
void CreateMon(Pokemon *mon, int species, int level, int fixedIV, int hasFixedPersonality, int fixedPersonality, int otIdType, int fixedOtId);
void CreateBoxMon(BoxPokemon *boxMon, int species, int level, int fixedIV, int hasFixedPersonality, int fixedPersonality, int otIdType, int fixedOtId);
void CreateMonWithNature(Pokemon *mon, u16 species, u8 level, u8 fixedIv, u8 nature);
void CreateMonWithGenderNatureLetter(Pokemon *mon, u16 species, u8 level, u8 fixedIv, u8 gender, u8 nature, u8 letter);
u32 GenPersonalityByGenderAndNature(u16 species, u8 gender, u8 nature);
void CreateMonWithFixedIVs(Pokemon *mon, int species, int level, int ivs, int personality);
void CalcMonLevelAndStats(Pokemon *mon);
void CalcMonStats(Pokemon *mon);
u32 GetMonData(Pokemon *mon, int attr, void *ptr);
u32 GetBoxMonData(BoxPokemon *boxMon, int attr, void *ptr);
void SetMonData(Pokemon *mon, int attr, const void *ptr);
void SetBoxMonData(BoxPokemon *boxMon, int attr, const void *ptr);
void AddMonData(Pokemon *mon, int attr, int amount);
// void AddBoxMonData(BoxPokemon *boxMon, int attr, int amount);
BASE_STATS *AllocAndLoadMonPersonal_HandleAlternateForm(int species, int form, HeapID heapId);
BASE_STATS *AllocAndLoadMonPersonal(int species, HeapID heapId);
int GetPersonalAttr(const BASE_STATS *baseStats, int attr);
void FreeMonPersonal(BASE_STATS *personal);
int GetMonBaseStat_HandleAlternateForm(int species, int form, int stat_id);
int GetMonBaseStat(int species, int stat_id);
u8 GetPercentProgressTowardsNextLevel(Pokemon *mon);
u32 CalcMonExpToNextLevel(Pokemon *mon);
u32 CalcBoxMonExpToNextLevel(BoxPokemon *boxMon);
u32 GetMonBaseExperienceAtCurrentLevel(Pokemon *mon);
u32 GetMonExpBySpeciesAndLevel(int species, int level);
void LoadGrowthTable(int growthRate, u32 *table);
u32 GetExpByGrowthRateAndLevel(int rate, int level);
int CalcMonLevel(Pokemon *mon);
int CalcBoxMonLevel(BoxPokemon *boxMon);
int CalcLevelBySpeciesAndExp(u16 species, u32 experience);
int CalcLevelBySpeciesAndExp_PreloadedPersonal(BASE_STATS *personal, u16 species, u32 experience);
u8 GetBoxMonNature(BoxPokemon *boxMon);
u8 GetMonNature(Pokemon *mon);
u8 GetNatureFromPersonality(u32 pid);
void MonApplyFriendshipMod(Pokemon *mon, u8 kind, u16 location);
u8 GetMonGender(Pokemon *mon);
u8 GetBoxMonGender(BoxPokemon *boxMon);
u8 GetGenderBySpeciesAndPersonality(u16 species, u32 pid);
u8 MonIsShiny(Pokemon *mon);
u8 BoxMonIsShiny(BoxPokemon *boxMon);
u8 CalcShininessByOtIdAndPersonality(u32 otid, u32 pid);
u32 GenerateShinyPersonality(u32 otid);
u32 GetArceusTypeByHeldItemEffect(u16 plate);
u8 GetBoxMonUnownLetter(BoxPokemon *boxMon);
u8 GetMonUnownLetter(Pokemon *mon);
u32 TryAppendMonMove(Pokemon *mon, u16 move);
u32 TryAppendBoxMonMove(BoxPokemon *boxMon, u16 move);
void BoxMonSetMoveInSlot(BoxPokemon *boxMon, u16 move, u8 slot);
void DeleteMonFirstMoveAndAppend(Pokemon *mon, u16 move);
void DeleteBoxMonFirstMoveAndAppend(BoxPokemon *boxMon, u16 move);
void LoadLevelUpLearnset_HandleAlternateForm(int species, int form, u16 *levelUpLearnset);
void MonSwapMoves(Pokemon *mon, int a, int b);
void BoxMonSwapMoves(BoxPokemon *boxMon, int a, int b);
BoxPokemon *Mon_GetBoxMon(Pokemon *mon);

u16 GetMonEvolution(Party *party, Pokemon *mon, u8 context, u16 usedItem, int *method_ret);
u16 ReadFromPersonalPmsNarc(u16 species);
u16 GetEggSpecies(u16 species);
void MonSetMoveInSlot(Pokemon *mon, u16 move, u8 slot);
void CopyBoxPokemonToPokemon(const BoxPokemon *src, Pokemon *dest);
u8 Party_GetMaxLevel(Party *party);
u16 SpeciesToSinnohDexNo(u16 species);
u16 SinnohDexNoToSpecies(u16 sinnoh_dex);
u16 *LoadSpeciesToJohtoDexNoLUT(void);
void CopyPokemonToPokemon(const Pokemon *src, Pokemon *dest);
void CopyBoxPokemonToBoxPokemon(const BoxPokemon *src, BoxPokemon *dest);
void CopyPokemonToBoxPokemon(const Pokemon *src, BoxPokemon *dest);
s8 MonGetFlavorPreference(Pokemon *mon, int flavor);
s8 BoxMonGetFlavorPreference(BoxPokemon *boxMon, int flavor);
s8 GetFlavorPreferenceFromPID(u32 personality, int flavor);
int Species_LoadLearnsetTable(u32 species, u32 form, u16 *dest);
void Party_GivePokerusAtRandom(Party *party);
u8 Party_MaskMonsWithPokerus(Party *party, u8 mask);
void Party_UpdatePokerus(Party *party, int r5);
void Party_SpreadPokerus(Party *party);
BOOL Pokemon_HasPokerus(Pokemon *mon);
BOOL BoxMon_HasPokerus(BoxPokemon *boxMon);
BOOL Pokemon_IsImmuneToPokerus(Pokemon *mon);
BOOL BoxMon_IsImmuneToPokerus(BoxPokemon *boxMon);
void Pokemon_UpdateArceusForm(Pokemon *mon);
void BoxMon_UpdateArceusForm(BoxPokemon *boxMon);
s32 Mon_UpdateGiratinaForm(Pokemon *mon);
s32 BoxMon_UpdateGiratinaForm(BoxPokemon *boxMon);
void Mon_UpdateShayminForm(Pokemon *mon, int form);
void BoxMon_UpdateShayminForm(BoxPokemon *boxMon, int form);
void UpdateMonAbility(Pokemon *mon);
void UpdateBoxMonAbility(BoxPokemon *boxMon);
int LowestFlagNo(u32 mask);
BOOL IsPokemonBannedFromBattleFrontier(u16 species, u16 form);
u16 GetBannedBattleFrontierPokemon(u32 idx);
void Pokemon_RemoveCapsule(Pokemon *mon);
void RestoreBoxMonPP(BoxPokemon *boxMon);
BOOL SetTrMonCapsule(int a0, Pokemon *mon, HeapID heapId);

int GetMonBaseStatEx_HandleAlternateForm(NARC *narc, int species, int form, int attr);
u16 ModifyStatByNature(u8 nature, u16 n, u8 statIndex);
u8 GetGenderBySpeciesAndPersonality_PreloadedPersonal(const BASE_STATS *personal, u16 species, u32 pid);
BOOL BoxMonIsHoldingMail(BoxPokemon *boxMon);
void GetPokemonSpriteCharAndPlttNarcIds(PokepicTemplate *pokepicTemplate, Pokemon *mon, u8 whichFacing);
void sub_02070130(PokepicTemplate *pokepicTemplate, BoxPokemon *boxMon, u8 whichFacing);
void GetBoxmonSpriteCharAndPlttNarcIds(PokepicTemplate *pokepicTemplate, BoxPokemon *boxMon, u8 whichFacing, BOOL sp14);
void GetMonSpriteCharAndPlttNarcIdsEx(PokepicTemplate *pokepicTemplate, u16 species, u8 gender, u8 whichFacing, u8 shiny, u8 form, u32 personality);
u8 sub_02070438(u16 species, u8 form);
void sub_02070560(PokepicTemplate *pokepicTemplate, u16 species, u8 whichFacing, u8 gender, u32 shiny);
void DP_GetMonSpriteCharAndPlttNarcIdsEx(PokepicTemplate *pokepicTemplate, u16 species, u8 gender, u8 whichFacing, u8 shiny, u8 form, u32 personality);
u8 sub_0207083C(BoxPokemon *boxMon, u8 whichFacing);
u8 sub_02070848(BoxPokemon *boxMon, u8 whichFacing);
u8 sub_02070854(BoxPokemon *boxMon, u8 whichFacing, BOOL a2);
u8 GetMonPicHeightBySpeciesGenderForm(u16 species, u8 gender, u8 whichFacing, u8 form, u32 pid);
u8 GetMonPicHeightBySpeciesGenderForme_PBR(u16 species, u8 gender, u8 whichFacing, u8 form, u32 pid);
struct ManagedSprite *sub_02070C24(SpriteSystem *renderer, SpriteManager *gfxHandler, PaletteData *plttData, int x, int y, int trainerClass, int battlerPosition, BOOL isLink, int resTag, HeapID heapId);
void sub_02070D3C(s32 trainer_class, s32 a1, BOOL a2, struct UnkStruct_02070D3C *a3);
void sub_02070D84(s32 trainer_class, s32 a1, struct UnkStruct_02070D3C *a2);
u32 sub_02070D90(void);
u32 sub_02070D94(void);
BoxPokemon *Mon_GetBoxMon(Pokemon *mon);
BOOL Pokemon_TryLevelUp(Pokemon *mon);
void InitBoxMonMoveset(BoxPokemon *boxMon);
void MonSetMoveInSlot_ResetPpUp(Pokemon *mon, u16 move, u8 slot);
u32 MonTryLearnMoveOnLevelUp(Pokemon *mon, int *last_i, u16 *sp0);
void MonDeleteMoveSlot(Pokemon *mon, u32 slot);
BOOL MonHasMove(Pokemon *mon, u16 move);
u16 SpeciesToJohtoDexNo(u16 species);
void Mon_ForceSetGiratinaOriginForm(Pokemon *mon);
void Party_UpdateAllGiratina_DistortionWorld(Party *party, BOOL force_origin);
BOOL Mon_CanUseGracidea(Pokemon *mon);
void Party_ResetAllShayminToLandForm(Party *party);
BOOL Party_TryResetShaymin(Party *party, int min_max, const RTCTime *time);
BOOL Mon_UpdateRotomForm(Pokemon *mon, int form, int defaultSlot);
void sub_02071FDC(SOUND_CHATOT *r6, u32 r5, u16 r4, s32 unused, s32 sp18, u32 sp1C, u32 sp20, u32 sp24);
void sub_0207204C(SOUND_CHATOT *r7, u32 r6, u16 r5, s32 r4, s32 sp20, u32 sp24, u32 sp28, u32 sp2C, u8 sp30);
void sub_020720D4(Pokemon *mon);
void sub_020720FC(Pokemon *mon, PlayerProfile *a1, u32 pokeball, u32 a3, u32 encounterType, HeapID heapId);
void sub_0207213C(BoxPokemon *boxMon, PlayerProfile *playerProfile, u32 pokeball, u32 a3, u32 encounterType, HeapID heapId);
void sub_0207217C(Pokemon *mon, PlayerProfile *a1, u32 pokeball, u32 a3, u32 encounterType, HeapID heapId);
void sub_02072190(BoxPokemon *boxMon, PlayerProfile *a1, u32 pokeball, u32 a3, u32 encounterType, HeapID heapId);
void WildMonSetRandomHeldItem(Pokemon *mon, u32 a1, u32 a2);
BOOL GetMonTMHMCompat(Pokemon *mon, u8 tmhm);
BOOL GetBoxMonTMHMCompat(BoxPokemon *boxMon, u8 tmhm);
BOOL GetTMHMCompatBySpeciesAndForm(u16 species, u32 form, u8 tmhm);
void SetMonPersonality(Pokemon *mon, u32 personality);
u32 ChangePersonalityToNatureGenderAndAbility(u32 pid, u16 species, u8 nature, u8 gender, u8 ability, BOOL gen_mode);
void LoadMonPersonal(int species, BASE_STATS *personal);
void LoadMonBaseStats_HandleAlternateForm(int species, int form, BASE_STATS *personal);
void LoadMonEvolutionTable(u16 species, struct Evolution *evo);
void MonEncryptSegment(void *data, u32 size, u32 seed);
void MonDecryptSegment(void *data, u32 size, u32 seed);
u32 CalcMonChecksum(void *_data, u32 size);
int ResolveMonForm(int species, int form);
u32 MaskOfFlagNo(int flagno);
BOOL SpeciesIsMythical(u16 species);
BOOL MonCheckFrontierIneligibility(Pokemon *mon);
BOOL BoxmonBelongsToPlayer(BoxPokemon *boxMon, PlayerProfile *profile, HeapID heapId);
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
void CalcBoxmonPokeathlonStars(struct PokeathlonPerformanceStars *dest, BoxPokemon *boxMon, const s8 *aprijuice, HeapID heapId);
void CalcMonPokeathlonStars(struct PokeathlonPerformanceStars *dest, Pokemon *mon, const s8 *aprijuice, HeapID heapId);

#endif // POKEDIAMOND_POKEMON_H
