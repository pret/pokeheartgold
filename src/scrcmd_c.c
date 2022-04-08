#include "scrcmd.h"
#include "window.h"
#include "overlay_01.h"
#include "overlay_26.h"
#include "overlay_03.h"
#include "system.h"
#include "task.h"
#include "text.h"
#include "unk_0200E398.h"
#include "unk_02035900.h"
#include "unk_0205A44C.h"
#include "unk_020658D4.h"
#include "render_text.h"
#include "field_player_avatar.h"
#include "unk_02062108.h"
#include "field_map_object.h"
#include "field_follow_poke.h"
#include "map_events.h"
#include "unk_0205FD20.h"
#include "unk_02054648.h"
#include "unk_0205B6E8.h"
#include "unk_0203E348.h"
#include "unk_02055418.h"
#include "unk_020932A4.h"
#include "unk_02092BE8.h"
#include "unk_02097024.h"
#include "unk_020552A4.h"
#include "unk_02078834.h"
#include "unk_020961D8.h"
#include "unk_02055244.h"
#include "fashion_case.h"
#include "save_flypoints.h"
#include "unk_0206B910.h"
#include "pokegear.h"
#include "unk_02068FC8.h"
#include "unk_0205298C.h"
#include "save_arrays.h"
#include "unk_02037C94.h"
#include "choose_starter.h"
#include "unk_0206D494.h"
#include "unk_0200FA24.h"
#include "field_warp_tasks.h"
#include "unk_02054E00.h"
#include "roamer.h"
#include "unk_02097F6C.h"
#include "sys_flags.h"
#include "sys_vars.h"
#include "unk_02050660.h"
#include "pokedex.h"

FS_EXTERN_OVERLAY(OVY_26);

BOOL sub_020416E4(SCRIPTCONTEXT *ctx);
BOOL sub_02042C78(SCRIPTCONTEXT *ctx);
BOOL ScrNative_WaitApplication(SCRIPTCONTEXT *ctx);
LocalMapObject *sub_02041C70(FieldSystem *fsys, u16 person);
void _ScheduleObjectEventMovement(FieldSystem *fsys, EventObjectMovementMan *mvtMan, MovementScriptCommand *a2);
BOOL Script_SetMonSeenFlagBySpecies(FieldSystem *fsys, u16 species);

// TODO: NELEMS(gScriptCmdTable);
const u32 sNumScriptCmds = 853;

// TODO: static
const WINDOWTEMPLATE _020FAC94 = {
    .bgId = 3,
    .left = 25,
    .top = 13,
    .width = 6,
    .height = 4,
    .palette = 13,
    .baseBlock = 0x021F,
};

static const u8 sConditionTable[6][3] = {
    //<  =  >
    { 1, 0, 0 }, // lt
    { 0, 1, 0 }, // eq
    { 0, 0, 1 }, // gt
    { 1, 1, 0 }, // le
    { 0, 1, 1 }, // ge
    { 1, 0, 1 }, // ne
};

extern u8 _021D415C;

BOOL ScrCmd_Nop(SCRIPTCONTEXT* ctx) {
#pragma unused(ctx)
    return FALSE;
}

BOOL ScrCmd_Dummy(SCRIPTCONTEXT* ctx) {
#pragma unused(ctx)
    return FALSE;
}

BOOL ScrCmd_End(SCRIPTCONTEXT* ctx) {
    StopScript(ctx);
    return FALSE;
}

static BOOL RunPauseTimer(SCRIPTCONTEXT* ctx);

BOOL ScrCmd_Wait(SCRIPTCONTEXT* ctx) {
    FieldSystem* fsys = ctx->fsys;
    u16 frames_to_wait = ScriptReadHalfword(ctx);
    u16 ptr_offset = ScriptReadHalfword(ctx);
    u16* ret_ptr = GetVarPointer(fsys, ptr_offset);
    *ret_ptr = frames_to_wait;

    ctx->data[0] = ptr_offset;
    SetupNativeScript(ctx, RunPauseTimer);

    return TRUE;
}

static BOOL RunPauseTimer(SCRIPTCONTEXT* ctx) {
    u16* frames_to_wait = GetVarPointer(ctx->fsys, ctx->data[0]);
    (*frames_to_wait)--;

    return (*frames_to_wait == 0);
}

BOOL ScrCmd_DebugWatch(SCRIPTCONTEXT* ctx) {
    u16 unused_var = ScriptGetVar(ctx);
    return FALSE;
}

BOOL ScrCmd_LoadByte(SCRIPTCONTEXT* ctx) {
    u8 reg = ScriptReadByte(ctx);
    u8 value = ScriptReadByte(ctx);

    ctx->data[reg] = value;

    return FALSE;
}

BOOL ScrCmd_LoadWord(SCRIPTCONTEXT* ctx) {
    u8 reg = ScriptReadByte(ctx);
    u32 value = ScriptReadWord(ctx);

    ctx->data[reg] = value;

    return FALSE;
}

BOOL ScrCmd_LoadByteFromAddr(SCRIPTCONTEXT* ctx) {
    u8 reg = ScriptReadByte(ctx);
    u8* address = (u8*)ScriptReadWord(ctx);

    ctx->data[reg] = *address;

    return FALSE;
}

BOOL ScrCmd_WriteByteToAddr(SCRIPTCONTEXT* ctx) {
    u8* address = (u8*)ScriptReadWord(ctx);
    *address = ScriptReadByte(ctx);

    return FALSE;
}

BOOL ScrCmd_SetPtrByte(SCRIPTCONTEXT* ctx) {
    u8* address = (u8*)ScriptReadWord(ctx);
    u8 reg = ScriptReadByte(ctx);

    *address = ctx->data[reg];

    return FALSE;
}

BOOL ScrCmd_CopyLocal(SCRIPTCONTEXT* ctx) {
    u8 dest_reg = ScriptReadByte(ctx);
    u8 src_reg = ScriptReadByte(ctx);

    ctx->data[dest_reg] = ctx->data[src_reg];

    return FALSE;
}

BOOL ScrCmd_CopyByte(SCRIPTCONTEXT* ctx) {
    u8* dest_address = (u8*)ScriptReadWord(ctx);
    u8* src_address = (u8*)ScriptReadWord(ctx);

    *dest_address = *src_address;

    return FALSE;
}

/*static*/ u8 Compare(u32 a, u32 b) {
    if (a < b) {
        return SCRIPT_COMPARISON_RESULT_LESS;
    } else if (a == b) {
        return SCRIPT_COMPARISON_RESULT_EQUAL;
    } else {
        return SCRIPT_COMPARISON_RESULT_GREATER;
    }
}

BOOL ScrCmd_CompareLocalToLocal(SCRIPTCONTEXT* ctx) {
    u8 a = ctx->data[ScriptReadByte(ctx)];
    u8 b = ctx->data[ScriptReadByte(ctx)];

    ctx->comparison_result = Compare(a, b);

    return FALSE;
}

BOOL ScrCmd_CompareLocalToValue(SCRIPTCONTEXT* ctx) {
    u8 a = ctx->data[ScriptReadByte(ctx)];
    u8 b = ScriptReadByte(ctx);

    ctx->comparison_result = Compare(a, b);

    return FALSE;
}

BOOL ScrCmd_CompareLocalToAddr(SCRIPTCONTEXT* ctx) {
    u8 a = ctx->data[ScriptReadByte(ctx)];
    u8 b = *(u8*)ScriptReadWord(ctx);

    ctx->comparison_result = Compare(a, b);

    return FALSE;
}

BOOL ScrCmd_CompareAddrToLocal(SCRIPTCONTEXT* ctx) {
    u8 a = *(u8*)ScriptReadWord(ctx);
    u8 b = ctx->data[ScriptReadByte(ctx)];

    ctx->comparison_result = Compare(a, b);

    return FALSE;
}

BOOL ScrCmd_CompareAddrToValue(SCRIPTCONTEXT* ctx) {
    u8 a = *(u8*)ScriptReadWord(ctx);
    u8 b = ScriptReadByte(ctx);

    ctx->comparison_result = Compare(a, b);

    return FALSE;
}

BOOL ScrCmd_CompareAddrToAddr(SCRIPTCONTEXT* ctx) {
    u8 a = *(u8*)ScriptReadWord(ctx);
    u8 b = *(u8*)ScriptReadWord(ctx);

    ctx->comparison_result = Compare(a, b);

    return FALSE;
}

BOOL ScrCmd_CompareVarToValue(SCRIPTCONTEXT* ctx) {
    u16 a = *ScriptGetVarPointer(ctx);
    u16 b = ScriptReadHalfword(ctx);

    ctx->comparison_result = Compare(a, b);

    return FALSE;
}

BOOL ScrCmd_CompareVarToVar(SCRIPTCONTEXT* ctx) {
    u16* a_ptr = ScriptGetVarPointer(ctx);
    u16* b_ptr = ScriptGetVarPointer(ctx);

    ctx->comparison_result = Compare(*a_ptr, *b_ptr);

    return FALSE;
}

BOOL ScrCmd_RunScript(SCRIPTCONTEXT* ctx) {
    FieldSystem* fsys = ctx->fsys;
    u8* num_active_script_contexts = FieldSysGetAttrAddr(fsys, SCRIPTENV_NUM_ACTIVE_SCRCTX);
    SCRIPTCONTEXT** new_context_ptr = FieldSysGetAttrAddr(fsys, SCRIPTENV_SCRCTX_1);

    u16 script_to_run = ScriptReadHalfword(ctx);
    *new_context_ptr = CreateScriptContext(fsys, script_to_run);
    (*num_active_script_contexts)++;

    return TRUE;
}

static BOOL ScrNative_WaitStd(SCRIPTCONTEXT* ctx);

BOOL ScrCmd_CallStd(SCRIPTCONTEXT* ctx) {
    FieldSystem* fsys = ctx->fsys;
    u8* unk = FieldSysGetAttrAddr(fsys, SCRIPTENV_07);
    u8* num_active_script_contexts = FieldSysGetAttrAddr(fsys, SCRIPTENV_NUM_ACTIVE_SCRCTX);
    SCRIPTCONTEXT** new_context_ptr = (SCRIPTCONTEXT**)FieldSysGetAttrAddr(fsys, SCRIPTENV_SCRCTX_0 + *num_active_script_contexts);

    u16 script_to_run = ScriptReadHalfword(ctx);
    SCRIPTCONTEXT* new_context = CreateScriptContext(fsys, script_to_run);
    *new_context_ptr = new_context;

    new_context->id = *num_active_script_contexts;
    (*num_active_script_contexts)++;

    *unk |= (1 << ctx->id);

    SetupNativeScript(ctx, ScrNative_WaitStd);
    return TRUE;
}

static BOOL ScrNative_WaitStd(SCRIPTCONTEXT* ctx) {
    FieldSystem* fsys = ctx->fsys;
    u8* unk = FieldSysGetAttrAddr(fsys, SCRIPTENV_07);
    u8* unused = FieldSysGetAttrAddr(fsys, SCRIPTENV_NUM_ACTIVE_SCRCTX);

    return (*unk & (1 << ctx->id)) == 0;
}

BOOL ScrCmd_RestartCurrentScript(SCRIPTCONTEXT* ctx) {
    FieldSystem* fsys = ctx->fsys;
    u8* unk = FieldSysGetAttrAddr(fsys, SCRIPTENV_07);
    u8* unused = FieldSysGetAttrAddr(fsys, SCRIPTENV_NUM_ACTIVE_SCRCTX);

    *unk ^= (1 << (ctx->id - 1));
    return FALSE;
}

BOOL ScrCmd_GoTo(SCRIPTCONTEXT* ctx) {
    u32 offset_in_script = ScriptReadWord(ctx);
    ScriptJump(ctx, ctx->script_ptr + offset_in_script);

    return FALSE;
}

BOOL ScrCmd_ObjectGoTo(SCRIPTCONTEXT* ctx) {
    LocalMapObject** lmo = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_LAST_TALKED);
    u8 id = ScriptReadByte(ctx);

    u32 offset_in_script = ScriptReadWord(ctx);
    if (id == MapObject_GetID(*lmo)) {
        ScriptJump(ctx, ctx->script_ptr + offset_in_script);
    }

    return FALSE;
}

BOOL ScrCmd_BgGoTo(SCRIPTCONTEXT* ctx) {
    u32 bg = sub_02050658(ctx->taskman);
    u8 required_bg = ScriptReadByte(ctx);

    u32 offset_in_script = ScriptReadWord(ctx);
    if (bg == required_bg) {
        ScriptJump(ctx, ctx->script_ptr + offset_in_script);
    }

    return FALSE;
}

