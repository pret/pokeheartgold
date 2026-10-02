#include "battle/battle_controller.h"
#include "battle/battle_message_structs.h"
#include "pokemon.h"

// static
void BattleController_SendLocalMessage(BattleSystem *battleSys, int recipient, int battler, void *message, u8 size) {
    int i;
    BattleMessageInfo info;
    u8 *src;
    u8 *dest;
    u16 *writeIndex;
    u16 *endIndex;

    if (recipient == 1) {
        dest = BattleSystem_GetClientMessage(battleSys);
        writeIndex = BattleSystem_GetClientWriteIndex(battleSys);
        endIndex = BattleSystem_GetClientEndIndex(battleSys);
    } else {
        dest = BattleSystem_GetServerMessage(battleSys);
        writeIndex = BattleSystem_GetServerWriteIndex(battleSys);
        endIndex = BattleSystem_GetServerEndIndex(battleSys);
    }

    if (writeIndex[0] + sizeof(BattleMessageInfo) + size + 1 > 0x1000) {
        endIndex[0] = writeIndex[0];
        writeIndex[0] = 0;
    }

    info.recipient = recipient;
    info.battler = battler;
    info.size = size;

    src = (u8 *)&info;

    for (i = 0; i < sizeof(BattleMessageInfo); i++) {
        dest[writeIndex[0]] = src[i];
        writeIndex[0]++;
    }

    src = (u8 *)message;

    for (i = 0; i < size; i++) {
        dest[writeIndex[0]] = src[i];
        writeIndex[0]++;
    }
}

//static 
BOOL BattleController_RecvMessage(BattleSystem *battleSys, void *message) {
    u8 *src = (u8 *)message;
    int i;
    BOOL success = FALSE;

    u8 recipient = src[0];
    u8 battler = src[1];
    int size = src[2] | (src[3] << 8);

    src += sizeof(BattleMessageInfo);

    if (recipient == 0) {
        if (battleSys->ctx->battleBuffer[battler][0] == 0) {
            for (i = 0; i < size; i++) {
                battleSys->ctx->battleBuffer[battler][i] = src[i];
            }

            success = TRUE;
        }
    } else if (recipient == 1) {
        if (battleSys->opponentData[battler]->unk94[0] == 0) {
            for (i = 0; i < size; i++) {
                battleSys->opponentData[battler]->unk94[i] = src[i];
            }

            success = TRUE;
        }
    } else if (recipient == 2) {
        int val = src[0];
        int id = src[1];

        if (BattleSystem_IsInitialized(battleSys)) {
            ov12_0224ED00(battleSys->ctx, id, battler, val);
        }

        success = TRUE;
    }

    return success;
}

void BattleSystem_TryRecvMessage(BattleSystem *battleSys, int recipient) {
    u8 *src;
    u16 *readIndex;
    u16 *writeIndex;
    u16 *endIndex;
    int size;

    if (recipient == 1) {
        src = BattleSystem_GetClientMessage(battleSys);
        readIndex = BattleSystem_GetClientReadIndex(battleSys);
        writeIndex = BattleSystem_GetClientWriteIndex(battleSys);
        endIndex = BattleSystem_GetClientEndIndex(battleSys);
    } else {
        src = BattleSystem_GetServerMessage(battleSys);
        readIndex = BattleSystem_GetServerReadIndex(battleSys);
        writeIndex = BattleSystem_GetServerWriteIndex(battleSys);
        endIndex = BattleSystem_GetServerEndIndex(battleSys);
    }

    if (readIndex[0] == writeIndex[0]) {
        return;
    }

    if (readIndex[0] == endIndex[0]) {
        readIndex[0] = 0;
        endIndex[0] = 0;
    }

    if (BattleController_RecvMessage(battleSys, (void *)&src[readIndex[0]]) == 1) {
        size = sizeof(BattleMessageInfo) + (src[readIndex[0] + 2] | (src[readIndex[0] + 3] << 8));
        readIndex[0] += size;
    }
}

//static 
void SendMessage(BattleSystem *battleSys, int recipient, int battler, void *message, u8 size)
{
    u8 *data = message;

    if (battleSys->battleType & BATTLE_TYPE_LINK && (battleSys->battleSpecial & BATTLE_TYPE_TAG) == FALSE) {
        if (recipient == 1) {
            for (int i = 0; i < sub_02037454(); i++) {
                ov12_0224ECC4(battleSys->ctx, i, battler, *data);
            }
        }

        sub_02074F9C(battleSys, recipient, battler, message, size);
    } else {
        if (recipient == 1) {
            ov12_0224ECC4(battleSys->ctx, 0, battler, *data);
        }

        BattleController_SendLocalMessage(battleSys, recipient, battler, message, size);
    }
}

void BattleController_EmitPlayEncounterAnimation(BattleSystem *battleSys, int battler)
{
    EncounterAnimationMessage message;

    message.command = CONTROLLER_COMMAND_START_ENCOUNTER;
    message.seed = BattleSystem_GetRandTemp(battleSys);

    SendMessage(battleSys, 1, battler, &message, sizeof(EncounterAnimationMessage));
}

