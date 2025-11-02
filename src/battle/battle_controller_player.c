#include "battle/battle_controller_player.h"

#include "global.h"

#include "constants/abilities.h"
#include "constants/battle_subscript.h"
#include "constants/items.h"
#include "constants/message_tags.h"
#include "constants/move_effects.h"

#include "battle/battle_022378C0.h"
#include "battle/battle_command.h"
#include "battle/battle_controller.h"
#include "battle/battle_controller_opponent.h"
#include "battle/battle_system.h"
#include "battle/overlay_12_0224E4FC.h"
#include "msgdata/msg/msg_0197.h"

#include "heap.h"
#include "sound.h"
#include "unk_0200FA24.h"
#include "unk_02035900.h"

static void BattleControllerPlayer_GetBattleMon(BattleSystem *bsys, BattleContext *ctx);
static void BattleControllerPlayer_StartEncounter(BattleSystem *bsys, BattleContext *ctx);
static void BattleControllerPlayer_TrainerMessage(BattleSystem *bsys, BattleContext *ctx);
static void BattleControllerPlayer_PokemonAppear(BattleSystem *bsys, BattleContext *ctx);
static void BattleControllerPlayer_SelectionScreenInit(BattleSystem *bsys, BattleContext *ctx);
static void BattleControllerPlayer_SelectionScreenInput(BattleSystem *bsys, BattleContext *ctx);
static void BattleControllerPlayer_CalcExecutionOrder(BattleSystem *bsys, BattleContext *ctx);
static void BattleControllerPlayer_BeforeTurn(BattleSystem *bsys, BattleContext *ctx);
static void ov12_02249460(BattleSystem *bsys, BattleContext *ctx);
static void BattleControllerPlayer_UpdateFieldCondition(BattleSystem *bsys, BattleContext *ctx);
static void BattleControllerPlayer_UpdateMonCondition(BattleSystem *bsys, BattleContext *ctx);
static void BattleControllerPlayer_UpdateFieldConditionExtra(BattleSystem *bsys, BattleContext *ctx);
static void BattleControllerPlayer_TurnEnd(BattleSystem *bsys, BattleContext *ctx);
static void BattleControllerPlayer_FightInput(BattleSystem *bsys, BattleContext *ctx);
static void BattleControllerPlayer_ItemInput(BattleSystem *bsys, BattleContext *ctx);
static void BattleControllerPlayer_PokemonInput(BattleSystem *bsys, BattleContext *ctx);
static void BattleControllerPlayer_RunInput(BattleSystem *bsys, BattleContext *ctx);
static void BattleControllerPlayer_SafariThrowBall(BattleSystem *bsys, BattleContext *ctx);
static void BattleControllerPlayer_SafariThrowMud(BattleSystem *bsys, BattleContext *ctx);
static void BattleControllerPlayer_SafariRun(BattleSystem *bsys, BattleContext *ctx);
static void BattleControllerPlayer_SafariWatching(BattleSystem *bsys, BattleContext *ctx);
static void BattleControllerPlayer_CatchingContestThrowBall(BattleSystem *bsys, BattleContext *ctx);
static u32 TryDisobedience(BattleSystem *bsys, BattleContext *ctx, int *script);
static BOOL ov12_0224B1FC(BattleSystem *bsys, BattleContext *ctx);
static BOOL ov12_0224B398(BattleSystem *bsys, BattleContext *ctx);
static BOOL ov12_0224B498(BattleSystem *bsys, BattleContext *ctx);
static BOOL ov12_0224B528(BattleSystem *bsys, BattleContext *ctx);
static BOOL ov12_0224BC2C(BattleSystem *bsys, BattleContext *ctx);
static BOOL ov12_0224BCA4(BattleSystem *bsys, BattleContext *ctx);
static BOOL BattleSystem_CheckMoveHit(BattleSystem *bsys, BattleContext *ctx, int battlerIdAttacker, int battlerIdTarget, int move);
static BOOL BattleSystem_CheckMoveEffect(BattleSystem *bsys, BattleContext *ctx, int battlerIdAttacker, int battlerIdTarget, int move);
static BOOL ov12_0224C204(BattleSystem *bsys, BattleContext *ctx);
static void BattleControllerPlayer_RunScript(BattleSystem *bsys, BattleContext *ctx);
static void ov12_0224C38C(BattleSystem *bsys, BattleContext *ctx);
static void ov12_0224C4D8(BattleSystem *bsys, BattleContext *ctx);
static void ov12_0224C5C8(BattleSystem *bsys, BattleContext *ctx);
static void ov12_0224C5F8(BattleSystem *bsys, BattleContext *ctx);
static void ov12_0224C678(BattleSystem *bsys, BattleContext *ctx);
static void BattleControllerPlayer_HpCalc(BattleSystem *bsys, BattleContext *ctx);
static void ov12_0224CAA4(BattleSystem *bsys, BattleContext *ctx);
static void ov12_0224CC84(BattleSystem *bsys, BattleContext *ctx);
static void ov12_0224CC88(BattleSystem *bsys, BattleContext *ctx);
static void ov12_0224CF10(BattleSystem *bsys, BattleContext *ctx);
static void ov12_0224CF14(BattleSystem *bsys, BattleContext *ctx);
static void ov12_0224D014(BattleSystem *bsys, BattleContext *ctx);
static void ov12_0224D03C(BattleSystem *bsys, BattleContext *ctx);
static void ov12_0224D1DC(BattleSystem *bsys, BattleContext *ctx);
static void ov12_0224D224(BattleSystem *bsys, BattleContext *ctx);
static void ov12_0224D238(BattleSystem *bsys, BattleContext *ctx);
static void ov12_0224D23C(BattleSystem *bsys, BattleContext *ctx);
static void ov12_0224D368(BattleSystem *bsys, BattleContext *ctx);
static void ov12_0224D448(BattleSystem *bsys, BattleContext *ctx);
static void ov12_0224D464(BattleSystem *bsys, BattleContext *ctx);
static void ov12_0224D4F0(BattleSystem *bsys, BattleContext *ctx);
static void ov12_0224D504(BattleSystem *bsys, BattleContext *ctx);
static void ov12_0224D53C(BattleSystem *bsys, BattleContext *ctx);
static BOOL ov12_0224D540(BattleSystem *bsys, BattleContext *ctx);
static BOOL ov12_0224D7EC(BattleSystem *bsys, BattleContext *ctx);
static BOOL ov12_0224DB64(BattleSystem *bsys, BattleContext *ctx, u8 battlerId, u32 battleType, int *out, int movePos, u32 *a6);
static void ov12_0224DC0C(BattleSystem *bsys, BattleContext *ctx);
static BOOL TryFaintMon(BattleContext *ctx, ControllerCommand a1, ControllerCommand a2, int a3);
static BOOL ov12_0224DD18(BattleContext *ctx, ControllerCommand a1, ControllerCommand a2);
static void ov12_0224DD74(BattleSystem *bsys, BattleContext *ctx);
static BOOL ov12_0224DF7C(BattleSystem *bsys, BattleContext *ctx);
static BOOL ov12_0224DF98(BattleSystem *bsys, BattleContext *ctx);
static BOOL TryBuildRage(BattleSystem *bsys, BattleContext *ctx);
static BOOL TryItemFlinch(BattleSystem *bsys, BattleContext *ctx);
static BOOL ov12_0224E130(BattleSystem *bsys, BattleContext *ctx);
static BOOL ov12_0224E1BC(BattleSystem *bsys, BattleContext *ctx);
static void ov12_0224E384(BattleSystem *bsys, BattleContext *ctx);
static void ov12_0224E414(BattleSystem *bsys, BattleContext *ctx);

static const ControllerFunction sPlayerBattleCommands[CONTROLLER_COMMAND_MAX] = {
    [CONTROLLER_COMMAND_GET_BATTLE_MON] = BattleControllerPlayer_GetBattleMon,
    [CONTROLLER_COMMAND_START_ENCOUNTER] = BattleControllerPlayer_StartEncounter,
    [CONTROLLER_COMMAND_TRAINER_MESSAGE] = BattleControllerPlayer_TrainerMessage,
    [CONTROLLER_COMMAND_SEND_OUT] = BattleControllerPlayer_PokemonAppear,
    [CONTROLLER_COMMAND_SELECTION_SCREEN_INIT] = BattleControllerPlayer_SelectionScreenInit,
    [CONTROLLER_COMMAND_SELECTION_SCREEN_INPUT] = BattleControllerPlayer_SelectionScreenInput,
    [CONTROLLER_COMMAND_CALC_EXECUTION_ORDER] = BattleControllerPlayer_CalcExecutionOrder,
    [CONTROLLER_COMMAND_BEFORE_TURN] = BattleControllerPlayer_BeforeTurn,
    [CONTROLLER_COMMAND_8] = ov12_02249460,
    [CONTROLLER_COMMAND_UPDATE_FIELD_CONDITION] = BattleControllerPlayer_UpdateFieldCondition,
    [CONTROLLER_COMMAND_UPDATE_MON_CONDITION] = BattleControllerPlayer_UpdateMonCondition,
    [CONTROLLER_COMMAND_UPDATE_FIELD_CONDITION_EXTRA] = BattleControllerPlayer_UpdateFieldConditionExtra,
    [CONTROLLER_COMMAND_TURN_END] = BattleControllerPlayer_TurnEnd,
    [CONTROLLER_COMMAND_FIGHT_INPUT] = BattleControllerPlayer_FightInput,
    [CONTROLLER_COMMAND_ITEM_INPUT] = BattleControllerPlayer_ItemInput,
    [CONTROLLER_COMMAND_POKEMON_INPUT] = BattleControllerPlayer_PokemonInput,
    [CONTROLLER_COMMAND_RUN_INPUT] = BattleControllerPlayer_RunInput,
    [CONTROLLER_COMMAND_SAFARI_THROW_BALL] = BattleControllerPlayer_SafariThrowBall,
    [CONTROLLER_COMMAND_SAFARI_THROW_MUD] = BattleControllerPlayer_SafariThrowMud,
    [CONTROLLER_COMMAND_SAFARI_RUN] = BattleControllerPlayer_SafariRun,
    [CONTROLLER_COMMAND_SAFARI_WATCHING] = BattleControllerPlayer_SafariWatching,
    [CONTROLLER_COMMAND_CATCHING_CONSTEST_THROW_BALL] = BattleControllerPlayer_CatchingContestThrowBall,
    [CONTROLLER_COMMAND_RUN_SCRIPT] = BattleControllerPlayer_RunScript,
    [CONTROLLER_COMMAND_23] = ov12_0224C38C,
    [CONTROLLER_COMMAND_24] = ov12_0224C4D8,
    [CONTROLLER_COMMAND_25] = ov12_0224C5C8,
    [CONTROLLER_COMMAND_26] = ov12_0224C5F8,
    [CONTROLLER_COMMAND_27] = ov12_0224C678,
    [CONTROLLER_COMMAND_HP_CALC] = BattleControllerPlayer_HpCalc,
    [CONTROLLER_COMMAND_29] = ov12_0224CAA4,
    [CONTROLLER_COMMAND_30] = ov12_0224CC84,
    [CONTROLLER_COMMAND_31] = ov12_0224CC88,
    [CONTROLLER_COMMAND_32] = ov12_0224CF14,
    [CONTROLLER_COMMAND_33] = ov12_0224CF10,
    [CONTROLLER_COMMAND_34] = ov12_0224D014,
    [CONTROLLER_COMMAND_35] = ov12_0224D03C,
    [CONTROLLER_COMMAND_36] = ov12_0224D1DC,
    [CONTROLLER_COMMAND_37] = ov12_0224D224,
    [CONTROLLER_COMMAND_38] = ov12_0224D238,
    [CONTROLLER_COMMAND_39] = ov12_0224D23C,
    [CONTROLLER_COMMAND_40] = ov12_0224D368,
    [CONTROLLER_COMMAND_41] = ov12_0224D448,
    [CONTROLLER_COMMAND_42] = ov12_0224D464,
    [CONTROLLER_COMMAND_43] = ov12_0224D4F0,
    [CONTROLLER_COMMAND_44] = ov12_0224D504,
    [CONTROLLER_COMMAND_45] = ov12_0224D53C
};

BattleContext *BattleContext_New(BattleSystem *bsys) {
    BattleContext *ctx = (BattleContext *)Heap_Alloc(HEAP_ID_BATTLE, sizeof(BattleContext));
    MIi_CpuClearFast(0, (u32 *)ctx, sizeof(BattleContext));

    BattleContext_Init(ctx);
    ov12_02251038(bsys, ctx);
    ov12_0224E384(bsys, ctx);
    LoadMoveTbl(ctx->trainerAIData.moveData);
    ctx->trainerAIData.itemData = LoadAllItemData(HEAP_ID_BATTLE);

    return ctx;
}

BOOL BattleContext_Main(BattleSystem *bsys, BattleContext *ctx) {
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
    Heap_Free(ctx->trainerAIData.itemData);
    Heap_Free(ctx);
}

void BattleSystem_CheckMoveHitEffect(BattleSystem *bsys, BattleContext *ctx, int battlerIdAttacker, int battlerIdTarget, int moveNo) {
    BattleSystem_CheckMoveHit(bsys, ctx, battlerIdAttacker, battlerIdTarget, moveNo);
    BattleSystem_CheckMoveEffect(bsys, ctx, battlerIdAttacker, battlerIdTarget, moveNo);
}

static void BattleControllerPlayer_GetBattleMon(BattleSystem *bsys, BattleContext *ctx) {
    int battlerId;
    int maxBattlers = BattleSystem_GetMaxBattlers(bsys);

    for (battlerId = 0; battlerId < maxBattlers; battlerId++) {
        BattleSystem_GetBattleMon(bsys, ctx, battlerId, ctx->selectedMonIndex[battlerId]);
    }

    ctx->hpTemp = ctx->battleMons[1].hp;
    ctx->command = CONTROLLER_COMMAND_START_ENCOUNTER;
}

static void BattleControllerPlayer_StartEncounter(BattleSystem *bsys, BattleContext *ctx) {
    ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_START_ENCOUNTER);
    ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
    ctx->commandNext = CONTROLLER_COMMAND_TRAINER_MESSAGE;
}

static void BattleControllerPlayer_TrainerMessage(BattleSystem *bsys, BattleContext *ctx) {
    if (CheckTrainerMessage(bsys, ctx)) {
        ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_TRAINER_MESSAGE);
        ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
        ctx->commandNext = CONTROLLER_COMMAND_SEND_OUT;
    } else {
        ctx->command = CONTROLLER_COMMAND_SEND_OUT;
    }

    SortMonsBySpeed(bsys, ctx);
}

