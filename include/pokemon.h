#ifndef POKEDIAMOND_POKEMON_H
#define POKEDIAMOND_POKEMON_H

#include "nitro/types.h"

// Enums

#include "constants/species.h"
#include "mail.h"
#include "constants/pokemon.h"
#include "sys/string.h"
#include "player_data.h"
#include "sound_chatot.h"
#include "seal_case.h"

struct BaseStats {
    /* 0x00 */ u8 hp;
    /* 0x01 */ u8 atk;
    /* 0x02 */ u8 def;
    /* 0x03 */ u8 speed;
    /* 0x04 */ u8 spatk;
    /* 0x05 */ u8 spdef;
    /* 0x06 */ u8 types[2];
    /* 0x08 */ u8 catchRate;
    /* 0x09 */ u8 expYield;
    /* 0x0A */ u16 hp_yield:2;
               u16 atk_yield:2;
               u16 def_yield:2;
               u16 speed_yield:2;
    /* 0x0B */ u16 spatk_yield:2;
               u16 spdef_yield:2;
               u16 padding_B_4:4;
    /* 0x0C */ u16 item1;
    /* 0x0E */ u16 item2;
    /* 0x10 */ u8 genderRatio;
    /* 0x11 */ u8 eggCycles;
    /* 0x12 */ u8 friendship;
    /* 0x13 */ u8 growthRate;
    /* 0x14 */ u8 eggGroups[2];
    /* 0x16 */ u8 abilities[2];
    /* 0x18 */ u8 greatMarshRate;
    /* 0x19 */ u8 color:7;
               u8 flip:1;
               u8 padding_1A[2];
    /* 0x1C */ u32 unk1C;
    /* 0x20 */ u32 unk20;
    /* 0x24 */ u32 unk24;
    /* 0x28 */ u32 unk28;
};

// Structs

typedef struct {
    /* 0x00 */ u16 species;
    /* 0x02 */ u16 heldItem;
    /* 0x04 */ u32 otID; // low 16: visible; high 16: secret
    /* 0x08 */ u32 exp;
    /* 0x0C */ u8 friendship;
    /* 0x0D */ u8 ability;
    /* 0x0E */ u8 markings; // circle, triangle, square, heart, star, diamond
    /* 0x0F */ u8 originLanguage;
    /* 0x10 */ u8 hpEV;
    /* 0x11 */ u8 atkEV;
    /* 0x12 */ u8 defEV;
    /* 0x13 */ u8 spdEV;
    /* 0x14 */ u8 spatkEV;
    /* 0x15 */ u8 spdefEV;
    /* 0x16 */ u8 coolStat;
    /* 0x17 */ u8 beautyStat;
    /* 0x18 */ u8 cuteStat;
    /* 0x19 */ u8 smartStat;
    /* 0x1A */ u8 toughStat;
    /* 0x1B */ u8 sheen;
    // TODO: Finish SinnohRibbonSet1
    /* 0x1C */ u32 sinnohRibbons;
//    u8 sinnohChampRibbon:1, abilityRibbon:1;
//    u8 field_0x1d;
//    u8 gorgeousRoyalRibbon:1, footprintRibbon:1;
//    u8 field_0x1f;
} PokemonDataBlockA;

typedef struct {
    /* 0x00 */ u16 moves[4];
    /* 0x08 */ u8 movePP[4];
    /* 0x0C */ u8 movePpUps[4];
    /* 0x10 */ u32 hpIV:5, atkIV:5, defIV:5, spdIV:5, spatkIV:5, spdefIV:5, isEgg:1, isNicknamed:1;
    // TODO: Finish HoennRibbonSet
    /* 0x14 */ u32 ribbonFlags; // cool, ...
    /* 0x18 */ u8 fatefulEncounter:1, gender:2, alternateForm:5;
    /* 0x19 */ u8 HGSS_shinyLeaves:6;
    /* 0x19 */ u8 unk_19_6:2;
    /* 0x1A */ u16 Unused;
    /* 0x1C */ u16 Platinum_EggLocation;
    /* 0x1E */ u16 Platinum_MetLocation;
} PokemonDataBlockB;

typedef struct {
    /* 0x00 */ u16 nickname[11];
    /* 0x16 */ u8 Unused;
    /* 0x17 */ u8 originGame;
    // TODO: Finish SinnohRibbonSet2
    /* 0x18 */ u64 sinnohRibbons2; // cool, ...
} PokemonDataBlockC;

