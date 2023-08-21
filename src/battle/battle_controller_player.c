#include "global.h"
#include "battle/battle_controller_player.h"
#include "battle/battle_controller.h"
#include "battle/battle_controller_opponent.h"
#include "battle/battle_system.h"
#include "battle/overlay_12_0224E4FC.h"
#include "heap.h"
#include "constants/abilities.h"
#include "constants/items.h"
#include "msgdata/msg/msg_0197.h"

extern ControllerFunction sPlayerBattleCommands[];

BattleContext *BattleContext_New(BattleSystem *bsys) {
    BattleContext *ctx = (BattleContext *) AllocFromHeap(HEAP_ID_BATTLE, sizeof(BattleContext));
    MIi_CpuClearFast(0, (u32 *)ctx, sizeof(BattleContext));
    
    BattleContext_Init(ctx);
    ov12_02251038(bsys, ctx);
    ov12_0224E384(bsys, ctx);
    LoadMoveTbl(ctx->unk_334.moveData);
    ctx->unk_334.itemData = LoadAllItemData(HEAP_ID_BATTLE);
    
    return ctx;
}

BOOL BattleMain(BattleSystem *bsys, BattleContext *ctx) {
    if (!ctx->battleEndFlag) {
        if (BattleSystem_GetBattleOutcomeFlags(bsys) && !(BattleSystem_GetBattleOutcomeFlags(bsys) & 0x40)) {
            ctx->command = CONTROLLER_COMMAND_42;
        }
    }
    
    sPlayerBattleCommands[ctx->command](bsys, ctx);
    if (ctx->command == CONTROLLER_COMMAND_45) {
        return TRUE;
    }
    return FALSE;
}

void BattleContext_Delete(BattleContext *ctx) {
    FreeToHeap(ctx->unk_334.itemData);
    FreeToHeap(ctx);
}

void BattleSystem_CheckMoveHitEffect(BattleSystem *bsys, BattleContext *ctx, int battlerIdAttacker, int battlerIdTarget, int moveNo) {
    BattleSystem_CheckMoveHit(bsys, ctx, battlerIdAttacker, battlerIdTarget, moveNo);
    BattleSystem_CheckMoveEffect(bsys, ctx, battlerIdAttacker, battlerIdTarget, moveNo);
}

//static
void BattleControllerPlayer_GetBattleMon(BattleSystem *bsys, BattleContext *ctx) {
    int battlerId;
    int maxBattlers = BattleSystem_GetMaxBattlers(bsys);
    
    for (battlerId = 0; battlerId < maxBattlers; battlerId++) {
        BattleSystem_GetBattleMon(bsys, ctx, battlerId, ctx->selectedMonIndex[battlerId]);
    }
    
    ctx->hpTemp = ctx->battleMons[1].hp;
    ctx->command = CONTROLLER_COMMAND_START_ENCOUNTER;
}

//static
void BattleControllerPlayer_StartEncounter(BattleSystem *bsys, BattleContext *ctx) {
    ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, 0);
    ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
    ctx->commandNext = CONTROLLER_COMMAND_TRAINER_MESSAGE;
}

//static
void BattleControllerPlayer_TrainerMessage(BattleSystem *bsys, BattleContext *ctx) {
    if (CheckTrainerMessage(bsys, ctx)) {
        ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, 41);
        ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
        ctx->commandNext = CONTROLLER_COMMAND_SEND_OUT;
    } else {
        ctx->command = CONTROLLER_COMMAND_SEND_OUT;
    }
    
    SortMonsBySpeed(bsys, ctx);
}

//static
void BattleControllerPlayer_PokemonAppear(BattleSystem *bsys, BattleContext *ctx) {
    int script = TryAbilityOnEntry(bsys, ctx);
    
    if (script) {
        ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, script);
        ctx->commandNext = ctx->command;
        ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
    } else {
        SortMonsBySpeed(bsys, ctx);
        ov12_0223C0C4(bsys);
        ctx->command = CONTROLLER_COMMAND_SELECTION_SCREEN_INIT;
    }
}

//static
void BattleControllerPlayer_SelectionScreenInit(BattleSystem *bsys, BattleContext *ctx) {
    int battlerId;
    int maxBattlers = BattleSystem_GetMaxBattlers(bsys);
    
    for (battlerId = 0; battlerId < maxBattlers; battlerId++) {
        ctx->unk_0[battlerId] = 0;
        ctx->battleMons[battlerId].moveEffectFlagsTemp = ctx->battleMons[battlerId].moveEffectFlags;
        ctx->unk_314C[battlerId] = 0;
    }
    
    ov12_0223BB64(bsys, 0);
    ov12_02237ED0(bsys, 1);
    
    ctx->command = CONTROLLER_COMMAND_SELECTION_SCREEN_INPUT;
}

typedef enum BattleSelectState {
    SSI_STATE_0,
    SSI_STATE_1,
    SSI_STATE_2,
    SSI_STATE_3,
    SSI_STATE_4,
    SSI_STATE_5,
    SSI_STATE_6,
    SSI_STATE_7,
    SSI_STATE_8,
    SSI_STATE_9,
    SSI_STATE_10,
    SSI_STATE_11,
    SSI_STATE_12,
    SSI_STATE_13,
    SSI_STATE_14,
    SSI_STATE_15,
    SSI_STATE_NO_MOVES,
    SSI_STATE_END
} BattleSelectState;

