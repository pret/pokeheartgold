#include "frontier/frontier_cmd_arcade.h"

#include "global.h"

#include "battle/battle_setup.h"
#include "frontier/frontier.h"
#include "frontier/overlay_80_02229EE0.h"
#include "frontier/overlay_80_0222AB40.h"
#include "frontier/overlay_80_022340E8.h"
#include "frontier/overlay_80_02238034.h"
#include "frontier/overlay_80_02239960.h"
#include "library/spl_emitter.h"

#include "launch_application.h"
#include "overlay_42.h"
#include "unk_02014DA0.h"
#include "unk_02034354.h"
#include "unk_02096910.h"

static void GameBoardArgs_Set(GAME_BOARD_ARGS *args, ArcadeContext *data);
static void ov80_02233A1C(void *data);
static void ov80_02233F1C(FrontierContext *ctx, ArcadeContext *arcadeCtx, u32 a2);
static void ov80_02233F40(SPLEmitter *emitter);
static BOOL ov80_02234028(FrontierContext *ctx);

BOOL FrtCmd_ArcadeAlloc(FrontierContext *ctx) {
    u32 spC = FrontierScript_ReadVar(ctx);
    u32 r4 = FrontierScript_ReadVar(ctx);
    u32 sp10 = FrontierScript_ReadVar(ctx);
    u32 r6 = FrontierScript_ReadVar(ctx);
    u32 r7 = FrontierScript_ReadVar(ctx);
    u16 *sp14 = FrontierScript_ReadVarPtr(ctx);

    FrontierLaunchParam *param = Frontier_GetLaunchParam(ctx->frontierSystem->unk0);
    Frontier_SetData(ctx->frontierSystem->unk0, BattleArcadeData_Alloc(param->saveData, spC, r4, sp10, r6, r7, sp14));

    return FALSE;
}

BOOL FrtCmd_ArcadeInit(FrontierContext *ctx) {
    u32 arg1 = FrontierScript_ReadVar(ctx);
    void *arg0 = Frontier_GetData(ctx->frontierSystem->unk0);
    BattleArcadeData_Init(arg0, arg1);
    return FALSE;
}

BOOL FrtCmd_ArcadeFree(FrontierContext *ctx) {
    BattleArcadeData_Free(Frontier_GetData(ctx->frontierSystem->unk0));
    return FALSE;
}

extern OverlayManagerTemplate gOverlayTemplate_BattleArcadeGameBoard;

BOOL FrtCmd_LaunchGameBoard(FrontierContext *ctx) {
    FrontierLaunchParam *param = Frontier_GetLaunchParam(ctx->frontierSystem->unk0);
    ArcadeContext *data = Frontier_GetData(ctx->frontierSystem->unk0);
    GAME_BOARD_ARGS *args = AllocFromHeap(HEAP_ID_FIELD, sizeof(GAME_BOARD_ARGS));
    MI_CpuFill8(args, 0, sizeof(GAME_BOARD_ARGS));
    args->saveData = param->saveData;
    GameBoardArgs_Set(args, data);
    Frontier_LaunchApplication(ctx->frontierSystem->unk0, &gOverlayTemplate_BattleArcadeGameBoard, args, 0, ov80_02233A1C);

    return TRUE;
}