BOOL ScrCmd_DirectionGoTo(SCRIPTCONTEXT* ctx) {
    u32* direction = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_FACING_DIRECTION);
    u8 required_direction = ScriptReadByte(ctx);

    u32 offset_in_script = ScriptReadWord(ctx);
    if (*direction == required_direction) {
        ScriptJump(ctx, ctx->script_ptr + offset_in_script);
    }

    return FALSE;
}

BOOL ScrCmd_Call(SCRIPTCONTEXT* ctx) {
    u32 offset_in_script = ScriptReadWord(ctx);
    ScriptCall(ctx, ctx->script_ptr + offset_in_script);

    return FALSE;
}

BOOL ScrCmd_Return(SCRIPTCONTEXT* ctx) {
    ScriptReturn(ctx);
    return FALSE;
}

BOOL ScrCmd_GoToIf(SCRIPTCONTEXT* ctx) {
    u8 condition = ScriptReadByte(ctx);
    u32 offset_in_script = ScriptReadWord(ctx);

    if (sConditionTable[condition][ctx->comparison_result] == 1) {
        ScriptJump(ctx, ctx->script_ptr + offset_in_script);
    }

    return FALSE;
}

BOOL ScrCmd_CallIf(SCRIPTCONTEXT* ctx) {
    u8 condition = ScriptReadByte(ctx);
    u32 offset_in_script = ScriptReadWord(ctx);

    if (sConditionTable[condition][ctx->comparison_result] == 1) {
        ScriptCall(ctx, ctx->script_ptr + offset_in_script);
    }

    return FALSE;
}

BOOL ScrCmd_SetFlag(SCRIPTCONTEXT* ctx) {
    FieldSystem* fsys = ctx->fsys;
    u16 flag_to_set = ScriptReadHalfword(ctx);

    FlagSet(fsys, flag_to_set);

    return FALSE;
}

BOOL ScrCmd_ClearFlag(SCRIPTCONTEXT* ctx) {
    FieldSystem* fsys = ctx->fsys;
    u16 flag_to_clear = ScriptReadHalfword(ctx);

    FlagClear(fsys, flag_to_clear);

    return FALSE;
}

BOOL ScrCmd_CheckFlag(SCRIPTCONTEXT* ctx) {
    FieldSystem* fsys = ctx->fsys;
    u16 flag_to_check = ScriptReadHalfword(ctx);

    ctx->comparison_result = FlagGet(fsys, flag_to_check);

    return FALSE;
}

BOOL ScrCmd_CheckFlagVar(SCRIPTCONTEXT* ctx) {
    FieldSystem* fsys = ctx->fsys;
    u16* flag_in_var_to_check = ScriptGetVarPointer(ctx);
    u16* ret_ptr = ScriptGetVarPointer(ctx);

    *ret_ptr = FlagGet(fsys, *flag_in_var_to_check);

    return FALSE;
}

BOOL ScrCmd_SetFlagVar(SCRIPTCONTEXT* ctx) {
    FieldSystem* fsys = ctx->fsys;
    u16* flag_in_var_to_set = ScriptGetVarPointer(ctx);

    FlagSet(fsys, *flag_in_var_to_set);

    return FALSE;
}

BOOL ScrCmd_ClearFlagVar(SCRIPTCONTEXT* ctx) {
    FieldSystem* fsys = ctx->fsys;
    u16* flag_in_var_to_clear = ScriptGetVarPointer(ctx);

    FlagClear(fsys, *flag_in_var_to_clear);

    return FALSE;
}

BOOL ScrCmd_SetTrainerFlag(SCRIPTCONTEXT* ctx) {
    u16 flag_to_set = ScriptGetVar(ctx);

    TrainerFlagSet(ctx->fsys->savedata, flag_to_set);

    return FALSE;
}

BOOL ScrCmd_ClearTrainerFlag(SCRIPTCONTEXT* ctx) {
    u16 flag_to_clear = ScriptGetVar(ctx);

    TrainerFlagClear(ctx->fsys->savedata, flag_to_clear);

    return FALSE;
}

BOOL ScrCmd_CheckTrainerFlag(SCRIPTCONTEXT* ctx) {
    FieldSystem* fsys = ctx->fsys;
    u16 flag_to_check = ScriptGetVar(ctx);

    ctx->comparison_result = TrainerFlagCheck(fsys->savedata, flag_to_check);

    return FALSE;
}

BOOL ScrCmd_AddVar(SCRIPTCONTEXT* ctx) {
    u16* dest_var = ScriptGetVarPointer(ctx);
    u16 addend = ScriptGetVar(ctx);

    *dest_var += addend;

    return FALSE;
}

BOOL ScrCmd_SubVar(SCRIPTCONTEXT* ctx) {
    u16* dest_var = ScriptGetVarPointer(ctx);
    u16 subtrahend = ScriptGetVar(ctx);

    *dest_var -= subtrahend;

    return FALSE;
}

BOOL ScrCmd_SetVar(SCRIPTCONTEXT* ctx) {
    u16* dest_var = ScriptGetVarPointer(ctx);
    u16 value = ScriptReadHalfword(ctx);

    *dest_var = value;

    return FALSE;
}

BOOL ScrCmd_CopyVar(SCRIPTCONTEXT* ctx) {
    u16* dest_var = ScriptGetVarPointer(ctx);
    u16* src_var = ScriptGetVarPointer(ctx);

    *dest_var = *src_var;

    return FALSE;
}

BOOL ScrCmd_SetOrCopyVar(SCRIPTCONTEXT* ctx) {
    u16* dest_var = ScriptGetVarPointer(ctx);
    u16 src_var = ScriptGetVar(ctx);

    *dest_var = src_var;

    return FALSE;
}

BOOL ScrCmd_048(SCRIPTCONTEXT* ctx) {
    u8 msg_no = ScriptReadByte(ctx);

    if (!sub_02037474()) {
        ov01_021EF4DC(ctx, ctx->msg_data, msg_no, TRUE, NULL);
    } else {
        struct UnkStruct_Ov01_021EF4C4 unk_struct;
        ov01_021EF4C4(&unk_struct, ctx);
        unk_struct.textFrameDelay = 1;
        unk_struct.unk1 = 1;
        ov01_021EF4DC(ctx, ctx->msg_data, msg_no, FALSE, &unk_struct);
    }

    SetupNativeScript(ctx, ov01_021EF348);
    return TRUE;
}

static BOOL sub_02041000(SCRIPTCONTEXT* ctx);

BOOL ScrCmd_WaitButton(SCRIPTCONTEXT* ctx) {
    SetupNativeScript(ctx, sub_02041000);
    return TRUE;
}

static BOOL sub_02041000(SCRIPTCONTEXT* ctx) {
    return (gSystem.newKeys & (PAD_BUTTON_A | PAD_BUTTON_B)) != 0;
}

static BOOL sub_02041040(SCRIPTCONTEXT* ctx);

BOOL ScrCmd_WaitButtonOrDelay(SCRIPTCONTEXT* ctx) {
    ctx->data[0] = ScriptGetVar(ctx);
    SetupNativeScript(ctx, sub_02041040);
    return TRUE;
}

static BOOL sub_02041040(SCRIPTCONTEXT* ctx) {
    if ((gSystem.newKeys & (PAD_BUTTON_A | PAD_BUTTON_B)) != 0) {
        return TRUE;
    }

    return --ctx->data[0] == 0;
}

static BOOL sub_02041074(SCRIPTCONTEXT* ctx);

BOOL ScrCmd_WaitButtonOrWalkAway(SCRIPTCONTEXT* ctx) {
    SetupNativeScript(ctx, sub_02041074);
    return TRUE;
}

static BOOL sub_02041074(SCRIPTCONTEXT* ctx) {
    int new_keys = gSystem.newKeys;

    if ((new_keys & (PAD_BUTTON_A | PAD_BUTTON_B)) != 0) {
        return TRUE;
    }

    if ((new_keys & PAD_KEY_UP) != 0) {
        PlayerAvatar_SetFacingDirection(ctx->fsys->playerAvatar, DIR_NORTH);
    } else if ((new_keys & PAD_KEY_DOWN) != 0) {
        PlayerAvatar_SetFacingDirection(ctx->fsys->playerAvatar, DIR_SOUTH);
    } else if ((new_keys & PAD_KEY_LEFT) != 0) {
        PlayerAvatar_SetFacingDirection(ctx->fsys->playerAvatar, DIR_WEST);
    } else if ((new_keys & PAD_KEY_RIGHT) != 0) {
        PlayerAvatar_SetFacingDirection(ctx->fsys->playerAvatar, DIR_EAST);
    } else {
        return FALSE;
    }

    return TRUE;
}

static BOOL sub_020410F0(SCRIPTCONTEXT* ctx);

BOOL ScrCmd_WaitButtonOrDpad(SCRIPTCONTEXT* ctx) {
    SetupNativeScript(ctx, sub_020410F0);
    return TRUE;
}

static BOOL sub_020410F0(SCRIPTCONTEXT* ctx) {
    if ((gSystem.newKeys & (PAD_BUTTON_A | PAD_BUTTON_B)) != 0) {
        return TRUE;
    }

    if ((gSystem.newKeys & (PAD_KEY_UP | PAD_KEY_DOWN | PAD_KEY_LEFT | PAD_KEY_RIGHT)) != 0) {
        return TRUE;
    }

    return FALSE;
}

BOOL ScrCmd_OpenMsg(SCRIPTCONTEXT* ctx) {
    FieldSystem* fsys = ctx->fsys;
    u8* unk = FieldSysGetAttrAddr(fsys, SCRIPTENV_08);

    sub_0205B514(fsys->bg_config, FieldSysGetAttrAddr(fsys, SCRIPTENV_WINDOW), 3);
    sub_0205B564(FieldSysGetAttrAddr(fsys, SCRIPTENV_WINDOW), Sav2_PlayerData_GetOptionsAddr(ctx->fsys->savedata));

    fsys->unkD2_6 = 1;
    *unk = 1;

    return FALSE;
}

BOOL ScrCmd_CloseMsg(SCRIPTCONTEXT* ctx) {
    FieldSystem* fsys = ctx->fsys;
    WINDOW* window = FieldSysGetAttrAddr(fsys, SCRIPTENV_WINDOW);
    u8* unk = FieldSysGetAttrAddr(fsys, SCRIPTENV_08);

    ClearFrameAndWindow2(window, 0);
    RemoveWindow(window);

    fsys->unkD2_6 = 0;
    *unk = 0;

    return FALSE;
}

BOOL ScrCmd_HoldMsg(SCRIPTCONTEXT* ctx) {
    FieldSystem* fsys = ctx->fsys;
    WINDOW* window = FieldSysGetAttrAddr(fsys, SCRIPTENV_WINDOW);
    u8* unk = FieldSysGetAttrAddr(fsys, SCRIPTENV_08);

    RemoveWindow(window);

    fsys->unkD2_6 = 0;
    *unk = 0;

    return FALSE;
}

static BOOL sub_02041270(SCRIPTCONTEXT* ctx);

BOOL ScrCmd_062(SCRIPTCONTEXT* ctx) {
    FieldSystem* fsys = ctx->fsys;
    u16* var_8008 = FieldSysGetAttrAddr(fsys, SCRIPTENV_SPECIAL_VAR_8008);
    u16* var_8004 = FieldSysGetAttrAddr(fsys, SCRIPTENV_SPECIAL_VAR_8004);
    u16* var_8009 = FieldSysGetAttrAddr(fsys, SCRIPTENV_SPECIAL_VAR_8009);
    u16* var_800A = FieldSysGetAttrAddr(fsys, SCRIPTENV_SPECIAL_VAR_800A);
    u16* var_8005 = FieldSysGetAttrAddr(fsys, SCRIPTENV_SPECIAL_VAR_8005);
    u16* var_800B = FieldSysGetAttrAddr(fsys, SCRIPTENV_SPECIAL_VAR_800B);

    *var_8008 = ScriptReadByte(ctx);
    *var_8004 = ScriptReadByte(ctx);
    *var_8009 = ScriptReadByte(ctx);
    *var_800A = ScriptReadByte(ctx);
    *var_8005 = ScriptReadByte(ctx);
    *var_800B = ScriptReadByte(ctx);

    SetupNativeScript(ctx, sub_02041270);
    return TRUE;
}

