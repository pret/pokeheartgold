#ifndef POKEDIAMOND_POKEMON_H
#define POKEDIAMOND_POKEMON_H

#include "pokemon_types_def.h"
// Enums

#include "constants/species.h"
#include "constants/pokemon.h"
#include "sys/string.h"
#include "player_data.h"
#include "sound_chatot.h"
#include "filesystem.h"

void ZeroMonData(POKEMON * pokemon);
void ZeroBoxMonData(BOXMON * boxmon);
u32 SizeOfStructPokemon(void);
POKEMON * AllocMonZeroed(HeapID heap_id);
BOOL AcquireMonLock(POKEMON * mon);
BOOL ReleaseMonLock(POKEMON * mon, BOOL decrypt_result);
BOOL AcquireBoxMonLock(BOXMON * mon);
BOOL ReleaseBoxMonLock(BOXMON * mon, BOOL decrypt_result);
void CreateMon(POKEMON * pokemon, int species, int level, int fixedIV, int hasFixedPersonality, int fixedPersonality, int otIdType, int fixedOtId);
void CreateBoxMon(BOXMON * boxPokemon, int species, int level, int fixedIV, int hasFixedPersonality, int fixedPersonality, int otIdType, int fixedOtId);
void CreateMonWithNature(POKEMON * pokemon, u16 species, u8 level, u8 fixedIv, u8 nature);
void CreateMonWithGenderNatureLetter(POKEMON * pokemon, u16 species, u8 level, u8 fixedIv, u8 gender, u8 nature, u8 letter);
u32 GenPersonalityByGenderAndNature(u16 species, u8 gender, u8 nature);
void CreateMonWithFixedIVs(POKEMON * pokemon, int species, int level, int ivs, int personality);
void CalcMonLevelAndStats(POKEMON * pokemon);
void CalcMonStats(POKEMON * pokemon);
u32 GetMonData(POKEMON * pokemon, int attr, void * ptr);
u32 GetBoxMonData(BOXMON * boxmon, int attr, void * ptr);
void SetMonData(POKEMON * pokemon, int attr, void * ptr);
void SetBoxMonData(BOXMON * boxmon, int attr, void * ptr);
void AddMonData(POKEMON * pokemon, int attr, int amount);
//void AddBoxMonData(BOXMON * boxmon, int attr, int amount);
BASE_STATS * AllocAndLoadMonPersonal_HandleAlternateForme(int species, int form, HeapID heap_id);
BASE_STATS * AllocAndLoadMonPersonal(int species, HeapID heap_id);
int GetPersonalAttr(const BASE_STATS *baseStats, BaseStat attr);
void FreeMonPersonal(BASE_STATS * personal);
int GetMonBaseStat_HandleAlternateForme(int species, int form, BaseStat stat_id);
int GetMonBaseStat(int species, BaseStat stat_id);
u8 GetPercentProgressTowardsNextLevel(POKEMON * pokemon);
u32 CalcMonExpToNextLevel(POKEMON * pokemon);
u32 CalcBoxMonExpToNextLevel(BOXMON * pokemon);
u32 GetMonBaseExperienceAtCurrentLevel(POKEMON * pokemon);
u32 GetMonExpBySpeciesAndLevel(int species, int level);
void LoadGrowthTable(int growthRate, u32 * table);
u32 GetExpByGrowthRateAndLevel(int rate, int level);
int CalcMonLevel(POKEMON * pokemon);
int CalcBoxMonLevel(BOXMON * boxmon);
int CalcLevelBySpeciesAndExp(u16 species, u32 experience);
int CalcLevelBySpeciesAndExp_PreloadedPersonal(BASE_STATS * personal, u16 species, u32 experience);
u8 GetBoxMonNature(BOXMON * boxmon);
u8 GetMonNature(POKEMON * mon);
u8 GetNatureFromPersonality(u32 pid);
void MonApplyFriendshipMod(POKEMON * pokemon, u8 kind, u16 location);
u8 GetMonGender(POKEMON * pokemon);
u8 GetBoxMonGender(BOXMON * boxmon);
u8 GetGenderBySpeciesAndPersonality(u16 species, u32 pid);
u8 MonIsShiny(POKEMON * pokemon);
u8 BoxMonIsShiny(BOXMON * boxmon);
u8 CalcShininessByOtIdAndPersonality(u32 otid, u32 pid);
u32 GenerateShinyPersonality(u32 otid);
u32 GetArceusTypeByHeldItemEffect(u16 plate);
u8 GetBoxMonUnownLetter(BOXMON * boxmon);
u8 GetMonUnownLetter(POKEMON * pokemon);
u32 TryAppendMonMove(POKEMON *pokemon, u16 move);
u32 TryAppendBoxMonMove(BOXMON *boxmon, u16 move);
void BoxMonSetMoveInSlot(BOXMON *boxmon, u16 move, u8 slot);
void DeleteMonFirstMoveAndAppend(POKEMON *pokemon, u16 move);
void DeleteBoxMonFirstMoveAndAppend(BOXMON *boxmon, u16 move);
void LoadWotbl_HandleAlternateForme(int species, int forme, u16 *wotbl);
void MonSwapMoves(POKEMON *pokemon, int a, int b);
void BoxMonSwapMoves(BOXMON *boxmon, int a, int b);