static void BattleControllerPlayer_PokemonAppear(BattleSystem *bsys, BattleContext *ctx) {
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

static void BattleControllerPlayer_SelectionScreenInit(BattleSystem *bsys, BattleContext *ctx) {
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
    SSI_STATE_SELECT_COMMAND_INIT,
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

static void BattleControllerPlayer_SelectionScreenInput(BattleSystem *bsys, BattleContext *ctx) {
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
        case SSI_STATE_SELECT_COMMAND_INIT:
            if ((battleType & BATTLE_TYPE_DOUBLES) && !(battleType & BATTLE_TYPE_MULTI) && ((battlerId == BATTLER_PLAYER2) && (ctx->unk_0[0] != SSI_STATE_14) || (battlerId == BATTLER_ENEMY2) && (ctx->unk_0[1] != SSI_STATE_14))) {
                break;
            }
            if (ctx->switchInFlag & MaskOfFlagNo(battlerId)) {
                ctx->unk_0[battlerId] = SSI_STATE_13;
                ctx->playerActions[battlerId].command = CONTROLLER_COMMAND_40;
                break;
            } else if (Battler_CanSelectAction(ctx, battlerId) == 0) {
                ctx->turnData[battlerId].unk0_1 = 1;
                ctx->unk_0[battlerId] = SSI_STATE_13;
                ctx->playerActions[battlerId].command = CONTROLLER_COMMAND_FIGHT_INPUT;
                break;
            }

            if ((ov12_02261264(BattleSystem_GetOpponentData(bsys, battlerId)) == 1) || (ctx->totalTurns)) {
                ov12_02262B80(bsys, ctx, battlerId, ctx->selectedMonIndex[battlerId]);
                ctx->unk_0[battlerId] = SSI_STATE_1;
            } else {
                ctx->unk_0[battlerId] = SSI_STATE_2;
            }
            break;
        case SSI_STATE_2: {
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
        }
        // fallthrough
        case SSI_STATE_1:
            if (BattleBuffer_GetNext(ctx, battlerId)) {
                ctx->playerActions[battlerId].inputSelection = ctx->battleBuffer[battlerId][0];

                if (battleType & BATTLE_TYPE_PAL_PARK) {
                    switch (BattleBuffer_GetNext(ctx, battlerId)) {
                    case 1:
                        ctx->unk_0[battlerId] = SSI_STATE_END;
                        ctx->unk_4[battlerId] = SSI_STATE_13;
                        ctx->playerActions[battlerId].command = CONTROLLER_COMMAND_SAFARI_THROW_BALL;
                        break;
                    case 4:
                        ctx->unk_0[battlerId] = SSI_STATE_END;
                        ctx->unk_4[battlerId] = SSI_STATE_13;
                        ctx->playerActions[battlerId].command = CONTROLLER_COMMAND_RUN_INPUT;
                        break;
                    }
                } else if (battleType & BATTLE_TYPE_SAFARI) {
                    switch (BattleBuffer_GetNext(ctx, battlerId)) {
                    case 1:
                        ctx->unk_0[battlerId] = SSI_STATE_END;
                        ctx->unk_4[battlerId] = SSI_STATE_13;
                        ctx->playerActions[battlerId].command = CONTROLLER_COMMAND_SAFARI_THROW_BALL;
                        break;
                    case 2:
                        ctx->unk_0[battlerId] = SSI_STATE_END;
                        ctx->unk_4[battlerId] = SSI_STATE_13;
                        ctx->playerActions[battlerId].command = CONTROLLER_COMMAND_SAFARI_THROW_MUD;
                        break;
                    case 3:
                        ctx->unk_0[battlerId] = SSI_STATE_END;
                        ctx->unk_4[battlerId] = SSI_STATE_13;
                        ctx->playerActions[battlerId].command = CONTROLLER_COMMAND_SAFARI_RUN;
                        break;
                    case 4:
                        ctx->unk_0[battlerId] = SSI_STATE_END;
                        ctx->unk_4[battlerId] = SSI_STATE_13;
                        ctx->playerActions[battlerId].command = CONTROLLER_COMMAND_RUN_INPUT;
                        break;
                    case 5:
                        ctx->unk_0[battlerId] = SSI_STATE_END;
                        ctx->unk_0[battlerId] = SSI_STATE_13;
                        ctx->playerActions[battlerId].command = CONTROLLER_COMMAND_SAFARI_WATCHING;
                        break;
                    }
                } else {
                    if (BattleBuffer_GetNext(ctx, battlerId) != 0xff) {
                        ctx->unk_314C[battlerId] |= 0x1;
                    }

                    switch (BattleBuffer_GetNext(ctx, battlerId)) {
                    case BATTLE_INPUT_FIGHT:
                        if (StruggleCheck(bsys, ctx, battlerId, 0, 0xffffffff) == 15) {
                            ctx->turnData[battlerId].struggleFlag = 1;

                            if (BattleSystem_GetBattleSpecial(bsys) & BATTLE_SPECIAL_RECORDING) {
                                ctx->unk_0[battlerId] = SSI_STATE_13;
                            } else {
                                ctx->unk_0[battlerId] = SSI_STATE_END;
                                ctx->unk_4[battlerId] = SSI_STATE_NO_MOVES;
                            }
                        } else if (ctx->battleMons[battlerId].unk88.encoredMove) {
                            ctx->movePos[battlerId] = ctx->battleMons[battlerId].unk88.encoredMoveIndex;
                            ctx->unk_30B4[battlerId] = ctx->battleMons[battlerId].unk88.encoredMove;
                            ctx->playerActions[battlerId].unk8 = 0;

                            if (BattleSystem_GetBattleSpecial(bsys) & BATTLE_SPECIAL_RECORDING) {
                                ctx->unk_0[battlerId] = SSI_STATE_13;
                            } else {
                                ctx->unk_0[battlerId] = SSI_STATE_END;
                                ctx->unk_4[battlerId] = SSI_STATE_13;
                            }
                        } else {
                            ctx->unk_0[battlerId] = SSI_STATE_3;
                        }

                        ctx->playerActions[battlerId].command = CONTROLLER_COMMAND_FIGHT_INPUT;
                        break;
                    case BATTLE_INPUT_ITEM:
                        if (BattleSystem_GetBattleType(bsys) & BATTLE_TYPE_BUG_CONTEST) {
                            ctx->unk_0[battlerId] = SSI_STATE_END;
                            ctx->unk_4[battlerId] = SSI_STATE_13;
                            ctx->playerActions[battlerId].command = CONTROLLER_COMMAND_CATCHING_CONSTEST_THROW_BALL;
                        } else if (BattleSystem_GetBattleType(bsys) & (BATTLE_TYPE_LINK | BATTLE_TYPE_FRONTIER)) {
                            msg.id = msg_0197_00593; // Items can't be used here
                            msg.tag = TAG_NONE;
                            ov12_022639B8(bsys, battlerId, msg);
                            ctx->unk_0[battlerId] = SSI_STATE_15;
                            ctx->unk_4[battlerId] = SSI_STATE_SELECT_COMMAND_INIT;
                        } else {
                            ctx->playerActions[battlerId].command = CONTROLLER_COMMAND_ITEM_INPUT;
                            ctx->unk_0[battlerId] = 7;
                        }
                        break;
                    case BATTLE_INPUT_POKEMON:
                        ctx->playerActions[battlerId].command = CONTROLLER_COMMAND_POKEMON_INPUT;
                        ctx->unk_0[battlerId] = SSI_STATE_9;
                        break;
                    case BATTLE_INPUT_RUN:
                        ctx->playerActions[battlerId].command = CONTROLLER_COMMAND_RUN_INPUT;
                        ctx->unk_0[battlerId] = SSI_STATE_11;
                        break;
                    case BATTLE_INPUT_CANCEL:
                        if (battleType & BATTLE_TYPE_LINK) {
                            ov12_02263CCC(bsys, battlerId);
                            ctx->unk_0[battlerId] = SSI_STATE_SELECT_COMMAND_INIT;
                            ctx->unk_0[BattleSystem_GetBattlerIdPartner(bsys, battlerId)] = 0;
                        } else if ((battleType & BATTLE_TYPE_DOUBLES) && (battlerId == BATTLER_PLAYER2)) {
                            ov12_02263CCC(bsys, battlerId);
                            ctx->unk_0[0] = SSI_STATE_SELECT_COMMAND_INIT;
                            ctx->unk_0[2] = SSI_STATE_SELECT_COMMAND_INIT;
                        }
                        break;
                    }
                }
            }
            break;
        case SSI_STATE_3:
            ov12_02262F40(bsys, ctx, battlerId);
            ctx->unk_0[battlerId] = SSI_STATE_4;
            // fallthrough
        case SSI_STATE_4:
            if (BattleBuffer_GetNext(ctx, battlerId) == 0xff) {
                ctx->unk_0[battlerId] = SSI_STATE_SELECT_COMMAND_INIT;
            } else if (BattleBuffer_GetNext(ctx, battlerId)) {
                if ((ctx->battleBuffer[battlerId][0] - 1) == BATTLE_INPUT_RUN) {
                    ctx->playerActions[battlerId].command = CONTROLLER_COMMAND_RUN_INPUT;
                    ctx->unk_0[battlerId] = SSI_STATE_11;
                    break;
                } else if (ov12_02251A28(bsys, ctx, battlerId, ctx->battleBuffer[battlerId][0] - 1, &msg) == 0) {
                    if (BattleSystem_GetBattleSpecial(bsys) & BATTLE_SPECIAL_RECORDING) {
                        ov12_0223BFFC(bsys, 1);
                        BattleController_TryEmitExitRecording(bsys, BattleSystem_GetBattleContext(bsys));
                    } else {
                        ov12_022639B8(bsys, battlerId, msg);
                        ctx->unk_0[battlerId] = SSI_STATE_15;
                        ctx->unk_4[battlerId] = SSI_STATE_3;
                    }
                } else {
                    ctx->playerActions[battlerId].unk8 = ctx->battleBuffer[battlerId][0];
                    ctx->movePos[battlerId] = ctx->battleBuffer[battlerId][0] - 1;
                    ctx->unk_30B4[battlerId] = ctx->battleMons[battlerId].moves[ctx->movePos[battlerId]];
                    ctx->unk_0[battlerId] = SSI_STATE_5;
                    ctx->unk_314C[battlerId] |= 0x2;
                }
            }
            break;
        case SSI_STATE_5: {
            int out;

            if (ov12_0224DB64(bsys, ctx, battlerId, battleType, &out, ctx->movePos[battlerId], &ctx->playerActions[battlerId].unk4)) {
                ov12_02262FFC(bsys, ctx, out, battlerId);
                ctx->unk_0[battlerId] = SSI_STATE_6;
            } else {
                ctx->unk_0[battlerId] = SSI_STATE_13;
            }
            break;
        }
        case SSI_STATE_6:
            if (BattleBuffer_GetNext(ctx, battlerId) == 0xff) {
                ctx->unk_0[battlerId] = SSI_STATE_3;
            } else if (BattleBuffer_GetNext(ctx, battlerId)) {
                ctx->playerActions[battlerId].unk4 = ctx->battleBuffer[battlerId][0] - 1;
                ctx->unk_0[battlerId] = SSI_STATE_13;

                ctx->unk_314C[battlerId] |= 0x4;
            }
            break;
        case SSI_STATE_7:
            ov12_02263138(bsys, ctx, battlerId);
            ctx->unk_0[battlerId] = SSI_STATE_8;
        case SSI_STATE_8:
            if (BattleBuffer_GetNext(ctx, battlerId) == 0xff) {
                ctx->unk_0[battlerId] = SSI_STATE_SELECT_COMMAND_INIT;
            } else if (BattleBuffer_GetNext(ctx, battlerId)) {
                u32 *unkPtr;

                unkPtr = (u32 *)&ctx->battleBuffer[battlerId][0];
                ctx->playerActions[battlerId].unk8 = unkPtr[0];
                ctx->unk_0[battlerId] = SSI_STATE_13;
            }
            break;
        case SSI_STATE_9: // switching..?
        {
            int v8;
            int v9 = 6;
            int partnerId;

            v8 = BattlerCanSwitch(bsys, ctx, battlerId);

            if (((ov12_0223AB0C(bsys, battlerId) == 4) || (ov12_0223AB0C(bsys, battlerId) == 5)) && ((battleType == (BATTLE_TYPE_TRAINER | BATTLE_TYPE_DOUBLES)) || (battleType == (BATTLE_TYPE_TRAINER | BATTLE_TYPE_DOUBLES | BATTLE_TYPE_LINK)) || (battleType == (BATTLE_TYPE_TRAINER | BATTLE_TYPE_DOUBLES | BATTLE_TYPE_FRONTIER)) || ((battleType == (BATTLE_TYPE_TRAINER | BATTLE_TYPE_DOUBLES | BATTLE_TYPE_TAG)) && (ov12_0223AB0C(bsys, battlerId) == 4)))) {
                partnerId = BattleSystem_GetBattlerIdPartner(bsys, battlerId);

                if (ctx->playerActions[partnerId].command == CONTROLLER_COMMAND_POKEMON_INPUT) {
                    v9 = ctx->playerActions[partnerId].unk8;
                }
            }

            BattleController_EmitShowMonList(bsys, ctx, battlerId, 0, v8, v9);
            ctx->unk_0[battlerId] = SSI_STATE_10;
        }
        // fallthrough
        case SSI_STATE_10:
            if (BattleBuffer_GetNext(ctx, battlerId) == 0xff) {
                ctx->unk_0[battlerId] = SSI_STATE_SELECT_COMMAND_INIT;
            } else if (BattleBuffer_GetNext(ctx, battlerId)) {
                ctx->playerActions[battlerId].unk8 = ctx->battleBuffer[battlerId][0] - 1;
                ctx->unk_21A0[battlerId] = ctx->battleBuffer[battlerId][0] - 1;
                ctx->unk_0[battlerId] = SSI_STATE_13;
            }
            break;
        case SSI_STATE_11: // Flee after a mon fainted..?
            if (battleType & BATTLE_TYPE_FRONTIER) {
                BattleController_EmitDrawYesNoBox(bsys, ctx, battlerId, 955, 0, 0, 0);
                ctx->unk_0[battlerId] = SSI_STATE_12;
            } else if ((battleType & BATTLE_TYPE_TRAINER) && !(battleType & BATTLE_TYPE_LINK)) {
                if (BattleSystem_GetBattleSpecial(bsys) & BATTLE_SPECIAL_RECORDING) {
                    ov12_0223BFFC(bsys, 1);
                    BattleController_TryEmitExitRecording(bsys, BattleSystem_GetBattleContext(bsys));
                } else {
                    msg.tag = TAG_NONE;
                    msg.id = msg_0197_00793; // There's no running from a Trainer battle!
                    ov12_022639B8(bsys, battlerId, msg);
                    ctx->unk_0[battlerId] = SSI_STATE_15;
                    ctx->unk_4[battlerId] = SSI_STATE_SELECT_COMMAND_INIT;
                }
            } else if (CantEscape(bsys, ctx, battlerId, &msg)) {
                if (BattleSystem_GetBattleSpecial(bsys) & BATTLE_SPECIAL_RECORDING) {
                    ov12_0223BFFC(bsys, 1);
                    BattleController_TryEmitExitRecording(bsys, BattleSystem_GetBattleContext(bsys));
                } else {
                    ov12_022639B8(bsys, battlerId, msg);
                    ctx->unk_0[battlerId] = SSI_STATE_15;
                    ctx->unk_4[battlerId] = SSI_STATE_SELECT_COMMAND_INIT;
                }
            } else {
                ctx->unk_0[battlerId] = SSI_STATE_12;
            }
            break;
        case SSI_STATE_12:
            if (battleType & BATTLE_TYPE_FRONTIER) {
                if (BattleBuffer_GetNext(ctx, battlerId)) {
                    if (BattleBuffer_GetNext(ctx, battlerId) == 0xff) {
                        ctx->unk_0[battlerId] = SSI_STATE_SELECT_COMMAND_INIT;
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
        case SSI_STATE_13: // WIFI wait for partner to make a move..?
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
            var++; // this might be counting the number of players who have selected their final action?
            break;
        case SSI_STATE_15:
            if (BattleBuffer_GetNext(ctx, battlerId)) {
                BattleBuffer_Clear(ctx, battlerId);
                ctx->unk_0[battlerId] = ctx->unk_4[battlerId];
            }
            break;
        case SSI_STATE_NO_MOVES:
            msg.tag = TAG_NICKNAME;
            msg.id = msg_0197_00608; // Spheal has no moves left!
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

        ctx->command = CONTROLLER_COMMAND_CALC_EXECUTION_ORDER;

        for (battlerId = 0; battlerId < battlersMax; battlerId++) {
            if (ctx->playerActions[battlerId].command == CONTROLLER_COMMAND_POKEMON_INPUT) {
                ov12_02256F78(bsys, ctx, battlerId, ctx->unk_21A0[battlerId]);
            }
        }
    }
}

static void BattleControllerPlayer_CalcExecutionOrder(BattleSystem *bsys, BattleContext *ctx) {
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
            ctx->executionOrder[battlerId] = battlerId;
        }
    } else {
        if (battleType & BATTLE_TYPE_LINK) {
            for (battlerId = 0; battlerId < maxBattlers; battlerId++) {
                if (ctx->playerActions[battlerId].inputSelection == BATTLE_INPUT_RUN) {
                    turn = 5;
                    break;
                }
            }
        } else {
            if (ctx->playerActions[BATTLER_PLAYER].inputSelection == BATTLE_INPUT_RUN) {
                battlerId = BATTLER_PLAYER;
                turn = 5;
            }
            if (ctx->playerActions[BATTLER_PLAYER2].inputSelection == BATTLE_INPUT_RUN) {
                battlerId = BATTLER_PLAYER2;
                turn = 5;
            }
        }
        if (turn == 5) {
            ctx->executionOrder[0] = battlerId;
            turn = 1;
            for (i = 0; i < maxBattlers; i++) {
                if (i != battlerId) {
                    ctx->executionOrder[turn] = i;
                    turn++;
                }
            }
        } else {
            for (battlerId = 0; battlerId < maxBattlers; battlerId++) {
                if (ctx->playerActions[battlerId].inputSelection == BATTLE_INPUT_ITEM || ctx->playerActions[battlerId].inputSelection == BATTLE_INPUT_POKEMON) {
                    ctx->executionOrder[turn] = battlerId;
                    turn++;
                }
            }

            for (battlerId = 0; battlerId < maxBattlers; battlerId++) {
                if (ctx->playerActions[battlerId].inputSelection != BATTLE_INPUT_ITEM && ctx->playerActions[battlerId].inputSelection != BATTLE_INPUT_POKEMON) {
                    ctx->executionOrder[turn] = battlerId;
                    turn++;
                }
            }

            for (i = 0; i < maxBattlers - 1; i++) {
                for (j = i + 1; j < maxBattlers; j++) {
                    int battlerId1 = ctx->executionOrder[i];
                    int battlerId2 = ctx->executionOrder[j];

                    if (ctx->playerActions[battlerId1].inputSelection == ctx->playerActions[battlerId2].inputSelection) {
                        if (ctx->playerActions[battlerId1].inputSelection == BATTLE_INPUT_FIGHT) {
                            flag = 0;
                        } else {
                            flag = 1;
                        }
                        if (CheckSortSpeed(bsys, ctx, battlerId1, battlerId2, flag)) {
                            ctx->executionOrder[i] = battlerId2;
                            ctx->executionOrder[j] = battlerId1;
                        }
                    }
                }
            }
        }
    }
    ctx->command = CONTROLLER_COMMAND_BEFORE_TURN;
}

typedef enum BeforeTurnState {
    BT_STATE_FOCUS_PUNCH,
    BT_STATE_RAGE,
    BT_STATE_QUICK_CLAW,
    BT_STATE_END
} BeforeTurnState;

static void BattleControllerPlayer_BeforeTurn(BattleSystem *bsys, BattleContext *ctx) {
    int flag = 0;
    int battlerId;
    int maxBattlers = BattleSystem_GetMaxBattlers(bsys);

    do {
        switch (ctx->stateBeforeTurn) {
        case BT_STATE_FOCUS_PUNCH:
            while (ctx->beforeTurnData < maxBattlers) {
                battlerId = ctx->executionOrder[ctx->beforeTurnData];
                if (ctx->switchInFlag & MaskOfFlagNo(battlerId)) {
                    ctx->beforeTurnData++;
                    continue;
                }
                ctx->beforeTurnData++;
                if (!(ctx->battleMons[battlerId].status & STATUS_SLEEP)
                    && (GetBattlerSelectedMove(ctx, battlerId) == MOVE_FOCUS_PUNCH)
                    && !CheckTruant(ctx, battlerId) && !ctx->turnData[battlerId].struggleFlag) {
                    BattleController_EmitBlankMessage(bsys);
                    ctx->battlerIdTemp = battlerId;
                    ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_TIGHTEN_FOCUS);
                    ctx->commandNext = ctx->command;
                    ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
                    return;
                }
            }
            ctx->beforeTurnData = 0;
            ctx->stateBeforeTurn++;
            break;
        case BT_STATE_RAGE:
            for (battlerId = 0; battlerId < maxBattlers; battlerId++) {
                if ((ctx->battleMons[battlerId].status2 & STATUS2_RAGE) && GetBattlerSelectedMove(ctx, battlerId) != MOVE_RAGE) {
                    ctx->battleMons[battlerId].status2 &= STATUS2_RAGE;
                }
            }
            ctx->stateBeforeTurn++;
            break;
        case BT_STATE_QUICK_CLAW:
            for (battlerId = 0; battlerId < 4; battlerId++) {
                ctx->unk_310C[battlerId] = BattleSystem_Random(bsys);
            }
            ctx->stateBeforeTurn++;
            break;
        case BT_STATE_END:
            ctx->stateBeforeTurn = BT_STATE_FOCUS_PUNCH;
            flag = 2;
            break;
        }
    } while (flag == 0);
    if (flag == 2) {
        ctx->command = CONTROLLER_COMMAND_8;
    }
}

static void ov12_02249460(BattleSystem *bsys, BattleContext *ctx) {
    int maxBattlers;
    int battlerId;

    maxBattlers = BattleSystem_GetMaxBattlers(bsys);

    if (BattleController_TryEmitExitRecording(bsys, ctx)) {
        return;
    }

    ctx->battlersOnField = 0;
    for (battlerId = 0; battlerId < maxBattlers; battlerId++) {
        if (ctx->playerActions[battlerId].command != CONTROLLER_COMMAND_40) {
            ctx->battlersOnField++;
        }
    }

    SortMonsBySpeed(bsys, ctx);

    if (ctx->executionIndex == maxBattlers) {
        ctx->executionIndex = 0;
        ctx->command = CONTROLLER_COMMAND_UPDATE_FIELD_CONDITION;
    } else {
        ctx->command = ctx->playerActions[ctx->executionOrder[ctx->executionIndex]].command;
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

static void BattleControllerPlayer_UpdateFieldCondition(BattleSystem *bsys, BattleContext *ctx) {
    int flag = 0;
    int side;
    int maxBattlers = BattleSystem_GetMaxBattlers(bsys);

    do {
        if (TryFaintMon(ctx, ctx->command, ctx->command, 1) == TRUE) {
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
                        ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_MOVE_EFFECT_END);
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
                        ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_MOVE_EFFECT_END);
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
                        ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_MOVE_EFFECT_END);
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
                        ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_SAFEGUARD_END);
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
                        ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_TAILWIND_END);
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
                        ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_LUCKY_CHANT_END);
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
                    if (--ctx->fieldConditionData.wishTurns[side] == 0 && ctx->battleMons[side].hp != 0) {
                        ctx->battlerIdTemp = side;
                        ctx->buffMsg.tag = TAG_NICKNAME;
                        ctx->buffMsg.id = msg_0197_00533; // Spheal's wish came true!
                        ctx->buffMsg.param[0] = side | (ctx->fieldConditionData.wishTarget[side] << 8);
                        ctx->hpCalc = DamageDivide(ctx->battleMons[side].maxHp, 2);
                        ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_WISH_HEAL);
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
                    ctx->buffMsg.id = msg_0197_00801; // Rain continues to fall.
                    ctx->buffMsg.tag = TAG_NONE;
                    ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_WEATHER_CONTINUES);
                    ctx->commandNext = ctx->command;
                    ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
                } else if (--ctx->fieldConditionData.weatherTurns == 0) {
                    ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_RAINING_END);
                    ctx->commandNext = ctx->command;
                    ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
                } else {
                    ctx->buffMsg.id = msg_0197_00801; // Rain continues to fall.
                    ctx->buffMsg.tag = TAG_NONE;
                    ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_WEATHER_CONTINUES);
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
                    ctx->buffMsg.id = msg_0197_00805; // The sandstorm rages.
                    ctx->buffMsg.tag = TAG_NONE;
                    ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_WEATHER_CONTINUES);
                    ctx->commandNext = ctx->command;
                    ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
                } else if (--ctx->fieldConditionData.weatherTurns == 0) {
                    ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_SANDSTORM_END);
                    ctx->commandNext = ctx->command;
                    ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
                } else {
                    ctx->buffMsg.id = msg_0197_00805; // The sandstorm rages.
                    ctx->buffMsg.tag = TAG_NONE;
                    ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_WEATHER_CONTINUES);
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
                    ctx->buffMsg.id = msg_0197_00808; // The sunlight is strong.
                    ctx->buffMsg.tag = TAG_NONE;
                    ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_WEATHER_CONTINUES);
                    ctx->commandNext = ctx->command;
                    ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
                } else if (--ctx->fieldConditionData.weatherTurns == 0) {
                    ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_SUNNY_END);
                    ctx->commandNext = ctx->command;
                    ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
                } else {
                    ctx->buffMsg.id = msg_0197_00808; // The sunlight is strong.
                    ctx->buffMsg.tag = TAG_NONE;
                    ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_WEATHER_CONTINUES);
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
                    ctx->buffMsg.id = msg_0197_00811; // Hail continues to fall.
                    ctx->buffMsg.tag = TAG_NONE;
                    ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_WEATHER_CONTINUES);
                    ctx->commandNext = ctx->command;
                    ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
                } else if (--ctx->fieldConditionData.weatherTurns == 0) {
                    ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_HAILING_END);
                    ctx->commandNext = ctx->command;
                    ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
                } else {
                    ctx->buffMsg.id = msg_0197_00811; // Hail continues to fall.
                    ctx->buffMsg.tag = TAG_NONE;
                    ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_WEATHER_CONTINUES);
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
                ctx->buffMsg.id = msg_0197_00813; // The fog is deep...
                ctx->buffMsg.tag = TAG_NONE;
                ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_WEATHER_CONTINUES);
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
                    ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_GRAVITY_END);
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
        BattleController_EmitBlankMessage(bsys);
    }

    if (flag == 2) {
        ctx->stateFieldConditionUpdate = 0;
        ctx->command = CONTROLLER_COMMAND_UPDATE_MON_CONDITION;
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

static void BattleControllerPlayer_UpdateMonCondition(BattleSystem *bsys, BattleContext *ctx) {
    int i;
    u8 flag = 0;
    int maxBattlers;
    int battlerId;

    maxBattlers = BattleSystem_GetMaxBattlers(bsys);

    if (TryFaintMon(ctx, ctx->command, ctx->command, 1) == TRUE) {
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
        if (ctx->switchInFlag & MaskOfFlagNo(battlerId)) {
            ctx->updateMonConditionData++;
            continue;
        }
        switch (ctx->stateUpdateMonCondition) {
        case UMC_STATE_INGRAIN:
            if ((ctx->battleMons[battlerId].moveEffectFlags & MOVE_EFFECT_FLAG_INGRAIN) && ctx->battleMons[battlerId].hp != ctx->battleMons[battlerId].maxHp && ctx->battleMons[battlerId].hp != 0) {
                if (ctx->battleMons[battlerId].unk88.healBlockTurns) {
                    ctx->battlerIdTemp = battlerId;
                    ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_CANNOT_HEAL);
                } else {
                    ctx->battlerIdTemp = battlerId;
                    ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_INGRAIN_HEAL);
                }
                ctx->commandNext = ctx->command;
                ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
                flag = 1;
            }
            ctx->stateUpdateMonCondition++;
            break;
        case UMC_STATE_AQUA_RING:
            if ((ctx->battleMons[battlerId].moveEffectFlags & MOVE_EFFECT_FLAG_AQUA_RING) && ctx->battleMons[battlerId].hp != ctx->battleMons[battlerId].maxHp && ctx->battleMons[battlerId].hp != 0) {
                if (ctx->battleMons[battlerId].unk88.healBlockTurns) {
                    ctx->battlerIdTemp = battlerId;
                    ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_CANNOT_HEAL);
                } else {
                    ctx->battlerIdTemp = battlerId;
                    ctx->moveTemp = MOVE_AQUA_RING;
                    ctx->hpCalc = DamageDivide(ctx->battleMons[battlerId].maxHp, 16);
                    ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_AQUA_RING_HEAL);
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
            if ((ctx->battleMons[battlerId].moveEffectFlags & MOVE_EFFECT_FLAG_LEECH_SEED) && ctx->battleMons[ctx->battleMons[battlerId].moveEffectFlags & MOVE_EFFECT_FLAG_LEECH_SEED_BATTLER].hp != 0 && GetBattlerAbility(ctx, battlerId) != ABILITY_MAGIC_GUARD && ctx->battleMons[battlerId].hp != 0) {
                ctx->battlerIdLeechSeedRecv = ctx->battleMons[battlerId].moveEffectFlags & MOVE_EFFECT_FLAG_LEECH_SEED_BATTLER;
                ctx->battlerIdLeechSeeded = battlerId;
                ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_LEECH_SEED_EFFECT);
                ctx->commandNext = ctx->command;
                ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
                flag = 1;
            }
            ctx->stateUpdateMonCondition++;
            break;
        case UMC_STATE_POISON:
            if ((ctx->battleMons[battlerId].status & STATUS_POISON) && ctx->battleMons[battlerId].hp != 0) {
                ctx->battlerIdTemp = battlerId;
                ctx->hpCalc = DamageDivide(ctx->battleMons[battlerId].maxHp * -1, 8);
                ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_POISON_DAMAGE);
                ctx->commandNext = ctx->command;
                ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
                flag = 1;
            }
            ctx->stateUpdateMonCondition++;
            break;
        case UMC_STATE_BAD_POISON:
            if ((ctx->battleMons[battlerId].status & STATUS_BAD_POISON) && ctx->battleMons[battlerId].hp != 0) {
                ctx->battlerIdTemp = battlerId;
                ctx->hpCalc = DamageDivide(ctx->battleMons[battlerId].maxHp, 16);
                if ((ctx->battleMons[battlerId].status & STATUS_POISON_COUNT) != STATUS_POISON_COUNT) {
                    ctx->battleMons[battlerId].status += 1 << STATUS_POISON_COUNT_SHIFT;
                }
                ctx->hpCalc *= ((ctx->battleMons[battlerId].status & STATUS_POISON_COUNT) >> STATUS_POISON_COUNT_SHIFT);
                ctx->hpCalc *= -1;
                ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_POISON_DAMAGE);
                ctx->commandNext = ctx->command;
                ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
                flag = 1;
            }
            ctx->stateUpdateMonCondition++;
            break;
        case UMC_STATE_BURN:
            if ((ctx->battleMons[battlerId].status & STATUS_BURN) && ctx->battleMons[battlerId].hp != 0) {
                ctx->battlerIdTemp = battlerId;
                ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_BURN_DAMAGE);
                ctx->commandNext = ctx->command;
                ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
                flag = 1;
            }
            ctx->stateUpdateMonCondition++;
            break;
        case UMC_STATE_NIGHTMARE:
            if ((ctx->battleMons[battlerId].status2 & STATUS2_NIGHTMARE) && ctx->battleMons[battlerId].hp != 0) {
                if (ctx->battleMons[battlerId].status & STATUS_SLEEP) {
                    ctx->battlerIdTemp = battlerId;
                    ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_NIGHTMARE_EFFECT);
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
            if ((ctx->battleMons[battlerId].status2 & STATUS2_CURSE) && ctx->battleMons[battlerId].hp != 0) {
                ctx->battlerIdTemp = battlerId;
                ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_CURSE_DAMAGE);
                ctx->commandNext = ctx->command;
                ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
                flag = 1;
            }
            ctx->stateUpdateMonCondition++;
            break;
        case UMC_STATE_BINDING:
            if ((ctx->battleMons[battlerId].status2 & STATUS2_BIND) && ctx->battleMons[battlerId].hp != 0) {
                ctx->battleMons[battlerId].status2 -= 1 << STATUS2_BINDING_SHIFT;
                if (ctx->battleMons[battlerId].status2 & STATUS2_BIND) {
                    ctx->hpCalc = DamageDivide(ctx->battleMons[battlerId].maxHp * -1, 16);
                    ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_BIND_EFFECT);
                } else {
                    ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_BIND_END);
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
            if ((ctx->battleMons[battlerId].status & STATUS_SLEEP) && GetBattlerAbility(ctx, battlerId) != ABILITY_MAGIC_GUARD && ctx->battleMons[battlerId].hp != 0 && ctx->tempData) {
                ctx->hpCalc = DamageDivide(ctx->battleMons[battlerId].maxHp * -1, 8);
                ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_BAD_DREAMS);
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
                    if ((ctx->battleMons[battlerIdSleep].status & STATUS_SLEEP) && ctx->battleMons[battlerIdSleep].hp != 0 && GetBattlerAbility(ctx, battlerIdSleep) != ABILITY_SOUNDPROOF) {
                        ctx->battlerIdTemp = battlerIdSleep;
                        ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_WAKE_UP);
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
                    i = BATTLE_SUBSCRIPT_UPROAR_END;
                    ctx->battleMons[battlerId].status2 &= ~STATUS2_UPROAR;
                    ctx->fieldCondition &= (MaskOfFlagNo(battlerId) << 8) ^ 0xFFFFFFFF;
                } else if (ctx->battleMons[battlerId].status2 & STATUS2_UPROAR) {
                    i = BATTLE_SUBSCRIPT_UPROAR_CONTINUES;
                } else {
                    i = BATTLE_SUBSCRIPT_UPROAR_END;
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
            if (ctx->battleMons[battlerId].status2 & STATUS2_RAMPAGE) {
                ctx->battleMons[battlerId].status2 -= 1 << STATUS2_RAMPAGE_SHIFT;
                if (ov12_02252218(ctx, battlerId)) {
                    ctx->battleMons[battlerId].status2 &= ~STATUS2_RAMPAGE;
                } else if (!(ctx->battleMons[battlerId].status2 & STATUS2_RAMPAGE) && !(ctx->battleMons[battlerId].status2 & STATUS2_CONFUSION)) {
                    ctx->battlerIdStatChange = battlerId;
                    ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_THRASH_END);
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
                    ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_DISABLE_END);
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
                    ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_ENCORE_END);
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
            if (ctx->battleMons[battlerId].unk88.tauntTurns != 0) {
                ctx->battleMons[battlerId].unk88.tauntTurns--;
                if (ctx->battleMons[battlerId].unk88.tauntTurns == 0) {
                    ctx->battlerIdTemp = battlerId;
                    ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_TAUNT_END);
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
                    ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_MAGNET_RISE_END);
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
                    ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_HEAL_BLOCK_END);
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
                    ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_EMBARGO_END);
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
                    ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_FALL_ASLEEP);
                    ctx->commandNext = ctx->command;
                    ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
                    flag = 1;
                }
            }
            ctx->stateUpdateMonCondition++;
            break;
        case UMC_STATE_HELD_ITEM_STATUS: {
            int script;

            if (CheckUseHeldItem(bsys, ctx, battlerId, (u32 *)&script) == TRUE) {
                ctx->battlerIdTemp = battlerId;
                ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, script);
                ctx->commandNext = ctx->command;
                ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
                flag = 1;
            }
            ctx->stateUpdateMonCondition++;
            break;
        }
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
            BattleController_EmitBlankMessage(bsys);
            return;
        }
    }
    ctx->stateUpdateMonCondition = 0;
    ctx->updateMonConditionData = 0;
    ctx->command = CONTROLLER_COMMAND_UPDATE_FIELD_CONDITION_EXTRA;
}