void BattleController_EmitPokemonEncounter(BattleSystem *battleSys, int battler)
{
    MonEncounterMessage message;
    int i;

    message.command = CONTROLLER_COMMAND_TRAINER_MESSAGE;
    message.gender = battleSys->ctx->battleMons[battler].gender;
    message.isShiny = battleSys->ctx->battleMons[battler].shiny;
    message.species = battleSys->ctx->battleMons[battler].species;
    message.personality = battleSys->ctx->battleMons[battler].personality;
    message.cryModulation = ov12_02256748(battleSys->ctx, battler, ov12_0223AB0C(battleSys, battler), 1);
    message.formNum = battleSys->ctx->battleMons[battler].form;

    for (i = 0; i < 4; i++) {
        message.moves[i] = BattleMon_Get(battleSys->ctx, battler, BMON_DATA_MOVE1 + i, NULL);
        message.curPP[i] = BattleMon_Get(battleSys->ctx, battler, BMON_DATA_CUR_PP_1 + i, NULL);
        message.maxPP[i] = BattleMon_Get(battleSys->ctx, battler, BMON_DATA_MAX_PP_1 + i, NULL);
    }

    BattleMon_Get(battleSys->ctx, battler, BMON_DATA_NICKNAME, &message.nickname);
    SendMessage(battleSys, 1, battler, &message, sizeof(MonEncounterMessage));
}

void BattleController_EmitPokemonSlideIn(BattleSystem *battleSys, int battler)
{
    MonShowMessage message;
    int i;

    message.command = CONTROLLER_COMMAND_SEND_OUT;
    message.gender = battleSys->ctx->battleMons[battler].gender;
    message.isShiny = battleSys->ctx->battleMons[battler].shiny;
    message.species = battleSys->ctx->battleMons[battler].species;
    message.personality = battleSys->ctx->battleMons[battler].personality;
    message.cryModulation = ov12_02256748(battleSys->ctx, battler, ov12_0223AB0C(battleSys, battler), 1);
    message.selectedPartySlot = battleSys->ctx->selectedMonIndex[battler];
    message.formNum = battleSys->ctx->battleMons[battler].form;
    message.capturedBall = battleSys->ctx->battleMons[battler].ball;
    message.partnerPartySlot = battleSys->ctx->selectedMonIndex[BattleSystem_GetBattlerIdPartner(battleSys, battler)];

    ov12_0223B854(battleSys, battler, message.selectedPartySlot);

    for (i = 0; i < 4; i++) {
        message.moves[i] = BattleMon_Get(battleSys->ctx, battler, BMON_DATA_MOVE1 + i, NULL);
        message.curPP[i] = BattleMon_Get(battleSys->ctx, battler, BMON_DATA_CUR_PP_1 + i, NULL);
        message.maxPP[i] = BattleMon_Get(battleSys->ctx, battler, BMON_DATA_MAX_PP_1 + i, NULL);
    }

    BattleMon_Get(battleSys->ctx, battler, BMON_DATA_NICKNAME, &message.nickname);
    SendMessage(battleSys, 1, battler, &message, sizeof(MonShowMessage));
}

void BattleController_EmitPokemonSendOut(BattleSystem *battleSys, int battler, int capturedBall, int quickSendOut)
{
    MonShowMessage message;
    int i;

    message.command = CONTROLLER_COMMAND_SELECTION_SCREEN_INIT;

    if (battleSys->ctx->battleMons[battler].status2 & STATUS2_TRANSFORM) {
        message.gender = battleSys->ctx->battleMons[battler].unk88.transformGender;
        message.personality = battleSys->ctx->battleMons[battler].unk88.transformPersonality;
    } else {
        message.gender = battleSys->ctx->battleMons[battler].gender;
        message.personality = battleSys->ctx->battleMons[battler].personality;
    }

    message.isShiny = battleSys->ctx->battleMons[battler].shiny;
    message.species = battleSys->ctx->battleMons[battler].species;
    message.cryModulation = ov12_02256748(battleSys->ctx, battler, ov12_0223AB0C(battleSys, battler), 0);
    message.selectedPartySlot = battleSys->ctx->selectedMonIndex[battler];
    message.formNum = battleSys->ctx->battleMons[battler].form;

    if (capturedBall) {
        message.capturedBall = capturedBall;
    } else {
        message.capturedBall = battleSys->ctx->battleMons[battler].ball;
    }

    message.isQuickSendOut = quickSendOut;
    message.isSubstitute = (battleSys->ctx->battleMons[battler].status2 & STATUS2_SUBSTITUTE) != 0;

    ov12_0223B854(battleSys, battler, message.selectedPartySlot);

    for (i = 0; i < 4; i++) {
        message.moves[i] = BattleMon_Get(battleSys->ctx, battler, BMON_DATA_MOVE1 + i, NULL);
        message.curPP[i] = BattleMon_Get(battleSys->ctx, battler, BMON_DATA_CUR_PP_1 + i, NULL);
        message.maxPP[i] = BattleMon_Get(battleSys->ctx, battler, BMON_DATA_MAX_PP_1 + i, NULL);
    }

    BattleMon_Get(battleSys->ctx, battler, BMON_DATA_NICKNAME, &message.nickname);

    for (i = 0; i < 4; i++) {
        message.battleMonSpecies[i] = battleSys->ctx->battleMons[i].species;
        message.battleMonIsShiny[i] = battleSys->ctx->battleMons[i].shiny;
        message.battleMonFormNums[i] = battleSys->ctx->battleMons[i].form;

        if (battleSys->ctx->battleMons[i].status2 & STATUS2_TRANSFORM) {
            message.battleMonGenders[i] = battleSys->ctx->battleMons[i].unk88.transformGender;
            message.battleMonPersonalities[i] = battleSys->ctx->battleMons[i].unk88.transformPersonality;
        } else {
            message.battleMonGenders[i] = battleSys->ctx->battleMons[i].gender;
            message.battleMonPersonalities[i] = battleSys->ctx->battleMons[i].personality;
        }
    }

    SendMessage(battleSys, 1, battler, &message, sizeof(MonShowMessage));
}