static BOOL sub_02041270(SCRIPTCONTEXT* ctx) {
    FieldSystem* fsys = ctx->fsys;
    u16* var_8008 = FieldSysGetAttrAddr(fsys, SCRIPTENV_SPECIAL_VAR_8008);
    u16* var_8009 = FieldSysGetAttrAddr(fsys, SCRIPTENV_SPECIAL_VAR_8009);
    u16* var_800A = FieldSysGetAttrAddr(fsys, SCRIPTENV_SPECIAL_VAR_800A);
    u16* var_800B = FieldSysGetAttrAddr(fsys, SCRIPTENV_SPECIAL_VAR_800B);
    u16* var_8004 = FieldSysGetAttrAddr(fsys, SCRIPTENV_SPECIAL_VAR_8004);
    u16* var_8005 = FieldSysGetAttrAddr(fsys, SCRIPTENV_SPECIAL_VAR_8005);

    if (*var_8004 == 0 && *var_8005 == 0) {
        return TRUE;
    }

    if (*var_8008 != 0) {
        if (*var_8009 == 0) {
            BgSetPosTextAndCommit(fsys->bg_config, GF_BG_LYR_MAIN_3, BG_POS_OP_ADD_X, *var_8008);
        } else {
            BgSetPosTextAndCommit(fsys->bg_config, GF_BG_LYR_MAIN_3, BG_POS_OP_SUB_X, *var_8008);
        }
    }

    if (*var_800A != 0) {
        if (*var_800B == 0) {
            BgSetPosTextAndCommit(fsys->bg_config, GF_BG_LYR_MAIN_3, BG_POS_OP_ADD_Y, *var_800A);
        } else {
            BgSetPosTextAndCommit(fsys->bg_config, GF_BG_LYR_MAIN_3, BG_POS_OP_SUB_Y, *var_800A);
        }
    }

    if (*var_8004 != 0) {
        (*var_8004)--;
    }

    if (*var_8005 != 0) {
        (*var_8005)--;
    }

    return FALSE;
}

BOOL ScrCmd_DirectionSignpost(SCRIPTCONTEXT* ctx) {
    u8 unk2;

    FieldSystem* fsys = ctx->fsys;
    STRING** tmp_str = FieldSysGetAttrAddr(fsys, SCRIPTENV_STRBUF2);
    STRING** unk1 = FieldSysGetAttrAddr(fsys, SCRIPTENV_STRBUF1);
    MSGFMT** msg_fmt = FieldSysGetAttrAddr(fsys, SCRIPTENV_MSGFMT);
    u8 msg_no = ScriptReadByte(ctx);
    unk2 = ScriptReadByte(ctx);
    u16 arrow = ScriptReadHalfword(ctx);
    u16 unused_result_var_id = ScriptReadHalfword(ctx);

    fsys->unkD2_6 = 1;

    ov01_021F3D68(fsys->unk68, unk2, arrow);
    ov01_021F3D70(fsys->unk68, 1);
    ov01_021F3D98(fsys);

    ReadMsgDataIntoString(ctx->msg_data, msg_no, *tmp_str);
    StringExpandPlaceholders(*msg_fmt, *unk1, *tmp_str);
    WINDOW* window = ov01_021F3D80(fsys->unk68);
    AddTextPrinterParameterized2(window, 1, *unk1, 0, 0, 0, MakeTextColor(2, 10, 15), NULL);

    return TRUE;
}

BOOL ScrCmd_055(SCRIPTCONTEXT* ctx) {
    FieldSystem* fsys = ctx->fsys;
    u8 unk1 = ScriptReadByte(ctx);
    u16 unk2 = ScriptReadHalfword(ctx);

    fsys->unkD2_6 = 1;

    ov01_021F3D68(fsys->unk68, unk1, unk2);
    ov01_021F3D70(fsys->unk68, 1);

    return TRUE;
}

BOOL ScrCmd_057(SCRIPTCONTEXT* ctx) {
    FieldSystem* fsys = ctx->fsys;
    ov01_021F3D70(fsys->unk68, ScriptReadByte(ctx));
    return TRUE;
}

static BOOL sub_02041454(SCRIPTCONTEXT* ctx);

BOOL ScrCmd_058(SCRIPTCONTEXT* ctx) {
    if (ov01_021F3D88(ctx->fsys->unk68) == TRUE) {
        return FALSE;
    }

    SetupNativeScript(ctx, sub_02041454);
    return TRUE;
}

static BOOL sub_02041454(SCRIPTCONTEXT* ctx) {
    return ov01_021F3D88(ctx->fsys->unk68) == TRUE;
}

static BOOL sub_02041520(SCRIPTCONTEXT* ctx);

BOOL ScrCmd_TrainerTips(SCRIPTCONTEXT* ctx) {
    FieldSystem* fsys = ctx->fsys;
    u8* printer_id_ptr = FieldSysGetAttrAddr(fsys, SCRIPTENV_PRINTER_NUM);
    STRING** tmp_str = FieldSysGetAttrAddr(fsys, SCRIPTENV_STRBUF2);
    STRING** unk = FieldSysGetAttrAddr(fsys, SCRIPTENV_STRBUF1);
    MSGFMT** msg_fmt = FieldSysGetAttrAddr(fsys, SCRIPTENV_MSGFMT);
    u8 msg_no = ScriptReadByte(ctx);
    u16 result_var_id = ScriptReadHalfword(ctx);

    ReadMsgDataIntoString(ctx->msg_data, msg_no, *tmp_str);
    StringExpandPlaceholders(*msg_fmt, *unk, *tmp_str);

    TextFlags_SetCanABSpeedUpPrint(TRUE);
    sub_02002B50(FALSE);
    sub_02002B8C(FALSE);

    WINDOW* window = ov01_021F3D80(fsys->unk68);
    u8 text_speed = Options_GetTextFrameDelay(Sav2_PlayerData_GetOptionsAddr(fsys->savedata));
    *printer_id_ptr = AddTextPrinterParameterized2(window, 1, *unk, 0, 0, text_speed, MakeTextColor(2, 10, 15), NULL);

    ctx->data[0] = result_var_id;
    SetupNativeScript(ctx, sub_02041520);
    return TRUE;
}

static BOOL sub_02041520(SCRIPTCONTEXT* ctx) {
    FieldSystem* fsys = ctx->fsys;
    u8* printer_id_ptr = FieldSysGetAttrAddr(fsys, SCRIPTENV_PRINTER_NUM);
    u16* ret_ptr = GetVarPointer(fsys, ctx->data[0]);
    u8 unused = ov01_021F3D84(fsys->unk68);

    u16 direction = 0xFFFF;

    if (sub_0205B624(*printer_id_ptr) == TRUE) {
        *ret_ptr = 2;
        return TRUE;
    }

    int new_keys = gSystem.newKeys;
    if ((new_keys & PAD_KEY_UP) != 0) {
        direction = DIR_NORTH;
    } else if ((new_keys & PAD_KEY_DOWN) != 0) {
        direction = DIR_SOUTH;
    } else if ((new_keys & PAD_KEY_LEFT) != 0) {
        direction = DIR_WEST;
    } else if ((new_keys & PAD_KEY_RIGHT) != 0) {
        direction = DIR_EAST;
    }

    if (direction != 0xFFFF) {
        sub_020200A0(*printer_id_ptr);
        PlayerAvatar_SetFacingDirection(ctx->fsys->playerAvatar, direction);
        *ret_ptr = 0;
        ctx->fsys->unkD2_6 = 0;
        return TRUE;
    }

    return FALSE;
}

static BOOL sub_020415E0(SCRIPTCONTEXT* ctx);

BOOL ScrCmd_060(SCRIPTCONTEXT* ctx) {
    ctx->data[0] = ScriptReadHalfword(ctx);
    SetupNativeScript(ctx, sub_020415E0);
    return TRUE;
}

static BOOL sub_020415E0(SCRIPTCONTEXT* ctx) {
    FieldSystem* fsys = ctx->fsys;
    u16* ret_ptr = GetVarPointer(fsys, ctx->data[0]);
    u16 direction = 0xFFFF;
    int new_keys = gSystem.newKeys;

    if ((new_keys & (PAD_BUTTON_A | PAD_BUTTON_B)) != 0) {
        *ret_ptr = 0;
        fsys->unkD2_6 = 0;
        return TRUE;
    }

    if ((new_keys & PAD_KEY_UP) != 0) {
        direction = DIR_NORTH;
    } else if ((new_keys & PAD_KEY_DOWN) != 0) {
        direction = DIR_SOUTH;
    } else if ((new_keys & PAD_KEY_LEFT) != 0) {
        direction = DIR_WEST;
    } else if ((new_keys & PAD_KEY_RIGHT) != 0) {
        direction = DIR_EAST;
    }

    if (direction != 0xFFFF) {
        PlayerAvatar_SetFacingDirection(ctx->fsys->playerAvatar, direction);
        *ret_ptr = 0;
        fsys->unkD2_6 = 0;
        return TRUE;
    }

    return FALSE;
}

BOOL ScrCmd_061(SCRIPTCONTEXT* ctx) {
    sub_0204031C(ctx->fsys);
    return FALSE;
}

BOOL ScrCmd_YesNo(SCRIPTCONTEXT* ctx) {
    FieldSystem *fsys = ctx->fsys;
    struct ListMenu2 **listMenu = FieldSysGetAttrAddr(fsys, SCRIPTENV_MENU);
    u16 data = ScriptReadHalfword(ctx);
    LoadUserFrameGfx1(fsys->bg_config, 3, 0x3D9, 11, 0, 4);
    *listMenu = Std_CreateYesNoMenu(fsys->bg_config, &_020FAC94, 0x3D9, 11, 4);
    ctx->data[0] = data;
    SetupNativeScript(ctx, sub_020416E4);
    return TRUE;
}

BOOL sub_020416E4(SCRIPTCONTEXT *ctx) {
    FieldSystem *fsys = ctx->fsys;
    struct ListMenu2 **listMenu = FieldSysGetAttrAddr(fsys, SCRIPTENV_MENU);
    u16 *ret_p = GetVarPointer(fsys, ctx->data[0]);
    int selection = Handle2dMenuInput_DeleteOnFinish(*listMenu, 4);
    if (selection == LIST_NOTHING_CHOSEN) {
        return FALSE;
    } else {
        if (selection == 0) {
            *ret_p = 0; // yes
        } else {
            *ret_p = 1; // no
        }
        return TRUE;
    }
}

BOOL ScrCmd_AddWaitingIcon(SCRIPTCONTEXT *ctx) {
    WINDOW *window = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_WINDOW);
    struct WaitingIconManager **mgr_p = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_WAITING_ICON);
    *mgr_p = sub_0200F0AC(window, 0x3E2);
    return FALSE;
}

BOOL ScrCmd_RemoveWaitingIcon(SCRIPTCONTEXT *ctx) {
    struct WaitingIconManager **mgr_p = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_WAITING_ICON);
    sub_0200F450(*mgr_p);
    return FALSE;
}

void sub_02041770(SCRIPTCONTEXT *ctx, struct UnkStruct_ov01_021EDC28 **a1, MSGDATA *msgData) {
    FieldSystem *fsys = ctx->fsys;
    MSGFMT **msgFmt = FieldSysGetAttrAddr(fsys, SCRIPTENV_MSGFMT);
    u8 x = ScriptReadByte(ctx);
    u8 y = ScriptReadByte(ctx);
    u8 initCursorPos = ScriptReadByte(ctx);
    u8 cancellable = ScriptReadByte(ctx);
    u16 var = ScriptReadHalfword(ctx);
    *a1 = ov01_021EDF78(fsys, x, y, initCursorPos, cancellable, GetVarPointer(fsys, var), *msgFmt, FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_WINDOW), msgData);
    ctx->data[0] = var;
}

BOOL ScrCmd_064(SCRIPTCONTEXT *ctx) {
    sub_02041770(ctx, FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_MENU_WINDOW), NULL);
    return TRUE;
}

BOOL ScrCmd_065(SCRIPTCONTEXT *ctx) {
    sub_02041770(ctx, FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_MENU_WINDOW), ctx->msg_data);
    return TRUE;
}

BOOL ScrCmd_066(SCRIPTCONTEXT *ctx) {
    struct UnkStruct_ov01_021EDC28 **pp_menu = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_MENU_WINDOW);
    u8 msgId = ScriptReadByte(ctx);
    u8 value = ScriptReadByte(ctx);
    ov01_021EDC7C(*pp_menu, msgId, value);
    return FALSE;
}

BOOL ScrCmd_559(SCRIPTCONTEXT *ctx) {
    struct UnkStruct_ov01_021EDC28 **pp_menu = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_MENU_WINDOW);
    u16 msgId = ScriptGetVar(ctx);
    u16 value = ScriptGetVar(ctx);
    ov01_021EDC7C(*pp_menu, msgId, value);
    return FALSE;
}

BOOL sub_020418B4(SCRIPTCONTEXT *ctx);

BOOL ScrCmd_067(SCRIPTCONTEXT *ctx) {
    struct UnkStruct_ov01_021EDC28 **pp_menu = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_MENU_WINDOW);
    ov01_021EDC84(*pp_menu);
    SetupNativeScript(ctx, sub_020418B4);
    return TRUE;
}

BOOL sub_020418B4(SCRIPTCONTEXT *ctx) {
    return *GetVarPointer(ctx->fsys, ctx->data[0]) != 0xEEEE;
}

BOOL sub_02041900(SCRIPTCONTEXT *ctx);

