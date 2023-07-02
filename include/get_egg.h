#ifndef POKEHEARTGOLD_GET_EGG_H
#define POKEHEARTGOLD_GET_EGG_H

#include "daycare.h"
#include "script.h"

BoxPokemon *Daycare_GetBoxMonI(Daycare *daycare, int idx);
void Save_DayCare_PutMonIn(PARTY *party, u8 partyIdx, Daycare *dayCare, SaveData *saveData);
u16 Save_DayCare_RetrieveMon(PARTY *party, MessageFormat *msgFmt, Daycare *daycare, u8 whomst);
int DayCareMon_CalcLevelGrowth(DaycareMon *daycareMon);
u16 Save_DayCare_BufferMonNickAndRetrievalPrice(Daycare *dayCare, u8 slot, MessageFormat *msgFmt);
u8 Save_DayCare_BufferGrowthAndNick(Daycare *dayCare, u32 slot, MessageFormat *msgFmt);
void Save_DayCare_ResetEggStats(Daycare *dayCare);
void SetEggStats(Pokemon *mon, int species, u8 metLocation, PlayerProfile *profile, int a4, int a5);
void GiveEggToPlayer(Daycare *dayCare, PARTY *party, PlayerProfile* profile);
BOOL HandleDayCareStep(Daycare *dayCare, PARTY *party, FieldSystem *fsys);
Pokemon *sub_0206CE44(PARTY *party);
void Save_DayCare_BufferStoredMonNicks(Daycare *dayCare, MessageFormat *msgFmt);
void Save_DayCare_BufferMonStats(Daycare *dayCare, u32 nickname_idx, u32 level_idx, u32 gender_idx, u8 slot, MessageFormat *msgFmt);
u16 Save_DayCare_BufferTailMonNick(Daycare *dayCare, MessageFormat *msgFmt);
u8 Save_DayCare_GetState(Daycare *dayCare);
u8 Save_DayCare_CalcCompatibility(Daycare *dayCare);
void sub_0206D328(Pokemon *mon, HeapID heapId);

#endif