void BattleController_EmitRecallPokemon(BattleSystem *battleSys, BattleContext *ctx, int battler)
{
    MonReturnMessage message;
    int face;
    int form;
    int i;

    if (battleSys->opponentData[battler]->battlerType & BATTLER_TYPE_SOLO_ENEMY) {
        face = 2;
    } else {
        face = 0;
    }

    form = battleSys->ctx->battleMons[battler].form;
    message.command = CONTROLLER_COMMAND_SELECTION_SCREEN_INPUT;

    if (battleSys->ctx->battleMons[battler].status2 & STATUS2_TRANSFORM) {
        message.yOffset = GetMonPicHeightBySpeciesGenderForm(battleSys->ctx->battleMons[battler].species, battleSys->ctx->battleMons[battler].unk88.transformGender, face, form, battleSys->ctx->battleMons[battler].unk88.transformPersonality);
    } else {
        message.yOffset = GetMonPicHeightBySpeciesGenderForm(battleSys->ctx->battleMons[battler].species, battleSys->ctx->battleMons[battler].gender, face, form, battleSys->ctx->battleMons[battler].personality);
    }

    message.capturedBall = battleSys->ctx->battleMons[battler].ball;
    message.isSubstitute = (battleSys->ctx->battleMons[battler].status2 & STATUS2_SUBSTITUTE) != 0;
    message.unk2C = battleSys->ctx->selectedMonIndex[battler];

    for (i = 0; i < 4; i++) {
        message.battleMonSpecies[i] = ctx->battleMons[i].species;
        message.battleMonIsShiny[i] = ctx->battleMons[i].shiny;
        message.battleMonFormNums[i] = ctx->battleMons[i].form;

        if (ctx->battleMons[i].status2 & STATUS2_TRANSFORM) {
            message.battleMonGenders[i] = ctx->battleMons[i].unk88.transformGender;
            message.battleMonPersonalities[i] = ctx->battleMons[i].unk88.transformPersonality;
        } else {
            message.battleMonGenders[i] = ctx->battleMons[i].gender;
            message.battleMonPersonalities[i] = ctx->battleMons[i].personality;
        }
    }

    SendMessage(battleSys, 1, battler, &message, sizeof(MonReturnMessage));
}

void ov12_022628A0(BattleSystem *battleSys, int battler, int ball)
{
    OpenCaptureBallMessage message;
    int face;
    int form;

    if (battleSys->opponentData[battler]->battlerType & BATTLER_TYPE_SOLO_ENEMY) {
        face = 2;
    } else {
        face = 0;
    }

    form = battleSys->ctx->battleMons[battler].form;
    message.command = CONTROLLER_COMMAND_CALC_EXECUTION_ORDER;

    if (battleSys->ctx->battleMons[battler].status2 & STATUS2_TRANSFORM) {
        message.yOffset = GetMonPicHeightBySpeciesGenderForm(battleSys->ctx->battleMons[battler].species, battleSys->ctx->battleMons[battler].unk88.transformGender, face, form, battleSys->ctx->battleMons[battler].unk88.transformPersonality);
    } else {
        message.yOffset = GetMonPicHeightBySpeciesGenderForm(battleSys->ctx->battleMons[battler].species, battleSys->ctx->battleMons[battler].gender, face, form, battleSys->ctx->battleMons[battler].personality);
    }

    message.ball = ball;
    SendMessage(battleSys, 1, battler, &message, sizeof(OpenCaptureBallMessage));
}

void BattleController_EmitDeletePokemon(BattleSystem *battleSys, int battler)
{
    int command = 7;
    SendMessage(battleSys, 1, battler, &command, sizeof(int));
}

void BattleController_EmitTrainerEncounter(BattleSystem *battleSys, int battler)
{
    TrainerEncounterMessage message;

    message.command = 8;
    message.trainerType = battleSys->trainers[battler].data.trainerClass;
    message.trainerGender = battleSys->trainerGender[battler];

    SendMessage(battleSys, 1, battler, &message, sizeof(TrainerEncounterMessage));
}

void BattleController_EmitThrowPokeball(BattleSystem *battleSys, int battler, int ballTypeIn)
{
    TrainerThrowBallMessage message;

    message.command = 9;
    message.ballTypeIn = ballTypeIn;
    message.selectedPartySlot = battleSys->ctx->selectedMonIndex[BattleSystem_GetBattlerIdPartner(battleSys, battler)];

    SendMessage(battleSys, 1, battler, &message, sizeof(TrainerThrowBallMessage));
}

void BattleController_EmitTrainerSlideOut(BattleSystem *battleSys, int battler)
{
    int command = 10;

    SendMessage(battleSys, 1, battler, &command, sizeof(int));
}