BOOL ScrCmd_585(SCRIPTCONTEXT *ctx) {
    struct UnkStruct_ov01_021EDC28 **pp_menu = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_MENU_WINDOW);
    ov01_021EDC84(*pp_menu);
    SetupNativeScript(ctx, sub_02041900);
    return TRUE;
}

BOOL sub_02041900(SCRIPTCONTEXT *ctx) {
    FieldSystem *fsys = ctx->fsys;
    u16 *p_var = GetVarPointer(fsys, ctx->data[0]);
    struct UnkStruct_ov01_021EDC28 **pp_menu = FieldSysGetAttrAddr(fsys, SCRIPTENV_MENU_WINDOW);
    if (*p_var == 0xEEEE) {
        if (sub_0205A478(fsys->unk80)) {
            *p_var = 8;
            ov01_021EDF38(*pp_menu);
            return TRUE;
        } else {
            return FALSE;
        }
    } else {
        return TRUE;
    }
}

BOOL ScrCmd_068(SCRIPTCONTEXT *ctx) {
    sub_02041770(ctx, FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_MENU_WINDOW), NULL);
    return TRUE;
}

BOOL ScrCmd_069(SCRIPTCONTEXT *ctx) {
    sub_02041770(ctx, FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_MENU_WINDOW), ctx->msg_data);
    return TRUE;
}

BOOL ScrCmd_070(SCRIPTCONTEXT *ctx) {
    struct UnkStruct_ov01_021EDC28 **pp_menu = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_MENU_WINDOW);
    u16 r6 = ScriptGetVar(ctx);
    u16 r7 = ScriptGetVar(ctx);
    u16 r3 = ScriptGetVar(ctx);
    MoveTutorMenu_SetListItem(*pp_menu, r6, r7, r3);
    return FALSE;
}

BOOL ScrCmd_071(SCRIPTCONTEXT *ctx) {
    struct UnkStruct_ov01_021EDC28 **pp_menu = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_MENU_WINDOW);
    ov01_021EDFA4(*pp_menu);
    SetupNativeScript(ctx, sub_020418B4);
    return TRUE;
}

BOOL ScrCmd_695(SCRIPTCONTEXT *ctx) {
    struct UnkStruct_ov01_021EDC28 **pp_menu = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_MENU_WINDOW);
    u16 var = ScriptGetVar(ctx);
    ov01_021EE014(*pp_menu, var);
    SetupNativeScript(ctx, sub_020418B4);
    return TRUE;
}

BOOL ScrCmd_677(SCRIPTCONTEXT *ctx) {
    struct UnkStruct_ov01_021EDC28 **pp_menu = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_MENU_WINDOW);
    u16 *var1 = ScriptGetVarPointer(ctx);
    u16 *var2 = ScriptGetVarPointer(ctx);
    ov01_021EE0EC(*pp_menu, var1, var2);
    SetupNativeScript(ctx, sub_020418B4);
    return TRUE;
}

BOOL ScrCmd_072(SCRIPTCONTEXT *ctx) {
    struct UnkStruct_ov01_021EDC28 **pp_menu = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_MENU_WINDOW);
    u8 val = ScriptReadByte(ctx);
    ov01_021EE974(*pp_menu, val);
    SetupNativeScript(ctx, sub_020418B4);
    return TRUE;
}

BOOL ScrCmd_841(SCRIPTCONTEXT *ctx) {
    struct UnkStruct_ov01_021EDC28 **pp_menu = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_MENU_WINDOW);
    u8 val = ScriptReadByte(ctx);
    ov01_021EF018(*pp_menu, val);
    return TRUE;
}

BOOL ScrCmd_842(SCRIPTCONTEXT *ctx) {
    struct UnkStruct_ov01_021EDC28 **pp_menu = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_MENU_WINDOW);
    u8 val = ScriptReadByte(ctx);
    ov01_021EF034(*pp_menu, val);
    return TRUE;
}

BOOL ScrCmd_ApplyMovement(SCRIPTCONTEXT *ctx) {
    u16 person = ScriptGetVar(ctx);
    u32 offset = ScriptReadWord(ctx);
    LocalMapObject *object = sub_02041C70(ctx->fsys, person);
    EventObjectMovementMan *mvtMan;
    u8 *mvtCounter;

    if (object == NULL) {
        GF_ASSERT(person == obj_partner_poke);
        return FALSE;
    }
    if (person == obj_partner_poke) {
        ov01_021F7704(object);
    }
    mvtMan = EventObjectMovementMan_Create(object, (const MovementScriptCommand *)(ctx->script_ptr + offset));
    mvtCounter = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_NUM_ACTIVE_MOVEMENT);
    (*mvtCounter)++;
    _ScheduleObjectEventMovement(ctx->fsys, mvtMan, NULL);
    return FALSE;
}

BOOL ScrCmd_563(SCRIPTCONTEXT *ctx) {
    u16 person = ScriptGetVar(ctx);
    u16 x = ScriptGetVar(ctx);
    u16 y = ScriptGetVar(ctx);
    u16 now_x, now_y;
    int i;
    LocalMapObject *object = sub_02041C70(ctx->fsys, person);
    MovementScriptCommand *cmd;
    EventObjectMovementMan *mvtMan;
    u8 *mvtCounter;

    GF_ASSERT(object != NULL);
    cmd = AllocFromHeap(4, 64 * sizeof(MovementScriptCommand));
    now_x = MapObject_GetCurrentX(object);
    now_y = MapObject_GetCurrentY(object);
    i = 0;
    if (now_x < x) {
        cmd[i].command = MV_step_right;
        cmd[i].length = x - now_x;
        i++;
    } else if (now_x > x) {
        cmd[i].command = MV_step_left;
        cmd[i].length = now_x - x;
        i++;
    }
    if (now_y < y) {
        cmd[i].command = MV_step_down;
        cmd[i].length = y - now_y;
        i++;
    } else if (now_y > y) {
        cmd[i].command = MV_step_up;
        cmd[i].length = now_y - y;
        i++;
    }
    cmd[i].command = MV_step_end;
    cmd[i].length = 0;

    mvtMan = EventObjectMovementMan_Create(object, cmd);
    mvtCounter = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_NUM_ACTIVE_MOVEMENT);
    (*mvtCounter)++;
    _ScheduleObjectEventMovement(ctx->fsys, mvtMan, cmd);
    return FALSE;
}

LocalMapObject *sub_02041C70(FieldSystem *fsys, u16 person) {
    if (person == 0xF2) {
        return sub_0205EEB4(fsys->mapObjectMan, 0x30);
    } else if (person == 0xF1) {
        LocalMapObject **attr = FieldSysGetAttrAddr(fsys, SCRIPTENV_CAMERA_FOCUS_OBJ);
        return *attr;
    } else {
        return GetMapObjectByID(fsys->mapObjectMan, person);
    }
}

BOOL _IsAllMovementFinish(SCRIPTCONTEXT *ctx);

BOOL ScrCmd_WaitMovement(SCRIPTCONTEXT *ctx) {
    SetupNativeScript(ctx, _IsAllMovementFinish);
    return TRUE;
}

BOOL _IsAllMovementFinish(SCRIPTCONTEXT *ctx) {
    u8 *ptr = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_NUM_ACTIVE_MOVEMENT);
    return *ptr == 0;
}

struct ObjectMovementTaskEnv {
    SysTask *task;
    EventObjectMovementMan *mvtMan;
    struct MovementScriptCommand *cmd;
    FieldSystem *fsys;
};

void _RunObjectEventMovement(SysTask *task, struct ObjectMovementTaskEnv *env);

void _ScheduleObjectEventMovement(FieldSystem *fsys, EventObjectMovementMan *mvtMan, MovementScriptCommand *a2) {
    struct ObjectMovementTaskEnv *env = AllocFromHeap(4, sizeof(struct ObjectMovementTaskEnv));
    if (env == NULL) {
        GF_ASSERT(0);
        return;
    }
    env->fsys = fsys;
    env->mvtMan = mvtMan;
    env->cmd = a2;
    env->task = CreateSysTask((SysTaskFunc)_RunObjectEventMovement, env, 0);
}

void _RunObjectEventMovement(SysTask *task, struct ObjectMovementTaskEnv *env) {
    u8 *mvtCnt = FieldSysGetAttrAddr(env->fsys, SCRIPTENV_NUM_ACTIVE_MOVEMENT);
    if (EventObjectMovementMan_IsFinish(env->mvtMan) == TRUE) {
        EventObjectMovementMan_Delete(env->mvtMan);
        DestroySysTask(env->task);
        if (env->cmd != NULL) {
            FreeToHeap(env->cmd);
        }
        FreeToHeap(env);
        if (*mvtCnt == 0) {
            GF_ASSERT(0);
        } else {
            (*mvtCnt)--;
        }
    }
}

BOOL _WaitFollowPokePaused(SCRIPTCONTEXT *ctx);

BOOL ScrCmd_LockAll(SCRIPTCONTEXT *ctx) {
    LocalMapObject **p_lastTalked;
    LocalMapObject *tsurePoke;
    FieldSystem *fsys = ctx->fsys;

    p_lastTalked = FieldSysGetAttrAddr(fsys, SCRIPTENV_LAST_TALKED);
    if (*p_lastTalked == NULL) {
        MapObjectMan_PauseAllMovement(fsys->mapObjectMan);
        tsurePoke = FollowingPokemon_GetMapObject(fsys);
        if (FollowingPokemon_IsActive(fsys) && MapObject_IsSingleMovementActive(tsurePoke)) {
            MapObject_UnpauseMovement(tsurePoke);
            SetupNativeScript(ctx, _WaitFollowPokePaused);
            return TRUE;
        }
    } else {
        ScrCmd_LockLastTalked(ctx);
    }
    return TRUE;
}

static inline BOOL _CheckMovementPauseWaitFlag(u8 mask) {
    return _021D415C & mask;
}

static inline void _SetMovementPauseWaitFlag(u8 mask) {
    _021D415C |= mask;
}

static inline void _ClearMovementPauseWaitFlag(u8 mask) {
    _021D415C &= (u8)~mask; // explicit cast is required to match
}

static inline BOOL _AllMovementPauseWaitsFinish(void) {
    return _021D415C == 0;
}

static inline void _ResetMovementPauseWaitFlags(void) {
    _021D415C = 0;
}

BOOL _WaitMovementPauseBeforeMsg(SCRIPTCONTEXT *ctx) {
    FieldSystem *fsys = ctx->fsys;
    LocalMapObject **p_lastTalked = FieldSysGetAttrAddr(fsys, SCRIPTENV_LAST_TALKED);
    LocalMapObject *playerObj = PlayerAvatar_GetMapObject(fsys->playerAvatar);
    LocalMapObject *unk;

    if (_CheckMovementPauseWaitFlag(1)) {
        if (MapObject_IsMovementPaused(playerObj) == TRUE) {
            MapObject_PauseMovement(playerObj);
            _ClearMovementPauseWaitFlag(1);
        }
    }

    if (_CheckMovementPauseWaitFlag(4)) {
        if (MapObject_IsSingleMovementActive(*p_lastTalked) == FALSE) {
            MapObject_PauseMovement(*p_lastTalked);
            _ClearMovementPauseWaitFlag(4);
        }
    }

    if (_CheckMovementPauseWaitFlag(2)) {
        unk = sub_0205EEB4(fsys->mapObjectMan, 0x30);
        if (MapObject_IsSingleMovementActive(unk) == FALSE) {
            MapObject_PauseMovement(unk);
            _ClearMovementPauseWaitFlag(2);
        }
    }

    if (_CheckMovementPauseWaitFlag(8)) {
        unk = sub_020660C0(*p_lastTalked);
        if (MapObject_IsSingleMovementActive(unk) == FALSE) {
            MapObject_PauseMovement(unk);
            _ClearMovementPauseWaitFlag(8);
        }
    }

    return _AllMovementPauseWaitsFinish();
}

BOOL _WaitFollowPokePaused(SCRIPTCONTEXT *ctx) {
    LocalMapObject *tsurePoke = FollowingPokemon_GetMapObject(ctx->fsys);
    if (MapObject_IsSingleMovementActive(tsurePoke) == FALSE) {
        MapObject_PauseMovement(tsurePoke);
        return TRUE;
    }

    return FALSE;
}