typedef struct {
    /* 0x00 */ u16 otTrainerName[8];
    /* 0x10 */ u8 dateEggReceived[3];
    /* 0x13 */ u8 dateMet[3];
    /* 0x16 */ u16 DP_EggLocation;
    /* 0x18 */ u16 DP_MetLocation;
    /* 0x1A */ u8 pokerus;
    /* 0x1B */ u8 pokeball;
    /* 0x1C */ u8 metLevel:7;
               u8 metGender:1;
    /* 0x1D */ u8 encounterType;
    /* 0x1E */ u8 HGSS_Pokeball;
    /* 0x1F */ s8 unk_1F;
} PokemonDataBlockD;

typedef union {
    PokemonDataBlockA blockA;
    PokemonDataBlockB blockB;
    PokemonDataBlockC blockC;
    PokemonDataBlockD blockD;
} PokemonDataBlock;

typedef struct BoxPokemon {
    /* 0x000 */ u32 pid;
    /* 0x004 */ u16 party_lock:1;
                u16 box_lock:1;
                u16 checksum_fail:1;
                u16 Unused:13;    // Might be used for validity checks
    /* 0x006 */ u16 checksum;  // Stored checksum of pokemon
    /* 0x008 */ PokemonDataBlock substructs[4];
} BOXMON;

typedef struct PartyPokemon
{
    /* 0x088 */ u32 status; // slp:3, psn:1, brn:1, frz:1, prz:1, tox:1, ...
    /* 0x08C */ u8 level;
    /* 0x08D */ u8 capsule;
    /* 0x08E */ u16 hp;
    /* 0x090 */ u16 maxHp;
    /* 0x092 */ u16 atk;
    /* 0x094 */ u16 def;
    /* 0x096 */ u16 speed;
    /* 0x098 */ u16 spatk;
    /* 0x09A */ u16 spdef;
    /* 0x09C */ MAIL mail;
    /* 0x0D4 */ CAPSULE sealCoords; // seal coords
} PARTYMON;

typedef struct Pokemon {
    /* 0x000 */ BOXMON box;
    /* 0x088 */ PARTYMON party;
} POKEMON; // size: 0xEC

struct SomeDrawPokemonStruct
{
    u16 unk0;
    u16 unk2;
    u16 unk4;
    u16 unk6;
    u8 unk8;
    u8 filler_9[3];
    u32 unkC;
};

struct PokeanmSub
{
    s8 unk0;
    u8 unk1;
};

struct Pokeanm
{
    struct PokeanmSub unk0[4];
    u8 unk8[20];
};

struct UnkStruct_02069038
{
    u16 unk0;
    u16 unk2;
    u8 unk4;
    u8 padding;
    struct Pokeanm anim;
};

struct Evolution
{
    u16 method;
    u16 param;
    u16 target;
};

#define PARTY_SIZE 6

typedef struct PARTY
{
    int maxCount;
    int curCount;
    struct Pokemon mons[PARTY_SIZE];
} PARTY;

void ZeroMonData(POKEMON * pokemon);
void ZeroBoxMonData(BOXMON * boxmon);
u32 SizeOfStructPokemon(void);
POKEMON * AllocMonZeroed(u32 heap_id);
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
void AddBoxMonData(BOXMON * boxmon, int attr, int amount);
struct BaseStats * AllocAndLoadMonPersonal(int species, u32 heap_id);
int GetPersonalAttr(struct BaseStats * baseStats, enum BaseStat attr);
void FreeMonPersonal(struct BaseStats * personal);
int GetMonBaseStat_HandleAlternateForme(int species, int form, enum BaseStat stat_id);
int GetMonBaseStat(int species, enum BaseStat stat_id);
u8 GetPercentProgressTowardsNextLevel(POKEMON * pokemon);
u32 CalcMonExpToNextLevel(POKEMON * pokemon);
u32 GetMonBaseExperienceAtCurrentLevel(POKEMON * pokemon);
u32 GetMonExpBySpeciesAndLevel(int species, int level);
void LoadGrowthTable(int growthRate, u32 * table);
u32 GetExpByGrowthRateAndLevel(int rate, int level);
int CalcMonLevel(POKEMON * pokemon);
int CalcBoxMonLevel(BOXMON * boxmon);
int CalcLevelBySpeciesAndExp(u16 species, u32 experience);
int CalcLevelBySpeciesAndExp_PreloadedPersonal(struct BaseStats * personal, u16 species, u32 experience);
u8 GetBoxMonNature(BOXMON * boxmon);
u8 GetMonNature(POKEMON * mon);
u8 GetNatureFromPersonality(u32 pid);
void MonApplyFriendshipMod(POKEMON * pokemon, u32 kind, u32 location);
u8 GetMonGender(POKEMON * pokemon);
u8 GetBoxMonGender(BOXMON * boxmon);
u8 GetGenderBySpeciesAndPersonality(u16 species, u32 pid);
u8 MonIsShiny(POKEMON * pokemon);
u32 GenerateShinyPersonality(u32 otid);
void FUN_02068B70(struct SomeDrawPokemonStruct * spC, BOXMON * boxmon, u8 sp10);
void FUN_02068C00(struct SomeDrawPokemonStruct * spC, int species, u8 gender, u8 sp10, u8 shiny, u8 forme, u32 personality);
u8 FUN_02068E14(POKEMON * pokemon, u32 a1);
u8 FUN_02068E1C(BOXMON * boxmon, u32 a1);
u8 FUN_02068E88(int species, u8 gender, u32 a2, u8 forme, u32 pid);
u32 GetArceusTypeByHeldItemEffect(u16 plate);
int FUN_0206AA30(int a0);
void FUN_02068B68(struct SomeDrawPokemonStruct * spC, POKEMON * pokemon, u8 sp10);
void FUN_02068FE0(struct SomeDrawPokemonStruct * a0, u16 a1, int a2);
void FUN_02069010(void * dest, int a1);
void FUN_02069038(u32 a0, u32 a1, u32 a2, s32 a3, u32 a4, u32 a5, u32 a6);
void FUN_020690AC(struct SomeDrawPokemonStruct * a0, u32 a1);
u32 FUN_020690C4(void);
u32 FUN_020690C8(void);
u8 GetBoxMonUnownLetter(BOXMON * boxmon);
u8 GetMonUnownLetter(POKEMON * pokemon);
BOXMON * FUN_020690E4(POKEMON * pokemon);

