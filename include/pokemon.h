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

void Pokemon_ZeroMonData(Pokemon *mon);
void BoxPokemon_ZeroBoxMonData(BoxPokemon *boxMon);
u32 SizeOfStructPokemon(void);
Pokemon *AllocMonZeroed(enum HeapID heapID);
BOOL Pokemon_AcquireMonLock(Pokemon *mon);
BOOL Pokemon_ReleaseMonLock(Pokemon *mon, BOOL decrypt_result);
BOOL BoxPokemon_AcquireBoxMonLock(BoxPokemon *boxMon);
BOOL BoxPokemon_ReleaseBoxMonLock(BoxPokemon *boxMon, BOOL decrypt_result);
void Pokemon_CreateMon(Pokemon *mon, int species, int level, int fixedIV, int hasFixedPersonality, int fixedPersonality, int otIdType, int fixedOtId);
void BoxPokemon_CreateBoxMon(BoxPokemon *boxMon, int species, int level, int fixedIV, int hasFixedPersonality, int fixedPersonality, int otIdType, int fixedOtId);
void Pokemon_CreateMonWithNature(Pokemon *mon, u16 species, u8 level, u8 fixedIv, u8 nature);
void Pokemon_CreateMonWithGenderNatureLetter(Pokemon *mon, u16 species, u8 level, u8 fixedIv, u8 gender, u8 nature, u8 letter);
u32 GenPersonalityByGenderAndNature(u16 species, u8 gender, u8 nature);
void Pokemon_CreateMonWithFixedIVs(Pokemon *mon, int species, int level, int ivs, int personality);
void Pokemon_CalcMonLevelAndStats(Pokemon *mon);
void Pokemon_CalcMonStats(Pokemon *mon);
u32 Pokemon_GetMonData(Pokemon *mon, int attr, void *ptr);
u32 BoxPokemon_GetData(BoxPokemon *boxMon, int attr, void *ptr);
void Pokemon_SetData(Pokemon *mon, int attr, const void *ptr);
void BoxPokemon_SetData(BoxPokemon *boxMon, int attr, const void *ptr);
void Pokemon_AddData(Pokemon *mon, int attr, int amount);
// void AddBoxMonData(BoxPokemon *boxMon, int attr, int amount);
BASE_STATS *AllocAndLoadMonPersonal_HandleAlternateForm(int species, int form, enum HeapID heapID);
BASE_STATS *AllocAndLoadMonPersonal(int species, enum HeapID heapID);
int GetPersonalAttr(const BASE_STATS *baseStats, int attr);
void FreeMonPersonal(BASE_STATS *personal);
int GetMonBaseStat_HandleAlternateForm(int species, int form, int stat_id);
int GetMonBaseStat(int species, int stat_id);
u8 Pokemon_GetPercentProgressTowardsNextLevel(Pokemon *mon);
u32 Pokemon_CalcExpToNextLevel(Pokemon *mon);
u32 BoxPokemon_CalcExpToNextLevel(BoxPokemon *boxMon);
u32 Pokemon_GetBaseExperienceAtCurrentLevel(Pokemon *mon);
u32 GetMonExpBySpeciesAndLevel(int species, int level);
void LoadGrowthTable(int growthRate, u32 *table);
u32 GetExpByGrowthRateAndLevel(int rate, int level);
int Pokemon_CalcLevel(Pokemon *mon);
int BoxPokemon_CalcLevel(BoxPokemon *boxMon);
int CalcLevelBySpeciesAndExp(u16 species, u32 experience);
int CalcLevelBySpeciesAndExp_PreloadedPersonal(BASE_STATS *personal, u16 species, u32 experience);
u8 BoxPokemon_GetNature(BoxPokemon *boxMon);
u8 Pokemon_GetNature(Pokemon *mon);
u8 GetNatureFromPersonality(u32 pid);
void Pokemon_ApplyFriendshipMod(Pokemon *mon, u8 kind, u16 location);
u8 Pokemon_GetGender(Pokemon *mon);
u8 BoxPokemon_GetGender(BoxPokemon *boxMon);
u8 GetGenderBySpeciesAndPersonality(u16 species, u32 pid);
u8 Pokemon_IsShiny(Pokemon *mon);
u8 BoxPokemon_IsShiny(BoxPokemon *boxMon);
u8 CalcShininessByOtIdAndPersonality(u32 otid, u32 pid);
u32 GenerateShinyPersonality(u32 otid);
u32 GetArceusTypeByHeldItemEffect(u16 plate);
u8 BoxPokemon_GetUnownLetter(BoxPokemon *boxMon);
u8 Pokemon_GetUnownLetter(Pokemon *mon);
u32 Pokemon_TryAppendMonMove(Pokemon *mon, u16 move);
u32 BoxPokemon_TryAppendMove(BoxPokemon *boxMon, u16 move);
void BoxPokemon_SetMoveInSlot(BoxPokemon *boxMon, u16 move, u8 slot);
void DeleteMonFirstMoveAndAppend(Pokemon *mon, u16 move);
void BoxPokemon_DeleteFirstMoveAndAppend(BoxPokemon *boxMon, u16 move);
void LoadLevelUpLearnset_HandleAlternateForm(int species, int form, u16 *levelUpLearnset);
void Pokemon_SwapMoves(Pokemon *mon, int a, int b);
void BoxPokemon_SwapMoves(BoxPokemon *boxMon, int a, int b);
BoxPokemon *Pokemon_GetBox(Pokemon *mon);