//static
void BattleControllerPlayer_SelectionScreenInput(BattleSystem *bsys, BattleContext *ctx) {
    int battlerId;
    int battlersMax; 
    int var;
    s32 battleType;
    BattleMessage msg;

    battlersMax = BattleSystem_GetMaxBattlers(bsys);
    battleType = BattleSystem_GetBattleType(bsys);
    
    var = 0;
    
    for (battlerId = 0; battlerId < battlersMax; battlerId++) {
        switch (ctx->unk_0[battlerId]) {
        case SSI_STATE_0:
            if ((battleType & BATTLE_TYPE_DOUBLES) && !(battleType & BATTLE_TYPE_MULTI) && ((battlerId == BATTLER_PLAYER2) && (ctx->unk_0[0] != 14) || (battlerId == BATTLER_ENEMY2) && (ctx->unk_0[1] != 14))) {
                break;
            }
            if (ctx->unk_3108 & MaskOfFlagNo(battlerId)) {
                ctx->unk_0[battlerId] = SSI_STATE_13;
                ctx->unk_21A8[battlerId][0] = 40;
                break;
            } else if (Battler_CanSelectAction(ctx, battlerId) == 0) {
                ctx->turnData[battlerId].unk0_1 = 1;
                ctx->unk_0[battlerId] = SSI_STATE_13;
                ctx->unk_21A8[battlerId][0] = 13;
                break;
            }

            if ((ov12_02261264(BattleSystem_GetOpponentData(bsys, battlerId)) == 1) || (ctx->totalTurns)) {
                ov12_02262B80(bsys, ctx, battlerId, ctx->selectedMonIndex[battlerId]);
                ctx->unk_0[battlerId] = SSI_STATE_1;
            } else {
                ctx->unk_0[battlerId] = SSI_STATE_2;
            }
            break;
        case SSI_STATE_2:
            int battlerIdCheck;

            for (battlerIdCheck = 0; battlerIdCheck < battlersMax; battlerIdCheck++) {
                if (battlerIdCheck == battlerId) {
                    continue;
                }

                if (ov12_02261264(BattleSystem_GetOpponentData(bsys, battlerIdCheck)) != 0x1) {
                    continue;
                }

                if (ctx->unk_0[battlerIdCheck] != SSI_STATE_14) {
                    break;
                }
            }

            if (battlerIdCheck == battlersMax) {
                ov12_02262B80(bsys, ctx, battlerId, ctx->selectedMonIndex[battlerId]);
                ctx->unk_0[battlerId] = SSI_STATE_1;
            } else {
                break;
            }
        //fallthrough
        case SSI_STATE_1:
            if (ov12_0225682C(ctx, battlerId)) {
                ctx->unk_21A8[battlerId][3] = ctx->unk_2300[battlerId][0];

                if (battleType & BATTLE_TYPE_PAL_PARK) {
                    switch (ov12_0225682C(ctx, battlerId)) {
                    case 1:
                        ctx->unk_0[battlerId] = SSI_STATE_END;
                        ctx->unk_4[battlerId] = SSI_STATE_13;
                        ctx->unk_21A8[battlerId][0] = 17;
                        break;
                    case 4:
                        ctx->unk_0[battlerId] = SSI_STATE_END;
                        ctx->unk_4[battlerId] = SSI_STATE_13;
                        ctx->unk_21A8[battlerId][0] = 16;
                        break;
                    }
                } else if (battleType & BATTLE_TYPE_SAFARI) {
                    switch (ov12_0225682C(ctx, battlerId)) {
                    case 1:
                        ctx->unk_0[battlerId] = SSI_STATE_END;
                        ctx->unk_4[battlerId] = SSI_STATE_13;
                        ctx->unk_21A8[battlerId][0] = 17;
                        break;
                    case 2:
                        ctx->unk_0[battlerId] = SSI_STATE_END;
                        ctx->unk_4[battlerId] = SSI_STATE_13;
                        ctx->unk_21A8[battlerId][0] = 18;
                        break;
                    case 3:
                        ctx->unk_0[battlerId] = SSI_STATE_END;
                        ctx->unk_4[battlerId] = SSI_STATE_13;
                        ctx->unk_21A8[battlerId][0] = 19;
                        break;
                    case 4:
                        ctx->unk_0[battlerId] = SSI_STATE_END;
                        ctx->unk_4[battlerId] = SSI_STATE_13;
                        ctx->unk_21A8[battlerId][0] = 16;
                        break;
                    case 5:
                        ctx->unk_0[battlerId] = SSI_STATE_END;
                        ctx->unk_0[battlerId] = SSI_STATE_13;
                        ctx->unk_21A8[battlerId][0] = 20;
                        break;
                    }
                } else {
                    if (ov12_0225682C(ctx, battlerId) != 0xff) {
                        ctx->unk_314C[battlerId] |= 0x1;
                    }

                    switch (ov12_0225682C(ctx, battlerId)) {
                    case 1: //Fight
                        if (StruggleCheck(bsys, ctx, battlerId, 0, 0xffffffff) == 15) {
                            ctx->turnData[battlerId].struggleFlag = 1;

                            if (BattleSystem_GetBattleSpecial(bsys) & BATTLE_SPECIAL_RECORDED) {
                                ctx->unk_0[battlerId] = SSI_STATE_13;
                            } else {
                                ctx->unk_0[battlerId] = SSI_STATE_END;
                                ctx->unk_4[battlerId] = SSI_STATE_NO_MOVES;
                            }
                        } else if (ctx->battleMons[battlerId].unk88.encoredMove) {
                            ctx->movePos[battlerId] = ctx->battleMons[battlerId].unk88.encoredMoveIndex;
                            ctx->unk_30B4[battlerId] = ctx->battleMons[battlerId].unk88.encoredMove;
                            ctx->unk_21A8[battlerId][2] = 0;

                            if (BattleSystem_GetBattleSpecial(bsys) & BATTLE_SPECIAL_RECORDED) {
                                ctx->unk_0[battlerId] = SSI_STATE_13;
                            } else {
                                ctx->unk_0[battlerId] = SSI_STATE_END;
                                ctx->unk_4[battlerId] = SSI_STATE_13;
                            }
                        } else {
                            ctx->unk_0[battlerId] = SSI_STATE_3;
                        }

                        ctx->unk_21A8[battlerId][0] = 13;
                        break;
                    case 2: //Item
                        if (BattleSystem_GetBattleType(bsys) & (1 << 12)) {
                            ctx->unk_0[battlerId] = SSI_STATE_END;
                            ctx->unk_4[battlerId] = SSI_STATE_13;
                            ctx->unk_21A8[battlerId][0] = 21;
                        } else if (BattleSystem_GetBattleType(bsys) & (BATTLE_TYPE_LINK | BATTLE_TYPE_TOWER)) {
                            msg.id = msg_0197_00593; //Items can't be used here
                            msg.tag = 0;
                            ov12_022639B8(bsys, battlerId, msg);
                            ctx->unk_0[battlerId] = SSI_STATE_15;
                            ctx->unk_4[battlerId] = SSI_STATE_0;
                        } else {
                            ctx->unk_21A8[battlerId][0] = 14;
                            ctx->unk_0[battlerId] = 7;
                        }
                        break;
                    case 3: //Pokemon
                        ctx->unk_21A8[battlerId][0] = 15;
                        ctx->unk_0[battlerId] = SSI_STATE_9;
                        break;
                    case 4: //Run
                        ctx->unk_21A8[battlerId][0] = 16;
                        ctx->unk_0[battlerId] = SSI_STATE_11;
                        break;
                    case 0xff: //Cancel
                        if (battleType & BATTLE_TYPE_LINK) {
                            ov12_02263CCC(bsys, battlerId);
                            ctx->unk_0[battlerId] = SSI_STATE_0;
                            ctx->unk_0[BattleSystem_GetBattlerIdPartner(bsys, battlerId)] = 0;
                        } else if ((battleType & BATTLE_TYPE_DOUBLES) && (battlerId == BATTLER_PLAYER2)) {
                            ov12_02263CCC(bsys, battlerId);
                            ctx->unk_0[0] = SSI_STATE_0;
                            ctx->unk_0[2] = SSI_STATE_0;
                        }
                        break;
                    }
                }
            }
            break;
        case SSI_STATE_3:
            ov12_02262F40(bsys, ctx, battlerId);
            ctx->unk_0[battlerId] = SSI_STATE_4;
            //fallthrough
        case SSI_STATE_4:
            if (ov12_0225682C(ctx, battlerId) == 0xff) {
                ctx->unk_0[battlerId] = SSI_STATE_0;
            } else if (ov12_0225682C(ctx, battlerId)) {
                if ((ctx->unk_2300[battlerId][0] - 1) == 4) {
                    ctx->unk_21A8[battlerId][0] = 16;
                    ctx->unk_0[battlerId] = SSI_STATE_11;
                    break;
                } else if (ov12_02251A28(bsys, ctx, battlerId, ctx->unk_2300[battlerId][0] - 1, &msg) == 0) {
                    if (BattleSystem_GetBattleSpecial(bsys) & BATTLE_SPECIAL_RECORDED) {
                        ov12_0223BFFC(bsys, 1);
                        ov12_022581BC(bsys, BattleSystem_GetBattleContext(bsys));
                    } else {
                        ov12_022639B8(bsys, battlerId, msg);
                        ctx->unk_0[battlerId] = SSI_STATE_15;
                        ctx->unk_4[battlerId] = SSI_STATE_3;
                    }
                } else {
                    ctx->unk_21A8[battlerId][2] = ctx->unk_2300[battlerId][0];
                    ctx->movePos[battlerId] = ctx->unk_2300[battlerId][0] - 1;
                    ctx->unk_30B4[battlerId] = ctx->battleMons[battlerId].moves[ctx->movePos[battlerId]];
                    ctx->unk_0[battlerId] = SSI_STATE_5;
                    ctx->unk_314C[battlerId] |= 0x2;
                }
            }
            break;
        case SSI_STATE_5:
            int out;

            if (ov12_0224DB64(bsys, ctx, battlerId, battleType, &out, ctx->movePos[battlerId], &ctx->unk_21A8[battlerId][1])) {
                ov12_02262FFC(bsys, ctx, out, battlerId);
                ctx->unk_0[battlerId] = SSI_STATE_6;
            } else {
                ctx->unk_0[battlerId] = SSI_STATE_13;
            }
            break;
        case SSI_STATE_6:
            if (ov12_0225682C(ctx, battlerId) == 0xff) {
                ctx->unk_0[battlerId] = SSI_STATE_3;
            } else if (ov12_0225682C(ctx, battlerId)) {
                ctx->unk_21A8[battlerId][1] = ctx->unk_2300[battlerId][0] - 1;
                ctx->unk_0[battlerId] = SSI_STATE_13;

                ctx->unk_314C[battlerId] |= 0x4;
            }
            break;
        case SSI_STATE_7:
            ov12_02263138(bsys, ctx, battlerId);
            ctx->unk_0[battlerId] = SSI_STATE_8;
        case SSI_STATE_8:
            if (ov12_0225682C(ctx, battlerId) == 0xff) {
                ctx->unk_0[battlerId] = SSI_STATE_0;
            } else if (ov12_0225682C(ctx, battlerId)) {
                u32 *unkPtr;

                unkPtr = (u32 *)&ctx->unk_2300[battlerId][0];
                ctx->unk_21A8[battlerId][2] = unkPtr[0];
                ctx->unk_0[battlerId] = SSI_STATE_13;
            }
            break;
        case SSI_STATE_9: //switching..?
            int v8;
            int v9 = 6;
            int partnerId;

            v8 = BattlerCanSwitch(bsys, ctx, battlerId);

            if (((ov12_0223AB0C(bsys, battlerId) == 4) || (ov12_0223AB0C(bsys, battlerId) == 5)) && ((battleType == (BATTLE_TYPE_TRAINER | BATTLE_TYPE_DOUBLES)) || (battleType == (BATTLE_TYPE_TRAINER | BATTLE_TYPE_DOUBLES | BATTLE_TYPE_LINK)) || (battleType == (BATTLE_TYPE_TRAINER | BATTLE_TYPE_DOUBLES | BATTLE_TYPE_TOWER)) || ((battleType == (BATTLE_TYPE_TRAINER | BATTLE_TYPE_DOUBLES | BATTLE_TYPE_INGAME_PARTNER)) && (ov12_0223AB0C(bsys, battlerId) == 4)))) {
                partnerId = BattleSystem_GetBattlerIdPartner(bsys, battlerId);

                if (ctx->unk_21A8[partnerId][0] == 15) {
                    v9 = ctx->unk_21A8[partnerId][2];
                }
            }

            BattleController_EmitShowMonList(bsys, ctx, battlerId, 0, v8, v9);
            ctx->unk_0[battlerId] = SSI_STATE_10;
        //fallthrough
        case SSI_STATE_10:
            if (ov12_0225682C(ctx, battlerId) == 0xff) {
                ctx->unk_0[battlerId] = SSI_STATE_0;
            } else if (ov12_0225682C(ctx, battlerId)) {
                ctx->unk_21A8[battlerId][2] = ctx->unk_2300[battlerId][0] - 1;
                ctx->unk_21A0[battlerId] = ctx->unk_2300[battlerId][0] - 1;
                ctx->unk_0[battlerId] = SSI_STATE_13;
            }
            break;
        case SSI_STATE_11: //Flee after a mon fainted..?
            if (battleType & BATTLE_TYPE_TOWER) {
                BattleController_EmitDrawYesNoBox(bsys, ctx, battlerId, 955, 0, 0, 0);
                ctx->unk_0[battlerId] = SSI_STATE_12;
            } else if ((battleType & BATTLE_TYPE_TRAINER) && !(battleType & BATTLE_TYPE_LINK)) {
                if (BattleSystem_GetBattleSpecial(bsys) & BATTLE_SPECIAL_RECORDED) {
                    ov12_0223BFFC(bsys, 1);
                    ov12_022581BC(bsys, BattleSystem_GetBattleContext(bsys));
                } else {
                    msg.tag = 0;
                    msg.id = msg_0197_00793; //There's no running from a Trainer battle!
                    ov12_022639B8(bsys, battlerId, msg);
                    ctx->unk_0[battlerId] = SSI_STATE_15;
                    ctx->unk_4[battlerId] = SSI_STATE_0;
                }
            } else if (CantEscape(bsys, ctx, battlerId, &msg)) {
                if (BattleSystem_GetBattleSpecial(bsys) & BATTLE_SPECIAL_RECORDED) {
                    ov12_0223BFFC(bsys, 1);
                    ov12_022581BC(bsys, BattleSystem_GetBattleContext(bsys));
                } else {
                    ov12_022639B8(bsys, battlerId, msg);
                    ctx->unk_0[battlerId] = SSI_STATE_15;
                    ctx->unk_4[battlerId] = SSI_STATE_0;
                }
            } else {
                ctx->unk_0[battlerId] = SSI_STATE_12;
            }
            break;
        case SSI_STATE_12:
            if (battleType & BATTLE_TYPE_TOWER) {
                if (ov12_0225682C(ctx, battlerId)) {
                    if (ov12_0225682C(ctx, battlerId) == 0xff) {
                        ctx->unk_0[battlerId] = SSI_STATE_0;
                    } else {
                        ctx->unk_0[battlerId] = SSI_STATE_13;
                    }
                }
            } else {
                ctx->unk_0[battlerId] = SSI_STATE_13;
            }

            if ((battleType & BATTLE_TYPE_DOUBLES) && !(battleType & BATTLE_TYPE_MULTI) && (ctx->unk_0[battlerId] == 13)) {
                ctx->unk_0[BattleSystem_GetBattlerIdPartner(bsys, battlerId)] = SSI_STATE_13;
            }
            break;
        case SSI_STATE_13: //WIFI wait for partner to make a move..?
            ov12_02263CCC(bsys, battlerId);

            if (battleType == (BATTLE_TYPE_TRAINER | BATTLE_TYPE_DOUBLES | BATTLE_TYPE_LINK)) {
                int partnerId;

                partnerId = BattleSystem_GetBattlerIdPartner(bsys, battlerId);

                if (ctx->unk_0[partnerId] == SSI_STATE_14) {
                    BattleController_EmitShowWaitMessage(bsys, battlerId);
                }
            } else {
                BattleController_EmitShowWaitMessage(bsys, battlerId);
            }

            ctx->unk_0[battlerId] = SSI_STATE_14;
        case SSI_STATE_14:
            var++; //this might be counting the number of players who have selected their final action?
            break;
        case SSI_STATE_15:
            if (ov12_0225682C(ctx, battlerId)) {
                ov12_0224EDC0(ctx, battlerId);
                ctx->unk_0[battlerId] = ctx->unk_4[battlerId];
            }
            break;
        case SSI_STATE_NO_MOVES:
            msg.tag = 2;
            msg.id = msg_0197_00608; //Spheal has no moves left!
            msg.param[0] = CreateNicknameTag(ctx, battlerId);
            ov12_022639B8(bsys, battlerId, msg);
            ctx->unk_0[battlerId] = SSI_STATE_15;
            ctx->unk_4[battlerId] = SSI_STATE_13;
            break;
        case SSI_STATE_END:
            ov12_02263E18(bsys, battlerId);
            ctx->unk_0[battlerId] = ctx->unk_4[battlerId];
            break;
        }
    }

    if (var == battlersMax) {
        ov12_0224E414(bsys, ctx);
        ov12_02237ED0(bsys, 0);

        ctx->command = CONTROLLER_COMMAND_6;

        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            if (ctx->unk_21A8[battlerId][0] == 15) {
                ov12_02256F78(bsys, ctx, battlerId, ctx->unk_21A0[battlerId]);
            }
        }
    }
}