BOOL FrtCmd_187(FrontierContext *ctx) {
    u8 monCnt;
    Pokemon *mon;
    int i, index1, index2, partyCnt, data;

    ArcadeContext *arcadeData = Frontier_GetData(ctx->frontierSystem->unk0);
    BattleSetup *setup = arcadeData->battleSetup;

    arcadeData->bpGain = BattleArcade_GetWonBattlePoints(arcadeData, setup->party[0], arcadeData->battleSetup->party[2], setup->unk1B4);

    arcadeData->battleWon = IsBattleResultWin(setup->winFlag);

    if (arcadeData->unk13 == 0x1b) {
        index1 = 1;
        index2 = 3;
    } else {
        index1 = 0;
        index2 = 2;
    }

    ov80_02235364(setup->party[index1], arcadeData->playerParty, 0, 0);
    ov80_02235364(setup->party[index1], arcadeData->playerParty, 1, 1);

    if (ov80_02237D8C(arcadeData->type) == 0) {
        ov80_02235364(setup->party[index1], arcadeData->playerParty, 2, 2);
    } else {
        ov80_02235364(setup->party[index2], arcadeData->playerParty, 0, 2);
        ov80_02235364(setup->party[index2], arcadeData->playerParty, 1, 3);
    }

    if (arcadeData->unk13 == 0x11) {
        monCnt = BattleArcade_GetMonCount(arcadeData->type, 1);
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
    FrontierLaunchParam *param = Frontier_GetLaunchParam(ctx->frontierSystem->unk0);
    ArcadeContext *arcadeData = Frontier_GetData(ctx->frontierSystem->unk0);
    BattleSetup *setup = BattleArcade_NewBattleSetup(arcadeData, param);

    arcadeData->battleSetup = setup;

    Frontier_LaunchApplication(ctx->frontierSystem->unk0, &gOverlayTemplate_Battle, setup, 0, NULL);

    return TRUE;
}

static void GameBoardArgs_Set(GAME_BOARD_ARGS *args, ArcadeContext *data) {
    args->type = data->type;
    args->unk1E = ov80_02238498(data);

    args->unk14 = &data->unk20;
    args->unk10 = &data->unk13;
    args->bpGain = data->bpGain;

    args->winStreak = data->winStreak;
    args->multiWinStreak = data->multiWinStreak;

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
    Heap_Free(args);
}

BOOL FrtCmd_ArcadeSetPartyBeforeBattle(FrontierContext *ctx) {
    ArcadeContext *arcadeCtx = Frontier_GetData(ctx->frontierSystem->unk0);
    BattleArcade_SetPartyBeforeBattle(arcadeCtx);
    return FALSE;
}

BOOL FrtCmd_ArcadeSetPartyAfterBattle(FrontierContext *ctx) {
    ArcadeContext *arcadeCtx = Frontier_GetData(ctx->frontierSystem->unk0);
    BattleArcade_SetPartyAfterBattle(arcadeCtx);
    return FALSE;
}

BOOL FrtCmd_ArcadeAction(FrontierContext *ctx) {
    Pokemon *mon;
    Party *party;
    int i;
    PlayerProfile *profile;

    u32 action = FrontierScript_ReadShort(ctx);
    u8 var0 = FrontierScript_ReadVar(ctx);
    u8 var1 = FrontierScript_ReadVar(ctx);
    u16 *out = FrontierScript_ReadVarPtr(ctx);
    ArcadeContext *arcadeCtx = Frontier_GetData(ctx->frontierSystem->unk0);
    FrontierLaunchParam *param = Frontier_GetLaunchParam(ctx->frontierSystem->unk0);
    FrontierMap *frontierMap = FrontierSystem_GetFrontierMap(ctx->frontierSystem);

    switch (action) {
    case 2:
        arcadeCtx->type = var0;
        break;
    case 3:
        *out = arcadeCtx->unk418[var0];
        break;
    case 4:
        *out = arcadeCtx->winStreak;
        break;
    case 5:
        if (arcadeCtx->winStreak < 9999) {
            arcadeCtx->winStreak++;
        }
        break;
    case 7:
        OS_ResetSystem(0);
        break;
    case 9:
        *out = sub_02030E98(arcadeCtx->unk8);
        break;
    case 10:
        ov80_02234588(arcadeCtx, 2);
        break;
    case 12:
        *out = ov80_02238430(arcadeCtx, arcadeCtx->unk13);
        break;
    case 14:
        *out = ov80_02234764(arcadeCtx);
        break;
    case 15:
        if (var0 == 0) {
            mon = Party_GetMonByIndex(arcadeCtx->playerParty, 0);
        } else {
            mon = Party_GetMonByIndex(arcadeCtx->opponentParty, 0);
        }
        *out = GetMonData(mon, MON_DATA_HELD_ITEM, NULL);
        break;
    case 16:
        *out = arcadeCtx->unk13;
        break;
    case 18:
        party = SaveArray_Party_Get(param->saveData);
        for (i = 0; i < 3; i++) {
            mon = Party_GetMonByIndex(party, arcadeCtx->unk2C[i]);
            SetMonData(mon, MON_DATA_HELD_ITEM, &arcadeCtx->unk412[i]);
        }
        break;
    case 19:
        *out = ov80_02238498(arcadeCtx);
        break;
    case 20:
        *out = ov80_02234774(arcadeCtx, var0);
        break;
    case 21:
        ov80_022347B8(arcadeCtx);
        break;
    case 22:
        ov80_022347C4(arcadeCtx);
        break;
    case 23:
        *out = ov80_02234770(arcadeCtx);
        break;
    case 24:
        *out = arcadeCtx->unkA74;
        break;
    case 25:
        if (arcadeCtx->unk13 == 0x1b) {
            VecFx32 playerMatrix;
            VecFx32 opponentMatrix;
            u8 playerMonCnt = BattleArcade_GetMonCount(arcadeCtx->type, 1);
            u8 opponentMonCnt = BattleArcade_GetOpponentMonCount(arcadeCtx->type, 1);

            for (i = 0; i < playerMonCnt; i++) {
                Sprite *playerSprite = arcadeCtx->unk30[i]->sprite;
                playerMatrix = *(Sprite_GetMatrixPtr(playerSprite));

                Sprite *opponentSprite = arcadeCtx->unk40[i]->sprite;
                opponentMatrix = *(Sprite_GetMatrixPtr(opponentSprite));

                Sprite_SetMatrix(playerSprite, &opponentMatrix);
                Sprite_SetMatrix(opponentSprite, &playerMatrix);

                playerSprite = arcadeCtx->unk50[i]->sprite;
                playerMatrix = *(Sprite_GetMatrixPtr(playerSprite));

                opponentSprite = arcadeCtx->unk60[i]->sprite;
                opponentMatrix = *(Sprite_GetMatrixPtr(opponentSprite));

                Sprite_SetMatrix(playerSprite, &opponentMatrix);
                Sprite_SetMatrix(opponentSprite, &playerMatrix);
            }
        }
        break;
    case 6:
        sub_02096910(arcadeCtx);
        break;
    case 28:
        *out = BattleArcade_MultiplayerCheck(arcadeCtx->type);
        break;
    case 17:
        *out = arcadeCtx->type;
        break;
    case 29:
        ov80_0222F210(frontierMap);
        break;
    case 30:
        ov80_0222F278(frontierMap);
        break;
    case 31:
        ov80_02234A74(arcadeCtx, frontierMap, var0);

        u8 playerMonCnt = BattleArcade_GetMonCount(arcadeCtx->type, 1);
        u8 opponentMonCnt = BattleArcade_GetOpponentMonCount(arcadeCtx->type, 1);

        if (var0 == 0) {
            for (i = 0; i < playerMonCnt; i++) {
                Sprite_SetPriority(arcadeCtx->unk30[i]->sprite, 2);
            }
        } else {
            for (i = 0; i < opponentMonCnt; i++) {
                Sprite_SetPriority(arcadeCtx->unk40[i]->sprite, 2);
            }
        }
        break;
    case 32:
        ov80_02234B24(arcadeCtx, frontierMap, var0);
        break;
    case 33:
        ov80_0222F33C(frontierMap);
        break;
    case 34:
        ov80_0222F3CC(frontierMap);
        break;
    case 35:
        ov80_02234BEC(arcadeCtx, frontierMap, var0);
        break;
    case 36:
        ov80_02234CB0(arcadeCtx, frontierMap, var0);
        break;
    case 11:
        ov80_02234968(arcadeCtx, frontierMap);
        break;
    case 37:
        if (BattleArcade_MultiplayerCheck(arcadeCtx->type) == TRUE) {
            ov80_02234A38(arcadeCtx, frontierMap);
        }
        break;
    case 38:
        if (ov80_022384BC(arcadeCtx->unk13) == 0) {
            BufferFrontierOpponentName(ctx->frontierSystem->unk44, var0, arcadeCtx->unk74[ov80_022347A8(arcadeCtx, var1)]);
        } else {
            if (BattleArcade_MultiplayerCheck(arcadeCtx->type) == FALSE) {
                profile = Save_PlayerData_GetProfile(param->saveData);
            } else {
                profile = sub_02034818(var1);
            }
            BufferPlayersName(ctx->frontierSystem->unk44, var0, profile);
        }
        break;
    case 39:
        arcadeCtx->unkA7A = var1;
        ov80_02233F1C(ctx, arcadeCtx, var0);
        break;
    case 40:
        ov80_0222A474(&arcadeCtx->unkF4[0], arcadeCtx->unk74[arcadeCtx->unk11], 0xb, 0xcc);
        ov80_0222A474(&arcadeCtx->unkF4[1], arcadeCtx->unk74[arcadeCtx->unk11 + 7], 0xb, 0xcc);
        break;
    case 41:
        ov80_02234B7C(arcadeCtx, frontierMap, var0, var1);
        break;
    case 42:
        ov80_02234BB4(arcadeCtx, frontierMap, var0, var1);
        break;
    case 43:
        ov80_02234DC4(var0, var1);
        break;
    case 44:
        if (var0 == 0) {
            PaletteData_BlendPalette(frontierMap->paletteData, PLTTBUF_MAIN_OBJ, 0, 0x100, var0, RGB_BLACK);
        } else {
            UnkStruct_02239938 *unkStruct = ov80_02239938(ctx->frontierSystem->unk0, var1);
            u32 palNo = ov42_02229248(unkStruct->unk4);
            PaletteData_BlendPalette(frontierMap->paletteData, PLTTBUF_MAIN_OBJ, palNo * 0x10, 0x10, var0, RGB_BLACK);
        }
        break;
    case 45:
        *out = ov80_02235324(arcadeCtx);
        break;
    case 46:
        GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG2, GF_PLANE_TOGGLE_OFF);
        break;
    case 47:
        *out = arcadeCtx->unk1F;
        break;
    case 48:
        *out = 0;

        if (arcadeCtx->type == 0) {
            if (arcadeCtx->winStreak + 1 == 21) {
                *out = 1;
            } else if (arcadeCtx->winStreak + 1 == 49) {
                *out = 2;
            }
        }
        break;
    case 49:
        ov80_0222A52C(arcadeCtx->unk330, arcadeCtx->unk314, arcadeCtx->unk31C, arcadeCtx->unk320, NULL, 4, 0xb, 0xcd);
        break;
    case 50:
        ov80_022383C0(arcadeCtx);
        break;
    case 51:
        *out = arcadeCtx->unk1E;
        arcadeCtx->unk1E = 1;
        break;
    case 52:
        arcadeCtx->unkA7C = 0;
        break;
    }

    return FALSE;
}

