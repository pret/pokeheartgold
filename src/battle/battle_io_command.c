#include "battle/battle_io_command.h"

#include "constants/abilities.h"

#include "battle/battle_message_structs.h"
#include "battle/battle_system.h"

#include "pokemon.h"

static void BattleIOCmd_None(BattleSystem *battleSys, OpponentData *opponentData);
static void BattleIOCmd_SetupUI(BattleSystem *battleSys, OpponentData *opponentData);
static void BattleIOCmd_SetEncounter(BattleSystem *battleSys, OpponentData *opponentData);
static void BattleIOCmd_ShowEncounter(BattleSystem *battleSys, OpponentData *opponentData);
static void BattleIOCmd_ShowPokemon(BattleSystem *battleSys, OpponentData *opponentData);
static void BattleIOCmd_ReturnPokemon(BattleSystem *battleSys, OpponentData *opponentData);
static void BattleIOCmd_OpenCaptureBall(BattleSystem *battleSys, OpponentData *opponentData);
static void BattleIOCmd_DeletePokemon(BattleSystem *battleSys, OpponentData *opponentData);
static void BattleIOCmd_SetTrainerEncounter(BattleSystem *battleSys, OpponentData *opponentData);
static void BattleIOCmd_ThrowTrainerBall(BattleSystem *battleSys, OpponentData *opponentData);
static void BattleIOCmd_SlideTrainerOut(BattleSystem *battleSys, OpponentData *opponentData);
static void BattleIOCmd_SlideTrainerIn(BattleSystem *battleSys, OpponentData *opponentData);
static void BattleIOCmd_SlideHealthBoxIn(BattleSystem *battleSys, OpponentData *opponentData);
static void BattleIOCmd_SlideHealthBoxOut(BattleSystem *battleSys, OpponentData *opponentData);
static void BattleIOCmd_SetCommandSelection(BattleSystem *battleSys, OpponentData *opponentData);
static void BattleIOCmd_ShowMoveSelectMenu(BattleSystem *battleSys, OpponentData *opponentData);
static void BattleIOCmd_ShowTargetSelectMenu(BattleSystem *battleSys, OpponentData *opponentData);
static void BattleIOCmd_ShowBagMenu(BattleSystem *battleSys, OpponentData *opponentData);
static void BattleIOCmd_ShowPartyMenu(BattleSystem *battleSys, OpponentData *opponentData);
static void BattleIOCmd_ShowYesNoMenu(BattleSystem *battleSys, OpponentData *opponentData);
static void BattleIOCmd_PrintAttackMessage(BattleSystem *battleSys, OpponentData *opponentData);
static void BattleIOCmd_PrintBattleMessage(BattleSystem *battleSys, OpponentData *opponentData);
static void BattleIOCmd_SetMoveAnimation(BattleSystem *battleSys, OpponentData *opponentData);
static void BattleIOCmd_FlickerBattler(BattleSystem *battleSys, OpponentData *opponentData);
static void BattleIOCmd_UpdateHPGauge(BattleSystem *battleSys, OpponentData *opponentData);
static void BattleIOCmd_UpdateExpGauge(BattleSystem *battleSys, OpponentData *opponentData);
static void BattleIOCmd_PlayFaintingSequence(BattleSystem *battleSys, OpponentData *opponentData);
static void BattleIOCmd_PlaySound(BattleSystem *battleSys, OpponentData *opponentData);
static void BattleIOCmd_FadeOut(BattleSystem *battleSys, OpponentData *opponentData);
static void BattleIOCmd_ToggleVanish(BattleSystem *battleSys, OpponentData *opponentData);
static void BattleIOCmd_SetStatusIcon(BattleSystem *battleSys, OpponentData *opponentData);
static void BattleIOCmd_PrintTrainerMessage(BattleSystem *battleSys, OpponentData *opponentData);
static void BattleIOCmd_PrintReturnMessage(BattleSystem *battleSys, OpponentData *opponentData);
static void BattleIOCmd_PrintSendOutMessage(BattleSystem *battleSys, OpponentData *opponentData);
static void BattleIOCmd_PrintEncounterMessage(BattleSystem *battleSys, OpponentData *opponentData);
static void BattleIOCmd_PrintLeadMonMessage(BattleSystem *battleSys, OpponentData *opponentData);
static void BattleIOCmd_PlayLevelUpAnimation(BattleSystem *battleSys, OpponentData *opponentData);
static void BattleIOCmd_SetAlertMessage(BattleSystem *battleSys, OpponentData *opponentData);
static void BattleIOCmd_RefreshHPGauge(BattleSystem *battleSys, OpponentData *opponentData);
static void BattleIOCmd_UpdatePartyMon(BattleSystem *battleSys, OpponentData *opponentData);
static void BattleIOCmd_SlideInBackground(BattleSystem *battleSys, OpponentData *opponentData);
static void BattleIOCmd_StopGaugeAnimation(BattleSystem *battleSys, OpponentData *opponentData);
static void BattleIOCmd_RefreshPartyStatus(BattleSystem *battleSys, OpponentData *opponentData);
static void BattleIOCmd_ForgetMove(BattleSystem *battleSys, OpponentData *opponentData);
static void BattleIOCmd_SetMosaic(BattleSystem *battleSys, OpponentData *opponentData);
static void BattleIOCmd_ChangeForm(BattleSystem *battleSys, OpponentData *opponentData);
static void BattleIOCmd_UpdateBg(BattleSystem *battleSys, OpponentData *opponentData);
static void BattleIOCmd_ClearTouchScreen(BattleSystem *battleSys, OpponentData *opponentData);
static void BattleIOCmd_ShowBattleStartPartyGauge(BattleSystem *battleSys, OpponentData *opponentData);
static void BattleIOCmd_HideBattleStartPartyGauge(BattleSystem *battleSys, OpponentData *opponentData);
static void BattleIOCmd_ShowPartyGauge(BattleSystem *battleSys, OpponentData *opponentData);
static void BattleIOCmd_HidePartyGauge(BattleSystem *battleSys, OpponentData *opponentData);
static void BattleIOCmd_LoadPartyGaugeGraphics(BattleSystem *battleSys, OpponentData *opponentData);
static void BattleIOCmd_FreePartyGaugeGraphics(BattleSystem *battleSys, OpponentData *opponentData);
static void BattleIOCmd_IncrementRecord(BattleSystem *battleSys, OpponentData *opponentData);
static void BattleIOCmd_PrintLinkWaitMessage(BattleSystem *battleSys, OpponentData *opponentData);
static void BattleIOCmd_RestoreSprite(BattleSystem *battleSys, OpponentData *opponentData);
static void BattleIOCmd_SpriteToOAM(BattleSystem *battleSys, OpponentData *opponentData);
static void BattleIOCmd_OAMToSprite(BattleSystem *battleSys, OpponentData *opponentData);
static void BattleIOCmd_PrintResultMessage(BattleSystem *battleSys, OpponentData *opponentData);
static void BattleIOCmd_PrintEscapeMessage(BattleSystem *battleSys, OpponentData *opponentData);
static void BattleIOCmd_PrintForfeitMessage(BattleSystem *battleSys, OpponentData *opponentData);
static void BattleIOCmd_RefreshSprite(BattleSystem *battleSys, OpponentData *opponentData);
static void BattleIOCmd_FlyMoveHitSoundEffect(BattleSystem *battleSys, OpponentData *opponentData);
static void BattleIOCmd_PlayMusic(BattleSystem *battleSys, OpponentData *opponentData);
static void BattleIOCmd_SetBattleResult(BattleSystem *battleSys, OpponentData *opponentData);
static void BattleIOCmd_ClearMessageBox(BattleSystem *battleSys, OpponentData *opponentData);
static void BattleIOCmd_67(BattleSystem *battleSys, OpponentData *opponentData);
static void ov12_02259928(OpponentData *opponentData);

