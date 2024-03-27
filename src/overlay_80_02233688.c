#include "global.h"
#include "battle/battle_setup.h"
#include "frontier/overlay_80_02233688.h"
#include "frontier/overlay_80_022340E8.h"
#include "frontier/overlay_80_02238034.h"
#include "frontier/frontier.h"
#include "launch_application_data.h"

BOOL FrtCmd_ArcadeAlloc(FrontierContext *ctx) {
    u32 spC = FrontierScript_ReadVar(ctx);
    u32 r4 = FrontierScript_ReadVar(ctx);
    u32 sp10 = FrontierScript_ReadVar(ctx);
    u32 r6 = FrontierScript_ReadVar(ctx);
    u32 r7 = FrontierScript_ReadVar(ctx);
    u32 sp14 = FrontierScript_ReadVarPtr(ctx);

    FrontierLaunchParam *unk = Frontier_GetLaunchParam(ctx->unk0->unk0);

    Frontier_SetData(ctx->unk0->unk0, BattleArcadeData_Alloc(unk->saveData, spC, r4, sp10, r6, r7, sp14));

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

extern OVY_MGR_TEMPLATE ov80_0223BE78;
extern void ov80_02233A1C(void);

BOOL ov80_0223371C(FrontierContext *ctx) {
    FrontierLaunchParam *unk0 = Frontier_GetLaunchParam(ctx->unk0->unk0);
    void *unk1 = Frontier_GetData(ctx->unk0->unk0);
    GAME_BOARD_ARGS *args = AllocFromHeap(HEAP_ID_FIELD, sizeof(GAME_BOARD_ARGS));
    MI_CpuFill8(args, 0, sizeof(GAME_BOARD_ARGS));
    args->saveData = unk0->saveData;
    GameBoardArgs_Set(args, unk1);
    Frontier_LaunchApplication(ctx->unk0->unk0, &ov80_0223BE78, args, 0, ov80_02233A1C);

    return TRUE;
}

BOOL ov80_02233770(FrontierContext *ctx) {
    u8 monCnt;
    Pokemon *mon;
    int i, index1, index2, partyCnt, data;
    
    ArcadeScriptData *unkPtr = Frontier_GetData(ctx->unk0->unk0);
    BattleSetup *setup = unkPtr->battleSetup;
    
    unkPtr->unk1D = BattleArcade_GetWonBattlePoints(unkPtr, setup->party[0], unkPtr->battleSetup->party[2], setup->unk1B4);

    unkPtr->unk28 = IsBattleResultWin(setup->winFlag);

    if (unkPtr->unk13 == 0x1b) {
        index1 = 1;
        index2 = 3;
    } else {
        index1 = 0;
        index2 = 2;
    }

    ov80_02235364(setup->party[index1], unkPtr->party, 0, 0);
    ov80_02235364(setup->party[index1], unkPtr->party, 1, 1);
    
    if (ov80_02237D8C(unkPtr->unk10) == 0) {
        ov80_02235364(setup->party[index1], unkPtr->party, 2, 2);
    } else {
        ov80_02235364(setup->party[index2], unkPtr->party, 0, 2);
        ov80_02235364(setup->party[index2], unkPtr->party, 1, 3);
    }

    if (unkPtr->unk13 == 0x11) {
        monCnt = BattleArcade_GetMonCount(unkPtr->unk10, 1);
        for (i = 0; i < monCnt; i++) {
            mon = Party_GetMonByIndex(unkPtr->party, i);
            u32 level = GetMonData(mon, MON_DATA_LEVEL, 0);
            u32 species = GetMonData(mon, MON_DATA_SPECIES, 0);
            u32 exp = GetMonExpBySpeciesAndLevel(species, level - 3);
            SetMonData(mon, MON_DATA_EXPERIENCE, &exp);
            CalcMonLevelAndStats(mon);
        }
    }
    
    partyCnt = Party_GetCount(unkPtr->party);
    for (i = 0; i < partyCnt; i++) {
        mon = Party_GetMonByIndex(unkPtr->party, i);
        data = unkPtr->unk94[i];
        SetMonData(mon, MON_DATA_MAXHP, &data);
        SetMonData(mon, MON_DATA_HP, &data);
        data = unkPtr->unkA4[i];
        SetMonData(mon, MON_DATA_ATK, &data);
        data = unkPtr->unkB4[i];
        SetMonData(mon, MON_DATA_DEF, &data);
        data = unkPtr->unkC4[i];
        SetMonData(mon, MON_DATA_SPEED, &data);
        data = unkPtr->unkD4[i];
        SetMonData(mon, MON_DATA_SPATK, &data);
        data = unkPtr->unkE4[i];
        SetMonData(mon, MON_DATA_SPDEF, &data);
    }
    
    BattleSetup_Delete(setup);
    
    return FALSE;
}

BOOL FrtCmd_ArcadeStartBattle(FrontierContext *ctx) {
    FrontierLaunchParam *unkPtr = Frontier_GetLaunchParam(ctx->unk0->unk0);
    ArcadeScriptData *arg0 = Frontier_GetData(ctx->unk0->unk0);
    BattleSetup *setup = BattleArcade_NewBattleSetup(arg0, unkPtr);

    arg0->battleSetup = setup;
    
    Frontier_LaunchApplication(ctx->unk0->unk0, &gOverlayTemplate_Battle, setup, 0, NULL);

    return TRUE;
}