//static
void ov12_02249190(BattleSystem *bsys, BattleContext *ctx) {
    int battlerId;
    int maxBattlers;
    u32 battleType;
    int i, j;
    int turn;
    u32 flag;
    
    maxBattlers = BattleSystem_GetMaxBattlers(bsys);
    battleType = BattleSystem_GetBattleType(bsys);
    
    turn = 0;
    
    if (battleType & (BATTLE_TYPE_SAFARI | BATTLE_TYPE_PAL_PARK)) {
        for (battlerId = 0; battlerId < maxBattlers; battlerId++) {
            ctx->unk_21E8[battlerId] = battlerId;
        }
    } else {
        if (battleType & BATTLE_TYPE_LINK) {
            for (battlerId = 0; battlerId < maxBattlers; battlerId++) {
                if (ctx->unk_21A8[battlerId][3] == 4) {
                    turn = 5;
                    break;
                }
            }
        } else {
            if (ctx->unk_21A8[BATTLER_PLAYER][3] == 4) {
                battlerId = BATTLER_PLAYER;
                turn = 5;
            }
            if (ctx->unk_21A8[BATTLER_PLAYER2][3] == 4) {
                battlerId = BATTLER_PLAYER2;
                turn = 5;
            }
        }
        if (turn == 5) {
            ctx->unk_21E8[0] = battlerId;
            turn = 1;
            for (i = 0; i < maxBattlers; i++) {
                if (i != battlerId) {
                    ctx->unk_21E8[turn] = i;
                    turn++;
                }
            }
        } else {
            for (battlerId = 0; battlerId < maxBattlers; battlerId++) {
                if (ctx->unk_21A8[battlerId][3] == 2 || ctx->unk_21A8[battlerId][3] == 3) {
                    ctx->unk_21E8[turn] = battlerId;
                    turn++;
                }
            }
            
            for (battlerId = 0; battlerId < maxBattlers; battlerId++) {
                if (ctx->unk_21A8[battlerId][3] != 2 && ctx->unk_21A8[battlerId][3] != 3) {
                    ctx->unk_21E8[turn] = battlerId;
                    turn++;
                }
            }
            
            for (i = 0; i < maxBattlers - 1; i++) {
                for (j = i + 1; j < maxBattlers; j++) {
                    int battlerId1 = ctx->unk_21E8[i];
                    int battlerId2 = ctx->unk_21E8[j];
                    
                    if (ctx->unk_21A8[battlerId1][3] == ctx->unk_21A8[battlerId2][3]) {
                        if (ctx->unk_21A8[battlerId1][3] == 1) {
                            flag = 0;
                        } else {
                            flag = 1;
                        }
                        if (CheckSortSpeed(bsys, ctx, battlerId1, battlerId2, flag)) {
                            ctx->unk_21E8[i] = battlerId2;
                            ctx->unk_21E8[j] = battlerId1;
                        }
                    }
                }
            }
            
        }
    }
    
    ctx->command = CONTROLLER_COMMAND_7;
}

//static
void ov12_0224930C(BattleSystem *bsys, BattleContext *ctx) {
    int flag = 0;
    int battlerId;
    int maxBattlers = BattleSystem_GetMaxBattlers(bsys);
    
    do {
        switch (ctx->unk_28) {
        case 0: //Focus Punch
            while (ctx->unk_2C < maxBattlers) {
                battlerId = ctx->unk_21E8[ctx->unk_2C];
                if (ctx->unk_3108 & MaskOfFlagNo(battlerId)) {
                    ctx->unk_2C++;
                    continue;
                }
                ctx->unk_2C++;
                if (!(ctx->battleMons[battlerId].status & STATUS_SLEEP) &&
                    (GetBattlerSelectedMove(ctx, battlerId) == MOVE_FOCUS_PUNCH) &&
                    !CheckTruant(ctx, battlerId) && !ctx->turnData[battlerId].struggleFlag) {
                    ov12_022642F0(bsys);
                    ctx->battlerIdTemp = battlerId;
                    ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, 232);
                    ctx->commandNext = ctx->command;
                    ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
                    return;
                }
            }
            ctx->unk_2C = 0;
            ctx->unk_28++;
            break;
        case 1: //???
            for (battlerId = 0; battlerId < maxBattlers; battlerId++) {
                if ((ctx->battleMons[battlerId].status2 & STATUS2_23) && GetBattlerSelectedMove(ctx, battlerId) != MOVE_RAGE) {
                    ctx->battleMons[battlerId].status2 &= STATUS2_23;
                }
            }
            ctx->unk_28++;
            break;
        case 2: //???
            for (battlerId = 0; battlerId < 4; battlerId++) {
                ctx->unk_310C[battlerId] = BattleSystem_Random(bsys);
            }
            ctx->unk_28++;
            break;
        case 3: //end
            ctx->unk_28 = 0;
            flag = 2;
            break;
        } 
    } while (flag == 0);
    if (flag == 2) {
        ctx->command = CONTROLLER_COMMAND_8;
    }
}