typedef void (*BattleCommandPtr)(BattleSystem *, OpponentData *);
static const BattleCommandPtr sBattleCommands[] = {
    [BATTLE_COMMAND_NONE] = BattleIOCmd_None,
    [BATTLE_COMMAND_SETUP_UI] = BattleIOCmd_SetupUI,
    [BATTLE_COMMAND_SET_ENCOUNTER] = BattleIOCmd_SetEncounter,
    [BATTLE_COMMAND_SHOW_ENCOUNTER] = BattleIOCmd_ShowEncounter,
    [BATTLE_COMMAND_SHOW_POKEMON] = BattleIOCmd_ShowPokemon,
    [BATTLE_COMMAND_RETURN_POKEMON] = BattleIOCmd_ReturnPokemon,
    [BATTLE_COMMAND_OPEN_CAPTURE_BALL] = BattleIOCmd_OpenCaptureBall,
    [BATTLE_COMMAND_DELETE_POKEMON] = BattleIOCmd_DeletePokemon,
    [BATTLE_COMMAND_SET_TRAINER_ENCOUNTER] = BattleIOCmd_SetTrainerEncounter,
    [BATTLE_COMMAND_THROW_TRAINER_BALL] = BattleIOCmd_ThrowTrainerBall,
    [BATTLE_COMMAND_SLIDE_TRAINER_OUT] = BattleIOCmd_SlideTrainerOut,
    [BATTLE_COMMAND_SLIDE_TRAINER_IN] = BattleIOCmd_SlideTrainerIn,
    [BATTLE_COMMAND_SLIDE_HEALTHBOX_IN] = BattleIOCmd_SlideHealthBoxIn,
    [BATTLE_COMMAND_SLIDE_HEALTHBOX_OUT] = BattleIOCmd_SlideHealthBoxOut,
    [BATTLE_COMMAND_SET_COMMAND_SELECTION] = BattleIOCmd_SetCommandSelection,
    [BATTLE_COMMAND_SHOW_MOVE_SELECT_MENU] = BattleIOCmd_ShowMoveSelectMenu,
    [BATTLE_COMMAND_SHOW_TARGET_SELECT_MENU] = BattleIOCmd_ShowTargetSelectMenu,
    [BATTLE_COMMAND_SHOW_BAG_MENU] = BattleIOCmd_ShowBagMenu,
    [BATTLE_COMMAND_SHOW_PARTY_MENU] = BattleIOCmd_ShowPartyMenu,
    [BATTLE_COMMAND_SHOW_YES_NO_MENU] = BattleIOCmd_ShowYesNoMenu,
    [BATTLE_COMMAND_PRINT_ATTACK_MESSAGE] = BattleIOCmd_PrintAttackMessage,
    [BATTLE_COMMAND_PRINT_MESSAGE] = BattleIOCmd_PrintBattleMessage,
    [BATTLE_COMMAND_SET_MOVE_ANIMATION] = BattleIOCmd_SetMoveAnimation,
    [BATTLE_COMMAND_FLICKER_BATTLER] = BattleIOCmd_FlickerBattler,
    [BATTLE_COMMAND_UPDATE_HP_GAUGE] = BattleIOCmd_UpdateHPGauge,
    [BATTLE_COMMAND_UPDATE_EXP_GAUGE] = BattleIOCmd_UpdateExpGauge,
    [BATTLE_COMMAND_PLAY_FAINTING_SEQUENCE] = BattleIOCmd_PlayFaintingSequence,
    [BATTLE_COMMAND_PLAY_SOUND] = BattleIOCmd_PlaySound,
    [BATTLE_COMMAND_FADE_OUT] = BattleIOCmd_FadeOut,
    [BATTLE_COMMAND_TOGGLE_VANISH] = BattleIOCmd_ToggleVanish,
    [BATTLE_COMMAND_SET_STATUS_ICON] = BattleIOCmd_SetStatusIcon,
    [BATTLE_COMMAND_PRINT_TRAINER_MESSAGE] = BattleIOCmd_PrintTrainerMessage,
    [BATTLE_COMMAND_PRINT_RETURN_MESSAGE] = BattleIOCmd_PrintReturnMessage,
    [BATTLE_COMMAND_PRINT_SEND_OUT_MESSAGE] = BattleIOCmd_PrintSendOutMessage,
    [BATTLE_COMMAND_PRINT_ENCOUNTER_MESSAGE] = BattleIOCmd_PrintEncounterMessage,
    [BATTLE_COMMAND_PRINT_LEAD_MON_MESSAGE] = BattleIOCmd_PrintLeadMonMessage,
    [BATTLE_COMMAND_PLAY_LEVEL_UP_ANIMATION] = BattleIOCmd_PlayLevelUpAnimation,
    [BATTLE_COMMAND_SET_ALERT_MESSAGE] = BattleIOCmd_SetAlertMessage,
    [BATTLE_COMMAND_REFRESH_HP_GAUGE] = BattleIOCmd_RefreshHPGauge,
    [BATTLE_COMMAND_UPDATE_PARTY_MON] = BattleIOCmd_UpdatePartyMon,
    [BATTLE_COMMAND_SLIDE_IN_BACKGROUND] = BattleIOCmd_SlideInBackground,
    [BATTLE_COMMAND_STOP_GAUGE_ANIMATION] = BattleIOCmd_StopGaugeAnimation,
    [BATTLE_COMMAND_REFRESH_PARTY_STATUS] = BattleIOCmd_RefreshPartyStatus,
    [BATTLE_COMMAND_FORGET_MOVE] = BattleIOCmd_ForgetMove,
    [BATTLE_COMMAND_SET_MOSAIC] = BattleIOCmd_SetMosaic,
    [BATTLE_COMMAND_CHANGE_FORM] = BattleIOCmd_ChangeForm,
    [BATTLE_COMMAND_UPDATE_BG] = BattleIOCmd_UpdateBg,
    [BATTLE_COMMAND_CLEAR_TOUCH_SCREEN] = BattleIOCmd_ClearTouchScreen,
    [BATTLE_COMMAND_SHOW_BATTLE_START_PARTY_GAUGE] = BattleIOCmd_ShowBattleStartPartyGauge,
    [BATTLE_COMMAND_HIDE_BATTLE_START_PARTY_GAUGE] = BattleIOCmd_HideBattleStartPartyGauge,
    [BATTLE_COMMAND_SHOW_PARTY_GAUGE] = BattleIOCmd_ShowPartyGauge,
    [BATTLE_COMMAND_HIDE_PARTY_GAUGE] = BattleIOCmd_HidePartyGauge,
    [BATTLE_COMMAND_LOAD_PARTY_GAUGE_GRAPHICS] = BattleIOCmd_LoadPartyGaugeGraphics,
    [BATTLE_COMMAND_FREE_PARTY_GAUGE_GRAPHICS] = BattleIOCmd_FreePartyGaugeGraphics,
    [BATTLE_COMMAND_INCREMENT_RECORD] = BattleIOCmd_IncrementRecord,
    [BATTLE_COMMAND_PRINT_LINK_WAIT_MESSAGE] = BattleIOCmd_PrintLinkWaitMessage,
    [BATTLE_COMMAND_RESTORE_SPRITE] = BattleIOCmd_RestoreSprite,
    [BATTLE_COMMAND_SPRITE_TO_OAM] = BattleIOCmd_SpriteToOAM,
    [BATTLE_COMMAND_OAM_TO_SPRITE] = BattleIOCmd_OAMToSprite,
    [BATTLE_COMMAND_PRINT_RESULT_MESSAGE] = BattleIOCmd_PrintResultMessage,
    [BATTLE_COMMAND_PRINT_ESCAPE_MESSAGE] = BattleIOCmd_PrintEscapeMessage,
    [BATTLE_COMMAND_PRINT_FORFEIT_MESSAGE] = BattleIOCmd_PrintForfeitMessage,
    [BATTLE_COMMAND_REFRESH_SPRITE] = BattleIOCmd_RefreshSprite,
    [BATTLE_COMMAND_FLY_MOVE_HIT_SOUND_EFFECT] = BattleIOCmd_FlyMoveHitSoundEffect,
    [BATTLE_COMMAND_PLAY_MUSIC] = BattleIOCmd_PlayMusic,
    [BATTLE_COMMAND_SET_BATTLE_RESULT] = BattleIOCmd_SetBattleResult,
    [BATTLE_COMMAND_CLEAR_MESSAGE_BOX] = BattleIOCmd_ClearMessageBox,
    [BATTLE_COMMAND_67] = BattleIOCmd_67,
};

