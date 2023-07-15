#include "global.h"
#include "battle_controller_player.h"
#include "battle_controller.h"
#include "battle_controller_opponent.h"
#include "battle_system.h"
#include "overlay_12_0224E4FC.h"
#include "heap.h"

extern ControllerFunction sPlayerBattleCommands[];

BATTLECONTEXT *BattleContext_New(BattleSystem *bsys) {
    BATTLECONTEXT *ctx = (BATTLECONTEXT *) AllocFromHeap(HEAP_ID_BATTLE, sizeof(BATTLECONTEXT));
    MIi_CpuClearFast(0, (u32 *)ctx, sizeof(BATTLECONTEXT));
    
    BattleContext_Init(ctx);
    ov12_02251038(bsys, ctx);
    ov12_0224E384(bsys, ctx);
    LoadMoveTbl(ctx->unk_334.moveData);
    ctx->unk_334.itemData = LoadAllItemData(HEAP_ID_BATTLE);
    
    return ctx;
}

BOOL BattleMain(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    if (!ctx->battleEndFlag) {
        if (BattleSystem_GetWinLoseFlags(bsys) && !(BattleSystem_GetWinLoseFlags(bsys) & 0x40)) {
            ctx->command = CONTROLLER_COMMAND_42;
        }
    }
    
    sPlayerBattleCommands[ctx->command](bsys, ctx);
    if (ctx->command == CONTROLLER_COMMAND_45) {
        return TRUE;
    }
    return FALSE;
}

void BattleContext_Delete(BATTLECONTEXT *ctx) {
    FreeToHeap(ctx->unk_334.itemData);
    FreeToHeap(ctx);
}

void BattleSystem_CheckMoveHitEffect(BattleSystem *bsys, BATTLECONTEXT *ctx, int battlerIdAttacker, int battlerIdTarget, int moveNo) {
    BattleSystem_CheckMoveHit(bsys, ctx, battlerIdAttacker, battlerIdTarget, moveNo);
    BattleSystem_CheckMoveEffect(bsys, ctx, battlerIdAttacker, battlerIdTarget, moveNo);
}

//static
void BattleControllerPlayer_GetBattleMon(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    int battlerId;
    int maxBattlers = BattleSystem_GetMaxBattlers(bsys);
    
    for (battlerId = 0; battlerId < maxBattlers; battlerId++) {
        BattleSystem_GetBattleMon(bsys, ctx, battlerId, ctx->selectedMonIndex[battlerId]);
    }
    
    ctx->hpTemp = ctx->battleMons[1].hp;
    ctx->command = CONTROLLER_COMMAND_START_ENCOUNTER;
}

//static
void BattleControllerPlayer_StartEncounter(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, 0);
    ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
    ctx->commandNext = CONTROLLER_COMMAND_TRAINER_MESSAGE;
}

