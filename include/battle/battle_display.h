#ifndef POKEHEARTGOLD_BATTLE_BATTLE_DISPLAY_H
#define POKEHEARTGOLD_BATTLE_BATTLE_DISPLAY_H

#include "battle/battle.h"
#include "battle/battle_message_structs.h"
#include "battle/battle_system.h"

// These function declarations are temporary for the battle_io_command pr
// battle_display.h is documented proper in the the battle display pr that follows

void ov12_02262014(OpponentData *);
void ov12_02259944(BattleSystem *, OpponentData *);
void ov12_02259968(BattleSystem *, OpponentData *, MonEncounterMessage *);
void ov12_02259BA8(BattleSystem *, OpponentData *, MonShowMessage *);
void ov12_02259D48(BattleSystem *, OpponentData *, MonShowMessage *);
void ov12_02259F30(BattleSystem *, OpponentData *, MonReturnMessage *);
void ov12_0225A018(BattleSystem *, OpponentData *, OpenCaptureBallMessage *);
void ov12_0225A07C(BattleSystem *, OpponentData *, TrainerEncounterMessage *);
void ov12_0225A2A0(BattleSystem *, OpponentData *, TrainerThrowBallMessage *);
void ov12_0225A334(BattleSystem *, OpponentData *);
void ov12_0225A414(BattleSystem *, OpponentData *, HealthBoxData *);
void ov12_0225A37C(BattleSystem *, OpponentData *, TrainerSlideInMessage *);
void ov12_0225A4DC(BattleSystem *, OpponentData *);
void ov12_0225A524(BattleSystem *, OpponentData *, CommandSetMessage *);
void ov12_0225A604(BattleSystem *, OpponentData *, MoveSelectMenuMessage *);
void ov12_0225A674(BattleSystem *, OpponentData *, TargetSelectMenuMessage *);
void ov12_0225A700(BattleSystem *, OpponentData *, BagMenuMessage *);
void ov12_0225A7AC(BattleSystem *, OpponentData *, PartyMenuMessage *);
void ov12_0225A818(BattleSystem *, OpponentData *, YesNoMenuMessage *);
void ov12_0225A85C(BattleSystem *, OpponentData *, AttackMsgMessage *);
void ov12_0225A8C4(BattleSystem *, OpponentData *, BattleMessage *);
void ov12_0225A914(BattleSystem *, OpponentData *, MoveAnimation *);
void ov12_0225A9B0(BattleSystem *, OpponentData *);
void ov12_0225A9E0(BattleSystem *, OpponentData *, HPGaugeUpdateMessage *);
void ov12_0225AA6C(BattleSystem *, OpponentData *, ExpGaugeUpdateMessage *);
void ov12_0225AAE0(BattleSystem *, OpponentData *, FaintingSequenceMessage *);
void ov12_0225ABB8(BattleSystem *, OpponentData *, PlaySoundMessage *);
void ov12_0225ABE8(BattleSystem *, OpponentData *);
void ov12_0225AC1C(BattleSystem *, OpponentData *, ToggleVanishMessage *);
void ov12_0225ACB0(BattleSystem *, OpponentData *, SetStatusIconMessage *);
void ov12_0225ACE8(BattleSystem *, OpponentData *, TrainerMsgMessage *);
void ov12_0225AD44(BattleSystem *, OpponentData *, ReturnMsgMessage *);
void ov12_0225AD9C(BattleSystem *, OpponentData *, SendOutMsgMessage *);
void ov12_0225ADF4(BattleSystem *, OpponentData *);
void ov12_0225AE48(BattleSystem *, OpponentData *, LeadMonMsgMessage *);
void ov12_0225AEA0(BattleSystem *, OpponentData *);
void ov12_0225AED8(BattleSystem *, OpponentData *, AlertMsgMessage *);
void ov12_0225AF74(BattleSystem *, OpponentData *, RefreshHPGaugeMessage *);
void ov12_0225B028(BattleSystem *, OpponentData *, ForgetMoveMessage *);
void ov12_0225B060(BattleSystem *, OpponentData *, MosaicSetMessage *);
void ov12_0225B0A0(BattleSystem *, OpponentData *, PartyGaugeData *);
void ov12_0225B0E8(BattleSystem *, OpponentData *, PartyGaugeData *);
void ov12_0225B120(BattleSystem *, OpponentData *, PartyGaugeData *);
void ov12_0225B16C(BattleSystem *, OpponentData *, PartyGaugeData *);
void ov12_0225B1A8(BattleSystem *, OpponentData *);
void ov12_0225B200(BattleSystem *, OpponentData *, MoveAnimation *);
void ov12_0225B234(BattleSystem *, OpponentData *);
void ov12_0225B26C(BattleSystem *, OpponentData *);
void ov12_0225B2A4(BattleSystem *, OpponentData *);
void ov12_0225B34C(BattleSystem *, OpponentData *);
void ov12_0225B2F8(BattleSystem *, OpponentData *, EscapeMsgMessage *);
void ov12_0225B3A0(BattleSystem *, OpponentData *, MoveAnimation *);
void ov12_0225B3D4(BattleSystem *, OpponentData *, MoveHitSoundMessage *);
void ov12_0225B434(BattleSystem *, OpponentData *, MusicPlayMessage *);
void ov12_0225B454(BattleSystem *, OpponentData *, Message_022645C8 *);

#endif
