#include "global.h"
#include "battle/battle_setup.h"
#include "frontier/overlay_80_02233688.h"
#include "frontier/overlay_80_022340E8.h"
#include "frontier/overlay_80_02238034.h"
#include "frontier/frontier.h"
#include "launch_application_data.h"

static void GameBoardArgs_Set(GAME_BOARD_ARGS *args, ArcadeContext *data);
static void ov80_02233A1C(void *data);

BOOL FrtCmd_ArcadeAlloc(FrontierContext *ctx) {
    u32 spC = FrontierScript_ReadVar(ctx);
    u32 r4 = FrontierScript_ReadVar(ctx);
    u32 sp10 = FrontierScript_ReadVar(ctx);
    u32 r6 = FrontierScript_ReadVar(ctx);
    u32 r7 = FrontierScript_ReadVar(ctx);
    u32 sp14 = FrontierScript_ReadVarPtr(ctx);

    FrontierLaunchParam *param = Frontier_GetLaunchParam(ctx->unk0->unk0);

    Frontier_SetData(ctx->unk0->unk0, BattleArcadeData_Alloc(param->saveData, spC, r4, sp10, r6, r7, sp14));

    return FALSE;
}

BOOL FrtCmd_ArcadeInit(FrontierContext  *ctx) {
    u32 arg1 = FrontierScript_ReadVar(ctx);
    void *arg0 = Frontier_GetData(ctx->unk0->unk0);
    BattleArcadeData_Init(arg0, arg1);
    return FALSE;
}

BOOL FrtCmd_ArcadeFree(FrontierContext *ctx) {
    BattleArcadeData_Free(Frontier_GetData(ctx->unk0->unk0));
    return FALSE;
}

extern OVY_MGR_TEMPLATE gOverlayTemplate_BattleArcadeGameBoard;

BOOL ov80_0223371C(FrontierContext *ctx) {
    FrontierLaunchParam *param = Frontier_GetLaunchParam(ctx->unk0->unk0);
    ArcadeContext *data = Frontier_GetData(ctx->unk0->unk0);
    GAME_BOARD_ARGS *args = AllocFromHeap(HEAP_ID_FIELD, sizeof(GAME_BOARD_ARGS));
    MI_CpuFill8(args, 0, sizeof(GAME_BOARD_ARGS));
    args->saveData = param->saveData;
    GameBoardArgs_Set(args, data);
    Frontier_LaunchApplication(ctx->unk0->unk0, &gOverlayTemplate_BattleArcadeGameBoard, args, 0, ov80_02233A1C);

    return TRUE;
}

BOOL ov80_02233770(FrontierContext *ctx) {
    u8 monCnt;
    Pokemon *mon;
    int i, index1, index2, partyCnt, data;
    
    ArcadeContext *arcadeData = Frontier_GetData(ctx->unk0->unk0);
    BattleSetup *setup = arcadeData->battleSetup;
    
    arcadeData->bpGain = BattleArcade_GetWonBattlePoints(arcadeData, setup->party[0], arcadeData->battleSetup->party[2], setup->unk1B4);

    arcadeData->isBattleWin = IsBattleResultWin(setup->winFlag);

    if (arcadeData->unk13 == 0x1b) {
        index1 = 1;
        index2 = 3;
    } else {
        index1 = 0;
        index2 = 2;
    }

    ov80_02235364(setup->party[index1], arcadeData->playerParty, 0, 0);
    ov80_02235364(setup->party[index1], arcadeData->playerParty, 1, 1);
    
    if (ov80_02237D8C(arcadeData->unk10) == 0) {
        ov80_02235364(setup->party[index1], arcadeData->playerParty, 2, 2);
    } else {
        ov80_02235364(setup->party[index2], arcadeData->playerParty, 0, 2);
        ov80_02235364(setup->party[index2], arcadeData->playerParty, 1, 3);
    }

    if (arcadeData->unk13 == 0x11) {
        monCnt = BattleArcade_GetMonCount(arcadeData->unk10, 1);
        for (i = 0; i < monCnt; i++) {
            mon = Party_GetMonByIndex(arcadeData->playerParty, i);
            u32 level = GetMonData(mon, MON_DATA_LEVEL, 0);
            u32 species = GetMonData(mon, MON_DATA_SPECIES, 0);
            u32 exp = GetMonExpBySpeciesAndLevel(species, level - 3);
            SetMonData(mon, MON_DATA_EXPERIENCE, &exp);
            CalcMonLevelAndStats(mon);
        }
    }
    
    partyCnt = Party_GetCount(arcadeData->playerParty);
    for (i = 0; i < partyCnt; i++) {
        mon = Party_GetMonByIndex(arcadeData->playerParty, i);
        data = arcadeData->savedHp[i];
        SetMonData(mon, MON_DATA_MAXHP, &data);
        SetMonData(mon, MON_DATA_HP, &data);
        data = arcadeData->savedAtk[i];
        SetMonData(mon, MON_DATA_ATK, &data);
        data = arcadeData->savedDef[i];
        SetMonData(mon, MON_DATA_DEF, &data);
        data = arcadeData->savedSpd[i];
        SetMonData(mon, MON_DATA_SPEED, &data);
        data = arcadeData->savedSpAtk[i];
        SetMonData(mon, MON_DATA_SPATK, &data);
        data = arcadeData->savedSpDef[i];
        SetMonData(mon, MON_DATA_SPDEF, &data);
    }
    
    BattleSetup_Delete(setup);
    
    return FALSE;
}

