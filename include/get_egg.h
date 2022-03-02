#ifndef POKEHEARTGOLD_GET_EGG_H
#define POKEHEARTGOLD_GET_EGG_H

#include "daycare.h"
#include "msgfmt.h"

void Sav2_DayCare_PutMonIn(PARTY* party, u8 slot, DAYCARE* daycare, SAVEDATA* savedata);
u16 Sav2_DayCare_RetrieveMon(PARTY* party, MSGFMT* msg_fmt, DAYCARE* daycare, u8 idx);
u16 Sav2_DayCare_BufferMonNickAndRetrievalPrice(DAYCARE* daycare, u8 dc_mon_idx, MSGFMT* msg_fmt);
u8 Sav2_DayCare_BufferGrowthAndNick(DAYCARE* daycare, u32 dc_mon_idx, MSGFMT* msg_fmt);
void Sav2_DayCare_ResetEggStats(DAYCARE* daycare);
void GiveEggToPlayer(DAYCARE* daycare, PARTY* party, PLAYERPROFILE* profile);
void Sav2_DayCare_BufferStoredMonNicks(DAYCARE* daycare, MSGFMT* msg_fmt);
void Sav2_DayCare_BufferMonStats(DAYCARE* daycare, u8 nickname_idx, u8 level_idx, u8 gender_idx, u8 slot, MSGFMT* msg_fmt);
u16 Sav2_DayCare_BufferTailMonNick(DAYCARE* daycare, MSGFMT* msg_fmt);
u8 Sav2_DayCare_GetState(DAYCARE* daycare);
u32 Sav2_DayCare_CalcCompatibility(DAYCARE* daycare);

#endif