void BattleSystem_ExecuteBattlerCommand(BattleSystem *battleSys, OpponentData *OpponentData) {
    if (OpponentData->unk94[0]) {
        OpponentData->unk1A8 = 0;
        sBattleCommands[OpponentData->unk94[0]](battleSys, OpponentData);
    }
}

void OpponentData_Delete(BattleSystem *battleSys, OpponentData *opponentData, int renderMode) {
    if (renderMode != 2) {
        BattleHpBar_FreeResources(&opponentData->hpBar);
    }

    if (opponentData->managedSprite) {
        Sprite_DeleteAndFreeResources(opponentData->managedSprite);
    }

    ov12_02262014(opponentData);

    NARC_Delete(opponentData->narc);
    Heap_Free(opponentData);
}

static void BattleIOCmd_None(BattleSystem *battleSys, OpponentData *opponentData) {
    return;
}

static void BattleIOCmd_SetupUI(BattleSystem *battleSys, OpponentData *opponentData) {
    UISetupMessage *message = (UISetupMessage *)&opponentData->unk94[0];

    BattleSystem_SetRandTemp(battleSys, message->seed);
    ov12_02259944(battleSys, opponentData);
    BattleController_EmitClearCommand(battleSys, opponentData->battlerId, BATTLE_COMMAND_SETUP_UI);
    ov12_02259928(opponentData);
}