void BattleController_EmitTrainerSlideIn(BattleSystem *battleSys, int battler, int posIn)
{
    TrainerSlideInMessage message;

    message.command = 11;
    message.trainerType = battleSys->trainers[battler].data.trainerClass;
    message.trainerGender = battleSys->trainerGender[battler];
    message.posIn = posIn;

    SendMessage(battleSys, 1, battler, &message, sizeof(TrainerSlideInMessage));
}

void BattleController_EmitHealthbarSlideIn(BattleSystem *battleSys, BattleContext *ctx, int battler, int delay)
{
    HealthBoxData healthboxData;

    Pokemon *mon = BattleSystem_GetPartyMon(battleSys, battler, ctx->selectedMonIndex[battler]);
    int species = GetMonData(mon, MON_DATA_SPECIES, NULL);
    int level = GetMonData(mon, MON_DATA_LEVEL, NULL);

    healthboxData.command = 12;
    healthboxData.level = ctx->battleMons[battler].level;
    healthboxData.curHP = ctx->battleMons[battler].hp;
    healthboxData.maxHP = ctx->battleMons[battler].maxHp;
    healthboxData.selectedPartySlot = ctx->selectedMonIndex[battler];
    healthboxData.status = Battler_GetStatusCondition(ctx, battler);

    if ((ctx->battleMons[battler].species == SPECIES_NIDORAN_F || ctx->battleMons[battler].species == SPECIES_NIDORAN_M)
        && ctx->battleMons[battler].hasNickname == FALSE) {
        healthboxData.gender = 2; // don't show the Gender marker for base-Nidoran forms
    } else {
        healthboxData.gender = ctx->battleMons[battler].gender;
    }

    healthboxData.expFromLastLevel = ctx->battleMons[battler].exp - GetMonExpBySpeciesAndLevel(species, level);
    healthboxData.expToNextLevel = GetMonExpBySpeciesAndLevel(species, level + 1) - GetMonExpBySpeciesAndLevel(species, level);
    healthboxData.speciesCaught = BattleSystem_CheckMonCaught(battleSys, ctx->battleMons[battler].species);
    healthboxData.numSafariBalls = BattleSystem_GetSafariBallCount(battleSys);
    healthboxData.delay = delay;

    SendMessage(battleSys, 1, battler, &healthboxData, sizeof(HealthBoxData));
}

void BattleController_EmitHealthbarSlideOut(BattleSystem *battleSys, int battler)
{
    int command = 13;
    SendMessage(battleSys, 1, battler, &command, sizeof(int));
}