typedef enum UpdateFieldConditionExtraState {
    UFCE_STATE_FUTURE_SIGHT,
    UFCE_STATE_PERISH_SONG,
    UFCE_STATE_TRICK_ROOM,
    UFCE_STATE_END
} UpdateFieldConditionExtraState;

// Future sight and doom desire are here due to mons being able to faint simulataneously, which means exp shouldn't be awarded like when a mon faints due to burn
// Trick room is here due to every other update function being reliant on turn order, meaning it must be updated last
static void BattleControllerPlayer_UpdateFieldConditionExtra(BattleSystem *bsys, BattleContext *ctx) {
    int maxBattlers = BattleSystem_GetMaxBattlers(bsys);
    int battlerId;

    if (TryFaintMon(ctx, ctx->command, ctx->command, 1) == TRUE) {
        return;
    }

    BattleController_EmitBlankMessage(bsys);

    switch (ctx->stateUpdateFieldConditionExtra) {
    case UFCE_STATE_FUTURE_SIGHT:
        while (ctx->updateFieldConditionExtraData < maxBattlers) {
            battlerId = ctx->turnOrder[ctx->updateFieldConditionExtraData];
            if (ctx->switchInFlag & MaskOfFlagNo(battlerId)) {
                ctx->updateFieldConditionExtraData++;
                continue;
            }
            ctx->updateFieldConditionExtraData++;
            if (ctx->fieldConditionData.futureSightTurns[battlerId]) {
                if (!(--ctx->fieldConditionData.futureSightTurns[battlerId]) && ctx->battleMons[battlerId].hp != 0) {
                    ctx->fieldSideConditionFlags[BattleSystem_GetFieldSide(bsys, battlerId)] &= ~SIDE_CONDITION_FUTURE_SIGHT;
                    ctx->buffMsg.id = msg_0197_00475; // Seadra took the Doom Desire attack!
                    ctx->buffMsg.tag = TAG_NICKNAME_MOVE;
                    ctx->buffMsg.param[0] = CreateNicknameTag(ctx, battlerId);
                    ctx->buffMsg.param[1] = ctx->fieldConditionData.futureSightMoveNo[battlerId];
                    ctx->battlerIdTemp = battlerId;
                    ctx->battlerIdLeechSeedRecv = ctx->fieldConditionData.battlerIdFutureSight[battlerId];
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
            if (ctx->switchInFlag & MaskOfFlagNo(battlerId)) {
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
    ctx->command = CONTROLLER_COMMAND_TURN_END;
}

static void BattleControllerPlayer_TurnEnd(BattleSystem *bsys, BattleContext *ctx) {
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

static void BattleControllerPlayer_FightInput(BattleSystem *bsys, BattleContext *ctx) {
    int flag = 0;

    ctx->battlerIdAttacker = ctx->executionOrder[ctx->executionIndex];

    if (ctx->turnData[ctx->battlerIdAttacker].struggleFlag) {
        ctx->moveNoTemp = MOVE_STRUGGLE;
        flag = 1;
    } else if (ctx->battleMons[ctx->battlerIdAttacker].unk88.encoredMove && ctx->battleMons[ctx->battlerIdAttacker].unk88.encoredMove == ctx->battleMons[ctx->battlerIdAttacker].moves[ctx->battleMons[ctx->battlerIdAttacker].unk88.encoredMoveIndex]) {
        ctx->moveNoTemp = ctx->battleMons[ctx->battlerIdAttacker].unk88.encoredMove;
        flag = 1;
    } else if (ctx->battleMons[ctx->battlerIdAttacker].unk88.encoredMove && ctx->battleMons[ctx->battlerIdAttacker].unk88.encoredMove != ctx->battleMons[ctx->battlerIdAttacker].moves[ctx->battleMons[ctx->battlerIdAttacker].unk88.encoredMoveIndex]) {
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
    BattleController_EmitBlankMessage(bsys);
}

static void BattleControllerPlayer_ItemInput(BattleSystem *bsys, BattleContext *ctx) {
    BattleItem *item;
    int script;
    ctx->battlerIdAttacker = ctx->executionOrder[ctx->executionIndex];
    ctx->battlerIdTarget = Battler_GetRandomOpposingBattlerId(bsys, ctx, ctx->battlerIdAttacker);
    item = (BattleItem *)&ctx->playerActions[ctx->battlerIdAttacker].unk8;

    if (BattleSystem_GetFieldSide(bsys, ctx->battlerIdAttacker)) {
        switch (ctx->trainerAIData.useItem[ctx->battlerIdAttacker >> 1]) {
        case 0:
            script = BATTLE_SUBSCRIPT_USE_FULL_RESTORE;
            break;
        case 1:
            script = BATTLE_SUBSCRIPT_USE_POTION;
            break;
        case 2:
            if ((ctx->trainerAIData.unk9F[ctx->battlerIdAttacker >> 1] & 1) && (ctx->trainerAIData.unk9F[ctx->battlerIdAttacker >> 1] & 0x3e)) {
                ctx->msgTemp = 6;
            } else {
                ctx->msgTemp = LowestFlagNo(ctx->trainerAIData.unk9F[ctx->battlerIdAttacker >> 1]);
            }
            script = BATTLE_SUBSCRIPT_USE_STATUS_RECOVERY;
            break;
        case 3:
            ctx->msgTemp = ctx->trainerAIData.unk9F[ctx->battlerIdAttacker >> 1];
            script = BATTLE_SUBSCRIPT_USE_STAT_BOOSTER;
            break;
        case 4:
            script = BATTLE_SUBSCRIPT_USE_GUARD_SPEC;
            break;
        }
        ctx->itemTemp = ctx->trainerAIData.unkA0[ctx->battlerIdAttacker >> 1];
    } else {
        switch (item->page) {
        case BTLPOCKETLIST_HP_PP_RESTORE:
        case BTLPOCKETLIST_STATUS_RESTORE:
        case BTLPOCKETLIST_BATTLE_ITEMS:
            if (item->id == ITEM_POKE_DOLL || item->id == ITEM_FLUFFY_TAIL) {
                script = BATTLE_SUBSCRIPT_ESCAPE_ITEM;
            } else {
                script = BATTLE_SUBSCRIPT_BATTLE_ITEM;
            }
            break;
        case BTLPOCKETLIST_BALLS:
            script = BATTLE_SUBSCRIPT_THROW_POKEBALL;
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
    ctx->moveStatusFlag |= MOVE_STATUS_NO_MORE_WORK;
}

static void BattleControllerPlayer_PokemonInput(BattleSystem *bsys, BattleContext *ctx) {
    ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, 9);
    ctx->battlerIdAttacker = ctx->executionOrder[ctx->executionIndex];
    ctx->battlerIdSwitch = ctx->battlerIdAttacker;
    ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
    ctx->commandNext = CONTROLLER_COMMAND_41;
    ctx->tempData = 0;
    ctx->moveStatusFlag |= MOVE_STATUS_NO_MORE_WORK;
}

static void BattleControllerPlayer_RunInput(BattleSystem *bsys, BattleContext *ctx) {
    ctx->battlerIdAttacker = ctx->executionOrder[ctx->executionIndex];

    if (BattleSystem_GetFieldSide(bsys, ctx->battlerIdAttacker) && !(BattleSystem_GetBattleType(bsys) & BATTLE_TYPE_LINK)) {
        if (ctx->battleMons[ctx->battlerIdAttacker].status2 & (STATUS2_BIND | STATUS2_MEAN_LOOK)) {
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

static void BattleControllerPlayer_SafariThrowBall(BattleSystem *bsys, BattleContext *ctx) {
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

static void BattleControllerPlayer_SafariThrowMud(BattleSystem *bsys, BattleContext *ctx) {
    ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, 227);
    ctx->battlerIdAttacker = 0;
    ctx->battlerIdTarget = 1;
    ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
    ctx->commandNext = CONTROLLER_COMMAND_40;
    ctx->tempData = BattleSystem_Random(bsys) % 10;
    if (ctx->safariRunAttempts > 0) {
        ctx->safariRunAttempts--;
    }
    if (ctx->tempData != 0) {
        ctx->msgTemp = 1;
        if (ctx->unk_311C > 0) {
            ctx->unk_311C--;
        }
    }
}

static void BattleControllerPlayer_SafariRun(BattleSystem *bsys, BattleContext *ctx) {
    ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, 228);
    ctx->battlerIdAttacker = 0;
    ctx->battlerIdTarget = 1;
    ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
    ctx->commandNext = CONTROLLER_COMMAND_40;
    ctx->tempData = BattleSystem_Random(bsys) % 10;
    if (ctx->unk_311C < 12) {
        ctx->unk_311C++;
    }
    if (ctx->tempData != 0 && ctx->safariRunAttempts < 12) {
        ctx->safariRunAttempts++;
    }
}

static void BattleControllerPlayer_SafariWatching(BattleSystem *bsys, BattleContext *ctx) {
    ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_SAFARI_ESCAPE);
    ctx->battlerIdAttacker = 0;
    ctx->battlerIdTarget = 1;
    ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
    ctx->commandNext = CONTROLLER_COMMAND_40;
}

static void BattleControllerPlayer_CatchingContestThrowBall(BattleSystem *bsys, BattleContext *ctx) {
    int cnt;

    ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_THROW_POKEBALL);
    ctx->battlerIdAttacker = BATTLER_PLAYER;
    ctx->battlerIdTarget = BATTLER_ENEMY;
    ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
    ctx->commandNext = CONTROLLER_COMMAND_40;
    ctx->itemTemp = ITEM_SPORT_BALL;
    cnt = BattleSystem_GetSafariBallCount(bsys) - 1;
    BattleSystem_SetSafariBallCount(bsys, cnt);
    ctx->moveStatusFlag |= MOVE_STATUS_NO_MORE_WORK;
}

static u32 TryDisobedience(BattleSystem *bsys, BattleContext *ctx, int *script) {
    int rnd, struggleRnd;
    u32 battleType;
    u8 level;
    PlayerProfile *profile;

    battleType = BattleSystem_GetBattleType(bsys);
    profile = BattleSystem_GetPlayerProfile(bsys, 0);

    if (battleType & (BATTLE_TYPE_LINK | BATTLE_TYPE_FRONTIER)) {
        return 0;
    }

    if (BattleSystem_GetFieldSide(bsys, ctx->battlerIdAttacker)) {
        return 0;
    }

    if ((battleType & BATTLE_TYPE_AI) && ov12_0223AB0C(bsys, ctx->battlerIdAttacker) == 4) {
        return 0;
    }

    if (ov12_02256854(bsys, ctx) == TRUE) {
        return 0;
    }

    if (!Battler_CanSelectAction(ctx, ctx->battlerIdAttacker)) {
        return 0;
    }

    if (ctx->moveNoCur == MOVE_BIDE && (ctx->battleStatus & BATTLE_STATUS_CHARGE_MOVE_HIT)) {
        return 0;
    }

    if (PlayerProfile_CountBadges(profile) >= 8) {
        return 0;
    }

    level = 10;

    if (PlayerProfile_CountBadges(profile) >= 1) {
        level = 20;
    }

    if (PlayerProfile_CountBadges(profile) >= 2) {
        level = 30;
    }

    if (PlayerProfile_TestBadgeFlag(profile, 3)) {
        level = 50;
    }

    if (PlayerProfile_TestBadgeFlag(profile, 5)) {
        level = 70;
    }

    if (ctx->battleMons[ctx->battlerIdAttacker].level <= level) {
        return 0;
    }

    rnd = ((BattleSystem_Random(bsys) & 0xff) * (ctx->battleMons[ctx->battlerIdAttacker].level + level)) >> 8;

    if (rnd < level) {
        return 0;
    }

    if (ctx->moveNoCur == MOVE_RAGE) {
        ctx->battleMons[ctx->battlerIdAttacker].status2 &= ~STATUS2_RAGE;
    }

    if (ctx->battleMons[ctx->battlerIdAttacker].status & STATUS_SLEEP && (ctx->moveNoCur == MOVE_SNORE || ctx->moveNoCur == MOVE_SLEEP_TALK)) {
        *script = BATTLE_SUBSCRIPT_DISOBEY_WHILE_ASLEEP;
        return 1;
    }

    rnd = ((BattleSystem_Random(bsys) & 0xff) * (ctx->battleMons[ctx->battlerIdAttacker].level + level)) >> 8;

    // use a random (useable) move
    if (rnd < level) {
        rnd = StruggleCheck(bsys, ctx, ctx->battlerIdAttacker, MaskOfFlagNo(ctx->movePos[ctx->battlerIdAttacker]), -1);

        if (rnd == 0xF) {
            *script = BATTLE_SUBSCRIPT_DISOBEY_DO_NOTHING;
            return 1;
        }
        do {
            struggleRnd = BattleSystem_Random(bsys) & 3;
        } while (MaskOfFlagNo(struggleRnd) & rnd);

        ctx->movePos[ctx->battlerIdAttacker] = struggleRnd;
        ctx->moveNoTemp = ctx->battleMons[ctx->battlerIdAttacker].moves[ctx->movePos[ctx->battlerIdAttacker]];
        ctx->moveNoCur = ctx->moveNoTemp;
        ctx->battlerIdTarget = ov12_022506D4(bsys, ctx, ctx->battlerIdAttacker, ctx->moveNoTemp, 1, 0);

        if (ctx->battlerIdTarget == BATTLER_NONE) {
            ctx->playerActions[ctx->battlerIdAttacker].unk4 = Battler_GetRandomOpposingBattlerId(bsys, ctx, ctx->battlerIdAttacker);
        } else {
            ctx->playerActions[ctx->battlerIdAttacker].unk4 = ctx->battlerIdTarget;
        }

        *script = BATTLE_SUBSCRIPT_DISOBEY_ORDERS;
        ctx->unk_2184 |= 1;

        return 2;
    }

    level = ctx->battleMons[ctx->battlerIdAttacker].level - level;
    rnd = BattleSystem_Random(bsys) & 0xFF;

    // take a nap
    if (rnd < level && !(ctx->battleMons[ctx->battlerIdAttacker].status & STATUS_ALL) && GetBattlerAbility(ctx, ctx->battlerIdAttacker) != ABILITY_VITAL_SPIRIT && GetBattlerAbility(ctx, ctx->battlerIdAttacker) != ABILITY_INSOMNIA && !(ctx->fieldCondition & FIELD_CONDITION_UPROAR)) {
        *script = BATTLE_SUBSCRIPT_DISOBEY_SLEEP;
        return 1;
    }

    rnd -= level;

    // hitting itself
    if (rnd < level) {
        ctx->battlerIdTarget = ctx->battlerIdAttacker;
        ctx->battlerIdTemp = ctx->battlerIdTarget;
        ctx->hpCalc = CalcMoveDamage(bsys, ctx, MOVE_POUND, 0, 0, 40, 0, ctx->battlerIdAttacker, ctx->battlerIdAttacker, 1);
        ctx->hpCalc = ApplyDamageRange(bsys, ctx, ctx->hpCalc);
        ctx->hpCalc *= -1;
        *script = BATTLE_SUBSCRIPT_DISOBEY_HIT_SELF;
        ctx->battleStatus |= 2;
        return 3;
    }

    *script = BATTLE_SUBSCRIPT_DISOBEY_DO_NOTHING;

    return 1;
}

BOOL ov12_0224B1FC(BattleSystem *bsys, BattleContext *ctx) {
    int decreasePP = 1;
    int index;

    if (!ctx->selfTurnData[ctx->battlerIdAttacker].ignorePressure && ctx->battlerIdTarget != BATTLER_NONE) {
        if (ctx->moveNoTemp == MOVE_IMPRISON) {
            decreasePP += CheckAbilityActive(bsys, ctx, CHECK_ABILITY_OPPOSING_SIDE_HP, ctx->battlerIdAttacker, ABILITY_PRESSURE);
        } else {
            switch (ctx->trainerAIData.moveData[ctx->moveNoTemp].range) {
            case RANGE_ALL_ADJACENT:
            case RANGE_FIELD:
                decreasePP += CheckAbilityActive(bsys, ctx, CHECK_ABILITY_ALL_HP_NOT_USER, ctx->battlerIdAttacker, ABILITY_PRESSURE);
                break;
            case RANGE_ADJACENT_OPPONENTS:
            case RANGE_OPPONENT_SIDE:
                decreasePP += CheckAbilityActive(bsys, ctx, CHECK_ABILITY_OPPOSING_SIDE_HP, ctx->battlerIdAttacker, ABILITY_PRESSURE);
                break;
            case RANGE_USER_SIDE:
            case RANGE_USER:
            case RANGE_SINGLE_TARGET_USER_SIDE:
            case RANGE_ALLY:
                break;
            default:
                if (ctx->battlerIdAttacker != ctx->battlerIdTarget && GetBattlerAbility(ctx, ctx->battlerIdTarget) == ABILITY_PRESSURE) {
                    decreasePP++;
                }
                break;
            }
        }
    }

    index = BattleMon_GetMoveIndex(&ctx->battleMons[ctx->battlerIdAttacker], ctx->moveNoTemp);

    if (!ctx->turnData[ctx->battlerIdAttacker].unk0_1 && !ctx->turnData[ctx->battlerIdAttacker].struggleFlag) {
        ctx->turnData[ctx->battlerIdAttacker].unk0_1 = 1;
        if (ctx->battleMons[ctx->battlerIdAttacker].movePPCur[index] && index < 4) {
            if (ctx->battleMons[ctx->battlerIdAttacker].movePPCur[index] > decreasePP) {
                ctx->battleMons[ctx->battlerIdAttacker].movePPCur[index] -= decreasePP;
            } else {
                ctx->battleMons[ctx->battlerIdAttacker].movePPCur[index] = 0;
            }
            CopyBattleMonToPartyMon(bsys, ctx, ctx->battlerIdAttacker);
        } else {
            ctx->moveStatusFlag |= MOVE_STATUS_NO_PP;
        }
    } else if (!ctx->battleMons[ctx->battlerIdAttacker].movePPCur[index]
        && !(ctx->battleStatus & BATTLE_STATUS_CHARGE_MOVE_HIT)
        && !(ctx->battleMons[ctx->battlerIdAttacker].status2 & STATUS2_LOCKED_INTO_MOVE)
        && !(ctx->battleMons[ctx->battlerIdAttacker].status2 & STATUS2_RAMPAGE)
        && !(ctx->fieldCondition & (MaskOfFlagNo(ctx->battlerIdAttacker) << FIELD_CONDITION_UPROAR_SHIFT))
        && index < 4) {
        ctx->moveStatusFlag |= MOVE_STATUS_NO_PP;
    }

    return FALSE;
}

static BOOL ov12_0224B398(BattleSystem *bsys, BattleContext *ctx) {
    BOOL ret = FALSE;
    BOOL quickChargeFlag = FALSE; // only for solar beam this gen

    if ((ctx->battlerIdTarget == BATTLER_NONE && !BattleCtx_IsIdenticalToCurrentMove(ctx, ctx->moveNoCur))
        || (ctx->battlerIdTarget == BATTLER_NONE && BattleCtx_IsIdenticalToCurrentMove(ctx, ctx->moveNoCur) == TRUE && (ctx->battleMons[ctx->battlerIdAttacker].status2 & STATUS2_LOCKED_INTO_MOVE || ctx->battleStatus & BATTLE_STATUS_CHARGE_MOVE_HIT))) {
        ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_NO_TARGET);
        ctx->commandNext = CONTROLLER_COMMAND_39;
        ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
        ret = TRUE;
    }

    if (!CheckAbilityActive(bsys, ctx, CHECK_ABILITY_ALL_HP, 0, ABILITY_CLOUD_NINE) && !CheckAbilityActive(bsys, ctx, CHECK_ABILITY_ALL_HP, 0, ABILITY_AIR_LOCK) && ctx->trainerAIData.moveData[ctx->moveNoCur].effect == MOVE_EFFECT_151 && ctx->fieldCondition & FIELD_CONDITION_SUN_ALL) {
        quickChargeFlag = TRUE;
    }

    if (ctx->battlerIdTarget == BATTLER_NONE && BattleCtx_IsIdenticalToCurrentMove(ctx, ctx->moveNoCur) == TRUE && ret == FALSE && quickChargeFlag == FALSE && GetBattlerHeldItemEffect(ctx, ctx->battlerIdAttacker) != HOLD_EFFECT_CHARGE_SKIP && !(ctx->battleMons[ctx->battlerIdAttacker].status2 & STATUS2_LOCKED_INTO_MOVE)) {
        ctx->battlerIdTarget = ctx->battlerIdAttacker;
    }

    return ret;
}

static BOOL ov12_0224B498(BattleSystem *bsys, BattleContext *ctx) {
    if ((ctx->trainerAIData.moveData[ctx->moveNoCur].range != RANGE_USER && ctx->trainerAIData.moveData[ctx->moveNoCur].range != RANGE_USER_SIDE && ctx->trainerAIData.moveData[ctx->moveNoCur].power != 0 && !(ctx->battleStatus & BATTLE_STATUS_IGNORE_TYPE_IMMUNITY) && !(ctx->battleStatus & BATTLE_STATUS_CHARGE_TURN)) || ctx->moveNoCur == MOVE_THUNDER_WAVE) {
        ctx->damage = ov12_02251D28(bsys, ctx, ctx->moveNoCur, ctx->moveType, ctx->battlerIdAttacker, ctx->battlerIdTarget, ctx->damage, &ctx->moveStatusFlag);
        if (ctx->moveStatusFlag & MOVE_STATUS_NO_EFFECT) {
            ctx->moveFail[ctx->battlerIdAttacker].noEffect = TRUE;
        }
    }
    return FALSE;
}

static BOOL ov12_0224B528(BattleSystem *bsys, BattleContext *ctx) {
    int effect = ctx->trainerAIData.moveData[ctx->moveNoCur].effect;
    int ret = 0;

    do {
        switch (ctx->unk_50) {
        case 0:
            ctx->battleMons[ctx->battlerIdAttacker].status2 &= ~STATUS2_DESTINY_BOND;
            ctx->battleMons[ctx->battlerIdAttacker].moveEffectFlags &= ~MOVE_EFFECT_FLAG_GRUDGE;
            ctx->unk_50++;
            break;
        case 1:
            if (ctx->battleMons[ctx->battlerIdAttacker].status & STATUS_SLEEP) {
                if (ctx->fieldCondition & FIELD_CONDITION_UPROAR && GetBattlerAbility(ctx, ctx->battlerIdAttacker) != ABILITY_SOUNDPROOF) {
                    ctx->battlerIdTemp = ctx->battlerIdAttacker;
                    ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_WAKE_UP);
                    ctx->commandNext = ctx->command;
                    ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
                    ret = 2;
                } else if ((ctx->moveNoCur != MOVE_SLEEP_TALK && ctx->moveNoTemp == MOVE_SLEEP_TALK) == 0) {
                    int sleepCounterDecrease;

                    if (GetBattlerAbility(ctx, ctx->battlerIdAttacker) == ABILITY_EARLY_BIRD) {
                        sleepCounterDecrease = 2;
                    } else {
                        sleepCounterDecrease = 1;
                    }
                    if ((ctx->battleMons[ctx->battlerIdAttacker].status & STATUS_SLEEP) < sleepCounterDecrease) {
                        ctx->battleMons[ctx->battlerIdAttacker].status &= ~STATUS_SLEEP;
                    } else {
                        ctx->battleMons[ctx->battlerIdAttacker].status -= sleepCounterDecrease;
                    }

                    if (ctx->battleMons[ctx->battlerIdAttacker].status & STATUS_SLEEP) {
                        if (ctx->moveNoCur != MOVE_SNORE && ctx->moveNoTemp != MOVE_SLEEP_TALK) {
                            ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_SLEEPING);
                            ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
                            ctx->commandNext = CONTROLLER_COMMAND_39;
                            ret = 2;
                        }
                    } else {
                        ctx->battlerIdTemp = ctx->battlerIdAttacker;
                        ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_WAKE_UP);
                        ctx->commandNext = ctx->command;
                        ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
                        ret = 2;
                    }
                }
            }
            ctx->unk_50++;
            break;
        case 2:
            if (ctx->battleMons[ctx->battlerIdAttacker].status & STATUS_FREEZE) {
                if (BattleSystem_Random(bsys) % 5 != 0) {
                    if (effect != MOVE_EFFECT_THAW_AND_BURN_HIT && effect != MOVE_EFFECT_RECOIL_BURN_HIT) {
                        ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_FROZEN);
                        ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
                        ctx->commandNext = CONTROLLER_COMMAND_39;
                        ret = 1;
                    }
                } else {
                    ctx->battlerIdTemp = ctx->battlerIdAttacker;
                    ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_THAW_OUT);
                    ctx->commandNext = ctx->command;
                    ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
                    ret = 2;
                }
            }
            ctx->unk_50++;
            break;
        case 3:
            if (CheckTruant(ctx, ctx->battlerIdAttacker) == TRUE) {
                ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_LOAFING_AROUND);
                ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
                ctx->commandNext = CONTROLLER_COMMAND_39;
                ret = 1;
            }
            ctx->unk_50++;
            break;
        case 4:
            if (ctx->battleMons[ctx->battlerIdAttacker].status2 & STATUS2_RECHARGE) {
                ctx->battleMons[ctx->battlerIdAttacker].status2 &= ~STATUS2_RECHARGE;
                ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_RECHARGING);
                ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
                ctx->commandNext = CONTROLLER_COMMAND_39;
                ret = 1;
            }
            ctx->unk_50++;
            break;
        case 5:
            if (ctx->battleMons[ctx->battlerIdAttacker].status2 & STATUS2_FLINCH) {
                ctx->battleMons[ctx->battlerIdAttacker].status2 &= ~STATUS2_FLINCH;
                ctx->moveFail[ctx->battlerIdAttacker].flinch = TRUE;
                ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_FLINCHED);
                ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
                ctx->commandNext = CONTROLLER_COMMAND_39;
                ret = 1;
            }
            ctx->unk_50++;
            break;
        case 6:
            if (ctx->battleMons[ctx->battlerIdAttacker].unk88.disabledMove == ctx->moveNoTemp) {
                ctx->moveFail[ctx->battlerIdAttacker].disabled = TRUE;
                ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_MOVE_IS_DISABLED);
                ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
                ctx->commandNext = CONTROLLER_COMMAND_39;
                ret = 1;
            }
            ctx->unk_50++;
            break;
        case 7:
            if (ctx->battleMons[ctx->battlerIdAttacker].unk88.tauntTurns && ctx->trainerAIData.moveData[ctx->moveNoCur].power == 0) {
                ctx->moveFail[ctx->battlerIdAttacker].unk0_5 = TRUE;
                ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_MOVE_FAIL_TAUNTED);
                ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
                ctx->commandNext = CONTROLLER_COMMAND_39;
                ret = 1;
            }
            ctx->unk_50++;
            break;
        case 8:
            if (BattleContext_CheckMoveImprisoned(bsys, ctx, ctx->battlerIdAttacker, ctx->moveNoCur)) {
                ctx->moveFail[ctx->battlerIdAttacker].imprison = TRUE;
                ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_MOVE_IS_IMPRISONED);
                ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
                ctx->commandNext = CONTROLLER_COMMAND_39;
                ret = 1;
            }
            ctx->unk_50++;
            break;
        case 9:
            if (BattleContext_CheckMoveUnuseableInGravity(bsys, ctx, ctx->battlerIdAttacker, ctx->moveNoCur)) {
                ctx->moveFail[ctx->battlerIdAttacker].gravity = TRUE;
                ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_MOVE_FAIL_GRAVITY);
                ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
                ctx->commandNext = CONTROLLER_COMMAND_39;
                ret = 1;
            }
            ctx->unk_50++;
            break;
        case 10:
            if (BattleContext_CheckMoveHealBlocked(bsys, ctx, ctx->battlerIdAttacker, ctx->moveNoCur)) {
                ctx->moveFail[ctx->battlerIdAttacker].healBlock = TRUE;
                ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_MOVE_IS_HEAL_BLOCKED);
                ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
                ctx->commandNext = CONTROLLER_COMMAND_39;
                ret = 1;
            }
            ctx->unk_50++;
            break;
        case 11:
            ctx->unk_50++;
            if (ctx->battleMons[ctx->battlerIdAttacker].status2 & STATUS2_CONFUSION) {
                ctx->battleMons[ctx->battlerIdAttacker].status2 -= 1;
                if (ctx->battleMons[ctx->battlerIdAttacker].status2 & STATUS2_CONFUSION) {
                    if (BattleSystem_Random(bsys) & 1) {
                        ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_CONFUSED);
                        ctx->commandNext = ctx->command;
                        ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
                        ret = 2;
                    } else {
                        ctx->moveFail[ctx->battlerIdAttacker].confusion = TRUE;
                        ctx->battlerIdTarget = ctx->battlerIdAttacker;
                        ctx->battlerIdTemp = ctx->battlerIdTarget;
                        ctx->hpCalc = CalcMoveDamage(bsys, ctx, MOVE_STRUGGLE, 0, 0, 40, 0, ctx->battlerIdAttacker, ctx->battlerIdAttacker, 1);
                        ctx->hpCalc = ApplyDamageRange(bsys, ctx, ctx->hpCalc);
                        ctx->hpCalc *= -1;
                        ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_HURT_SELF_IN_CONFUSION);
                        ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
                        ctx->commandNext = CONTROLLER_COMMAND_34;
                        ret = 1;
                    }
                } else {
                    ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_SNAP_OUT_OF_CONFUSION);
                    ctx->commandNext = ctx->command;
                    ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
                    ret = 2;
                }
            }
            break;
        case 12:
            if (ctx->battleMons[ctx->battlerIdAttacker].status & STATUS_PARALYSIS && GetBattlerAbility(ctx, ctx->battlerIdAttacker) != ABILITY_MAGIC_GUARD) {
                if (BattleSystem_Random(bsys) % 4 == 0) {
                    ctx->moveFail[ctx->battlerIdAttacker].paralysis = TRUE;
                    ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_FULLY_PARALYZED);
                    ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
                    ctx->commandNext = CONTROLLER_COMMAND_39;
                    ret = 1;
                }
            }
            ctx->unk_50++;
            break;
        case 13:
            if (ctx->battleMons[ctx->battlerIdAttacker].status2 & STATUS2_ATTRACT) {
                ctx->battlerIdTemp = LowestFlagNo((ctx->battleMons[ctx->battlerIdAttacker].status2 & STATUS2_ATTRACT) >> STATUS2_ATTRACT_SHIFT);
                if (BattleSystem_Random(bsys) & 1) {
                    ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_INFATUATED);
                    ctx->commandNext = ctx->command;
                    ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
                    ret = 2;
                } else {
                    ctx->moveFail[ctx->battlerIdAttacker].infatuation = TRUE;
                    ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_IMMOBILIZED_BY_LOVE);
                    ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
                    ctx->commandNext = CONTROLLER_COMMAND_39;
                    ret = 1;
                }
            }
            ctx->unk_50++;
            break;
        case 14:
            ctx->unk_50++;
            if (ctx->battleMons[ctx->battlerIdAttacker].status2 & STATUS2_BIDE) {
                ctx->battleMons[ctx->battlerIdAttacker].status2 -= (1 << STATUS2_BIDE_SHIFT);
                if (!(ctx->battleMons[ctx->battlerIdAttacker].status2 & STATUS2_BIDE) && ctx->unk_30E4[ctx->battlerIdAttacker]) {
                    ctx->damage = ctx->unk_30E4[ctx->battlerIdAttacker] * 2;
                    if (ctx->battleMons[ctx->unk_30F4[ctx->battlerIdAttacker]].hp != 0) {
                        ctx->battlerIdTarget = ctx->unk_30F4[ctx->battlerIdAttacker];
                    } else {
                        ctx->battlerIdTarget = Battler_GetRandomOpposingBattlerId(bsys, ctx, ctx->battlerIdAttacker);
                        if (ctx->battleMons[ctx->battlerIdTarget].hp == 0) {
                            ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_BIDE_NO_TARGET);
                            ctx->commandNext = CONTROLLER_COMMAND_39;
                            ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
                            ret = 2;
                            break;
                        }
                    }
                }
                ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_BIDE_END);
                ctx->commandNext = ctx->command;
                ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
                ret = 2;
            }
            break;
        case 15:
            if (ctx->battleMons[ctx->battlerIdAttacker].status & STATUS_FREEZE) {
                if (effect == MOVE_EFFECT_THAW_AND_BURN_HIT || effect == MOVE_EFFECT_RECOIL_BURN_HIT) {
                    ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_DEFROSTED_BY_MOVE);
                    ctx->commandNext = ctx->command;
                    ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
                    ret = 2;
                }
            }
            ctx->unk_50++;
            break;
        case 16:
            ctx->unk_50 = 0;
            ret = 3;
            break;
        }
    } while (ret == 0);

    CopyBattleMonToPartyMon(bsys, ctx, ctx->battlerIdAttacker);

    if (ret == 1) {
        ctx->battleStatus |= BATTLE_STATUS_CHECK_LOOP_ONLY_ONCE;
        ctx->moveStatusFlag |= MOVE_STATUS_NO_MORE_WORK;
    }

    return ret != 3;
}