static void BattleIOCmd_SetEncounter(BattleSystem *battleSys, OpponentData *opponentData) {
    MonEncounterMessage *message = (MonEncounterMessage *)&opponentData->unk94[0];

    ov12_02259968(battleSys, opponentData, message);
    ov12_02259928(opponentData);
}

static void BattleIOCmd_ShowEncounter(BattleSystem *battleSys, OpponentData *opponentData) {
    MonShowMessage *message = (MonShowMessage *)&opponentData->unk94[0];

    ov12_02259BA8(battleSys, opponentData, message);
    ov12_02259928(opponentData);
}

static void BattleIOCmd_ShowPokemon(BattleSystem *battleSys, OpponentData *opponentData) {
    MonShowMessage *message = (MonShowMessage *)&opponentData->unk94[0];

    ov12_02259D48(battleSys, opponentData, message);
    ov12_02259928(opponentData);
}

static void BattleIOCmd_ReturnPokemon(BattleSystem *battleSys, OpponentData *opponentData) {
    MonReturnMessage *message = (MonReturnMessage *)&opponentData->unk94[0];

    ov12_02259F30(battleSys, opponentData, message);
    ov12_02259928(opponentData);
}

static void BattleIOCmd_OpenCaptureBall(BattleSystem *battleSys, OpponentData *opponentData) {
    OpenCaptureBallMessage *message = (OpenCaptureBallMessage *)&opponentData->unk94[0];

    ov12_0225A018(battleSys, opponentData, message);
    ov12_02259928(opponentData);
}

static void BattleIOCmd_DeletePokemon(BattleSystem *battleSys, OpponentData *opponentData) {
    Pokepic_Delete(opponentData->pokepic);
    BattleController_EmitClearCommand(battleSys, opponentData->battlerId, BATTLE_COMMAND_DELETE_POKEMON);
    ov12_02259928(opponentData);
}

static void BattleIOCmd_SetTrainerEncounter(BattleSystem *battleSys, OpponentData *opponentData) {
    TrainerEncounterMessage *message = (TrainerEncounterMessage *)&opponentData->unk94[0];

    ov12_0225A07C(battleSys, opponentData, message);
    ov12_02259928(opponentData);
}

static void BattleIOCmd_ThrowTrainerBall(BattleSystem *battleSys, OpponentData *opponentData) {
    TrainerThrowBallMessage *message = (TrainerThrowBallMessage *)&opponentData->unk94[0];

    ov12_0225A2A0(battleSys, opponentData, message);
    ov12_02259928(opponentData);
}

static void BattleIOCmd_SlideTrainerOut(BattleSystem *battleSys, OpponentData *opponentData) {
    ov12_0225A334(battleSys, opponentData);
    ov12_02259928(opponentData);
}

static void BattleIOCmd_SlideTrainerIn(BattleSystem *battleSys, OpponentData *opponentData) {
    TrainerSlideInMessage *message = (TrainerSlideInMessage *)&opponentData->unk94[0];

    ov12_0225A37C(battleSys, opponentData, message);
    ov12_02259928(opponentData);
}

static void BattleIOCmd_SlideHealthBoxIn(BattleSystem *battleSys, OpponentData *opponentData) {
    HealthBoxData *healthboxData = (HealthBoxData *)&opponentData->unk94[0];

    ov12_0225A414(battleSys, opponentData, healthboxData);
    ov12_02259928(opponentData);
}

static void BattleIOCmd_SlideHealthBoxOut(BattleSystem *battleSys, OpponentData *opponentData) {
    ov12_0225A4DC(battleSys, opponentData);
    ov12_02259928(opponentData);
}

static void BattleIOCmd_SetCommandSelection(BattleSystem *battleSys, OpponentData *opponentData) {
    CommandSetMessage *message = (CommandSetMessage *)&opponentData->unk94[0];

    ov12_0223BB6C(battleSys, message->switchingOrCanPickCommandMask);
    ov12_0225A524(battleSys, opponentData, message);
    ov12_02259928(opponentData);
}

static void BattleIOCmd_ShowMoveSelectMenu(BattleSystem *battleSys, OpponentData *opponentData) {
    MoveSelectMenuMessage *message = (MoveSelectMenuMessage *)&opponentData->unk94[0];

    ov12_0225A604(battleSys, opponentData, message);
    ov12_02259928(opponentData);
}

static void BattleIOCmd_ShowTargetSelectMenu(BattleSystem *battleSys, OpponentData *opponentData) {
    TargetSelectMenuMessage *message = (TargetSelectMenuMessage *)&opponentData->unk94[0];

    ov12_0225A674(battleSys, opponentData, message);
    ov12_02259928(opponentData);
}

static void BattleIOCmd_ShowBagMenu(BattleSystem *battleSys, OpponentData *opponentData) {
    BagMenuMessage *message = (BagMenuMessage *)&opponentData->unk94[0];

    ov12_0225A700(battleSys, opponentData, message);
    ov12_02259928(opponentData);
}

static void BattleIOCmd_ShowPartyMenu(BattleSystem *battleSys, OpponentData *opponentData) {
    PartyMenuMessage *message = (PartyMenuMessage *)&opponentData->unk94[0];

    ov12_0225A7AC(battleSys, opponentData, message);
    ov12_02259928(opponentData);
}

static void BattleIOCmd_ShowYesNoMenu(BattleSystem *battleSys, OpponentData *opponentData) {
    YesNoMenuMessage *message = (YesNoMenuMessage *)&opponentData->unk94[0];

    ov12_0225A818(battleSys, opponentData, message);
    ov12_02259928(opponentData);
}