void ov12_02262B80(BattleSystem *battleSys, BattleContext *ctx, int battler, int partySlot)
{
    CommandSetMessage message;
    int i;
    int battlerType;
    int monSpeciesOrEgg;
    int cnt;
    Party *party;
    Pokemon *pokemon;
    u32 battleType;
    int battlersCanPickCommandMask;

    MI_CpuClearFast(&message, sizeof(CommandSetMessage));
    BattleBuffer_Clear(BattleSystem_GetBattleContext(battleSys), battler);

    battlersCanPickCommandMask = 0;

    for (i = 0; i < BattleSystem_GetMaxBattlers(battleSys); i++) {
        if (Battler_CanSelectAction(ctx, i) == 0) {
            battlersCanPickCommandMask |= MaskOfFlagNo(i);
        }
    }

    message.command = 14;
    message.partySlot = partySlot;
    message.switchingOrCanPickCommandMask = ctx->switchInFlag | battlersCanPickCommandMask;

    battleType = BattleSystem_GetBattleType(battleSys);

    if ((battleType & BATTLE_TYPE_DOUBLES) && ((battleType & BATTLE_TYPE_MULTI) == FALSE)) {
        battlerType = battler & 1;
    } else {
        battlerType = battler;
    }

    party = BattleSystem_GetParty(battleSys, battlerType);
    cnt = 0;

    for (i = 0; i < Party_GetCount(party); i++) {
        pokemon = Party_GetMonByIndex(party, ctx->unk_312C[battlerType][i]);
        monSpeciesOrEgg = GetMonData(pokemon, MON_DATA_SPECIES_OR_EGG, NULL);

        if (monSpeciesOrEgg && monSpeciesOrEgg != SPECIES_EGG) {
            if (GetMonData(pokemon, MON_DATA_HP, NULL)) {
                if (GetMonData(pokemon, MON_DATA_STATUS, NULL)) {
                    message.ballStatus[0][cnt] = 3;
                } else {
                    message.ballStatus[0][cnt] = 1;
                }
            } else {
                message.ballStatus[0][cnt] = 2;
            }

            if (battleType & (BATTLE_TYPE_LINK | BATTLE_TYPE_SAFARI | BATTLE_TYPE_FRONTIER | BATTLE_TYPE_PAL_PARK)) {
                message.expPercents[cnt] = 0;
            } else {
                message.expPercents[cnt] = Pokemon_GetPercentToNextLevel(pokemon);
            }

            cnt++;
        }
    }

    if (((battleType & (BATTLE_TYPE_LINK | BATTLE_TYPE_MULTI)) == (BATTLE_TYPE_LINK | BATTLE_TYPE_MULTI))
        || (battleType & BATTLE_TYPE_TAG)
        || (battleType == (BATTLE_TYPE_TRAINER | BATTLE_TYPE_DOUBLES | BATTLE_TYPE_MULTI | BATTLE_TYPE_AI))
        || (battleType == ((BATTLE_TYPE_TRAINER | BATTLE_TYPE_DOUBLES | BATTLE_TYPE_MULTI | BATTLE_TYPE_AI) | BATTLE_TYPE_FRONTIER))) {
        if (BattleSystem_GetFieldSide(battleSys, battler)) {
            battlerType = BattleSystem_GetBattlerFromBattlerType(battleSys, BATTLER_TYPE_PLAYER_SIDE_SLOT_1);
        } else {
            battlerType = BattleSystem_GetBattlerFromBattlerType(battleSys, BATTLER_TYPE_ENEMY_SIDE_SLOT_1);
        }

        party = BattleSystem_GetParty(battleSys, battlerType);
        cnt = 0;

        for (i = 0; i < Party_GetCount(party); i++) {
            pokemon = Party_GetMonByIndex(party, ctx->unk_312C[battlerType][i]);
            monSpeciesOrEgg = GetMonData(pokemon, MON_DATA_SPECIES_OR_EGG, NULL);

            if (monSpeciesOrEgg && monSpeciesOrEgg != SPECIES_EGG) {
                if (GetMonData(pokemon, MON_DATA_HP, NULL)) {
                    if (GetMonData(pokemon, MON_DATA_STATUS, NULL)) {
                        message.ballStatus[1][cnt] = 3;
                    } else {
                        message.ballStatus[1][cnt] = 1;
                    }
                } else {
                    message.ballStatus[1][cnt] = 2;
                }

                cnt++;
            }
        }

        if (BattleSystem_GetFieldSide(battleSys, battler)) {
            battlerType = BattleSystem_GetBattlerFromBattlerType(battleSys, BATTLER_TYPE_PLAYER_SIDE_SLOT_2);
        } else {
            battlerType = BattleSystem_GetBattlerFromBattlerType(battleSys, BATTLER_TYPE_ENEMY_SIDE_SLOT_2);
        }

        party = BattleSystem_GetParty(battleSys, battlerType);
        cnt = 3;

        for (i = 0; i < Party_GetCount(party); i++) {
            pokemon = Party_GetMonByIndex(party, ctx->unk_312C[battlerType][i]);
            monSpeciesOrEgg = GetMonData(pokemon, MON_DATA_SPECIES_OR_EGG, NULL);

            if (monSpeciesOrEgg && monSpeciesOrEgg != SPECIES_EGG) {
                if (GetMonData(pokemon, MON_DATA_HP, NULL)) {
                    if (GetMonData(pokemon, MON_DATA_STATUS, NULL)) {
                        message.ballStatus[1][cnt] = 3;
                    } else {
                        message.ballStatus[1][cnt] = 1;
                    }
                } else {
                    message.ballStatus[1][cnt] = 2;
                }

                cnt++;
            }
        }
    } else {
        battlerType = ov12_0223ABB8(battleSys, battler, 2);
        party = BattleSystem_GetParty(battleSys, battlerType);
        cnt = 0;

        for (i = 0; i < Party_GetCount(party); i++) {
            pokemon = Party_GetMonByIndex(party, ctx->unk_312C[battlerType][i]);
            monSpeciesOrEgg = GetMonData(pokemon, MON_DATA_SPECIES_OR_EGG, NULL);

            if (monSpeciesOrEgg && monSpeciesOrEgg != SPECIES_EGG) {
                if (GetMonData(pokemon, MON_DATA_HP, NULL)) {
                    if (GetMonData(pokemon, MON_DATA_STATUS, NULL)) {
                        message.ballStatus[1][cnt] = 3;
                    } else {
                        message.ballStatus[1][cnt] = 1;
                    }
                } else {
                    message.ballStatus[1][cnt] = 2;
                }

                cnt++;
            }
        }
    }

    for (i = 0; i < 4; i++) {
        message.moves[i] = BattleMon_Get(ctx, battler, BMON_DATA_MOVE1 + i, NULL);
        message.curPP[i] = BattleMon_Get(ctx, battler, BMON_DATA_CUR_PP_1 + i, NULL);
        message.maxPP[i] = BattleMon_Get(ctx, battler, BMON_DATA_MAX_PP_1 + i, NULL);
    }

    message.curHP = ctx->battleMons[battler].hp;
    message.maxHP = ctx->battleMons[battler].maxHp;

    if (message.curHP) {
        if (ctx->battleMons[battler].status) {
            message.ballStatusBattler = 3;
        } else {
            message.ballStatusBattler = 1;
        }
    } else {
        message.ballStatusBattler = 2;
    }

    SendMessage(battleSys, 1, battler, &message, sizeof(CommandSetMessage));
}

void ov12_02262F24(BattleSystem *battleSys, int battler, int command)
{
    SendMessage(battleSys, 0, battler, &command, sizeof(int));
}

void ov12_02262F40(BattleSystem *battleSys, BattleContext *ctx, int battler)
{
    BattleBuffer_Clear(BattleSystem_GetBattleContext(battleSys), battler);

    MoveSelectMenuMessage message;
    message.command = 15;
    message.partySlot = ctx->selectedMonIndex[battler];

    for (int i = 0; i < 4; i++) {
        message.moves[i] = ctx->battleMons[battler].moves[i];
        message.ppCur[i] = ctx->battleMons[battler].movePPCur[i];
        message.ppMax[i] = GetMoveMaxPP(ctx->battleMons[battler].moves[i], ctx->battleMons[battler].movePP[i]);
    }

    message.invalidMoves = StruggleCheck(battleSys, ctx, battler, 0, -1);

    SendMessage(battleSys, 1, battler, &message, sizeof(MoveSelectMenuMessage));
}