//static
void ov12_02249460(BattleSystem *bsys, BattleContext *ctx) {
    int maxBattlers;
    int battlerId;
    
    maxBattlers = BattleSystem_GetMaxBattlers(bsys);
    
    if (ov12_022581BC(bsys, ctx)) {
        return;
    }
    
    ctx->battlersOnField = 0;
    for (battlerId = 0; battlerId < maxBattlers; battlerId++) {
        if (ctx->unk_21A8[battlerId][0] != 40) {
            ctx->battlersOnField++;
        }
    }
    
    SortMonsBySpeed(bsys, ctx);
    
    if (ctx->unk_EC == maxBattlers) {
        ctx->unk_EC = 0;
        ctx->command = CONTROLLER_COMMAND_UPDATE_FIELD_CONDITION;
    } else {
        ctx->command = (ControllerCommand) ctx->unk_21A8[ctx->unk_21E8[ctx->unk_EC]][0];
    }
}

typedef enum UpdateFieldConditionState {
    UFC_STATE_REFLECT,
    UFC_STATE_LIGHT_SCREEN,
    UFC_STATE_MIST,
    UFC_STATE_SAFEGUARD,
    UFC_STATE_TAILWIND,
    UFC_STATE_LUCKY_CHANT,
    UFC_STATE_WISH,
    UFC_STATE_RAIN,
    UFC_STATE_SANDSTORM,
    UFC_STATE_SUN,
    UFC_STATE_HAIL,
    UFC_STATE_FOG,
    UFC_STATE_GRAVITY,
    UFC_STATE_END
} UpdateFieldConditionState;

//static 
void BattleControllerPlayer_UpdateFieldCondition(BattleSystem *bsys, BattleContext *ctx) {
    int flag = 0;
    int side;
    int maxBattlers = BattleSystem_GetMaxBattlers(bsys);
    
    do {
        if (ov12_0224DC74(ctx, ctx->command, ctx->command, 1) == TRUE) {
            return;
        }
        if (ov12_0224DD18(ctx, ctx->command, ctx->command) == TRUE) {
            return;
        }
        if (ov12_0224D7EC(bsys, ctx) == TRUE) {
            return;
        }
        
        switch (ctx->stateFieldConditionUpdate) {
        case UFC_STATE_REFLECT:
            while (ctx->fieldConditionUpdateData < 2) {
                side = ctx->fieldConditionUpdateData;
                if (ctx->fieldSideConditionFlags[side] & SIDE_CONDITION_REFLECT) {
                    if (--ctx->fieldSideConditionData[side].reflectTurns == 0) {
                        ctx->fieldSideConditionFlags[side] &= ~SIDE_CONDITION_REFLECT;
                        ctx->moveTemp = MOVE_REFLECT;
                        ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, 50);
                        ctx->commandNext = ctx->command;
                        ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
                        ctx->battlerIdTemp = ov12_02257E98(bsys, ctx, side);
                        flag = 1;
                    }
                }
                ctx->fieldConditionUpdateData++;
                if (flag) {
                    break;
                }
            }
            if (!flag) {
                ctx->stateFieldConditionUpdate++;
                ctx->fieldConditionUpdateData = 0;
            }
            break;
        case UFC_STATE_LIGHT_SCREEN:
            while (ctx->fieldConditionUpdateData < 2) {
                side = ctx->fieldConditionUpdateData;
                if (ctx->fieldSideConditionFlags[side] & SIDE_CONDITION_LIGHT_SCREEN) {
                    if (--ctx->fieldSideConditionData[side].lightScreenTurns == 0) {
                        ctx->fieldSideConditionFlags[side] &= ~SIDE_CONDITION_LIGHT_SCREEN;
                        ctx->moveTemp = MOVE_LIGHT_SCREEN;
                        ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, 50);
                        ctx->commandNext = ctx->command;
                        ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
                        ctx->battlerIdTemp = ov12_02257E98(bsys, ctx, side);
                        flag = 1;
                    }
                }
                ctx->fieldConditionUpdateData++;
                if (flag) {
                    break;
                }
            }
            if (!flag) {
                ctx->stateFieldConditionUpdate++;
                ctx->fieldConditionUpdateData = 0;
            }
            break;
        case UFC_STATE_MIST:
            while (ctx->fieldConditionUpdateData < 2) {
                side = ctx->fieldConditionUpdateData;
                if (ctx->fieldSideConditionFlags[side] & SIDE_CONDITION_MIST) {
                    if (--ctx->fieldSideConditionData[side].mistTurns == 0) {
                        ctx->fieldSideConditionFlags[side] &= ~SIDE_CONDITION_MIST;
                        ctx->moveTemp = MOVE_MIST;
                        ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, 50);
                        ctx->commandNext = ctx->command;
                        ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
                        ctx->battlerIdTemp = ov12_02257E98(bsys, ctx, side);
                        flag = 1;
                    }
                }
                ctx->fieldConditionUpdateData++;
                if (flag) {
                    break;
                }
            }
            if (!flag) {
                ctx->stateFieldConditionUpdate++;
                ctx->fieldConditionUpdateData = 0;
            }
            break;
        case UFC_STATE_SAFEGUARD:
            while (ctx->fieldConditionUpdateData < 2) {
                side = ctx->fieldConditionUpdateData;
                if (ctx->fieldSideConditionFlags[side] & SIDE_CONDITION_SAFEGUARD) {
                    if (--ctx->fieldSideConditionData[side].safeguardTurns == 0) {
                        ctx->fieldSideConditionFlags[side] &= ~SIDE_CONDITION_SAFEGUARD;
                        ctx->battlerIdTemp = ctx->fieldSideConditionData[side].safeguardBattler;
                        ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, 110);
                        ctx->commandNext = ctx->command;
                        ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
                        ctx->battlerIdTemp = ov12_02257E98(bsys, ctx, side);
                        flag = 1;
                    }
                }
                ctx->fieldConditionUpdateData++;
                if (flag) {
                    break;
                }
            }
            if (!flag) {
                ctx->stateFieldConditionUpdate++;
                ctx->fieldConditionUpdateData = 0;
            }
            break;
        case UFC_STATE_TAILWIND:
            while (ctx->fieldConditionUpdateData < 2) {
                side = ctx->fieldConditionUpdateData;
                if (ctx->fieldSideConditionFlags[side] & SIDE_CONDITION_TAILWIND) {
                    ctx->fieldSideConditionFlags[side] -= 1 << SIDE_CONDITION_TAILWIND_SHIFT;
                    if ((ctx->fieldSideConditionFlags[side] & SIDE_CONDITION_TAILWIND) == 0) {
                        ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, 233);
                        ctx->commandNext = ctx->command;
                        ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
                        ctx->battlerIdTemp = ov12_02257E98(bsys, ctx, side);
                        flag = 1;
                    }
                }
                ctx->fieldConditionUpdateData++;
                if (flag) {
                    break;
                }
            }
            if (!flag) {
                ctx->stateFieldConditionUpdate++;
                ctx->fieldConditionUpdateData = 0;
            }
            break;
        case UFC_STATE_LUCKY_CHANT:
            while (ctx->fieldConditionUpdateData < 2) {
                side = ctx->fieldConditionUpdateData;
                if (ctx->fieldSideConditionFlags[side] & SIDE_CONDITION_LUCKY_CHANT) {
                    ctx->fieldSideConditionFlags[side] -= 1 << SIDE_CONDITION_LUCKY_CHANT_SHIFT;
                    if ((ctx->fieldSideConditionFlags[side] & SIDE_CONDITION_LUCKY_CHANT) == 0) {
                        ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, 250);
                        ctx->commandNext = ctx->command;
                        ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
                        ctx->battlerIdTemp = ov12_02257E98(bsys, ctx, side);
                        flag = 1;
                    }
                }
                ctx->fieldConditionUpdateData++;
                if (flag) {
                    break;
                }
            }
            if (!flag) {
                ctx->stateFieldConditionUpdate++;
                ctx->fieldConditionUpdateData = 0;
            }
            break;
        case UFC_STATE_WISH:
            while (ctx->fieldConditionUpdateData < maxBattlers) {
                side = ctx->turnOrder[ctx->fieldConditionUpdateData];
                if (ctx->fieldConditionData.wishTurns[side]) {
                    if (--ctx->fieldConditionData.wishTurns[side] == 0 && ctx->battleMons[side].hp) {
                        ctx->battlerIdTemp = side;
                        ctx->buffMsg.tag = 2;
                        ctx->buffMsg.id = msg_0197_00533; //Spheal's wish came true!
                        ctx->buffMsg.param[0] = side | (ctx->fieldConditionData.wishTarget[side] << 8);
                        ctx->hpCalc = DamageDivide(ctx->battleMons[side].maxHp, 2);
                        ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, 136);
                        ctx->commandNext = ctx->command;
                        ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
                        flag = 1;
                    }
                }
                ctx->fieldConditionUpdateData++;
                if (flag) {
                    break;
                }
            }
            if (!flag) {
                ctx->stateFieldConditionUpdate++;
                ctx->fieldConditionUpdateData = 0;
            }
            break;
        case UFC_STATE_RAIN:
            if (ctx->fieldCondition & FIELD_CONDITION_RAIN_ALL) {
                if (ctx->fieldCondition & FIELD_CONDITION_RAIN_PERMANENT) {
                    ctx->buffMsg.id = msg_0197_00801; //Rain continues to fall.
                    ctx->buffMsg.tag = 0;
                    ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, 104);
                    ctx->commandNext = ctx->command;
                    ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
                } else if (--ctx->fieldConditionData.weatherTurns == 0) {
                    ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, 234);
                    ctx->commandNext = ctx->command;
                    ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
                } else {
                    ctx->buffMsg.id = msg_0197_00801; //Rain continues to fall.
                    ctx->buffMsg.tag = 0;
                    ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, 104);
                    ctx->commandNext = ctx->command;
                    ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
                }
                ctx->tempData = 19;
                flag = 1;
            }
            ctx->stateFieldConditionUpdate++;
            break;
        case UFC_STATE_SANDSTORM:
            if (ctx->fieldCondition & FIELD_CONDITION_SANDSTORM_ALL) {
                if (ctx->fieldCondition & FIELD_CONDITION_SANDSTORM_PERMANENT) {
                    ctx->buffMsg.id = msg_0197_00805; //The sandstorm rages.
                    ctx->buffMsg.tag = 0;
                    ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, 104);
                    ctx->commandNext = ctx->command;
                    ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
                } else if (--ctx->fieldConditionData.weatherTurns == 0) {
                    ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, 235);
                    ctx->commandNext = ctx->command;
                    ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
                } else {
                    ctx->buffMsg.id = msg_0197_00805; //The sandstorm rages.
                    ctx->buffMsg.tag = 0;
                    ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, 104);
                    ctx->commandNext = ctx->command;
                    ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
                }
                ctx->tempData = 21;
                flag = 1;
            }
            ctx->stateFieldConditionUpdate++;
            break;
        case UFC_STATE_SUN:
            if (ctx->fieldCondition & FIELD_CONDITION_SUN_ALL) {
                if (ctx->fieldCondition & FIELD_CONDITION_SUN_PERMANENT) {
                    ctx->buffMsg.id = msg_0197_00808; //The sunlight is strong.
                    ctx->buffMsg.tag = 0;
                    ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, 104);
                    ctx->commandNext = ctx->command;
                    ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
                } else if (--ctx->fieldConditionData.weatherTurns == 0) {
                    ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, 236);
                    ctx->commandNext = ctx->command;
                    ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
                } else {
                    ctx->buffMsg.id = msg_0197_00808; //The sunlight is strong.
                    ctx->buffMsg.tag = 0;
                    ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, 104);
                    ctx->commandNext = ctx->command;
                    ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
                }
                ctx->tempData = 22;
                flag = 1;
            }
            ctx->stateFieldConditionUpdate++;
            break;
        case UFC_STATE_HAIL:
            if (ctx->fieldCondition & FIELD_CONDITION_HAIL_ALL) {
                if (ctx->fieldCondition & FIELD_CONDITION_HAIL_PERMANENT) {
                    ctx->buffMsg.id = msg_0197_00811; //Hail continues to fall.
                    ctx->buffMsg.tag = 0;
                    ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, 104);
                    ctx->commandNext = ctx->command;
                    ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
                } else if (--ctx->fieldConditionData.weatherTurns == 0) {
                    ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, 237);
                    ctx->commandNext = ctx->command;
                    ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
                } else {
                    ctx->buffMsg.id = msg_0197_00811; //Hail continues to fall.
                    ctx->buffMsg.tag = 0;
                    ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, 104);
                    ctx->commandNext = ctx->command;
                    ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
                }
                ctx->tempData = 20;
                flag = 1;
            }
            ctx->stateFieldConditionUpdate++;
            break;
        case UFC_STATE_FOG:
            if (ctx->fieldCondition & FIELD_CONDITION_FOG) {
                ctx->buffMsg.id = msg_0197_00813; //The fog is deep...
                ctx->buffMsg.tag = 0;
                ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, 104);
                ctx->commandNext = ctx->command;
                ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
                ctx->tempData = 18;
                flag = 1;
            }
            ctx->stateFieldConditionUpdate++;
            break;
        case UFC_STATE_GRAVITY:
            if (ctx->fieldCondition & FIELD_CONDITION_GRAVITY) {
                ctx->fieldCondition -= (1 << FIELD_CONDITION_GRAVITY_SHIFT);
                if ((ctx->fieldCondition & FIELD_CONDITION_GRAVITY) == 0) {
                    ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, 238);
                    ctx->commandNext = ctx->command;
                    ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
                    flag = 1;
                }
            }
            ctx->stateFieldConditionUpdate++;
            break;
        case UFC_STATE_END:
            flag = 2;
            break;
        }
    } while (!flag);
    
    if (flag == 1) {
        ov12_022642F0(bsys);
    }
    
    if (flag == 2) {
        ctx->stateFieldConditionUpdate = 0;
        ctx->command = CONTROLLER_COMMAND_10;
    }
}