static BOOL ov12_0224BC2C(BattleSystem *bsys, BattleContext *ctx) {
    int ret = 0;
    int script;

    do {
        switch (ctx->unk_54) {
        case 0:
            script = BattleContext_CheckMoveImmunityFromAbility(ctx, ctx->battlerIdAttacker, ctx->battlerIdTarget);
            if ((script && !(ctx->moveStatusFlag & MOVE_STATUS_DID_NOT_HIT)) || script == BATTLE_SUBSCRIPT_BLOCKED_BY_SOUNDPROOF) {
                ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, script);
                ctx->commandNext = ctx->command;
                ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
                ctx->moveStatusFlag |= MOVE_STATUS_NO_MORE_WORK;
                ret = 1;
            }
            ctx->unk_54++;
            break;
        case 1:
            ctx->unk_54 = 0;
            ret = 2;
            break;
        }
    } while (ret == 0);

    return ret != 2;
}

static BOOL ov12_0224BCA4(BattleSystem *bsys, BattleContext *ctx) {
    ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_CHECK_QUICK_CLAW);
    ctx->commandNext = ctx->command;
    ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
    return TRUE;
}

static const u8 sHitChanceTable[13][2] = {
    { 33,  100 },
    { 36,  100 },
    { 43,  100 },
    { 50,  100 },
    { 60,  100 },
    { 75,  100 },
    { 1,   1   },
    { 133, 100 },
    { 166, 100 },
    { 2,   1   },
    { 233, 100 },
    { 133, 50  },
    { 3,   1   }
};