static void BattleIOCmd_PrintAttackMessage(BattleSystem *battleSys, OpponentData *opponentData) {
    AttackMsgMessage *message = (AttackMsgMessage *)&opponentData->unk94[0];

    ov12_0225A85C(battleSys, opponentData, message);
    ov12_02259928(opponentData);
}

static void BattleIOCmd_PrintBattleMessage(BattleSystem *battleSys, OpponentData *opponentData) {
    BattleMessage *battleMsg = (BattleMessage *)&opponentData->unk94[0];

    ov12_0225A8C4(battleSys, opponentData, battleMsg);
    ov12_02259928(opponentData);
}

static void BattleIOCmd_SetMoveAnimation(BattleSystem *battleSys, OpponentData *opponentData) {
    MoveAnimation *moveAnim = (MoveAnimation *)&opponentData->unk94[0];

    ov12_0225A914(battleSys, opponentData, moveAnim);
    ov12_02259928(opponentData);
}

static void BattleIOCmd_FlickerBattler(BattleSystem *battleSys, OpponentData *opponentData) {
    if (Pokepic_GetAttr(opponentData->pokepic, 6) == TRUE) {
        BattleController_EmitClearCommand(battleSys, opponentData->battlerId, BATTLE_COMMAND_FLICKER_BATTLER);
    } else {
        ov12_0225A9B0(battleSys, opponentData);
    }

    ov12_02259928(opponentData);
}

static void BattleIOCmd_UpdateHPGauge(BattleSystem *battleSys, OpponentData *opponentData) {
    HPGaugeUpdateMessage *message = (HPGaugeUpdateMessage *)&opponentData->unk94[0];

    ov12_0225A9E0(battleSys, opponentData, message);
    ov12_02259928(opponentData);
}

static void BattleIOCmd_UpdateExpGauge(BattleSystem *battleSys, OpponentData *opponentData) {
    ExpGaugeUpdateMessage *message = (ExpGaugeUpdateMessage *)&opponentData->unk94[0];

    ov12_0225AA6C(battleSys, opponentData, message);
    ov12_02259928(opponentData);
}

static void BattleIOCmd_PlayFaintingSequence(BattleSystem *battleSys, OpponentData *opponentData) {
    FaintingSequenceMessage *message = (FaintingSequenceMessage *)&opponentData->unk94[0];

    ov12_0225AAE0(battleSys, opponentData, message);
    ov12_02259928(opponentData);
}

static void BattleIOCmd_PlaySound(BattleSystem *battleSys, OpponentData *opponentData) {
    PlaySoundMessage *message = (PlaySoundMessage *)&opponentData->unk94[0];

    ov12_0225ABB8(battleSys, opponentData, message);
    ov12_02259928(opponentData);
}

static void BattleIOCmd_FadeOut(BattleSystem *battleSys, OpponentData *opponentData) {
    ov12_0225ABE8(battleSys, opponentData);
    ov12_02259928(opponentData);
}

static void BattleIOCmd_ToggleVanish(BattleSystem *battleSys, OpponentData *opponentData) {
    ToggleVanishMessage *message = (ToggleVanishMessage *)&opponentData->unk94[0];

    ov12_0225AC1C(battleSys, opponentData, message);
    ov12_02259928(opponentData);
}

static void BattleIOCmd_SetStatusIcon(BattleSystem *battleSys, OpponentData *opponentData) {
    SetStatusIconMessage *message = (SetStatusIconMessage *)&opponentData->unk94[0];

    ov12_0225ACB0(battleSys, opponentData, message);
    ov12_02259928(opponentData);
}

static void BattleIOCmd_PrintTrainerMessage(BattleSystem *battleSys, OpponentData *opponentData) {
    TrainerMsgMessage *message = (TrainerMsgMessage *)&opponentData->unk94[0];

    ov12_0225ACE8(battleSys, opponentData, message);
    ov12_02259928(opponentData);
}

static void BattleIOCmd_PrintReturnMessage(BattleSystem *battleSys, OpponentData *opponentData) {
    ReturnMsgMessage *message = (ReturnMsgMessage *)&opponentData->unk94[0];

    ov12_0225AD44(battleSys, opponentData, message);
    ov12_02259928(opponentData);
}

static void BattleIOCmd_PrintSendOutMessage(BattleSystem *battleSys, OpponentData *opponentData) {
    SendOutMsgMessage *message = (SendOutMsgMessage *)&opponentData->unk94[0];

    ov12_0225AD9C(battleSys, opponentData, message);
    ov12_02259928(opponentData);
}

static void BattleIOCmd_PrintEncounterMessage(BattleSystem *battleSys, OpponentData *opponentData) {
    ov12_0225ADF4(battleSys, opponentData);
    ov12_02259928(opponentData);
}

static void BattleIOCmd_PrintLeadMonMessage(BattleSystem *battleSys, OpponentData *opponentData) {
    LeadMonMsgMessage *message = (LeadMonMsgMessage *)&opponentData->unk94[0];

    ov12_0225AE48(battleSys, opponentData, message);
    ov12_02259928(opponentData);
}

static void BattleIOCmd_PlayLevelUpAnimation(BattleSystem *battleSys, OpponentData *opponentData) {
    ov12_0225AEA0(battleSys, opponentData);
    ov12_02259928(opponentData);
}

static void BattleIOCmd_SetAlertMessage(BattleSystem *battleSys, OpponentData *opponentData) {
    AlertMsgMessage *message = (AlertMsgMessage *)&opponentData->unk94[0];

    ov12_0225AED8(battleSys, opponentData, message);
    ov12_02259928(opponentData);
}

static void BattleIOCmd_RefreshHPGauge(BattleSystem *battleSys, OpponentData *opponentData) {
    RefreshHPGaugeMessage *message = (RefreshHPGaugeMessage *)&opponentData->unk94[0];

    ov12_0225AF74(battleSys, opponentData, message);
    ov12_02259928(opponentData);
}

