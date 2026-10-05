#include "battle/battle_controller.h"

#include "constants/abilities.h"

#include "battle/battle_message_structs.h"
#include "battle/party_gauge.h"

#include "pokemon.h"

static void PartyGaugeData_New(BattleSystem *battleSys, BattleContext *ctx, PartyGaugeData *partyGauge, int command, int battler);

static void BattleController_SendLocalMessage(BattleSystem *battleSys, int recipient, int battler, void *message, u8 size) {
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

static BOOL BattleController_RecvMessage(BattleSystem *battleSys, void *message) {
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

static void SendMessage(BattleSystem *battleSys, int recipient, int battler, void *message, u8 size) {
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

void BattleController_EmitSetupBattleUI(BattleSystem *battleSys, int battler) {
    EncounterAnimationMessage message;

    message.command = BATTLE_COMMAND_SETUP_UI;
    message.seed = BattleSystem_GetRandTemp(battleSys);

    SendMessage(battleSys, 1, battler, &message, sizeof(EncounterAnimationMessage));
}

void BattleController_EmitSetEncounter(BattleSystem *battleSys, int battler) {
    MonEncounterMessage message;
    int i;

    message.command = BATTLE_COMMAND_SET_ENCOUNTER;
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

void BattleController_EmitShowEncounter(BattleSystem *battleSys, int battler) {
    MonShowMessage message;
    int i;

    message.command = BATTLE_COMMAND_SHOW_ENCOUNTER;
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

void BattleController_EmitShowPokemon(BattleSystem *battleSys, int battler, int capturedBall, int quickSendOut) {
    MonShowMessage message;
    int i;

    message.command = BATTLE_COMMAND_SHOW_POKEMON;

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

void BattleController_EmitReturnPokemon(BattleSystem *battleSys, BattleContext *ctx, int battler) {
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
    message.command = BATTLE_COMMAND_RETURN_POKEMON;

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

void BattleController_EmitOpenCaptureBall(BattleSystem *battleSys, int battler, int ball) {
    OpenCaptureBallMessage message;
    int face;
    int form;

    if (battleSys->opponentData[battler]->battlerType & BATTLER_TYPE_SOLO_ENEMY) {
        face = 2;
    } else {
        face = 0;
    }

    form = battleSys->ctx->battleMons[battler].form;
    message.command = BATTLE_COMMAND_OPEN_CAPTURE_BALL;

    if (battleSys->ctx->battleMons[battler].status2 & STATUS2_TRANSFORM) {
        message.yOffset = GetMonPicHeightBySpeciesGenderForm(battleSys->ctx->battleMons[battler].species, battleSys->ctx->battleMons[battler].unk88.transformGender, face, form, battleSys->ctx->battleMons[battler].unk88.transformPersonality);
    } else {
        message.yOffset = GetMonPicHeightBySpeciesGenderForm(battleSys->ctx->battleMons[battler].species, battleSys->ctx->battleMons[battler].gender, face, form, battleSys->ctx->battleMons[battler].personality);
    }

    message.ball = ball;
    SendMessage(battleSys, 1, battler, &message, sizeof(OpenCaptureBallMessage));
}

void BattleController_EmitDeletePokemon(BattleSystem *battleSys, int battler) {
    int command = BATTLE_COMMAND_DELETE_POKEMON;
    SendMessage(battleSys, 1, battler, &command, sizeof(int));
}

void BattleController_EmitSetTrainerEncounter(BattleSystem *battleSys, int battler) {
    TrainerEncounterMessage message;

    message.command = BATTLE_COMMAND_SET_TRAINER_ENCOUNTER;
    message.trainerType = battleSys->trainers[battler].data.trainerClass;
    message.trainerGender = battleSys->trainerGender[battler];

    SendMessage(battleSys, 1, battler, &message, sizeof(TrainerEncounterMessage));
}

void BattleController_EmitTrainerThrowBall(BattleSystem *battleSys, int battler, int ballTypeIn) {
    TrainerThrowBallMessage message;

    message.command = BATTLE_COMMAND_THROW_TRAINER_BALL;
    message.ballTypeIn = ballTypeIn;
    message.selectedPartySlot = battleSys->ctx->selectedMonIndex[BattleSystem_GetBattlerIdPartner(battleSys, battler)];

    SendMessage(battleSys, 1, battler, &message, sizeof(TrainerThrowBallMessage));
}

void BattleController_EmitTrainerSlideOut(BattleSystem *battleSys, int battler) {
    int command = BATTLE_COMMAND_SLIDE_TRAINER_OUT;

    SendMessage(battleSys, 1, battler, &command, sizeof(int));
}

void BattleController_EmitTrainerSlideIn(BattleSystem *battleSys, int battler, int posIn) {
    TrainerSlideInMessage message;

    message.command = BATTLE_COMMAND_SLIDE_TRAINER_IN;
    message.trainerType = battleSys->trainers[battler].data.trainerClass;
    message.trainerGender = battleSys->trainerGender[battler];
    message.posIn = posIn;

    SendMessage(battleSys, 1, battler, &message, sizeof(TrainerSlideInMessage));
}

void BattleController_EmitSlideHealthBoxIn(BattleSystem *battleSys, BattleContext *ctx, int battler, int delay) {
    HealthBoxData healthboxData;

    Pokemon *mon = BattleSystem_GetPartyMon(battleSys, battler, ctx->selectedMonIndex[battler]);
    int species = GetMonData(mon, MON_DATA_SPECIES, NULL);
    int level = GetMonData(mon, MON_DATA_LEVEL, NULL);

    healthboxData.command = BATTLE_COMMAND_SLIDE_HEALTHBOX_IN;
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

void BattleController_EmitSlideHealthBoxOut(BattleSystem *battleSys, int battler) {
    int command = BATTLE_COMMAND_SLIDE_HEALTHBOX_OUT;
    SendMessage(battleSys, 1, battler, &command, sizeof(int));
}

void BattleController_EmitSetCommandSelectionMenu(BattleSystem *battleSys, BattleContext *ctx, int battler, int partySlot) {
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

    message.command = BATTLE_COMMAND_SET_COMMAND_SELECTION;
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

void BattleController_EmitSelectedCommand(BattleSystem *battleSys, int battler, int command) {
    SendMessage(battleSys, 0, battler, &command, sizeof(int));
}

void BattleController_EmitShowMoveSelectMenu(BattleSystem *battleSys, BattleContext *ctx, int battler) {
    BattleBuffer_Clear(BattleSystem_GetBattleContext(battleSys), battler);

    MoveSelectMenuMessage message;
    message.command = BATTLE_COMMAND_SHOW_MOVE_SELECT_MENU;
    message.partySlot = ctx->selectedMonIndex[battler];

    for (int i = 0; i < 4; i++) {
        message.moves[i] = ctx->battleMons[battler].moves[i];
        message.ppCur[i] = ctx->battleMons[battler].movePPCur[i];
        message.ppMax[i] = GetMoveMaxPP(ctx->battleMons[battler].moves[i], ctx->battleMons[battler].movePP[i]);
    }

    message.invalidMoves = StruggleCheck(battleSys, ctx, battler, 0, -1);

    SendMessage(battleSys, 1, battler, &message, sizeof(MoveSelectMenuMessage));
}

void BattleController_EmitSelectedMove(BattleSystem *battleSys, int battler, int command) {
    SendMessage(battleSys, 0, battler, &command, sizeof(int));
}

void BattleCommand_EmitShowTargetSelectMenu(BattleSystem *battleSys, BattleContext *ctx, int range, int battler) {
    TargetSelectMenuMessage message;
    int i;
    u32 battleType;

    BattleBuffer_Clear(ctx, battler);

    battleType = BattleSystem_GetBattleType(battleSys);

    message.command = BATTLE_COMMAND_SHOW_TARGET_SELECT_MENU;
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

void BattleController_EmitSelectedTarget(BattleSystem *battleSys, int battler, int command) {
    SendMessage(battleSys, 0, battler, &command, sizeof(int));
}

void BattleController_EmitShowBagMenu(BattleSystem *battleSys, BattleContext *ctx, int battler) {
    BagMenuMessage message;
    int i, j;

    BattleBuffer_Clear(ctx, battler);

    message.command = BATTLE_COMMAND_SHOW_BAG_MENU;

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

void BattleController_EmitSelectedBagItem(BattleSystem *battleSys, int battler, BattleItemUse message) {
    SendMessage(battleSys, 0, battler, &message, sizeof(BattleItemUse));
}

void BattleController_EmitShowPartyMenu(BattleSystem *battleSys, BattleContext *ctx, int battler, int listMode, int canSwitch, int doublesSelection) {
    PartyMenuMessage message;
    int i, j;

    BattleBuffer_Clear(ctx, battler);

    message.command = BATTLE_COMMAND_SHOW_PARTY_MENU;
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

void BattleController_EmitPartyMenuResult(BattleSystem *battleSys, int battler, int command) {
    SendMessage(battleSys, 0, battler, &command, sizeof(int));
}

void BattleController_EmitShowYesNoMenu(BattleSystem *battleSys, BattleContext *ctx, int battler, int promptMsg, int yesNoType, int move, int nickname) {
    YesNoMenuMessage message;

    BattleBuffer_Clear(ctx, battler);

    message.command = BATTLE_COMMAND_SHOW_YES_NO_MENU;
    message.promptMsg = promptMsg;
    message.yesNoType = yesNoType;
    message.move = move;
    message.nickname = nickname;

    SendMessage(battleSys, 1, battler, &message, sizeof(YesNoMenuMessage));
}

void BattleController_EmitPrintAttackMessage(BattleSystem *battleSys, BattleContext *ctx) {
    AttackMsgMessage message;

    message.command = BATTLE_COMMAND_PRINT_ATTACK_MESSAGE;
    message.partySlot = ctx->selectedMonIndex[ctx->battlerIdAttacker];
    message.move = ctx->moveNoCur;

    SendMessage(battleSys, 1, ctx->battlerIdAttacker, &message, sizeof(AttackMsgMessage));
}

void BattleController_EmitPrintMessage(BattleSystem *battleSys, BattleContext *ctx, BattleMessage *battleMsg) {
    battleMsg->unk0 = BATTLE_COMMAND_PRINT_MESSAGE;
    SendMessage(battleSys, 1, ctx->battlerIdAttacker, battleMsg, sizeof(BattleMessage));
}

void BattleController_EmitPlayMoveAnimation(BattleSystem *battleSys, BattleContext *ctx, u16 move) {
    MoveAnimation animation;

    BattleController_SetMoveAnimation(battleSys, ctx, &animation, 0, NULL, ctx->battlerIdAttacker, ctx->battlerIdTarget, move);
    SendMessage(battleSys, 1, ctx->battlerIdAttacker, &animation, sizeof(MoveAnimation));
}

void BattleController_SetMoveAnimationAttackerToDefender(BattleSystem *battleSys, BattleContext *ctx, u16 move, int attacker, int defender) {
    MoveAnimation animation;

    BattleController_SetMoveAnimation(battleSys, ctx, &animation, 0, NULL, attacker, defender, move);
    SendMessage(battleSys, 1, attacker, &animation, sizeof(MoveAnimation));
}

void BattleController_EmitFlickerBattlerSprite(BattleSystem *battleSys, int battler, u32 unused) {
    int command = BATTLE_COMMAND_FLICKER_BATTLER;
    SendMessage(battleSys, 1, battler, &command, sizeof(int));
}

void BattleController_EmitUpdateHPGauge(BattleSystem *battleSys, BattleContext *ctx, int battler) {
    HPGaugeUpdateMessage message;
    Pokemon *pokemon = BattleSystem_GetPartyMon(battleSys, battler, ctx->selectedMonIndex[battler]);
    int species = GetMonData(pokemon, MON_DATA_SPECIES, NULL);
    int level = GetMonData(pokemon, MON_DATA_LEVEL, NULL);

    message.command = BATTLE_COMMAND_UPDATE_HP_GAUGE;
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

void BattleController_EmitUpdateExpGauge(BattleSystem *battleSys, BattleContext *ctx, int battler, int curExp) {
    ExpGaugeUpdateMessage message;
    Pokemon *pokemon = BattleSystem_GetPartyMon(battleSys, battler, ctx->selectedMonIndex[battler]);
    int species = GetMonData(pokemon, MON_DATA_SPECIES, NULL);
    int level = GetMonData(pokemon, MON_DATA_LEVEL, NULL);

    message.command = BATTLE_COMMAND_UPDATE_EXP_GAUGE;
    message.curExp = curExp;
    message.gainedExp = ctx->battleMons[battler].exp - GetMonExpBySpeciesAndLevel(species, level);
    message.expToNextLevel = GetMonExpBySpeciesAndLevel(species, level + 1) - GetMonExpBySpeciesAndLevel(species, level);

    SendMessage(battleSys, 1, battler, &message, sizeof(ExpGaugeUpdateMessage));
}

void BattleController_EmitPlayFaintingSequence(BattleSystem *battleSys, BattleContext *ctx, int battler) {
    FaintingSequenceMessage message;
    int i;

    message.command = BATTLE_COMMAND_PLAY_FAINTING_SEQUENCE;
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

void BattleController_EmitPlaySound(BattleSystem *battleSys, BattleContext *ctx, int sdatID, int battler) {
    PlaySoundMessage message;

    message.command = BATTLE_COMMAND_PLAY_SOUND;
    message.sdatID = sdatID;

    SendMessage(battleSys, 1, battler, &message, sizeof(PlaySoundMessage));
}

void BattleController_EmitFadeOut(BattleSystem *battleSys, BattleContext *ctx) {
    int command = BATTLE_COMMAND_FADE_OUT;

    SendMessage(battleSys, 1, 0, &command, sizeof(int));
}

void BattleController_EmitToggleVanishMessage(BattleSystem *battleSys, int battler, int toggle) {
    ToggleVanishMessage message;
    int i;

    message.command = BATTLE_COMMAND_TOGGLE_VANISH;
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

void BattleController_EmitSetStatusIcon(BattleSystem *battleSys, int battler, int status) {
    SetStatusIconMessage message;

    message.command = BATTLE_COMMAND_SET_STATUS_ICON;
    message.status = status;

    SendMessage(battleSys, 1, battler, &message, sizeof(SetStatusIconMessage));
}

void BattleController_EmitPrintTrainerMessage(BattleSystem *battleSys, int battler, int msg) {
    TrainerMsgMessage message;

    message.command = BATTLE_COMMAND_PRINT_TRAINER_MESSAGE;
    message.msg = msg;

    SendMessage(battleSys, 1, battler, &message, sizeof(TrainerMsgMessage));
}

void BattleController_EmitPlayStatusEffect(BattleSystem *battleSys, BattleContext *ctx, int battler, int secondaryAnimID) {
    MoveAnimation animation;

    BattleController_SetMoveAnimation(battleSys, ctx, &animation, 1, secondaryAnimID, battler, battler, NULL);
    SendMessage(battleSys, 1, battler, &animation, sizeof(MoveAnimation));
}

void BattleController_EmitPlayStatusEffectAttackerToDefender(BattleSystem *battleSys, BattleContext *ctx, int attacker, int defender, int secondaryAnimID) {
    MoveAnimation animation;

    BattleController_SetMoveAnimation(battleSys, ctx, &animation, 1, secondaryAnimID, attacker, defender, NULL);
    SendMessage(battleSys, 1, attacker, &animation, sizeof(MoveAnimation));
}

void BattleController_EmitPrintReturnMessage(BattleSystem *battleSys, BattleContext *ctx, int battler, int partySlot) {
    ReturnMsgMessage message;

    message.command = BATTLE_COMMAND_PRINT_RETURN_MESSAGE;
    message.partySlot = partySlot;
    message.hpPercent = (ctx->hpTemp - ctx->battleMons[1].hp) * 100 / ctx->hpTemp;

    SendMessage(battleSys, 1, battler, &message, sizeof(ReturnMsgMessage));
}

void BattleController_EmitPrintSendOutMessage(BattleSystem *battleSys, BattleContext *ctx, int battler, int partySlot) {
    SendOutMsgMessage message;

    message.command = BATTLE_COMMAND_PRINT_SEND_OUT_MESSAGE;
    message.partySlot = partySlot;

    if (ctx->battleMons[1].hp == 0) {
        message.hpPercent = 1000;
    } else {
        message.hpPercent = ctx->battleMons[1].hp * 1000 / ctx->battleMons[1].maxHp;
    }

    SendMessage(battleSys, 1, battler, &message, sizeof(SendOutMsgMessage));
}

void BattleController_EmitPrintEncounterMessage(BattleSystem *battleSys, BattleContext *ctx, int battler) {
    int command = BATTLE_COMMAND_PRINT_ENCOUNTER_MESSAGE;

    SendMessage(battleSys, 1, battler, &command, sizeof(int));
}

void BattleController_EmitPrintLeadMonMessage(BattleSystem *battleSys, BattleContext *ctx, int battler) {
    LeadMonMsgMessage message;
    int i;

    message.command = BATTLE_COMMAND_PRINT_LEAD_MON_MESSAGE;

    for (i = 0; i < BattleSystem_GetMaxBattlers(battleSys); i++) {
        message.partySlot[i] = ctx->selectedMonIndex[i];
    }

    SendMessage(battleSys, 1, battler, &message, sizeof(LeadMonMsgMessage));
}

void BattleController_EmitPlayLevelUpAnimation(BattleSystem *battleSys, int battler) {
    int command = BATTLE_COMMAND_PLAY_LEVEL_UP_ANIMATION;

    SendMessage(battleSys, 1, battler, &command, sizeof(int));
}

void BattleController_EmitSetAlertMessage(BattleSystem *battleSys, int battler, BattleMessage msg) {
    BattleBuffer_Clear(BattleSystem_GetBattleContext(battleSys), battler);

    AlertMsgMessage message;
    message.command = BATTLE_COMMAND_SET_ALERT_MESSAGE;
    message.msg = msg;

    SendMessage(battleSys, 1, battler, &message, sizeof(AlertMsgMessage));
}

void BattleController_EmitAlertMessageAck(BattleSystem *battleSys, int battler) {
    int command = BATTLE_COMMAND_SETUP_UI;
    SendMessage(battleSys, 0, battler, &command, sizeof(int));
}

void BattleController_EmitRefreshHPGauge(BattleSystem *battleSys, BattleContext *ctx, int battler) {
    RefreshHPGaugeMessage message;
    Pokemon *pokemon;
    int species;
    int level;

    pokemon = BattleSystem_GetPartyMon(battleSys, battler, ctx->selectedMonIndex[battler]);
    species = GetMonData(pokemon, MON_DATA_SPECIES, NULL);
    level = GetMonData(pokemon, MON_DATA_LEVEL, NULL);

    message.command = BATTLE_COMMAND_REFRESH_HP_GAUGE;
    message.level = ctx->battleMons[battler].level;
    message.curHP = ctx->battleMons[battler].hp;
    message.maxHP = ctx->battleMons[battler].maxHp;
    message.partySlot = ctx->selectedMonIndex[battler];
    message.status = Battler_GetStatusCondition(ctx, battler);

    if ((ctx->battleMons[battler].species == SPECIES_NIDORAN_F || ctx->battleMons[battler].species == SPECIES_NIDORAN_M)
        && ctx->battleMons[battler].hasNickname == FALSE) {
        message.gender = 2;
    } else {
        message.gender = ctx->battleMons[battler].gender;
    }

    message.curExp = ctx->battleMons[battler].exp - GetMonExpBySpeciesAndLevel(species, level);
    message.maxExp = GetMonExpBySpeciesAndLevel(species, level + 1) - GetMonExpBySpeciesAndLevel(species, level);
    message.caughtSpecies = BattleSystem_CheckMonCaught(battleSys, ctx->battleMons[battler].species);
    message.numSafariBalls = BattleSystem_GetSafariBallCount(battleSys);

    SendMessage(battleSys, 1, battler, &message, sizeof(RefreshHPGaugeMessage));
}

void BattleController_EmitUpdatePartyMon(BattleSystem *battleSys, BattleContext *ctx, int battler) {
    UpdatePartyMonMessage message;
    int i;

    message.command = BATTLE_COMMAND_UPDATE_PARTY_MON;
    message.partySlot = ctx->selectedMonIndex[battler];
    message.mimickedMoveSlot = ctx->battleMons[battler].unk88.mimicedMoveIndex;
    message.curHP = ctx->battleMons[battler].hp;
    message.heldItem = ctx->battleMons[battler].item;
    message.knockedOffItemsMask = ctx->fieldSideConditionData[BattleSystem_GetFieldSide(battleSys, battler)].battlerBitKnockedOffItem;
    message.formNum = ctx->battleMons[battler].form;
    message.ability = ctx->battleMons[battler].ability;

    for (i = 0; i < 4; i++) {
        message.moves[i] = ctx->battleMons[battler].moves[i];
        message.ppCur[i] = ctx->battleMons[battler].movePPCur[i];
    }

    if (message.curHP) {
        message.status = (ctx->battleMons[battler].status & ~STATUS_POISON_COUNT);
        message.status2 = ctx->battleMons[battler].status2;
    } else {
        message.status = 0;
        message.status2 = ctx->battleMons[battler].status2;
    }

    if (ctx->battleStatus2 & BATTLE_STATUS2_FORM_CHANGE) {
        message.updateForm = 1;
        ctx->battleStatus2 &= ~BATTLE_STATUS2_FORM_CHANGE;
    } else {
        message.updateForm = 0;
    }

    if (ctx->battleStatus2 & BATTLE_STATUS2_RECALC_MON_STATS) {
        message.updateStats = 1;
        message.updateForm = 1;
        ctx->battleStatus2 &= ~BATTLE_STATUS2_RECALC_MON_STATS;
    } else {
        message.updateStats = 0;
    }

    SendMessage(battleSys, 1, battler, &message, sizeof(UpdatePartyMonMessage));
}

void BattleController_EmitSlideInBackground(BattleSystem *battleSys, int battler) {
    int command = BATTLE_COMMAND_SLIDE_IN_BACKGROUND;
    SendMessage(battleSys, 1, battler, &command, sizeof(int));
}

void BattleController_EmitStopGaugeAnimation(BattleSystem *battleSys, int battler) {
    int command = BATTLE_COMMAND_STOP_GAUGE_ANIMATION;
    SendMessage(battleSys, 1, battler, &command, sizeof(int));
}

void BattleController_EmitRefreshPartyStatus(BattleSystem *battleSys, BattleContext *ctx, int battler, int move) {
    RefreshPartyStatusMessage message;

    message.command = BATTLE_COMMAND_REFRESH_PARTY_STATUS;
    message.move = move;
    message.ability = ctx->battleMons[battler].ability;

    SendMessage(battleSys, 1, battler, &message, sizeof(RefreshPartyStatusMessage));
}

void BattleController_EmitForgetMove(BattleSystem *battleSys, int battler, int move, int slot) {
    ForgetMoveMessage message;

    BattleBuffer_Clear(BattleSystem_GetBattleContext(battleSys), battler);

    message.command = BATTLE_COMMAND_FORGET_MOVE;
    message.move = move;
    message.slot = slot;

    SendMessage(battleSys, 1, battler, &message, sizeof(RefreshPartyStatusMessage));
}

void BattleController_EmitPlayMosaicAnimation(BattleSystem *battleSys, int battler, int intensity, int wait) {
    MosaicSetMessage message;

    message.command = BATTLE_COMMAND_SET_MOSAIC;
    message.intensity = intensity;
    message.wait = wait;

    SendMessage(battleSys, 1, battler, &message, sizeof(MosaicSetMessage));
}

void BattleController_EmitChangeForm(BattleSystem *battleSys, int battler) {
    MonChangeFormMessage message;

    message.command = BATTLE_COMMAND_CHANGE_FORM;
    message.species = battleSys->ctx->battleMons[battler].species;
    message.isShiny = battleSys->ctx->battleMons[battler].shiny;

    if (battleSys->ctx->battleMons[battler].status2 & STATUS2_TRANSFORM) {
        message.gender = battleSys->ctx->battleMons[battler].unk88.transformGender;
        message.personality = battleSys->ctx->battleMons[battler].unk88.transformPersonality;
    } else {
        message.gender = battleSys->ctx->battleMons[battler].gender;
        message.personality = battleSys->ctx->battleMons[battler].personality;
    }

    message.formNum = battleSys->ctx->battleMons[battler].form;

    SendMessage(battleSys, 1, battler, &message, sizeof(MonChangeFormMessage));
}

void BattleController_EmitUpdateBackground(BattleSystem *battleSys, int battler) {
    int command = BATTLE_COMMAND_UPDATE_BG;
    SendMessage(battleSys, 1, battler, &command, sizeof(int));
}

void BattleController_EmitClearTouchScreen(BattleSystem *battleSys, int battler) {
    int command = BATTLE_COMMAND_CLEAR_TOUCH_SCREEN;
    SendMessage(battleSys, 1, battler, &command, sizeof(int));
}

void BattleController_EmitShowInitialPartyGauge(BattleSystem *battleSys, int battler) {
    PartyGaugeData gauge;
    PartyGaugeData_New(battleSys, battleSys->ctx, &gauge, BATTLE_COMMAND_SHOW_BATTLE_START_PARTY_GAUGE, battler);
    SendMessage(battleSys, 1, battler, &gauge, sizeof(PartyGaugeData));
}

void BattleController_EmitHideInitialPartyGauge(BattleSystem *battleSys, int battler) {
    PartyGaugeData gauge;
    PartyGaugeData_New(battleSys, battleSys->ctx, &gauge, BATTLE_COMMAND_HIDE_BATTLE_START_PARTY_GAUGE, battler);
    SendMessage(battleSys, 1, battler, &gauge, sizeof(PartyGaugeData));
}

void BattleController_EmitShowPartyGauge(BattleSystem *battleSys, int battler) {
    PartyGaugeData gauge;
    PartyGaugeData_New(battleSys, battleSys->ctx, &gauge, BATTLE_COMMAND_SHOW_PARTY_GAUGE, battler);
    SendMessage(battleSys, 1, battler, &gauge, sizeof(PartyGaugeData));
}

void BattleController_EmitHidePartyGauge(BattleSystem *battleSys, int battler) {
    PartyGaugeData gauge;
    PartyGaugeData_New(battleSys, battleSys->ctx, &gauge, BATTLE_COMMAND_HIDE_PARTY_GAUGE, battler);
    SendMessage(battleSys, 1, battler, &gauge, sizeof(PartyGaugeData));
}

void BattleController_EmitLoadPartyGaugeGraphics(BattleSystem *battleSys) {
    int command = BATTLE_COMMAND_LOAD_PARTY_GAUGE_GRAPHICS;
    SendMessage(battleSys, 1, NULL, &command, sizeof(int));
}

void BattleController_EmitFreePartyGaugeGraphics(BattleSystem *battleSys) {
    int command = BATTLE_COMMAND_FREE_PARTY_GAUGE_GRAPHICS;
    SendMessage(battleSys, 1, NULL, &command, sizeof(int));
}

void BattleController_EmitIncrementGameStat(BattleSystem *battleSys, int battler, int battlerType, int record) {
    RecordIncrementMessage message;

    message.command = BATTLE_COMMAND_INCREMENT_RECORD;
    message.battlerType = battlerType;
    message.record = record;

    SendMessage(battleSys, 1, battler, &message, sizeof(RecordIncrementMessage));
}

void BattleController_EmitPrintLinkWaitMessage(BattleSystem *battleSys, int battler) {
    LinkWaitMsgMessage message;
    u32 battleType = BattleSystem_GetBattleType(battleSys);

    message.command = BATTLE_COMMAND_PRINT_LINK_WAIT_MESSAGE;
    message.recordedInputCount = 0;

    if ((battleType & BATTLE_TYPE_LINK) && sub_0202FC48() == TRUE && (battleSys->battleSpecial & BATTLE_STATUS_HIT_DIVE) == FALSE) {
        message.recordedInputCount = ov12_0223BE68(battleSys, &message.recordedInputs[0]);
        GF_ASSERT(message.recordedInputCount < 28);
        SendMessage(battleSys, 1, battler, &message, sizeof(LinkWaitMsgMessage));
    }
}

void BattleController_EmitRestoreSprite(BattleSystem *battleSys, BattleContext *ctx, int battler) {
    int i;
    MoveAnimation animation;

    animation.command = BATTLE_COMMAND_RESTORE_SPRITE;

    for (i = 0; i < 4; i++) {
        animation.species[i] = ctx->battleMons[i].species;
        animation.isShiny[i] = ctx->battleMons[i].shiny;
        animation.formNums[i] = ctx->battleMons[i].form;

        if (ctx->battleMons[i].status2 & STATUS2_TRANSFORM) {
            animation.genders[i] = ctx->battleMons[i].unk88.transformGender;
            animation.personalities[i] = ctx->battleMons[i].unk88.transformPersonality;
        } else {
            animation.genders[i] = ctx->battleMons[i].gender;
            animation.personalities[i] = ctx->battleMons[i].personality;
        }
    }

    SendMessage(battleSys, 1, battler, &animation, sizeof(MoveAnimation));
}

void BattleController_EmitSpriteToOAM(BattleSystem *battleSys, int battler) {
    int command = BATTLE_COMMAND_SPRITE_TO_OAM;
    SendMessage(battleSys, 1, battler, &command, sizeof(int));
}

void BattleController_EmitOAMToSprite(BattleSystem *battleSys, int battler) {
    int command = BATTLE_COMMAND_OAM_TO_SPRITE;
    SendMessage(battleSys, 1, battler, &command, sizeof(int));
}

void BattleController_EmitPrintResultMessage(BattleSystem *battleSys) {
    int command = BATTLE_COMMAND_PRINT_RESULT_MESSAGE;
    SendMessage(battleSys, 1, 0, &command, sizeof(int));
}

void BattleController_EmitPrintEscapeMessage(BattleSystem *battleSys, BattleContext *ctx) {
    EscapeMsgMessage message;
    int i;
    u32 battleType = BattleSystem_GetBattleType(battleSys);

    message.command = BATTLE_COMMAND_PRINT_ESCAPE_MESSAGE;
    message.escaperBitmask = 0;
    message.recordedInputCount = 0;

    for (i = 0; i < BattleSystem_GetMaxBattlers(battleSys); i++) {
        if (ctx->playerActions[i].command == 16) {
            message.escaperBitmask |= MaskOfFlagNo(i);
        }
    }

    if ((battleType & BATTLE_TYPE_LINK) && sub_0202FC48() == TRUE && (battleSys->battleSpecial & BATTLE_STATUS_HIT_DIVE) == FALSE) {
        message.recordedInputCount = ov12_0223BE68(battleSys, &message.recordedInputs[0]);
        GF_ASSERT(message.recordedInputCount < 28);
    }

    SendMessage(battleSys, 1, 0, &message, sizeof(EscapeMsgMessage));
}

void BattleController_EmitPrintForefitMessage(BattleSystem *battleSys) {
    ForfeitMsgMessage message;
    u32 battleType = BattleSystem_GetBattleType(battleSys);

    message.command = BATTLE_COMMAND_PRINT_FORFEIT_MESSAGE;
    message.recordedInputCount = 0;

    if ((battleType & BATTLE_TYPE_LINK) && sub_0202FC48() == TRUE && (battleSys->battleSpecial & BATTLE_STATUS_HIT_DIVE) == FALSE) {
        message.recordedInputCount = ov12_0223BE68(battleSys, &message.recordedInputs[0]);
        GF_ASSERT(message.recordedInputCount < 28);
    }

    SendMessage(battleSys, 1, 0, &message, sizeof(ForfeitMsgMessage));
}

void BattleController_EmitRefreshSprite(BattleSystem *battleSys, BattleContext *ctx, int battler) {
    int i;
    MoveAnimation animation;

    animation.command = BATTLE_COMMAND_REFRESH_SPRITE;

    for (i = 0; i < 4; i++) {
        animation.species[i] = ctx->battleMons[i].species;
        animation.isShiny[i] = ctx->battleMons[i].shiny;
        animation.formNums[i] = ctx->battleMons[i].form;

        if (ctx->battleMons[i].status2 & STATUS2_TRANSFORM) {
            animation.genders[i] = ctx->battleMons[i].unk88.transformGender;
            animation.personalities[i] = ctx->battleMons[i].unk88.transformPersonality;
        } else {
            animation.genders[i] = ctx->battleMons[i].gender;
            animation.personalities[i] = ctx->battleMons[i].personality;
        }
    }

    SendMessage(battleSys, 1, battler, &animation, sizeof(MoveAnimation));
}

void BattleController_EmitPlayMoveHitSoundEffect(BattleSystem *battleSys, BattleContext *ctx, int battler) {
    MoveHitSoundMessage message;

    message.command = BATTLE_COMMAND_FLY_MOVE_HIT_SOUND_EFFECT;

    if (ctx->moveStatusFlag & MOVE_STATUS_SUPER_EFFECTIVE) {
        message.effectiveness = 2;
    } else if (ctx->moveStatusFlag & MOVE_STATUS_NOT_VERY_EFFECTIVE) {
        message.effectiveness = 1;
    } else {
        message.effectiveness = 0;
    }

    SendMessage(battleSys, 1, battler, &message, sizeof(MoveHitSoundMessage));
}

void BattleController_EmitPlayMusic(BattleSystem *battleSys, int battler, int bgmID) {
    MusicPlayMessage message;

    message.command = BATTLE_COMMAND_PLAY_MUSIC;
    message.bgmID = bgmID;

    SendMessage(battleSys, 1, battler, &message, sizeof(MusicPlayMessage));
}

void BattleController_EmitSetBattleResults(BattleSystem *battleSys) {
    ResultSubmitMessage message;
    u32 battleType = BattleSystem_GetBattleType(battleSys);

    message.command = BATTLE_COMMAND_SET_BATTLE_RESULT;
    message.resultMask = BattleSystem_GetBattleOutcomeFlags(battleSys);
    message.recordedInputCount = 0;

    if ((battleType & BATTLE_TYPE_LINK) && sub_0202FC48() == TRUE && (battleSys->battleSpecial & BATTLE_STATUS_HIT_DIVE) == FALSE) {
        message.recordedInputCount = ov12_0223BE68(battleSys, &message.recordedInputs[0]);
        GF_ASSERT(message.recordedInputCount <= 28);
    }

    SendMessage(battleSys, 1, 0, &message, sizeof(ResultSubmitMessage));
}

void BattleController_EmitClearMessageBox(BattleSystem *battleSys) {
    int command = BATTLE_COMMAND_CLEAR_MESSAGE_BOX;
    SendMessage(battleSys, 1, 0, &command, sizeof(int));
}

void BattleController_EmitClearCommand(BattleSystem *battleSys, int battler, int command) {
    CommandClearMsg message;

    message.command = command;
    message.netID = sub_0203769C();

    SendMessage(battleSys, 2, battler, &message, sizeof(CommandClearMsg));
}

BOOL BattleController_RecvCommMessage(BattleSystem *battleSys, void *data) {
    u8 *src = (u8 *)data;
    u8 recipient;
    u8 battler;
    int size;
    int i;
    BOOL success = TRUE;

    recipient = src[0];
    battler = src[1];
    size = src[2] | (src[3] << 8);

    src += sizeof(BattleMessageInfo);

    if (recipient == 0) {
        for (i = 0; i < size; i++) {
            battleSys->ctx->battleBuffer[battler][i] = src[i];
        }
    } else if (recipient == 1) {
        if (battleSys->opponentData[battler]->unk1A8 == 0) {
            battleSys->opponentData[battler]->unk1A8 = 1;

            for (i = 0; i < size; i++) {
                battleSys->opponentData[battler]->unk94[i] = src[i];
            }
        } else {
            success = FALSE;
        }
    } else if (recipient == 2) {
        int val = src[0];
        int id = src[1];

        if (BattleSystem_IsInitialized(battleSys)) {
            ov12_0224ED00(battleSys->ctx, id, battler, val);
        }
    }

    return success;
}

void BattleController_SetMoveAnimation(BattleSystem *battleSys, BattleContext *ctx, MoveAnimation *animation, int animMode, int secondaryAnimID, int attacker, int defender, u16 move) {
    int i;

    animation->command = 22;
    animation->move = move;
    animation->attacker = attacker;
    animation->defender = defender;
    animation->animMode = animMode;
    animation->secondaryAnimID = secondaryAnimID;
    animation->terrain = BattleSystem_GetTerrainId(battleSys);
    animation->unk_0E_2 = 0;
    animation->unk_0E_3 = 0;

    if (ctx != NULL) {
        animation->damage = ctx->damage;

        if (ctx->movePower) {
            animation->power = ctx->movePower;
        } else {
            animation->power = ctx->trainerAIData.moveData[move].power;
        }

        animation->friendship = ctx->battleMons[attacker].friendship;

        if (CheckAbilityActive(battleSys, ctx, 8, 0, ABILITY_CLOUD_NINE) == 0
            && CheckAbilityActive(battleSys, ctx, 8, 0, ABILITY_AIR_LOCK) == 0) {
            animation->fieldConditions = ctx->fieldCondition;
        } else {
            animation->fieldConditions = 0;
        }

        animation->effectChance = ctx->unk_2164;
        animation->isSubstitute = (ctx->battleMons[attacker].status2 & STATUS2_SUBSTITUTE) != 0;
        animation->isTransformed = (ctx->battleMons[attacker].status2 & STATUS2_TRANSFORM) != 0;

        for (i = 0; i < 4; i++) {
            animation->species[i] = ctx->battleMons[i].species;
            animation->isShiny[i] = ctx->battleMons[i].shiny;
            animation->formNums[i] = ctx->battleMons[i].form;
            animation->moveEffectMasks[i] = ctx->battleMons[i].moveEffectFlags;

            if (ctx->battleMons[i].status2 & STATUS2_TRANSFORM) {
                animation->genders[i] = ctx->battleMons[i].unk88.transformGender;
                animation->personalities[i] = ctx->battleMons[i].unk88.transformPersonality;
            } else {
                animation->genders[i] = ctx->battleMons[i].gender;
                animation->personalities[i] = ctx->battleMons[i].personality;
            }
        }

        if (attacker != 255) {
            u32 var = ov12_0223C140(battleSys, attacker);
            if (var != 255 && var == ctx->selectedMonIndex[attacker]) {
                animation->unk_0E_2 = 1;
            }
        }

        if (defender != 255) {
            u32 var = ov12_0223C140(battleSys, defender);
            if (var != 255 && var == ctx->selectedMonIndex[defender]) {
                animation->unk_0E_3 = 1;
            }
        }
    }
}

void ov12_022645C8(BattleSystem *battleSystem, BattleContext *ctx, u8 a2) {
    Message_022645C8 message;
    MI_CpuClear8(&message, sizeof(Message_022645C8));
    message.command = BATTLE_COMMAND_67;
    message.unk1 = a2;
    SendMessage(battleSystem, 1, 0, &message, sizeof(Message_022645C8));
}

static inline void PartyGaugeData_Fill(BattleContext *ctx, PartyGaugeData *partyGauge, Party *party, int battler, int slot) {
    for (int i = 0; i < Party_GetCount(party); i++) {
        Pokemon *mon = Party_GetMonByIndex(party, ctx->unk_312C[battler][i]);
        int species = GetMonData(mon, MON_DATA_SPECIES_OR_EGG, NULL);

        if (species && species != SPECIES_EGG) {
            if (GetMonData(mon, MON_DATA_HP, NULL)) {
                if (GetMonData(mon, MON_DATA_STATUS, NULL)) {
                    partyGauge->status[slot] = 3;
                } else {
                    partyGauge->status[slot] = 1;
                }
            } else {
                partyGauge->status[slot] = 2;
            }

            slot++;
        }
    }
}

static void PartyGaugeData_New(BattleSystem *battleSys, BattleContext *ctx, PartyGaugeData *partyGauge, int command, int battler) {
    MI_CpuClearFast(partyGauge, sizeof(PartyGaugeData));
    u32 battleType = BattleSystem_GetBattleType(battleSys);
    partyGauge->command = command;

    int battler1, battler2;
    Party *party;

    if ((battleType & (BATTLE_TYPE_LINK | BATTLE_TYPE_MULTI)) == (BATTLE_TYPE_LINK | BATTLE_TYPE_MULTI)                                                        // 2vs2 link battle
        || ((battleType & BATTLE_TYPE_TAG) && BattleSystem_GetFieldSide(battleSys, battler))                                                                   // either of the two opponents on the enemy side
        || ((battleType == (BATTLE_TYPE_TRAINER | BATTLE_TYPE_DOUBLES | BATTLE_TYPE_MULTI | BATTLE_TYPE_AI)) && BattleSystem_GetFieldSide(battleSys, battler)) // either of the two opponents on the enemy side
        || battleType == (BATTLE_TYPE_FRONTIER | BATTLE_TYPE_TRAINER | BATTLE_TYPE_DOUBLES | BATTLE_TYPE_MULTI | BATTLE_TYPE_AI)) {                            // frontier, AI partner
        if (ov12_0223AB0C(battleSys, battler) == BATTLER_PLAYER2
            || ov12_0223AB0C(battleSys, battler) == BATTLER_ENEMY2) {
            battler1 = battler;
            battler2 = BattleSystem_GetBattlerIdPartner(battleSys, battler);
        } else {
            battler1 = BattleSystem_GetBattlerIdPartner(battleSys, battler);
            battler2 = battler;
        }

        party = BattleSystem_GetParty(battleSys, battler1);
        PartyGaugeData_Fill(ctx, partyGauge, party, battler1, 0);

        party = BattleSystem_GetParty(battleSys, battler2);
        PartyGaugeData_Fill(ctx, partyGauge, party, battler2, 3);
    } else {
        if ((battleType & BATTLE_TYPE_DOUBLES) && (battleType & BATTLE_TYPE_MULTI) == FALSE) {
            battler = battler & 1;
        } else {
            battler = battler;
        }

        party = BattleSystem_GetParty(battleSys, battler);
        PartyGaugeData_Fill(ctx, partyGauge, party, battler, 0);
    }
}