u16 Pokemon_GetEvolution(Party *party, Pokemon *mon, u8 context, u16 usedItem, int *method_ret);
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
s8 Pokemon_GetFlavorPreference(Pokemon *mon, int flavor);
s8 BoxPokemon_GetFlavorPreference(BoxPokemon *boxMon, int flavor);
s8 GetFlavorPreferenceFromPID(u32 personality, int flavor);
int Species_LoadLearnsetTable(u32 species, u32 form, u16 *dest);
void Party_GivePokerusAtRandom(Party *party);
u8 Party_MaskMonsWithPokerus(Party *party, u8 mask);
void Party_UpdatePokerus(Party *party, int r5);
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
BOOL IsPokemonBannedFromBattleFrontier(u16 species, u16 form);
u16 GetBannedBattleFrontierPokemon(u32 idx);
void Pokemon_RemoveCapsule(Pokemon *mon);
void BoxPokemon_RestorePP(BoxPokemon *boxMon);
BOOL Pokemon_SetTrCapsule(int a0, Pokemon *mon, enum HeapID heapID);

int GetMonBaseStatEx_HandleAlternateForm(NARC *narc, int species, int form, int attr);
u16 ModifyStatByNature(u8 nature, u16 n, u8 statIndex);
u8 GetGenderBySpeciesAndPersonality_PreloadedPersonal(const BASE_STATS *personal, u16 species, u32 pid);
BOOL BoxPokemon_IsHoldingMail(BoxPokemon *boxMon);
void PokepicTemplate_GetPokemonSpriteCharAndPlttNarcIds(PokepicTemplate *pokepicTemplate, Pokemon *mon, u8 whichFacing);
void PokepicTemplate_GetPokemonSpriteCharAndPlttNarcIds_DP(PokepicTemplate *pokepicTemplate, BoxPokemon *boxMon, u8 whichFacing);
void PokepicTemplate_GetBoxmonSpriteCharAndPlttNarcIds(PokepicTemplate *pokepicTemplate, BoxPokemon *boxMon, u8 whichFacing, BOOL sp14);
void PokepicTemplate_GetMonSpriteCharAndPlttNarcIdsEx(PokepicTemplate *pokepicTemplate, u16 species, u8 gender, u8 whichFacing, u8 shiny, u8 form, u32 personality);
u8 SanitizeFormId(u16 species, u8 form);
void PokepicTemplate_UseDPForm(PokepicTemplate *pokepicTemplate, u16 species, u8 whichFacing, u8 gender, u32 shiny);
void PokepicTemplate_GetMonSpriteCharAndPlttNarcIdsEx_DP(PokepicTemplate *pokepicTemplate, u16 species, u8 gender, u8 whichFacing, u8 shiny, u8 form, u32 personality);
u8 BoxPokemon_GetPicHeight(BoxPokemon *boxMon, u8 whichFacing);
u8 BoxPokemon_GetPicHeight_DP(BoxPokemon *boxMon, u8 whichFacing);
u8 BoxPokemon_SpriteYOffset(BoxPokemon *boxMon, u8 whichFacing, BOOL preferDP);
u8 GetMonPicHeightBySpeciesGenderForm(u16 species, u8 gender, u8 whichFacing, u8 form, u32 pid);
u8 GetMonPicHeightBySpeciesGenderForme_PBR(u16 species, u8 gender, u8 whichFacing, u8 form, u32 pid);
struct ManagedSprite *sub_02070C24(SpriteSystem *renderer, SpriteManager *gfxHandler, PaletteData *plttData, int x, int y, int trainerClass, int battlerPosition, BOOL isLink, int resTag, enum HeapID heapID);
void sub_02070D3C(s32 trainer_class, s32 a1, BOOL a2, struct UnkStruct_02070D3C *a3);
void sub_02070D84(s32 trainer_class, s32 a1, struct UnkStruct_02070D3C *a2);
u32 GetSizeOfBoxAndPartyStorages(void);
u32 GetSizeOfBoxStorage(void);
BoxPokemon *Pokemon_GetBox(Pokemon *mon);
BOOL Pokemon_TryLevelUp(Pokemon *mon);
void BoxPokemon_InitMoveset(BoxPokemon *boxMon);
void Pokemon_SetMoveInSlot_ResetPpUp(Pokemon *mon, u16 move, u8 slot);
u32 Pokemon_TryLearnMoveOnLevelUp(Pokemon *mon, int *last_i, u16 *sp0);
void Pokemon_DeleteMoveSlot(Pokemon *mon, u32 slot);
BOOL Pokemon_HasMove(Pokemon *mon, u16 move);
u16 SpeciesToJohtoDexNo(u16 species);
void Pokemon_ForceSetGiratinaOriginForm(Pokemon *mon);
void Party_UpdateAllGiratina_DistortionWorld(Party *party, BOOL force_origin);
BOOL Pokemon_CanUseGracidea(Pokemon *mon);
void Party_ResetAllShayminToLandForm(Party *party);
BOOL Party_TryResetShaymin(Party *party, int min_max, const RTCTime *time);
BOOL Pokemon_UpdateRotomForm(Pokemon *mon, int form, int defaultSlot);
void Chatot_ChatterPlayCryEx(SOUND_CHATOT *soundChatot, u32 r5, u16 species, s32 unused, s32 sp18, u32 sp1C, u32 sp20, u32 sp24);
void Chatot_ChatterPlayCryVariant(SOUND_CHATOT *soundChatot, u32 r6, u16 species, s32 r4, s32 sp20, u32 sp24, u32 sp28, u32 sp2C, u8 sp30);
void Pokemon_PlayMonCry(Pokemon *mon);
void Pokemon_SetCatchData(Pokemon *mon, PlayerProfile *playerProfile, u32 pokeball, u32 location, u32 encounterType, enum HeapID heapID);
void BoxPokemon_InitializeAfterCapture(BoxPokemon *boxMon, PlayerProfile *playerProfile, u32 pokeball, u32 location, u32 encounterType, enum HeapID heapID);
void Pokemon_UpdateAfterCatch(Pokemon *mon, PlayerProfile *playerProfile, u32 pokeball, u32 location, u32 encounterType, enum HeapID heapID);
void BoxPokemon_PostCaptureProcessing(BoxPokemon *boxMon, PlayerProfile *playerProfile, u32 pokeball, u32 location, u32 encounterType, enum HeapID heapID);
void Pokemon_SetRandomHeldItem(Pokemon *mon, u32 a1, u32 a2);
BOOL Pokemon_GetTMHMCompat(Pokemon *mon, u8 tmhm);
BOOL BoxPokemon_GetTMHMCompat(BoxPokemon *boxMon, u8 tmhm);
BOOL GetTMHMCompatBySpeciesAndForm(u16 species, u32 form, u8 tmhm);
void Pokemon_SetPersonality(Pokemon *mon, u32 personality);
u32 ChangePersonalityToNatureGenderAndAbility(u32 pid, u16 species, u8 nature, u8 gender, u8 ability, BOOL gen_mode);
void LoadMonPersonal(int species, BASE_STATS *personal);
void LoadMonBaseStats_HandleAlternateForm(int species, int form, BASE_STATS *personal);
void LoadMonEvolutionTable(u16 species, struct Evolution *evo);
void Pokemon_EncryptSegment(void *data, u32 size, u32 seed);
void MonDecryptSegment(void *data, u32 size, u32 seed);
u32 CalcMonChecksum(void *_data, u32 size);
int ResolveMonForm(int species, int form);
u32 MaskOfFlagNo(int flagno);
BOOL SpeciesIsMythical(u16 species);
BOOL Pokemon_CheckFrontierIneligibility(Pokemon *mon);
BOOL BoxPokemon_BelongsToPlayer(BoxPokemon *boxMon, PlayerProfile *profile, enum HeapID heapID);
int TrainerClassToBackpicID(int trainerClass, BOOL a1);
void NARC_ReadPokepicAnimScript(NARC *narc, PokepicAnimScript *dest, u16 species, u16 a3);
void sub_0207294C(NARC *narc, void *a1, void *a2, u16 a3, int a4, int a5, int a6);
void sub_020729A4(NARC *narc, u8 *ret, u16 a2, u16 a3);
void sub_020729D8(NARC *narc, s8 *ret, u16 a2, u16 a3);
void sub_020729FC(NARC *narc, s8 *ret, u16 a2, u16 a3);
void sub_02072A20(NARC *narc, u8 *ret, u16 a2, u16 a3);
void Pokemon_GetData(Pokemon *mon, struct PokemonData *monData);
void Pokemon_SaveData(const struct PokemonData *monData, Pokemon *mon);
u32 _u32_getDigitN(u32 num, u8 digit);
s16 PokeathlonStatScoreToStars(s16 a0);
void BoxPokemon_CalcPokeathlonPerformance(BoxPokemon *boxMon, struct PokeathlonTodayPerformance *dest);
void Pokemon_CalcPokeathlonPerformance(Pokemon *mon, struct PokeathlonTodayPerformance *dest);
void CalcBoxmonPokeathlonStars(struct PokeathlonPerformanceStars *dest, BoxPokemon *boxMon, const s8 *aprijuice, enum HeapID heapID);
void CalcMonPokeathlonStars(struct PokeathlonPerformanceStars *dest, Pokemon *mon, const s8 *aprijuice, enum HeapID heapID);

#endif // POKEDIAMOND_POKEMON_H
