#ifndef POKEHEARTGOLD_BATTLE_BATTLE_DISPLAY_H
#define POKEHEARTGOLD_BATTLE_BATTLE_DISPLAY_H

#include "battle/battle.h"
#include "battle/battle_message_structs.h"
#include "battle/battle_system.h"

typedef struct UISetupTaskData {
    BattleSystem *battleSystem;
    void *animContext;
    void *animObjects[3];
    u8 step;
    u8 frameCount;
    u8 fadeStep;
    u8 unused;
} UISetupTaskData;

void BattleDisplay_InitTaskSetupUI(BattleSystem *battleSystem, OpponentData *opponentData);
void BattleDisplay_InitTaskSetEncounter(BattleSystem *battleSystem, OpponentData *opponentData, MonEncounterMessage *message);
void BattleDisplay_InitTaskShowEncounter(BattleSystem *battleSystem, OpponentData *opponentData, MonShowMessage *message);
void BattleDisplay_InitTaskShowPokemon(BattleSystem *battleSystem, OpponentData *opponentData, MonShowMessage *message);
void BattleDisplay_InitTaskReturnPokemon(BattleSystem *battleSystem, OpponentData *opponentData, MonReturnMessage *message);
void BattleDisplay_InitTaskOpenCaptureBall(BattleSystem *battleSystem, OpponentData *opponentData, OpenCaptureBallMessage *message);
void BattleDisplay_InitTaskSetTrainerEncounter(BattleSystem *battleSystem, OpponentData *opponentData, TrainerEncounterMessage *message);
void BattleDisplay_InitTaskThrowTrainerBall(BattleSystem *battleSystem, OpponentData *opponentData, TrainerThrowBallMessage *message);
void BattleDisplay_InitTaskSlideTrainerOut(BattleSystem *battleSystem, OpponentData *opponentData);
void BattleDisplay_InitTaskSlideTrainerIn(BattleSystem *battleSystem, OpponentData *opponentData, TrainerSlideInMessage *message);
void BattleDisplay_InitTaskSlideHealthBoxIn(BattleSystem *battleSystem, OpponentData *opponentData, HealthBoxData *healthboxData);
void BattleDisplay_InitTaskSlideHealthBoxOut(BattleSystem *battleSystem, OpponentData *opponentData);
void BattleDisplay_InitTaskSetCommandSelection(BattleSystem *battleSystem, OpponentData *opponentData, CommandSetMessage *message);
void BattleDisplay_InitTaskShowMoveSelectMenu(BattleSystem *battleSystem, OpponentData *opponentData, MoveSelectMenuMessage *message);
void BattleDisplay_InitTaskShowTargetSelectMenu(BattleSystem *battleSystem, OpponentData *opponentData, TargetSelectMenuMessage *message);
void BattleDisplay_InitTaskShowBagMenu(BattleSystem *battleSystem, OpponentData *opponentData, BagMenuMessage *message);
void BattleDisplay_InitTaskShowPartyMenu(BattleSystem *battleSystem, OpponentData *opponentData, PartyMenuMessage *message);
void BattleDisplay_InitTaskShowYesNoMenu(BattleSystem *battleSystem, OpponentData *opponentData, YesNoMenuMessage *message);
void BattleDisplay_PrintAttackMessage(BattleSystem *battleSystem, OpponentData *opponentData, AttackMsgMessage *message);
void BattleDisplay_PrintMessage(BattleSystem *battleSystem, OpponentData *opponentData, BattleMessage *battleMsg);
void BattleDisplay_InitTaskSetMoveAnimation(BattleSystem *battleSystem, OpponentData *opponentData, MoveAnimation *animation);
void BattleDisplay_InitTaskFlickerBattler(BattleSystem *battleSystem, OpponentData *opponentData);
void BattleDisplay_InitTaskUpdateHPGauge(BattleSystem *battleSystem, OpponentData *opponentData, HPGaugeUpdateMessage *message);
void BattleDisplay_InitTaskUpdateExpGauge(BattleSystem *battleSystem, OpponentData *opponentData, ExpGaugeUpdateMessage *message);
void BattleDisplay_InitTaskPlayFaintingSequence(BattleSystem *battleSystem, OpponentData *opponentData, FaintingSequenceMessage *message);
void BattleDisplay_PlaySound(BattleSystem *battleSystem, OpponentData *opponentData, PlaySoundMessage *message);
void BattleDisplay_InitTaskFadeOut(BattleSystem *battleSystem, OpponentData *opponentData);
void BattleDisplay_InitTaskToggleVanish(BattleSystem *battleSystem, OpponentData *opponentData, ToggleVanishMessage *message);
void BattleDisplay_SetStatusIcon(BattleSystem *battleSystem, OpponentData *opponentData, SetStatusIconMessage *message);
void BattleDisplay_PrintTrainerMessage(BattleSystem *battleSystem, OpponentData *opponentData, TrainerMsgMessage *message);
void BattleDisplay_PrintRecallMessage(BattleSystem *battleSystem, OpponentData *opponentData, RecallMsgMessage *message);
void BattleDisplay_PrintSendOutMessage(BattleSystem *battleSystem, OpponentData *opponentData, SendOutMsgMessage *message);
void BattleDisplay_PrintBattleStartMessage(BattleSystem *battleSystem, OpponentData *opponentData);
void BattleDisplay_PrintLeadMonMessage(BattleSystem *battleSystem, OpponentData *opponentData, LeadMonMsgMessage *message);
void BattleDisplay_InitTaskPlayLevelUpAnimation(BattleSystem *battleSystem, OpponentData *opponentData);
void BattleDisplay_SetAlertMessage(BattleSystem *battleSystem, OpponentData *opponentData, AlertMsgMessage *message);
void BattleDisplay_RefreshHPGauge(BattleSystem *battleSystem, OpponentData *opponentData, RefreshHPGaugeMessage *message);
void BattleDisplay_InitTaskForgetMove(BattleSystem *battleSystem, OpponentData *opponentData, ForgetMoveMessage *message);
void BattleDisplay_InitTaskSetMosaic(BattleSystem *battleSystem, OpponentData *opponentData, MosaicSetMessage *message);
void BattleDisplay_InitTaskShowBattleStartPartyGauge(BattleSystem *battleSystem, OpponentData *opponentData, PartyGaugeData *partyGauge);
void BattleDisplay_InitTaskHideBattleStartPartyGauge(BattleSystem *battleSystem, OpponentData *opponentData, PartyGaugeData *partyGauge);
void BattleDisplay_InitTaskShowPartyGauge(BattleSystem *battleSystem, OpponentData *opponentData, PartyGaugeData *partyGauge);
void BattleDisplay_InitTaskHidePartyGauge(BattleSystem *battleSystem, OpponentData *opponentData, PartyGaugeData *partyGauge);
void BattleDisplay_PrintLinkWaitMessage(BattleSystem *battleSystem, OpponentData *opponentData);
void BattleDisplay_RestoreSprite(BattleSystem *battleSystem, OpponentData *opponentData, MoveAnimation *animation);
void BattleDisplay_InitTaskSpriteToOAM(BattleSystem *battleSystem, OpponentData *opponentData);
void BattleDisplay_InitTaskOAMToSprite(BattleSystem *battleSystem, OpponentData *opponentData);
void BattleDisplay_PrintResultMessage(BattleSystem *battleSystem, OpponentData *opponentData);
void BattleDisplay_PrintEscapeMessage(BattleSystem *battleSystem, OpponentData *opponentData, EscapeMsgMessage *message);
void BattleDisplay_PrintForfeitMessage(BattleSystem *battleSystem, OpponentData *opponentData);
void BattleDisplay_RefreshSprite(BattleSystem *battleSystem, OpponentData *opponentData, MoveAnimation *animation);
void BattleDisplay_FlyMoveHitSoundEffect(BattleSystem *battleSystem, OpponentData *opponentData, MoveHitSoundMessage *message);
void BattleDisplay_PlayMusic(BattleSystem *battleSystem, OpponentData *opponentData, MusicPlayMessage *message);
void ov12_0225B454(BattleSystem *battleSystem, OpponentData *opponentData, Message_022645C8 *message);
void OpponentData_SetTaskFuncs(BattleSystem *battleSystem, OpponentData *opponentData);
u8 OpponentData_GetBattlerType(OpponentData *opponentData);
u8 ov12_02261264(OpponentData *opponentData);
Pokepic *OpponentData_GetPokepic(OpponentData *opponentData);
BattleHpBar *OpponentData_GetHpBar(OpponentData *opponentData);
BattleCursorPosition *OpponentData_GetBattleCursorPosition(OpponentData *opponentData);
void OpponentData_ClearBattleCursorPosition(OpponentData *opponentData);
void OpponentData_SetTrainerVisibility(OpponentData *opponentData, BOOL drawFlag);

#endif
