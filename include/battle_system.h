#ifndef POKEHEARTGOLD_BATTLE_SYSTEM_H
#define POKEHEARTGOLD_BATTLE_SYSTEM_H

#include "bag.h"
#include "battle.h"
#include "pokemon.h"
#include "sav_chatot.h"

BgConfig *BattleSystem_GetBgConfig(BattleSystem *bsys);
Window *BattleSystem_GetWindow(BattleSystem *bsys, int index);
u32 BattleSystem_GetBattleType(BattleSystem *bsys);
BATTLECONTEXT *BattleSystem_GetBattleContext(BattleSystem *bsys);
OpponentData *BattleSystem_GetOpponentData(BattleSystem *bsys, int battlerId);
int BattleSystem_GetMaxBattlers(BattleSystem *bsys);
PARTY *BattleSystem_GetParty(BattleSystem *bsys, int battlerId);
int BattleSystem_GetPartySize(BattleSystem *bsys, int battlerId);
Pokemon *BattleSystem_GetPartyMon(BattleSystem *bsys, int battlerId, int index);
u32 *ov12_0223A8D4(BattleSystem *bsys);
u32 *ov12_0223A8DC(BattleSystem *bsys);
u32 *ov12_0223A8E4(BattleSystem *bsys);
u32 *ov12_0223A8EC(BattleSystem *bsys);
UnkBattleSystemSub17C *ov12_0223A8F4(BattleSystem *bsys, int index);
u32 *ov12_0223A900(BattleSystem *bsys);
u32 *ov12_0223A908(BattleSystem *bsys, int index);
void ov12_0223A914(BattleSystem *bsys, int index, u32 *a2);
FontID *BattleSystem_GetHpFont(BattleSystem *bsys);
FontID *BattleSystem_GetLevelFont(BattleSystem *bsys);
u32 *ov12_0223A930(BattleSystem *bsys);
u32 *ov12_0223A934(BattleSystem *bsys);
void *ov12_0223A938(BattleSystem *bsys);
Pokedex *BattleSystem_GetPokedex(BattleSystem *bsys);
u8 *BattleSystem_GetSendBufferPtr(BattleSystem *bsys);
u8 *BattleSystem_GetRecvBufferPtr(BattleSystem *bsys);
u16 *ov12_0223A954(BattleSystem *bsys);
u16 *ov12_0223A960(BattleSystem *bsys);
u16 *ov12_0223A96C(BattleSystem *bsys);
u16 *ov12_0223A978(BattleSystem *bsys);
u16 *ov12_0223A984(BattleSystem *bsys);
u16 *ov12_0223A990(BattleSystem *bsys);
UnkBattleSystemSub1D0 *ov12_0223A99C(BattleSystem *bsys);
u32 *ov12_0223A9A4(BattleSystem *bsys);
String *BattleSystem_GetMessageBuffer(BattleSystem *bsys);
u16 BattleSystem_GetTrainerIndex(BattleSystem *bsys, int battlerId);
TRAINER *BattleSystem_GetTrainer(BattleSystem *bsys, int battlerId);
PlayerProfile *BattleSystem_GetPlayerProfile(BattleSystem *bsys, int a1);
Bag *BattleSystem_GetBag(BattleSystem *bsys);
BagCursor *BattleSystem_GetBagCursor(BattleSystem *bsys);
u8 BattleSystem_GetMonBall(BattleSystem *bsys, Pokemon *mon);

//These functions haven't been decompiled
u32 BattleSystem_GetFieldSide(BattleSystem *bsys, int battlerId);
int BattleSystem_Random(BattleSystem *bsys);
int BattleSystem_GetTerrainId(BattleSystem *bsys);
int ov12_0223ABB8(BattleSystem *bsys, int battlerId, int a2);
void BattleSystem_RecoverStatus(BattleSystem *bsys, int battlerIdA, int battlerIdB, int a2, int itemWork);
void ov12_0223BDDC(BattleSystem *bsys, int battlerId, u8 a2);
void PokedexSetBattlerSeen(BattleSystem *bsys, int battlerId);
SOUND_CHATOT *BattleSystem_GetChatotVoice(BattleSystem *bsys, int battlerId);
int BattleSystem_GetChatotVoiceParam(BattleSystem *bsys, int battlerId);
int BattleSystem_GetBattlerIdPartner(BattleSystem *bsys, int battlerId);
BOOL Link_QueueNotEmpty(BATTLECONTEXT *ctx);
BOOL BattleSystem_AreBattleAnimationsOn(BattleSystem *bsys);
BOOL ov12_0223C080(BattleSystem *bsys);
void ov12_0223BFFC(BattleSystem *bsys, u32 a1);
void *ov12_0223A938(BattleSystem *bsys);
int ov12_0223AB54(BattleSystem *bsys);
u32 BattleSystem_GetWinLoseFlags(BattleSystem *bsys);
void ov12_0223C0C4(BattleSystem *bsys);
int BattleSystem_GetWeather(BattleSystem *bsys);
int ov12_0223AB60(BattleSystem *bsys);
BOOL ov12_0223BFEC(BattleSystem *bsys);
void ov12_0223BB64(BattleSystem *bsys, int a1);
void ov12_02237ED0(BattleSystem *bsys, int a1);
void ov12_022642F0(BattleSystem *bsys);
BOOL ov12_022581BC(BattleSystem *bsys, BATTLECONTEXT *ctx);
int ov12_0223B6B4(BattleSystem *bsys);
void ov12_0223B6C0(BattleSystem *bsys, int item);
void ov12_02263A1C(BattleSystem *bsys, BATTLECONTEXT *ctx, int battlerId);
u32 ov12_0223AB0C(BattleSystem *bsys, int battlerId);

#endif
