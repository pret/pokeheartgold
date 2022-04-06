#include "scrcmd.h"
#include "window.h"
#include "overlay_01.h"
#include "system.h"
#include "task.h"
#include "text.h"
#include "unk_0200E398.h"
#include "unk_02035900.h"
#include "unk_0205A44C.h"
#include "render_text.h"
#include "field_player_avatar.h"
#include "unk_02062108.h"
#include "field_map_object.h"

BOOL sub_020416E4(SCRIPTCONTEXT *ctx);
LocalMapObject *sub_02041C70(FieldSystem *fsys, u16 person);
void _ScheduleObjectEventMovement(FieldSystem *fsys, EventObjectMovementMan *mvtMan, MovementScriptCommand *a2);

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
    u8* printer_id_ptr = FieldSysGetAttrAddr(fsys, SCRIPTENV_05);
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
    u8* printer_id_ptr = FieldSysGetAttrAddr(fsys, SCRIPTENV_05);
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
        LocalMapObject **attr = FieldSysGetAttrAddr(fsys, SCRIPTENV_30);
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