typedef enum UpdateMonConditionState {
    UMC_STATE_INGRAIN,
    UMC_STATE_AQUA_RING,
    UMC_STATE_ABILITY,
    UMC_STATE_HELD_ITEM,
    UMC_STATE_LEFTOVERS_RECOVERY,
    UMC_STATE_LEECH_SEED,
    UMC_STATE_POISON,
    UMC_STATE_BAD_POISON,
    UMC_STATE_BURN,
    UMC_STATE_NIGHTMARE,
    UMC_STATE_CURSE,
    UMC_STATE_BINDING,
    UMC_STATE_BAD_DREAMS,
    UMC_STATE_UPROAR,
    UMC_STATE_RAMPAGE,
    UMC_STATE_DISABLE,
    UMC_STATE_ENCORE,
    UMC_STATE_LOCK_ON,
    UMC_STATE_CHARGE,
    UMC_STATE_TAUNT,
    UMC_STATE_MAGNET_RISE,
    UMC_STATE_HEALBLOCK,
    UMC_STATE_EMBARGO,
    UMC_STATE_YAWN,
    UMC_STATE_HELD_ITEM_STATUS,
    UMC_STATE_HELD_ITEM_DAMAGE,
    UMC_STATE_END
} UpdateMonConditionState;

//static
void BattleControllerPlayer_UpdateMonCondition(BattleSystem *bsys, BattleContext *ctx) {
    int i;
    u8 flag = 0;
    int maxBattlers;
    int battlerId;
    
    maxBattlers = BattleSystem_GetMaxBattlers(bsys);
    
    if (ov12_0224DC74(ctx, ctx->command, ctx->command, 1) == TRUE) {
        return;
    }
    
    if (ov12_0224DD18(ctx, ctx->command, ctx->command) == TRUE) {
        return;
    }
    
    if (ov12_0224D7EC(bsys, ctx) == TRUE) {
        return;
    }
    
    while (ctx->updateMonConditionData < maxBattlers) {
        battlerId = ctx->turnOrder[ctx->updateMonConditionData];
        if (ctx->unk_3108 & MaskOfFlagNo(battlerId)) {
            ctx->updateMonConditionData++;
            continue;
        }
        switch (ctx->stateUpdateMonCondition) {
        case UMC_STATE_INGRAIN:
            if ((ctx->battleMons[battlerId].moveEffectFlags & MOVE_EFFECT_FLAG_INGRAIN) && ctx->battleMons[battlerId].hp != ctx->battleMons[battlerId].maxHp && ctx->battleMons[battlerId].hp) {
                if (ctx->battleMons[battlerId].unk88.healBlockTurns) {
                    ctx->battlerIdTemp = battlerId;
                    ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, 239);
                } else {
                    ctx->battlerIdTemp = battlerId;
                    ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, 137);
                }
                ctx->commandNext = ctx->command;
                ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
                flag = 1;
            }
            ctx->stateUpdateMonCondition++;
            break;
        case UMC_STATE_AQUA_RING:
            if ((ctx->battleMons[battlerId].moveEffectFlags & MOVE_EFFECT_FLAG_AQUA_RING) && ctx->battleMons[battlerId].hp != ctx->battleMons[battlerId].maxHp && ctx->battleMons[battlerId].hp) {
                if (ctx->battleMons[battlerId].unk88.healBlockTurns) {
                    ctx->battlerIdTemp = battlerId;
                    ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, 239);
                } else {
                    ctx->battlerIdTemp = battlerId;
                    ctx->moveTemp = MOVE_AQUA_RING;
                    ctx->hpCalc = DamageDivide(ctx->battleMons[battlerId].maxHp, 16);
                    ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, 169);
                }
                ctx->commandNext = ctx->command;
                ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
                flag = 1;
            }
            ctx->stateUpdateMonCondition++;
            break;
        case UMC_STATE_ABILITY:
            if (ov12_02253068(bsys, ctx, battlerId) == TRUE) {
                flag = 1;
            }
            ctx->stateUpdateMonCondition++;
            break;
        case UMC_STATE_HELD_ITEM:
            if (TryUseHeldItem(bsys, ctx, battlerId) == TRUE) {
                flag = 1;
            }
            ctx->stateUpdateMonCondition++;
            break;
        case UMC_STATE_LEFTOVERS_RECOVERY:
            if (CheckItemGradualHPRestore(bsys, ctx, battlerId) == TRUE) {
                flag = 1;
            }
            ctx->stateUpdateMonCondition++;
            break;
        case UMC_STATE_LEECH_SEED:
            if ((ctx->battleMons[battlerId].moveEffectFlags & MOVE_EFFECT_FLAG_LEECH_SEED) && ctx->battleMons[ctx->battleMons[battlerId].moveEffectFlags & MOVE_EFFECT_FLAG_LEECH_SEED_BATTLER].hp && 
                GetBattlerAbility(ctx, battlerId) != ABILITY_MAGIC_GUARD && ctx->battleMons[battlerId].hp) {
                ctx->unk_11C = ctx->battleMons[battlerId].moveEffectFlags & MOVE_EFFECT_FLAG_LEECH_SEED_BATTLER;
                ctx->unk_120 = battlerId;
                ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, 69);
                ctx->commandNext = ctx->command;
                ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
                flag = 1;
            }
            ctx->stateUpdateMonCondition++;
            break;
        case UMC_STATE_POISON:
            if ((ctx->battleMons[battlerId].status & STATUS_POISON) && ctx->battleMons[battlerId].hp) {
                ctx->battlerIdTemp = battlerId;
                ctx->hpCalc = DamageDivide(ctx->battleMons[battlerId].maxHp * -1, 8);
                ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, 23);
                ctx->commandNext = ctx->command;
                ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
                flag = 1;
            }
            ctx->stateUpdateMonCondition++;
            break;
        case UMC_STATE_BAD_POISON:
            if ((ctx->battleMons[battlerId].status & STATUS_BAD_POISON) && ctx->battleMons[battlerId].hp) {
                ctx->battlerIdTemp = battlerId;
                ctx->hpCalc = DamageDivide(ctx->battleMons[battlerId].maxHp, 16);
                if ((ctx->battleMons[battlerId].status & STATUS_POISON_COUNT) != STATUS_POISON_COUNT) {
                    ctx->battleMons[battlerId].status += 1 << STATUS_POISON_COUNT_SHIFT;
                }
                ctx->hpCalc *= ((ctx->battleMons[battlerId].status & STATUS_POISON_COUNT) >> STATUS_POISON_COUNT_SHIFT);
                ctx->hpCalc *= -1;
                ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, 23);
                ctx->commandNext = ctx->command;
                ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
                flag = 1;
            }
            ctx->stateUpdateMonCondition++;
            break;
        case UMC_STATE_BURN:
            if ((ctx->battleMons[battlerId].status & STATUS_BURN) && ctx->battleMons[battlerId].hp) {
                ctx->battlerIdTemp = battlerId;
                ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, 26);
                ctx->commandNext = ctx->command;
                ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
                flag = 1;
            }
            ctx->stateUpdateMonCondition++;
            break;
        case UMC_STATE_NIGHTMARE:
            if ((ctx->battleMons[battlerId].status2 & STATUS2_NIGHTMARE) && ctx->battleMons[battlerId].hp) {
                if (ctx->battleMons[battlerId].status & STATUS_SLEEP) {
                   ctx->battlerIdTemp = battlerId;
                    ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, 94);
                    ctx->commandNext = ctx->command;
                    ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
                    flag = 1; 
                } else {
                    ctx->battleMons[battlerId].status2 &= ~STATUS2_NIGHTMARE;
                }
            }
            ctx->stateUpdateMonCondition++;
            break;
        case UMC_STATE_CURSE:
            if ((ctx->battleMons[battlerId].status2 & STATUS2_CURSE) && ctx->battleMons[battlerId].hp) {
                ctx->battlerIdTemp = battlerId;
                ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, 98);
                ctx->commandNext = ctx->command;
                ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
                flag = 1;
            }
            ctx->stateUpdateMonCondition++;
            break;
        case UMC_STATE_BINDING:
            if ((ctx->battleMons[battlerId].status2 & STATUS2_BINDING_TURNS) && ctx->battleMons[battlerId].hp) {
                ctx->battleMons[battlerId].status2 -= 1 << STATUS2_BINDING_SHIFT;
                if (ctx->battleMons[battlerId].status2 & STATUS2_BINDING_TURNS) {
                    ctx->hpCalc = DamageDivide(ctx->battleMons[battlerId].maxHp * -1, 16);
                    ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, 59);
                } else {
                    ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, 60);
                }
                ctx->moveTemp = ctx->battleMons[battlerId].unk88.bindingMove;
                ctx->battlerIdTemp = battlerId;
                ctx->commandNext = ctx->command;
                ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
                flag = 1;
            }
            ctx->stateUpdateMonCondition++;
            break;
        case UMC_STATE_BAD_DREAMS:
            ctx->tempData = CheckAbilityActive(bsys, ctx, CHECK_ABILITY_OPPOSING_SIDE_HP_RET, battlerId, ABILITY_BAD_DREAMS);
            if ((ctx->battleMons[battlerId].status & STATUS_SLEEP) && GetBattlerAbility(ctx, battlerId) != ABILITY_MAGIC_GUARD &&
                ctx->battleMons[battlerId].hp && ctx->tempData) {
                ctx->hpCalc = DamageDivide(ctx->battleMons[battlerId].maxHp * -1, 8);
                ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, 263);
                ctx->battleStatus |= BATTLE_STATUS_NO_BLINK;
                ctx->battlerIdTemp = battlerId;
                ctx->commandNext = ctx->command;
                ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
                flag = 1;
            }
            ctx->stateUpdateMonCondition++;
            break;
        case UMC_STATE_UPROAR:
            if (ctx->battleMons[battlerId].status2 & STATUS2_UPROAR) {
                u8 battlerIdSleep;
                for (battlerIdSleep = 0; battlerIdSleep < maxBattlers; battlerIdSleep++) {
                    if ((ctx->battleMons[battlerIdSleep].status & STATUS_SLEEP) && ctx->battleMons[battlerIdSleep].hp && GetBattlerAbility(ctx, battlerIdSleep) != ABILITY_SOUNDPROOF) {
                        ctx->battlerIdTemp = battlerIdSleep;
                        ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, 19);
                        ctx->commandNext = ctx->command;
                        ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
                        break;
                    }
                }
                if (battlerIdSleep != maxBattlers) {
                    flag = 2;
                    break;
                }
                ctx->battleMons[battlerId].status2 -= 1 << STATUS2_UPROAR_SHIFT;
                if (ov12_02252218(ctx, battlerId)) {
                    i = 241;
                    ctx->battleMons[battlerId].status2 &= ~STATUS2_UPROAR;
                    ctx->fieldCondition &= (MaskOfFlagNo(battlerId) << 8) ^ 0xFFFFFFFF;
                } else if (ctx->battleMons[battlerId].status2 & STATUS2_UPROAR) {
                    i = 240;
                } else {
                    i = 241;
                    ctx->battleMons[battlerId].status2 &= ~STATUS2_UPROAR;
                    ctx->fieldCondition &= (MaskOfFlagNo(battlerId) << 8) ^ 0xFFFFFFFF;
                }
                ctx->battlerIdTemp = battlerId;
                ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, i);
                ctx->commandNext = ctx->command;
                ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
                flag = 1;
            }
            if (flag != 2) {
                ctx->stateUpdateMonCondition++;
            }
            break;
        case UMC_STATE_RAMPAGE:
            if (ctx->battleMons[battlerId].status2 & STATUS2_RAMPAGE_TURNS) {
                ctx->battleMons[battlerId].status2 -= 1 << STATUS2_RAMPAGE_SHIFT;
                if (ov12_02252218(ctx, battlerId)) {
                    ctx->battleMons[battlerId].status2 &= ~STATUS2_RAMPAGE_TURNS;
                } else if (!(ctx->battleMons[battlerId].status2 & STATUS2_RAMPAGE_TURNS) && !(ctx->battleMons[battlerId].status2 & STATUS2_CONFUSION)) {
                    ctx->battlerIdStatChange = battlerId;
                    ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, 51);
                    ctx->commandNext = ctx->command;
                    ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
                    flag = 1;
                }
            }
            ctx->stateUpdateMonCondition++;
            break;
        case UMC_STATE_DISABLE:
            if (ctx->battleMons[battlerId].unk88.disabledMove) {
                for (i = 0; i < MAX_MON_MOVES; i++) {
                    if (ctx->battleMons[battlerId].unk88.disabledMove == ctx->battleMons[battlerId].moves[i]) {
                        break;
                    }
                }
                if (i == MAX_MON_MOVES) {
                    ctx->battleMons[battlerId].unk88.disabledTurns = 0;
                }
                if (ctx->battleMons[battlerId].unk88.disabledTurns) {
                    ctx->battleMons[battlerId].unk88.disabledTurns--;
                } else {
                    ctx->battleMons[battlerId].unk88.disabledMove = 0;
                    ctx->battlerIdTemp = battlerId;
                    ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, 72);
                    ctx->commandNext = ctx->command;
                    ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
                    flag = 1;
                }
            }
            ctx->stateUpdateMonCondition++;
            break;
        case UMC_STATE_ENCORE:
            if (ctx->battleMons[battlerId].unk88.encoredMove) {
                for (i = 0; i < MAX_MON_MOVES; i++) {
                    if (ctx->battleMons[battlerId].unk88.encoredMove == ctx->battleMons[battlerId].moves[i]) {
                        break;
                    }
                }
                if (i == MAX_MON_MOVES || (i != MAX_MON_MOVES && !ctx->battleMons[battlerId].movePPCur[i])) {
                    ctx->battleMons[battlerId].unk88.encoredTurns = 0;
                }
                if (ctx->battleMons[battlerId].unk88.encoredTurns) {
                    ctx->battleMons[battlerId].unk88.encoredTurns--;
                } else {
                    ctx->battleMons[battlerId].unk88.encoredMove = 0;
                    ctx->battlerIdTemp = battlerId;
                    ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, 74);
                    ctx->commandNext = ctx->command;
                    ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
                    flag = 1;
                }
            }
            ctx->stateUpdateMonCondition++;
            break;
        case UMC_STATE_LOCK_ON:
            if (ctx->battleMons[battlerId].moveEffectFlags & MOVE_EFFECT_FLAG_LOCK_ON) {
                ctx->battleMons[battlerId].moveEffectFlags -= 1 << MOVE_EFFECT_FLAG_LOCK_ON_SHIFT;
            }
            ctx->stateUpdateMonCondition++;
            break;
        case UMC_STATE_CHARGE:
            if (ctx->battleMons[battlerId].unk88.isCharged) {
                if (--ctx->battleMons[battlerId].unk88.isCharged == 0) {
                    ctx->battleMons[battlerId].moveEffectFlags &= ~MOVE_EFFECT_FLAG_CHARGE;
                }
            }
            ctx->stateUpdateMonCondition++;
            break;
        case UMC_STATE_TAUNT:
            if (ctx->battleMons[battlerId].unk88.tauntTurns) {
                ctx->battleMons[battlerId].unk88.tauntTurns--;
                if (ctx->battleMons[battlerId].unk88.tauntTurns == 0) {
                    ctx->battlerIdTemp = battlerId;
                    ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, 288);
                    ctx->commandNext = ctx->command;
                    ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
                    flag = 1;
                }
            }
            ctx->stateUpdateMonCondition++;
            break;
        case UMC_STATE_MAGNET_RISE:
            if (ctx->battleMons[battlerId].unk88.magnetRiseTurns) {
                if (--ctx->battleMons[battlerId].unk88.magnetRiseTurns == 0) {
                    ctx->battlerIdTemp = battlerId;
                    ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, 242);
                    ctx->commandNext = ctx->command;
                    ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
                    flag = 1;
                }
            }
            ctx->stateUpdateMonCondition++;
            break;
        case UMC_STATE_HEALBLOCK:
            if (ctx->battleMons[battlerId].unk88.healBlockTurns) {
                if (--ctx->battleMons[battlerId].unk88.healBlockTurns == 0) {
                    ctx->battlerIdTemp = battlerId;
                    ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, 243);
                    ctx->commandNext = ctx->command;
                    ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
                    flag = 1;
                }
            }
            ctx->stateUpdateMonCondition++;
            break;
        case UMC_STATE_EMBARGO:
            if (ctx->battleMons[battlerId].unk88.embargoFlag) {
                if (--ctx->battleMons[battlerId].unk88.embargoFlag == 0) {
                    ctx->battlerIdTemp = battlerId;
                    ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, 244);
                    ctx->commandNext = ctx->command;
                    ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
                    flag = 1;
                }
            }
            ctx->stateUpdateMonCondition++;
            break;
        case UMC_STATE_YAWN:
            if (ctx->battleMons[battlerId].moveEffectFlags & MOVE_EFFECT_FLAG_YAWN) {
                ctx->battleMons[battlerId].moveEffectFlags -= 1 << MOVE_EFFECT_FLAG_YAWN_SHIFT;
                if ((ctx->battleMons[battlerId].moveEffectFlags & MOVE_EFFECT_FLAG_YAWN) == 0) {
                    ctx->battlerIdStatChange = battlerId;
                    ctx->statChangeType = 4;
                    ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, 18);
                    ctx->commandNext = ctx->command;
                    ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
                    flag = 1;
                }
            }
            ctx->stateUpdateMonCondition++;
            break;  
        case UMC_STATE_HELD_ITEM_STATUS:
            int script;
            
            if (CheckUseHeldItem(bsys, ctx, battlerId, &script) == TRUE) {
                ctx->battlerIdTemp = battlerId;
                ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, script);
                ctx->commandNext = ctx->command;
                ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
                flag = 1;
            }
            ctx->stateUpdateMonCondition++;
            break;
        case UMC_STATE_HELD_ITEM_DAMAGE:
            if (TryHeldItemNegativeEffect(bsys, ctx, battlerId) == TRUE) {
                flag = 1;
            }
            ctx->stateUpdateMonCondition++;
            break;
        case UMC_STATE_END:
            ctx->stateUpdateMonCondition = 0;
            ctx->updateMonConditionData++;
            break;
        }
        if (flag) {
            ov12_022642F0(bsys);
            return;
        }
    }
    ctx->stateUpdateMonCondition = 0;
    ctx->updateMonConditionData = 0;
    ctx->command = CONTROLLER_COMMAND_11;
}