void ov12_02262FE0(BattleSystem *battleSys, int battler, int command)
{
    SendMessage(battleSys, 0, battler, &command, sizeof(int));
}

void ov12_02262FFC(BattleSystem *battleSys, BattleContext *ctx, int range, int battler)
{
    TargetSelectMenuMessage message;
    int i;
    u32 battleType;

    BattleBuffer_Clear(ctx, battler);

    battleType = BattleSystem_GetBattleType(battleSys);

    message.command = 16;
    message.range = range;

    if ((battleType & BATTLE_TYPE_DOUBLES) == FALSE || (battleType & BATTLE_TYPE_MULTI) || ((battleType & BATTLE_TYPE_DOUBLES) && battler >= 2)) {
        message.shouldHidePanel = 1;
    } else {
        message.shouldHidePanel = 0;
    }

    for (i = 0; i < 4; i++) {
        if (ctx->battleMons[i].hp) {
            message.targetMon[i].hp = ctx->battleMons[i].hp;
            message.targetMon[i].hpMax = ctx->battleMons[i].maxHp;
            message.targetMon[i].hide = 1;

            if ((ctx->battleMons[i].species == SPECIES_NIDORAN_F || ctx->battleMons[i].species == SPECIES_NIDORAN_M)
                && ctx->battleMons[i].hasNickname == FALSE) {
                message.targetMon[i].gender = 2;
            } else {
                message.targetMon[i].gender = ctx->battleMons[i].gender;
            }

            message.targetMon[i].selectedMon = ctx->selectedMonIndex[i];

            if (ctx->battleMons[i].status) {
                message.targetMon[i].status = 3;
            } else {
                message.targetMon[i].status = 1;
            }
        } else {
            message.targetMon[i].hide = 0;
            message.targetMon[i].status = 2;
        }
    }

    SendMessage(battleSys, 1, battler, &message, sizeof(TargetSelectMenuMessage));
}

void ov12_0226311C(BattleSystem *battleSys, int battler, int command)
{
    SendMessage(battleSys, 0, battler, &command, sizeof(int));
}

void ov12_02263138(BattleSystem *battleSys, BattleContext *ctx, int battler)
{
    BagMenuMessage message;
    int i, j;

    BattleBuffer_Clear(ctx, battler);

    message.command = 17;

    for (i = 0; i < 4; i++) {
        message.partySlots[i] = ctx->selectedMonIndex[i];

        for (j = 0; j < 6; j++) {
            message.partyOrder[i][j] = ctx->unk_312C[i][j];
        }

        message.embargoTurns[i] = ctx->battleMons[i].unk88.embargoFlag;
    }

    if (BattleSystem_GetBattleType(battleSys) == (BATTLE_TYPE_DOUBLES | BATTLE_TYPE_MULTI | BATTLE_TYPE_AI)) {
        if ((ctx->switchInFlag & MaskOfFlagNo(1)) == 0 && (ctx->switchInFlag & MaskOfFlagNo(3)) == 0) {
            message.hasTwoOpponents = TRUE;
            message.semiInvulnerable = FALSE;
            message.substitute = FALSE;
        } else if ((ctx->switchInFlag & MaskOfFlagNo(1)) == 0) {
            message.hasTwoOpponents = FALSE;

            if (ctx->battleMons[1].moveEffectFlags & MOVE_EFFECT_FLAG_SEMI_INVULNERABLE) {
                message.semiInvulnerable = TRUE;
                message.substitute = FALSE;
            } else if (ctx->battleMons[1].status2 & STATUS2_SUBSTITUTE) {
                message.semiInvulnerable = FALSE;
                message.substitute = TRUE;
            } else {
                message.semiInvulnerable = FALSE;
                message.substitute = FALSE;
            }
        } else {
            message.hasTwoOpponents = FALSE;

            if (ctx->battleMons[3].moveEffectFlags & MOVE_EFFECT_FLAG_SEMI_INVULNERABLE) {
                message.semiInvulnerable = TRUE;
                message.substitute = FALSE;
            } else if (ctx->battleMons[3].status2 & STATUS2_SUBSTITUTE) {
                message.semiInvulnerable = FALSE;
                message.substitute = TRUE;
            } else {
                message.semiInvulnerable = FALSE;
                message.substitute = FALSE;
            }
        }
    } else if (BattleSystem_GetBattleType(battleSys) == BATTLE_TYPE_NONE) { 
        message.hasTwoOpponents = FALSE;

        if (ctx->battleMons[1].moveEffectFlags & MOVE_EFFECT_FLAG_SEMI_INVULNERABLE) {
            message.semiInvulnerable = TRUE;
            message.substitute = FALSE;
        } else if (ctx->battleMons[1].status2 & STATUS2_SUBSTITUTE) {
            message.semiInvulnerable = FALSE;
            message.substitute = TRUE;
        } else {
            message.semiInvulnerable = FALSE;
            message.substitute = FALSE;
        }
    } else {
        message.hasTwoOpponents = FALSE;
        message.semiInvulnerable = FALSE;
        message.substitute = FALSE;
    }

    SendMessage(battleSys, 1, battler, &message, sizeof(BagMenuMessage));
}

