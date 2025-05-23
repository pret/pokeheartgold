#include "scrcmd_9.h"

#include "global.h"

#include "assert.h"
#include "error_handling.h"
#include "field_system.h"
#include "fieldmap.h"
#include "filesystem.h"
#include "frontier_data.h"
#include "game_stats.h"
#include "heap.h"
#include "launch_application.h"
#include "math_util.h"
#include "message_format.h"
#include "msgdata.h"
#include "party.h"
#include "player_avatar.h"
#include "player_data.h"
#include "pm_string.h"
#include "pokedex.h"
#include "pokemon.h"
#include "save_local_field_data.h"
#include "save_vars_flags.h"
#include "scrcmd.h"
#include "script.h"
#include "sys_flags.h"
#include "sys_vars.h"
#include "unk_0202D230.h"
#include "unk_02030A98.h"
#include "unk_02035900.h"
#include "unk_020379A0.h"
#include "unk_0204A3F4.h"
#include "unk_0204B538.h"
#include "unk_02066EDC.h"
#include "unk_02096910.h"

static BOOL sub_0204A1E8(ScriptContext *ctx);
static u32 sub_0204A2A8(UnkStruct_Fsys_A0 *unkStruct, u8 a1);

static const u16 _020FBF70[] = { 141, 145, 142, 143, 144 };

BOOL ScrCmd_410(ScriptContext *ctx) {
    u16 unk4 = ScriptReadHalfword(ctx);
    u16 unk6 = ScriptReadHalfword(ctx);
    ctx->fieldSystem->unkA0 = sub_0204A824(FieldSystem_GetSaveData(ctx->fieldSystem), unk4, unk6);
    return FALSE;
}

BOOL ScrCmd_409(ScriptContext *ctx) {
    sub_0204A810(&(ctx->fieldSystem->unkA0));
    return FALSE;
}

BOOL ScrCmd_411(ScriptContext *ctx) {
    sub_0204AA2C(ctx->fieldSystem->unkA0);
    ctx->fieldSystem->unkA0 = NULL;
    return FALSE;
}

BOOL ScrCmd_412(ScriptContext *ctx) {
    void **unk;
    u16 id = ScriptReadHalfword(ctx);
    u16 arg = ScriptGetVar(ctx);
    u16 resultVarId = ScriptReadHalfword(ctx);
    u16 *result = GetVarPointer(ctx->fieldSystem, resultVarId);
    UnkStruct_Fsys_A0 *unkStruct = ctx->fieldSystem->unkA0;
    switch (id) {
    case 1:
        if (arg == 0) {
            *result = sub_0204A5B0(unkStruct->unk0e, ctx->fieldSystem->saveData, TRUE);
        } else {
            *result = sub_0204A5B0(arg, ctx->fieldSystem->saveData, TRUE);
        }
        break;
    case 2:
        sub_0204A68C();
        break;
    case 3:
        sub_0204A698(sub_0202D908(ctx->fieldSystem->saveData));
        break;
    case 4:
        *result = sub_0204A6A0(sub_0202D908(ctx->fieldSystem->saveData));
        break;
    case 5:
        sub_0204A6A8(ctx->fieldSystem);
        break;
    case 6:
        sub_0204A6E8(ctx->fieldSystem);
        break;
    case 8: // unused
        *result = sub_0204A6F8(ctx->fieldSystem->saveData, arg);
        break;
    case 9:
        *result = sub_0204B120(NULL, ctx->fieldSystem->saveData, 2);
        break;
    case 10:
        *result = sub_0204B120(NULL, ctx->fieldSystem->saveData, 0);
        break;
    case 11:
        sub_0204A730(ctx->fieldSystem->saveData, arg);
        break;
    case 12:
        *result = sub_0204A750(ctx->fieldSystem->saveData);
        break;
    case 14:
        *result = sub_0204A764(ctx->fieldSystem->saveData);
        break;
    case 15:
        *result = sub_0204A800(ctx->fieldSystem->saveData);
        break;
    case 16:
        sub_02067200(ctx->taskman, arg, resultVarId, *result);
        return TRUE;
    case 30:
        unk = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_RUNNING_APP_DATA);
        sub_0204AA58(unkStruct, ctx->taskman, unk);
        return TRUE;
    case 31:
        unk = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_RUNNING_APP_DATA);
        *result = sub_0204AA78(unkStruct, unk, ctx->fieldSystem->saveData);
        break;
    case 32:
        *result = sub_0204AB10(unkStruct, ctx->fieldSystem->saveData);
        break;
    case 35:
        *result = sub_0204AC7C(unkStruct);
        break;
    case 37: // unused
        sub_0204AD04(unkStruct, ctx->fieldSystem->saveData);
        break;
    case 38: // unused
        sub_0204AE20(unkStruct, ctx->fieldSystem->saveData);
        break;
    case 39:
        sub_0204AF2C(unkStruct);
        break;
    case 56:
        sub_0204AFE0(unkStruct);
        break;
    case 41: // unused
        *result = sub_0204B044(unkStruct, arg);
        break;
    case 43:
        *result = sub_0204B05C(unkStruct);
        break;
    case 45:
        *result = sub_0204B060(unkStruct);
        break;
    case 47: // unused
        sub_0204B0E0(unkStruct, ctx->fieldSystem->saveData);
        break;
    case 48:
        *result = sub_0204B1CC(unkStruct, ctx->fieldSystem->saveData);
        break;
    case 49:
        *result = sub_0204B204(unkStruct, ctx->fieldSystem->saveData);
        break;
    case 50:
        unkStruct->unk10_5 = arg;
        break;
    case 51:
        *result = unkStruct->unk10_5;
        break;
    case 52:
        sub_0204ABC8(unkStruct, ctx->fieldSystem->saveData);
        break;
    case 53:
        *result = unkStruct->unk2a[arg];
        break;
    case 54:
        *result = sub_0204B120(unkStruct, ctx->fieldSystem->saveData, 1);
        break;
    case 55:
        *result = sub_0204A2A8(unkStruct, arg);
        break;
    case 57:
        *result = sub_0204B258(unkStruct, ctx->fieldSystem->saveData);
        break;
    case 100:
        if (unkStruct == NULL) {
            *result = TRUE;
        } else {
            *result = FALSE;
        }
        break;
    case 58:
        MI_CpuClear8(unkStruct->unk884, sizeof(unkStruct->unk884));
        break;
    default:
        GF_ASSERT(FALSE);
        *result = 0;
        break;
    }
    return FALSE;
}

