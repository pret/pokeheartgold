#ifndef POKEHEARTGOLD_POKEDEX_H
#define POKEHEARTGOLD_POKEDEX_H

#include "save.h"
#include "heap.h"
#include "pokemon_types_def.h"
#include "constants/species.h"
#include "constants/pokemon.h"

#define ROUND_UP(x,n)             (((x)+(n)-1)&~((n)-1))
#define CEILDIV(x,n)              (((x)+(n)-1)/(n))

// Deoxys forme history is split between the
// seen and caught flags because of space efficiency.
// For some reason, 4 bits are reserved for each forme,
// even though 2 would suffice. This negates any
// benefits this split would have provided.
#define NUM_DEX_FLAG_WORDS        (CEILDIV(NATIONAL_DEX_COUNT+8,32))

typedef struct POKEDEX {
    u32 magic;
    u32 caughtSpecies[NUM_DEX_FLAG_WORDS];
    u32 seenSpecies[NUM_DEX_FLAG_WORDS];
    u32 seenGenders[2][NUM_DEX_FLAG_WORDS];
    u32 spindaPersonality;
    u8 shellosFormeOrder;
    u8 gastrodonFormeOrder;
    u8 burmyFormeOrder;
    u8 wormadamFormeOrder;
    u8 unownSeenOrder[28];
    u8 unownCaughtOrder[28];
    u8 caughtLanguages[ROUND_UP(NATIONAL_DEX_COUNT,4)];
    u8 unk_334;
    u8 enabledInternational;
    u8 dexEnabled;
    u8 nationalDex;
    u32 rotomFormeOrder;
    u8 shayminFormeOrder;
    u8 giratinaFormeOrder;
    u8 pichuFormeOrder;
    u8 dummy;
} POKEDEX; // size=0x340

u32 Save_Pokedex_sizeof(void);
POKEDEX *Pokedex_New(HeapID heapId);
void Save_Pokedex_init(POKEDEX *pokedex);
POKEDEX *Sav2_Pokedex_Get(SAVEDATA *saveData);
BOOL Pokedex_GetNatDexFlag(const POKEDEX *pokedex);
BOOL Pokedex_CheckMonCaughtFlag(const POKEDEX *pokedex, u16 species);
BOOL Pokedex_CheckMonSeenFlag(const POKEDEX *pokedex, u16 species);
u16 Pokedex_CountNationalDexOwned(POKEDEX *pokedex);
u16 Pokedex_CountNationalOwned_ExcludeMythical(POKEDEX *pokedex);
u16 Pokedex_CountNationalDexSeen(POKEDEX *pokedex);
u16 Pokedex_CountJohtoDexOwned(POKEDEX *pokedex);
u16 Pokedex_CountJohtoOwned_ExcludeMythical(POKEDEX *pokedex);
u16 Pokedex_CountJohtoDexSeen(POKEDEX *pokedex);
void Pokedex_Copy(const POKEDEX *src, POKEDEX *dest);
BOOL DexSpeciesIsInvalid(u16 species);
u16 Pokedex_CountDexOwned(POKEDEX *pokedex);
BOOL Pokedex_NationalDexIsComplete(POKEDEX *pokedex);
BOOL Pokedex_JohtoDexIsComplete(POKEDEX *pokedex);
u32 Pokedex_GetSeenSpindaPersonality(POKEDEX *pokedex, u32 arg);
int Pokedex_SpeciesGetLastSeenGender(POKEDEX *pokedex, u16 species, u32 a2);
int Pokedex_GetSeenFormeByIdx_Unown(POKEDEX *pokedex, int idx, u32 caught);
u32 Pokedex_GetSeenFormeNum_Unown(POKEDEX *pokedex, BOOL caught);
int Pokedex_GetSeenFormeByIdx_Shellos(POKEDEX *pokedex, int a1);
void Pokedex_SetMonSeenFlag(POKEDEX *pokedex, Pokemon *mon);
void Pokedex_SetMonCaughtFlag(POKEDEX *pokedex, Pokemon *mon);
void Pokedex_SetNatDexFlag(POKEDEX *pokedex);
void sub_0202A57C(POKEDEX *pokedex);
BOOL Pokedex_HasCaughtMonWithLanguage(POKEDEX *pokedex, u32 species, u32 language);
void Pokedex_SetInternationalViewFlag(POKEDEX *pokedex);
BOOL Pokedex_GetInternationalViewFlag(const POKEDEX *pokedex);
BOOL Pokedex_IsEnabled(const POKEDEX *pokedex);
void Pokedex_Enable(POKEDEX *pokedex);
int Pokedex_GetSeenFormeByIdx(POKEDEX *pokedex, int species, int idx);
int Pokedex_GetSeenFormeNum(POKEDEX *pokedex, int species);
void UpdatePokedexWithReceivedSpecies(SAVEDATA *saveData, Pokemon *pokemon);

#endif //POKEHEARTGOLD_POKEDEX_H