void ov12_022632C0(BattleSystem *battleSys, int battler, BattleItemUse message)
{
    SendMessage(battleSys, 0, battler, &message, sizeof(BattleItemUse));
}

void BattleController_EmitShowMonList(BattleSystem *battleSys, BattleContext *ctx, int battler, int listMode, int canSwitch, int doublesSelection)
{
    PartyMenuMessage message;
    int i, j;

    BattleBuffer_Clear(ctx, battler);

    message.command = 18;
    message.battler = battler;
    message.listMode = listMode;
    message.canSwitch = canSwitch;
    message.doublesSelection = doublesSelection;
    message.battlersSwitchingMask = ctx->switchInFlag;

    for (i = 0; i < 4; i++) {
        message.selectedPartySlot[i] = ctx->selectedMonIndex[i];

        for (j = 0; j < 6; j++) {
            message.partyOrder[i][j] = ctx->unk_312C[i][j];
        }
    }

    SendMessage(battleSys, 1, battler, &message, sizeof(PartyMenuMessage));
}

void ov12_02263360(BattleSystem *battleSys, int battler, int command)
{
    SendMessage(battleSys, 0, battler, &command, sizeof(int));
}

void BattleController_EmitDrawYesNoBox(BattleSystem *battleSys, BattleContext *ctx, int battler, int promptMsg, int yesNoType, int move, int nickname)
{
    YesNoMenuMessage message;

    BattleBuffer_Clear(ctx, battler);

    message.command = 19;
    message.promptMsg = promptMsg;
    message.yesNoType = yesNoType;
    message.move = move;
    message.nickname = nickname;

    SendMessage(battleSys, 1, battler, &message, sizeof(YesNoMenuMessage));
}

void BattleController_EmitPrintAttackMessage(BattleSystem *battleSys, BattleContext *ctx)
{
    AttackMsgMessage message;

    message.command = 20;
    message.partySlot = ctx->selectedMonIndex[ctx->battlerIdAttacker];
    message.move = ctx->moveNoCur;

    SendMessage(battleSys, 1, ctx->battlerIdAttacker, &message, sizeof(AttackMsgMessage));
}

void BattleController_EmitPrintMessage(BattleSystem *battleSys, BattleContext *ctx, BattleMessage *battleMsg)
{
    battleMsg->unk0 = 21;
    SendMessage(battleSys, 1, ctx->battlerIdAttacker, battleMsg, sizeof(BattleMessage));
}

void BattleController_SetMoveAnimation(BattleSystem *battleSys, BattleContext *ctx, u16 move)
{
    MoveAnimation animation;

    ov12_022643C8(battleSys, ctx, &animation, 0, NULL, ctx->battlerIdAttacker, ctx->battlerIdTarget, move);
    SendMessage(battleSys, 1, ctx->battlerIdAttacker, &animation, sizeof(MoveAnimation));
}

void ov12_0226343C(BattleSystem *battleSys, BattleContext *ctx, u16 move, int attacker, int defender)
{
    MoveAnimation animation;

    ov12_022643C8(battleSys, ctx, &animation, 0, NULL, attacker, defender, move);
    SendMessage(battleSys, 1, attacker, &animation, sizeof(MoveAnimation));
}

void BattleController_EmitMonFlicker(BattleSystem *battleSys, int battler, u32 unused)
{
    int command = 23;
    SendMessage(battleSys, 1, battler, &command, sizeof(int));
}

void BattleController_EmitHealthbarUpdate(BattleSystem *battleSys, BattleContext *ctx, int battler)
{
    HPGaugeUpdateMessage message;
    Pokemon *pokemon = BattleSystem_GetPartyMon(battleSys, battler, ctx->selectedMonIndex[battler]);
    int species = GetMonData(pokemon, MON_DATA_SPECIES, NULL);
    int level = GetMonData(pokemon, MON_DATA_LEVEL, NULL);

    message.command = 24;
    message.level = ctx->battleMons[battler].level;
    message.curHP = ctx->battleMons[battler].hp;
    message.maxHP = ctx->battleMons[battler].maxHp;
    message.hpCalcTemp = ctx->hpCalc;

    if ((ctx->battleMons[battler].species == SPECIES_NIDORAN_F || ctx->battleMons[battler].species == SPECIES_NIDORAN_M)
        && ctx->battleMons[battler].hasNickname == FALSE) {
        message.gender = 2;
    } else {
        message.gender = ctx->battleMons[battler].gender;
    }

    message.exp = ctx->battleMons[battler].exp - GetMonExpBySpeciesAndLevel(species, level);
    message.expToNextLevel = GetMonExpBySpeciesAndLevel(species, level + 1) - GetMonExpBySpeciesAndLevel(species, level);

    SendMessage(battleSys, 1, battler, &message, sizeof(HPGaugeUpdateMessage));
}

void ov12_02263564(BattleSystem *battleSys, BattleContext *ctx, int battler, int curExp)
{
    ExpGaugeUpdateMessage message;
    Pokemon *pokemon = BattleSystem_GetPartyMon(battleSys, battler, ctx->selectedMonIndex[battler]);
    int species = GetMonData(pokemon, MON_DATA_SPECIES, NULL);
    int level = GetMonData(pokemon, MON_DATA_LEVEL, NULL);

    message.command = 25;
    message.curExp = curExp;
    message.gainedExp = ctx->battleMons[battler].exp - GetMonExpBySpeciesAndLevel(species, level);
    message.expToNextLevel = GetMonExpBySpeciesAndLevel(species, level + 1) - GetMonExpBySpeciesAndLevel(species, level);

    SendMessage(battleSys, 1, battler, &message, sizeof(ExpGaugeUpdateMessage));
}