BOOL ScrCmd_413(ScriptContext *ctx) {
    UnkStruct_Fsys_A0 *unkStruct = ctx->fieldSystem->unkA0;
    u16 unk6 = ScriptGetVar(ctx);
    u16 unk7 = ScriptGetVar(ctx);
    u16 *speciesPtr = ScriptGetVarPointer(ctx);
    u16 *movePtr = ScriptGetVarPointer(ctx);
    *speciesPtr = unkStruct->unk298[unk6].unk30[unk7].species;
    *movePtr = unkStruct->unk298[unk6].unk30[unk7].moves[0];
    return FALSE;
}

BOOL ScrCmd_414(ScriptContext *ctx) {
    u16 *unk = ScriptGetVarPointer(ctx);
    *unk = sub_020672D8(ctx->fieldSystem->saveData);
    return FALSE;
}

BOOL ScrCmd_415(ScriptContext *ctx) {
    u16 *unk = ScriptGetVarPointer(ctx);
    *unk = sub_02067398(ctx->fieldSystem->saveData);
    return FALSE;
}

BOOL ScrCmd_416(ScriptContext *ctx) {
    u16 unk7 = ScriptGetVar(ctx);
    u16 unk4 = ScriptGetVar(ctx);
    u16 *unkPtr = ScriptGetVarPointer(ctx);
    UnkStruct_Fsys_A0 *unkStruct = ctx->fieldSystem->unkA0;
    *unkPtr = FALSE;
    u32 unk0;
    switch (unk7) {
    case 0:
        unk0 = 62;
        sub_0204B6AC(ctx->fieldSystem->unkA0, ctx->fieldSystem->saveData);
        break;
    case 1:
        unk0 = 63;
        sub_0204B708(ctx->fieldSystem->unkA0);
        break;
    case 2:
        unk0 = 64;
        sub_0204B720(ctx->fieldSystem->unkA0, unk4);
        break;
    }
    if (sub_0205C298(ctx->fieldSystem->saveData) == 1) {
        if (sub_02037C0C(sub_0203769C(), unkStruct->unk83e) == 1) {
            *unkPtr = TRUE;
        } else {
            return TRUE;
        }
    } else {
        sub_02096910((void *)unkStruct);
        if (sub_02037030(unk0, unkStruct->unk83e, sizeof(unkStruct->unk83e)) == 1) {
            *unkPtr = TRUE;
        }
    }
    return FALSE;
}

