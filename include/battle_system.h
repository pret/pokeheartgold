#ifndef POKEHEARTGOLD_BATTLE_SYSTEM_H
#define POKEHEARTGOLD_BATTLE_SYSTEM_H

#include "battle.h"
#include "player_data.h"
#include "pokemon.h"
#include "sav_chatot.h"

u32 BattleSystem_GetBattleType(BattleSystem *bsys);
u32 BattleSystem_GetFieldSide(BattleSystem *bsys, int battlerId);
int BattleSystem_GetMaxBattlers(BattleSystem *bsys);
int BattleSystem_Random(BattleSystem *bsys);
PlayerProfile *BattleSystem_GetPlayerProfile(BattleSystem *bsys, int a1);
PARTY *BattleSystem_GetParty(BattleSystem *bsys, int battlerId);
int BattleSystem_GetPartySize(BattleSystem *bsys, int battlerId);
Pokemon *BattleSystem_GetPartyMon(BattleSystem *bsys, int battlerId, int index);
int BattleSystem_GetTerrainId(BattleSystem *bsys);
int ov12_0223ABB8(BattleSystem *bsys, int battlerId, int a2);
void BattleSystem_RecoverStatus(BattleSystem *bsys, int battlerIdA, int battlerIdB, int a2, int itemWork);
void ov12_0223BDDC(BattleSystem *bsys, int battlerId, u8 a2);
void PokedexSetBattlerSeen(BattleSystem *bsys, int battlerId);
OpponentData *BattleSystem_GetOpponentDataByBattlerId(BattleSystem *bsys, int battlerId);
SOUND_CHATOT *BattleSystem_GetChatotVoice(BattleSystem *bsys, int battlerId);
int BattleSystem_GetChatotVoiceParam(BattleSystem *bsys, int battlerId);
int BattleSystem_GetBattlerIdPartner(BattleSystem *bsys, int battlerId);
int BattleSystem_GetTrainerIndex(BattleSystem *bsys, int battlerId);
BOOL Link_QueueNotEmpty(BATTLECONTEXT *ctx);
BOOL BattleSystem_AreBattleAnimationsOn(BattleSystem *bsys);
u32 *ov12_0223A900(BattleSystem *bsys);
BOOL ov12_0223C080(BattleSystem *bsys);
void ov12_0223BFFC(BattleSystem *bsys, u32 a1);
void *ov12_0223A938(BattleSystem *bsys);
int ov12_0223AB54(BattleSystem *bsys);
u8 BattleSystem_GetMonBall(BattleSystem *bsys, Pokemon *mon);
u32 BattleSystem_GetWinLoseFlags(BattleSystem *bsys);

#endif