BOOL ScrCmd_LockLastTalked(SCRIPTCONTEXT *ctx) {
    FieldSystem *fsys = ctx->fsys;
    LocalMapObject **p_lastTalked = FieldSysGetAttrAddr(fsys, SCRIPTENV_LAST_TALKED);
    LocalMapObject *playerObject = PlayerAvatar_GetMapObject(fsys->playerAvatar);
    LocalMapObject *unk = sub_0205EEB4(fsys->mapObjectMan, 0x30);
    LocalMapObject *unk2 = sub_020660C0(*p_lastTalked);
    MapObjectMan *mapObjectMan = fsys->mapObjectMan;

    _ResetMovementPauseWaitFlags();

    MapObjectMan_PauseAllMovement(mapObjectMan);

    if (MapObject_IsMovementPaused(playerObject) == FALSE) {
        _SetMovementPauseWaitFlag(1);
        MapObject_UnpauseMovement(playerObject);
    }

    if (MapObject_IsSingleMovementActive(*p_lastTalked) != FALSE) {
        _SetMovementPauseWaitFlag(4);
        MapObject_UnpauseMovement(*p_lastTalked);
    }

    if (unk != NULL && FollowingPokemon_IsActive(fsys) && MapObject_IsSingleMovementActive(unk) == FALSE) {
        _SetMovementPauseWaitFlag(2);
        MapObject_UnpauseMovement(unk);
    }

    if (unk2 != NULL && MapObject_IsSingleMovementActive(unk2) != FALSE) {
        _SetMovementPauseWaitFlag(8);
        MapObject_UnpauseMovement(unk2);
    }

    SetupNativeScript(ctx, _WaitMovementPauseBeforeMsg);
    return TRUE;
}

BOOL ScrCmd_ReleaseAll(SCRIPTCONTEXT *ctx) {
    MapObjectMan_UnpauseAllMovement(ctx->fsys->mapObjectMan);
    return TRUE;
}

BOOL ScrCmd_098(SCRIPTCONTEXT *ctx) {
    FieldSystem *fsys = ctx->fsys;
    u16 objectId = ScriptReadHalfword(ctx);
    LocalMapObject *object = GetMapObjectByID(fsys->mapObjectMan, objectId);
    if (object != NULL) {
        MapObject_PauseMovement(object);
    } else {
        GF_ASSERT(objectId == obj_partner_poke);
    }
    return FALSE;
}

BOOL ScrCmd_099(SCRIPTCONTEXT *ctx) {
    FieldSystem *fsys = ctx->fsys;
    u16 objectId = ScriptReadHalfword(ctx);
    LocalMapObject *object = GetMapObjectByID(fsys->mapObjectMan, objectId);
    if (object != NULL) {
        MapObject_UnpauseMovement(object);
    } else {
        GF_ASSERT(objectId == obj_partner_poke);
    }
    return FALSE;
}

BOOL ScrCmd_ShowPerson(SCRIPTCONTEXT *ctx) {
    FieldSystem *fsys = ctx->fsys;
    u16 objectId = ScriptGetVar(ctx);
    u32 nobjs = Field_GetNumObjectEvents(fsys);
    const OBJECT_EVENT *objectEvents = Field_GetObjectEvents(fsys);
    GF_ASSERT(CreateMapObjectFromTemplate(fsys->mapObjectMan, objectId, nobjs, fsys->location->mapId, objectEvents));
    return FALSE;
}

BOOL ScrCmd_HidePerson(SCRIPTCONTEXT *ctx) {
    FieldSystem *fsys = ctx->fsys;
    u16 objectId = ScriptGetVar(ctx);
    LocalMapObject *object = GetMapObjectByID(fsys->mapObjectMan, objectId);
    if (object == NULL) {
        GF_ASSERT(0);
    } else {
        DeleteMapObject(object);
    }
    return FALSE;
}

BOOL ScrCmd_102(SCRIPTCONTEXT *ctx) {
    u16 x = ScriptGetVar(ctx);
    u16 y = ScriptGetVar(ctx);
    LocalMapObject **p_cameraObj = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_CAMERA_FOCUS_OBJ);
    VecFx32 *pos;
    *p_cameraObj = CreateSpecialFieldObject(ctx->fsys->mapObjectMan, x, y, 0, SPRITE_CAMERA_FOCUS, 0, ctx->fsys->location->mapId);
    sub_02061070(*p_cameraObj);
    sub_0205F690(*p_cameraObj, TRUE);
    sub_0205F6AC(*p_cameraObj, FALSE);
    pos = MapObject_GetPositionVecPtr(*p_cameraObj);
    ov01_021F62E8(pos, ctx->fsys->unk2C);
    sub_02023214(pos, ctx->fsys->camera);
    return FALSE;
}

BOOL ScrCmd_103(SCRIPTCONTEXT *ctx) {
    LocalMapObject **p_cameraObj = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_CAMERA_FOCUS_OBJ);
    VecFx32 *pos;
    MapObject_Remove(*p_cameraObj);
    pos = MapObject_GetPositionVecPtr(GetMapObjectByID(ctx->fsys->mapObjectMan, obj_player));
    ov01_021F62E8(pos, ctx->fsys->unk2C);
    sub_02023214(pos, ctx->fsys->camera);
    return FALSE;
}

BOOL ScrCmd_678(SCRIPTCONTEXT *ctx) {
    u16 x = ScriptGetVar(ctx);
    u16 y = ScriptGetVar(ctx);
    LocalMapObject **p_cameraObj = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_CAMERA_FOCUS_OBJ);
    *p_cameraObj = CreateSpecialFieldObject(ctx->fsys->mapObjectMan, x, y, 0, SPRITE_CAMERA_FOCUS, 0, ctx->fsys->location->mapId);
    sub_02061070(*p_cameraObj);
    sub_0205F690(*p_cameraObj, TRUE);
    sub_0205F6AC(*p_cameraObj, FALSE);
    return FALSE;
}

BOOL ScrCmd_679(SCRIPTCONTEXT *ctx) {
    LocalMapObject **p_cameraObj = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_CAMERA_FOCUS_OBJ);
    MapObject_Remove(*p_cameraObj);
    return FALSE;
}

BOOL ScrCmd_FacePlayer(SCRIPTCONTEXT *ctx) {
    FieldSystem *fsys = ctx->fsys;
    u32 rvsDir = sub_020611F4(PlayerAvatar_GetFacingDirection(fsys->playerAvatar));
    LocalMapObject **p_lastTalked = FieldSysGetAttrAddr(fsys, SCRIPTENV_LAST_TALKED);
    u32 oldDir;
    int x, y;
    int metatile;

    if (*p_lastTalked == NULL) {
        return FALSE;
    }
    oldDir = MapObject_GetFacingDirection(*p_lastTalked);
    ov01_021F9408(*p_lastTalked, rvsDir);
    if (MapObject_GetID(*p_lastTalked) == obj_partner_poke) {
        if (ov01_022055DC(*p_lastTalked) && oldDir != rvsDir) {
            ov01_02205604(*p_lastTalked, &x, &y);
            metatile = GetMetatileBehaviorAt(fsys, x, y);
            if (rvsDir == 2 || rvsDir == 3) {
                if (sub_0205B6E8(metatile) == TRUE) {
                    ov01_021FF0E4(*p_lastTalked, 0, x, y, 1);
                } else if (sub_0205B6F4(metatile) == TRUE) {
                    ov01_021FF964(*p_lastTalked, 0, x, y, 1);
                }
            }
            if (sub_0205B6E8(metatile) == FALSE
             && sub_0205B6F4(metatile) == FALSE
             && sub_02060E54(*p_lastTalked, metatile) == FALSE
             && sub_0205B984(metatile) == FALSE
             && sub_0205B7A4(metatile) == FALSE
             && sub_02060EBC(*p_lastTalked, metatile) == FALSE
             && sub_0205B8AC(metatile) == FALSE
             && sub_0205BA70(metatile) == FALSE
            ) {
                MapObject_ClearBits(*p_lastTalked, 0x100000);
            }
        }
    }
    return FALSE;
}

BOOL ScrCmd_GetPlayerCoords(SCRIPTCONTEXT *ctx) {
    FieldSystem *fsys = ctx->fsys;
    u16 *p_x = ScriptGetVarPointer(ctx);
    u16 *p_y = ScriptGetVarPointer(ctx);

    *p_x = GetPlayerXCoord(fsys->playerAvatar);
    *p_y = GetPlayerYCoord(fsys->playerAvatar);
    return FALSE;
}

BOOL ScrCmd_GetPersonCoords(SCRIPTCONTEXT *ctx) {
    FieldSystem *fsys = ctx->fsys;
    u16 personId = ScriptGetVar(ctx);
    LocalMapObject *object = GetMapObjectByID(fsys->mapObjectMan, personId);
    u16 *p_x = ScriptGetVarPointer(ctx);
    u16 *p_y = ScriptGetVarPointer(ctx);

    if (object != NULL) {
        *p_x = MapObject_GetCurrentX(object);
        *p_y = MapObject_GetCurrentY(object);
    } else {
        *p_x = 255;
        *p_y = 255;
        GF_ASSERT(personId == obj_partner_poke);
    }
    return FALSE;
}

BOOL ScrCmd_GetPlayerFacing(SCRIPTCONTEXT *ctx) {
    u16 *p_direction = ScriptGetVarPointer(ctx);
    *p_direction = PlayerAvatar_GetFacingDirection(ctx->fsys->playerAvatar);
    return FALSE;
}

BOOL ScrCmd_107(SCRIPTCONTEXT *ctx) {
    VecFx32 shift_v;

    u16 x = ScriptGetVar(ctx);
    u16 y = ScriptGetVar(ctx);
    u16 z = ScriptGetVar(ctx);

    shift_v.x = FX32_CONST(x);
    shift_v.y = FX32_CONST(y);
    shift_v.z = FX32_CONST(z);

    sub_0205F9A0(PlayerAvatar_GetMapObject(ctx->fsys->playerAvatar), &shift_v);
    GF_Camera_ShiftBy(&shift_v, ctx->fsys->camera);
    return FALSE;
}

BOOL ScrCmd_108(SCRIPTCONTEXT *ctx) {
    u16 objectId = ScriptGetVar(ctx);
    LocalMapObject *object = GetMapObjectByID(ctx->fsys->mapObjectMan, objectId);
    u8 arg = ScriptReadByte(ctx);
    sub_0205F79C(object, arg);
    return FALSE;
}

BOOL ScrCmd_109(SCRIPTCONTEXT *ctx) {
    u16 objectId = ScriptGetVar(ctx);
    LocalMapObject *object = GetMapObjectByID(ctx->fsys->mapObjectMan, objectId);
    u16 arg = ScriptReadHalfword(ctx);
    if (object != NULL) {
        sub_0205FC94(object, arg);
    }
    return FALSE;
}

BOOL ScrCmd_574(SCRIPTCONTEXT *ctx) {
    u16 *p_dest = ScriptGetVarPointer(ctx);
    *p_dest = 0;
    u16 objectId = ScriptGetVar(ctx);
    LocalMapObject *object = GetMapObjectByID(ctx->fsys->mapObjectMan, objectId);
    if (object != NULL) {
        *p_dest = MapObject_GetMovement(object);
    }
    return FALSE;
}

BOOL ScrCmd_136(SCRIPTCONTEXT *ctx) {
    u16 partyIdx = ScriptGetVar(ctx);
    u16 *p_dest = ScriptGetVarPointer(ctx);
    *p_dest = GetMonUnownLetter(GetPartyMonByIndex(SavArray_PlayerParty_get(ctx->fsys->savedata), partyIdx));
    return FALSE;
}

BOOL ScrCmd_PartySelectUI(SCRIPTCONTEXT *ctx) {
    struct PartyMenuAppData **p_work = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_AC);
    *p_work = sub_0203E580(32, ctx->fsys);
    SetupNativeScript(ctx, ScrNative_WaitApplication);
    return TRUE;
}

BOOL ScrCmd_566(SCRIPTCONTEXT *ctx) {
    void **p_work = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_AC);
    *p_work = sub_0203E5A4(32, ctx->fsys);
    SetupNativeScript(ctx, ScrNative_WaitApplication);
    return TRUE;
}

BOOL ScrCmd_350(SCRIPTCONTEXT *ctx) {
    void **p_work = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_AC);
    *p_work = sub_0203E6D4(ctx->fsys->taskman, 32);
    return TRUE;
}

BOOL ScrCmd_PartySelect(SCRIPTCONTEXT *ctx) {
    u16 *dest_p = ScriptGetVarPointer(ctx);
    struct PartyMenuAppData **p_work = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_AC);
    GF_ASSERT(*p_work != NULL);
    *dest_p = sub_0203E5C8(*p_work);
    if (*dest_p == 7) {
        *dest_p = 255;
    }
    FreeToHeap(*p_work);
    *p_work = NULL;
    return FALSE;
}

BOOL ScrCmd_635(SCRIPTCONTEXT *ctx) {
    u16 *r5 = ScriptGetVarPointer(ctx);
    u16 *r6 = ScriptGetVarPointer(ctx);
    struct PartyMenuAppData **p_work = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_AC);
    struct PartyMenuAppData *r7;
    int r0;
    r7 = *p_work;
    GF_ASSERT(*p_work != NULL);
    r0 = sub_0203E5C8(*p_work);
    if (r0 == 7) {
        *r5 = 255;
    } else if (r0 == 6) {
        *r5 = r7->unk_30;
        (*r5)--;
        *r6 = r7->unk_31;
        if (*r6 != 0) {
            (*r6)--;
        }
    }
    FreeToHeap(*p_work);
    *p_work = NULL;
    return FALSE;
}