u16 GetMonEvolution(PARTY * party, POKEMON * pokemon, u32 context, u32 usedItem, u32 * method_ret);
u16 ReadFromPersonalPmsNarc(u16 species);
u16 GetEggSpecies(u16 species);
BOOL FUN_020690E8(POKEMON * pokemon);
u32 FUN_02069698(POKEMON * pokemon, u16 move);
void FUN_02069708(POKEMON * pokemon, u16 move);
void FUN_02069718(BOXMON * boxmon, u16 move);
void MonSetMoveInSlot(POKEMON * pokemon, u16 move, u8 slot);
u32 FUN_02069818(POKEMON * pokemon, u32 * r5, u16 * sp0);
void FUN_020698E0(POKEMON * pokemon, int slot1, int slot2);
void FUN_020698E8(BOXMON * boxmon, int slot1, int slot2);
void FUN_020699A4(POKEMON * pokemon, u32 slot);
void CopyBoxPokemonToPokemon(BOXMON * src, POKEMON * dest);
u8 Party_GetMaxLevel(PARTY * party);
u16 SpeciesToSinnohDexNo(u16 species);
u16 SinnohDexNoToSpecies(u16 sinnoh_dex);
void CopyPokemonToPokemon(POKEMON * src, POKEMON * dest);
void CopyPokemonToBoxPokemon(POKEMON * src, BOXMON * dest);
void CopyBoxPokemonToBoxPokemon(BOXMON * src, BOXMON * dest);
s8 MonGetFlavorPreference(POKEMON * pokemon, int flavor);
int Species_LoadLearnsetTable(u16 species, u32 forme, u16 * dest);
void Party_GivePokerusAtRandom(PARTY * party);
void Party_UpdatePokerus(PARTY * party, int r5);
void Party_SpreadPokerus(PARTY * party);
BOOL Pokemon_HasPokerus(POKEMON * pokemon);
BOOL Pokemon_IsImmuneToPokerus(POKEMON * pokemon);
void Pokemon_UpdateArceusForme(POKEMON * pokemon);
void FUN_02069FB0(SOUND_CHATOT *r7, u32 r5, u16 r4, s32 r6, s32 sp18, u32 sp1C, u32 sp20);
void FUN_0206A014(POKEMON * pokemon, PLAYERDATA * a1, u32 pokeball, u32 a3, u32 encounterType, u32 heap_id);
void FUN_0206A094(POKEMON * pokemon, u32 a1, u32 a2);
BOOL FUN_0206A13C(POKEMON * pokemon, u32 a1);
void FUN_0206A1C4(POKEMON * pokemon);
void FUN_0206A23C(POKEMON * r5, u32 personality);
int LowestFlagNo(u32 mask);
BOOL IsPokemonLegendaryOrMythical(u16 species);
u16 GetLegendaryMon(u32 idx);
BOOL FUN_0206A998(POKEMON * pokemon);
BOOL FUN_0206A9AC(BOXMON * boxmon, PLAYERDATA * sb2, u32 heap_id);
void Pokemon_RemoveCapsule(POKEMON * pokemon);
void RestoreBoxMonPP(BOXMON * boxmon);

#endif //POKEDIAMOND_POKEMON_H