static void BattleIOCmd_UpdatePartyMon(BattleSystem *battleSys, OpponentData *opponentData) {
    UpdatePartyMonMessage *message = (UpdatePartyMonMessage *)&opponentData->unk94[0];
    int i;
    Pokemon *mon = BattleSystem_GetPartyMon(battleSys, opponentData->battlerId, message->partySlot);

    if ((message->status2 & STATUS2_TRANSFORM) == FALSE) {
        for (i = 0; i < 4; i++) {
            if ((message->mimickedMoveSlot & MaskOfFlagNo(i)) == FALSE) {
                SetMonData(mon, MON_DATA_MOVE1 + i, (u8 *)&message->moves[i]);
                SetMonData(mon, MON_DATA_MOVE1_PP + i, (u8 *)&message->ppCur[i]);
            }
        }
    }

    if ((message->knockedOffItemsMask & MaskOfFlagNo(message->partySlot)) == FALSE) {
        SetMonData(mon, MON_DATA_HELD_ITEM, (u8 *)&message->heldItem);
    }

    SetMonData(mon, MON_DATA_HP, (u8 *)&message->curHP);
    SetMonData(mon, MON_DATA_STATUS, (u8 *)&message->status);

    if (message->updateForm) {
        SetMonData(mon, MON_DATA_FORM, (u8 *)&message->formNum);
    }

    if (message->updateStats) {
        SetMonData(mon, MON_DATA_ABILITY, (u8 *)&message->ability);
        CalcMonLevelAndStats(mon);
    }

    BattleController_EmitClearCommand(battleSys, opponentData->battlerId, message->command);
    ov12_02259928(opponentData);
}

static void BattleIOCmd_SlideInBackground(BattleSystem *battleSys, OpponentData *opponentData) {
    u32 battleType = BattleSystem_GetBattleType(battleSys);
    BattleInput *battleInput = BattleSystem_GetBattleInput(battleSys);

    if (opponentData->unk196 == 0) {
        if ((battleType & BATTLE_TYPE_MULTI)
            || ((battleType & BATTLE_TYPE_MULTI) == FALSE && opponentData->battlerType != BATTLER_TYPE_PLAYER_SIDE_SLOT_2)) {
            BattleInput_StartMenuScrollHorizontalTask(battleInput, -0xd00, 0);
        }
    }

    BattleController_EmitClearCommand(battleSys, opponentData->battlerId, opponentData->unk94[0]);
    ov12_02259928(opponentData);
}

static void BattleIOCmd_StopGaugeAnimation(BattleSystem *battleSys, OpponentData *opponentData) {
    ov12_02264EB4(&opponentData->hpBar);
    ov12_02262014(opponentData);
    BattleController_EmitClearCommand(battleSys, opponentData->battlerId, opponentData->unk94[0]);
    ov12_02259928(opponentData);
}

static void BattleIOCmd_RefreshPartyStatus(BattleSystem *battleSys, OpponentData *opponentData) {
    RefreshPartyStatusMessage *message = (RefreshPartyStatusMessage *)&opponentData->unk94[0];
    Pokemon *mon;
    int i, partyCount, ability;
    u32 clearedStatus = 0;
    partyCount = BattleSystem_GetPartySize(battleSys, opponentData->battlerId);

    for (i = 0; i < partyCount; i++) {
        mon = BattleSystem_GetPartyMon(battleSys, opponentData->battlerId, i);

        if (message->ability == ABILITY_MOLD_BREAKER) {
            ability = ABILITY_NONE;
        } else {
            ability = GetMonData(mon, MON_DATA_ABILITY, NULL);
        }

        if (message->move != MOVE_HEAL_BELL || (message->move == MOVE_HEAL_BELL && ability != ABILITY_SOUNDPROOF)) {
            SetMonData(mon, MON_DATA_STATUS, (u8 *)&clearedStatus);
        }
    }

    BattleController_EmitClearCommand(battleSys, opponentData->battlerId, message->command);
    ov12_02259928(opponentData);
}

static void BattleIOCmd_ForgetMove(BattleSystem *battleSys, OpponentData *opponentData) {
    ForgetMoveMessage *message = (ForgetMoveMessage *)&opponentData->unk94[0];

    ov12_0225B028(battleSys, opponentData, message);
    ov12_02259928(opponentData);
}

static void BattleIOCmd_SetMosaic(BattleSystem *battleSys, OpponentData *opponentData) {
    MosaicSetMessage *message = (MosaicSetMessage *)&opponentData->unk94[0];

    ov12_0225B060(battleSys, opponentData, message);
    ov12_02259928(opponentData);
}

static void BattleIOCmd_ChangeForm(BattleSystem *battleSys, OpponentData *opponentData) {
    MonChangeFormMessage *message = (MonChangeFormMessage *)&opponentData->unk94[0];
    PokepicTemplate monSpriteTemplate;
    PokepicTemplate *monSpriteTemplatePtr;
    int y;
    int face;

    if (opponentData->battlerType & 1) {
        face = 2;
    } else {
        face = 0;
    }

    GetMonSpriteCharAndPlttNarcIdsEx(&monSpriteTemplate, message->species, message->gender, face, message->isShiny, message->formNum, message->personality);

    monSpriteTemplatePtr = Pokepic_GetTemplate(opponentData->pokepic);
    *monSpriteTemplatePtr = monSpriteTemplate;

    Pokepic_ScheduleReloadFromNarc(opponentData->pokepic);
    sub_02014540(monSpriteTemplatePtr->narcID, monSpriteTemplatePtr->charDataID, HEAP_ID_BATTLE, ov12_0223BB94(ov12_0223A99C(battleSys), opponentData->battlerId), message->personality, FALSE, face, monSpriteTemplatePtr->species);

    ov12_0223BBA8(ov12_0223A99C(battleSys), opponentData->battlerId, monSpriteTemplatePtr->narcID);
    ov12_0223BBC0(ov12_0223A99C(battleSys), opponentData->battlerId, monSpriteTemplatePtr->palDataID);

    y = GetMonPicHeightBySpeciesGenderForm(message->species, message->gender, face, message->formNum, message->personality);
    ov12_0223BBD8(ov12_0223A99C(battleSys), opponentData->battlerId, y);

    y = ov07_02234B5C(opponentData->battlerType, 1) + y;
    Pokepic_SetAttr(opponentData->pokepic, 1, y);

    BattleController_EmitClearCommand(battleSys, opponentData->battlerId, message->command);
    ov12_02259928(opponentData);
}