static void ov80_02233F1C(FrontierContext *ctx, ArcadeContext *arcadeCtx, u32 a2) {
    FrontierMap *map = FrontierSystem_GetFrontierMap(ctx->frontierSystem);
    sub_02015494(ov80_02239A60(map->unk10, 0), a2, ov80_02233F40, arcadeCtx);
}

extern const VecFx32 ov80_0223BE6C; //{-1, 0, 0}
static void ov80_02233F40(SPLEmitter *emitter) {
    VecFx16 axis;
    ArcadeContext *ctx = sub_02015504();
    const VecFx32 pos = ov80_0223BE6C;

    if (ctx->unkA7A == 1) {
        sub_02015538(emitter, &axis);
        axis.x *= -1;
        SPL_SetEmitterAxis(emitter, &axis);
        SPL_SetEmitterPosition(emitter, &pos);
    }
}

BOOL FrtCmd_ArcadeGetBattleResult(FrontierContext *ctx) {
    u16 *var = FrontierScript_ReadVarPtr(ctx);

    ArcadeContext *arcadeCtx = Frontier_GetData(ctx->frontierSystem->unk0);
    *var = arcadeCtx->battleWon;

    return FALSE;
}

BOOL FrtCmd_ArcadeSendBuffer(FrontierContext *ctx) {
    u32 unk0 = FrontierScript_ReadVar(ctx);
    u32 unk1 = FrontierScript_ReadVar(ctx);
    u16 *ret = FrontierScript_ReadVarPtr(ctx);

    ArcadeContext *arcadeContxt = Frontier_GetData(ctx->frontierSystem->unk0);
    *ret = ov80_02234E50(arcadeContxt, unk0, unk1);

    return TRUE;
}