BOOL ScrCmd_639(SCRIPTCONTEXT *ctx) {
    u16 *r5 = ScriptGetVarPointer(ctx);
    u16 *sp0 = ScriptGetVarPointer(ctx);
    u16 *r7 = ScriptGetVarPointer(ctx);
    struct PartyMenuAppData **p_work = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_AC);
    struct PartyMenuAppData *r4 = *p_work;
    GF_ASSERT(r4 != NULL);
    int r0 = sub_0203E5C8(*p_work);
    if (r0 == 7) {
        *r5 = 255;
    } else if (r0 == 6) {
        *r5 = r4->unk_30;
        (*r5)--;
        *sp0 = r4->unk_31;
        (*sp0)--;
        *r7 = r4->unk_32;
        if (*r7 != 0) {
            (*r7)--;
        }
    }
    FreeToHeap(*p_work);
    *p_work = NULL;
    return FALSE;
}

BOOL ScrCmd_645(SCRIPTCONTEXT *ctx) {
    u16 *r5 = ScriptGetVarPointer(ctx);
    u16 *sp0 = ScriptGetVarPointer(ctx);
    u16 *r7 = ScriptGetVarPointer(ctx);
    struct PartyMenuAppData **p_work = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_AC);
    struct PartyMenuAppData *r4 = *p_work;
    GF_ASSERT(r4 != NULL);
    int r0 = sub_0203E5C8(*p_work);
    if (r0 == 7) {
        *r5 = 255;
    } else if (r0 == 6) {
        *r5 = r4->unk_30;
        (*r5)--;
        *sp0 = r4->unk_31;
        (*sp0)--;
        *r7 = r4->unk_32;
        if (*r7 != 0) {
            (*r7)--;
        }
    }
    FreeToHeap(*p_work);
    *p_work = NULL;
    return FALSE;
}

BOOL ScrCmd_GetMoveSelection(SCRIPTCONTEXT *ctx) {
    u8 r6 = ScriptReadByte(ctx);
    u16 *r5 = ScriptGetVarPointer(ctx);
    void **p_work = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_AC);
    GF_ASSERT(*p_work != NULL);
    if (r6 == 1) {
        *r5 = sub_0203E864(*p_work);
    } else {
        *r5 = sub_0203E600(*p_work);
    }
    FreeToHeap(*p_work);
    *p_work = NULL;
    return FALSE;
}

BOOL ScrCmd_ChooseMoveUI(SCRIPTCONTEXT *ctx) {
    void **p_work = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_AC);
    u8 r6 = ScriptReadByte(ctx);
    u16 r7 = ScriptGetVar(ctx);
    u16 r3 = ScriptGetVar(ctx);
    if (r6 == 1) {
        *p_work = sub_0203E7F4(32, ctx->fsys, r7, r3);
    } else {
        *p_work = sub_0203FB94(32, ctx->fsys, r7, r3);
    }
    SetupNativeScript(ctx, ScrNative_WaitApplication);
    return TRUE;
}

BOOL ScrCmd_GetPhoneBookRematch(SCRIPTCONTEXT *ctx) {
    u16 r4 = ScriptGetVar(ctx);
    u16 *r6 = ScriptGetVarPointer(ctx);
    struct PhoneBook *phoneBook = AllocAndReadPhoneBook(32);
    HandleLoadOverlay(FS_OVERLAY_ID(OVY_26), OVY_LOAD_ASYNC);
    *r6 = PhoneBookTrainerGetRematchInfo(r4, ctx->fsys->savedata, phoneBook, Field_GetTimeOfDayWildParam(ctx->fsys));
    UnloadOverlayByID(FS_OVERLAY_ID(OVY_26));
    FreePhoneBook(phoneBook);
    return FALSE;
}

BOOL ScrCmd_684(SCRIPTCONTEXT *ctx) {
    u16 *p_dest = ScriptGetVarPointer(ctx);
    *p_dest = FlyPoints_GetWeatherType(Save_FlyPoints_get(ctx->fsys->savedata));
    return FALSE;
}

BOOL ScrNative_WaitApplication_DestroyTaskData(SCRIPTCONTEXT *ctx) {
    FieldSystem *fsys = ctx->fsys;
    void **p_work = FieldSysGetAttrAddr(fsys, SCRIPTENV_AC);
    if (FieldSys_ApplicationIsRunning(fsys)) {
        return FALSE;
    }
    FreeToHeap(*p_work);
    *p_work = NULL;
    return TRUE;
}

BOOL sub_020429A0(SCRIPTCONTEXT *ctx) {
    FieldSystem *fsys = ctx->fsys;
    void **p_work = FieldSysGetAttrAddr(fsys, SCRIPTENV_AC);
    if (FieldSys_ApplicationIsRunning(fsys)) {
        return FALSE;
    }
    sub_02093070(fsys);
    FreeToHeap(*p_work);
    *p_work = NULL;
    return TRUE;
}

BOOL sub_020429D4(SCRIPTCONTEXT *ctx) {
    FieldSystem *fsys = ctx->fsys;
    void **p_work = FieldSysGetAttrAddr(fsys, SCRIPTENV_AC);
    if (!sub_020970C0(*p_work)) {
        return FALSE;
    }
    *p_work = NULL;
    return TRUE;
}

BOOL ScrNative_WaitApplication(SCRIPTCONTEXT *ctx) {
    if (!FieldSys_ApplicationIsRunning(ctx->fsys)) {
        return TRUE;
    } else {
        return FALSE;
    }
}

BOOL ScrCmd_150(SCRIPTCONTEXT *ctx) {
    sub_020552A4(ctx->fsys->taskman);
    return TRUE;
}

BOOL ScrCmd_436(SCRIPTCONTEXT *ctx) {
    sub_0205525C(ctx->fsys->taskman);
    return TRUE;
}

BOOL sub_02042A30(FieldSystem *fsys, int a1, int a2) {
    SaveDressupData *dressupData = Save_DressupData_get(fsys->savedata);
    if (a1 == 0) {
        if (!sub_0202B9EC(dressupData, a2)) {
            return FALSE;
        }
    } else {
        if (!sub_0202BA08(dressupData, a2)) {
            return FALSE;
        }
    }
    return TRUE;
}

struct DressupSomethingAppData *sub_02042A60(HeapID heapId, FieldSystem *fsys, int a2, int a3) {
    SaveDressupData *dressupData = Save_DressupData_get(fsys->savedata);
    struct DressupSomethingAppData *ret;
    if (!sub_02042A30(fsys, a2, a3)) {
        return NULL;
    }
    ret = AllocFromHeap(heapId, sizeof(struct DressupSomethingAppData));
    memset(ret, 0, sizeof(struct DressupSomethingAppData));
    ret->dressupData = dressupData;
    ret->unk_8 = a2;
    ret->unk_4 = a3;
    return ret;
}

BOOL ScrCmd_151(SCRIPTCONTEXT *ctx) {
    ov01_021F729C(ctx->fsys);
    return TRUE;
}

BOOL ScrCmd_152(SCRIPTCONTEXT *ctx) {
    sub_02078B58(ctx->taskman);
    return TRUE;
}

BOOL ScrCmd_153(SCRIPTCONTEXT *ctx) {
    struct DressupSomethingAppData **p_data = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_AC);
    u16 *p_dest = ScriptGetVarPointer(ctx);
    *p_dest = (*p_data)->unk_4;
    FreeToHeap(*p_data);
    return FALSE;
}

BOOL ScrCmd_451(SCRIPTCONTEXT *ctx) {
    u16 *p_dest = ScriptGetVarPointer(ctx);
    *p_dest = sub_0203769C();
    return TRUE;
}

BOOL ScrCmd_452(SCRIPTCONTEXT *ctx) {
    struct PokepicManager **p_work = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_GENERIC_WORK_PTR);
    u16 species = ScriptGetVar(ctx);
    u16 gender = ScriptGetVar(ctx);
    LoadUserFrameGfx1(ctx->fsys->bg_config, 3, 0x3D9, 0xB, 0, 4);
    *p_work = sub_0200F4A0(ctx->fsys->bg_config, 3, 10, 5, 11, 0x3D9, species, gender, 4);
    Script_SetMonSeenFlagBySpecies(ctx->fsys, species);
    return FALSE;
}

BOOL ScrCmd_547(SCRIPTCONTEXT *ctx) {
    struct PokepicManager **p_work = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_GENERIC_WORK_PTR);
    u16 partyIdx = ScriptGetVar(ctx);
    POKEMON *pokemon = GetPartyMonByIndex(SavArray_PlayerParty_get(ctx->fsys->savedata), partyIdx);
    LoadUserFrameGfx1(ctx->fsys->bg_config, 3, 0x3D9, 0xB, 0, 4);
    *p_work = sub_0200F4F8(ctx->fsys->bg_config, 3, 10, 5, 11, 0x3D9, pokemon, 4);
    return FALSE;
}

BOOL ScrCmd_453(SCRIPTCONTEXT *ctx) {
    u8 **r0 = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_GENERIC_WORK_PTR);
    **r0 = 1;
    return TRUE;
}

BOOL ScrCmd_548(SCRIPTCONTEXT *ctx) {
    u8 **r0 = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_GENERIC_WORK_PTR);
    **r0 = 2;
    return TRUE;
}

BOOL ScrCmd_549(SCRIPTCONTEXT *ctx) {
    ctx->data[0] = ScriptReadHalfword(ctx);
    SetupNativeScript(ctx, sub_02042C78);
    return TRUE;
}

BOOL sub_02042C78(SCRIPTCONTEXT *ctx) {
    u8 **r0 = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_GENERIC_WORK_PTR);
    u16 *dest_p = GetVarPointer(ctx->fsys, ctx->data[0]);
    return **r0 != 3;
}

BOOL ScrCmd_454(SCRIPTCONTEXT *ctx) {
    LocalMapObject **p_lastTalked = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_LAST_TALKED);
    HandleLoadOverlay(FS_OVERLAY_ID(OVY_26), OVY_LOAD_ASYNC);
    if (*p_lastTalked != NULL) {
        ov26_022599D8(ctx->fsys, *p_lastTalked);
    }
    UnloadOverlayByID(FS_OVERLAY_ID(OVY_26));
    return FALSE;
}

BOOL ScrCmd_681(SCRIPTCONTEXT *ctx) {
    u16 *var_p = ScriptGetVarPointer(ctx);
    sub_020961D8(ctx->taskman, var_p);
    return TRUE;
}

BOOL ScrCmd_154(SCRIPTCONTEXT *ctx) {
    u16 r4 = ScriptGetVar(ctx);
    u16 *r6 = ScriptGetVarPointer(ctx);
    u16 sp0 = ScriptGetVar(ctx);
    sub_0203F198(ctx->fsys->taskman, r6, ctx->fsys->savedata, r4, sp0);
    return TRUE;
}

BOOL ScrCmd_155(SCRIPTCONTEXT *ctx) {
    struct DressupSomethingAppData **p_DressupData = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_AC);
    u16 r7 = ScriptReadHalfword(ctx);
    u16 *r6 = ScriptGetVarPointer(ctx);
    *p_DressupData = sub_02042A60(11, ctx->fsys, 0, r7);
    if (*p_DressupData == NULL) {
        *r6 = 1;
        return TRUE;
    } else {
        *r6 = 0;
        sub_0203F204(ctx->fsys, *p_DressupData);
        SetupNativeScript(ctx, ScrNative_WaitApplication_DestroyTaskData);
        return TRUE;
    }
}

BOOL ScrCmd_255(SCRIPTCONTEXT *ctx) {
    u16 r6 = ScriptReadHalfword(ctx);
    u16 *r4 = ScriptGetVarPointer(ctx);
    if (sub_02042A30(ctx->fsys, 0, r6) == TRUE) {
        *r4 = 1;
        return TRUE;
    } else {
        *r4 = 0;
        return TRUE;
    }
}

BOOL ScrCmd_256(SCRIPTCONTEXT *ctx) {
    u16 r4 = ScriptGetVar(ctx);
    sub_0202BD7C(sub_0202B9B8(Save_DressupData_get(ctx->fsys->savedata), 0), r4);
    return TRUE;
}

BOOL ScrCmd_450(SCRIPTCONTEXT *ctx) {
    sub_0203F964(ctx->fsys);
    SetupNativeScript(ctx, ScrNative_WaitApplication);
    return TRUE;
}

BOOL ScrCmd_156(SCRIPTCONTEXT *ctx) {
    sub_0206B910(ctx->taskman, ctx->fsys->savedata);
    return TRUE;
}