static BOOL BattleSystem_CheckMoveHit(BattleSystem *bsys, BattleContext *ctx, int battlerIdAttacker, int battlerIdTarget, int move) {
    u16 hitChance;
    s8 var;
    s8 attackerAccuracy;
    s8 targetEvasion;
    int item;
    int itemMod;
    u8 moveType;
    u8 moveCategory;

    if (BattleSystem_GetBattleType(bsys) & BATTLE_TYPE_TUTORIAL) {
        return FALSE;
    }

    if (GetBattlerAbility(ctx, battlerIdAttacker) == ABILITY_NORMALIZE) {
        moveType = TYPE_NORMAL;
    } else if (ctx->moveType != 0) {
        moveType = ctx->moveType;
    } else {
        moveType = ctx->trainerAIData.moveData[move].type;
    }

    moveCategory = ctx->trainerAIData.moveData[move].category;
    attackerAccuracy = ctx->battleMons[battlerIdAttacker].statChanges[STAT_ACC] - 6;
    targetEvasion = 6 - ctx->battleMons[battlerIdTarget].statChanges[STAT_EVASION];

    if (GetBattlerAbility(ctx, battlerIdAttacker) == ABILITY_SIMPLE) {
        attackerAccuracy *= 2;
    }

    if (CheckBattlerAbilityIfNotIgnored(ctx, battlerIdAttacker, battlerIdTarget, ABILITY_SIMPLE) == TRUE) {
        targetEvasion *= 2;
    }

    if (CheckBattlerAbilityIfNotIgnored(ctx, battlerIdAttacker, battlerIdTarget, ABILITY_UNAWARE) == TRUE) {
        attackerAccuracy = 0;
    }

    if (GetBattlerAbility(ctx, battlerIdAttacker) == ABILITY_UNAWARE) {
        targetEvasion = 0;
    }

    if (((ctx->battleMons[battlerIdTarget].status2 & STATUS2_FORESIGHT) || (ctx->battleMons[battlerIdTarget].moveEffectFlags & MOVE_EFFECT_FLAG_MIRACLE_EYE)) && targetEvasion < 0) {
        targetEvasion = 0;
    }

    var = 6 + targetEvasion + attackerAccuracy;

    if (var < 0) {
        var = 0;
    }
    if (var > 12) {
        var = 12;
    }

    hitChance = ctx->trainerAIData.moveData[move].accuracy;

    if (hitChance == 0) {
        return FALSE;
    }

    if (ctx->battleStatus & BATTLE_STATUS_CHARGE_TURN) {
        return FALSE;
    }

    if (ctx->battleStatus & BATTLE_STATUS_FLAT_HIT_RATE) {
        return FALSE;
    }

    if (!CheckAbilityActive(bsys, ctx, CHECK_ABILITY_ALL_HP, 0, ABILITY_CLOUD_NINE) && !CheckAbilityActive(bsys, ctx, CHECK_ABILITY_ALL_HP, 0, ABILITY_AIR_LOCK)) {
        if ((ctx->fieldCondition & FIELD_CONDITION_SUN_ALL) && ctx->trainerAIData.moveData[move].effect == MOVE_EFFECT_THUNDER) {
            hitChance = 50;
        }
    }

    hitChance *= sHitChanceTable[var][0];
    hitChance /= sHitChanceTable[var][1];

    if (GetBattlerAbility(ctx, battlerIdAttacker) == ABILITY_COMPOUNDEYES) {
        hitChance = hitChance * 130 / 100;
    }

    if (!CheckAbilityActive(bsys, ctx, CHECK_ABILITY_ALL_HP, 0, ABILITY_CLOUD_NINE) && !CheckAbilityActive(bsys, ctx, CHECK_ABILITY_ALL_HP, 0, ABILITY_AIR_LOCK)) {
        if ((ctx->fieldCondition & FIELD_CONDITION_SANDSTORM_ALL) && CheckBattlerAbilityIfNotIgnored(ctx, battlerIdAttacker, battlerIdTarget, ABILITY_SAND_VEIL) == TRUE) {
            hitChance = hitChance * 80 / 100;
        }

        if (ctx->fieldCondition & FIELD_CONDITION_HAIL_ALL && CheckBattlerAbilityIfNotIgnored(ctx, battlerIdAttacker, battlerIdTarget, ABILITY_SNOW_CLOAK) == TRUE) {
            hitChance = hitChance * 80 / 100;
        }

        if (ctx->fieldCondition & FIELD_CONDITION_FOG) {
            hitChance = hitChance * 6 / 10;
        }
    }

    if (GetBattlerAbility(ctx, battlerIdAttacker) == ABILITY_HUSTLE && (moveCategory == CATEGORY_PHYSICAL)) {
        hitChance = hitChance * 80 / 100;
    }

    if (CheckBattlerAbilityIfNotIgnored(ctx, battlerIdAttacker, battlerIdTarget, ABILITY_TANGLED_FEET) == TRUE && ctx->battleMons[battlerIdTarget].status2 & STATUS2_CONFUSION) {
        hitChance = hitChance * 50 / 100;
    }

    item = GetBattlerHeldItemEffect(ctx, battlerIdTarget);
    itemMod = GetHeldItemModifier(ctx, battlerIdTarget, 0);

    if (item == HOLD_EFFECT_ACC_REDUCE) {
        hitChance = hitChance * (100 - itemMod) / 100;
    }

    item = GetBattlerHeldItemEffect(ctx, battlerIdAttacker);
    itemMod = GetHeldItemModifier(ctx, battlerIdAttacker, 0);

    if (item == HOLD_EFFECT_ACCURACY_UP) {
        hitChance = hitChance * (100 + itemMod) / 100;
    }

    if (item == HOLD_EFFECT_CRITRATE_UP_SLOWER && ov12_0225561C(ctx, battlerIdTarget) == TRUE) { // TODO: hold effect const is mislabeled
        hitChance = hitChance * (100 + itemMod) / 100;
    }

    if (ctx->battleMons[battlerIdAttacker].unk88.micleBerryFlag) {
        ctx->battleMons[battlerIdAttacker].unk88.micleBerryFlag = 0;
        hitChance = hitChance * 120 / 100;
    }

    if (ctx->fieldCondition & FIELD_CONDITION_GRAVITY) {
        hitChance = hitChance * 10 / 6;
    }

    if ((BattleSystem_Random(bsys) % 100) + 1 > hitChance) {
        ctx->moveStatusFlag |= MOVE_STATUS_MISSED;
    }

    return FALSE;
}

static BOOL BattleSystem_CheckMoveEffect(BattleSystem *bsys, BattleContext *ctx, int battlerIdAttacker, int battlerIdTarget, int move) {
    if (ctx->battleStatus & BATTLE_STATUS_CHARGE_TURN) {
        return FALSE;
    }

    if (ctx->turnData[battlerIdTarget].protectFlag
        && ctx->trainerAIData.moveData[move].unkB & (1 << 1)
        && (move != MOVE_CURSE || CurseUserIsGhost(ctx, move, battlerIdAttacker) == TRUE)
        && (!BattleCtx_IsIdenticalToCurrentMove(ctx, move) || ctx->battleStatus & BATTLE_STATUS_CHARGE_MOVE_HIT)) {
        UnlockBattlerOutOfCurrentMove(bsys, ctx, battlerIdAttacker);
        ctx->moveStatusFlag |= MOVE_STATUS_PROTECTED;
        return FALSE;
    }

    if (!(ctx->battleStatus & BATTLE_STATUS_FLAT_HIT_RATE) // TODO: Is this flag a debug flag to ignore hit rates..?
        && ((ctx->battleMons[battlerIdTarget].moveEffectFlags & MOVE_EFFECT_FLAG_LOCK_ON
                && ctx->battleMons[battlerIdTarget].unk88.battlerIdLockOn == battlerIdAttacker)
            || GetBattlerAbility(ctx, battlerIdAttacker) == ABILITY_NO_GUARD
            || GetBattlerAbility(ctx, battlerIdTarget) == ABILITY_NO_GUARD)) {
        ctx->moveStatusFlag &= ~MOVE_STATUS_MISSED;
        return FALSE;
    }

    if (!CheckAbilityActive(bsys, ctx, CHECK_ABILITY_ALL_HP, 0, ABILITY_CLOUD_NINE) && !CheckAbilityActive(bsys, ctx, CHECK_ABILITY_ALL_HP, 0, ABILITY_AIR_LOCK)) {
        if (ctx->fieldCondition & FIELD_CONDITION_RAIN_ALL && ctx->trainerAIData.moveData[move].effect == MOVE_EFFECT_THUNDER) {
            ctx->moveStatusFlag &= ~MOVE_STATUS_MISSED;
        }
        if (ctx->fieldCondition & FIELD_CONDITION_HAIL_ALL && ctx->trainerAIData.moveData[move].effect == MOVE_EFFECT_BLIZZARD) {
            ctx->moveStatusFlag &= ~MOVE_STATUS_MISSED;
        }
    }

    if (!(ctx->moveStatusFlag & MOVE_STATUS_BYPASSED_ACCURACY)
        && ctx->trainerAIData.moveData[ctx->moveNoCur].range != RANGE_OPPONENT_SIDE
        && ((!(ctx->battleStatus & BATTLE_STATUS_HIT_FLY) && ctx->battleMons[battlerIdTarget].moveEffectFlags & MOVE_EFFECT_FLAG_FLY)
            || (!(ctx->battleStatus & BATTLE_STATUS_SHADOW_FORCE) && ctx->battleMons[battlerIdTarget].moveEffectFlags & MOVE_EFFECT_FLAG_PHANTOM_FORCE)
            || (!(ctx->battleStatus & BATTLE_STATUS_HIT_DIG) && ctx->battleMons[battlerIdTarget].moveEffectFlags & MOVE_EFFECT_FLAG_DIG)
            || (!(ctx->battleStatus & BATTLE_STATUS_HIT_DIVE) && ctx->battleMons[battlerIdTarget].moveEffectFlags & MOVE_EFFECT_FLAG_DIVE))) {
        ctx->moveStatusFlag |= MOVE_STATUS_SEMI_INVULNERABLE;
    }
    return FALSE;
}

static BOOL ov12_0224C204(BattleSystem *bsys, BattleContext *ctx) {
    int i;
    int battlerId;
    int maxBattlers = BattleSystem_GetMaxBattlers(bsys);

    if (ctx->battlerIdTarget == BATTLER_NONE) {
        return FALSE;
    }

    if (!(ctx->moveStatusFlag & MOVE_STATUS_FAIL) && ctx->turnData[ctx->battlerIdTarget].magicCoatFlag && (ctx->trainerAIData.moveData[ctx->moveNoCur].unkB & 4)) {
        ctx->turnData[ctx->battlerIdTarget].magicCoatFlag = 0;
        ctx->moveNoProtect[ctx->battlerIdAttacker] = 0;
        ctx->moveNoBattlerPrev[ctx->battlerIdAttacker] = ctx->moveNoTemp;
        ctx->moveNoPrev = ctx->moveNoTemp;
        ctx->battleStatus |= BATTLE_STATUS_NO_MOVE_SET;
        ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_MAGIC_COAT);
        ctx->commandNext = ctx->command;
        ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
        CheckIgnorePressure(ctx, ctx->battlerIdTarget, ctx->battlerIdAttacker);
        return TRUE;
    }

    for (i = 0; i < maxBattlers; i++) {
        battlerId = ctx->turnOrder[i];
        if (!(ctx->moveStatusFlag & MOVE_STATUS_FAIL) && ctx->turnData[battlerId].snatchFlag && ctx->trainerAIData.moveData[ctx->moveNoCur].unkB & 8) {
            ctx->battlerIdTemp = battlerId;
            ctx->turnData[battlerId].snatchFlag = 0;
            if (!(ctx->battleStatus & BATTLE_STATUS_NO_MOVE_SET)) {
                ctx->moveNoProtect[ctx->battlerIdAttacker] = 0;
                ctx->moveNoBattlerPrev[ctx->battlerIdAttacker] = ctx->moveNoTemp;
                ctx->moveNoPrev = ctx->moveNoTemp;
                ctx->battleStatus |= BATTLE_STATUS_NO_MOVE_SET;
            }
            ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_SNATCH);
            ctx->commandNext = ctx->command;
            ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
            CheckIgnorePressure(ctx, battlerId, ctx->battlerIdAttacker);
            return TRUE;
        }
    }

    return FALSE;
}

static void BattleControllerPlayer_RunScript(BattleSystem *bsys, BattleContext *ctx) {
    if (RunBattleScript(bsys, ctx) == TRUE) {
        ctx->scriptSeqNo = 0;
        ctx->command = ctx->commandNext;
    }
}

static void ov12_0224C38C(BattleSystem *bsys, BattleContext *ctx) {
    switch (ctx->unk_48) {
    case 0:
        ov12_0224BCA4(bsys, ctx);
        ctx->unk_48++;
        return;
    case 1:
        if (!(ctx->unk_2184 & 4) && ov12_0224B528(bsys, ctx) == TRUE) {
            return;
        }
        ctx->unk_48++;
        // fallthrough
    case 2: {
        int ret;
        int script;
        if (!(ctx->unk_2184 & 1)) {
            ret = TryDisobedience(bsys, ctx, &script);
            if (ret) {
                switch (ret) {
                case 1:
                    ctx->commandNext = CONTROLLER_COMMAND_39;
                    break;
                case 2:
                    ctx->commandNext = ctx->command;
                    break;
                case 3:
                    ctx->commandNext = CONTROLLER_COMMAND_34;
                    break;
                }
                ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
                ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, script);
                return;
            }
        }
    }
        ctx->unk_48++;
        // fallthrough
    case 3:
        if (!(ctx->unk_2184 & (1 << 3)) && ov12_0224B1FC(bsys, ctx) == TRUE) {
            return;
        }
        ctx->unk_48++;
        // fallthrough
    case 4:
        if (ov12_0224B398(bsys, ctx) == TRUE) {
            return;
        }
        ctx->unk_48++;
        // fallthrough
    case 5:
        if (!(ctx->unk_2184 & (1 << 7)) && ov12_0224C204(bsys, ctx) == TRUE) {
            return;
        }
        ctx->unk_48++;
        // fallthrough
    case 6:
        ov12_02250A18(bsys, ctx, ctx->battlerIdAttacker, ctx->moveNoCur);
        ctx->unk_48 = 0;
    }

    if (ctx->moveStatusFlag & MOVE_STATUS_FAIL) {
        ctx->command = CONTROLLER_COMMAND_26;
    } else {
        ctx->battleStatus2 |= BATTLE_STATUS2_MOVE_SUCCEEDED;
        ReadBattleScriptFromNarc(ctx, NARC_a_0_0_0, ctx->moveNoCur);
        ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
        ctx->commandNext = CONTROLLER_COMMAND_24;
        ov12_02252E30(bsys, ctx);
    }
    ov12_022565E0(bsys, ctx);
}