static void BattleIOCmd_UpdateBg(BattleSystem *battleSys, OpponentData *opponentData) {
    BattleSystem_SetBackground(battleSys);
    BattleController_EmitClearCommand(battleSys, opponentData->battlerId, BATTLE_COMMAND_UPDATE_BG);
    ov12_02259928(opponentData);
}

static void BattleIOCmd_ClearTouchScreen(BattleSystem *battleSys, OpponentData *opponentData) {
    if (opponentData->unk196 == 0) {
        BattleInput *battleInput;
        int partner;
        BattleHpBar *hpBar;
        NARC *bgNarc = NARC_New(7, HEAP_ID_BATTLE);
        NARC *objNarc = NARC_New(8, HEAP_ID_BATTLE);
        battleInput = BattleSystem_GetBattleInput(battleSys);

        BattleInput_ChangeMenu(bgNarc, objNarc, battleInput, 0, 0, NULL);
        BattleInput_Deadstriped_022698AC(battleInput, 0);

        NARC_Delete(bgNarc);
        NARC_Delete(objNarc);

        partner = BattleSystem_GetBattlerIdPartner(battleSys, opponentData->battlerId);

        if (partner != opponentData->battlerId) {
            hpBar = BattleSystem_GetHpBar(battleSys, partner);
            ov12_02265D74(hpBar);
        }

        ov12_02264EB4(&opponentData->hpBar);
        BattleInput_DisableBallGauge(battleInput);
        ov12_02262014(opponentData);
    }

    BattleController_EmitClearCommand(battleSys, opponentData->battlerId, BATTLE_COMMAND_CLEAR_TOUCH_SCREEN);
    ov12_02259928(opponentData);
}

static void BattleIOCmd_ShowBattleStartPartyGauge(BattleSystem *battleSys, OpponentData *opponentData) {
    PartyGaugeData *data = (PartyGaugeData *)&opponentData->unk94[0];

    ov12_0225B0A0(battleSys, opponentData, data);
    ov12_02259928(opponentData);
}

static void BattleIOCmd_HideBattleStartPartyGauge(BattleSystem *battleSys, OpponentData *opponentData) {
    PartyGaugeData *data = (PartyGaugeData *)&opponentData->unk94[0];

    ov12_0225B0E8(battleSys, opponentData, data);
    ov12_02259928(opponentData);
}

static void BattleIOCmd_ShowPartyGauge(BattleSystem *battleSys, OpponentData *opponentData) {
    PartyGaugeData *data = (PartyGaugeData *)&opponentData->unk94[0];

    if (BattleSystem_GetFieldSide(battleSys, opponentData->battlerId)) {
        ov12_0225B120(battleSys, opponentData, data);
    } else {
        BattleController_EmitClearCommand(battleSys, opponentData->battlerId, BATTLE_COMMAND_SHOW_PARTY_GAUGE);
    }

    ov12_02259928(opponentData);
}

static void BattleIOCmd_HidePartyGauge(BattleSystem *battleSys, OpponentData *opponentData) {
    PartyGaugeData *data = (PartyGaugeData *)&opponentData->unk94[0];

    if (BattleSystem_GetFieldSide(battleSys, opponentData->battlerId)) {
        ov12_0225B16C(battleSys, opponentData, data);
    } else {
        BattleController_EmitClearCommand(battleSys, opponentData->battlerId, BATTLE_COMMAND_HIDE_PARTY_GAUGE);
    }

    ov12_02259928(opponentData);
}

static void BattleIOCmd_LoadPartyGaugeGraphics(BattleSystem *battleSys, OpponentData *opponentData) {
    SpriteSystem *spriteSys = BattleSystem_GetSpriteSystem(battleSys);
    SpriteManager *spriteMan = BattleSystem_GetSpriteManager(battleSys);
    PaletteData *paletteData = BattleSystem_GetPaletteData(battleSys);

    PartyGauge_LoadGraphics(spriteSys, spriteMan, paletteData);
    BattleController_EmitClearCommand(battleSys, opponentData->battlerId, BATTLE_COMMAND_LOAD_PARTY_GAUGE_GRAPHICS);
    ov12_02259928(opponentData);
}

static void BattleIOCmd_FreePartyGaugeGraphics(BattleSystem *battleSys, OpponentData *opponentData) {
    SpriteManager *spriteMan = BattleSystem_GetSpriteManager(battleSys);

    PartyGauge_FreeGraphics(spriteMan);
    BattleController_EmitClearCommand(battleSys, opponentData->battlerId, BATTLE_COMMAND_FREE_PARTY_GAUGE_GRAPHICS);
    ov12_02259928(opponentData);
}

static void BattleIOCmd_IncrementRecord(BattleSystem *battleSys, OpponentData *opponentData) {
    RecordIncrementMessage *message = (RecordIncrementMessage *)&opponentData->unk94[0];

    if (message->battlerType == BATTLER_TYPE_SOLO_PLAYER) {
        if (opponentData->unk196 == 0) {
            BattleSystem_GameStatIncrement(battleSys, message->record);
        }
    } else {
        if (opponentData->unk196 != 0) {
            BattleSystem_GameStatIncrement(battleSys, message->record);
        }
    }

    BattleController_EmitClearCommand(battleSys, opponentData->battlerId, message->command);
    ov12_02259928(opponentData);
}