//static
void BattleControllerPlayer_TrainerMessage(BattleSystem *bsys, BATTLECONTEXT *ctx) {
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
void BattleControllerPlayer_PokemonAppear(BattleSystem *bsys, BATTLECONTEXT *ctx) {
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
void BattleControllerPlayer_SelectionScreenInit(BattleSystem *bsys, BATTLECONTEXT *ctx) {
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

//static
void BattleControllerPlayer_SelectionScreenInput(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    int battlerId;
    int battlersMax; 
    int var;
    u16 battleType;
    BATTLEMSG msg;

    battlersMax = BattleSystem_GetMaxBattlers(bsys);
    battleType = BattleSystem_GetBattleType(bsys);
    
    var = 0;
    
    for (battlerId = 0; battlerId < battlersMax; battlerId++) {
        switch (ctx->unk_0[battlerId]) {
        case 0:
            if ((battleType & BATTLE_TYPE_DOUBLES) && !(battleType & BATTLE_TYPE_MULTI) && ((battlerId == BATTLER_PLAYER2) && (ctx->unk_0[0] != 14) || (battlerId == BATTLER_ENEMY2) && (ctx->unk_0[1] != 14))) {
                break;
            }
            if (ctx->unk_3108 & MaskOfFlagNo(battlerId)) {
                ctx->unk_0[battlerId] = 13;
                ctx->unk_21A8[battlerId][0] = 40;
                break;
            } else if (Battler_CanSelectAction(ctx, battlerId) == 0) {
                ctx->turnData[battlerId].unk0_1 = 1;
                ctx->unk_0[battlerId] = 13;
                ctx->unk_21A8[battlerId][0] = 13;
                break;
            }

            if ((ov12_02261264(BattleSystem_GetOpponentDataByBattlerId(bsys, battlerId)) == 1) || (ctx->totalTurns)) {
                ov12_02262B80(bsys, ctx, battlerId, ctx->selectedMonIndex[battlerId]);
                ctx->unk_0[battlerId] = 1;
            } else {
                ctx->unk_0[battlerId] = 2;
            }
            break;
        case 2:
            int battlerIdCheck;

            for (battlerIdCheck = 0; battlerIdCheck < battlersMax; battlerIdCheck++) {
                if (battlerIdCheck == battlerId) {
                    continue;
                }

                if (ov12_02261264(BattleSystem_GetOpponentDataByBattlerId(bsys, battlerIdCheck)) != 0x1) {
                    continue;
                }

                if (ctx->unk_0[battlerIdCheck] != 14) {
                    break;
                }
            }

            if (battlerIdCheck == battlersMax) {
                ov12_02262B80(bsys, ctx, battlerId, ctx->selectedMonIndex[battlerId]);
                ctx->unk_0[battlerId] = 1;
            } else {
                break;
            }
        //fallthrough
        case 1:
            if (ov12_0225682C(ctx, battlerId)) {
                ctx->unk_21A8[battlerId][3] = ctx->unk_2300[battlerId][0];

                if (battleType & BATTLE_TYPE_PAL_PARK) {
                    switch (ov12_0225682C(ctx, battlerId)) {
                    case 1:
                        ctx->unk_0[battlerId] = 17;
                        ctx->unk_4[battlerId] = 13;
                        ctx->unk_21A8[battlerId][0] = 17;
                        break;
                    case 4:
                        ctx->unk_0[battlerId] = 17;
                        ctx->unk_4[battlerId] = 13;
                        ctx->unk_21A8[battlerId][0] = 16;
                        break;
                    }
                } else if (battleType & BATTLE_TYPE_SAFARI) {
                    switch (ov12_0225682C(ctx, battlerId)) {
                    case 1:
                        ctx->unk_0[battlerId] = 17;
                        ctx->unk_4[battlerId] = 13;
                        ctx->unk_21A8[battlerId][0] = 17;
                        break;
                    case 2:
                        ctx->unk_0[battlerId] = 17;
                        ctx->unk_4[battlerId] = 13;
                        ctx->unk_21A8[battlerId][0] = 18;
                        break;
                    case 3:
                        ctx->unk_0[battlerId] = 17;
                        ctx->unk_4[battlerId] = 13;
                        ctx->unk_21A8[battlerId][0] = 19;
                        break;
                    case 4:
                        ctx->unk_0[battlerId] = 17;
                        ctx->unk_4[battlerId] = 13;
                        ctx->unk_21A8[battlerId][0] = 16;
                        break;
                    case 5:
                        ctx->unk_0[battlerId] = 17;
                        ctx->unk_0[battlerId] = 13;
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

                            if (BattleSystem_GetBattleFlags(bsys) & 0x10) {
                                ctx->unk_0[battlerId] = 13;
                            } else {
                                ctx->unk_0[battlerId] = 17;
                                ctx->unk_4[battlerId] = 16;
                            }
                        } else if (ctx->battleMons[battlerId].unk88.encoredMove) {
                            ctx->movePos[battlerId] = ctx->battleMons[battlerId].unk88.encoredMoveIndex;
                            ctx->unk_30B4[battlerId] = ctx->battleMons[battlerId].unk88.encoredMove;
                            ctx->unk_21A8[battlerId][2] = 0;

                            if (BattleSystem_GetBattleFlags(bsys) & 0x10) {
                                ctx->unk_0[battlerId] = 13;
                            } else {
                                ctx->unk_0[battlerId] = 17;
                                ctx->unk_4[battlerId] = 13;
                            }
                        } else {
                            ctx->unk_0[battlerId] = 3;
                        }

                        ctx->unk_21A8[battlerId][0] = 13;
                        break;
                    case 2: //Item
                        if (BattleSystem_GetBattleType(bsys) & (1 << 12)) {
                            ctx->unk_0[battlerId] = 17;
                            ctx->unk_4[battlerId] = 13;
                            ctx->unk_21A8[battlerId][0] = 21;
                        } else if (BattleSystem_GetBattleType(bsys) & (BATTLE_TYPE_LINK | BATTLE_TYPE_TOWER)) {
                            msg.id = 593;
                            msg.tag = 0;
                            ov12_022639B8(bsys, battlerId, msg);
                            ctx->unk_0[battlerId] = 15;
                            ctx->unk_4[battlerId] = 0;
                        } else {
                            ctx->unk_21A8[battlerId][0] = 14;
                            ctx->unk_0[battlerId] = 7;
                        }
                        break;
                    case 3: //Pokemon
                        ctx->unk_21A8[battlerId][0] = 15;
                        ctx->unk_0[battlerId] = 9;
                        break;
                    case 4: //Run
                        ctx->unk_21A8[battlerId][0] = 16;
                        ctx->unk_0[battlerId] = 11;
                        break;
                    case 0xff: //Cancel
                        if (battleType & BATTLE_TYPE_LINK) {
                            ov12_02263CCC(bsys, battlerId);
                            ctx->unk_0[battlerId] = 0;
                            ctx->unk_0[BattleSystem_GetBattlerIdPartner(bsys, battlerId)] = 0;
                        } else if ((battleType & BATTLE_TYPE_DOUBLES) && (battlerId == BATTLER_PLAYER2)) {
                            ov12_02263CCC(bsys, battlerId);
                            ctx->unk_0[0] = 0;
                            ctx->unk_0[2] = 0;
                        }
                        break;
                    }
                }
            }
            break;
        case 3:
            ov12_02262F40(bsys, ctx, battlerId);
            ctx->unk_0[battlerId] = 4;
            //fallthrough
        case 4:
            if (ov12_0225682C(ctx, battlerId) == 0xff) {
                ctx->unk_0[battlerId] = 0;
            } else if (ov12_0225682C(ctx, battlerId)) {
                if ((ctx->unk_2300[battlerId][0] - 1) == 4) {
                    ctx->unk_21A8[battlerId][0] = 16;
                    ctx->unk_0[battlerId] = 11;
                    break;
                } else if (ov12_02251A28(bsys, ctx, battlerId, ctx->unk_2300[battlerId][0] - 1, &msg) == 0) {
                    if (BattleSystem_GetBattleFlags(bsys) & BATTLE_TYPE_INGAME_PARTNER) {
                        ov12_0223BFFC(bsys, 1);
                        ov12_022581BC(bsys, ov12_0223A7E4(bsys));
                    } else {
                        ov12_022639B8(bsys, battlerId, msg);
                        ctx->unk_0[battlerId] = 15;
                        ctx->unk_4[battlerId] = 3;
                    }
                } else {
                    ctx->unk_21A8[battlerId][2] = ctx->unk_2300[battlerId][0];
                    ctx->movePos[battlerId] = ctx->unk_2300[battlerId][0] - 1;
                    ctx->unk_30B4[battlerId] = ctx->battleMons[battlerId].moves[ctx->movePos[battlerId]];
                    ctx->unk_0[battlerId] = 5;
                    ctx->unk_314C[battlerId] |= 0x2;
                }
            }
            break;
        case 5:
            int out;

            if (ov12_0224DB64(bsys, ctx, battlerId, battleType, &out, ctx->movePos[battlerId], &ctx->unk_21A8[battlerId][1])) {
                ov12_02262FFC(bsys, ctx, out, battlerId);
                ctx->unk_0[battlerId] = 6;
            } else {
                ctx->unk_0[battlerId] = 13;
            }
            break;
        case 6:
            if (ov12_0225682C(ctx, battlerId) == 0xff) {
                ctx->unk_0[battlerId] = 3;
            } else if (ov12_0225682C(ctx, battlerId)) {
                ctx->unk_21A8[battlerId][1] = ctx->unk_2300[battlerId][0] - 1;
                ctx->unk_0[battlerId] = 13;

                ctx->unk_314C[battlerId] |= 0x4;
            }
            break;
        case 7:
            ov12_02263138(bsys, ctx, battlerId);
            ctx->unk_0[battlerId] = 8;
        case 8:
            if (ov12_0225682C(ctx, battlerId) == 0xff) {
                ctx->unk_0[battlerId] = 0;
            } else if (ov12_0225682C(ctx, battlerId)) {
                u32 *unkPtr;

                unkPtr = (u32 *)&ctx->unk_2300[battlerId][0];
                ctx->unk_21A8[battlerId][2] = unkPtr[0];
                ctx->unk_0[battlerId] = 13;
            }
            break;
        case 9: //switching..?
            int v8;
            int v9 = 6;
            int partnerId;

            v8 = BattlerCanSwitch(bsys, ctx, battlerId);

            if (((ov12_0223AB0C(bsys, battlerId) == 4) || (ov12_0223AB0C(bsys, battlerId) == 5)) && ((battleType == (0x2 | 0x1)) || (battleType == (0x4 | 0x1 | 0x2)) || (battleType == (0x2 | 0x1 | 0x80)) || ((battleType == (0x2 | 0x1 | 0x10)) && (ov12_0223AB0C(bsys, battlerId) == 4)))) {
                partnerId = BattleSystem_GetBattlerIdPartner(bsys, battlerId);

                if (ctx->unk_21A8[partnerId][0] == 15) {
                    v9 = ctx->unk_21A8[partnerId][2];
                }
            }

            BattleController_EmitShowMonList(bsys, ctx, battlerId, 0, v8, v9);
            ctx->unk_0[battlerId] = 10;
        //fallthrough
        case 10:
            if (ov12_0225682C(ctx, battlerId) == 0xff) {
                ctx->unk_0[battlerId] = 0;
            } else if (ov12_0225682C(ctx, battlerId)) {
                ctx->unk_21A8[battlerId][2] = ctx->unk_2300[battlerId][0] - 1;
                ctx->unk_21A0[battlerId] = ctx->unk_2300[battlerId][0] - 1;
                ctx->unk_0[battlerId] = 13;
            }
            break;
        case 11: //Flee after a mon fainted..?
            if (battleType & BATTLE_TYPE_TOWER) {
                BattleController_EmitDrawYesNoBox(bsys, ctx, battlerId, 955, 0, 0, 0);
                ctx->unk_0[battlerId] = 12;
            } else if ((battleType & BATTLE_TYPE_SINGLES) && !(battleType & BATTLE_TYPE_LINK)) {
                if (BattleSystem_GetBattleFlags(bsys) & 0x10) {
                    ov12_0223BFFC(bsys, 1);
                    ov12_022581BC(bsys, ov12_0223A7E4(bsys));
                } else {
                    msg.tag = 0;
                    msg.id = 793; //TODO: replace with msg constants
                    ov12_022639B8(bsys, battlerId, msg);
                    ctx->unk_0[battlerId] = 15;
                    ctx->unk_4[battlerId] = 0;
                }
            } else if (CantEscape(bsys, ctx, battlerId, &msg)) {
                if (BattleSystem_GetBattleFlags(bsys) & 0x10) {
                    ov12_0223BFFC(bsys, 1);
                    ov12_022581BC(bsys, ov12_0223A7E4(bsys));
                } else {
                    ov12_022639B8(bsys, battlerId, msg);
                    ctx->unk_0[battlerId] = 15;
                    ctx->unk_4[battlerId] = 0;
                }
            } else {
                ctx->unk_0[battlerId] = 12;
            }
            break;
        case 12:
            if (battleType & BATTLE_TYPE_TOWER) {
                if (ov12_0225682C(ctx, battlerId)) {
                    if (ov12_0225682C(ctx, battlerId) == 0xff) {
                        ctx->unk_0[battlerId] = 0;
                    } else {
                        ctx->unk_0[battlerId] = 13;
                    }
                }
            } else {
                ctx->unk_0[battlerId] = 13;
            }

            if ((battleType & BATTLE_TYPE_DOUBLES) && !(battleType & BATTLE_TYPE_MULTI) && (ctx->unk_0[battlerId] == 13)) {
                ctx->unk_0[BattleSystem_GetBattlerIdPartner(bsys, battlerId)] = 13;
            }
            break;
        case 13: //WIFI wait for partner to make a move..?
            ov12_02263CCC(bsys, battlerId);

            if (battleType == (BATTLE_TYPE_SINGLES | BATTLE_TYPE_DOUBLES | BATTLE_TYPE_LINK)) {
                int partnerId;

                partnerId = BattleSystem_GetBattlerIdPartner(bsys, battlerId);

                if (ctx->unk_0[partnerId] == 14) {
                    BattleController_EmitShowWaitMessage(bsys, battlerId);
                }
            } else {
                BattleController_EmitShowWaitMessage(bsys, battlerId);
            }

            ctx->unk_0[battlerId] = 14;
        case 14:
            var++; //this might be counting the number of players who have selected their final action?
            break;
        case 15:
            if (ov12_0225682C(ctx, battlerId)) {
                ov12_0224EDC0(ctx, battlerId);
                ctx->unk_0[battlerId] = ctx->unk_4[battlerId];
            }
            break;
        case 16:
            msg.tag = 2;
            msg.id = 608;
            msg.param[0] = CreateNicknameTag(ctx, battlerId);
            ov12_022639B8(bsys, battlerId, msg);
            ctx->unk_0[battlerId] = 15;
            ctx->unk_4[battlerId] = 13;
            break;
        case 17:
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
void ov12_02249190(BattleSystem *bsys, BATTLECONTEXT *ctx) {
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
void ov12_0224930C(BattleSystem *bsys, BATTLECONTEXT *ctx) {
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
