#include "scrcmd.h"
#include "window.h"
#include "overlay_01.h"
#include "system.h"
#include "task.h"
#include "text.h"
#include "unk_0200E398.h"

extern BOOL sub_02037474(void);
extern BOOL ov01_021EF348(SCRIPTCONTEXT* ctx);
extern void ov01_021EF4C4(struct UnkStruct_Ov01_021EF4C4*, SCRIPTCONTEXT* ctx);
extern void ov01_021EF4DC(SCRIPTCONTEXT* ctx, MSGDATA* msg_data, u8 msg_no, BOOL can_ab_speed_up, struct UnkStruct_Ov01_021EF4C4*);
extern void ov01_021F3D68(struct FieldSystemUnkSub68*, u8, u16);
extern void ov01_021F3D70(struct FieldSystemUnkSub68*, u8);
extern WINDOW* ov01_021F3D80(struct FieldSystemUnkSub68*);
extern u8 ov01_021F3D84(struct FieldSystemUnkSub68*);
extern BOOL ov01_021F3D88(struct FieldSystemUnkSub68*);
extern void ov01_021F3D98(FieldSystem* fsys);
extern void TextFlags_SetCanABSpeedUpPrint(BOOL);
extern void sub_02002B50(BOOL);
extern void sub_02002B8C(BOOL);
extern void sub_020200A0(u8 printer_id);
extern void PlayerAvatar_SetFacingDirection(FIELD_PLAYER_AVATAR*, u32 direction);

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

    sub_0205B514(fsys->bg_config, FieldSysGetAttrAddr(fsys, SCRIPTENV_14), 3);
    sub_0205B564(FieldSysGetAttrAddr(fsys, SCRIPTENV_14), Sav2_PlayerData_GetOptionsAddr(ctx->fsys->savedata));

    fsys->unkD2_6 = 1;
    *unk = 1;

    return FALSE;
}

BOOL ScrCmd_CloseMsg(SCRIPTCONTEXT* ctx) {
    FieldSystem* fsys = ctx->fsys;
    WINDOW* window = FieldSysGetAttrAddr(fsys, SCRIPTENV_14);
    u8* unk = FieldSysGetAttrAddr(fsys, SCRIPTENV_08);

    ClearFrameAndWindow2(window, 0);
    RemoveWindow(window);

    fsys->unkD2_6 = 0;
    *unk = 0;

    return FALSE;
}

BOOL ScrCmd_HoldMsg(SCRIPTCONTEXT* ctx) {
    FieldSystem* fsys = ctx->fsys;
    WINDOW* window = FieldSysGetAttrAddr(fsys, SCRIPTENV_14);
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