static void ov12_0224C4D8(BattleSystem *bsys, BattleContext *ctx) {
    switch (ctx->unk_4C) {
    case 0:
        ctx->unk_4C++;
        if (ov12_0224B398(bsys, ctx) == TRUE) {
            return;
        }
        // fallthrough
    case 1:
        ctx->unk_4C++;
        if (ov12_02250BBC(bsys, ctx) == TRUE) {
            return;
        }
        // fallthrough
    case 2:
        if (!(ctx->unk_2184 & 0x20) && ctx->battlerIdTarget != BATTLER_NONE && BattleSystem_CheckMoveHit(bsys, ctx, ctx->battlerIdAttacker, ctx->battlerIdTarget, ctx->moveNoCur) == TRUE) {
            return;
        }
        ctx->unk_4C++;
        // fallthrough
    case 3:
        if (!(ctx->unk_2184 & 0x40) && ctx->battlerIdTarget != BATTLER_NONE && BattleSystem_CheckMoveEffect(bsys, ctx, ctx->battlerIdAttacker, ctx->battlerIdTarget, ctx->moveNoCur) == TRUE) {
            return;
        }
        ctx->unk_4C++;
        // fallthrough
    case 4:
        if (!(ctx->unk_2184 & 2) && ctx->battlerIdTarget != BATTLER_NONE && ov12_0224B498(bsys, ctx) == TRUE) {
            return;
        }
        ctx->unk_4C++;
        // fallthrough
    case 5:
        if (!(ctx->unk_2184 & 0x10) && ctx->battlerIdTarget != BATTLER_NONE && ov12_0224BC2C(bsys, ctx) == TRUE) {
            return;
        }
        ctx->unk_4C++;
        // fallthrough
    case 6:
        ctx->unk_4C = 0;
        break;
    }
    ctx->command = CONTROLLER_COMMAND_25;
}

static void ov12_0224C5C8(BattleSystem *bsys, BattleContext *ctx) {
    int script;

    if (ov12_022503EC(bsys, ctx, &script) == TRUE) {
        ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, script);
        ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
        ctx->commandNext = CONTROLLER_COMMAND_26;
    } else {
        ctx->command = CONTROLLER_COMMAND_26;
    }
}

static void ov12_0224C5F8(BattleSystem *bsys, BattleContext *ctx) {
    if (ctx->moveStatusFlag & MOVE_STATUS_NO_MORE_WORK) {
        ctx->command = CONTROLLER_COMMAND_35;
    } else if (ctx->moveStatusFlag & MOVE_STATUS_NO_PP) {
        ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_NO_PP);
        ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
        ctx->commandNext = CONTROLLER_COMMAND_39;
    } else if (ctx->unk_2180 && (ctx->moveStatusFlag & MOVE_STATUS_MISSED)) {
        ctx->moveStatusFlag &= ~MOVE_STATUS_MISSED;
        ctx->moveStatusFlag |= MOVE_STATUS_MULTI_HIT_DISRUPTED;
        ctx->command = CONTROLLER_COMMAND_29;
    } else if (ctx->moveStatusFlag & MOVE_STATUS_DID_NOT_HIT) {
        ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_MISSED);
        ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
        ctx->commandNext = CONTROLLER_COMMAND_34;
    } else {
        ctx->command = CONTROLLER_COMMAND_27;
    }
}

static void ov12_0224C678(BattleSystem *bsys, BattleContext *ctx) {
    ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_USE_MOVE);
    ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
    ctx->commandNext = CONTROLLER_COMMAND_HP_CALC;
}

static void BattleControllerPlayer_HpCalc(BattleSystem *bsys, BattleContext *ctx) {
    int item;
    int itemMod;

    if (ctx->moveStatusFlag & MOVE_STATUS_ONE_HIT_KO) { // TODO: MOVE_STATUS_OHKO
        ctx->damage = ctx->battleMons[ctx->battlerIdTarget].maxHp * -1;
    }
    if (ctx->damage != 0) {
        item = GetBattlerHeldItemEffect(ctx, ctx->battlerIdTarget);
        itemMod = GetHeldItemModifier(ctx, ctx->battlerIdTarget, 0);

        GF_ASSERT(ctx->damage < 0);

        if (BattleSystem_GetFieldSide(bsys, ctx->battlerIdAttacker) == BattleSystem_GetFieldSide(bsys, ctx->battlerIdTarget)) {
            BattleController_EmitIncrementGameStat(bsys, ctx->battlerIdAttacker, 0, GAME_STAT_UNK98);
        }

        ctx->unk_30F4[ctx->battlerIdTarget] = ctx->battlerIdAttacker;

        if (ctx->battleMons[ctx->battlerIdTarget].status2 & STATUS2_SUBSTITUTE && ctx->damage < 0) {
            if (ctx->battleMons[ctx->battlerIdTarget].unk88.substituteHp + ctx->damage <= 0) {
                ctx->selfTurnData[ctx->battlerIdAttacker].shellBellDamage += ctx->battleMons[ctx->battlerIdTarget].unk88.substituteHp * -1;
                ctx->battleMons[ctx->battlerIdTarget].status2 &= ~STATUS2_SUBSTITUTE;
                ctx->hitDamage = ctx->battleMons[ctx->battlerIdTarget].unk88.substituteHp * -1;
                ctx->battleMons[ctx->battlerIdTarget].unk88.substituteHp = 0;
            } else {
                ctx->selfTurnData[ctx->battlerIdAttacker].shellBellDamage += ctx->damage;
                ctx->battleMons[ctx->battlerIdTarget].unk88.substituteHp += ctx->damage;
                ctx->hitDamage = ctx->damage;
            }
            ctx->selfTurnData[ctx->battlerIdTarget].unk14 |= 8;
            ctx->battlerIdTemp = ctx->battlerIdTarget;
            ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_HIT_SUBSTITUTE);
            ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
            ctx->commandNext = CONTROLLER_COMMAND_29;
        } else {
            // False Swipe
            if (ctx->trainerAIData.moveData[ctx->moveNoCur].effect == MOVE_EFFECT_LEAVE_WITH_1_HP && ctx->battleMons[ctx->battlerIdTarget].hp + ctx->damage <= 0) {
                ctx->damage = (ctx->battleMons[ctx->battlerIdTarget].hp - 1) * -1;
            }

            if (!ctx->turnData[ctx->battlerIdTarget].endureFlag) {
                if (item == HOLD_EFFECT_MAYBE_ENDURE && (BattleSystem_Random(bsys) % 100) < itemMod) {
                    ctx->selfTurnData[ctx->battlerIdTarget].endureItemFlag = 1;
                }
                if (item == HOLD_EFFECT_ENDURE && ctx->battleMons[ctx->battlerIdTarget].hp == ctx->battleMons[ctx->battlerIdTarget].maxHp) {
                    ctx->selfTurnData[ctx->battlerIdTarget].endureItemFlag = 1;
                }
            }

            if (ctx->turnData[ctx->battlerIdTarget].endureFlag || ctx->selfTurnData[ctx->battlerIdTarget].endureItemFlag) {
                if (ctx->battleMons[ctx->battlerIdTarget].hp + ctx->damage <= 0) {
                    ctx->damage = (ctx->battleMons[ctx->battlerIdTarget].hp - 1) * -1;
                    if (ctx->turnData[ctx->battlerIdTarget].endureFlag) {
                        ctx->moveStatusFlag |= MOVE_STATUS_ENDURED;
                    } else {
                        ctx->moveStatusFlag |= MOVE_STATUS_ENDURED_ITEM;
                    }
                }
            }

            ctx->unk_30E4[ctx->battlerIdTarget] += ctx->damage;

            if (ctx->battleMons[ctx->battlerIdTarget].unk78 < 255) {
                ctx->battleMons[ctx->battlerIdTarget].unk78++;
            }

            if (ctx->trainerAIData.moveData[ctx->moveNoCur].category == CATEGORY_PHYSICAL) {
                ctx->turnData[ctx->battlerIdTarget].physicalDamage[ctx->battlerIdAttacker] = ctx->damage;
                ctx->turnData[ctx->battlerIdTarget].battlerIdPhysicalDamage = ctx->battlerIdAttacker;
                ctx->turnData[ctx->battlerIdTarget].battlerBitPhysicalDamage |= MaskOfFlagNo(ctx->battlerIdAttacker);
                ctx->selfTurnData[ctx->battlerIdTarget].physicalDamage = ctx->damage;
                ctx->selfTurnData[ctx->battlerIdTarget].battlerIdPhysicalAttacker = ctx->battlerIdAttacker;
            } else if (ctx->trainerAIData.moveData[ctx->moveNoCur].category == CATEGORY_SPECIAL) {
                ctx->turnData[ctx->battlerIdTarget].specialDamage[ctx->battlerIdAttacker] = ctx->damage;
                ctx->turnData[ctx->battlerIdTarget].battlerIdSpecialDamage = ctx->battlerIdAttacker;
                ctx->turnData[ctx->battlerIdTarget].battlerBitSpecialDamage |= MaskOfFlagNo(ctx->battlerIdAttacker);
                ctx->selfTurnData[ctx->battlerIdTarget].specialDamage = ctx->damage;
                ctx->selfTurnData[ctx->battlerIdTarget].battlerIdSpecialAttacker = ctx->battlerIdAttacker;
            }

            if (ctx->battleMons[ctx->battlerIdTarget].hp + ctx->damage <= 0) {
                ctx->selfTurnData[ctx->battlerIdAttacker].shellBellDamage += ctx->battleMons[ctx->battlerIdTarget].hp * -1;
            } else {
                ctx->selfTurnData[ctx->battlerIdAttacker].shellBellDamage += ctx->damage;
            }

            ctx->turnData[ctx->battlerIdTarget].unk34 = ctx->damage;
            ctx->turnData[ctx->battlerIdTarget].unk38 = ctx->battlerIdAttacker;
            ctx->battlerIdTemp = ctx->battlerIdTarget;
            ctx->hpCalc = ctx->damage;
            ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_UPDATE_HP);
            ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
            ctx->commandNext = CONTROLLER_COMMAND_29;
            ctx->battleStatus |= BATTLE_STATUS_MOVE_SUCCESSFUL;
        }
    } else {
        ctx->command = CONTROLLER_COMMAND_29;
    }
}

static void ov12_0224CAA4(BattleSystem *bsys, BattleContext *ctx) {
    switch (ctx->unk_38) {
    case 0:
        switch (ctx->unk_3C) {
        case 0:
            ctx->unk_3C++;
            if (ov12_0224DF7C(bsys, ctx) == TRUE) {
                return;
            }
            // fallthrough
        case 1:
            ctx->unk_3C++;
            if (ov12_0224DF98(bsys, ctx) == TRUE) {
                return;
            }
            // fallthrough
        case 2: {
            int script;

            ctx->unk_3C++;
            if (ov12_02250490(bsys, ctx, &script) == TRUE && !(ctx->moveStatusFlag & MOVE_STATUS_DID_NOT_HIT)) {
                ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, script);
                ctx->commandNext = ctx->command;
                ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
                return;
            }
        }
            // fallthrough
        case 3:
            ctx->unk_3C++;
            ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_CHECK_SHAYMIN_FORM);
            ctx->commandNext = ctx->command;
            ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
            return;
        case 4:
            ctx->unk_3C++;
            if (TryBuildRage(bsys, ctx) == TRUE) {
                return;
            }
            // fallthrough
        case 5: {
            int script;

            ctx->unk_3C++;
            if (CheckAbilityEffectOnHit(bsys, ctx, &script) == TRUE) {
                ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, script);
                ctx->commandNext = ctx->command;
                ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
                return;
            }
        }
            // fallthrough
        case 6:
            ctx->unk_3C++;
            if (TryItemFlinch(bsys, ctx) == TRUE) {
                return;
            }
            // fallthrough
        default:
            break;
        }
        break;
    case 1:
        switch (ctx->unk_3C) {
        case 0:
            ctx->unk_3C++;
            if (ov12_0224DF7C(bsys, ctx) == TRUE) {
                return;
            }
            // fallthrough
        case 1: {
            int script;

            ctx->unk_3C++;
            if (ov12_02250490(bsys, ctx, &script) == TRUE && !(ctx->moveStatusFlag & MOVE_STATUS_DID_NOT_HIT)) {
                ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, script);
                ctx->commandNext = ctx->command;
                ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
                return;
            }
        }
            // fallthrough
        case 2:
            ctx->unk_3C++;
            ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_CHECK_SHAYMIN_FORM);
            ctx->commandNext = ctx->command;
            ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
            return;
        case 3:
            ctx->unk_3C++;
            if (TryBuildRage(bsys, ctx) == TRUE) {
                return;
            }
            // fallthrough
        case 4: {
            int script;

            ctx->unk_3C++;
            if (CheckAbilityEffectOnHit(bsys, ctx, &script) == TRUE) {
                ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, script);
                ctx->commandNext = ctx->command;
                ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
                return;
            }
        }
            // fallthrough
        case 5:
            ctx->unk_3C++;
            if (ov12_0224DF98(bsys, ctx) == TRUE) {
                return;
            }
            // fallthrough
        case 6:
            ctx->unk_3C++;
            if (TryItemFlinch(bsys, ctx) == TRUE) {
                return;
            }
            // fallthrough
        default:
            break;
        }
    }
    ctx->unk_3C = 0;
    ctx->command = CONTROLLER_COMMAND_31;
}

static void ov12_0224CC84(BattleSystem *bsys, BattleContext *ctx) {
}

// static
void ov12_0224CC88(BattleSystem *bsys, BattleContext *ctx) {
    switch (ctx->unk_40) {
    case 0: {
        int flag = 0;
        while (ctx->unk_44 < BattleSystem_GetMaxBattlers(bsys)) {
            if (!(ctx->battleMons[ctx->unk_44].moveEffectFlags & MOVE_EFFECT_FLAG_HIDE_SUBSTITUTE) && (ctx->battleMons[ctx->unk_44].moveEffectFlagsTemp & MOVE_EFFECT_FLAG_HIDE_SUBSTITUTE)) {
                ctx->battleMons[ctx->unk_44].moveEffectFlagsTemp &= ~MOVE_EFFECT_FLAG_HIDE_SUBSTITUTE;
                ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_VANISH_OFF);
                ctx->battlerIdTemp = ctx->unk_44;
                ctx->commandNext = ctx->command;
                ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
                flag = 1;
            }
            ctx->unk_44++;
            if (flag) {
                return;
            }
        }
    }
        ctx->unk_40++;
        ctx->unk_44 = 0;
        // fallthrough
    case 1:
        ctx->unk_40++;
        if (TrySyncronizeStatus(bsys, ctx, ctx->command) == TRUE) {
            return;
        }
        // fallthrough
    case 2: {
        int script = TryAbilityOnEntry(bsys, ctx);

        if (script) {
            ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, script);
            ctx->commandNext = ctx->command;
            ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
            return;
        }
    }
        ctx->unk_40++;
        // fallthrough
    case 3:
        ctx->unk_40++;
        if (TryUseHeldItem(bsys, ctx, ctx->battlerIdAttacker) == TRUE) {
            return;
        }
        // fallthrough
    case 4:
        ctx->unk_40++;
        if (ctx->battlerIdTarget != BATTLER_NONE) {
            if (TryUseHeldItem(bsys, ctx, ctx->battlerIdTarget) == TRUE) {
                return;
            }
        }
        // fallthrough
    case 5: {
        int script;
        ctx->unk_40++;
        if (CheckItemEffectOnHit(bsys, ctx, &script) == TRUE) {
            ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, script);
            ctx->commandNext = ctx->command;
            ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
            return;
        }
    }
        // fallthrough
    case 6: {
        int moveType;

        if (GetBattlerAbility(ctx, ctx->battlerIdAttacker) == ABILITY_NORMALIZE) {
            moveType = TYPE_NORMAL;
        } else if (ctx->moveType != 0) {
            moveType = ctx->moveType;
        } else {
            moveType = ctx->trainerAIData.moveData[ctx->moveNoCur].type;
        }

        ctx->unk_40++;

        // Check for unfreeze via move
        if (ctx->battlerIdTarget != BATTLER_NONE
            && (ctx->battleMons[ctx->battlerIdTarget].status & STATUS_FREEZE)
            && !(ctx->moveStatusFlag & MOVE_STATUS_MULTI_HIT_DISRUPTED)
            && ctx->battlerIdTarget != ctx->battlerIdAttacker
            && (ctx->selfTurnData[ctx->battlerIdTarget].physicalDamage != 0 || ctx->selfTurnData[ctx->battlerIdTarget].specialDamage != 0)
            && ctx->battleMons[ctx->battlerIdTarget].hp != 0
            && moveType == TYPE_FIRE) {
            ctx->battlerIdTemp = ctx->battlerIdTarget;
            ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_THAW_OUT);
            ctx->commandNext = ctx->command;
            ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
            return;
        }
    }
        // fallthrough
    case 7: {
        int battlerId;
        int flag = 0;
        int script;

        while (ctx->unk_44 < BattleSystem_GetMaxBattlers(bsys)) {
            battlerId = ctx->turnOrder[ctx->unk_44];
            if (ctx->switchInFlag & MaskOfFlagNo(battlerId)) {
                ctx->unk_44++;
                continue;
            }
            ctx->unk_44++;
            if (CheckUseHeldItem(bsys, ctx, battlerId, &script) == TRUE) {
                ctx->battlerIdTemp = battlerId;
                ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, script);
                ctx->commandNext = ctx->command;
                ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
                flag = 1;
                break;
            }
        }
        if (flag == 0) {
            ctx->unk_40++;
            ctx->unk_44 = 0;
        }
    }
        // fallthrough
    default:
        break;
    }

    ctx->unk_40 = 0;
    ctx->unk_44 = 0;
    ctx->command = CONTROLLER_COMMAND_32;
}

static void ov12_0224CF10(BattleSystem *bsys, BattleContext *ctx) {
}

static void ov12_0224CF14(BattleSystem *bsys, BattleContext *ctx) {
    if (ctx->multiHitCountTemp != 0) {
        if (ctx->battlerIdFainted == BATTLER_NONE && !(ctx->battleMons[ctx->battlerIdAttacker].status & STATUS_SLEEP) && !(ctx->moveStatusFlag & MOVE_STATUS_MULTI_HIT_DISRUPTED)) {
            if (--ctx->multiHitCount) {
                ctx->unk_2180 = 1;
                ov12_02252D14(bsys, ctx);
                ctx->battleStatus &= ~BATTLE_STATUS_MOVE_ANIMATIONS_OFF;
                ctx->unk_2184 = ctx->checkMultiHit;
                ReadBattleScriptFromNarc(ctx, NARC_a_0_0_0, ctx->moveNoCur);
                ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
                ctx->commandNext = CONTROLLER_COMMAND_24;
            } else {
                ctx->msgTemp = ctx->multiHitCountTemp;
                ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_HIT_X_TIMES);
                ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
                ctx->commandNext = CONTROLLER_COMMAND_34;
            }
        } else {
            if (ctx->battlerIdFainted != BATTLER_NONE || ctx->battleMons[ctx->battlerIdAttacker].status & STATUS_SLEEP) {
                ctx->msgTemp = ctx->multiHitCountTemp - ctx->multiHitCount + 1;
            } else {
                ctx->msgTemp = ctx->multiHitCountTemp - ctx->multiHitCount;
            }
            ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_HIT_X_TIMES);
            ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
            ctx->commandNext = CONTROLLER_COMMAND_34;
        }
        BattleController_EmitBlankMessage(bsys);
    } else {
        ctx->command = CONTROLLER_COMMAND_34;
    }
}

