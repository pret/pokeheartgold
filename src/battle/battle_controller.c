#include "battle/battle_controller.h"

#include "constants/abilities.h"

#include "battle/battle_message_structs.h"
#include "battle/party_gauge.h"

#include "pokemon.h"

static void PartyGaugeData_New(BattleSystem *battleSystem, BattleContext *ctx, PartyGaugeData *partyGauge, int command, int battler);

static void BattleController_SendLocalMessage(BattleSystem *battleSystem, int recipient, int battler, void *message, u8 size) {
    int i;
    BattleMessageInfo info;
    u8 *src;
    u8 *dest;
    u16 *writeIndex;
    u16 *endIndex;

    if (recipient == 1) {
        dest = BattleSystem_GetClientMessage(battleSystem);
        writeIndex = BattleSystem_GetClientWriteIndex(battleSystem);
        endIndex = BattleSystem_GetClientEndIndex(battleSystem);
    } else {
        dest = BattleSystem_GetServerMessage(battleSystem);
        writeIndex = BattleSystem_GetServerWriteIndex(battleSystem);
        endIndex = BattleSystem_GetServerEndIndex(battleSystem);
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

static BOOL BattleController_RecvMessage(BattleSystem *battleSystem, void *message) {
    u8 *src = (u8 *)message;
    int i;
    BOOL success = FALSE;

    u8 recipient = src[0];
    u8 battler = src[1];
    int size = src[2] | (src[3] << 8);

    src += sizeof(BattleMessageInfo);

    if (recipient == 0) {
        if (battleSystem->ctx->battleBuffer[battler][0] == 0) {
            for (i = 0; i < size; i++) {
                battleSystem->ctx->battleBuffer[battler][i] = src[i];
            }

            success = TRUE;
        }
    } else if (recipient == 1) {
        if (battleSystem->opponentData[battler]->unk94[0] == 0) {
            for (i = 0; i < size; i++) {
                battleSystem->opponentData[battler]->unk94[i] = src[i];
            }

            success = TRUE;
        }
    } else if (recipient == 2) {
        int val = src[0];
        int id = src[1];

        if (BattleSystem_IsInitialized(battleSystem)) {
            ov12_0224ED00(battleSystem->ctx, id, battler, val);
        }

        success = TRUE;
    }

    return success;
}

void BattleSystem_TryRecvMessage(BattleSystem *battleSystem, int recipient) {
    u8 *src;
    u16 *readIndex;
    u16 *writeIndex;
    u16 *endIndex;
    int size;

    if (recipient == 1) {
        src = BattleSystem_GetClientMessage(battleSystem);
        readIndex = BattleSystem_GetClientReadIndex(battleSystem);
        writeIndex = BattleSystem_GetClientWriteIndex(battleSystem);
        endIndex = BattleSystem_GetClientEndIndex(battleSystem);
    } else {
        src = BattleSystem_GetServerMessage(battleSystem);
        readIndex = BattleSystem_GetServerReadIndex(battleSystem);
        writeIndex = BattleSystem_GetServerWriteIndex(battleSystem);
        endIndex = BattleSystem_GetServerEndIndex(battleSystem);
    }

    if (readIndex[0] == writeIndex[0]) {
        return;
    }

    if (readIndex[0] == endIndex[0]) {
        readIndex[0] = 0;
        endIndex[0] = 0;
    }

    if (BattleController_RecvMessage(battleSystem, (void *)&src[readIndex[0]]) == 1) {
        size = sizeof(BattleMessageInfo) + (src[readIndex[0] + 2] | (src[readIndex[0] + 3] << 8));
        readIndex[0] += size;
    }
}

static void SendMessage(BattleSystem *battleSystem, int recipient, int battler, void *message, u8 size) {
    u8 *data = message;

    if (battleSystem->battleType & BATTLE_TYPE_LINK && (battleSystem->battleSpecial & BATTLE_TYPE_TAG) == FALSE) {
        if (recipient == 1) {
            for (int i = 0; i < sub_02037454(); i++) {
                ov12_0224ECC4(battleSystem->ctx, i, battler, *data);
            }
        }

        sub_02074F9C(battleSystem, recipient, battler, message, size);
    } else {
        if (recipient == 1) {
            ov12_0224ECC4(battleSystem->ctx, 0, battler, *data);
        }

        BattleController_SendLocalMessage(battleSystem, recipient, battler, message, size);
    }
}

void BattleController_EmitSetupBattleUI(BattleSystem *battleSystem, int battler) {
    EncounterAnimationMessage message;

    message.command = BATTLE_COMMAND_SETUP_UI;
    message.seed = BattleSystem_GetRandTemp(battleSystem);

    SendMessage(battleSystem, 1, battler, &message, sizeof(EncounterAnimationMessage));
}

void BattleController_EmitSetEncounter(BattleSystem *battleSystem, int battler) {
    MonEncounterMessage message;
    int i;

    message.command = BATTLE_COMMAND_SET_ENCOUNTER;
    message.gender = battleSystem->ctx->battleMons[battler].gender;
    message.isShiny = battleSystem->ctx->battleMons[battler].shiny;
    message.species = battleSystem->ctx->battleMons[battler].species;
    message.personality = battleSystem->ctx->battleMons[battler].personality;
    message.cryModulation = ov12_02256748(battleSystem->ctx, battler, ov12_0223AB0C(battleSystem, battler), 1);
    message.formNum = battleSystem->ctx->battleMons[battler].form;

    for (i = 0; i < MAX_MON_MOVES; i++) {
        message.moves[i] = BattleMon_Get(battleSystem->ctx, battler, BMON_DATA_MOVE1 + i, NULL);
        message.curPP[i] = BattleMon_Get(battleSystem->ctx, battler, BMON_DATA_CUR_PP_1 + i, NULL);
        message.maxPP[i] = BattleMon_Get(battleSystem->ctx, battler, BMON_DATA_MAX_PP_1 + i, NULL);
    }

    BattleMon_Get(battleSystem->ctx, battler, BMON_DATA_NICKNAME, &message.nickname);
    SendMessage(battleSystem, 1, battler, &message, sizeof(MonEncounterMessage));
}

void BattleController_EmitShowEncounter(BattleSystem *battleSystem, int battler) {
    MonShowMessage message;
    int i;

    message.command = BATTLE_COMMAND_SHOW_ENCOUNTER;
    message.gender = battleSystem->ctx->battleMons[battler].gender;
    message.isShiny = battleSystem->ctx->battleMons[battler].shiny;
    message.species = battleSystem->ctx->battleMons[battler].species;
    message.personality = battleSystem->ctx->battleMons[battler].personality;
    message.cryModulation = ov12_02256748(battleSystem->ctx, battler, ov12_0223AB0C(battleSystem, battler), 1);
    message.selectedPartySlot = battleSystem->ctx->selectedMonIndex[battler];
    message.formNum = battleSystem->ctx->battleMons[battler].form;
    message.capturedBall = battleSystem->ctx->battleMons[battler].ball;
    message.partnerPartySlot = battleSystem->ctx->selectedMonIndex[BattleSystem_GetBattlerIdPartner(battleSystem, battler)];

    ov12_0223B854(battleSystem, battler, message.selectedPartySlot);

    for (i = 0; i < MAX_MON_MOVES; i++) {
        message.moves[i] = BattleMon_Get(battleSystem->ctx, battler, BMON_DATA_MOVE1 + i, NULL);
        message.curPP[i] = BattleMon_Get(battleSystem->ctx, battler, BMON_DATA_CUR_PP_1 + i, NULL);
        message.maxPP[i] = BattleMon_Get(battleSystem->ctx, battler, BMON_DATA_MAX_PP_1 + i, NULL);
    }

    BattleMon_Get(battleSystem->ctx, battler, BMON_DATA_NICKNAME, &message.nickname);
    SendMessage(battleSystem, 1, battler, &message, sizeof(MonShowMessage));
}

void BattleController_EmitShowPokemon(BattleSystem *battleSystem, int battler, int capturedBall, int quickSendOut) {
    MonShowMessage message;
    int i;

    message.command = BATTLE_COMMAND_SHOW_POKEMON;

    if (battleSystem->ctx->battleMons[battler].status2 & STATUS2_TRANSFORM) {
        message.gender = battleSystem->ctx->battleMons[battler].unk88.transformGender;
        message.personality = battleSystem->ctx->battleMons[battler].unk88.transformPersonality;
    } else {
        message.gender = battleSystem->ctx->battleMons[battler].gender;
        message.personality = battleSystem->ctx->battleMons[battler].personality;
    }

    message.isShiny = battleSystem->ctx->battleMons[battler].shiny;
    message.species = battleSystem->ctx->battleMons[battler].species;
    message.cryModulation = ov12_02256748(battleSystem->ctx, battler, ov12_0223AB0C(battleSystem, battler), 0);
    message.selectedPartySlot = battleSystem->ctx->selectedMonIndex[battler];
    message.formNum = battleSystem->ctx->battleMons[battler].form;

    if (capturedBall) {
        message.capturedBall = capturedBall;
    } else {
        message.capturedBall = battleSystem->ctx->battleMons[battler].ball;
    }

    message.isQuickSendOut = quickSendOut;
    message.isSubstitute = (battleSystem->ctx->battleMons[battler].status2 & STATUS2_SUBSTITUTE) != 0;

    ov12_0223B854(battleSystem, battler, message.selectedPartySlot);

    for (i = 0; i < MAX_MON_MOVES; i++) {
        message.moves[i] = BattleMon_Get(battleSystem->ctx, battler, BMON_DATA_MOVE1 + i, NULL);
        message.curPP[i] = BattleMon_Get(battleSystem->ctx, battler, BMON_DATA_CUR_PP_1 + i, NULL);
        message.maxPP[i] = BattleMon_Get(battleSystem->ctx, battler, BMON_DATA_MAX_PP_1 + i, NULL);
    }

    BattleMon_Get(battleSystem->ctx, battler, BMON_DATA_NICKNAME, &message.nickname);

    for (i = 0; i < BATTLER_MAX; i++) {
        message.battleMonSpecies[i] = battleSystem->ctx->battleMons[i].species;
        message.battleMonIsShiny[i] = battleSystem->ctx->battleMons[i].shiny;
        message.battleMonFormNums[i] = battleSystem->ctx->battleMons[i].form;

        if (battleSystem->ctx->battleMons[i].status2 & STATUS2_TRANSFORM) {
            message.battleMonGenders[i] = battleSystem->ctx->battleMons[i].unk88.transformGender;
            message.battleMonPersonalities[i] = battleSystem->ctx->battleMons[i].unk88.transformPersonality;
        } else {
            message.battleMonGenders[i] = battleSystem->ctx->battleMons[i].gender;
            message.battleMonPersonalities[i] = battleSystem->ctx->battleMons[i].personality;
        }
    }

    SendMessage(battleSystem, 1, battler, &message, sizeof(MonShowMessage));
}

void BattleController_EmitReturnPokemon(BattleSystem *battleSystem, BattleContext *ctx, int battler) {
    MonReturnMessage message;
    int face;
    int form;
    int i;

    if (battleSystem->opponentData[battler]->battlerType & BATTLER_TYPE_SOLO_ENEMY) {
        face = 2;
    } else {
        face = 0;
    }

    form = battleSystem->ctx->battleMons[battler].form;
    message.command = BATTLE_COMMAND_RETURN_POKEMON;

    if (battleSystem->ctx->battleMons[battler].status2 & STATUS2_TRANSFORM) {
        message.yOffset = GetMonPicHeightBySpeciesGenderForm(battleSystem->ctx->battleMons[battler].species, battleSystem->ctx->battleMons[battler].unk88.transformGender, face, form, battleSystem->ctx->battleMons[battler].unk88.transformPersonality);
    } else {
        message.yOffset = GetMonPicHeightBySpeciesGenderForm(battleSystem->ctx->battleMons[battler].species, battleSystem->ctx->battleMons[battler].gender, face, form, battleSystem->ctx->battleMons[battler].personality);
    }

    message.capturedBall = battleSystem->ctx->battleMons[battler].ball;
    message.isSubstitute = (battleSystem->ctx->battleMons[battler].status2 & STATUS2_SUBSTITUTE) != 0;
    message.unk2C = battleSystem->ctx->selectedMonIndex[battler];

    for (i = 0; i < BATTLER_MAX; i++) {
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

    SendMessage(battleSystem, 1, battler, &message, sizeof(MonReturnMessage));
}

void BattleController_EmitOpenCaptureBall(BattleSystem *battleSystem, int battler, int ball) {
    OpenCaptureBallMessage message;
    int face;
    int form;

    if (battleSystem->opponentData[battler]->battlerType & BATTLER_TYPE_SOLO_ENEMY) {
        face = 2;
    } else {
        face = 0;
    }

    form = battleSystem->ctx->battleMons[battler].form;
    message.command = BATTLE_COMMAND_OPEN_CAPTURE_BALL;

    if (battleSystem->ctx->battleMons[battler].status2 & STATUS2_TRANSFORM) {
        message.yOffset = GetMonPicHeightBySpeciesGenderForm(battleSystem->ctx->battleMons[battler].species, battleSystem->ctx->battleMons[battler].unk88.transformGender, face, form, battleSystem->ctx->battleMons[battler].unk88.transformPersonality);
    } else {
        message.yOffset = GetMonPicHeightBySpeciesGenderForm(battleSystem->ctx->battleMons[battler].species, battleSystem->ctx->battleMons[battler].gender, face, form, battleSystem->ctx->battleMons[battler].personality);
    }

    message.ball = ball;
    SendMessage(battleSystem, 1, battler, &message, sizeof(OpenCaptureBallMessage));
}

void BattleController_EmitDeletePokemon(BattleSystem *battleSystem, int battler) {
    int command = BATTLE_COMMAND_DELETE_POKEMON;
    SendMessage(battleSystem, 1, battler, &command, sizeof(int));
}

void BattleController_EmitSetTrainerEncounter(BattleSystem *battleSystem, int battler) {
    TrainerEncounterMessage message;

    message.command = BATTLE_COMMAND_SET_TRAINER_ENCOUNTER;
    message.trainerType = battleSystem->trainers[battler].data.trainerClass;
    message.trainerGender = battleSystem->trainerGender[battler];

    SendMessage(battleSystem, 1, battler, &message, sizeof(TrainerEncounterMessage));
}

void BattleController_EmitTrainerThrowBall(BattleSystem *battleSystem, int battler, int ballTypeIn) {
    TrainerThrowBallMessage message;

    message.command = BATTLE_COMMAND_THROW_TRAINER_BALL;
    message.ballTypeIn = ballTypeIn;
    message.selectedPartySlot = battleSystem->ctx->selectedMonIndex[BattleSystem_GetBattlerIdPartner(battleSystem, battler)];

    SendMessage(battleSystem, 1, battler, &message, sizeof(TrainerThrowBallMessage));
}

void BattleController_EmitTrainerSlideOut(BattleSystem *battleSystem, int battler) {
    int command = BATTLE_COMMAND_SLIDE_TRAINER_OUT;

    SendMessage(battleSystem, 1, battler, &command, sizeof(int));
}

void BattleController_EmitTrainerSlideIn(BattleSystem *battleSystem, int battler, int posIn) {
    TrainerSlideInMessage message;

    message.command = BATTLE_COMMAND_SLIDE_TRAINER_IN;
    message.trainerType = battleSystem->trainers[battler].data.trainerClass;
    message.trainerGender = battleSystem->trainerGender[battler];
    message.posIn = posIn;

    SendMessage(battleSystem, 1, battler, &message, sizeof(TrainerSlideInMessage));
}

void BattleController_EmitSlideHealthBoxIn(BattleSystem *battleSystem, BattleContext *ctx, int battler, int delay) {
    HealthBoxData healthboxData;

    Pokemon *mon = BattleSystem_GetPartyMon(battleSystem, battler, ctx->selectedMonIndex[battler]);
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
        healthboxData.gender = MON_GENDERLESS; // don't show the Gender marker for base-Nidoran forms
    } else {
        healthboxData.gender = ctx->battleMons[battler].gender;
    }

    healthboxData.expFromLastLevel = ctx->battleMons[battler].exp - GetMonExpBySpeciesAndLevel(species, level);
    healthboxData.expToNextLevel = GetMonExpBySpeciesAndLevel(species, level + 1) - GetMonExpBySpeciesAndLevel(species, level);
    healthboxData.speciesCaught = BattleSystem_CheckMonCaught(battleSystem, ctx->battleMons[battler].species);
    healthboxData.numSafariBalls = BattleSystem_GetSafariBallCount(battleSystem);
    healthboxData.delay = delay;

    SendMessage(battleSystem, 1, battler, &healthboxData, sizeof(HealthBoxData));
}

void BattleController_EmitSlideHealthBoxOut(BattleSystem *battleSystem, int battler) {
    int command = BATTLE_COMMAND_SLIDE_HEALTHBOX_OUT;
    SendMessage(battleSystem, 1, battler, &command, sizeof(int));
}

void BattleController_EmitSetCommandSelectionMenu(BattleSystem *battleSystem, BattleContext *ctx, int battler, int partySlot) {
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
    BattleBuffer_Clear(BattleSystem_GetBattleContext(battleSystem), battler);

    battlersCanPickCommandMask = 0;

    for (i = 0; i < BattleSystem_GetMaxBattlers(battleSystem); i++) {
        if (Battler_CanSelectAction(ctx, i) == 0) {
            battlersCanPickCommandMask |= MaskOfFlagNo(i);
        }
    }

    message.command = BATTLE_COMMAND_SET_COMMAND_SELECTION;
    message.partySlot = partySlot;
    message.switchingOrCanPickCommandMask = ctx->switchInFlag | battlersCanPickCommandMask;

    battleType = BattleSystem_GetBattleType(battleSystem);

    if ((battleType & BATTLE_TYPE_DOUBLES) && ((battleType & BATTLE_TYPE_MULTI) == FALSE)) {
        battlerType = battler & 1;
    } else {
        battlerType = battler;
    }

    party = BattleSystem_GetParty(battleSystem, battlerType);
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
        if (BattleSystem_GetFieldSide(battleSystem, battler)) {
            battlerType = BattleSystem_GetBattlerFromBattlerType(battleSystem, BATTLER_TYPE_PLAYER_SIDE_SLOT_1);
        } else {
            battlerType = BattleSystem_GetBattlerFromBattlerType(battleSystem, BATTLER_TYPE_ENEMY_SIDE_SLOT_1);
        }

        party = BattleSystem_GetParty(battleSystem, battlerType);
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

        if (BattleSystem_GetFieldSide(battleSystem, battler)) {
            battlerType = BattleSystem_GetBattlerFromBattlerType(battleSystem, BATTLER_TYPE_PLAYER_SIDE_SLOT_2);
        } else {
            battlerType = BattleSystem_GetBattlerFromBattlerType(battleSystem, BATTLER_TYPE_ENEMY_SIDE_SLOT_2);
        }

        party = BattleSystem_GetParty(battleSystem, battlerType);
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
        battlerType = ov12_0223ABB8(battleSystem, battler, 2);
        party = BattleSystem_GetParty(battleSystem, battlerType);
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

    for (i = 0; i < MAX_MON_MOVES; i++) {
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

    SendMessage(battleSystem, 1, battler, &message, sizeof(CommandSetMessage));
}

void BattleController_EmitSelectedCommand(BattleSystem *battleSystem, int battler, int command) {
    SendMessage(battleSystem, 0, battler, &command, sizeof(int));
}

void BattleController_EmitShowMoveSelectMenu(BattleSystem *battleSystem, BattleContext *ctx, int battler) {
    BattleBuffer_Clear(BattleSystem_GetBattleContext(battleSystem), battler);

    MoveSelectMenuMessage message;
    message.command = BATTLE_COMMAND_SHOW_MOVE_SELECT_MENU;
    message.partySlot = ctx->selectedMonIndex[battler];

    for (int i = 0; i < MAX_MON_MOVES; i++) {
        message.moves[i] = ctx->battleMons[battler].moves[i];
        message.ppCur[i] = ctx->battleMons[battler].movePPCur[i];
        message.ppMax[i] = GetMoveMaxPP(ctx->battleMons[battler].moves[i], ctx->battleMons[battler].movePP[i]);
    }

    message.invalidMoves = StruggleCheck(battleSystem, ctx, battler, 0, -1);

    SendMessage(battleSystem, 1, battler, &message, sizeof(MoveSelectMenuMessage));
}

void BattleController_EmitSelectedMove(BattleSystem *battleSystem, int battler, int command) {
    SendMessage(battleSystem, 0, battler, &command, sizeof(int));
}

void BattleCommand_EmitShowTargetSelectMenu(BattleSystem *battleSystem, BattleContext *ctx, int range, int battler) {
    TargetSelectMenuMessage message;
    int i;
    u32 battleType;

    BattleBuffer_Clear(ctx, battler);

    battleType = BattleSystem_GetBattleType(battleSystem);

    message.command = BATTLE_COMMAND_SHOW_TARGET_SELECT_MENU;
    message.range = range;

    if ((battleType & BATTLE_TYPE_DOUBLES) == FALSE || (battleType & BATTLE_TYPE_MULTI) || ((battleType & BATTLE_TYPE_DOUBLES) && battler >= 2)) {
        message.shouldHidePanel = 1;
    } else {
        message.shouldHidePanel = 0;
    }

    for (i = 0; i < BATTLER_MAX; i++) {
        if (ctx->battleMons[i].hp) {
            message.targetMon[i].hp = ctx->battleMons[i].hp;
            message.targetMon[i].hpMax = ctx->battleMons[i].maxHp;
            message.targetMon[i].hide = 1;

            if ((ctx->battleMons[i].species == SPECIES_NIDORAN_F || ctx->battleMons[i].species == SPECIES_NIDORAN_M)
                && ctx->battleMons[i].hasNickname == FALSE) {
                message.targetMon[i].gender = MON_GENDERLESS;
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

    SendMessage(battleSystem, 1, battler, &message, sizeof(TargetSelectMenuMessage));
}

void BattleController_EmitSelectedTarget(BattleSystem *battleSystem, int battler, int command) {
    SendMessage(battleSystem, 0, battler, &command, sizeof(int));
}

void BattleController_EmitShowBagMenu(BattleSystem *battleSystem, BattleContext *ctx, int battler) {
    BagMenuMessage message;
    int i, j;

    BattleBuffer_Clear(ctx, battler);

    message.command = BATTLE_COMMAND_SHOW_BAG_MENU;

    for (i = 0; i < BATTLER_MAX; i++) {
        message.partySlots[i] = ctx->selectedMonIndex[i];

        for (j = 0; j < PARTY_SIZE; j++) {
            message.partyOrder[i][j] = ctx->unk_312C[i][j];
        }

        message.embargoTurns[i] = ctx->battleMons[i].unk88.embargoFlag;
    }

    if (BattleSystem_GetBattleType(battleSystem) == (BATTLE_TYPE_DOUBLES | BATTLE_TYPE_MULTI | BATTLE_TYPE_AI)) {
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
    } else if (BattleSystem_GetBattleType(battleSystem) == BATTLE_TYPE_NONE) {
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

    SendMessage(battleSystem, 1, battler, &message, sizeof(BagMenuMessage));
}

void BattleController_EmitSelectedBagItem(BattleSystem *battleSystem, int battler, BattleItemUse message) {
    SendMessage(battleSystem, 0, battler, &message, sizeof(BattleItemUse));
}

void BattleController_EmitShowPartyMenu(BattleSystem *battleSystem, BattleContext *ctx, int battler, int listMode, int canSwitch, int doublesSelection) {
    PartyMenuMessage message;
    int i, j;

    BattleBuffer_Clear(ctx, battler);

    message.command = BATTLE_COMMAND_SHOW_PARTY_MENU;
    message.battler = battler;
    message.listMode = listMode;
    message.canSwitch = canSwitch;
    message.doublesSelection = doublesSelection;
    message.battlersSwitchingMask = ctx->switchInFlag;

    for (i = 0; i < BATTLER_MAX; i++) {
        message.selectedPartySlot[i] = ctx->selectedMonIndex[i];

        for (j = 0; j < PARTY_SIZE; j++) {
            message.partyOrder[i][j] = ctx->unk_312C[i][j];
        }
    }

    SendMessage(battleSystem, 1, battler, &message, sizeof(PartyMenuMessage));
}

void BattleController_EmitPartyMenuResult(BattleSystem *battleSystem, int battler, int command) {
    SendMessage(battleSystem, 0, battler, &command, sizeof(int));
}

void BattleController_EmitShowYesNoMenu(BattleSystem *battleSystem, BattleContext *ctx, int battler, int promptMsg, int yesNoType, int move, int nickname) {
    YesNoMenuMessage message;

    BattleBuffer_Clear(ctx, battler);

    message.command = BATTLE_COMMAND_SHOW_YES_NO_MENU;
    message.promptMsg = promptMsg;
    message.yesNoType = yesNoType;
    message.move = move;
    message.nickname = nickname;

    SendMessage(battleSystem, 1, battler, &message, sizeof(YesNoMenuMessage));
}

void BattleController_EmitPrintAttackMessage(BattleSystem *battleSystem, BattleContext *ctx) {
    AttackMsgMessage message;

    message.command = BATTLE_COMMAND_PRINT_ATTACK_MESSAGE;
    message.partySlot = ctx->selectedMonIndex[ctx->battlerIdAttacker];
    message.move = ctx->moveNoCur;

    SendMessage(battleSystem, 1, ctx->battlerIdAttacker, &message, sizeof(AttackMsgMessage));
}

void BattleController_EmitPrintMessage(BattleSystem *battleSystem, BattleContext *ctx, BattleMessage *battleMsg) {
    battleMsg->unk0 = BATTLE_COMMAND_PRINT_MESSAGE;
    SendMessage(battleSystem, 1, ctx->battlerIdAttacker, battleMsg, sizeof(BattleMessage));
}

void BattleController_EmitPlayMoveAnimation(BattleSystem *battleSystem, BattleContext *ctx, u16 move) {
    MoveAnimation animation;

    BattleController_SetMoveAnimation(battleSystem, ctx, &animation, 0, NULL, ctx->battlerIdAttacker, ctx->battlerIdTarget, move);
    SendMessage(battleSystem, 1, ctx->battlerIdAttacker, &animation, sizeof(MoveAnimation));
}

void BattleController_SetMoveAnimationAttackerToDefender(BattleSystem *battleSystem, BattleContext *ctx, u16 move, int attacker, int defender) {
    MoveAnimation animation;

    BattleController_SetMoveAnimation(battleSystem, ctx, &animation, 0, NULL, attacker, defender, move);
    SendMessage(battleSystem, 1, attacker, &animation, sizeof(MoveAnimation));
}

void BattleController_EmitFlickerBattlerSprite(BattleSystem *battleSystem, int battler, u32 unused) {
    int command = BATTLE_COMMAND_FLICKER_BATTLER;
    SendMessage(battleSystem, 1, battler, &command, sizeof(int));
}

void BattleController_EmitUpdateHPGauge(BattleSystem *battleSystem, BattleContext *ctx, int battler) {
    HPGaugeUpdateMessage message;
    Pokemon *pokemon = BattleSystem_GetPartyMon(battleSystem, battler, ctx->selectedMonIndex[battler]);
    int species = GetMonData(pokemon, MON_DATA_SPECIES, NULL);
    int level = GetMonData(pokemon, MON_DATA_LEVEL, NULL);

    message.command = BATTLE_COMMAND_UPDATE_HP_GAUGE;
    message.level = ctx->battleMons[battler].level;
    message.curHP = ctx->battleMons[battler].hp;
    message.maxHP = ctx->battleMons[battler].maxHp;
    message.hpCalcTemp = ctx->hpCalc;

    if ((ctx->battleMons[battler].species == SPECIES_NIDORAN_F || ctx->battleMons[battler].species == SPECIES_NIDORAN_M)
        && ctx->battleMons[battler].hasNickname == FALSE) {
        message.gender = MON_GENDERLESS;
    } else {
        message.gender = ctx->battleMons[battler].gender;
    }

    message.exp = ctx->battleMons[battler].exp - GetMonExpBySpeciesAndLevel(species, level);
    message.expToNextLevel = GetMonExpBySpeciesAndLevel(species, level + 1) - GetMonExpBySpeciesAndLevel(species, level);

    SendMessage(battleSystem, 1, battler, &message, sizeof(HPGaugeUpdateMessage));
}

void BattleController_EmitUpdateExpGauge(BattleSystem *battleSystem, BattleContext *ctx, int battler, int curExp) {
    ExpGaugeUpdateMessage message;
    Pokemon *pokemon = BattleSystem_GetPartyMon(battleSystem, battler, ctx->selectedMonIndex[battler]);
    int species = GetMonData(pokemon, MON_DATA_SPECIES, NULL);
    int level = GetMonData(pokemon, MON_DATA_LEVEL, NULL);

    message.command = BATTLE_COMMAND_UPDATE_EXP_GAUGE;
    message.curExp = curExp;
    message.gainedExp = ctx->battleMons[battler].exp - GetMonExpBySpeciesAndLevel(species, level);
    message.expToNextLevel = GetMonExpBySpeciesAndLevel(species, level + 1) - GetMonExpBySpeciesAndLevel(species, level);

    SendMessage(battleSystem, 1, battler, &message, sizeof(ExpGaugeUpdateMessage));
}

void BattleController_EmitPlayFaintingSequence(BattleSystem *battleSystem, BattleContext *ctx, int battler) {
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

    for (i = 0; i < BATTLER_MAX; i++) {
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

    SendMessage(battleSystem, 1, battler, &message, sizeof(FaintingSequenceMessage));
}

void BattleController_EmitPlaySound(BattleSystem *battleSystem, BattleContext *ctx, int sdatID, int battler) {
    PlaySoundMessage message;

    message.command = BATTLE_COMMAND_PLAY_SOUND;
    message.sdatID = sdatID;

    SendMessage(battleSystem, 1, battler, &message, sizeof(PlaySoundMessage));
}

void BattleController_EmitFadeOut(BattleSystem *battleSystem, BattleContext *ctx) {
    int command = BATTLE_COMMAND_FADE_OUT;

    SendMessage(battleSystem, 1, 0, &command, sizeof(int));
}

void BattleController_EmitToggleVanishMessage(BattleSystem *battleSystem, int battler, int toggle) {
    ToggleVanishMessage message;
    int i;

    message.command = BATTLE_COMMAND_TOGGLE_VANISH;
    message.toggle = toggle;
    message.isSubstitute = (battleSystem->ctx->battleMons[battler].status2 & STATUS2_SUBSTITUTE) != 0;

    for (i = 0; i < BATTLER_MAX; i++) {
        message.species[i] = battleSystem->ctx->battleMons[i].species;
        message.isShiny[i] = battleSystem->ctx->battleMons[i].shiny;
        message.formNum[i] = battleSystem->ctx->battleMons[i].form;

        if (battleSystem->ctx->battleMons[i].status2 & STATUS2_TRANSFORM) {
            message.gender[i] = battleSystem->ctx->battleMons[i].unk88.transformGender;
            message.personality[i] = battleSystem->ctx->battleMons[i].unk88.transformPersonality;
        } else {
            message.gender[i] = battleSystem->ctx->battleMons[i].gender;
            message.personality[i] = battleSystem->ctx->battleMons[i].personality;
        }
    }

    SendMessage(battleSystem, 1, battler, &message, sizeof(ToggleVanishMessage));
}

void BattleController_EmitSetStatusIcon(BattleSystem *battleSystem, int battler, int status) {
    SetStatusIconMessage message;

    message.command = BATTLE_COMMAND_SET_STATUS_ICON;
    message.status = status;

    SendMessage(battleSystem, 1, battler, &message, sizeof(SetStatusIconMessage));
}

void BattleController_EmitPrintTrainerMessage(BattleSystem *battleSystem, int battler, int msg) {
    TrainerMsgMessage message;

    message.command = BATTLE_COMMAND_PRINT_TRAINER_MESSAGE;
    message.msg = msg;

    SendMessage(battleSystem, 1, battler, &message, sizeof(TrainerMsgMessage));
}

void BattleController_EmitPlayStatusEffect(BattleSystem *battleSystem, BattleContext *ctx, int battler, int secondaryAnimID) {
    MoveAnimation animation;

    BattleController_SetMoveAnimation(battleSystem, ctx, &animation, 1, secondaryAnimID, battler, battler, NULL);
    SendMessage(battleSystem, 1, battler, &animation, sizeof(MoveAnimation));
}

void BattleController_EmitPlayStatusEffectAttackerToDefender(BattleSystem *battleSystem, BattleContext *ctx, int attacker, int defender, int secondaryAnimID) {
    MoveAnimation animation;

    BattleController_SetMoveAnimation(battleSystem, ctx, &animation, 1, secondaryAnimID, attacker, defender, NULL);
    SendMessage(battleSystem, 1, attacker, &animation, sizeof(MoveAnimation));
}

void BattleController_EmitPrintReturnMessage(BattleSystem *battleSystem, BattleContext *ctx, int battler, int partySlot) {
    ReturnMsgMessage message;

    message.command = BATTLE_COMMAND_PRINT_RETURN_MESSAGE;
    message.partySlot = partySlot;
    message.hpPercent = (ctx->hpTemp - ctx->battleMons[1].hp) * 100 / ctx->hpTemp;

    SendMessage(battleSystem, 1, battler, &message, sizeof(ReturnMsgMessage));
}

void BattleController_EmitPrintSendOutMessage(BattleSystem *battleSystem, BattleContext *ctx, int battler, int partySlot) {
    SendOutMsgMessage message;

    message.command = BATTLE_COMMAND_PRINT_SEND_OUT_MESSAGE;
    message.partySlot = partySlot;

    if (ctx->battleMons[1].hp == 0) {
        message.hpPercent = 1000;
    } else {
        message.hpPercent = ctx->battleMons[1].hp * 1000 / ctx->battleMons[1].maxHp;
    }

    SendMessage(battleSystem, 1, battler, &message, sizeof(SendOutMsgMessage));
}

void BattleController_EmitPrintEncounterMessage(BattleSystem *battleSystem, BattleContext *ctx, int battler) {
    int command = BATTLE_COMMAND_PRINT_ENCOUNTER_MESSAGE;

    SendMessage(battleSystem, 1, battler, &command, sizeof(int));
}

void BattleController_EmitPrintLeadMonMessage(BattleSystem *battleSystem, BattleContext *ctx, int battler) {
    LeadMonMsgMessage message;
    int i;

    message.command = BATTLE_COMMAND_PRINT_LEAD_MON_MESSAGE;

    for (i = 0; i < BattleSystem_GetMaxBattlers(battleSystem); i++) {
        message.partySlot[i] = ctx->selectedMonIndex[i];
    }

    SendMessage(battleSystem, 1, battler, &message, sizeof(LeadMonMsgMessage));
}

void BattleController_EmitPlayLevelUpAnimation(BattleSystem *battleSystem, int battler) {
    int command = BATTLE_COMMAND_PLAY_LEVEL_UP_ANIMATION;

    SendMessage(battleSystem, 1, battler, &command, sizeof(int));
}

void BattleController_EmitSetAlertMessage(BattleSystem *battleSystem, int battler, BattleMessage msg) {
    BattleBuffer_Clear(BattleSystem_GetBattleContext(battleSystem), battler);

    AlertMsgMessage message;
    message.command = BATTLE_COMMAND_SET_ALERT_MESSAGE;
    message.msg = msg;

    SendMessage(battleSystem, 1, battler, &message, sizeof(AlertMsgMessage));
}

void BattleController_EmitAlertMessageAck(BattleSystem *battleSystem, int battler) {
    int command = BATTLE_COMMAND_SETUP_UI;
    SendMessage(battleSystem, 0, battler, &command, sizeof(int));
}

void BattleController_EmitRefreshHPGauge(BattleSystem *battleSystem, BattleContext *ctx, int battler) {
    RefreshHPGaugeMessage message;
    Pokemon *pokemon;
    int species;
    int level;

    pokemon = BattleSystem_GetPartyMon(battleSystem, battler, ctx->selectedMonIndex[battler]);
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
        message.gender = MON_GENDERLESS;
    } else {
        message.gender = ctx->battleMons[battler].gender;
    }

    message.curExp = ctx->battleMons[battler].exp - GetMonExpBySpeciesAndLevel(species, level);
    message.maxExp = GetMonExpBySpeciesAndLevel(species, level + 1) - GetMonExpBySpeciesAndLevel(species, level);
    message.caughtSpecies = BattleSystem_CheckMonCaught(battleSystem, ctx->battleMons[battler].species);
    message.numSafariBalls = BattleSystem_GetSafariBallCount(battleSystem);

    SendMessage(battleSystem, 1, battler, &message, sizeof(RefreshHPGaugeMessage));
}

void BattleController_EmitUpdatePartyMon(BattleSystem *battleSystem, BattleContext *ctx, int battler) {
    UpdatePartyMonMessage message;
    int i;

    message.command = BATTLE_COMMAND_UPDATE_PARTY_MON;
    message.partySlot = ctx->selectedMonIndex[battler];
    message.mimickedMoveSlot = ctx->battleMons[battler].unk88.mimicedMoveIndex;
    message.curHP = ctx->battleMons[battler].hp;
    message.heldItem = ctx->battleMons[battler].item;
    message.knockedOffItemsMask = ctx->fieldSideConditionData[BattleSystem_GetFieldSide(battleSystem, battler)].battlerBitKnockedOffItem;
    message.formNum = ctx->battleMons[battler].form;
    message.ability = ctx->battleMons[battler].ability;

    for (i = 0; i < MAX_MON_MOVES; i++) {
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

    SendMessage(battleSystem, 1, battler, &message, sizeof(UpdatePartyMonMessage));
}

void BattleController_EmitSlideInBackground(BattleSystem *battleSystem, int battler) {
    int command = BATTLE_COMMAND_SLIDE_IN_BACKGROUND;
    SendMessage(battleSystem, 1, battler, &command, sizeof(int));
}

void BattleController_EmitStopGaugeAnimation(BattleSystem *battleSystem, int battler) {
    int command = BATTLE_COMMAND_STOP_GAUGE_ANIMATION;
    SendMessage(battleSystem, 1, battler, &command, sizeof(int));
}

void BattleController_EmitRefreshPartyStatus(BattleSystem *battleSystem, BattleContext *ctx, int battler, int move) {
    RefreshPartyStatusMessage message;

    message.command = BATTLE_COMMAND_REFRESH_PARTY_STATUS;
    message.move = move;
    message.ability = ctx->battleMons[battler].ability;

    SendMessage(battleSystem, 1, battler, &message, sizeof(RefreshPartyStatusMessage));
}

void BattleController_EmitForgetMove(BattleSystem *battleSystem, int battler, int move, int slot) {
    ForgetMoveMessage message;

    BattleBuffer_Clear(BattleSystem_GetBattleContext(battleSystem), battler);

    message.command = BATTLE_COMMAND_FORGET_MOVE;
    message.move = move;
    message.slot = slot;

    SendMessage(battleSystem, 1, battler, &message, sizeof(RefreshPartyStatusMessage));
}

void BattleController_EmitPlayMosaicAnimation(BattleSystem *battleSystem, int battler, int intensity, int wait) {
    MosaicSetMessage message;

    message.command = BATTLE_COMMAND_SET_MOSAIC;
    message.intensity = intensity;
    message.wait = wait;

    SendMessage(battleSystem, 1, battler, &message, sizeof(MosaicSetMessage));
}

void BattleController_EmitChangeForm(BattleSystem *battleSystem, int battler) {
    MonChangeFormMessage message;

    message.command = BATTLE_COMMAND_CHANGE_FORM;
    message.species = battleSystem->ctx->battleMons[battler].species;
    message.isShiny = battleSystem->ctx->battleMons[battler].shiny;

    if (battleSystem->ctx->battleMons[battler].status2 & STATUS2_TRANSFORM) {
        message.gender = battleSystem->ctx->battleMons[battler].unk88.transformGender;
        message.personality = battleSystem->ctx->battleMons[battler].unk88.transformPersonality;
    } else {
        message.gender = battleSystem->ctx->battleMons[battler].gender;
        message.personality = battleSystem->ctx->battleMons[battler].personality;
    }

    message.formNum = battleSystem->ctx->battleMons[battler].form;

    SendMessage(battleSystem, 1, battler, &message, sizeof(MonChangeFormMessage));
}

void BattleController_EmitUpdateBackground(BattleSystem *battleSystem, int battler) {
    int command = BATTLE_COMMAND_UPDATE_BG;
    SendMessage(battleSystem, 1, battler, &command, sizeof(int));
}

void BattleController_EmitClearTouchScreen(BattleSystem *battleSystem, int battler) {
    int command = BATTLE_COMMAND_CLEAR_TOUCH_SCREEN;
    SendMessage(battleSystem, 1, battler, &command, sizeof(int));
}

void BattleController_EmitShowInitialPartyGauge(BattleSystem *battleSystem, int battler) {
    PartyGaugeData gauge;
    PartyGaugeData_New(battleSystem, battleSystem->ctx, &gauge, BATTLE_COMMAND_SHOW_BATTLE_START_PARTY_GAUGE, battler);
    SendMessage(battleSystem, 1, battler, &gauge, sizeof(PartyGaugeData));
}

void BattleController_EmitHideInitialPartyGauge(BattleSystem *battleSystem, int battler) {
    PartyGaugeData gauge;
    PartyGaugeData_New(battleSystem, battleSystem->ctx, &gauge, BATTLE_COMMAND_HIDE_BATTLE_START_PARTY_GAUGE, battler);
    SendMessage(battleSystem, 1, battler, &gauge, sizeof(PartyGaugeData));
}

void BattleController_EmitShowPartyGauge(BattleSystem *battleSystem, int battler) {
    PartyGaugeData gauge;
    PartyGaugeData_New(battleSystem, battleSystem->ctx, &gauge, BATTLE_COMMAND_SHOW_PARTY_GAUGE, battler);
    SendMessage(battleSystem, 1, battler, &gauge, sizeof(PartyGaugeData));
}

void BattleController_EmitHidePartyGauge(BattleSystem *battleSystem, int battler) {
    PartyGaugeData gauge;
    PartyGaugeData_New(battleSystem, battleSystem->ctx, &gauge, BATTLE_COMMAND_HIDE_PARTY_GAUGE, battler);
    SendMessage(battleSystem, 1, battler, &gauge, sizeof(PartyGaugeData));
}

void BattleController_EmitLoadPartyGaugeGraphics(BattleSystem *battleSystem) {
    int command = BATTLE_COMMAND_LOAD_PARTY_GAUGE_GRAPHICS;
    SendMessage(battleSystem, 1, NULL, &command, sizeof(int));
}

void BattleController_EmitFreePartyGaugeGraphics(BattleSystem *battleSystem) {
    int command = BATTLE_COMMAND_FREE_PARTY_GAUGE_GRAPHICS;
    SendMessage(battleSystem, 1, NULL, &command, sizeof(int));
}

void BattleController_EmitIncrementGameStat(BattleSystem *battleSystem, int battler, int battlerType, int record) {
    RecordIncrementMessage message;

    message.command = BATTLE_COMMAND_INCREMENT_RECORD;
    message.battlerType = battlerType;
    message.record = record;

    SendMessage(battleSystem, 1, battler, &message, sizeof(RecordIncrementMessage));
}

void BattleController_EmitPrintLinkWaitMessage(BattleSystem *battleSystem, int battler) {
    LinkWaitMsgMessage message;
    u32 battleType = BattleSystem_GetBattleType(battleSystem);

    message.command = BATTLE_COMMAND_PRINT_LINK_WAIT_MESSAGE;
    message.recordedInputCount = 0;

    if ((battleType & BATTLE_TYPE_LINK) && sub_0202FC48() == TRUE && (battleSystem->battleSpecial & BATTLE_STATUS_HIT_DIVE) == FALSE) {
        message.recordedInputCount = ov12_0223BE68(battleSystem, &message.recordedInputs[0]);
        GF_ASSERT(message.recordedInputCount < 28);
        SendMessage(battleSystem, 1, battler, &message, sizeof(LinkWaitMsgMessage));
    }
}

void BattleController_EmitRestoreSprite(BattleSystem *battleSystem, BattleContext *ctx, int battler) {
    int i;
    MoveAnimation animation;

    animation.command = BATTLE_COMMAND_RESTORE_SPRITE;

    for (i = 0; i < BATTLER_MAX; i++) {
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

    SendMessage(battleSystem, 1, battler, &animation, sizeof(MoveAnimation));
}

void BattleController_EmitSpriteToOAM(BattleSystem *battleSystem, int battler) {
    int command = BATTLE_COMMAND_SPRITE_TO_OAM;
    SendMessage(battleSystem, 1, battler, &command, sizeof(int));
}

void BattleController_EmitOAMToSprite(BattleSystem *battleSystem, int battler) {
    int command = BATTLE_COMMAND_OAM_TO_SPRITE;
    SendMessage(battleSystem, 1, battler, &command, sizeof(int));
}

void BattleController_EmitPrintResultMessage(BattleSystem *battleSystem) {
    int command = BATTLE_COMMAND_PRINT_RESULT_MESSAGE;
    SendMessage(battleSystem, 1, 0, &command, sizeof(int));
}

void BattleController_EmitPrintEscapeMessage(BattleSystem *battleSystem, BattleContext *ctx) {
    EscapeMsgMessage message;
    int i;
    u32 battleType = BattleSystem_GetBattleType(battleSystem);

    message.command = BATTLE_COMMAND_PRINT_ESCAPE_MESSAGE;
    message.escaperBitmask = 0;
    message.recordedInputCount = 0;

    for (i = 0; i < BattleSystem_GetMaxBattlers(battleSystem); i++) {
        if (ctx->playerActions[i].command == BATTLE_COMMAND_SHOW_TARGET_SELECT_MENU) {
            message.escaperBitmask |= MaskOfFlagNo(i);
        }
    }

    if ((battleType & BATTLE_TYPE_LINK) && sub_0202FC48() == TRUE && (battleSystem->battleSpecial & BATTLE_STATUS_HIT_DIVE) == FALSE) {
        message.recordedInputCount = ov12_0223BE68(battleSystem, &message.recordedInputs[0]);
        GF_ASSERT(message.recordedInputCount < 28);
    }

    SendMessage(battleSystem, 1, 0, &message, sizeof(EscapeMsgMessage));
}

void BattleController_EmitPrintForefitMessage(BattleSystem *battleSystem) {
    ForfeitMsgMessage message;
    u32 battleType = BattleSystem_GetBattleType(battleSystem);

    message.command = BATTLE_COMMAND_PRINT_FORFEIT_MESSAGE;
    message.recordedInputCount = 0;

    if ((battleType & BATTLE_TYPE_LINK) && sub_0202FC48() == TRUE && (battleSystem->battleSpecial & BATTLE_STATUS_HIT_DIVE) == FALSE) {
        message.recordedInputCount = ov12_0223BE68(battleSystem, &message.recordedInputs[0]);
        GF_ASSERT(message.recordedInputCount < 28);
    }

    SendMessage(battleSystem, 1, 0, &message, sizeof(ForfeitMsgMessage));
}

void BattleController_EmitRefreshSprite(BattleSystem *battleSystem, BattleContext *ctx, int battler) {
    int i;
    MoveAnimation animation;

    animation.command = BATTLE_COMMAND_REFRESH_SPRITE;

    for (i = 0; i < BATTLER_MAX; i++) {
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

    SendMessage(battleSystem, 1, battler, &animation, sizeof(MoveAnimation));
}

void BattleController_EmitPlayMoveHitSoundEffect(BattleSystem *battleSystem, BattleContext *ctx, int battler) {
    MoveHitSoundMessage message;

    message.command = BATTLE_COMMAND_FLY_MOVE_HIT_SOUND_EFFECT;

    if (ctx->moveStatusFlag & MOVE_STATUS_SUPER_EFFECTIVE) {
        message.effectiveness = 2;
    } else if (ctx->moveStatusFlag & MOVE_STATUS_NOT_VERY_EFFECTIVE) {
        message.effectiveness = 1;
    } else {
        message.effectiveness = 0;
    }

    SendMessage(battleSystem, 1, battler, &message, sizeof(MoveHitSoundMessage));
}

void BattleController_EmitPlayMusic(BattleSystem *battleSystem, int battler, int bgmID) {
    MusicPlayMessage message;

    message.command = BATTLE_COMMAND_PLAY_MUSIC;
    message.bgmID = bgmID;

    SendMessage(battleSystem, 1, battler, &message, sizeof(MusicPlayMessage));
}

void BattleController_EmitSetBattleResults(BattleSystem *battleSystem) {
    ResultSubmitMessage message;
    u32 battleType = BattleSystem_GetBattleType(battleSystem);

    message.command = BATTLE_COMMAND_SET_BATTLE_RESULT;
    message.resultMask = BattleSystem_GetBattleOutcomeFlags(battleSystem);
    message.recordedInputCount = 0;

    if ((battleType & BATTLE_TYPE_LINK) && sub_0202FC48() == TRUE && (battleSystem->battleSpecial & BATTLE_STATUS_HIT_DIVE) == FALSE) {
        message.recordedInputCount = ov12_0223BE68(battleSystem, &message.recordedInputs[0]);
        GF_ASSERT(message.recordedInputCount <= 28);
    }

    SendMessage(battleSystem, 1, 0, &message, sizeof(ResultSubmitMessage));
}

void BattleController_EmitClearMessageBox(BattleSystem *battleSystem) {
    int command = BATTLE_COMMAND_CLEAR_MESSAGE_BOX;
    SendMessage(battleSystem, 1, 0, &command, sizeof(int));
}

void BattleController_EmitClearCommand(BattleSystem *battleSystem, int battler, int command) {
    CommandClearMsg message;

    message.command = command;
    message.netID = sub_0203769C();

    SendMessage(battleSystem, 2, battler, &message, sizeof(CommandClearMsg));
}

BOOL BattleController_RecvCommMessage(BattleSystem *battleSystem, void *data) {
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
            battleSystem->ctx->battleBuffer[battler][i] = src[i];
        }
    } else if (recipient == 1) {
        if (battleSystem->opponentData[battler]->unk1A8 == 0) {
            battleSystem->opponentData[battler]->unk1A8 = 1;

            for (i = 0; i < size; i++) {
                battleSystem->opponentData[battler]->unk94[i] = src[i];
            }
        } else {
            success = FALSE;
        }
    } else if (recipient == 2) {
        int val = src[0];
        int id = src[1];

        if (BattleSystem_IsInitialized(battleSystem)) {
            ov12_0224ED00(battleSystem->ctx, id, battler, val);
        }
    }

    return success;
}

void BattleController_SetMoveAnimation(BattleSystem *battleSystem, BattleContext *ctx, MoveAnimation *animation, int animMode, int secondaryAnimID, int attacker, int defender, u16 move) {
    int i;

    animation->command = BATTLE_COMMAND_SET_MOVE_ANIMATION;
    animation->move = move;
    animation->attacker = attacker;
    animation->defender = defender;
    animation->animMode = animMode;
    animation->secondaryAnimID = secondaryAnimID;
    animation->terrain = BattleSystem_GetTerrainId(battleSystem);
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

        if (CheckAbilityActive(battleSystem, ctx, 8, 0, ABILITY_CLOUD_NINE) == 0
            && CheckAbilityActive(battleSystem, ctx, 8, 0, ABILITY_AIR_LOCK) == 0) {
            animation->fieldConditions = ctx->fieldCondition;
        } else {
            animation->fieldConditions = 0;
        }

        animation->effectChance = ctx->unk_2164;
        animation->isSubstitute = (ctx->battleMons[attacker].status2 & STATUS2_SUBSTITUTE) != 0;
        animation->isTransformed = (ctx->battleMons[attacker].status2 & STATUS2_TRANSFORM) != 0;

        for (i = 0; i < BATTLER_MAX; i++) {
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
            u32 var = ov12_0223C140(battleSystem, attacker);
            if (var != 255 && var == ctx->selectedMonIndex[attacker]) {
                animation->unk_0E_2 = 1;
            }
        }

        if (defender != 255) {
            u32 var = ov12_0223C140(battleSystem, defender);
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

static void PartyGaugeData_New(BattleSystem *battleSystem, BattleContext *ctx, PartyGaugeData *partyGauge, int command, int battler) {
    MI_CpuClearFast(partyGauge, sizeof(PartyGaugeData));
    u32 battleType = BattleSystem_GetBattleType(battleSystem);
    partyGauge->command = command;

    int battler1, battler2;
    Party *party;

    if ((battleType & (BATTLE_TYPE_LINK | BATTLE_TYPE_MULTI)) == (BATTLE_TYPE_LINK | BATTLE_TYPE_MULTI)                                                           // 2vs2 link battle
        || ((battleType & BATTLE_TYPE_TAG) && BattleSystem_GetFieldSide(battleSystem, battler))                                                                   // either of the two opponents on the enemy side
        || ((battleType == (BATTLE_TYPE_TRAINER | BATTLE_TYPE_DOUBLES | BATTLE_TYPE_MULTI | BATTLE_TYPE_AI)) && BattleSystem_GetFieldSide(battleSystem, battler)) // either of the two opponents on the enemy side
        || battleType == (BATTLE_TYPE_FRONTIER | BATTLE_TYPE_TRAINER | BATTLE_TYPE_DOUBLES | BATTLE_TYPE_MULTI | BATTLE_TYPE_AI)) {                               // frontier, AI partner
        if (ov12_0223AB0C(battleSystem, battler) == BATTLER_PLAYER2
            || ov12_0223AB0C(battleSystem, battler) == BATTLER_ENEMY2) {
            battler1 = battler;
            battler2 = BattleSystem_GetBattlerIdPartner(battleSystem, battler);
        } else {
            battler1 = BattleSystem_GetBattlerIdPartner(battleSystem, battler);
            battler2 = battler;
        }

        party = BattleSystem_GetParty(battleSystem, battler1);
        PartyGaugeData_Fill(ctx, partyGauge, party, battler1, 0);

        party = BattleSystem_GetParty(battleSystem, battler2);
        PartyGaugeData_Fill(ctx, partyGauge, party, battler2, 3);
    } else {
        if ((battleType & BATTLE_TYPE_DOUBLES) && (battleType & BATTLE_TYPE_MULTI) == FALSE) {
            battler = battler & 1;
        } else {
            battler = battler;
        }

        party = BattleSystem_GetParty(battleSystem, battler);
        PartyGaugeData_Fill(ctx, partyGauge, party, battler, 0);
    }
}
