#include "battle_controller_player.h"
#include "battle_controller.h"
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
    ctx->command = CONTROLLER_COMMAND_22;
    ctx->commandNext = CONTROLLER_COMMAND_TRAINER_MESSAGE;
}

//static
void BattleControllerPlayer_TrainerMessage(BattleSystem *bsys, BATTLECONTEXT *ctx) {
    if (CheckTrainerMessage(bsys, ctx)) {
        ReadBattleScriptFromNarc(ctx, NARC_a_0_0_1, 41);
        ctx->command = CONTROLLER_COMMAND_22;
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
        ctx->command = CONTROLLER_COMMAND_22;
    } else {
        SortMonsBySpeed(bsys, ctx);
        ov12_0223C0C4(bsys);
        ctx->command = CONTROLLER_COMMAND_SELECTION_SCREEN_INIT;
    }
}