static void BattleIOCmd_PrintLinkWaitMessage(BattleSystem *battleSys, OpponentData *opponentData) {
    LinkWaitMsgMessage *message = (LinkWaitMsgMessage *)&opponentData->unk94[0];

    ov12_0223BF14(battleSys, message->recordedInputCount, message->recordedInputs);
    ov12_0225B1A8(battleSys, opponentData);
    ov12_02259928(opponentData);
}

static void BattleIOCmd_RestoreSprite(BattleSystem *battleSys, OpponentData *opponentData) {
    MoveAnimation *moveAnim = (MoveAnimation *)&opponentData->unk94[0];

    ov12_0225B200(battleSys, opponentData, moveAnim);
    ov12_02259928(opponentData);
}

static void BattleIOCmd_SpriteToOAM(BattleSystem *battleSys, OpponentData *opponentData) {
    ov12_0225B234(battleSys, opponentData);
    ov12_02259928(opponentData);
}

static void BattleIOCmd_OAMToSprite(BattleSystem *battleSys, OpponentData *opponentData) {
    ov12_0225B26C(battleSys, opponentData);
    ov12_02259928(opponentData);
}

static void BattleIOCmd_PrintResultMessage(BattleSystem *battleSys, OpponentData *opponentData) {
    ov12_0225B2A4(battleSys, opponentData);
    ov12_02259928(opponentData);
}

static void BattleIOCmd_PrintEscapeMessage(BattleSystem *battleSys, OpponentData *opponentData) {
    EscapeMsgMessage *message = (EscapeMsgMessage *)&opponentData->unk94[0];

    ov12_0223BF14(battleSys, message->recordedInputCount, message->recordedInputs);
    ov12_0225B2F8(battleSys, opponentData, message);
    ov12_02259928(opponentData);
}

static void BattleIOCmd_PrintForfeitMessage(BattleSystem *battleSys, OpponentData *opponentData) {
    ForfeitMsgMessage *message = (ForfeitMsgMessage *)&opponentData->unk94[0];

    ov12_0223BF14(battleSys, message->recordedInputCount, message->recordedInputs);
    ov12_0225B34C(battleSys, opponentData);
    ov12_02259928(opponentData);
}

static void BattleIOCmd_RefreshSprite(BattleSystem *battleSys, OpponentData *opponentData) {
    MoveAnimation *moveAnim = (MoveAnimation *)&opponentData->unk94[0];

    ov12_0225B3A0(battleSys, opponentData, moveAnim);
    ov12_02259928(opponentData);
}

static void BattleIOCmd_FlyMoveHitSoundEffect(BattleSystem *battleSys, OpponentData *opponentData) {
    MoveHitSoundMessage *message = (MoveHitSoundMessage *)&opponentData->unk94[0];

    ov12_0225B3D4(battleSys, opponentData, message);
    ov12_02259928(opponentData);
}

static void BattleIOCmd_PlayMusic(BattleSystem *battleSys, OpponentData *opponentData) {
    MusicPlayMessage *message = (MusicPlayMessage *)&opponentData->unk94[0];

    ov12_0225B434(battleSys, opponentData, message);
    ov12_02259928(opponentData);
}

static void BattleIOCmd_SetBattleResult(BattleSystem *battleSys, OpponentData *opponentData) {
    ResultSubmitMessage *message = (ResultSubmitMessage *)&opponentData->unk94[0];
    Party *party;
    Pokemon *mon;
    int slot;
    int battler;
    int playerHP = 0;
    int enemyHP = 0;

    ov12_0223BF14(battleSys, message->recordedInputCount, message->recordedInputs);

    if (BattleSystem_GetBattleType(battleSys) & BATTLE_TYPE_FRONTIER) {
        BattleSystem_SetBattleOutcomeFlags(battleSys, message->resultMask);
    } else {
        for (battler = 0; battler < BattleSystem_GetMaxBattlers(battleSys); battler++) {
            party = BattleSystem_GetParty(battleSys, battler);

            for (slot = 0; slot < Party_GetCount(party); slot++) {
                mon = Party_GetMonByIndex(party, slot);

                if (GetMonData(mon, MON_DATA_SPECIES, NULL) && GetMonData(mon, MON_DATA_IS_EGG, NULL) == FALSE) {
                    if (BattleSystem_GetFieldSide(battleSys, battler)) {
                        enemyHP += GetMonData(mon, MON_DATA_HP, NULL);
                    } else {
                        playerHP += GetMonData(mon, MON_DATA_HP, NULL);
                    }
                }
            }
        }

        if (playerHP == 0 && enemyHP == 0) {
            BattleSystem_SetBattleOutcomeFlags(battleSys, BATTLE_RESULT_DRAW);
        } else if (playerHP == 0) {
            BattleSystem_SetBattleOutcomeFlags(battleSys, BATTLE_RESULT_LOSE);
        } else {
            BattleSystem_SetBattleOutcomeFlags(battleSys, BATTLE_RESULT_WIN);
        }
    }

    BattleController_EmitClearCommand(battleSys, opponentData->battlerId, message->command);
    ov12_02259928(opponentData);
}

static void BattleIOCmd_ClearMessageBox(BattleSystem *battleSys, OpponentData *opponentData) {
    Window *window = BattleSystem_GetWindow(battleSys, 0);

    FillWindowPixelBuffer(window, 0xFF);
    CopyWindowPixelsToVram_TextMode(window);

    BattleController_EmitClearCommand(battleSys, opponentData->battlerId, BATTLE_COMMAND_CLEAR_MESSAGE_BOX);
    ov12_02259928(opponentData);
}

static void ov12_02259928(OpponentData *opponentData) {
    opponentData->unk94[0] = 0;
}

static void BattleIOCmd_67(BattleSystem *battleSys, OpponentData *opponentData) {
    Message_022645C8 *message = (Message_022645C8 *)&opponentData->unk94[0];

    ov12_0225B454(battleSys, opponentData, message);
    ov12_02259928(opponentData);
}