typedef enum UpdateFieldConditionExtraState {
    UFCE_STATE_FUTURE_SIGHT,
    UFCE_STATE_PERISH_SONG,
    UFCE_STATE_TRICK_ROOM,
    UFCE_STATE_END
} UpdateFieldConditionExtraState;

//Future sight and doom desire are here due to mons being able to faint simulataneously, which means exp shouldn't be awarded like when a mon faints due to burn
//Trick room is here due to every other update function being reliant on turn order, meaning it must be updated last
//static
void BattleControllerPlayer_UpdateFieldConditionExtra(BattleSystem *bsys, BattleContext *ctx) {
    int maxBattlers = BattleSystem_GetMaxBattlers(bsys);
    int battlerId;
    
    if (ov12_0224DC74(ctx, ctx->command, ctx->command, 1) == TRUE) {
        return;
    }
    
    ov12_022642F0(bsys);
    
    switch (ctx->stateUpdateFieldConditionExtra) {
    case UFCE_STATE_FUTURE_SIGHT:
        while (ctx->updateFieldConditionExtraData < maxBattlers) {
            battlerId = ctx->turnOrder[ctx->updateFieldConditionExtraData];
            if (ctx->unk_3108 & MaskOfFlagNo(battlerId)) {
                ctx->updateFieldConditionExtraData++;
                continue;
            }
            ctx->updateFieldConditionExtraData++;
            if (ctx->fieldConditionData.futureSightTurns[battlerId]) {
                if (!(--ctx->fieldConditionData.futureSightTurns[battlerId]) && ctx->battleMons[battlerId].hp) {
                    ctx->fieldSideConditionFlags[BattleSystem_GetFieldSide(bsys, battlerId)] &= ~SIDE_CONDITION_FUTURE_SIGHT;
                    ctx->buffMsg.id = msg_0197_00475; //Seadra took the Doom Desire attack!
                    ctx->buffMsg.tag = 10;
                    ctx->buffMsg.param[0] = CreateNicknameTag(ctx, battlerId);
                    ctx->buffMsg.param[1] = ctx->fieldConditionData.futureSightMoveNo[battlerId];
                    ctx->battlerIdTemp = battlerId;
                    ctx->unk_11C = ctx->fieldConditionData.battlerIdFutureSight[battlerId];
                    ctx->moveTemp = ctx->fieldConditionData.futureSightMoveNo[battlerId];
                    ctx->hpCalc = ctx->fieldConditionData.futureSightDamage[battlerId];
                    ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, 121);
                    ctx->commandNext = ctx->command;
                    ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
                    return;
                }
            }
        }
        ctx->stateUpdateFieldConditionExtra++;
        ctx->updateFieldConditionExtraData = 0;
    case UFCE_STATE_PERISH_SONG:
        while (ctx->updateFieldConditionExtraData < maxBattlers) {
            battlerId = ctx->turnOrder[ctx->updateFieldConditionExtraData];
            if (ctx->unk_3108 & MaskOfFlagNo(battlerId)) {
                ctx->updateFieldConditionExtraData++;
                continue;
            }
            ctx->updateFieldConditionExtraData++;
            if (ctx->battleMons[battlerId].moveEffectFlags & MOVE_EFFECT_FLAG_PERISH_SONG) {
                if (ctx->battleMons[battlerId].unk88.perishSongTurns == 0) {
                    ctx->battleMons[battlerId].moveEffectFlags &= ~MOVE_EFFECT_FLAG_PERISH_SONG;
                    ctx->msgTemp = ctx->battleMons[battlerId].unk88.perishSongTurns;
                    ctx->hpCalc = ctx->battleMons[battlerId].hp * -1;
                    ctx->battleStatus |= BATTLE_STATUS_NO_BLINK;
                } else {
                    ctx->msgTemp = ctx->battleMons[battlerId].unk88.perishSongTurns;
                    ctx->battleMons[battlerId].unk88.perishSongTurns--;
                }
                ctx->battlerIdTemp = battlerId;
                ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, 102);
                ctx->commandNext = ctx->command;
                ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
                return;
            }
        }
        ctx->stateUpdateFieldConditionExtra++;
        ctx->updateFieldConditionExtraData = 0;
    case UFCE_STATE_TRICK_ROOM:
        if (ctx->fieldCondition & FIELD_CONDITION_TRICK_ROOM) {
            ctx->fieldCondition -= 1 << FIELD_CONDITION_TRICK_ROOM_SHIFT;
            if (!(ctx->fieldCondition & FIELD_CONDITION_TRICK_ROOM)) {
                ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, 251);
                ctx->commandNext = ctx->command;
                ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
                return;
            }
        }
        ctx->stateUpdateFieldConditionExtra++;
        ctx->updateFieldConditionExtraData = 0;
        break;
    default:
        break;
    }
    ctx->stateUpdateFieldConditionExtra = 0;
    ctx->updateFieldConditionExtraData = 0;
    ctx->command = CONTROLLER_COMMAND_12;
}

