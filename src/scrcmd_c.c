#include "scrcmd.h"
#include "window.h"
#include "task.h"

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
    --*frames_to_wait;

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