BOOL ScrCmd_TownMap(SCRIPTCONTEXT *ctx) {
    TownMap **p_townMap = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_AC);
    *p_townMap = TownMap_new(ctx->fsys, 1);
    SetupNativeScript(ctx, ScrNative_WaitApplication_DestroyTaskData);
    return TRUE;
}

BOOL ScrCmd_408(SCRIPTCONTEXT *ctx) {
    u16 r7 = ScriptGetVar(ctx);
    u16 sp0 = ScriptGetVar(ctx);
    struct UnkStruct_ScrCmd408 **p_work = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_AC);
    *p_work = AllocFromHeap(11, sizeof(struct UnkStruct_ScrCmd408));
    InitUnkStructScrCmd408(*p_work, r7, sp0, ctx);
    sub_0203F0A8(ctx->fsys, *p_work);
    SetupNativeScript(ctx, ScrNative_WaitApplication_DestroyTaskData);
    return TRUE;
}

BOOL ScrCmd_158(SCRIPTCONTEXT *ctx) {
    struct UnkStruct_ScrCmd158 **p_work;

    p_work = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_AC);
    *p_work = NewUnkStructScrCmd158(ctx);
    sub_0203E868(ctx->fsys, *p_work);
    SetupNativeScript(ctx, sub_020429A0);
    return TRUE;
}

BOOL ScrCmd_159(SCRIPTCONTEXT *ctx) {
    sub_0203F4C8(ctx->fsys);
    SetupNativeScript(ctx, ScrNative_WaitApplication);
    return TRUE;
}

BOOL ScrCmd_160(SCRIPTCONTEXT *ctx) {
    sub_02069464(ctx->fsys);
    return TRUE;
}

BOOL ScrCmd_161(SCRIPTCONTEXT *ctx) {
    sub_0203F4A8(ctx->fsys->taskman);
    return TRUE;
}

BOOL ScrCmd_162(SCRIPTCONTEXT *ctx) {
    void **p_work = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_AC);
    *p_work = sub_0203F4F8(ctx->fsys);
    SetupNativeScript(ctx, ScrNative_WaitApplication_DestroyTaskData);
    return TRUE;
}

BOOL ScrCmd_HOF_Credits(SCRIPTCONTEXT *ctx) {
    u16 kind = ScriptReadHalfword(ctx);
    Special_EnterHallOfFame(ctx->fsys->taskman, kind);
    return TRUE;
}

BOOL ScrCmd_164(SCRIPTCONTEXT *ctx) {
    void **p_work = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_AC);
    *p_work = sub_0203F984(ctx->fsys);
    SetupNativeScript(ctx, ScrNative_WaitApplication_DestroyTaskData);
    return TRUE;
}

BOOL ScrCmd_706(SCRIPTCONTEXT *ctx) {
    int saveOk;
    HALL_OF_FAME *hof = LoadHallOfFame(ctx->fsys->savedata, 4, &saveOk);
    u16 *p_var = ScriptGetVarPointer(ctx);
    *p_var = 0;
    if (saveOk == 2) {
        *p_var = 1;
    }
    FreeToHeap(hof);
    return FALSE;
}

BOOL ScrCmd_165(SCRIPTCONTEXT *ctx) {
    u16 r6 = ScriptGetVar(ctx);
    u16 *r4 = ScriptGetVarPointer(ctx);
    if (sub_0203A05C(ctx->fsys->savedata)) {
        *r4 = 1;
        sub_0203F844(ctx->fsys, r6);
        SetupNativeScript(ctx, ScrNative_WaitApplication);
    } else {
        *r4 = 0;
    }
    return TRUE;
}

BOOL ScrCmd_166(SCRIPTCONTEXT *ctx) {
    u16 *var_p = ScriptGetVarPointer(ctx);
    sub_02078B78(ctx->taskman, var_p);
    return TRUE;
}

BOOL ScrCmd_ChooseStarter(SCRIPTCONTEXT *ctx) {
    LaunchStarterChoiceScene(ctx->fsys);
    return TRUE;
}

BOOL ScrCmd_333(SCRIPTCONTEXT *ctx) {
    void **p_work;
    u8 r4 = ScriptReadByte(ctx) != 0 ? 1 : 0;
    p_work = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_AC);
    GF_ASSERT(*p_work == NULL);
    *p_work = sub_0203E460(ctx->fsys, r4);
    SetupNativeScript(ctx, ScrNative_WaitApplication);
    return TRUE;
}

BOOL ScrCmd_334(SCRIPTCONTEXT *ctx) {
    u16 *r5 = ScriptGetVarPointer(ctx);
    void **p_work = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_AC);
    GF_ASSERT(*p_work != NULL);
    *r5 = sub_0203E4CC(*p_work);
    FreeToHeap(*p_work);
    *p_work = NULL;
    return FALSE;
}

BOOL ScrCmd_370(SCRIPTCONTEXT *ctx) {
    void **p_work;
    u8 r4 = ScriptReadByte(ctx) != 0 ? 1 : 0;
    p_work = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_AC);
    GF_ASSERT(*p_work == NULL);
    *p_work = sub_0203E460(ctx->fsys, r4);
    SetupNativeScript(ctx, ScrNative_WaitApplication_DestroyTaskData);
    return TRUE;
}

BOOL ScrCmd_NamePlayer(SCRIPTCONTEXT *ctx) {
    u16 *p_var = ScriptGetVarPointer(ctx);
    CreateNamingScreen(ctx->taskman, NAMINGSCREEN_PLAYER, 0, OT_NAME_LENGTH, 0, NULL, p_var);
    return TRUE;
}

BOOL ScrCmd_NameRival(SCRIPTCONTEXT *ctx) {
    u16 *p_var = ScriptGetVarPointer(ctx);
    CreateNamingScreen(ctx->taskman, NAMINGSCREEN_RIVAL, 0, OT_NAME_LENGTH, 0, NULL, p_var);
    return TRUE;
}

BOOL ScrCmd_NicknameInput(SCRIPTCONTEXT *ctx) {
    FieldSystem *fsys = ctx->fsys;
    u16 partyPos = ScriptGetVar(ctx);
    BUGCONTEST *contest;
    POKEMON *pokemon;
    u16 nickname[20];
    u16 *var_ret;
    int species;

    if (partyPos == 255) {
        contest = FieldSys_BugContest_get(fsys);
        if (!contest->caught_poke) {
            return TRUE;
        }
        pokemon = contest->pokemon;
    } else {
        pokemon = GetPartyMonByIndex(SavArray_PlayerParty_get(fsys->savedata), partyPos);
    }
    GetMonData(pokemon, MON_DATA_NICKNAME, nickname);
    var_ret = ScriptGetVarPointer(ctx);
    species = GetMonData(pokemon, MON_DATA_SPECIES, NULL);
    CreateNamingScreen(ctx->taskman, NAMINGSCREEN_POKEMON, species, POKEMON_NAME_LENGTH, partyPos, nickname, var_ret);
    return TRUE;
}

BOOL ScrCmd_629(SCRIPTCONTEXT *ctx) {
    void **p_work = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_AC);
    *p_work = sub_0209707C(ctx->fsys);
    SetupNativeScript(ctx, sub_020429D4);
    return TRUE;
}

BOOL ScrCmd_630(SCRIPTCONTEXT *ctx) {
    u16 *ret_p = ScriptGetVarPointer(ctx);
    u32 r5 = sub_0205A894();
    u32 r0 = sub_02029084();
    if (r5 == r0) {
        *ret_p = FALSE;
    } else {
        *ret_p = TRUE;
    }
    return FALSE;
}

BOOL ScrCmd_492(SCRIPTCONTEXT *ctx) {
    u16 r4 = ScriptGetVar(ctx);
    u16 *r6 = ScriptGetVarPointer(ctx);
    u16 *r3 = ScriptGetVarPointer(ctx);

    *r3 = 0xFFFF;
    sub_0203E960(ctx->fsys->taskman, r4, r6, r3, NULL);
    return TRUE;
}

BOOL ScrCmd_PromptEasyChat(SCRIPTCONTEXT *ctx) {
    u16 *r6 = ScriptGetVarPointer(ctx);
    u16 *r4 = ScriptGetVarPointer(ctx);
    u16 *r0 = ScriptGetVarPointer(ctx);

    *r4 = 0xFFFF;
    *r0 = 0xFFFF;
    sub_0203E960(ctx->fsys->taskman, 1, r6, r4, r0);
    return TRUE;
}

BOOL ScrCmd_494(SCRIPTCONTEXT *ctx) {
    MSGFMT **p_msgFmt = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_MSGFMT);
    u16 idx = ScriptGetVar(ctx);
    u16 word = ScriptGetVar(ctx);
    BufferECWord(*p_msgFmt, idx, word);
    return FALSE;
}

BOOL ScrCmd_FadeScreen(SCRIPTCONTEXT *ctx) {
    u16 duration = ScriptReadHalfword(ctx);
    u16 speed = ScriptReadHalfword(ctx);
    u16 type = ScriptReadHalfword(ctx);
    u16 color = ScriptReadHalfword(ctx);
    BeginNormalPaletteFade(0, type, type, color, duration, speed, 4);
    sub_0200FBDC(0);
    sub_0200FBDC(1);
    return FALSE;
}

BOOL sub_02043458(SCRIPTCONTEXT *ctx);

BOOL ScrCmd_WaitFade(SCRIPTCONTEXT *ctx) {
    SetupNativeScript(ctx, sub_02043458);
    return TRUE;
}

BOOL sub_02043458(SCRIPTCONTEXT *ctx) {
    return IsPaletteFadeFinished() == TRUE;
}

BOOL ScrCmd_Warp(SCRIPTCONTEXT *ctx) {
    u16 mapId = ScriptGetVar(ctx);
    u16 unused = ScriptReadHalfword(ctx);
    u16 x = ScriptGetVar(ctx);
    u16 y = ScriptGetVar(ctx);
    u16 direction = ScriptGetVar(ctx);
    CallTask_ScriptWarp(ctx->taskman, mapId, -1, x, y, direction);
    return TRUE;
}

BOOL ScrCmd_448(SCRIPTCONTEXT *ctx) {
    u16 mapId = ScriptReadHalfword(ctx);
    u16 unused = ScriptReadHalfword(ctx);
    u16 x = ScriptGetVar(ctx);
    u16 y = ScriptGetVar(ctx);
    u16 direction = ScriptReadHalfword(ctx);
    sub_0205412C(ctx->fsys->taskman, mapId, -1, x, y, direction);
    return TRUE;
}

BOOL ScrCmd_449(SCRIPTCONTEXT *ctx) {
    sub_02054190(ctx->fsys->taskman);
    return TRUE;
}

BOOL ScrCmd_445(SCRIPTCONTEXT *ctx) {
    Location *location = sub_0203B960(Save_FlyPoints_get(ctx->fsys->savedata));
    u16 *ret_p = ScriptGetVarPointer(ctx);
    *ret_p = location->mapId;
    return FALSE;
}

BOOL ScrCmd_446(SCRIPTCONTEXT *ctx) {
    u16 *ret_p = ScriptGetVarPointer(ctx);
    *ret_p = ctx->fsys->location->mapId;
    return FALSE;
}

BOOL ScrCmd_840(SCRIPTCONTEXT *ctx) {
    u16 mapId = ScriptGetVar(ctx);
    u16 *ret_p = ScriptGetVarPointer(ctx);

    *ret_p = 0;
    if (MapHeader_MapIsPokemonCenter(mapId) == TRUE) {
        *ret_p = 1;
    } else if (MapHeader_MapIsPokemonLeagueLobby(mapId) == TRUE) {
        *ret_p = 2;
    }

    return FALSE;
}

BOOL ScrCmd_RockClimb(SCRIPTCONTEXT *ctx) {
    u16 partySlot = ScriptGetVar(ctx);
    int playerDirection = PlayerAvatar_GetFacingDirection(ctx->fsys->playerAvatar);
    ScriptCallTask_RockClimb(ctx->taskman, playerDirection, partySlot);
    return TRUE;
}

BOOL ScrCmd_Surf(SCRIPTCONTEXT *ctx) {
    u16 partySlot = ScriptGetVar(ctx);
    int playerDirection = PlayerAvatar_GetFacingDirection(ctx->fsys->playerAvatar);
    ScriptCallTask_Surf(ctx->taskman, playerDirection, partySlot);
    return TRUE;
}

BOOL ScrCmd_Waterfall(SCRIPTCONTEXT *ctx) {
    u16 partySlot = ScriptGetVar(ctx);
    int playerDirection = PlayerAvatar_GetFacingDirection(ctx->fsys->playerAvatar);
    ScriptCallTask_Waterfall(ctx->taskman, playerDirection, partySlot);
    return TRUE;
}