BOOL FrtCmd_ArcadeReceiveBuffer(FrontierContext *ctx) {
    ctx->unk78[0] = FrontierScript_ReadU16(ctx);
    ov80_0222AB84(ctx, ov80_02234028);
    return TRUE;
}

static BOOL ov80_02234028(FrontierContext *ctx) {
    ov80_0222BE9C(ctx, ctx->unk78[0]);
    ArcadeContext *arcadeCtx = Frontier_GetData(ctx->frontierSystem->unk0);

    if (arcadeCtx->unkA7C >= 2) {
        arcadeCtx->unkA7C = 0;
        return TRUE;
    }

    return FALSE;
}

BOOL FrtCmd_ArcadePrintMsg(FrontierContext *ctx) {
    FrontierLaunchParam *param = Frontier_GetLaunchParam(ctx->frontierSystem->unk0);
    u8 index = FrontierScript_ReadShort(ctx);
    ArcadeContext *arcadeCtx = Frontier_GetData(ctx->frontierSystem->unk0);

    if (arcadeCtx == NULL) {
        return FALSE;
    }

    u16 *msg = arcadeCtx->unkF4[index].unk18;
    ov80_0222F44C(ctx, msg);

    return TRUE;
}

BOOL FrtCmd_ArcadeSetEvent(FrontierContext *ctx) {
    ArcadeContext *arcadeCtx = Frontier_GetData(ctx->frontierSystem->unk0);
    ov80_02234E98(arcadeCtx, arcadeCtx->unk13);
    return TRUE;
}

BOOL FrtCmd_198(FrontierContext *ctx) {
    FrontierMap *map = FrontierSystem_GetFrontierMap(ctx->frontierSystem);
    u32 var0 = FrontierScript_ReadVar(ctx);
    u32 var1 = FrontierScript_ReadVar(ctx);
    u32 var2 = FrontierScript_ReadVar(ctx);
    ArcadeContext *arcadeCtx = Frontier_GetData(ctx->frontierSystem->unk0);
    ov80_02234D04(arcadeCtx, map, var0, var1, var2);
    return FALSE;
}