//static
void BattleControllerPlayer_TurnEnd(BattleSystem *bsys, BattleContext *ctx) {
    if (ov12_0224DD18(ctx, ctx->command, ctx->command) == TRUE) {
        return;
    }
    
    if (ov12_0224D7EC(bsys, ctx) == TRUE) {
        return;
    }
    
    if (ov12_0224D540(bsys, ctx) == TRUE) {
        return;
    }
    
    ctx->totalTurns++;
    ctx->meFirstTotal++;
    
    BattleContext_Init(ctx);
    ov12_02251710(bsys, ctx);
    ctx->command = CONTROLLER_COMMAND_TRAINER_MESSAGE;
}

//static
void BattleControllerPlayer_FightInput(BattleSystem *bsys, BattleContext *ctx) {
    int flag = 0;
    
    ctx->battlerIdAttacker = ctx->unk_21E8[ctx->unk_EC];
    
    if (ctx->turnData[ctx->battlerIdAttacker].struggleFlag) {
        ctx->moveNoTemp = MOVE_STRUGGLE;
        flag = 1;
    } else if (ctx->battleMons[ctx->battlerIdAttacker].unk88.encoredMove &&
               ctx->battleMons[ctx->battlerIdAttacker].unk88.encoredMove == ctx->battleMons[ctx->battlerIdAttacker].moves[ctx->battleMons[ctx->battlerIdAttacker].unk88.encoredMoveIndex]) {
       ctx->moveNoTemp = ctx->battleMons[ctx->battlerIdAttacker].unk88.encoredMove;
       flag = 1;
   } else if (ctx->battleMons[ctx->battlerIdAttacker].unk88.encoredMove &&
               ctx->battleMons[ctx->battlerIdAttacker].unk88.encoredMove != ctx->battleMons[ctx->battlerIdAttacker].moves[ctx->battleMons[ctx->battlerIdAttacker].unk88.encoredMoveIndex]) {
       ctx->moveNoTemp = ctx->battleMons[ctx->battlerIdAttacker].moves[ctx->battleMons[ctx->battlerIdAttacker].unk88.encoredMoveIndex];
       ctx->battleMons[ctx->battlerIdAttacker].unk88.encoredMove = 0;
       ctx->battleMons[ctx->battlerIdAttacker].unk88.encoredMoveIndex = 0;
       ctx->battleMons[ctx->battlerIdAttacker].unk88.encoredTurns = 0;
       flag = 1;
   } else if (!Battler_CanSelectAction(ctx, ctx->battlerIdAttacker)) {
       ctx->moveNoTemp = ctx->moveNoLockedInto[ctx->battlerIdAttacker];
   } else if (ctx->unk_30B4[ctx->battlerIdAttacker] != ctx->battleMons[ctx->battlerIdAttacker].moves[ctx->movePos[ctx->battlerIdAttacker]]) {
       ctx->moveNoTemp = ctx->battleMons[ctx->battlerIdAttacker].moves[ctx->movePos[ctx->battlerIdAttacker]];
       flag = 1;
   } else {
       ctx->moveNoTemp = ctx->battleMons[ctx->battlerIdAttacker].moves[ctx->movePos[ctx->battlerIdAttacker]];
   }
   ctx->moveNoCur = ctx->moveNoTemp;
   ctx->command = CONTROLLER_COMMAND_23;
   ctx->battlerIdTarget = ov12_022506D4(bsys, ctx, ctx->battlerIdAttacker, ctx->moveNoTemp, flag, 0);
   ov12_022642F0(bsys);
}