BOOL FrtCmd_ArcadeStartBattle(FrontierContext *ctx) {
    FrontierLaunchParam *param = Frontier_GetLaunchParam(ctx->unk0->unk0);
    ArcadeContext *arcadeData = Frontier_GetData(ctx->unk0->unk0);
    BattleSetup *setup = BattleArcade_NewBattleSetup(arcadeData, param);

    arcadeData->battleSetup = setup;
    
    Frontier_LaunchApplication(ctx->unk0->unk0, &gOverlayTemplate_Battle, setup, 0, NULL);

    return TRUE;
}

static void GameBoardArgs_Set(GAME_BOARD_ARGS *args, ArcadeContext *data) {
    args->type = data->unk10;
    args->unk1E = ov80_02238498(data);
    
    args->unk14 = &data->unk20;
    args->unk10 = &data->unk13;
    args->bpGain = data->bpGain;
    
    args->winstreak = data->winstreak;
    args->multiWinstreak = data->multiWinstreak;

    args->cursorSpeed = &data->cursorSpeed;
    args->playerParty = data->playerParty;
    args->opponentParty = data->opponentParty;
    args->work = data;

    data->weather = 0;
    args->weather = &data->weather;
    args->randomFlag = data->randomFlag;
    data->randomFlag = 0;
    data->unk1F = 0;

    int partyCnt = Party_GetCount(data->playerParty);

    for (int i = 0; i < partyCnt; i++) {
        Pokemon *mon = Party_GetMonByIndex(data->playerParty, i);

        data->savedHp[i] = GetMonData(mon, MON_DATA_MAXHP, NULL);
        data->savedAtk[i] = GetMonData(mon, MON_DATA_ATK, NULL);
        data->savedDef[i] = GetMonData(mon, MON_DATA_DEF, NULL);
        data->savedSpd[i] = GetMonData(mon, MON_DATA_SPEED, NULL);
        data->savedSpAtk[i] = GetMonData(mon, MON_DATA_SPATK, NULL);
        data->savedSpDef[i] = GetMonData(mon, MON_DATA_SPDEF, NULL);
    }
}

static void ov80_02233A1C(void *data) {
    GAME_BOARD_ARGS *args = data;
    ov80_02234550(args->work, args);
    FreeToHeap(args);
}

BOOL FrtCmd_ArcadeSetPartyBeforeBattle(FrontierContext *ctx) {
    ArcadeContext *arcadeCtx = Frontier_GetData(ctx->unk0->unk0);
    BattleArcade_SetPartyBeforeBattle(arcadeCtx);
    return FALSE;
}