BOOL ScrCmd_180(SCRIPTCONTEXT *ctx) {
    u16 mapId = ScriptReadHalfword(ctx);
    u16 x = ScriptGetVar(ctx);
    u16 y = ScriptGetVar(ctx);
    sub_020538C0(ctx->fsys, mapId, -1, x, y, DIR_SOUTH);
    return TRUE;
}

BOOL ScrCmd_FlashEffect(SCRIPTCONTEXT *ctx) {
    FLYPOINTS_SAVE *flypointsSave = Save_FlyPoints_get(ctx->fsys->savedata);
    FlyPoints_SetWeatherType(flypointsSave, 12);
    FieldWeatherUpdate_UsedFlash(ctx->fsys->unk4->unk_0C, FlyPoints_GetWeatherType(flypointsSave));
    return TRUE;
}

BOOL ScrCmd_Whirlpool(SCRIPTCONTEXT *ctx) {
    u16 partySlot = ScriptGetVar(ctx);
    int playerDirection = PlayerAvatar_GetFacingDirection(ctx->fsys->playerAvatar);
    ScriptCallTask_Whirlpool(ctx->taskman, playerDirection, partySlot);
    return TRUE;
}

BOOL sub_0204378C(SCRIPTCONTEXT *ctx);

BOOL ScrCmd_183(SCRIPTCONTEXT *ctx) {
    void **p_work = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_GENERIC_WORK_PTR);
    u16 partyIdx = ScriptGetVar(ctx);
    POKEMON *pokemon = GetPartyMonByIndex(SavArray_PlayerParty_get(ctx->fsys->savedata), partyIdx);
    int playerGender = PlayerAvatar_GetGender(ctx->fsys->playerAvatar);
    *p_work = ov02_02249458(ctx->fsys, 0, pokemon, playerGender);
    SetupNativeScript(ctx, sub_0204378C);
    return TRUE;
}

BOOL sub_0204378C(SCRIPTCONTEXT *ctx) {
    void **p_work = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_GENERIC_WORK_PTR);
    if (ov02_0224953C(*p_work) == TRUE) {
        ov02_02249548(*p_work);
        return TRUE;
    } else {
        return FALSE;
    }
}

BOOL ScrCmd_PlayerOnBikeCheck(SCRIPTCONTEXT *ctx) {
    u16 *p_ret = ScriptGetVarPointer(ctx);
    if (PlayerAvatar_GetState(ctx->fsys->playerAvatar) == PLAYER_STATE_CYCLING) {
        *p_ret = TRUE;
    } else {
        *p_ret = FALSE;
    }
    return FALSE;
}

BOOL ScrCmd_PlayerOnBikeSet(SCRIPTCONTEXT *ctx) {
    u8 flag = ScriptReadByte(ctx);
    if (flag == TRUE) {
        Fsys_SetSavedMusicId(ctx->fsys, SEQ_GS_BICYCLE);
        Fsys_PlayOrFadeToNewMusicId(ctx->fsys, SEQ_GS_BICYCLE, 1);
        ov01_PlayerAvatar_OrrTransitionFlags(ctx->fsys->playerAvatar, PLAYER_TRANSITION_CYCLING);
        ov01_PlayerAvatar_ApplyTransitionFlags(ctx->fsys->playerAvatar);
    } else {
        ov01_PlayerAvatar_OrrTransitionFlags(ctx->fsys->playerAvatar, PLAYER_TRANSITION_WALKING);
        ov01_PlayerAvatar_ApplyTransitionFlags(ctx->fsys->playerAvatar);
        Fsys_SetSavedMusicId(ctx->fsys, 0);
        Fsys_PlayOrFadeToNewMusicId(ctx->fsys, Fsys_GetSurfOverriddenMusicId(ctx->fsys, ctx->fsys->location->mapId), 1);
    }
    return FALSE;
}

BOOL ScrCmd_591(SCRIPTCONTEXT *ctx) {
    Fsys_SetSavedMusicId(ctx->fsys, SEQ_PL_BICYCLE);
    return FALSE;
}

BOOL ScrCmd_186(SCRIPTCONTEXT *ctx) {
    u8 r1 = ScriptReadByte(ctx);
    sub_0205CAA4(ctx->fsys->playerAvatar, r1);
    return FALSE;
}

BOOL ScrCmd_GetPlayerState(SCRIPTCONTEXT *ctx) {
    u16 *p_ret = ScriptGetVarPointer(ctx);
    *p_ret = PlayerAvatar_GetState(ctx->fsys->playerAvatar);
    return FALSE;
}

BOOL ScrCmd_SetAvatarBits(SCRIPTCONTEXT *ctx) {
    u16 flags = ScriptReadHalfword(ctx);
    PlayerAvatar_OrrTransitionFlags(ctx->fsys->playerAvatar, flags);
    return TRUE;
}

BOOL ScrCmd_UpdateAvatarState(SCRIPTCONTEXT *ctx) {
    ov01_PlayerAvatar_ApplyTransitionFlags(ctx->fsys->playerAvatar);
    return FALSE;
}

BOOL ScrCmd_211(SCRIPTCONTEXT *ctx) {
    ROAMER_SAVE *roamerSave = Save_Roamers_get(ctx->fsys->savedata);
    u16 *r6 = ScriptGetVarPointer(ctx);
    u16 *r4 = ScriptGetVarPointer(ctx);
    sub_02097F9C(Roamers_GetRand(roamerSave, 2), r6, r4);
    return FALSE;
}

BOOL ScrCmd_GetStarterChoice(SCRIPTCONTEXT *ctx) {
    u16 *p_ret = ScriptGetVarPointer(ctx);
    *p_ret = GetStarterFromScriptState(SavArray_Flags_get(ctx->fsys->savedata));
    return FALSE;
}

BOOL ScrCmd_SetStarterChoice(SCRIPTCONTEXT *ctx) {
    u16 choice = ScriptGetVar(ctx);
    SetStarterToScriptState(SavArray_Flags_get(ctx->fsys->savedata), choice);
    return FALSE;
}

BOOL ScrCmd_TrainerMessage(SCRIPTCONTEXT *ctx) {
    FieldSystem *fsys = ctx->fsys;

    u16 *p_scripno = FieldSysGetAttrAddr(fsys, SCRIPTENV_SCRIPT);
    STRING **p_strbuf1 = FieldSysGetAttrAddr(fsys, SCRIPTENV_STRBUF1);
    u8 *p_printerno = FieldSysGetAttrAddr(fsys, SCRIPTENV_PRINTER_NUM);
    u16 trainerno = ScriptGetVar(ctx);
    u16 msgno = ScriptGetVar(ctx);

    GetTrainerMessageByIdPair(trainerno, msgno, *p_strbuf1, 11);
    FillWindowPixelBuffer(FieldSysGetAttrAddr(fsys, SCRIPTENV_WINDOW), 15);
    *p_printerno = sub_0205B5B4(
        FieldSysGetAttrAddr(fsys, SCRIPTENV_WINDOW),
        *p_strbuf1,
        Sav2_PlayerData_GetOptionsAddr(ctx->fsys->savedata),
        TRUE
    );
    SetupNativeScript(ctx, ov01_021EF348);
    return TRUE;
}

BOOL sub_02043A98(SCRIPTCONTEXT *ctx);

BOOL ScrCmd_226(SCRIPTCONTEXT *ctx) {
    FieldSystem *fsys = ctx->fsys;
    u16 r7 = ScriptGetVar(ctx);
    u16 sp0 = ScriptGetVar(ctx);
    u16 sp4 = ScriptGetVar(ctx);
    u16 r6 = ScriptReadHalfword(ctx);
    ov03_02255BB0(fsys, r7, sp0, sp4);
    ctx->data[0] = r6;
    SetupNativeScript(ctx, sub_02043A98);
    return TRUE;
}

BOOL sub_02043A98(SCRIPTCONTEXT *ctx) {
    u16 *p_ret = GetVarPointer(ctx->fsys, ctx->data[0]);
    int result = ov03_02255BFC();
    if (result == 0) {
        return FALSE;
    } else {
        *p_ret = result;
        return TRUE;
    }
}

BOOL sub_02043B30(SCRIPTCONTEXT *ctx);

BOOL ScrCmd_227(SCRIPTCONTEXT *ctx) {
    FieldSystem *fsys = ctx->fsys;
    u16 r7 = ScriptGetVar(ctx);
    u16 sp0 = ScriptGetVar(ctx);
    u16 sp4 = ScriptGetVar(ctx);
    u16 r6 = ScriptReadHalfword(ctx);
    ov03_02255C18(fsys, r7, sp0, sp4);
    ctx->data[0] = r6;
    SetupNativeScript(ctx, sub_02043B30);
    return TRUE;
}

BOOL sub_02043B30(SCRIPTCONTEXT *ctx) {
    u16 *p_ret = GetVarPointer(ctx->fsys, ctx->data[0]);
    int result = ov03_02255C64();
    if (result == 0) {
        return FALSE;
    } else {
        *p_ret = result;
        return TRUE;
    }
}

BOOL ScrCmd_228(SCRIPTCONTEXT *ctx) {
    u16 unused = ScriptReadHalfword(ctx);
    return TRUE;
}

BOOL ScrCmd_229(SCRIPTCONTEXT *ctx) {
    u16 unused = ScriptReadHalfword(ctx);
    return TRUE;
}

struct UnkStruct_ScrCmd230 {
    u8 filler_00[0x30];
    u8 unk_30[6];
};

BOOL ScrCmd_230(SCRIPTCONTEXT *ctx) {
    struct UnkStruct_ScrCmd230 **p_work = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_AC);
    struct UnkStruct_ScrCmd230 *work = *p_work;
    sub_02051428(ctx->fsys->taskman, &work->unk_30, 5);
    FreeToHeap(work);
    *p_work = NULL;
    return TRUE;
}

BOOL ScrCmd_231(SCRIPTCONTEXT *ctx) {
    // dummy
    return TRUE;
}

BOOL ScrCmd_SetDynamicWarp(SCRIPTCONTEXT *ctx) {
    Location warp;
    warp.mapId = ScriptGetVar(ctx);
    warp.warpId = ScriptGetVar(ctx);
    warp.x = ScriptGetVar(ctx);
    warp.z = ScriptGetVar(ctx);
    warp.direction = ScriptGetVar(ctx);
    FlyPoints_SetDynamicWarp(Save_FlyPoints_get(ctx->fsys->savedata), &warp);
    return FALSE;
}

BOOL ScrCmd_GetDynamicWarpFloorNo(SCRIPTCONTEXT *ctx) {
    u16 *p_ret = ScriptGetVarPointer(ctx);
    Location *warp = FlyPoints_GetDynamicWarp(Save_FlyPoints_get(ctx->fsys->savedata));
    *p_ret = MapNumToFloorNo(warp->mapId);
    return FALSE;
}

BOOL ScrCmd_ElevatorCurFloorBox(SCRIPTCONTEXT *ctx) {
    FieldSystem *fsys = ctx->fsys;
    MSGFMT **p_msgFmt = FieldSysGetAttrAddr(fsys, SCRIPTENV_MSGFMT);
    u8 x = ScriptReadByte(ctx);
    u8 y = ScriptReadByte(ctx);
    u16 *p_ret = ScriptGetVarPointer(ctx);
    u16 floor = ScriptGetVar(ctx);
    PrintCurFloorInNewWindow(fsys, x, y, p_ret, *p_msgFmt, floor);
    return FALSE;
}

BOOL ScrCmd_CountJohtoDexSeen(SCRIPTCONTEXT *ctx) {
    POKEDEX *pokedex = Sav2_Pokedex_get(ctx->fsys->savedata);
    u16 *p_ret = ScriptGetVarPointer(ctx);
    *p_ret = Pokedex_CountJohtoDexSeen(pokedex);
    return FALSE;
}

BOOL ScrCmd_CountJohtoDexOwned(SCRIPTCONTEXT *ctx) {
    POKEDEX *pokedex = Sav2_Pokedex_get(ctx->fsys->savedata);
    u16 *p_ret = ScriptGetVarPointer(ctx);
    *p_ret = Pokedex_CountJohtoDexOwned(pokedex);
    return FALSE;
}

BOOL ScrCmd_CountNationalDexSeen(SCRIPTCONTEXT *ctx) {
    POKEDEX *pokedex = Sav2_Pokedex_get(ctx->fsys->savedata);
    u16 *p_ret = ScriptGetVarPointer(ctx);
    *p_ret = Pokedex_CountNationalDexSeen(pokedex);
    return FALSE;
}

BOOL ScrCmd_CountNationalDexOwned(SCRIPTCONTEXT *ctx) {
    POKEDEX *pokedex = Sav2_Pokedex_get(ctx->fsys->savedata);
    u16 *p_ret = ScriptGetVarPointer(ctx);
    *p_ret = Pokedex_CountNationalDexOwned(pokedex);
    return FALSE;
}