void BattleController_EmitPlayFaintAnimation(BattleSystem *battleSys, BattleContext *ctx, int battler)
{
    FaintingSequenceMessage message;
    int i;

    message.command = 26;
    message.species = ctx->battleMons[battler].species;
    message.form = ctx->battleMons[battler].form;
    message.isSubstitute = (ctx->battleMons[battler].status2 & STATUS2_SUBSTITUTE) != 0;
    message.isTransformed = (ctx->battleMons[battler].status2 & STATUS2_TRANSFORM) != 0;

    if (ctx->battleMons[battler].status2 & STATUS2_TRANSFORM) {
        message.gender = ctx->battleMons[battler].unk88.transformGender;
        message.personality = ctx->battleMons[battler].unk88.transformPersonality;
    } else {
        message.gender = ctx->battleMons[battler].gender;
        message.personality = ctx->battleMons[battler].personality;
    }

    for (i = 0; i < 4; i++) {
        message.monSpecies[i] = ctx->battleMons[i].species;
        message.monShiny[i] = ctx->battleMons[i].shiny;
        message.monFormNums[i] = ctx->battleMons[i].form;

        if (ctx->battleMons[i].status2 & STATUS2_TRANSFORM) {
            message.monGenders[i] = ctx->battleMons[i].unk88.transformGender;
            message.monPersonalities[i] = ctx->battleMons[i].unk88.transformPersonality;
        } else {
            message.monGenders[i] = ctx->battleMons[i].gender;
            message.monPersonalities[i] = ctx->battleMons[i].personality;
        }
    }

    SendMessage(battleSys, 1, battler, &message, sizeof(FaintingSequenceMessage));
}

void BattleController_EmitPlaySE(BattleSystem *battleSys, BattleContext *ctx, int sdatID, int battler)
{
    PlaySoundMessage message;

    message.command = 27;
    message.sdatID = sdatID;

    SendMessage(battleSys, 1, battler, &message, sizeof(PlaySoundMessage));
}

void BattleController_EmitFadeOutBattle(BattleSystem *battleSys, BattleContext *ctx)
{
    int command = 28;

    SendMessage(battleSys, 1, 0, &command, sizeof(int));
}

void BattleController_EmitToggleVanish(BattleSystem *battleSys, int battler, int toggle)
{
    ToggleVanishMessage message;
    int i;

    message.command = 29;
    message.toggle = toggle;
    message.isSubstitute = (battleSys->ctx->battleMons[battler].status2 & STATUS2_SUBSTITUTE) != 0;

    for (i = 0; i < 4; i++) {
        message.species[i] = battleSys->ctx->battleMons[i].species;
        message.isShiny[i] = battleSys->ctx->battleMons[i].shiny;
        message.formNum[i] = battleSys->ctx->battleMons[i].form;

        if (battleSys->ctx->battleMons[i].status2 & STATUS2_TRANSFORM) {
            message.gender[i] = battleSys->ctx->battleMons[i].unk88.transformGender;
            message.personality[i] = battleSys->ctx->battleMons[i].unk88.transformPersonality;
        } else {
            message.gender[i] = battleSys->ctx->battleMons[i].gender;
            message.personality[i] = battleSys->ctx->battleMons[i].personality;
        }
    }

    SendMessage(battleSys, 1, battler, &message, sizeof(ToggleVanishMessage));
}

void BattleController_EmitHealthbarStatus(BattleSystem *battleSys, int battler, int status)
{
    SetStatusIconMessage message;

    message.command = 30;
    message.status = status;

    SendMessage(battleSys, 1, battler, &message, sizeof(SetStatusIconMessage));
}

void BattleController_EmitPrintTrainerMessage(BattleSystem *battleSys, int battler, int msg)
{
    TrainerMsgMessage message;

    message.command = 31;
    message.msg = msg;

    SendMessage(battleSys, 1, battler, &message, sizeof(TrainerMsgMessage));
}

void BattleController_EmitSetStatus2Effect(BattleSystem *battleSys, BattleContext *ctx, int battler, int secondaryAnimID)
{
    MoveAnimation animation;

    ov12_022643C8(battleSys, ctx, &animation, 1, secondaryAnimID, battler, battler, NULL);
    SendMessage(battleSys, 1, battler, &animation, sizeof(MoveAnimation));
}

void BattleController_EmitCopyStatus2Effect(BattleSystem *battleSys, BattleContext *ctx, int attacker, int defender, int secondaryAnimID)
{
    MoveAnimation animation;

    ov12_022643C8(battleSys, ctx, &animation, 1, secondaryAnimID, attacker, defender, NULL);
    SendMessage(battleSys, 1, attacker, &animation, sizeof(MoveAnimation));
}

void BattleController_EmitPrintReturnMessage(BattleSystem *battleSys, BattleContext *ctx, int battler, int partySlot)
{
    RecallMsgMessage message;

    message.command = 32;
    message.partySlot = partySlot;
    message.hpPercent = (ctx->hpTemp - ctx->battleMons[1].hp) * 100 / ctx->hpTemp;

    SendMessage(battleSys, 1, battler, &message, sizeof(RecallMsgMessage));
}