static void ov12_0224D014(BattleSystem *bsys, BattleContext *ctx) {
    if (ctx->battleStatus & BATTLE_STATUS_FAINTED) {
        TryFaintMon(ctx, CONTROLLER_COMMAND_34, CONTROLLER_COMMAND_34, 0);
    } else {
        ctx->command = CONTROLLER_COMMAND_35;
    }
}

static void ov12_0224D03C(BattleSystem *bsys, BattleContext *ctx) {
    if (ctx->battleStatus2 & BATTLE_STATUS2_MAGIC_COAT) {
        ctx->battleStatus2 &= ~BATTLE_STATUS2_MAGIC_COAT;
        ctx->battlerIdTarget = ctx->battlerIdAttacker;
        ctx->battlerIdAttacker = ctx->battlerIdMagicCoat;
    }

    ov12_0224DD74(bsys, ctx);

    if (ctx->trainerAIData.moveData[ctx->moveNoCur].range == RANGE_ADJACENT_OPPONENTS && !(ctx->battleStatus & BATTLE_STATUS_CHECK_LOOP_ONLY_ONCE) && ctx->unk_217E < BattleSystem_GetMaxBattlers(bsys)) {
        ctx->unk_2184 = 13;
        int battlerId;
        int maxBattlers = BattleSystem_GetMaxBattlers(bsys);
        OpponentData *opponent = BattleSystem_GetOpponentData(bsys, ctx->battlerIdAttacker);
        u8 flag = ov12_02261258(opponent);

        do {
            battlerId = ctx->turnOrder[ctx->unk_217E++];
            if (!(ctx->switchInFlag & MaskOfFlagNo(battlerId)) && ctx->battleMons[battlerId].hp != 0) {
                opponent = BattleSystem_GetOpponentData(bsys, battlerId);
                if (((flag & 1) && !(ov12_02261258(opponent) & 1)) || (!(flag & 1) && ov12_02261258(opponent) & 1)) {
                    ov12_02252D14(bsys, ctx);
                    ctx->battlerIdTarget = battlerId;
                    ctx->command = CONTROLLER_COMMAND_23;
                    break;
                }
            }
        } while (ctx->unk_217E < BattleSystem_GetMaxBattlers(bsys));

        BattleController_EmitBlankMessage(bsys);
    } else if (ctx->trainerAIData.moveData[ctx->moveNoCur].range == RANGE_ALL_ADJACENT && !(ctx->battleStatus & BATTLE_STATUS_CHECK_LOOP_ONLY_ONCE) && ctx->unk_217E < BattleSystem_GetMaxBattlers(bsys)) {
        ctx->unk_2184 = 13;

        int battlerId;
        int maxBattlers = BattleSystem_GetMaxBattlers(bsys);

        do {
            battlerId = ctx->turnOrder[ctx->unk_217E++];
            if (!(ctx->switchInFlag & MaskOfFlagNo(battlerId)) && ctx->battleMons[battlerId].hp != 0) {
                if (battlerId != ctx->battlerIdAttacker) {
                    ov12_02252D14(bsys, ctx);
                    ctx->battlerIdTarget = battlerId;
                    ctx->command = CONTROLLER_COMMAND_23;
                    break;
                }
            }
        } while (ctx->unk_217E < BattleSystem_GetMaxBattlers(bsys));

        BattleController_EmitBlankMessage(bsys);
    } else {
        ctx->command = CONTROLLER_COMMAND_36;
    }
}

static void ov12_0224D1DC(BattleSystem *bsys, BattleContext *ctx) {
    if (ctx->battleStatus & BATTLE_STATUS_SELFDESTRUCTED) {
        ctx->battlerIdFainted = LowestFlagNo((ctx->battleStatus & BATTLE_STATUS_SELFDESTRUCTED) >> BATTLE_STATUS_SELFDESTRUCTED_SHIFT);
        ctx->battleStatus &= ~BATTLE_STATUS_SELFDESTRUCTED;
        ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_AFTER_SELFDESTRUCT);
        ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
        ctx->commandNext = CONTROLLER_COMMAND_37;
    } else {
        ctx->command = CONTROLLER_COMMAND_37;
    }
}

static void ov12_0224D224(BattleSystem *bsys, BattleContext *ctx) {
    if (!(ov12_0224E1BC(bsys, ctx) == TRUE)) {
        ctx->command = CONTROLLER_COMMAND_39;
    }
}

static void ov12_0224D238(BattleSystem *bsys, BattleContext *ctx) {
}

static void ov12_0224D23C(BattleSystem *bsys, BattleContext *ctx) {
    u8 item = GetBattlerHeldItemEffect(ctx, ctx->battlerIdAttacker);
    if (ctx->battleStatus & BATTLE_STATUS_CHARGE_TURN || ctx->battleStatus2 & BATTLE_STATUS2_DISPLAY_ATTACK_MESSAGE) {
        if (item == HOLD_EFFECT_CHOICE_ATK || item == HOLD_EFFECT_CHOICE_SPEED || item == HOLD_EFFECT_CHOICE_SPATK) {
            if (!(ctx->moveNoTemp == MOVE_STRUGGLE || (ctx->moveNoTemp == MOVE_U_TURN && ctx->battleStatus2 & BATTLE_STATUS2_UTURN) || (ctx->moveNoTemp == MOVE_BATON_PASS && ctx->battleStatus2 & BATTLE_STATUS2_MOVE_SUCCEEDED))) {
                ctx->battleMons[ctx->battlerIdAttacker].unk88.moveNoChoice = ctx->moveNoTemp;
            }
        } else {
            ctx->battleMons[ctx->battlerIdAttacker].unk88.moveNoChoice = 0;
        }
    }

    if (!(ctx->battleStatus & BATTLE_STATUS_NO_MOVE_SET)) {
        if (ctx->battleStatus2 & BATTLE_STATUS2_DISPLAY_ATTACK_MESSAGE) {
            ctx->moveNoProtect[ctx->battlerIdAttacker] = ctx->moveNoCur;
            ctx->moveNoPrev = ctx->moveNoTemp;
        } else {
            ctx->moveNoProtect[ctx->battlerIdAttacker] = 0;
            ctx->moveNoPrev = 0;
        }
        if (ctx->battleStatus2 & BATTLE_STATUS2_MOVE_SUCCEEDED) {
            ctx->moveNoBattlerPrev[ctx->battlerIdAttacker] = ctx->moveNoTemp;
        } else {
            ctx->moveNoBattlerPrev[ctx->battlerIdAttacker] = 0;
        }
    }

    if (ctx->battleStatus2 & BATTLE_STATUS2_DISPLAY_ATTACK_MESSAGE) {
        ctx->moveNoSketch[ctx->battlerIdAttacker] = ctx->moveNoTemp;
    }

    ov12_0224DD74(bsys, ctx);
    ov12_02256694(bsys, ctx);
    ctx->command = CONTROLLER_COMMAND_40;
}

static void ov12_0224D368(BattleSystem *bsys, BattleContext *ctx) {
    int script;
    u32 battleType = BattleSystem_GetBattleType(bsys);

    if (!(battleType & (BATTLE_TYPE_SAFARI | BATTLE_TYPE_PAL_PARK))) {
        if (CheckStatusHealAbility(bsys, ctx, ctx->battlerIdAttacker, 0) == TRUE) {
            return;
        }
        if (ctx->battlerIdTarget != BATTLER_NONE && CheckStatusHealAbility(bsys, ctx, ctx->battlerIdTarget, 0) == TRUE) {
            return;
        }
        if (ov12_0224DD18(ctx, ctx->command, ctx->command) == TRUE) {
            return;
        }
        if (ov12_0224D7EC(bsys, ctx) == TRUE) {
            return;
        }

        script = TryAbilityOnEntry(bsys, ctx);
        if (script) {
            ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, script);
            ctx->commandNext = ctx->command;
            ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
            return;
        }
        if (ov12_0224E130(bsys, ctx) == TRUE) {
            return;
        }
        ov12_0224DC0C(bsys, ctx);
    }

    ctx->playerActions[ctx->executionOrder[ctx->executionIndex]].command = CONTROLLER_COMMAND_40;

    if (ctx->selfTurnData[ctx->battlerIdAttacker].trickRoomFlag) {
        SortExecutionOrderBySpeed(bsys, ctx);
        SortMonsBySpeed(bsys, ctx);
        ctx->executionIndex = 0;
    } else {
        ctx->executionIndex++;
    }

    BattleContext_Init(ctx);

    ctx->command = CONTROLLER_COMMAND_8;
}

static void ov12_0224D448(BattleSystem *bsys, BattleContext *ctx) {
    if (TryFaintMon(ctx, ctx->command, ctx->command, 1) != TRUE) {
        ctx->command = CONTROLLER_COMMAND_40;
    }
}

static void ov12_0224D464(BattleSystem *bsys, BattleContext *ctx) {
    if (BattleSystem_GetBattleOutcomeFlags(bsys) & BATTLE_RESULT_TRY_FLEE) {
        ctx->command = CONTROLLER_COMMAND_44;
    } else if (BattleSystem_GetBattleOutcomeFlags(bsys) == BATTLE_RESULT_LOSE || BattleSystem_GetBattleOutcomeFlags(bsys) == BATTLE_RESULT_DRAW) {
        ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_BATTLE_LOST);
        ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
        ctx->commandNext = CONTROLLER_COMMAND_44;
    } else if (BattleSystem_GetBattleOutcomeFlags(bsys) == BATTLE_OUTCOME_WIN) {
        ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_BATTLE_WON);
        ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
        ctx->commandNext = CONTROLLER_COMMAND_44;
    } else if (BattleSystem_GetBattleOutcomeFlags(bsys) == BATTLE_RESULT_CAPTURED_MON) {
        ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
        ctx->commandNext = CONTROLLER_COMMAND_44;
    } else if (BattleSystem_GetBattleOutcomeFlags(bsys) == BATTLE_RESULT_PLAYER_FLED) {
        ctx->command = CONTROLLER_COMMAND_44;
    }
    ctx->battleEndFlag = TRUE;
}

static void ov12_0224D4F0(BattleSystem *bsys, BattleContext *ctx) {
    if (IsPaletteFadeFinished() == TRUE) {
        ctx->command = CONTROLLER_COMMAND_44;
    }
}

static void ov12_0224D504(BattleSystem *bsys, BattleContext *ctx) {
    Party *party;
    u32 battleType = BattleSystem_GetBattleType(bsys);

    if (!(battleType & BATTLE_TYPE_LINK)) {
        party = BattleSystem_GetParty(bsys, BATTLER_PLAYER);
        Party_GivePokerusAtRandom(party);
        Party_SpreadPokerus(party);
    }

    if (battleType & BATTLE_TYPE_LINK) {
        sub_020376EC(22);
    }

    ctx->command = CONTROLLER_COMMAND_45;
}

static void ov12_0224D53C(BattleSystem *bsys, BattleContext *ctx) {
}

static BOOL ov12_0224D540(BattleSystem *bsys, BattleContext *ctx) {
    u8 flag = FALSE;
    int battlerId;
    int maxBattlers = BattleSystem_GetMaxBattlers(bsys);
    u32 battleType = BattleSystem_GetBattleType(bsys);
    ControllerCommand cmd = ctx->command;

    for (battlerId = 0; battlerId < maxBattlers; battlerId++) {
        ctx->unk_13C[battlerId] &= ~1;
        if (((battleType & BATTLE_TYPE_DOUBLES) && !(battleType & (BATTLE_TYPE_MULTI | BATTLE_TYPE_TAG))) || ((battleType & BATTLE_TYPE_TAG) && BattleSystem_GetFieldSide(bsys, battlerId) == 0)) {
            if (ctx->battleMons[battlerId].hp != 0 || ctx->battleMons[battlerId ^ 2].hp != 0 || !(battlerId & 2)) {
                if (ctx->battleMons[battlerId].hp == 0) {
                    int i;
                    int hp = 0;
                    Party *party = BattleSystem_GetParty(bsys, battlerId);
                    BattleSystem_GetOpponentData(bsys, battlerId); // called but unused

                    for (i = 0; i < Party_GetCount(party); i++) {
                        Pokemon *mon = Party_GetMonByIndex(party, i);
                        if (GetMonData(mon, MON_DATA_SPECIES_OR_EGG, NULL) != SPECIES_NONE && GetMonData(mon, MON_DATA_SPECIES_OR_EGG, NULL) != SPECIES_EGG) {
                            u32 hpTemp = GetMonData(mon, MON_DATA_HP, NULL);
                            if (hpTemp != 0 && ctx->selectedMonIndex[battlerId ^ 2] != i) {
                                hp += hpTemp;
                            }
                        }
                    }

                    if (hp == 0) {
                        ctx->switchInFlag |= MaskOfFlagNo(battlerId);
                        ctx->selectedMonIndex[battlerId] = 6;
                    } else {
                        ctx->commandNext = cmd;
                        ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
                        ctx->unk_13C[battlerId] |= 1;
                    }
                }
            }
        } else if (ctx->battleMons[battlerId].hp == 0) {
            int i;
            int hp = 0;
            Party *party = BattleSystem_GetParty(bsys, battlerId);
            BattleSystem_GetOpponentData(bsys, battlerId);

            for (i = 0; i < Party_GetCount(party); i++) {
                Pokemon *mon = Party_GetMonByIndex(party, i);
                if (GetMonData(mon, MON_DATA_SPECIES_OR_EGG, 0) != SPECIES_NONE && GetMonData(mon, MON_DATA_SPECIES_OR_EGG, 0) != SPECIES_EGG) {
                    hp += GetMonData(mon, MON_DATA_HP, NULL);
                }
            }

            if (hp == 0) {
                ctx->switchInFlag |= MaskOfFlagNo(battlerId);
                ctx->selectedMonIndex[battlerId] = 6;
            } else {
                ctx->commandNext = cmd;
                ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
                ctx->unk_13C[battlerId] |= 1;
            }
        }
    }

    if (ctx->command == CONTROLLER_COMMAND_RUN_SCRIPT) {
        if ((!(battleType & (BATTLE_TYPE_FRONTIER | BATTLE_TYPE_DOUBLES | BATTLE_TYPE_LINK)) && BattleSystem_GetBattleStyle(bsys) == 0) && (!(ctx->unk_13C[0] & 1) || !(ctx->unk_13C[1] & 1)) && CanSwitchMon(bsys, ctx, 0)) {
            if (ctx->unk_13C[0] & 1) {
                ctx->tempData = 0;
            } else {
                ctx->tempData = 1;
            }
            ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_REPLACE_FAINTED);
        } else {
            ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_SHOW_PARTY_LIST);
        }

        flag = TRUE;
    }

    return flag;
}

static BOOL ov12_0224D7EC(BattleSystem *bsys, BattleContext *ctx) {
    int battlerId;
    int maxBattlers = BattleSystem_GetMaxBattlers(bsys);
    u32 battleType = BattleSystem_GetBattleType(bsys);
    u8 battleOutcome = 0;

    for (battlerId = 0; battlerId < maxBattlers; battlerId++) {
        if ((battleType == (BATTLE_TYPE_AI | BATTLE_TYPE_MULTI | BATTLE_TYPE_DOUBLES) || battleType == (BATTLE_TYPE_AI | BATTLE_TYPE_TRAINER | BATTLE_TYPE_DOUBLES | BATTLE_TYPE_MULTI)) && BattleSystem_GetFieldSide(bsys, battlerId) == 0) {
            if (ov12_0223AB0C(bsys, battlerId) == 2 && ctx->battleMons[battlerId].hp == 0) {
                int hp = 0;
                Party *party = BattleSystem_GetParty(bsys, battlerId);
                BattleSystem_GetOpponentData(bsys, battlerId);

                for (int i = 0; i < Party_GetCount(party); i++) {
                    Pokemon *mon = Party_GetMonByIndex(party, i);
                    if (GetMonData(mon, MON_DATA_SPECIES_OR_EGG, NULL) != SPECIES_NONE && GetMonData(mon, MON_DATA_SPECIES_OR_EGG, NULL) != SPECIES_EGG) {
                        hp += GetMonData(mon, MON_DATA_HP, NULL);
                    }
                }

                if (hp == 0) {
                    battleOutcome |= 2;
                }
            }
        } else if ((battleType & BATTLE_TYPE_MULTI) || ((battleType & BATTLE_TYPE_TAG) && BattleSystem_GetFieldSide(bsys, battlerId))) {
            if (ctx->battleMons[battlerId].hp == 0) {
                int i;
                int hp = 0;
                Party *party = BattleSystem_GetParty(bsys, battlerId);
                Party *partnerParty = BattleSystem_GetParty(bsys, BattleSystem_GetBattlerIdPartner(bsys, battlerId));
                OpponentData *opponent = BattleSystem_GetOpponentData(bsys, battlerId);

                for (i = 0; i < Party_GetCount(party); i++) {
                    Pokemon *mon = Party_GetMonByIndex(party, i);
                    if (GetMonData(mon, MON_DATA_SPECIES_OR_EGG, NULL) != SPECIES_NONE && GetMonData(mon, MON_DATA_SPECIES_OR_EGG, NULL) != SPECIES_EGG) {
                        hp += GetMonData(mon, MON_DATA_HP, NULL);
                    }
                }

                for (i = 0; i < Party_GetCount(partnerParty); i++) {
                    Pokemon *mon = Party_GetMonByIndex(partnerParty, i);
                    if (GetMonData(mon, MON_DATA_SPECIES_OR_EGG, NULL) != SPECIES_NONE && GetMonData(mon, MON_DATA_SPECIES_OR_EGG, NULL) != SPECIES_EGG) {
                        hp += GetMonData(mon, MON_DATA_HP, NULL);
                    }
                }

                if (hp == 0) {
                    if (ov12_02261258(opponent) & 1) {
                        battleOutcome |= BATTLE_RESULT_WIN;
                    } else {
                        battleOutcome |= BATTLE_RESULT_LOSE;
                    }
                }
            }
        } else {
            if (ctx->battleMons[battlerId].hp == 0) {
                int hp = 0;
                Party *party = BattleSystem_GetParty(bsys, battlerId);
                OpponentData *opponent = BattleSystem_GetOpponentData(bsys, battlerId);

                for (int i = 0; i < Party_GetCount(party); i++) {
                    Pokemon *mon = Party_GetMonByIndex(party, i);
                    if (GetMonData(mon, MON_DATA_SPECIES_OR_EGG, NULL) != SPECIES_NONE && GetMonData(mon, MON_DATA_SPECIES_OR_EGG, NULL) != SPECIES_EGG) {
                        hp += GetMonData(mon, MON_DATA_HP, NULL);
                    }
                }

                if (hp == 0) {
                    if (ov12_02261258(opponent) & 1) {
                        battleOutcome |= BATTLE_RESULT_WIN;
                    } else {
                        battleOutcome |= BATTLE_RESULT_LOSE;
                    }
                }
            }
        }
    }

    if ((battleOutcome == BATTLE_OUTCOME_WIN && battleType & BATTLE_TYPE_TRAINER && !(battleType & BATTLE_TYPE_LINK)) || (battleOutcome == BATTLE_OUTCOME_WIN && battleType & BATTLE_TYPE_FRONTIER && !(battleType & BATTLE_TYPE_LINK))) {
        Trainer *trainer = BattleSystem_GetTrainer(bsys, BATTLER_ENEMY);

        switch (trainer->data.trainerClass) {
        case TRAINERCLASS_LEADER_FALKNER:
        case TRAINERCLASS_LEADER_BUGSY:
        case TRAINERCLASS_LEADER_WHITNEY:
        case TRAINERCLASS_LEADER_MORTY:
        case TRAINERCLASS_LEADER_PRYCE:
        case TRAINERCLASS_LEADER_JASMINE:
        case TRAINERCLASS_LEADER_CHUCK:
        case TRAINERCLASS_LEADER_CLAIR:
        case TRAINERCLASS_CHAMPION:
        case TRAINERCLASS_ELITE_FOUR_WILL:
        case TRAINERCLASS_ELITE_FOUR_KAREN:
        case TRAINERCLASS_ELITE_FOUR_KOGA:
        case TRAINERCLASS_ELITE_FOUR_BRUNO:
        case TRAINERCLASS_LEADER_BROCK:
        case TRAINERCLASS_LEADER_MISTY:
        case TRAINERCLASS_LEADER_LT_SURGE:
        case TRAINERCLASS_LEADER_ERIKA:
        case TRAINERCLASS_LEADER_JANINE:
        case TRAINERCLASS_LEADER_SABRINA:
        case TRAINERCLASS_LEADER_BLAINE:
        case TRAINERCLASS_LEADER_BLUE:
            PlayBGM(SEQ_GS_WIN3);
            break;
        case TRAINERCLASS_TOWER_TYCOON:
        case TRAINERCLASS_HALL_MATRON:
        case TRAINERCLASS_FACTORY_HEAD:
        case TRAINERCLASS_ARCADE_STAR:
        case TRAINERCLASS_CASTLE_VALET:
            PlayBGM(SEQ_GS_WINBRAIN);
            break;
        default:
            PlayBGM(SEQ_GS_WIN1);
            break;
        }

        BattleSystem_SetCriticalHpMusicFlag(bsys, 2);
    }

    if (battleOutcome) {
        BattleSystem_SetBattleOutcomeFlags(bsys, battleOutcome);
    }

    return battleOutcome != 0;
}