u16 GetMonEvolution(PARTY * party, POKEMON * pokemon, u8 context, u16 usedItem, int *method_ret);
u16 ReadFromPersonalPmsNarc(u16 species);
u16 GetEggSpecies(u16 species);
void MonSetMoveInSlot(POKEMON * pokemon, u16 move, u8 slot);
void CopyBoxPokemonToPokemon(const BOXMON * src, POKEMON * dest);
u8 Party_GetMaxLevel(PARTY * party);
u16 SpeciesToSinnohDexNo(u16 species);
u16 SinnohDexNoToSpecies(u16 sinnoh_dex);
void CopyPokemonToPokemon(const POKEMON * src, POKEMON * dest);
void CopyPokemonToBoxPokemon(const POKEMON * src, BOXMON * dest);
void CopyBoxPokemonToBoxPokemon(const BOXMON * src, BOXMON * dest);
s8 MonGetFlavorPreference(POKEMON * pokemon, int flavor);
s8 BoxMonGetFlavorPreference(BOXMON * boxmon, int flavor);
s8 GetFlavorPreferenceFromPID(u32 personality, int flavor);
int Species_LoadLearnsetTable(u16 species, u32 forme, u16 * dest);
void Party_GivePokerusAtRandom(PARTY * party);
u8 Party_MaskMonsWithPokerus(PARTY * party, u8 mask);
void Party_UpdatePokerus(PARTY * party, int r5);
void Party_SpreadPokerus(PARTY * party);
BOOL Pokemon_HasPokerus(POKEMON * pokemon);
BOOL BoxMon_HasPokerus(BOXMON * boxmon);
BOOL Pokemon_IsImmuneToPokerus(POKEMON * pokemon);
BOOL BoxMon_IsImmuneToPokerus(BOXMON * boxmon);
void Pokemon_UpdateArceusForme(POKEMON * pokemon);
void BoxMon_UpdateArceusForme(BOXMON * boxmon);
s32 Mon_UpdateGiratinaForme(POKEMON * pokemon);
s32 BoxMon_UpdateGiratinaForme(BOXMON * boxmon);
void Mon_UpdateShayminForme(POKEMON *pokemon, int forme);
void BoxMon_UpdateShayminForme(BOXMON *pokemon, int forme);
void UpdateMonAbility(POKEMON *boxmon);
void UpdateBoxMonAbility(BOXMON *boxmon);
int LowestFlagNo(u32 mask);
BOOL IsPokemonLegendaryOrMythical(u16 species, u16 forme);
u16 GetLegendaryMon(u32 idx);
void Pokemon_RemoveCapsule(POKEMON * pokemon);
void RestoreBoxMonPP(BOXMON * boxmon);
BOOL SetTrMonCapsule(int a0, POKEMON *pokemon, HeapID heap_id);

#endif //POKEDIAMOND_POKEMON_H
