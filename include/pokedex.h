#ifndef POKEHEARTGOLD_POKEDEX_H
#define POKEHEARTGOLD_POKEDEX_H

#include "constants/pokemon.h"
#include "constants/species.h"

#include "heap.h"
#include "pokemon_types_def.h"
#include "save.h"

#define ROUND_UP(x, n) (((x) + (n) - 1) & ~((n) - 1))
#define CEILDIV(x, n)  (((x) + (n) - 1) / (n))

// Deoxys form history is split between the
// seen and caught flags because of space efficiency.
// For some reason, 4 bits are reserved for each form,
// even though 2 would suffice. This negates any
// benefits this split would have provided.
#define NUM_DEX_FLAG_WORDS (CEILDIV(NATIONAL_DEX_COUNT + 8, 32))

typedef struct Pokedex {
    u32 magic;
    u32 caughtSpecies[NUM_DEX_FLAG_WORDS];
    u32 seenSpecies[NUM_DEX_FLAG_WORDS];
    u32 seenGenders[2][NUM_DEX_FLAG_WORDS];
    u32 spindaPersonality;
    u8 shellosFormOrder;
    u8 gastrodonFormOrder;
    u8 burmyFormOrder;
    u8 wormadamFormOrder;
    u8 unownSeenOrder[28];
    u8 unownCaughtOrder[28];
    u8 caughtLanguages[ROUND_UP(NATIONAL_DEX_COUNT, 4)];
    u8 unk_334;
    u8 enabledInternational;
    u8 dexEnabled;
    u8 nationalDex;
    u32 rotomFormOrder;
    u8 shayminFormOrder;
    u8 giratinaFormOrder;
    u8 pichuFormOrder;
    u8 dummy;
} Pokedex; // size=0x340

u32 Save_Pokedex_sizeof(void);
Pokedex *Pokedex_New(HeapID heapId);
void Save_Pokedex_Init(Pokedex *pokedex);
Pokedex *Save_Pokedex_Get(SaveData *saveData);
BOOL Pokedex_GetNatDexFlag(const Pokedex *pokedex);
BOOL Pokedex_CheckMonCaughtFlag(const Pokedex *pokedex, u16 species);
BOOL Pokedex_CheckMonSeenFlag(const Pokedex *pokedex, u16 species);
u16 Pokedex_CountNationalDexOwned(Pokedex *pokedex);
u16 Pokedex_CountNationalOwned_ExcludeMythical(Pokedex *pokedex);
u16 Pokedex_CountNationalDexSeen(Pokedex *pokedex);
u16 Pokedex_CountJohtoDexOwned(Pokedex *pokedex);
u16 Pokedex_CountJohtoOwned_ExcludeMythical(Pokedex *pokedex);
u16 Pokedex_CountJohtoDexSeen(Pokedex *pokedex);
void Pokedex_Copy(const Pokedex *src, Pokedex *dest);
BOOL DexSpeciesIsInvalid(u16 species);
u16 Pokedex_CountDexOwned(Pokedex *pokedex);
BOOL Pokedex_NationalDexIsComplete(Pokedex *pokedex);
BOOL Pokedex_JohtoDexIsComplete(Pokedex *pokedex);
u32 Pokedex_GetSeenSpindaPersonality(Pokedex *pokedex, u32 arg);
int Pokedex_SpeciesGetLastSeenGender(Pokedex *pokedex, u16 species, u32 a2);
int Pokedex_GetSeenFormByIdx_Unown(Pokedex *pokedex, int idx, u32 caught);
u32 Pokedex_GetSeenFormNum_Unown(Pokedex *pokedex, BOOL caught);
int Pokedex_GetSeenFormByIdx_Shellos(Pokedex *pokedex, int a1);
void Pokedex_SetMonSeenFlag(Pokedex *pokedex, Pokemon *mon);
void Pokedex_SetMonCaughtFlag(Pokedex *pokedex, Pokemon *mon);
void Pokedex_SetNatDexFlag(Pokedex *pokedex);
void sub_0202A57C(Pokedex *pokedex);
BOOL Pokedex_HasCaughtMonWithLanguage(Pokedex *pokedex, u32 species, u32 language);
void Pokedex_SetInternationalViewFlag(Pokedex *pokedex);
BOOL Pokedex_GetInternationalViewFlag(const Pokedex *pokedex);
BOOL Pokedex_IsEnabled(const Pokedex *pokedex);
void Pokedex_Enable(Pokedex *pokedex);
int Pokedex_GetSeenFormByIdx(Pokedex *pokedex, int species, int idx);
int Pokedex_GetSeenFormNum(Pokedex *pokedex, int species);
void UpdatePokedexWithReceivedSpecies(SaveData *saveData, Pokemon *pokemon);

#endif // POKEHEARTGOLD_POKEDEX_H