static BOOL ov12_0224DB64(BattleSystem *bsys, BattleContext *ctx, u8 battlerId, u32 battleType, int *out, int movePos, u32 *side) {
    if (ctx->battleMons[battlerId].moves[movePos] == MOVE_CURSE && CurseUserIsGhost(ctx, ctx->battleMons[battlerId].moves[movePos], battlerId) == FALSE) {
        *out = RANGE_USER;
    } else {
        *out = ctx->trainerAIData.moveData[ctx->battleMons[battlerId].moves[movePos]].range;
    }

    if (battleType & BATTLE_TYPE_DOUBLES) {
        if (*out == RANGE_ALLY) {
            return (ctx->switchInFlag & MaskOfFlagNo(BattleSystem_GetBattlerIdPartner(bsys, battlerId))) == 0;
        } else {
            return TRUE;
        }
    } else {
        if (*out & 0x251) {
            *side = battlerId;
        } else {
            *side = battlerId ^ 1;
        }
        return FALSE;
    }
}

static void ov12_0224DC0C(BattleSystem *bsys, BattleContext *ctx) {
    int battlerId;
    int maxBattlers = BattleSystem_GetMaxBattlers(bsys);

    for (battlerId = 0; battlerId < maxBattlers; battlerId++) {
        ctx->battleMons[battlerId].status2 &= ctx->unk_218C[battlerId] ^ 0xFFFFFFFF;
        ctx->unk_218C[battlerId] = 0;
    }

    ctx->moveNoHit[ctx->battlerIdAttacker] = 0;
    ctx->conversion2Move[ctx->battlerIdAttacker] = 0;
}

static BOOL TryFaintMon(BattleContext *ctx, ControllerCommand commandNext, ControllerCommand command, int flag) {
    int turn = 0;
    int faintedFlag = MaskOfFlagNo(ctx->turnOrder[turn]) << BATTLE_STATUS_FAINTED_SHIFT;

    if (ctx->battleStatus & BATTLE_STATUS_FAINTED) {
        while ((ctx->battleStatus & faintedFlag) == 0) {
            turn++;
            faintedFlag = MaskOfFlagNo(ctx->turnOrder[turn]) << BATTLE_STATUS_FAINTED_SHIFT;
        }
        ctx->battleStatus &= faintedFlag ^ 0xFFFFFFFF;
        ctx->battlerIdFainted = LowestFlagNo(faintedFlag >> BATTLE_STATUS_FAINTED_SHIFT);

        if (flag == 1) {
            ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_FAINT_MON);
        } else {
            ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_FAINT_CHECK_DESTINY_BOND);
        }
        ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
        ctx->commandNext = commandNext;
        ctx->playerActions[ctx->battlerIdFainted].command = CONTROLLER_COMMAND_40;
        return TRUE;
    } else {
        ctx->command = command;
        return FALSE;
    }
}

static BOOL ov12_0224DD18(BattleContext *ctx, ControllerCommand commandNext, ControllerCommand command) {
    if (ctx->battleStatus2 & BATTLE_STATUS2_EXP_GAIN) {
        int flag = 1 << BATTLE_STATUS2_EXP_GAIN_SHIFT;

        while (!(ctx->battleStatus2 & flag)) {
            flag <<= 1;
        }

        ctx->battleStatus2 &= flag ^ 0xFFFFFFFF;
        ctx->battlerIdFainted = LowestFlagNo(flag >> BATTLE_STATUS2_EXP_GAIN_SHIFT);
        ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_GRANT_EXP);
        ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
        ctx->commandNext = commandNext;
        return TRUE;
    } else {
        ctx->command = command;
        return FALSE;
    }
}

static void ov12_0224DD74(BattleSystem *bsys, BattleContext *ctx) {
    int flag;
    int moveType;
    u8 item;

    if (GetBattlerAbility(ctx, ctx->battlerIdAttacker) == ABILITY_NORMALIZE) {
        moveType = TYPE_NORMAL;
    } else if (ctx->moveType != 0) {
        moveType = ctx->moveType;
    } else {
        moveType = ctx->trainerAIData.moveData[ctx->moveNoCur].type;
    }

    flag = ctx->trainerAIData.moveData[ctx->moveNoTemp].unkB;

    if (flag & 0x10 && !(ctx->battleStatus & BATTLE_STATUS_NO_MOVE_SET) && ctx->battlerIdTarget != BATTLER_NONE && ctx->battleStatus2 & BATTLE_STATUS2_DISPLAY_ATTACK_MESSAGE) {
        ctx->moveNoCopied[ctx->battlerIdTarget] = ctx->moveNoTemp;
        ctx->moveNoCopiedHit[ctx->battlerIdTarget][ctx->battlerIdAttacker] = ctx->moveNoTemp;
    }

    if (ctx->battlerIdTarget != BATTLER_NONE) {
        item = GetBattlerHeldItemEffect(ctx, ctx->battlerIdTarget);
        if (ctx->battleStatus & BATTLE_STATUS_CHARGE_TURN || ctx->battleStatus2 & BATTLE_STATUS2_DISPLAY_ATTACK_MESSAGE) {
            if (item != HOLD_EFFECT_CHOICE_ATK && item != HOLD_EFFECT_CHOICE_SPEED && item != HOLD_EFFECT_CHOICE_SPATK) {
                ctx->battleMons[ctx->battlerIdTarget].unk88.moveNoChoice = 0;
            }
        }

        if (!(ctx->battleStatus & BATTLE_STATUS_NO_MOVE_SET)) {
            if (ctx->battleStatus2 & BATTLE_STATUS2_DISPLAY_ATTACK_MESSAGE) {
                ctx->moveNoHit[ctx->battlerIdTarget] = ctx->moveNoCur;
                ctx->moveNoHitBattler[ctx->battlerIdTarget] = ctx->battlerIdAttacker;
                ctx->moveNoHitType[ctx->battlerIdTarget] = moveType;
                ctx->moveNoPrev = ctx->moveNoTemp;
            } else {
                ctx->moveNoHit[ctx->battlerIdTarget] = 0;
                ctx->moveNoHitBattler[ctx->battlerIdTarget] = BATTLER_NONE;
                ctx->moveNoHitType[ctx->battlerIdTarget] = 0;
                ctx->moveNoPrev = 0;
            }

            if (ctx->battleStatus2 & BATTLE_STATUS2_MOVE_SUCCEEDED && !(ctx->moveStatusFlag & MOVE_STATUS_FAIL)) {
                switch (ctx->trainerAIData.moveData[ctx->moveNoCur].range) {
                case RANGE_USER:
                case RANGE_USER_SIDE:
                case RANGE_FIELD:
                case RANGE_OPPONENT_SIDE:
                case RANGE_ALLY:
                case RANGE_SINGLE_TARGET_USER_SIDE:
                    ctx->conversion2Move[ctx->battlerIdTarget] = 0;
                    ctx->conversion2BattlerId[ctx->battlerIdTarget] = BATTLER_NONE;
                    ctx->conversion2Type[ctx->battlerIdTarget] = 0;
                    break;
                default:
                    ctx->conversion2Move[ctx->battlerIdTarget] = ctx->moveNoCur;
                    ctx->conversion2BattlerId[ctx->battlerIdTarget] = ctx->battlerIdAttacker;
                    ctx->conversion2Type[ctx->battlerIdTarget] = moveType;
                    break;
                }
            } else {
                ctx->conversion2Move[ctx->battlerIdTarget] = 0;
                ctx->conversion2BattlerId[ctx->battlerIdTarget] = BATTLER_NONE;
                ctx->conversion2Type[ctx->battlerIdTarget] = 0;
            }
        }
    }
}

static BOOL ov12_0224DF7C(BattleSystem *bsys, BattleContext *ctx) {
    ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_CRITICAL_HIT);
    ctx->commandNext = ctx->command;
    ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;

    return TRUE;
}

static BOOL ov12_0224DF98(BattleSystem *bsys, BattleContext *ctx) {
    BOOL ret = FALSE;

    if (ctx->moveStatusFlag) {
        if (ctx->multiHitCountTemp != 0) {
            if (ctx->battlerIdFainted != BATTLER_NONE || ctx->multiHitCount == 1 || ctx->moveStatusFlag & MOVE_STATUS_MULTI_HIT_DISRUPTED) {
                ret = TRUE;
            }
        } else {
            ret = TRUE;
        }
    }

    if (ret == TRUE) {
        ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_MOVE_FOLLOWUP_MESSAGE);
        ctx->commandNext = ctx->command;
        ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
    }
    return ret;
}

static BOOL TryBuildRage(BattleSystem *bsys, BattleContext *ctx) {
    BOOL ret = FALSE;

    if (ctx->battlerIdTarget == BATTLER_NONE) {
        return ret;
    }

    if ((ctx->battleMons[ctx->battlerIdTarget].status2 & STATUS2_RAGE)
        && !(ctx->moveStatusFlag & MOVE_STATUS_MULTI_HIT_DISRUPTED)
        && ctx->battlerIdTarget != ctx->battlerIdAttacker
        && ctx->battleMons[ctx->battlerIdTarget].hp != 0
        && (ctx->selfTurnData[ctx->battlerIdTarget].physicalDamage != 0 || ctx->selfTurnData[ctx->battlerIdTarget].specialDamage != 0)
        && ctx->battleMons[ctx->battlerIdTarget].statChanges[STAT_ATK] < 12) {
        ctx->battleMons[ctx->battlerIdTarget].statChanges[STAT_ATK]++;
        ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_RAGE_IS_BUILDING);
        ctx->commandNext = ctx->command;
        ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
        ret = TRUE;
    }

    return ret;
}

static BOOL TryItemFlinch(BattleSystem *bsys, BattleContext *ctx) {
    BOOL ret = FALSE;
    int item = GetBattlerHeldItemEffect(ctx, ctx->battlerIdAttacker);
    int itemMod = GetHeldItemModifier(ctx, ctx->battlerIdAttacker, 0);

    if (ctx->battlerIdTarget != BATTLER_NONE
        && item == HOLD_EFFECT_FLINCH_CHANCE
        && !(ctx->moveStatusFlag & MOVE_STATUS_FAIL)
        && (ctx->selfTurnData[ctx->battlerIdTarget].physicalDamage != 0 || ctx->selfTurnData[ctx->battlerIdTarget].specialDamage != 0)
        && (BattleSystem_Random(bsys) % 100) < itemMod
        && ctx->trainerAIData.moveData[ctx->moveNoCur].unkB & (1 << 5)
        && ctx->battleMons[ctx->battlerIdTarget].hp != 0) {
        ctx->battlerIdStatChange = ctx->battlerIdTarget;
        ctx->statChangeType = 2;
        ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_FLINCH_MON);
        ctx->commandNext = ctx->command;
        ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
        ret = TRUE;
    }

    return ret;
}

static BOOL ov12_0224E130(BattleSystem *bsys, BattleContext *ctx) {
    BOOL ret = FALSE;
    while (ctx->unk_5C < BattleSystem_GetMaxBattlers(bsys)) {
        if (!(ctx->battleMons[ctx->unk_5C].moveEffectFlags & MOVE_EFFECT_FLAG_HIDE_SUBSTITUTE) && ctx->battleMons[ctx->unk_5C].moveEffectFlagsTemp & MOVE_EFFECT_FLAG_HIDE_SUBSTITUTE) {
            ctx->battleMons[ctx->unk_5C].moveEffectFlagsTemp &= ~MOVE_EFFECT_FLAG_HIDE_SUBSTITUTE;
            ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_VANISH_OFF);
            ctx->battlerIdTemp = ctx->unk_5C;
            ctx->commandNext = ctx->command;
            ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
            ret = TRUE;
        }
        ctx->unk_5C++;
        if (ret == TRUE) {
            break;
        }
    }
    if (ret == FALSE) {
        ctx->unk_5C = 0;
    }
    return ret;
}

static BOOL ov12_0224E1BC(BattleSystem *bsys, BattleContext *ctx) {
    int flag = 0;

    int maxBattlers = BattleSystem_GetMaxBattlers(bsys);
    int item = GetBattlerHeldItemEffect(ctx, ctx->battlerIdAttacker);
    int itemMod = GetHeldItemModifier(ctx, ctx->battlerIdAttacker, 0);

    if (TryFaintMon(ctx, ctx->command, ctx->command, 1) == TRUE) {
        return TRUE;
    }

    do {
        switch (ctx->unk_30) {
        case 0:
            if (ctx->battleMons[ctx->battlerIdAttacker].status2 & STATUS2_RAGE && ctx->moveNoCur != MOVE_RAGE) {
                ctx->battleMons[ctx->battlerIdAttacker].status2 &= ~STATUS2_RAGE;
            }
            ctx->unk_30++;
            break;
        case 1:
            if (ctx->battlerIdTarget != BATTLER_NONE
                && item == HOLD_EFFECT_HP_RESTORE_ON_DMG
                && !(ctx->battleStatus2 & BATTLE_STATUS2_UTURN)
                && ctx->battleStatus & BATTLE_STATUS_MOVE_SUCCESSFUL
                && ctx->selfTurnData[ctx->battlerIdAttacker].shellBellDamage != 0
                && ctx->battlerIdAttacker != ctx->battlerIdTarget
                && ctx->battleMons[ctx->battlerIdAttacker].hp < ctx->battleMons[ctx->battlerIdAttacker].maxHp
                && ctx->battleMons[ctx->battlerIdAttacker].hp != 0) {

                ctx->hpCalc = DamageDivide(ctx->selfTurnData[ctx->battlerIdAttacker].shellBellDamage * -1, itemMod);
                ctx->battlerIdTemp = ctx->battlerIdAttacker;
                ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_RESTORE_A_LITTLE_HP);
                ctx->commandNext = ctx->command;
                ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
                flag = 1;
            }
            ctx->unk_30++;
            break;
        case 2:
            if (item == HOLD_EFFECT_HP_DRAIN_ON_ATK
                && GetBattlerAbility(ctx, ctx->battlerIdAttacker) != ABILITY_MAGIC_GUARD
                && !(ctx->battleStatus2 & BATTLE_STATUS2_UTURN)
                && ctx->battleStatus & BATTLE_STATUS_MOVE_SUCCESSFUL
                && ctx->trainerAIData.moveData[ctx->moveNoCur].category != CATEGORY_STATUS
                && ctx->battleMons[ctx->battlerIdAttacker].hp != 0) {

                ctx->hpCalc = DamageDivide(ctx->battleMons[ctx->battlerIdAttacker].maxHp * -1, 10);
                ctx->battlerIdTemp = ctx->battlerIdAttacker;
                ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, BATTLE_SUBSCRIPT_LOSE_HP_FROM_ITEM);
                ctx->commandNext = ctx->command;
                ctx->command = CONTROLLER_COMMAND_RUN_SCRIPT;
                flag = 1;
            }
            ctx->unk_30++;
            break;
        case 3:
            ctx->unk_30 = 0;
            ctx->unk_34 = 0;
            flag = 2;
            break;
        }
    } while (flag == 0);

    return flag == 1;
}

extern u32 ov10_02220AAC[];

static void ov12_0224E384(BattleSystem *bsys, BattleContext *ctx) {
    int i;
    int battler;
    u32 battleType = BattleSystem_GetBattleType(bsys);
    u16 item;

    MIi_CpuClear32(0, (u32 *)&ctx->trainerAIData, sizeof(TrainerAIData));

    if ((battleType & BATTLE_TYPE_TRAINER) && !(battleType & (BATTLE_TYPE_NO_EXP | BATTLE_TYPE_AI))) {
        for (battler = 0; battler < 4; battler++) {
            if (battler & 1) {
                for (i = 0; i < 4; i++) {
                    item = BattleSystem_GetTrainerItem(bsys, battler, i);
                    if (item != 0) {
                        ctx->trainerAIData.unk68[battler >> 1][ctx->trainerAIData.unk99[battler >> 1]] = item;
                        ctx->trainerAIData.unk99[battler >> 1]++;
                    }
                }
            }
        }
    }

    ctx->unk_2134 = ov10_02220AAC;
}

static void ov12_0224E414(BattleSystem *bsys, BattleContext *ctx) {
    int battler;
    int maxBattlers = BattleSystem_GetMaxBattlers(bsys);
    u32 data;

    for (battler = 0; battler < maxBattlers; battler++) {
        if (ctx->playerActions[battler].command != CONTROLLER_COMMAND_40) {
            if (ctx->unk_314C[battler] & 1) {
                data = ctx->playerActions[battler].command - CONTROLLER_COMMAND_FIGHT_INPUT + BATTLE_INPUT_FIGHT;
                ov12_0223BDDC(bsys, battler, data);
            }

            switch (ctx->playerActions[battler].command) {
            case CONTROLLER_COMMAND_FIGHT_INPUT:
                if (ctx->unk_314C[battler] & (1 << 1)) {
                    data = ctx->playerActions[battler].unk8;
                    ov12_0223BDDC(bsys, battler, data);
                }

                if (ctx->unk_314C[battler] & (1 << 2)) {
                    data = ctx->playerActions[battler].unk4 + 1;
                    ov12_0223BDDC(bsys, battler, data);
                }
                break;
            case CONTROLLER_COMMAND_ITEM_INPUT:
                data = ctx->playerActions[battler].unk8 & 0xFF;
                ov12_0223BDDC(bsys, battler, data);
                data = (ctx->playerActions[battler].unk8 & 0xFF00) >> 16;
                ov12_0223BDDC(bsys, battler, data);
                break;
            case CONTROLLER_COMMAND_POKEMON_INPUT:
                data = ctx->playerActions[battler].unk8 + 1;
                ov12_0223BDDC(bsys, battler, data);
                break;
            case CONTROLLER_COMMAND_RUN_INPUT:
                ov12_0223BDDC(bsys, battler, TRUE);
                break;
            default:
                break;
            }
        }
    }
}