BOOL ScrCmd_417(ScriptContext *ctx) {
    UnkStruct_Fsys_A0 *unkStruct = ctx->fieldSystem->unkA0;
    u16 unk6 = ScriptGetVar(ctx);
    u16 unk7 = ScriptReadHalfword(ctx);
    if (sub_0205C298(ctx->fieldSystem->saveData) == 1) {
        sub_020672A4(ctx->fieldSystem->taskman, unk6, unk7);
    } else {
        unkStruct->unk8DA = unk7;
        unkStruct->unk8D5 = unk6;
        SetupNativeScript(ctx, sub_0204A1E8);
    }
    return TRUE;
}

static BOOL sub_0204A1E8(ScriptContext *ctx) {
    UnkStruct_Fsys_A0 *unkStruct = ctx->fieldSystem->unkA0;
    u16 *unkPtr = GetVarPointer(ctx->fieldSystem, unkStruct->unk8DA);
    u32 unk = unkStruct->unk8D5 == 1 ? 1 : 2;
    if (unkStruct->unk8D4 == unk) {
        unkStruct->unk8D4 = 0;
        *unkPtr = unkStruct->unk8D8;
        return TRUE;
    } else {
        return FALSE;
    }
}

BOOL ScrCmd_418(ScriptContext *ctx) {
    u16 *unk4 = ScriptGetVarPointer(ctx);
    u16 *unk6 = ScriptGetVarPointer(ctx);
    u8 unk[2];
    sub_0202D8D0(sub_0202D928(ctx->fieldSystem->saveData), unk);
    *unk4 = unk[0];
    *unk6 = unk[1];
    return FALSE;
}

BOOL ScrCmd_419(ScriptContext *ctx) {
    u16 *unk = ScriptGetVarPointer(ctx);
    *unk = sub_0202D7B8(sub_0202D928(ctx->fieldSystem->saveData));
    return FALSE;
}

static u32 sub_0204A2A8(UnkStruct_Fsys_A0 *unkStruct, u8 a1) {
    if (a1 == 2) {
        return unkStruct->unk10_5;
    } else if (a1 == 1) {
        if (unkStruct->unk0f == 2) {
            return _020FBF70[unkStruct->unk10_5];
        }
        return unkStruct->unk12 ? 97 : 0;
    } else {
        return unkStruct->unk11 ? 97 : 0;
    }
}

BOOL ScrCmd_554(ScriptContext *ctx) {
    SaveData *saveData = ctx->fieldSystem->saveData;
    u16 *unk = ScriptGetVarPointer(ctx);
    *unk = FrontierData_BattlePointAction(Save_FrontierData_Get(saveData), 0, 0);
    return FALSE;
}

BOOL ScrCmd_555(ScriptContext *ctx) {
    SaveData *saveData = ctx->fieldSystem->saveData;
    u16 unk = ScriptGetVar(ctx);
    GameStats_Add(Save_GameStats_Get(ctx->fieldSystem->saveData), GAME_STAT_BATTLE_POINTS, unk);
    FrontierData_BattlePointAction(Save_FrontierData_Get(saveData), unk, 5);
    return FALSE;
}

BOOL ScrCmd_556(ScriptContext *ctx) {
    SaveData *saveData = ctx->fieldSystem->saveData;
    u16 unk = ScriptGetVar(ctx);
    GameStats_Add(Save_GameStats_Get(ctx->fieldSystem->saveData), GAME_STAT_UNK70, unk);
    FrontierData_BattlePointAction(Save_FrontierData_Get(saveData), unk, 6);
    return FALSE;
}

BOOL ScrCmd_CheckBattlePoints(ScriptContext *ctx) {
    SaveData *saveData = ctx->fieldSystem->saveData;
    u16 unk = ScriptGetVar(ctx);
    u16 *unkPtr = ScriptGetVarPointer(ctx);
    if (FrontierData_BattlePointAction(Save_FrontierData_Get(saveData), 0, 0) < unk) {
        *unkPtr = FALSE;
    } else {
        *unkPtr = TRUE;
    }
    return FALSE;
}
