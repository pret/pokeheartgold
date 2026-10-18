#ifndef POKEHEARTGOLD_BATTLE_BATTLE_DISPLAY_H
#define POKEHEARTGOLD_BATTLE_BATTLE_DISPLAY_H

#include "battle/battle.h"
#include "battle/battle_message_structs.h"
#include "battle/battle_system.h"

typedef struct UISetupTaskData {
    BattleSystem *battleSys;
    void *animContext;
    void *animObjects[3];
    u8 step;
    u8 frameCount;
    u8 fadeStep;
    u8 unused;
} UISetupTaskData;

void BattleDisplay_InitTaskSetupUI(BattleSystem *battleSys, OpponentData *opponentData);
void BattleDisplay_InitTaskSetEncounter(BattleSystem *battleSys, OpponentData *opponentData, MonEncounterMessage *message);
void BattleDisplay_InitTaskShowEncounter(BattleSystem *battleSys, OpponentData *opponentData, MonShowMessage *message);
void BattleDisplay_InitTaskShowPokemon(BattleSystem *battleSys, OpponentData *opponentData, MonShowMessage *message);
void BattleDisplay_InitTaskReturnPokemon(BattleSystem *battleSys, OpponentData *opponentData, MonReturnMessage *message);
void BattleDisplay_InitTaskOpenCaptureBall(BattleSystem *battleSys, OpponentData *opponentData, OpenCaptureBallMessage *message);
void BattleDisplay_InitTaskSetTrainerEncounter(BattleSystem *battleSys, OpponentData *opponentData, TrainerEncounterMessage *message);
void BattleDisplay_InitTaskThrowTrainerBall(BattleSystem *battleSys, OpponentData *opponentData, TrainerThrowBallMessage *message);
void BattleDisplay_InitTaskSlideTrainerOut(BattleSystem *battleSys, OpponentData *opponentData);
void BattleDisplay_InitTaskSlideTrainerIn(BattleSystem *battleSys, OpponentData *opponentData, TrainerSlideInMessage *message);
void BattleDisplay_InitTaskSlideHealthBoxIn(BattleSystem *battleSys, OpponentData *opponentData, HealthBoxData *healthboxData);
void BattleDisplay_InitTaskSlideHealthBoxOut(BattleSystem *battleSys, OpponentData *opponentData);
void BattleDisplay_InitTaskSetCommandSelection(BattleSystem *battleSys, OpponentData *opponentData, CommandSetMessage *message);
void BattleDisplay_InitTaskShowMoveSelectMenu(BattleSystem *battleSys, OpponentData *opponentData, MoveSelectMenuMessage *message);
void BattleDisplay_InitTaskShowTargetSelectMenu(BattleSystem *battleSys, OpponentData *opponentData, TargetSelectMenuMessage *message);
void BattleDisplay_InitTaskShowBagMenu(BattleSystem *battleSys, OpponentData *opponentData, BagMenuMessage *message);
void BattleDisplay_InitTaskShowPartyMenu(BattleSystem *battleSys, OpponentData *opponentData, PartyMenuMessage *message);
void BattleDisplay_InitTaskShowYesNoMenu(BattleSystem *battleSys, OpponentData *opponentData, YesNoMenuMessage *message);
void BattleDisplay_PrintAttackMessage(BattleSystem *battleSys, OpponentData *opponentData, AttackMsgMessage *message);
void BattleDisplay_PrintMessage(BattleSystem *battleSys, OpponentData *opponentData, BattleMessage *battleMsg);
void BattleDisplay_InitTaskSetMoveAnimation(BattleSystem *battleSys, OpponentData *opponentData, MoveAnimation *animation);
void BattleDisplay_InitTaskFlickerBattler(BattleSystem *battleSys, OpponentData *opponentData);
void BattleDisplay_InitTaskUpdateHPGauge(BattleSystem *battleSys, OpponentData *opponentData, HPGaugeUpdateMessage *message);
void BattleDisplay_InitTaskUpdateExpGauge(BattleSystem *battleSys, OpponentData *opponentData, ExpGaugeUpdateMessage *message);
void BattleDisplay_InitTaskPlayFaintingSequence(BattleSystem *battleSys, OpponentData *opponentData, FaintingSequenceMessage *message);
void BattleDisplay_PlaySound(BattleSystem *battleSys, OpponentData *opponentData, PlaySoundMessage *message);
void BattleDisplay_InitTaskFadeOut(BattleSystem *battleSys, OpponentData *opponentData);
void BattleDisplay_InitTaskToggleVanish(BattleSystem *battleSys, OpponentData *opponentData, ToggleVanishMessage *message);
void BattleDisplay_SetStatusIcon(BattleSystem *battleSys, OpponentData *opponentData, SetStatusIconMessage *message);
void BattleDisplay_PrintTrainerMessage(BattleSystem *battleSys, OpponentData *opponentData, TrainerMsgMessage *message);
void BattleDisplay_PrintRecallMessage(BattleSystem *battleSys, OpponentData *opponentData, RecallMsgMessage *message);
void BattleDisplay_PrintSendOutMessage(BattleSystem *battleSys, OpponentData *opponentData, SendOutMsgMessage *message);
void BattleDisplay_PrintBattleStartMessage(BattleSystem *battleSys, OpponentData *opponentData);
void BattleDisplay_PrintLeadMonMessage(BattleSystem *battleSys, OpponentData *opponentData, LeadMonMsgMessage *message);
void BattleDisplay_InitTaskPlayLevelUpAnimation(BattleSystem *battleSys, OpponentData *opponentData);
void BattleDisplay_SetAlertMessage(BattleSystem *battleSys, OpponentData *opponentData, AlertMsgMessage *message);
void BattleDisplay_RefreshHPGauge(BattleSystem *battleSys, OpponentData *opponentData, RefreshHPGaugeMessage *message);
void BattleDisplay_InitTaskForgetMove(BattleSystem *battleSys, OpponentData *opponentData, ForgetMoveMessage *message);
void BattleDisplay_InitTaskSetMosaic(BattleSystem *battleSys, OpponentData *opponentData, MosaicSetMessage *message);
void BattleDisplay_InitTaskShowBattleStartPartyGauge(BattleSystem *battleSys, OpponentData *opponentData, PartyGaugeData *partyGauge);
void BattleDisplay_InitTaskHideBattleStartPartyGauge(BattleSystem *battleSys, OpponentData *opponentData, PartyGaugeData *partyGauge);
void BattleDisplay_InitTaskShowPartyGauge(BattleSystem *battleSys, OpponentData *opponentData, PartyGaugeData *partyGauge);
void BattleDisplay_InitTaskHidePartyGauge(BattleSystem *battleSys, OpponentData *opponentData, PartyGaugeData *partyGauge);
void BattleDisplay_PrintLinkWaitMessage(BattleSystem *battleSys, OpponentData *opponentData);
void BattleDisplay_RestoreSprite(BattleSystem *battleSys, OpponentData *opponentData, MoveAnimation *animation);
void BattleDisplay_InitTaskSpriteToOAM(BattleSystem *battleSys, OpponentData *opponentData);
void BattleDisplay_InitTaskOAMToSprite(BattleSystem *battleSys, OpponentData *opponentData);
void BattleDisplay_PrintResultMessage(BattleSystem *battleSys, OpponentData *opponentData);
void BattleDisplay_PrintEscapeMessage(BattleSystem *battleSys, OpponentData *opponentData, EscapeMsgMessage *message);
void BattleDisplay_PrintForfeitMessage(BattleSystem *battleSys, OpponentData *opponentData);
void BattleDisplay_RefreshSprite(BattleSystem *battleSys, OpponentData *opponentData, MoveAnimation *animation);
void BattleDisplay_FlyMoveHitSoundEffect(BattleSystem *battleSys, OpponentData *opponentData, MoveHitSoundMessage *message);
void BattleDisplay_PlayMusic(BattleSystem *battleSys, OpponentData *opponentData, MusicPlayMessage *message);
void ov12_0225B454(BattleSystem *battleSys, OpponentData *opponentData, Message_022645C8 *message);
void OpponentData_SetTaskFuncs(BattleSystem *battleSys, OpponentData *opponentData);
u8 OpponentData_GetBattlerType(OpponentData *opponentData);
u8 ov12_02261264(OpponentData *opponentData);
Pokepic *OpponentData_GetPokepic(OpponentData *opponentData);
BattleHpBar *OpponentData_GetHpBar(OpponentData *opponentData);
BattleCursorPosition *OpponentData_GetBattleCursorPosition(OpponentData *opponentData);
void OpponentData_ClearBattleCursorPosition(OpponentData *opponentData);
void OpponentData_SetTrainerVisibility(OpponentData *opponentData, BOOL drawFlag);

#endif