//static
void BattleControllerPlayer_ItemInput(BattleSystem *bsys, BattleContext *ctx) {
    BattleItem *item;
    int script;
    
    ctx->battlerIdAttacker = ctx->unk_21E8[ctx->unk_EC];
    ctx->battlerIdTarget = ov12_02253DA0(bsys, ctx, ctx->battlerIdAttacker);
    item = (BattleItem *)&ctx->unk_21A8[ctx->battlerIdAttacker][2];
    
    if (BattleSystem_GetFieldSide(bsys, ctx->battlerIdAttacker)) {
        switch (ctx->unk_334.unk9D[ctx->battlerIdAttacker >> 1]) {
        case 0:
            script = 289;
            break;
        case 1:
            script = 267;
            break;
        case 2:
            if ((ctx->unk_334.unk9F[ctx->battlerIdAttacker >> 1] & 1) && (ctx->unk_334.unk9F[ctx->battlerIdAttacker >> 1] & 0x3e)) {
                ctx->msgTemp = 6;
            } else {
                ctx->msgTemp = LowestFlagNo(ctx->unk_334.unk9F[ctx->battlerIdAttacker >> 1]);
            }
            script = 268;
            break;
        case 3:
            ctx->msgTemp = ctx->unk_334.unk9F[ctx->battlerIdAttacker >> 1];
            script = 269;
            break;
        case 4:
            script = 270;
            break;
        }
        ctx->itemTemp = ctx->unk_334.unkA0[ctx->battlerIdAttacker >> 1];
    } else {
        switch (item->page) {
        case BTLPOCKETLIST_HP_PP_RESTORE:
        case BTLPOCKETLIST_STATUS_RESTORE:
        case BTLPOCKETLIST_BATTLE_ITEMS:
            if (item->id == ITEM_POKE_DOLL || item->id == ITEM_FLUFFY_TAIL) {
                script = 222;
            } else {
                script = 223;
            }
            break;
        case BTLPOCKETLIST_BALLS:
            script = 11;
            if (!(BattleSystem_GetBattleType(bsys) & BATTLE_TYPE_TRAINER) && !(BattleSystem_GetBattleType(bsys) & BATTLE_TYPE_TUTORIAL)) {
                Bag_TakeItem(BattleSystem_GetBag(bsys), item->id, 1, HEAP_ID_BATTLE);
                BagCursor_Battle_SetLastUsedItem(BattleSystem_GetBagCursor(bsys), item->id, item->page);
            }
            break;
        }
        ctx->itemTemp = item->id;
    }
    
    ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, script);
    ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
    ctx->commandNext = CONTROLLER_COMMAND_40;
    ctx->moveStatusFlag |= MOVE_STATUS_31;
}

//static
void BattleControllerPlayer_PokemonInput(BattleSystem *bsys, BattleContext *ctx) {
    ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, 9);
    ctx->battlerIdAttacker = ctx->unk_21E8[ctx->unk_EC];
    ctx->battlerIdSwitch = ctx->battlerIdAttacker;
    ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
    ctx->commandNext = CONTROLLER_COMMAND_41;
    ctx->tempData = 0;
    ctx->moveStatusFlag |= MOVE_STATUS_31;
}

//static
void BattleControllerPlayer_RunInput(BattleSystem *bsys, BattleContext *ctx) {
    ctx->battlerIdAttacker = ctx->unk_21E8[ctx->unk_EC];
    
    if (BattleSystem_GetFieldSide(bsys, ctx->battlerIdAttacker) && !(BattleSystem_GetBattleType(bsys) & BATTLE_TYPE_LINK)) {
        if (ctx->battleMons[ctx->battlerIdAttacker].status2 & (STATUS2_BINDING_TURNS | STATUS2_MEAN_LOOK)) {
            ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, 286);
            ctx->scriptSeqNo = 0;
            ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
            ctx->commandNext = CONTROLLER_COMMAND_40;
        } else {
            ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, 230);
            ctx->scriptSeqNo = 0;
            ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
            ctx->commandNext = CONTROLLER_COMMAND_44;
        }
    } else {
        if (BattleTryRun(bsys, ctx, ctx->battlerIdAttacker)) {
            ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, 3);
            ctx->scriptSeqNo = 0;
            ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
            ctx->commandNext = CONTROLLER_COMMAND_44;
        } else {
            ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, 8);
            ctx->scriptSeqNo = 0;
            ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
            ctx->commandNext = CONTROLLER_COMMAND_40;
        }
    }
}

//static
void BattleControllerPlayer_SafariBallInput(BattleSystem *bsys, BattleContext *ctx) {
    int cnt;
    
    ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, 275);
    ctx->battlerIdAttacker = BATTLER_PLAYER;
    ctx->battlerIdTarget = BATTLER_ENEMY;
    ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
    ctx->commandNext = CONTROLLER_COMMAND_40;
    ctx->itemTemp = ITEM_SAFARI_BALL;
    cnt = BattleSystem_GetSafariBallCount(bsys) - 1;
    BattleSystem_SetSafariBallCount(bsys, cnt);
    ov12_02263A1C(bsys, ctx, BATTLER_PLAYER);
}
