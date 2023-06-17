#ifndef POKEHEARTGOLD_GET_EGG_H
#define POKEHEARTGOLD_GET_EGG_H

#include "daycare.h"
#include "script.h"

BoxPokemon *Daycare_GetBoxMonI(DAYCARE *daycare, int idx);
void Save_DayCare_PutMonIn(PARTY *party, u8 partyIdx, DAYCARE *dayCare, SaveData *saveData);
u16 Save_DayCare_RetrieveMon(PARTY *party, MessageFormat *msgFmt, DAYCARE *daycare, u8 whomst);
int DayCareMon_CalcLevelGrowth(DAYCAREMON *daycareMon);
u16 Save_DayCare_BufferMonNickAndRetrievalPrice(DAYCARE *dayCare, u8 slot, MessageFormat *msgFmt);
u8 Save_DayCare_BufferGrowthAndNick(DAYCARE *dayCare, u32 slot, MessageFormat *msgFmt);
void Save_DayCare_ResetEggStats(DAYCARE *dayCare);
void SetEggStats(Pokemon *mon, int species, u8 metLocation, PLAYERPROFILE *profile, int a4, int a5);
void GiveEggToPlayer(DAYCARE *dayCare, PARTY *party, PLAYERPROFILE* profile);
BOOL HandleDayCareStep(DAYCARE *dayCare, PARTY *party, FieldSystem *fsys);
Pokemon *sub_0206CE44(PARTY *party);
void Save_DayCare_BufferStoredMonNicks(DAYCARE *dayCare, MessageFormat *msgFmt);
void Save_DayCare_BufferMonStats(DAYCARE *dayCare, u32 nickname_idx, u32 level_idx, u32 gender_idx, u8 slot, MessageFormat *msgFmt);
u16 Save_DayCare_BufferTailMonNick(DAYCARE *dayCare, MessageFormat *msgFmt);
u8 Save_DayCare_GetState(DAYCARE *dayCare);
u8 Save_DayCare_CalcCompatibility(DAYCARE *dayCare);
void sub_0206D328(Pokemon *mon, HeapID heapId);

#endif
