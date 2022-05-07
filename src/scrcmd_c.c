#define _IN_SCRCMD_C

#include "scrcmd.h"
#include "window.h"
#include "overlay_01.h"
#include "overlay_26.h"
#include "overlay_03.h"
#include "overlay_04.h"
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
#include "save_follow_poke.h"
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
#include "field_roamer.h"
#include "unk_02097F6C.h"
#include "sys_flags.h"
#include "sys_vars.h"
#include "unk_02050660.h"
#include "pokedex.h"
#include "unk_0205BB1C.h"
#include "unk_020379A0.h"
#include "easy_chat.h"
#include "unk_02091564.h"
#include "unk_0205AC88.h"
#include "unk_02058AEC.h"
#include "unk_0205B3DC.h"
#include "field_black_out.h"
#include "use_item_on_mon.h"
#include "unk_02058034.h"
#include "unk_02056D7C.h"
#include "unk_02034B0C.h"
#include "unk_02068DE0.h"
#include "unk_02097D3C.h"
#include "math_util.h"
#include "game_stats.h"
#include "safari_zone.h"
#include "unk_02097268.h"
#include "npc_trade.h"
#include "script_pokemon_util.h"
#include "unk_0202C034.h"
#include "unk_0203A3B0.h"
#include "unk_02067A80.h"
#include "unk_020965A4.h"
#include "unk_02056680.h"
#include "unk_0208E600.h"
#include "daycare.h"
#include "pokewalker.h"
#include "unk_02095DF4.h"
#include "field_take_photo.h"
#include "unk_020977CC.h"
#include "unk_020979A8.h"
#include "unk_02097BE0.h"
#include "sound_02004A44.h"
#include "unk_020290B4.h"
#include "msgdata/msg/msg_0202.h"
#include "constants/accessories.h"
#include "constants/phone_contacts.h"
#include "constants/trainers.h"

FS_EXTERN_OVERLAY(OVY_26);
FS_EXTERN_OVERLAY(npc_trade);
FS_EXTERN_OVERLAY(OVY_20);
FS_EXTERN_OVERLAY(bug_contest);
FS_EXTERN_OVERLAY(OVY_21);
FS_EXTERN_OVERLAY(OVY_22);
FS_EXTERN_OVERLAY(OVY_25);

BOOL sub_020416E4(SCRIPTCONTEXT *ctx);
BOOL sub_02042C78(SCRIPTCONTEXT *ctx);
BOOL ScrNative_WaitApplication(SCRIPTCONTEXT *ctx);
LocalMapObject *sub_02041C70(FieldSystem *fsys, u16 person);
void _ScheduleObjectEventMovement(FieldSystem *fsys, EventObjectMovementMan *mvtMan, MovementScriptCommand *a2);
void Script_SetMonSeenFlagBySpecies(FieldSystem *fsys, u16 species);

#include "data/fieldmap.h"

static const WINDOWTEMPLATE _020FAC94 = {
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

static u8 _021D415C;

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
    MoveTutorMenu_SetListItem(*pp_menu, (u8)r6, (u8)r7, (u8)r3);
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
    warp.y = ScriptGetVar(ctx);
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

BOOL ScrCmd_247(SCRIPTCONTEXT *ctx) {
    // dummy
    return FALSE;
}

BOOL ScrCmd_GetDexEvalResult(SCRIPTCONTEXT *ctx) {
    POKEDEX *pokedex = Sav2_Pokedex_get(ctx->fsys->savedata);
    PLAYERPROFILE *profile = Sav2_PlayerData_GetProfileAddr(ctx->fsys->savedata);
    u8 kind = ScriptReadByte(ctx);
    u16 *p_ret = ScriptGetVarPointer(ctx);
    u16 *p_ret2 = ScriptGetVarPointer(ctx);

    if (kind == 0) {
        *p_ret = sub_0205BBD0(Pokedex_CountJohtoOwned_ExcludeMythical(pokedex), PlayerProfile_GetTrainerGender(profile), p_ret2);
    } else {
        *p_ret = sub_0205BC78(Pokedex_CountNationalOwned_ExcludeMythical(pokedex), PlayerProfile_GetTrainerGender(profile), p_ret2);
    }
    return FALSE;
}

BOOL ScrCmd_RocketTrapBattle(SCRIPTCONTEXT *ctx) {
    struct BattleSetupStruct **p_battleSetup = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_0C);
    u16 species = ScriptGetVar(ctx);
    u16 level = ScriptGetVar(ctx);
    SetupAndStartWildBattle(ctx->taskman, species, level, p_battleSetup, FALSE, FALSE);
    return TRUE;
}

BOOL ScrCmd_WildBattle(SCRIPTCONTEXT *ctx) {
    struct BattleSetupStruct **p_battleSetup = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_0C);
    u16 species = ScriptGetVar(ctx);
    u16 level = ScriptGetVar(ctx);
    u8 shiny = ScriptReadByte(ctx);
    SetupAndStartWildBattle(ctx->taskman, species, level, p_battleSetup, TRUE, shiny);
    return TRUE;
}

BOOL ScrCmd_686(SCRIPTCONTEXT *ctx) {
    struct BattleSetupStruct **p_battleSetup = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_0C);
    u16 species = ScriptGetVar(ctx);
    u16 level = ScriptGetVar(ctx);
    sub_02051090(ctx->taskman, species, level, p_battleSetup, TRUE);
    return TRUE;
}

BOOL ScrCmd_250(SCRIPTCONTEXT *ctx) {
    u16 species = ScriptGetVar(ctx);
    u16 level = ScriptGetVar(ctx);
    sub_02051228(ctx->taskman, species, level);
    return TRUE;
}

BOOL ScrCmd_CatchingTutorial(SCRIPTCONTEXT *ctx) {
    SetupAndStartTutorialBattle(ctx->taskman);
    return TRUE;
}

BOOL ScrCmd_252(SCRIPTCONTEXT *ctx) {
    sub_0203F818(ctx->fsys);
    SetupNativeScript(ctx, ScrNative_WaitApplication);
    return TRUE;
}

BOOL ScrCmd_GetSaveFileState(SCRIPTCONTEXT *ctx) {
    SAVEDATA *saveData = ctx->fsys->savedata;
    u16 *p_ret = ScriptGetVarPointer(ctx);

    if (Save_FileDoesNotBelongToPlayer(saveData)) {
        *p_ret = 0;
    } else if (!Save_FileExists(saveData)) {
        *p_ret = 1;
    } else if (Save_NumModifiedPCBoxesIsMany(saveData)) {
        *p_ret = 2;
    } else {
        *p_ret = 3;
    }
    return FALSE;
}

BOOL ScrCmd_SaveGameNormal(SCRIPTCONTEXT *ctx) {
    FieldSystem *fsys = ctx->fsys;
    u16 *p_ret = ScriptGetVarPointer(ctx);

    *p_ret = Field_SaveGameNormal(fsys);
    return FALSE;
}

BOOL ScrCmd_SaveWipeExtraChunks(SCRIPTCONTEXT *ctx) {
    Save_WipeExtraChunks(ctx->fsys->savedata);
    return FALSE;
}

BOOL ScrCmd_642(SCRIPTCONTEXT *ctx) {
    u16 *p_ret = ScriptGetVarPointer(ctx);
    *p_ret = Save_CheckExtraChunksExist(ctx->fsys->savedata);
    return FALSE;
}

BOOL sub_02044054(SCRIPTCONTEXT *ctx);

BOOL ScrCmd_257(SCRIPTCONTEXT *ctx) {
    u16 r0 = ScriptGetVar(ctx);
    ctx->data[0] = r0;
    sub_02037AC0(r0);
    SetupNativeScript(ctx, sub_02044054);
    return TRUE;
}

BOOL sub_02044054(SCRIPTCONTEXT *ctx) {
    if (sub_02037454() < 2) {
        return TRUE;
    } else {
        return sub_02037B38(ctx->data[0]);
    }
}

BOOL ScrCmd_258(SCRIPTCONTEXT *ctx) {
    sub_02037BEC();
    return FALSE;
}

BOOL ScrCmd_259(SCRIPTCONTEXT *ctx) {
    MSGFMT **p_msgFmt = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_MSGFMT);
    u16 *p_ret = ScriptGetVarPointer(ctx);

    *p_ret = sub_0205A6AC(*p_msgFmt);
    return FALSE;
}

BOOL ScrCmd_260(SCRIPTCONTEXT *ctx) {
    u16 *p_ret = ScriptGetVarPointer(ctx);
    MSGFMT **p_msgFmt = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_MSGFMT);

    *p_ret = sub_0205A9A0(ctx->fsys->unk80, *p_msgFmt);
    return FALSE;
}

BOOL ScrCmd_261(SCRIPTCONTEXT *ctx) {
    u16 command = ScriptReadHalfword(ctx);
    if (command == 5 || command == 7 || command == 9 || command == 6 || command == 12 || command == 10) {
        sub_020380F4();
    } else if (command == 11) {
        sub_02038104();
    }
    if (!sub_0203769C()) {
        sub_0205A904(command);
    }
    return FALSE;
}

BOOL ScrCmd_264(SCRIPTCONTEXT *ctx) {
    LocalMapObject **p_lastTalked = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_LAST_TALKED);
    MSGFMT **p_msgFmt = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_MSGFMT);
    u16 r4 = ScriptReadHalfword(ctx);
    PLAYERPROFILE *profile = Sav2_PlayerData_GetProfileAddr(Fsys_GetSaveDataPtr(ctx->fsys));
    SAVE_EASY_CHAT_T *easyChat = SaveData_EasyChat_get(Fsys_GetSaveDataPtr(ctx->fsys));
    u16 objId;

    if (r4 == 0) {
        objId = MapObject_GetID(*p_lastTalked);
    } else {
        objId = 0;
    }
    sub_0205AA9C(*p_msgFmt, r4, objId, profile, easyChat);
    return FALSE;
}

BOOL ScrCmd_265(SCRIPTCONTEXT *ctx) {
    sub_02091574(ctx->fsys);
    return FALSE;
}

BOOL sub_020441C4(SCRIPTCONTEXT *ctx);

BOOL ScrCmd_266(SCRIPTCONTEXT *ctx) {
    sub_0205AD0C(ctx->fsys->unk84);
    sub_02037FF0();
    SetupNativeScript(ctx, sub_020441C4);
    return TRUE;
}

BOOL sub_020441C4(SCRIPTCONTEXT *ctx) {
    return sub_02037454() < 2;
}

BOOL ScrCmd_267(SCRIPTCONTEXT *ctx) {
    LocalMapObject **p_lastTalked = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_LAST_TALKED);
    u16 sp0 = ScriptReadHalfword(ctx);
    u16 *p_ret = ScriptGetVarPointer(ctx);
    MSGFMT **p_msgFmt = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_MSGFMT);
    *p_ret = sub_0205A750(ctx->fsys->unk80, MapObject_GetID(*p_lastTalked), sp0, *p_msgFmt);
    return FALSE;
}

BOOL ScrCmd_586(SCRIPTCONTEXT *ctx) {
    u16 *p_ret = ScriptGetVarPointer(ctx);
    *p_ret = sub_0205A4D8(ctx->fsys->unk80);
    if (*p_ret) {
        void **p_work = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_AC);
        FreeToHeap(*p_work);
    }
    return FALSE;
}

BOOL ScrCmd_268(SCRIPTCONTEXT *ctx) {
    FieldSystem *fsys = ctx->fsys;
    LocalMapObject **p_lastTalked = FieldSysGetAttrAddr(fsys, SCRIPTENV_LAST_TALKED);
    u16 *p_ret = ScriptGetVarPointer(ctx);
    *p_ret = sub_0205A200(fsys->unk80, MapObject_GetID(*p_lastTalked));
    return FALSE;
}

BOOL ScrCmd_274(SCRIPTCONTEXT *ctx) {
    FieldSystem *fsys = ctx->fsys;
    LocalMapObject **p_lastTalked = FieldSysGetAttrAddr(fsys, SCRIPTENV_LAST_TALKED);
    u16 r7 = ScriptGetVar(ctx);
    u16 *p_ret = ScriptGetVarPointer(ctx);
    *p_ret = sub_0205A284(fsys->unk80, MapObject_GetID(*p_lastTalked), r7);
    return FALSE;
}

BOOL sub_02044318(SCRIPTCONTEXT *ctx);

BOOL ScrCmd_269(SCRIPTCONTEXT *ctx) {
    u16 var_idx = ScriptReadHalfword(ctx);
    ctx->data[0] = var_idx;
    SetupNativeScript(ctx, sub_02044318);
    return TRUE;
}

BOOL sub_02044318(SCRIPTCONTEXT *ctx) {
    FieldSystem *fsys = ctx->fsys;
    int result = sub_0205A358(fsys->unk80);
    u16 *p_ret = GetVarPointer(fsys, ctx->data[0]);
    if (result == 0) {
        return FALSE;
    } else {
        *p_ret = result;
        return TRUE;
    }
}

BOOL ScrCmd_270(SCRIPTCONTEXT *ctx) {
    sub_0205B27C(ctx->fsys->mapObjectMan, ctx->fsys->unk84);
    return FALSE;
}

BOOL ScrCmd_262(SCRIPTCONTEXT *ctx) {
    sub_0205A904(4);
    sub_020380CC();
    return FALSE;
}

BOOL ScrCmd_263(SCRIPTCONTEXT *ctx) {
    sub_02038104();
    sub_02037FF0();
    sub_0205A904(0);
    return FALSE;
}

BOOL ScrCmd_271(SCRIPTCONTEXT *ctx) {
    FieldSystem *fsys = ctx->fsys;
    u16 r6 = ScriptGetVar(ctx);
    u16 r2 = ScriptGetVar(ctx);
    sub_0205A3B0(fsys->unk80, r6, r2);
    return FALSE;
}

BOOL sub_020443D8(SCRIPTCONTEXT *ctx);

BOOL ScrCmd_272(SCRIPTCONTEXT *ctx) {
    u16 var_idx = ScriptReadHalfword(ctx);
    ctx->data[0] = var_idx;
    SetupNativeScript(ctx, sub_020443D8);
    return TRUE;
}

BOOL sub_020443D8(SCRIPTCONTEXT *ctx) {
    u16 *p_ret = GetVarPointer(ctx->fsys, ctx->data[0]);
    u32 r0 = sub_0205A35C(ctx->fsys->unk80);
    if (r0 >= 1) {
        *p_ret = r0;
        sub_0205ABB0(ctx->fsys->unk80);
        return TRUE;
    } else {
        *p_ret = 0;
        return FALSE;
    }
}

BOOL sub_02044434(SCRIPTCONTEXT *ctx);

BOOL ScrCmd_273(SCRIPTCONTEXT *ctx) {
    u16 var_idx = ScriptReadHalfword(ctx);
    ctx->data[0] = var_idx;
    SetupNativeScript(ctx, sub_02044434);
    return TRUE;
}

BOOL sub_02044434(SCRIPTCONTEXT *ctx) {
    u16 *p_ret = GetVarPointer(ctx->fsys, ctx->data[0]);
    int r0 = sub_0205A39C(ctx->fsys->unk80);
    if (gSystem.newKeys & PAD_BUTTON_B) {
        r0 = sub_0205A47C(ctx->fsys->unk80, 8);
    }
    if (r0 != 0) {
        *p_ret = r0;
        return TRUE;
    } else {
        return FALSE;
    }
}

BOOL ScrCmd_286(SCRIPTCONTEXT *ctx) {
    sub_02054030(ctx->fsys->taskman);
    return TRUE;
}

BOOL ScrCmd_287(SCRIPTCONTEXT *ctx) {
    PLAYERPROFILE *profile = Sav2_PlayerData_GetProfileAddr(Fsys_GetSaveDataPtr(ctx->fsys));
    MSGFMT **p_msgFmt = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_MSGFMT);
    sub_0205B3DC(
        PlayerProfile_GetTrainerID(profile),
        PlayerProfile_GetTrainerGender(profile),
        *p_msgFmt
    );
    return FALSE;
}

BOOL ScrCmd_288(SCRIPTCONTEXT *ctx) {
    PLAYERPROFILE *profile = Sav2_PlayerData_GetProfileAddr(Fsys_GetSaveDataPtr(ctx->fsys));
    u16 choice = ScriptGetVar(ctx);
    u16 *p_ret = ScriptGetVarPointer(ctx);
    *p_ret = sub_0205B418(
        PlayerProfile_GetTrainerID(profile),
        PlayerProfile_GetTrainerGender(profile),
        choice
    );
    *p_ret = sub_0205B46C(
        PlayerProfile_GetTrainerGender(profile),
        *p_ret,
        2
    );
    return FALSE;
}

BOOL ScrCmd_558(SCRIPTCONTEXT *ctx) {
    PLAYERPROFILE *profile = Sav2_PlayerData_GetProfileAddr(Fsys_GetSaveDataPtr(ctx->fsys));
    u16 choice = ScriptGetVar(ctx);
    u16 *p_ret = ScriptGetVarPointer(ctx);
    *p_ret = sub_0205B418(
        PlayerProfile_GetTrainerID(profile),
        PlayerProfile_GetTrainerGender(profile),
        choice
    );
    return FALSE;
}

BOOL ScrCmd_289(SCRIPTCONTEXT *ctx) {
    PLAYERPROFILE *profile = Sav2_PlayerData_GetProfileAddr(Fsys_GetSaveDataPtr(ctx->fsys));
    u16 choice = ScriptGetVar(ctx);
    PlayerProfile_SetAvatar(profile, choice);
    return FALSE;
}

BOOL ScrCmd_OverworldWhiteOut(SCRIPTCONTEXT *ctx) {
    FieldTask_CallBlackOut(ctx->taskman);
    return TRUE;
}

BOOL ScrCmd_SetSpawn(SCRIPTCONTEXT *ctx) {
    u16 spawnPoint = ScriptGetVar(ctx);
    FLYPOINTS_SAVE *flyPoints = Save_FlyPoints_get(ctx->fsys->savedata);
    FlyPoints_SetDeathSpawn(flyPoints, spawnPoint);
    return FALSE;
}

BOOL ScrCmd_GetPlayerGender(SCRIPTCONTEXT *ctx) {
    PLAYERPROFILE *profile = Sav2_PlayerData_GetProfileAddr(Fsys_GetSaveDataPtr(ctx->fsys));
    u16 *p_ret = ScriptGetVarPointer(ctx);
    *p_ret = PlayerProfile_GetTrainerGender(profile);
    return FALSE;
}

BOOL ScrCmd_HealParty(SCRIPTCONTEXT *ctx) {
    FieldSystem *fsys = TaskManager_GetSys(ctx->taskman); // ???
    HealParty(SavArray_PlayerParty_get(fsys->savedata));
    return FALSE;
}

BOOL sub_02044658(SCRIPTCONTEXT *ctx);

BOOL ScrCmd_283(SCRIPTCONTEXT *ctx) {
    sub_02058284();
    SetupNativeScript(ctx, sub_02044658);
    return TRUE;
}

BOOL sub_02044658(SCRIPTCONTEXT *ctx) {
    if (sub_02037D78() != TRUE && sub_02035650() != TRUE) {
        return TRUE;
    } else {
        return FALSE;
    }
}

BOOL ScrCmd_587(SCRIPTCONTEXT *ctx) {
    sub_020582A8();
    SetupNativeScript(ctx, sub_02044658);
    return TRUE;
}

BOOL ScrCmd_284(SCRIPTCONTEXT *ctx) {
    sub_02058190(ctx->fsys);
    return FALSE;
}

BOOL ScrCmd_285(SCRIPTCONTEXT *ctx) {
    u16 val = ScriptReadHalfword(ctx);
    sub_02057F28(val);
    return FALSE;
}

BOOL ScrCmd_335(SCRIPTCONTEXT *ctx) {
    u16 pocket = ScriptGetVar(ctx);
    u16 *p_ret = ScriptGetVarPointer(ctx);
    *p_ret = Bag_PocketNotEmpty(Sav2_Bag_get(ctx->fsys->savedata), pocket);
    return FALSE;
}

BOOL ScrCmd_MovePerson(SCRIPTCONTEXT *ctx) {
    u16 objectId = ScriptGetVar(ctx);
    u16 x = ScriptGetVar(ctx);
    u16 y = ScriptGetVar(ctx);
    Field_SetObjectEventXYPos(ctx->fsys, objectId, x, y);
    return FALSE;
}

BOOL ScrCmd_MovePersonFacing(SCRIPTCONTEXT *ctx) {
    u16 objectId = ScriptGetVar(ctx);
    u16 x = ScriptGetVar(ctx);
    u16 height = ScriptGetVar(ctx);
    u16 y = ScriptGetVar(ctx);
    u16 direction = ScriptGetVar(ctx);
    LocalMapObject *object = GetMapObjectByID(ctx->fsys->mapObjectMan, objectId);
    sub_0205FC2C(object, x, height, y, direction);
    sub_02061070(object);
    return FALSE;
}

BOOL ScrCmd_SetObjectMovementType(SCRIPTCONTEXT *ctx) {
    u16 objectId = ScriptGetVar(ctx);
    u16 movementType = ScriptGetVar(ctx);
    Field_SetObjectEventMovement(ctx->fsys, objectId, movementType);
    return FALSE;
}

BOOL ScrCmd_SetObjectFacing(SCRIPTCONTEXT *ctx) {
    u16 objectId = ScriptGetVar(ctx);
    u16 facing = ScriptGetVar(ctx);
    Field_SetObjectEventFacing(ctx->fsys, objectId, facing);
    return FALSE;
}

BOOL ScrCmd_MoveWarp(SCRIPTCONTEXT *ctx) {
    u16 warpId = ScriptGetVar(ctx);
    u16 x = ScriptGetVar(ctx);
    u16 y = ScriptGetVar(ctx);
    Field_SetWarpXYPos(ctx->fsys, warpId, x, y);
    return FALSE;
}

BOOL ScrCmd_MoveBgEvent(SCRIPTCONTEXT *ctx) {
    u16 bgId = ScriptGetVar(ctx);
    u16 x = ScriptGetVar(ctx);
    u16 y = ScriptGetVar(ctx);
    Field_SetBgEventXYPos(ctx->fsys, bgId, x, y);
    return FALSE;
}

BOOL ScrCmd_344(SCRIPTCONTEXT *ctx) {
    u16 objectId = ScriptGetVar(ctx);
    u16 dir = ScriptGetVar(ctx);
    LocalMapObject *object = GetMapObjectByID(ctx->fsys->mapObjectMan, objectId);
    GF_ASSERT(object != NULL);
    ov01_021F9408(object, dir);
    return FALSE;
}

BOOL ScrCmd_347(SCRIPTCONTEXT *ctx) {
    u16 **r5 = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_34);
    u16 r0 = ScriptGetVar(ctx);
    if (*r5 != NULL) {
        **r5 = r0;
    }
    return FALSE;
}

BOOL ScrCmd_307(SCRIPTCONTEXT *ctx) {
    u16 r4 = ScriptReadHalfword(ctx);
    u16 r6 = ScriptReadHalfword(ctx);
    u16 r7 = ScriptGetVar(ctx);
    u16 r2 = ScriptGetVar(ctx);
    u8 r3 = ScriptReadByte(ctx);
    ov01_021E9AE8(ctx->fsys, r7 + 32 * r4, r2 + 32 * r6, r3);
    return FALSE;
}

BOOL ScrCmd_308(SCRIPTCONTEXT *ctx) {
    u8 r1 = ScriptReadByte(ctx);
    ov01_021E9C00(ctx->fsys, r1);
    return TRUE;
}

BOOL ScrCmd_309(SCRIPTCONTEXT *ctx) {
    u8 r1 = ScriptReadByte(ctx);
    ov01_021E9C20(ctx->fsys, r1);
    return FALSE;
}

BOOL ScrCmd_310(SCRIPTCONTEXT *ctx) {
    u8 r1 = ScriptReadByte(ctx);
    ov01_021E9BB8(ctx->fsys, r1);
    return FALSE;
}

BOOL ScrCmd_311(SCRIPTCONTEXT *ctx) {
    u8 r1 = ScriptReadByte(ctx);
    ov01_021E9BDC(ctx->fsys, r1);
    return FALSE;
}

BOOL ScrCmd_EcruteakGymInit(SCRIPTCONTEXT *ctx) {
    Fsys_InitEcruteakGymSaveData(ctx->fsys);
    return FALSE;
}

BOOL ScrCmd_315(SCRIPTCONTEXT *ctx) {
    FieldSystem *fsys = ctx->fsys;
    if (SavGymmick_GetType(Sav2_GetGymmickPtr(Fsys_GetSaveDataPtr(fsys))) != GYMMICK_ECRUTEAK) {
        return FALSE;
    }
    ov04_02254D98(fsys);
    return FALSE;
}

BOOL ScrCmd_316(SCRIPTCONTEXT *ctx) {
    FieldSystem *fsys = ctx->fsys;
    if (SavGymmick_GetType(Sav2_GetGymmickPtr(Fsys_GetSaveDataPtr(fsys))) != GYMMICK_ECRUTEAK) {
        return FALSE;
    }
    ov04_02254DD0(fsys);
    return FALSE;
}

BOOL ScrCmd_317(SCRIPTCONTEXT *ctx) {
    FieldSystem *fsys = ctx->fsys;
    u8 r5 = ScriptReadByte(ctx);
    if (SavGymmick_GetType(Sav2_GetGymmickPtr(Fsys_GetSaveDataPtr(fsys))) != GYMMICK_ECRUTEAK) {
        return TRUE;
    }
    ov04_02254DE0(fsys, (r5 != 0) ? 10 : 30);
    return TRUE;
}

BOOL ScrCmd_CianwoodGymInit(SCRIPTCONTEXT *ctx) {
    Fsys_InitCianwoodGym(ctx->fsys);
    return FALSE;
}

BOOL ScrCmd_CianwoodGymTurnWinch(SCRIPTCONTEXT *ctx) {
    FieldSystem *fsys = ctx->fsys;
    u16 *p_ret = ScriptGetVarPointer(ctx);
    *p_ret = ov04_02256058(fsys);
    return TRUE;
}

BOOL ScrCmd_VermilionGymInit(SCRIPTCONTEXT *ctx) {
    Fsys_InitVermilionGym(ctx->fsys);
    return FALSE;
}

BOOL ScrCmd_VermilionGymLockAction(SCRIPTCONTEXT *ctx) {
    FieldSystem *fsys = ctx->fsys;
    u8 lockno = ScriptReadByte(ctx);
    u8 relock = ScriptReadByte(ctx);
    ov04_0225640C(fsys, lockno, relock);
    return TRUE;
}

BOOL ScrCmd_VermilionGymCanCheck(SCRIPTCONTEXT *ctx) {
    FieldSystem *fsys = ctx->fsys;
    u8 canId = ScriptReadByte(ctx);
    u16 *p_ret = ScriptGetVarPointer(ctx);
    *p_ret = ov04_022563C4(fsys, canId);
    return FALSE;
}

BOOL ScrCmd_ResampleVermilionGymCans(SCRIPTCONTEXT *ctx) {
    PlaceVermilionGymSwitches(ctx->fsys);
    return FALSE;
}

BOOL ScrCmd_VioletGymInit(SCRIPTCONTEXT *ctx) {
    Fsys_InitVioletGym(ctx->fsys);
    return FALSE;
}

BOOL ScrCmd_VioletGymElevator(SCRIPTCONTEXT *ctx) {
    ov04_02253ED4(ctx->fsys);
    return TRUE;
}

BOOL ScrCmd_AzaleaGymInit(SCRIPTCONTEXT *ctx) {
    Fsys_InitAzaleaGym(ctx->fsys);
    return FALSE;
}

BOOL ScrCmd_AzaleaGymSpinarak(SCRIPTCONTEXT *ctx) {
    FieldSystem *fsys = ctx->fsys;
    u8 spinarakNo = ScriptReadByte(ctx);
    Fsys_BeginAzaleaGymSpinarakRide(fsys, spinarakNo);
    return TRUE;
}

BOOL ScrCmd_AzaleaGymSwitch(SCRIPTCONTEXT *ctx) {
    FieldSystem *fsys = ctx->fsys;
    u8 switchNo = ScriptReadByte(ctx);
    Fsys_FlipAzaleaGymSwitch(fsys, switchNo);
    return TRUE;
}

BOOL ScrCmd_BlackthornGymInit(SCRIPTCONTEXT *ctx) {
    Fsys_InitBlackthornGym(ctx->fsys);
    return FALSE;
}

BOOL ScrCmd_FuchsiaGymInit(SCRIPTCONTEXT *ctx) {
    Fsys_InitFuchsiaGym(ctx->fsys);
    return FALSE;
}

BOOL ScrCmd_ViridianGymInit(SCRIPTCONTEXT *ctx) {
    Fsys_InitViridianGym(ctx->fsys);
    return FALSE;
}

BOOL ScrCmd_GetPlayerXYZ(SCRIPTCONTEXT *ctx) {
    FieldSystem *fsys = ctx->fsys;
    u16 *p_x = ScriptGetVarPointer(ctx);
    u16 *p_h = ScriptGetVarPointer(ctx);
    u16 *p_y = ScriptGetVarPointer(ctx);
    LocalMapObject *playerObj = PlayerAvatar_GetMapObject(fsys->playerAvatar);
    *p_x = MapObject_GetCurrentX(playerObj);
    *p_h = MapObject_GetCurrentHeight(playerObj) / 2;
    *p_y = MapObject_GetCurrentY(playerObj);
    return FALSE;
}

BOOL ScrCmd_EggHatchAnim(SCRIPTCONTEXT *ctx) {
    sub_0203F9F4(ctx->fsys);
    return TRUE;
}

BOOL ScrCmd_374(SCRIPTCONTEXT *ctx) {
    FieldSystem *fsys = ctx->fsys;
    u16 objId = ScriptGetVar(ctx);
    LocalMapObject *object = GetMapObjectByID(fsys->mapObjectMan, objId);
    GF_ASSERT(object != NULL);
    sub_0205F690(object, FALSE);
    return FALSE;
}

BOOL ScrCmd_375(SCRIPTCONTEXT *ctx) {
    FieldSystem *fsys = ctx->fsys;
    u16 objId = ScriptGetVar(ctx);
    LocalMapObject *object = GetMapObjectByID(fsys->mapObjectMan, objId);
    GF_ASSERT(object != NULL);
    sub_0205F690(object, TRUE);
    return FALSE;
}

BOOL ScrCmd_376(SCRIPTCONTEXT *ctx) {
    void **p_work = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_AC);
    *p_work = sub_0203F074(ctx->fsys, 11);
    SetupNativeScript(ctx, ScrNative_WaitApplication_DestroyTaskData);
    return TRUE;
}

BOOL ScrCmd_377(SCRIPTCONTEXT *ctx) {
    FieldSystem *fsys = ctx->fsys;
    u16 *p_ret = ScriptGetVarPointer(ctx);
    *p_ret = Mailbox_CountMessages(Sav2_Mailbox_get(fsys->savedata), 0);
    return FALSE;
}

BOOL ScrCmd_378(SCRIPTCONTEXT *ctx) {
    u16 r4 = ScriptGetVar(ctx);
    u16 r2 = ScriptGetVar(ctx);
    sub_02097D3C(ctx->fsys, r4, r2);
    return TRUE;
}

BOOL ScrCmd_379(SCRIPTCONTEXT *ctx) {
    u16 *p_ret = ScriptGetVarPointer(ctx);
    *p_ret = Field_GetTimeOfDay(ctx->fsys);
    return FALSE;
}

BOOL ScrCmd_Random(SCRIPTCONTEXT *ctx) {
    u16 *p_ret = ScriptGetVarPointer(ctx);
    u16 modulo = ScriptGetVar(ctx);
    *p_ret = LCRandom() % modulo;
    return TRUE;
}

BOOL ScrCmd_381(SCRIPTCONTEXT *ctx) {
    u16 *p_ret = ScriptGetVarPointer(ctx);
    u16 modulo = ScriptGetVar(ctx);
    *p_ret = LCRandom() % modulo;
    return TRUE;
}

BOOL ScrCmd_403(SCRIPTCONTEXT *ctx) {
    u16 r4 = ScriptGetVar(ctx);
    u16 r6 = ScriptGetVar(ctx);
    sub_0202BB08(SaveDressupData_GetFashionCase(Save_DressupData_get(ctx->fsys->savedata)), r4, r6);
    return FALSE;
}

BOOL ScrCmd_404(SCRIPTCONTEXT *ctx) {
    u16 r4 = ScriptGetVar(ctx);
    u16 r6 = ScriptGetVar(ctx);
    u16 *p_ret = ScriptGetVarPointer(ctx);
    *p_ret = sub_0202BA2C(SaveDressupData_GetFashionCase(Save_DressupData_get(ctx->fsys->savedata)), r4, r6);
    return FALSE;
}

BOOL ScrCmd_405(SCRIPTCONTEXT *ctx) {
    u16 r7 = ScriptGetVar(ctx);
    u16 r6 = ScriptGetVar(ctx);
    u16 *p_ret = ScriptGetVarPointer(ctx);
    *p_ret = r6 <= sub_0202BA70(SaveDressupData_GetFashionCase(Save_DressupData_get(ctx->fsys->savedata)), r7);
    return FALSE;
}

BOOL ScrCmd_406(SCRIPTCONTEXT *ctx) {
    u16 r4 = ScriptGetVar(ctx);
    sub_0202BBD8(SaveDressupData_GetFashionCase(Save_DressupData_get(ctx->fsys->savedata)), r4);
    return FALSE;
}

BOOL ScrCmd_407(SCRIPTCONTEXT *ctx) {
    u16 r6 = ScriptGetVar(ctx);
    u16 *p_ret = ScriptGetVarPointer(ctx);
    *p_ret = sub_0202BA5C(SaveDressupData_GetFashionCase(Save_DressupData_get(ctx->fsys->savedata)), r6);
    return FALSE;
}

BOOL ScrCmd_CheckJohtoDexComplete(SCRIPTCONTEXT *ctx) {
    POKEDEX *pokedex = Sav2_Pokedex_get(ctx->fsys->savedata);
    u16 *p_ret = ScriptGetVarPointer(ctx);
    *p_ret = FALSE;
    if (Pokedex_JohtoDexIsComplete(pokedex) == TRUE) {
        *p_ret = TRUE;
    }
    return FALSE;
}

BOOL ScrCmd_CheckNationalDexComplete(SCRIPTCONTEXT *ctx) {
    POKEDEX *pokedex = Sav2_Pokedex_get(ctx->fsys->savedata);
    u16 *p_ret = ScriptGetVarPointer(ctx);
    *p_ret = FALSE;
    if (Pokedex_NationalDexIsComplete(pokedex) == TRUE) {
        *p_ret = TRUE;
    }
    return FALSE;
}

BOOL ScrCmd_425(SCRIPTCONTEXT *ctx) {
    void **p_work = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_AC);
    u16 r2 = ScriptGetVar(ctx);
    *p_work = sub_0203FA8C(ctx->fsys, 32, r2);
    SetupNativeScript(ctx, ScrNative_WaitApplication_DestroyTaskData);
    return TRUE;
}

BOOL ScrCmd_427(SCRIPTCONTEXT *ctx) {
    u16 *p_ret = ScriptGetVarPointer(ctx);
    // dummy
    return FALSE;
}

BOOL ScrCmd_420(SCRIPTCONTEXT *ctx) {
    u16 statno = ScriptReadHalfword(ctx);
    GameStats_Inc(Sav2_GameStats_get(ctx->fsys->savedata), statno);
    return FALSE;
}

BOOL ScrCmd_421(SCRIPTCONTEXT *ctx) {
    u16 r7 = ScriptReadHalfword(ctx);
    u16 r4 = ScriptReadHalfword(ctx);
    u16 r6 = ScriptReadHalfword(ctx);
    u16 *p_ret_hi = GetVarPointer(ctx->fsys, r4);
    u16 *p_ret_lo = GetVarPointer(ctx->fsys, r6);
    u32 statval = GameStats_GetCapped(Sav2_GameStats_get(ctx->fsys->savedata), r7);
    *p_ret_hi = (statval & 0xFFFF0000) >> 16;
    *p_ret_lo = statval & 0x0000FFFF;
    return FALSE;
}

BOOL ScrCmd_422(SCRIPTCONTEXT *ctx) {
    u16 statIdx = ScriptReadHalfword(ctx);
    u16 value_hi = ScriptReadHalfword(ctx);
    u16 value_lo = ScriptReadHalfword(ctx);
    u8 action = ScriptReadByte(ctx);

    u32 value = (value_hi << 16) | value_lo;
    switch (action) {
    case 0:
        GameStats_Add(Sav2_GameStats_get(ctx->fsys->savedata), statIdx, value);
        break;
    case 1:
        GameStats_SetCapped(Sav2_GameStats_get(ctx->fsys->savedata), statIdx, value);
        break;
    case 2:
        GameStats_UpdateBounded(Sav2_GameStats_get(ctx->fsys->savedata), statIdx, value);
        break;
    }
    return FALSE;
}

BOOL ScrCmd_704(SCRIPTCONTEXT *ctx) {
    u16 statIdx = ScriptReadHalfword(ctx);
    u16 value = ScriptGetVar(ctx);
    GameStats_Add(Sav2_GameStats_get(ctx->fsys->savedata), statIdx, value);
    return FALSE;
}

BOOL ScrCmd_705(SCRIPTCONTEXT *ctx) {
    u16 statIdx = ScriptReadHalfword(ctx);
    u32 value = ScriptReadWord(ctx);
    GameStats_Add(Sav2_GameStats_get(ctx->fsys->savedata), statIdx, value);
    return FALSE;
}

BOOL ScrCmd_SafariZoneAction(SCRIPTCONTEXT *ctx) {
    FLYPOINTS_SAVE *flypointsSave = Save_FlyPoints_get(ctx->fsys->savedata);
    SCRIPT_STATE *scriptState = SavArray_Flags_get(ctx->fsys->savedata);
    SAFARIZONE *safariZone = Save_SafariZone_get(ctx->fsys->savedata);
    u8 action = ScriptReadByte(ctx);
    u8 areaSet = ScriptReadByte(ctx);
    u16 *p_nSafariBall = FlyPoints_GetSafariBallsCounter(flypointsSave);
    u16 *p_nSafariSteps = FlyPoints_GetSafariStepsCounter(flypointsSave);
    int r1;

    switch (action) {
    case 0:
        ScriptState_SetSafariSysFlag(scriptState);
        sub_0202F5F8(safariZone, areaSet);
        *p_nSafariBall = 30;
        *p_nSafariSteps = 0;
        break;
    case 1:
        ScriptState_ClearSafariSysFlag(scriptState);
        sub_0202F5F8(safariZone, 1);
        r1 = sub_0202F6AC(safariZone);
        if (r1 != 0) {
            sub_0209730C(ctx->fsys->savedata, r1);
            sub_0202F6A0(safariZone, 0);
        }
        *p_nSafariBall = 0;
        *p_nSafariSteps = 0;
        break;
    }
    return FALSE;
}

BOOL ScrCmd_459(SCRIPTCONTEXT *ctx) {
    ov02_02245B80(ctx->taskman);
    return TRUE;
}

BOOL ScrCmd_456(SCRIPTCONTEXT *ctx) {
    u8 arg = ScriptReadByte(ctx);
    sub_0205C858(ctx->fsys->playerAvatar, arg);
    return TRUE;
}

BOOL ScrCmd_EnableMassOutbreaks(SCRIPTCONTEXT *ctx) {
    RoamerSave_SetOutbreakActive(ctx->fsys->savedata);
    return FALSE;
}

BOOL ScrCmd_CreateRoamer(SCRIPTCONTEXT *ctx) {
    u8 roamerNo = ScriptReadByte(ctx);
    Save_CreateRoamerByID(ctx->fsys->savedata, roamerNo);
    return FALSE;
}

BOOL ScrCmd_LoadNPCTrade(SCRIPTCONTEXT *ctx) {
    NPC_TRADE_WORK **p_tradeWork = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_GENERIC_WORK_PTR);
    u8 tradeNo = ScriptReadByte(ctx);

    HandleLoadOverlay(FS_OVERLAY_ID(npc_trade), OVY_LOAD_ASYNC);
    *p_tradeWork = NPCTrade_AllocWork(11, tradeNo);
    return FALSE;
}

BOOL ScrCmd_GetOfferedSpecies(SCRIPTCONTEXT *ctx) {
    NPC_TRADE_WORK **p_tradeWork = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_GENERIC_WORK_PTR);
    u16 *p_ret = ScriptGetVarPointer(ctx);
    *p_ret = NPCTradeWork_GetOfferedSpecies(*p_tradeWork);
    return FALSE;
}

BOOL ScrCmd_NPCTradeGetReqSpecies(SCRIPTCONTEXT *ctx) {
    NPC_TRADE_WORK **p_tradeWork = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_GENERIC_WORK_PTR);
    u16 *p_ret = ScriptGetVarPointer(ctx);
    *p_ret = NPCTradeWork_GetRequestedSpecies(*p_tradeWork);
    return FALSE;
}

BOOL ScrCmd_GetNpcTradeUnusedFlag(SCRIPTCONTEXT *ctx) {
    NPC_TRADE_WORK **p_tradeWork = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_GENERIC_WORK_PTR);
    u16 *p_ret = ScriptGetVarPointer(ctx);
    *p_ret = NPCTradeWork_GetUnusedFlag(*p_tradeWork);
    return FALSE;
}

BOOL ScrCmd_NPCTradeExec(SCRIPTCONTEXT *ctx) {
    NPC_TRADE_WORK **p_tradeWork = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_GENERIC_WORK_PTR);
    u16 arg = ScriptGetVar(ctx);
    Field_CreateTask_TradeAnim(ctx->taskman, *p_tradeWork, arg, 11);
    return TRUE;
}

BOOL ScrCmd_NPCTradeEnd(SCRIPTCONTEXT *ctx) {
    NPC_TRADE_WORK **p_tradeWork = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_GENERIC_WORK_PTR);
    NPCTrade_DeleteWork(*p_tradeWork);
    UnloadOverlayByID(FS_OVERLAY_ID(npc_trade));
    return FALSE;
}

BOOL ScrCmd_GiveLoanMon(SCRIPTCONTEXT *ctx) {
    u8 tradeno = ScriptReadByte(ctx);
    u8 level = ScriptReadByte(ctx);
    u16 mapno = ScriptReadHalfword(ctx);
    HandleLoadOverlay(FS_OVERLAY_ID(npc_trade), OVY_LOAD_ASYNC);
    NPCTrade_MakeAndGiveLoanMon(ctx->fsys, tradeno, level, mapno);
    UnloadOverlayByID(FS_OVERLAY_ID(npc_trade));
    return FALSE;
}

BOOL ScrCmd_CheckReturnLoanMon(SCRIPTCONTEXT *ctx) {
    u8 tradeno = ScriptReadByte(ctx);
    u16 idx = ScriptGetVar(ctx);
    u16 *p_ret = ScriptGetVarPointer(ctx);
    HandleLoadOverlay(FS_OVERLAY_ID(npc_trade), OVY_LOAD_ASYNC);
    *p_ret = NPCTrade_CanGiveUpLoanMon(ctx->fsys, tradeno, idx);
    UnloadOverlayByID(FS_OVERLAY_ID(npc_trade));
    return FALSE;
}

BOOL ScrCmd_475(SCRIPTCONTEXT *ctx) {
    // dummy
    return FALSE;
}

BOOL ScrCmd_476(SCRIPTCONTEXT *ctx) {
    sub_0202A57C(Sav2_Pokedex_get(ctx->fsys->savedata));
    return FALSE;
}

BOOL ScrCmd_NatDexFlagAction(SCRIPTCONTEXT *ctx) {
    u8 action = ScriptReadByte(ctx);
    u16 *p_ret = ScriptGetVarPointer(ctx);
    *p_ret = 0;
    if (action == 1) {
        Pokedex_SetNatDexFlag(Sav2_Pokedex_get(ctx->fsys->savedata));
        PlayerProfile_SetNatDexFlag(Sav2_PlayerData_GetProfileAddr(ctx->fsys->savedata));
    } else if (action == 2) {
        *p_ret = Pokedex_GetNatDexFlag(Sav2_Pokedex_get(ctx->fsys->savedata));
    } else {
        GF_ASSERT(0);
    }
    return FALSE;
}

BOOL ScrCmd_GetEVTotal(SCRIPTCONTEXT *ctx) {
    u16 *p_ret = ScriptGetVarPointer(ctx);
    u16 partyIdx = ScriptGetVar(ctx);
    POKEMON *pokemon = GetPartyMonByIndex(SavArray_PlayerParty_get(ctx->fsys->savedata),  partyIdx);

    int hpEv = GetMonData(pokemon, MON_DATA_HP_EV, NULL);
    int atkEv = GetMonData(pokemon, MON_DATA_ATK_EV, NULL);
    int defEv = GetMonData(pokemon, MON_DATA_DEF_EV, NULL);
    int speedEv = GetMonData(pokemon, MON_DATA_SPEED_EV, NULL);
    int spAtkEv = GetMonData(pokemon, MON_DATA_SPATK_EV, NULL);
    int spDefEv = GetMonData(pokemon, MON_DATA_SPDEF_EV, NULL);
    *p_ret = hpEv + atkEv + defEv + speedEv + spAtkEv + spDefEv;
    return FALSE;
}

BOOL ScrCmd_GetWeekday(SCRIPTCONTEXT *ctx) {
    u16 *p_ret = ScriptGetVarPointer(ctx);
    RTCDate date;
    GF_RTC_CopyDate(&date);
    *p_ret = date.week;
    return FALSE;
}

BOOL ScrCmd_485(SCRIPTCONTEXT *ctx) {
    u16 *p_var = ScriptGetVarPointer(ctx);
    ov03_022566B0(ctx->taskman, p_var);
    return TRUE;
}

BOOL ScrCmd_PokeCenAnim(SCRIPTCONTEXT *ctx) {
    u16 kind = ScriptGetVar(ctx);
    PokecenterAnimCreate(ctx->fsys, kind);
    return TRUE;
}

BOOL ScrCmd_ElevatorAnim(SCRIPTCONTEXT *ctx) {
    u16 direction = ScriptGetVar(ctx);
    u16 length = ScriptGetVar(ctx);
    ov02_0224BDE8(ctx->fsys, direction, length);
    return TRUE;
}

BOOL ScrCmd_GetGameVersion(SCRIPTCONTEXT *ctx) {
    u16 *p_ret = ScriptGetVarPointer(ctx);
    *p_ret = GAME_VERSION;
    return FALSE;
}

BOOL ScrCmd_PrimoPasswordCheck1(SCRIPTCONTEXT *ctx) {
    FieldSystem *fsys = ctx->fsys;
    PLAYERPROFILE *profile = Sav2_PlayerData_GetProfileAddr(Fsys_GetSaveDataPtr(fsys));
    u16 *p_ret = ScriptGetVarPointer(ctx);
    PC_STORAGE *pcStorage = GetStoragePCPointer(fsys->savedata);
    u16 a = ScriptGetVar(ctx);
    u16 b = ScriptGetVar(ctx);
    u16 c = ScriptGetVar(ctx);
    u16 d = ScriptGetVar(ctx);
    int wallpaper = ov02_0224CD38(profile, a, b, c, d, 4);
    if (wallpaper == -1 || wallpaper > 7) {
        *p_ret = 0xFF;
        return FALSE;
    } else if (PCStorage_IsBonusWallpaperUnlocked(pcStorage, wallpaper)) {
        *p_ret = 0;
    } else {
        PCStorage_UnlockBonusWallpaper(pcStorage, wallpaper);
        *p_ret = wallpaper + 1;
    }
    return FALSE;
}

BOOL ScrCmd_PrimoPasswordCheck2(SCRIPTCONTEXT *ctx) {
    FieldSystem *fsys = ctx->fsys;
    PLAYERPROFILE *profile = Sav2_PlayerData_GetProfileAddr(Fsys_GetSaveDataPtr(fsys));
    u16 *p_ret = ScriptGetVarPointer(ctx);
    PC_STORAGE *pcStorage = GetStoragePCPointer(fsys->savedata);
    u16 a = ScriptGetVar(ctx);
    u16 b = ScriptGetVar(ctx);
    u16 c = ScriptGetVar(ctx);
    u16 d = ScriptGetVar(ctx);
    int result = ov02_0224CD74(profile, a, b, c, d, 4);
    if (result == -1) {
        *p_ret = 0xFF;
        return FALSE;
    } else {
        *p_ret = result;
    }
    return FALSE;
}

BOOL ScrCmd_500(SCRIPTCONTEXT *ctx) {
    FieldSystem *fsys = ctx->fsys;
    u8 r1 = ScriptReadByte(ctx);
    ov02_0224BF58(fsys, r1);
    return FALSE;
}

BOOL ScrCmd_501(SCRIPTCONTEXT *ctx) {
    FieldSystem *fsys = ctx->fsys;
    u8 r1 = ScriptReadByte(ctx);
    ov02_0224BFC0(fsys, r1);
    return FALSE;
}

BOOL ScrCmd_502(SCRIPTCONTEXT *ctx) {
    FieldSystem *fsys = ctx->fsys;
    u8 r1 = ScriptReadByte(ctx);
    ov02_0224BFCC(fsys, r1);
    return FALSE;
}

void Script_SetMonSeenFlagBySpecies(FieldSystem *fsys, u16 species) {
    POKEDEX *pokedex = Sav2_Pokedex_get(fsys->savedata);
    POKEMON *pokemon = AllocMonZeroed(32);
    ZeroMonData(pokemon);
    CreateMon(pokemon, species, 50, 32, FALSE, 0, OT_ID_PLAYER_ID, 0);
    Pokedex_SetMonSeenFlag(pokedex, pokemon);
    FreeToHeap(pokemon);
}

BOOL ScrCmd_687(SCRIPTCONTEXT *ctx) {
    u16 species = ScriptGetVar(ctx);
    Script_SetMonSeenFlagBySpecies(ctx->fsys, species);
    return FALSE;
}

BOOL ScrCmd_CountPCEmptySpace(SCRIPTCONTEXT *ctx) {
    u16 *p_ret = ScriptGetVarPointer(ctx);
    *p_ret = PCStorage_CountEmptySpotsInAllBoxes(GetStoragePCPointer(ctx->fsys->savedata));
    return FALSE;
}

BOOL ScrCmd_PlayerMovementSavingSet(SCRIPTCONTEXT *ctx) {
    int *r4 = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_B8);
    *r4 = PLAYER_STATE_WALKING;
    *r4 = Field_PlayerMovementSavingSet(ctx->fsys);
    return TRUE;
}

BOOL ScrCmd_PlayerMovementSavingClear(SCRIPTCONTEXT *ctx) {
    int *r4 = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_B8);
    Field_PlayerMovementSavingClear(*r4);
    return TRUE;
}

BOOL ScrCmd_HallOfFameAnim(SCRIPTCONTEXT *ctx) {
    u16 kind = ScriptGetVar(ctx);
    ov02_0224CDB0(ctx->fsys, kind);
    return TRUE;
}

BOOL ScrCmd_AddSpecialGameStat(SCRIPTCONTEXT *ctx) {
    u16 statno = ScriptReadHalfword(ctx);
    GameStats_AddSpecial(Sav2_GameStats_get(ctx->fsys->savedata), statno);
    return FALSE;
}

BOOL ScrCmd_517(SCRIPTCONTEXT *ctx) {
    u16 species = ScriptGetVar(ctx);
    u16 *p_ret = ScriptGetVarPointer(ctx);
    *p_ret = PartyHasMon(SavArray_PlayerParty_get(ctx->fsys->savedata), species);
    return TRUE;
}

BOOL ScrCmd_518(SCRIPTCONTEXT *ctx) {
    u16 forme = ScriptGetVar(ctx);
    PARTY *party = SavArray_PlayerParty_get(ctx->fsys->savedata);
    int partyCount = GetPartyCount(party);
    POKEDEX *pokedex = Sav2_Pokedex_get(ctx->fsys->savedata);
    int i;

    for (i = 0; i < partyCount; i++) {
        POKEMON *pokemon = GetPartyMonByIndex(party, i);
        if (GetMonData(pokemon, MON_DATA_SPECIES, NULL) == SPECIES_DEOXYS) {
            SetMonData(pokemon, MON_DATA_FORME, &forme);
            CalcMonLevelAndStats(pokemon);
            Pokedex_SetMonCaughtFlag(pokedex, pokemon);
        }
    }
    return TRUE;
}

BOOL ScrCmd_519(SCRIPTCONTEXT *ctx) {
    u16 *sp0 = ScriptGetVarPointer(ctx);
    PARTY *party = SavArray_PlayerParty_get(ctx->fsys->savedata);
    int partyCount = GetPartyCount(party);

    int sp18[PARTY_SIZE] = {
        0x07FFFFFF,
        0x07FFFFFF,
        0x07FFFFFF,
        0x07FFFFFF,
        0x07FFFFFF,
        0x07FFFFFF,
    };
    int sp4 = 0;
    int i;

    for (i = 0; i < partyCount; i++) {
        int j;
        BOOL hasMultiple;
        POKEMON *pokemon = GetPartyMonByIndex(party, i);
        u32 species = GetMonData(pokemon, MON_DATA_SPECIES, NULL);
        u32 forme = GetMonData(pokemon, MON_DATA_FORME, NULL);
        if (species == SPECIES_BURMY) {
            hasMultiple = FALSE;
            for (j = 0, sp18[i] = forme; j < i; j++) {
                if (sp18[j] == forme) {
                    hasMultiple = TRUE;
                }
            }
            if (!hasMultiple) {
                sp4++;
            }
        }
    }
    *sp0 = sp4;
    return TRUE;
}

BOOL ScrCmd_520(SCRIPTCONTEXT *ctx) {
    SetFlag975(SavArray_Flags_get(ctx->fsys->savedata));
    return FALSE;
}

BOOL ScrCmd_521(SCRIPTCONTEXT *ctx) {
    ClearFlag975(SavArray_Flags_get(ctx->fsys->savedata));
    return FALSE;
}

BOOL ScrCmd_522(SCRIPTCONTEXT *ctx) {
    u16 *p_ret = ScriptGetVarPointer(ctx);
    *p_ret = Field_GetHour(ctx->fsys);
    return FALSE;
}

BOOL ScrCmd_523(SCRIPTCONTEXT *ctx) {
    u16 objectId = ScriptGetVar(ctx);
    u16 spC = ScriptGetVar(ctx);
    u16 sp8 = ScriptGetVar(ctx);
    u16 r6 = ScriptGetVar(ctx);
    u16 r4 = ScriptGetVar(ctx);
    LocalMapObject *object = GetMapObjectByID(ctx->fsys->mapObjectMan, objectId);
    GF_ASSERT(object != NULL);
    sub_0205BED8(ctx->taskman, object, spC, sp8, r6, r4);
    return TRUE;
}

BOOL ScrCmd_524(SCRIPTCONTEXT *ctx) {
    u16 objectId = ScriptGetVar(ctx);
    u16 r7 = ScriptGetVar(ctx);
    u16 r6 = ScriptGetVar(ctx);
    LocalMapObject *object = GetMapObjectByID(ctx->fsys->mapObjectMan, objectId);
    GF_ASSERT(object != NULL);
    sub_0205BFB4(ctx->taskman, object, r7, r6);
    return TRUE;
}

BOOL ScrCmd_525(SCRIPTCONTEXT *ctx) {
    u16 *p_ret = ScriptGetVarPointer(ctx);
    *p_ret = Save_PlayerHasRegiInParty(ctx->fsys->savedata);
    return FALSE;
}

BOOL ScrCmd_526(SCRIPTCONTEXT *ctx) {
    u16 *p_ret = ScriptGetVarPointer(ctx);
    FashionCase *fashionCase = SaveDressupData_GetFashionCase(Save_DressupData_get(ctx->fsys->savedata));
    int i, k, n = 0;
    u16 sp4[16];

    // UB: Since sp4 is not initialized, it is possible
    // (though unlikely) that some element could randomly
    // be equal to 1 unintentionally on entry.
    for (i = 0; i < 16; i++) {
        if (sub_0202BA2C(fashionCase, i + 34, 1) == TRUE) {
            sp4[i] = 1;
            n++;
        }
    }
    if (n == 0) {
        *p_ret = -1;
        return FALSE;
    }
    k = LCRandom() % n;
    for (i = 0; i < 16; i++) {
        if (sp4[i] == 1) {
            if (k == 0) {
                break;
            }
            k--;
        }
    }
    GF_ASSERT(i < 16);
    *p_ret = i + 34;
    return FALSE;
}

BOOL ScrCmd_528(SCRIPTCONTEXT *ctx) {
    u16 *p_ret = ScriptGetVarPointer(ctx);
    *p_ret = gSystem.unk6A;
    return TRUE;
}

BOOL ScrCmd_530(SCRIPTCONTEXT *ctx) {
    u16 r6 = ScriptGetVar(ctx);
    u8 action = ScriptReadByte(ctx);
    SCRIPT_STATE *scriptState = SavArray_Flags_get(ctx->fsys->savedata);
    if (action) {
        sub_02066C1C(scriptState, r6);
    } else {
        sub_02066C4C(scriptState, r6);
    }
    return FALSE;
}

BOOL ScrCmd_BufferBackgroundName(SCRIPTCONTEXT *ctx) {
    MSGFMT **p_msgFmt = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_MSGFMT);
    u8 bufferId = ScriptReadByte(ctx);
    u16 backgroundId = ScriptGetVar(ctx);
    BufferContestBackgroundName(*p_msgFmt, bufferId, backgroundId);
    return TRUE;
}

BOOL ScrCmd_534(SCRIPTCONTEXT *ctx) {
    u16 *p_ret = ScriptGetVarPointer(ctx);
    *p_ret = ScriptState_GetVar4041(SavArray_Flags_get(ctx->fsys->savedata));
    return FALSE;
}

BOOL ScrCmd_536(SCRIPTCONTEXT *ctx) {
    u16 r4 = ScriptGetVar(ctx);
    u16 r6 = ScriptGetVar(ctx);
    sub_0202BB7C(SaveDressupData_GetFashionCase(Save_DressupData_get(ctx->fsys->savedata)), r4, r6);
    return FALSE;
}

BOOL ScrCmd_537(SCRIPTCONTEXT *ctx) {
    sub_02066D60(ctx->fsys->savedata);
    return FALSE;
}

BOOL ScrCmd_538(SCRIPTCONTEXT *ctx) {
    u16 *p_ret = ScriptGetVarPointer(ctx);
    u16 wordIdx = ScriptGetVar(ctx);
    MSGFMT **p_msgFmt = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_MSGFMT);
    int trendy = SaveEasyChat_RandomTrendySayingSet(SaveData_EasyChat_get(ctx->fsys->savedata));
    if (trendy == 32) {
        *p_ret = 0xFFFF;
        return FALSE;
    }
    *p_ret = trendy;
    BufferECWord(*p_msgFmt, wordIdx, TrendyWordIdxToECWord(trendy));
    return FALSE;
}

BOOL ScrCmd_540(SCRIPTCONTEXT *ctx) {
    u16 *p_ret = ScriptGetVarPointer(ctx);
    *p_ret = SaveEasyChat_TrendySayingsUnlockedAllCheck(SaveData_EasyChat_get(ctx->fsys->savedata)) == TRUE;
    return FALSE;
}

BOOL ScrCmd_539(SCRIPTCONTEXT *ctx) {
    SCRIPT_STATE *scriptState = SavArray_Flags_get(ctx->fsys->savedata);
    u16 *p_ret = ScriptGetVarPointer(ctx);
    *p_ret = ScriptState_GetVar4042(scriptState) >= 5;
    return FALSE;
}

BOOL ScrCmd_543(SCRIPTCONTEXT *ctx) {
    u16 *p_ret = ScriptGetVarPointer(ctx);
    FieldSystem *fsys = ctx->fsys;
    SYSINFO *sysInfo = Sav2_SysInfo_get(fsys->savedata);
    if (Sav2_SysInfo_GetBirthMonth(sysInfo) == Field_GetMonth(fsys) && Sav2_SysInfo_GetBirthDay(sysInfo) == Field_GetDay(fsys)) {
        *p_ret = TRUE;
    } else {
        *p_ret = FALSE;
    }
    return FALSE;
}

BOOL ScrCmd_545(SCRIPTCONTEXT *ctx) {
    POKEDEX *pokedex = Sav2_Pokedex_get(ctx->fsys->savedata);
    u16 *p_ret = ScriptGetVarPointer(ctx);
    *p_ret = Pokedex_GetSeenFormeNum_Unown(pokedex, TRUE);
    return FALSE;
}

BOOL ScrCmd_546(SCRIPTCONTEXT *ctx) {
    u8 mode = ScriptReadByte(ctx);
    u16 *p_ret = ScriptGetVarPointer(ctx);
    SCRIPT_STATE *scriptState = SavArray_Flags_get(ctx->fsys->savedata);
    GF_ASSERT(mode <= 1);
    *p_ret = sub_02066BC0(scriptState, mode);
    return FALSE;
}

BOOL ScrCmd_550(SCRIPTCONTEXT *ctx) {
    u16 *p_ret = ScriptGetVarPointer(ctx);
    int loadResult;
    HALL_OF_FAME *hof = LoadHallOfFame(ctx->fsys->savedata, 32, &loadResult);
    if (loadResult == 0) {
        *p_ret = 0;
        FreeToHeap(hof);
        return TRUE;
    } else if (loadResult == 1) {
        *p_ret = Sav2_HOF_TranslateRecordIdx(hof, 0);
        FreeToHeap(hof);
        return TRUE;
    } else if (loadResult == 2) {
        *p_ret = 0;
        FreeToHeap(hof);
        return TRUE;
    } else {
        *p_ret = 0;
        return TRUE;
    }
}

BOOL ScrCmd_551(SCRIPTCONTEXT *ctx) {
    u16 r6 = ScriptGetVar(ctx);
    void **p_work = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_AC);
    *p_work = sub_0203E5D0(32, ctx->fsys, r6);
    SetupNativeScript(ctx, ScrNative_WaitApplication);
    return TRUE;
}

BOOL ScrCmd_552(SCRIPTCONTEXT *ctx) {
    u16 *r6 = ScriptGetVarPointer(ctx);
    u16 *r5 = ScriptGetVarPointer(ctx);
    struct PartyMenuAppData **p_work = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_AC);
    GF_ASSERT(*p_work != NULL);
    *r6 = sub_0203E5C8(*p_work);
    if (*r6 == 7) {
        *r6 = 255;
    }
    *r5 = sub_0203E5F8(*p_work);
    *r5 = (*r5 == TRUE);
    FreeToHeap(*p_work);
    *p_work = NULL;
    return FALSE;
}

BOOL ScrCmd_553(SCRIPTCONTEXT *ctx) {
    u8 limit = ScriptReadByte(ctx);
    u16 *p_ret = ScriptGetVarPointer(ctx);
    u16 rnd;
    if (limit > 100) {
        limit = 100;
    }
    rnd = LCRandom() % 101;
    if (rnd <= limit) {
        *p_ret = TRUE;
    } else {
        *p_ret = FALSE;
    }
    return FALSE;
}

BOOL ScrCmd_560(SCRIPTCONTEXT *ctx) {
    u16 my_case = ScriptGetVar(ctx);
    u16 *p_ret = ScriptGetVarPointer(ctx);
    FieldSystem *fsys = ctx->fsys;
    switch (my_case) {
    case 0:
        ov02_0224E074(fsys, p_ret, 0, 32);
        break;
    case 1:
        ov02_0224E074(fsys, p_ret, 1, 32);
        break;
    case 2:
        ov02_0224E074(fsys, p_ret, 2, 32);
        break;
    case 3:
        ov02_0224E074(fsys, p_ret, 3, 32);
        break;
    case 4:
        ov02_0224E074(fsys, p_ret, 4, 32);
        break;
    case 5:
        ov02_0224E074(fsys, p_ret, 5, 32);
        break;
    default:
        GF_ASSERT(0);
        break;
    }
    return TRUE;
}

BOOL ScrCmd_564(SCRIPTCONTEXT *ctx) {
    u16 *p_ret = ScriptGetVarPointer(ctx);
    *p_ret = sub_0203A05C(ctx->fsys->savedata);
    return FALSE;
}

BOOL ScrCmd_565(SCRIPTCONTEXT *ctx) {
    u16 *p_ret = ScriptGetVarPointer(ctx);
    *p_ret = sub_0202C2F8(sub_0202C6F4(ctx->fsys->savedata));
    return FALSE;
}

BOOL ScrCmd_568(SCRIPTCONTEXT *ctx) {
    u16 r4 = ScriptGetVar(ctx);
    u16 *p_ret = ScriptGetVarPointer(ctx);
    *p_ret = 0;
    if (r4 >= 0x12A && r4 <= 0x139) {
        *p_ret = 1;
    }
    return FALSE;
}

BOOL ScrCmd_571(SCRIPTCONTEXT *ctx) {
    u16 *p_ret = ScriptGetVarPointer(ctx);
    u16 sp4 = ScriptGetVar(ctx);
    u16 sp8 = ScriptGetVar(ctx);
    u16 spC = ScriptGetVar(ctx);
    u16 r7 = ScriptGetVar(ctx);
    STRING *r7_str;
    STRING *sp0_str;
    MSGFMT *msgFmt = ScrStrBufs_new(32);
    MSGDATA *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, NARC_msg_msg_0202_bin, 32);
    BufferECWord(msgFmt, 0, sp4);
    BufferECWord(msgFmt, 1, sp8);
    BufferECWord(msgFmt, 2, spC);
    BufferECWord(msgFmt, 3, r7);
    r7_str = ReadMsgData_ExpandPlaceholders(msgFmt, msgData, msg_0202_00001, 32);
    sp0_str = NewString_ReadMsgData(msgData, msg_0202_00000);
    *p_ret = StringCompare(r7_str, sp0_str) == FALSE;
    String_dtor(r7_str);
    String_dtor(sp0_str);
    DestroyMsgData(msgData);
    ScrStrBufs_delete(msgFmt);
    return FALSE;
}

BOOL ScrCmd_573(SCRIPTCONTEXT *ctx) {
    Sav2_SysInfo_SetField48(Sav2_SysInfo_get(ctx->fsys->savedata), 1);
    return FALSE;
}

BOOL ScrCmd_576(SCRIPTCONTEXT *ctx) {
    FieldSystem *fsys = ctx->fsys;
    u16 *p_ret = ScriptGetVarPointer(ctx);
    MSGFMT **p_msgFmt = FieldSysGetAttrAddr(fsys, SCRIPTENV_MSGFMT);
    *p_ret = sub_0205A6AC(*p_msgFmt);
    return FALSE;
}

BOOL ScrCmd_577(SCRIPTCONTEXT *ctx) {
    sub_0203A880();
    return FALSE;
}

BOOL ScrCmd_578(SCRIPTCONTEXT *ctx) {
    sub_0203A914();
    return FALSE;
}

BOOL ScrCmd_579(SCRIPTCONTEXT *ctx) {
    Fsys_SyncMapObjectsToSave(ctx->fsys);
    return FALSE;
}

BOOL ScrCmd_582(SCRIPTCONTEXT *ctx) {
    u16 mapId = ScriptGetVar(ctx);
    u16 x = ScriptGetVar(ctx);
    u16 y = ScriptGetVar(ctx);
    Location *specialSpawn = FlyPoints_GetSpecialSpawnWarpPtr(Save_FlyPoints_get(ctx->fsys->savedata));
    specialSpawn->mapId = mapId;
    specialSpawn->x = x;
    specialSpawn->y = y;
    specialSpawn->warpId = -1;
    specialSpawn->direction = DIR_SOUTH;
    return FALSE;
}

BOOL ScrCmd_583(SCRIPTCONTEXT *ctx) {
    u16 objectId = ScriptGetVar(ctx);
    u8 r4 = ScriptReadByte(ctx);
    LocalMapObject *object = GetMapObjectByID(ctx->fsys->mapObjectMan, objectId);
    GF_ASSERT(object != NULL);
    sub_0205F6AC(object, r4);
    return FALSE;
}

BOOL ScrCmd_GetTrcardStars(SCRIPTCONTEXT *ctx) {
    FieldSystem *fsys = ctx->fsys;
    u16 *p_ret = ScriptGetVarPointer(ctx);
    *p_ret = sub_020691E8(fsys);
    return FALSE;
}

BOOL ScrCmd_ShowSaveStats(SCRIPTCONTEXT *ctx) {
    FieldSystem *fsys = ctx->fsys;
    struct SaveStatsPrinter **p_work = FieldSysGetAttrAddr(fsys, SCRIPTENV_DC);
    if (!Save_FileDoesNotBelongToPlayer(fsys->savedata)) {
        *p_work = Field_CreateSaveStatsPrinter(fsys, 4, 3);
        SaveStatsPrinter_Print(*p_work);
    }
    return FALSE;
}

BOOL ScrCmd_HideSaveStats(SCRIPTCONTEXT *ctx) {
    FieldSystem *fsys = ctx->fsys;
    struct SaveStatsPrinter **p_work = FieldSysGetAttrAddr(fsys, SCRIPTENV_DC);
    if (!Save_FileDoesNotBelongToPlayer(fsys->savedata)) {
        SaveStatsPrinter_RemoveFromScreen(*p_work);
        SaveStatsPrinter_Delete(*p_work);
    }
    return FALSE;
}

BOOL ScrCmd_595(SCRIPTCONTEXT *ctx) {
    u8 r1 = ScriptReadByte(ctx);
    sub_02067A80(ctx->fsys, r1);
    return FALSE;
}

struct UnkStruct_ScrCmd627 {
    void *unk_0;
    OPTIONS *options;
    SAVEDATA *saveData;
    void *unk_0C;
    u8 filler_10[0x8];
    u32 mapId;
    void *unk_1C;
    u8 unk_20;
    u8 filler_21[0x7];
};

BOOL ScrCmd_627(SCRIPTCONTEXT *ctx) {
    struct UnkStruct_ScrCmd627 **p_work = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_AC);
    u8 r6 = ScriptReadByte(ctx);
    struct UnkStruct_ScrCmd627 *work = AllocFromHeapAtEnd(11, sizeof(struct UnkStruct_ScrCmd627));
    MI_CpuClear8(work, sizeof(struct UnkStruct_ScrCmd627));
    *p_work = work;
    if (r6 == 5 || r6 == 6) {
        work->unk_0 = ctx->fsys->unkA0;
    } else {
        work->unk_0 = NULL;
    }
    work->options = Sav2_PlayerData_GetOptionsAddr(ctx->fsys->savedata);
    work->unk_20 = r6;
    work->saveData = ctx->fsys->savedata;
    work->mapId = ctx->fsys->location->mapId;
    work->unk_0C = ctx->fsys->unk94;
    work->unk_1C = ctx->fsys->unkB0;
    CallApplicationAsTask(ctx->taskman, &_02108584, work);
    SetupNativeScript(ctx, ScrNative_WaitApplication_DestroyTaskData);
    return TRUE;
}

BOOL ScrCmd_631(SCRIPTCONTEXT *ctx) {
    void **p_work = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_AC);
    u16 r6 = ScriptGetVar(ctx);
    u16 r7 = ScriptGetVar(ctx);
    u16 r3 = ScriptGetVar(ctx);
    *p_work = sub_0203FAB4(ctx->fsys, r6, r7, r3, 32);
    SetupNativeScript(ctx, ScrNative_WaitApplication_DestroyTaskData);
    return TRUE;
}

BOOL ScrCmd_ScratchOffCard(SCRIPTCONTEXT *ctx) {
    struct ScratchCardWork **p_work = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_AC);
    *p_work = ScratchOffCards_Create(ctx->fsys, 32);
    SetupNativeScript(ctx, ScrNative_WaitApplication);
    return TRUE;
}

BOOL ScrCmd_ScratchOffCardEnd(SCRIPTCONTEXT *ctx) {
    struct ScratchCardWork **p_work = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_AC);
    FreeToHeap(*p_work);
    *p_work = NULL;
    return TRUE;
}

BOOL ScrCmd_GetScratchOffPrize(SCRIPTCONTEXT *ctx) {
    u16 cardno = ScriptGetVar(ctx);
    u16 *p_ret1 = ScriptGetVarPointer(ctx);
    u16 *p_ret2 = ScriptGetVarPointer(ctx);
    struct ScratchCardWork **p_work = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_AC);
    struct ScratchCardWork *work = *p_work;
    *p_ret1 = work->unk_08[cardno];
    *p_ret2 = work->unk_0E[cardno];
    return FALSE;
}

BOOL ScrCmd_662(SCRIPTCONTEXT *ctx) {
    u16 r6 = ScriptGetVar(ctx);
    u16 r7 = ScriptGetVar(ctx);
    u16 *p_ret = ScriptGetVarPointer(ctx);
    if (sub_0203A05C(ctx->fsys->savedata)) {
        *p_ret = 1;
        sub_0203FC14(ctx->fsys, r7, r6);
        SetupNativeScript(ctx, ScrNative_WaitApplication);
    } else {
        *p_ret = 0;
    }
    return TRUE;
}

BOOL ScrCmd_663(SCRIPTCONTEXT *ctx) {
    u16 *p_var = ScriptGetVarPointer(ctx);
    if (sub_0203A05C(ctx->fsys->savedata)) {
        sub_02056D00(ctx->taskman, *p_var);
    }
    return TRUE;
}

BOOL ScrCmd_667(SCRIPTCONTEXT *ctx) {
    u16 *p_ret = ScriptGetVarPointer(ctx);
    *p_ret = 0;
    if (gSystem.heldKeys & PAD_BUTTON_A) {
        *p_ret = 1;
    }
    if (gSystem.heldKeys & PAD_BUTTON_B) {
        *p_ret = 1;
    }
    return FALSE;
}

u32 sub_020467A8(SAVEDATA *saveData);

BOOL ScrCmd_GetOwnedRotomFormes(SCRIPTCONTEXT *ctx) {
    FieldSystem *fsys = ctx->fsys;
    u16 *hasHeat = ScriptGetVarPointer(ctx);
    u16 *hasWash = ScriptGetVarPointer(ctx);
    u16 *hasFrost = ScriptGetVarPointer(ctx);
    u16 *hasFan = ScriptGetVarPointer(ctx);
    u16 *hasMow = ScriptGetVarPointer(ctx);
    u32 flag;

    *hasHeat = FALSE;
    *hasWash = FALSE;
    *hasFrost = FALSE;
    *hasFan = FALSE;
    *hasMow = FALSE;

    flag = sub_020467A8(fsys->savedata);
    if (((flag >> ROTOM_HEAT) & 1) == 1) {
        *hasHeat = TRUE;
    }
    if (((flag >> ROTOM_WASH) & 1) == 1) {
        *hasWash = TRUE;
    }
    if (((flag >> ROTOM_FROST) & 1) == 1) {
        *hasFrost = TRUE;
    }
    if (((flag >> ROTOM_FAN) & 1) == 1) {
        *hasFan = TRUE;
    }
    if (((flag >> ROTOM_MOW) & 1) == 1) {
        *hasMow = TRUE;
    }
    return TRUE;
}

u32 sub_020467A8(SAVEDATA *saveData) {
    u32 ret = 0;
    PARTY *party = SavArray_PlayerParty_get(saveData);
    int partyCount = GetPartyCount(party);
    int i, j;

    for (i = 0; i < partyCount; i++) {
        POKEMON *pokemon = GetPartyMonByIndex(party, i);
        if (GetMonData(pokemon, MON_DATA_SPECIES, NULL) == SPECIES_ROTOM && !GetMonData(pokemon, MON_DATA_IS_EGG, NULL)) {
            ret |= 1 << GetMonData(pokemon, MON_DATA_FORME, NULL);
        }
    }

    DAYCARE *dayCare = Sav2_DayCare_get(saveData);
    for (i = 0; i < 2; i++) {
        BOXMON *boxmon = DayCareMon_GetBoxMon(Sav2_DayCare_GetMonX(dayCare, i));
        if (GetBoxMonData(boxmon, MON_DATA_SPECIES, NULL) == SPECIES_ROTOM && !GetBoxMonData(boxmon, MON_DATA_IS_EGG, NULL)) {
            ret |= 1 << GetBoxMonData(boxmon, MON_DATA_FORME, NULL);
        }
    }

    PC_STORAGE *pcStorage = GetStoragePCPointer(saveData);
    for (i = 0; i < (u32)NUM_BOXES; i++) {
        for (j = 0; j < MONS_PER_BOX; j++) {
            BOXMON *boxmon = PCStorage_GetMonByIndexPair(pcStorage, i, j);
            if (GetBoxMonData(boxmon, MON_DATA_SPECIES, NULL) == SPECIES_ROTOM && !GetBoxMonData(boxmon, MON_DATA_IS_EGG, NULL)) {
                ret |= 1 << GetBoxMonData(boxmon, MON_DATA_FORME, NULL);
            }
        }
    }

    POKEMON *walkerMon = AllocMonZeroed(32);
    BOXMON *walkerBoxMon = Mon_GetBoxMon(walkerMon);
    POKEWALKER *pokeWalker = Sav2_Pokewalker_get(saveData);
    if (Pokewalker_TryGetBoxMon(pokeWalker, walkerBoxMon)) {
        if (GetBoxMonData(walkerBoxMon, MON_DATA_SPECIES, NULL) == SPECIES_ROTOM && !GetBoxMonData(walkerBoxMon, MON_DATA_IS_EGG, NULL)) {
            ret |= 1 << GetBoxMonData(walkerBoxMon, MON_DATA_FORME, NULL);
        }
    }
    FreeToHeap(walkerMon);

    return ret;
}

BOOL ScrCmd_AddSpecialGameStat2(SCRIPTCONTEXT *ctx) {
    u16 statno = ScriptReadHalfword(ctx);
    GameStats_AddSpecial(Sav2_GameStats_get(ctx->fsys->savedata), statno);
    return FALSE;
}

BOOL ScrCmd_682(SCRIPTCONTEXT *ctx) {
    static u32 sHeap4Size;
    static u32 sHeap32Size;
    static u32 sHeap11Size;
    u16 action = ScriptGetVar(ctx);
    u32 heap11Size = GF_ExpHeap_FndGetTotalFreeSize(11);
    u32 heap4Size = GF_ExpHeap_FndGetTotalFreeSize(4);
    u32 heap32Size = GF_ExpHeap_FndGetTotalFreeSize(32);

    if (action == 0) {
        sHeap11Size = heap11Size;
        sHeap4Size = heap4Size;
        sHeap32Size = heap32Size;
    } else {
        GF_ASSERT(heap11Size == sHeap11Size);
        //GF_ASSERT(heap4Size == sHeap4Size);
        GF_ASSERT(heap32Size == sHeap32Size);
    }
    return FALSE;
}

BOOL ScrCmd_691(SCRIPTCONTEXT *ctx) {
    FieldSystem *fsys = ctx->fsys;
    u16 *p_ret = ScriptGetVarPointer(ctx);
    if (GF_RTC_DateTimeToSec() - fsys->unkB4 >= 120) {
        *p_ret = TRUE;
    } else {
        *p_ret = FALSE;
    }
    return FALSE;
}

BOOL ScrCmd_696(SCRIPTCONTEXT *ctx) {
    FieldSystem *fsys = ctx->fsys;
    u16 r5 = ScriptGetVar(ctx);
    PARTY *party = SavArray_PlayerParty_get(ctx->fsys->savedata);
    int i, partyCount;
    POKEMON *pokemon;

    Party_UpdateAllGiratina_DistortionWorld(party, r5);
    partyCount = GetPartyCount(party);
    for (i = 0; i < partyCount; i++) {
        pokemon = GetPartyMonByIndex(party, i);
        if (!GetMonData(pokemon, MON_DATA_IS_EGG, NULL)) {
            Pokedex_SetMonCaughtFlag(Sav2_Pokedex_get(fsys->savedata), pokemon);
        }
    }
    return FALSE;
}

BOOL ScrCmd_FollowerPokeIsEventTrigger(SCRIPTCONTEXT *ctx) {
    u8 r4 = ScriptReadByte(ctx);
    u16 r7 = ScriptGetVar(ctx);
    u16 *r6 = ScriptGetVarPointer(ctx);
    POKEMON *pokemon;
    int species;

    *r6 = 0;
    pokemon = GetPartyMonByIndex(SavArray_PlayerParty_get(ctx->fsys->savedata), r7);

    if (r4 >= 4) {
        return FALSE;
    }
    if (GetMonData(pokemon, MON_DATA_IS_EGG, NULL) || GetMonData(pokemon, MON_DATA_CHECKSUM_FAILED, NULL)) {
        return FALSE;
    }
    if (!sub_0208E9E0(r4, pokemon, GetMonData(pokemon, MON_DATA_OTID, NULL) == PlayerProfile_GetTrainerID(
        Sav2_PlayerData_GetProfileAddr(ctx->fsys->savedata)))) {
        return FALSE;
    }

    species = GetMonData(pokemon, MON_DATA_SPECIES, NULL);
    switch (r4) {
    case 0:
        if ((species == SPECIES_PICHU || species == SPECIES_PIKACHU || species == SPECIES_RAICHU) && MonIsShiny(pokemon)) {
            *r6 = 1;
        }
        break;
    case 1:
    case 2:
        if (species == SPECIES_ARCEUS) {
            *r6 = 1;
        }
        break;
    case 3:
        if (species == SPECIES_CELEBI) {
            *r6 = 1;
        }
        break;
    }

    return FALSE;
}

BOOL ScrCmd_596(SCRIPTCONTEXT *ctx) {
    FieldSystem *fsys = ctx->fsys;
    u16 *p_ret = ScriptGetVarPointer(ctx);
    *p_ret = ov01_022055DC(GetMapObjectByID(fsys->mapObjectMan, obj_partner_poke));
    return FALSE;
}

BOOL ScrCmd_597(SCRIPTCONTEXT *ctx) {
    FieldSystem *fsys = ctx->fsys;
    ov01_02203AB4(fsys, GetMapObjectByID(fsys->mapObjectMan, obj_partner_poke), 0);
    return TRUE;
}

BOOL ScrCmd_598(SCRIPTCONTEXT *ctx) {
    FieldSystem *fsys = ctx->fsys;
    u16 mode = ScriptReadHalfword(ctx);
    LocalMapObject *obj1, *obj2;
    if (mode == 1) {
        obj1 = PlayerAvatar_GetMapObject(fsys->playerAvatar);
        obj2 = FollowingPokemon_GetMapObject(fsys);
    } else if (mode == 2) {
        obj1 = FollowingPokemon_GetMapObject(fsys);
        obj2 = PlayerAvatar_GetMapObject(fsys->playerAvatar);
    } else {
        GF_ASSERT(0);
        return FALSE;
    }
    ov02_0224E0BC(obj1, obj2, ctx->taskman);
    return TRUE;
}

BOOL ScrCmd_599(SCRIPTCONTEXT *ctx) {
    ov01_02205AEC(ctx->fsys);
    return TRUE;
}

BOOL ScrCmd_600(SCRIPTCONTEXT *ctx) {
    if (ov01_02205D68(ctx->fsys)) {
        return TRUE;
    } else {
        return FALSE;
    }
}

BOOL ScrCmd_FollowPokeFacePlayer(SCRIPTCONTEXT *ctx) {
    BOOL doFace = TRUE;
    if (FollowingPokemon_IsActive(ctx->fsys)) {
        if (ov01_022055DC(FollowingPokemon_GetMapObject(ctx->fsys))) {
            LocalMapObject *myObject = PlayerAvatar_GetMapObject(FieldSys_GetPlayerAvatar(ctx->fsys));
            int facingDirection = PlayerAvatar_GetFacingDirection(FieldSys_GetPlayerAvatar(ctx->fsys));
            int playerX = MapObject_GetCurrentX(myObject);
            int deltaX = GetDeltaXByFacingDirection(facingDirection) * 2;
            int playerElev = MapObject_GetCurrentHeight(myObject);
            int playerY = MapObject_GetCurrentY(myObject);
            int deltaY = GetDeltaYByFacingDirection(facingDirection) * 2;
            u8 facingTile = GetMetatileBehaviorAt(ctx->fsys, playerX + deltaX, playerY + deltaY);
            VecFx32 posVec;
            MapObject_GetPositionVec(myObject, &posVec);
            if (sub_020549A8(ctx->fsys, &posVec, playerX + deltaX, playerY + deltaY, 0) || sub_0205B778(facingTile) || sub_02060BFC(myObject, playerX + deltaX, playerElev, playerY + deltaY)) {
                doFace = FALSE;
            }
        }
        if (doFace) {
            return ScrCmd_FacePlayer(ctx);
        }
    }
    return FALSE;
}

BOOL ScrCmd_602(SCRIPTCONTEXT *ctx) {
    u16 mode = ScriptReadHalfword(ctx);
    if (FollowingPokemon_IsActive(ctx->fsys)) {
        if (mode) {
            MapObject_PauseMovement(FollowingPokemon_GetMapObject(ctx->fsys));
        } else {
            MapObject_UnpauseMovement(FollowingPokemon_GetMapObject(ctx->fsys));
        }
    }
    return FALSE;
}

BOOL sub_02046D40(SCRIPTCONTEXT *ctx);

BOOL ScrCmd_603(SCRIPTCONTEXT *ctx) {
    if (FollowingPokemon_IsActive(ctx->fsys)) {
        SetupNativeScript(ctx, sub_02046D40);
    }
    return TRUE;
}

BOOL ScrCmd_604(SCRIPTCONTEXT *ctx) {
    u16 movement = ScriptReadHalfword(ctx);
    if (FollowingPokemon_IsActive(ctx->fsys)) {
        sub_0205FC94(GetMapObjectByID(ctx->fsys->mapObjectMan, obj_partner_poke), movement);
    }
    return TRUE;
}

BOOL sub_02046D40(SCRIPTCONTEXT *ctx) {
    if (MapObject_IsMovementPaused(FollowingPokemon_GetMapObject(ctx->fsys))) {
        return TRUE;
    } else {
        return FALSE;
    }
}

BOOL ScrCmd_605(SCRIPTCONTEXT *ctx) {
    u8 r6 = ScriptReadByte(ctx);
    u8 r4 = ScriptReadByte(ctx);
    if (FollowingPokemon_IsActive(ctx->fsys)) {
        LocalMapObject *playerObj = PlayerAvatar_GetMapObject(ctx->fsys->playerAvatar);
        LocalMapObject *tsurePokeObj = GetMapObjectByID(ctx->fsys->mapObjectMan, obj_partner_poke);
        ov01_02205720(playerObj, tsurePokeObj, r6, r4);
    }
    return FALSE;
}

BOOL ScrCmd_606(SCRIPTCONTEXT *ctx) {
    if (FollowingPokemon_IsActive(ctx->fsys)) {
        LocalMapObject *object = FollowingPokemon_GetMapObject(ctx->fsys);
        if (GetFollowPokePermissionBySpeciesAndMap(FollowPokeObj_GetSpecies(object), ctx->fsys->location->mapId)) {
            sub_02069E84(object, 1);
            sub_02069DEC(object, TRUE);
            ov01_02205790(ctx->fsys, 1);
        }
    }
    return FALSE;
}

BOOL ScrCmd_607(SCRIPTCONTEXT *ctx) {
    if (FollowingPokemon_IsActive(ctx->fsys)) {
        LocalMapObject *object = FollowingPokemon_GetMapObject(ctx->fsys);
        if (GetFollowPokePermissionBySpeciesAndMap(FollowPokeObj_GetSpecies(object), ctx->fsys->location->mapId)) {
            ov01_02205790(ctx->fsys, 1);
        }
    }
    return FALSE;
}

BOOL ScrCmd_608(SCRIPTCONTEXT *ctx) {
    if (FollowingPokemon_IsActive(ctx->fsys)) {
        LocalMapObject *object = GetMapObjectByID(ctx->fsys->mapObjectMan, obj_partner_poke);
        ov01_02205784(object);
    }
    return FALSE;
}

BOOL ScrCmd_609(SCRIPTCONTEXT *ctx) {
    if (FollowingPokemon_IsActive(ctx->fsys)) {
        LocalMapObject *object = GetMapObjectByID(ctx->fsys->mapObjectMan, obj_partner_poke);
        sub_020659CC(object);
    }
    return TRUE;
}

BOOL ScrCmd_610(SCRIPTCONTEXT *ctx) {
    u16 r1 = ScriptReadHalfword(ctx);
    ov01_021EACBC(ctx->fsys->unk28, r1);
    return TRUE;
}

BOOL ScrCmd_Pokeathlon(SCRIPTCONTEXT *ctx) {
    u8 r6 = ScriptReadByte(ctx);
    u8 r4 = ScriptReadByte(ctx);
    u16 r7 = ScriptGetVar(ctx);
    u16 *sp10 = ScriptGetVarPointer(ctx);
    u16 *sp14 = ScriptGetVarPointer(ctx);
    u16 *sp18 = ScriptGetVarPointer(ctx);
    u16 *spC = ScriptGetVarPointer(ctx);
    sub_02095DF4(ctx->fsys, r6, r4, r7, sp10, sp14, sp18, spC);
    return TRUE;
}

BOOL ScrCmd_GetFriendSprite(SCRIPTCONTEXT *ctx) {
    u16 *p_ret = ScriptGetVarPointer(ctx);
    if (PlayerProfile_GetTrainerGender(Sav2_PlayerData_GetProfileAddr(Fsys_GetSaveDataPtr(ctx->fsys))) != PLAYER_GENDER_MALE) {
        *p_ret = SPRITE_HERO;
    } else {
        *p_ret = SPRITE_HEROINE;
    }
    return TRUE;
}

BOOL ScrCmd_RegisterPokegearCard(SCRIPTCONTEXT *ctx) {
    SavePokegear *pokegear = SaveData_GSPlayerMisc_get(Fsys_GetSaveDataPtr(ctx->fsys));
    u8 card = ScriptReadByte(ctx);
    switch (card) {
    case 1:
        Pokegear_RegisterCard(pokegear, 1);
        break;
    case 2:
        Pokegear_RegisterCard(pokegear, 2);
        break;
    case 0:
    default:
        Pokegear_RegisterCard(pokegear, 0);
        break;
    }
    return FALSE;
}

BOOL ScrCmd_804(SCRIPTCONTEXT *ctx) {
    sub_0202EE58(SaveData_GSPlayerMisc_get(ctx->fsys->savedata), ScriptReadByte(ctx));
    return FALSE;
}

BOOL ScrCmd_RegisterGearNumber(SCRIPTCONTEXT *ctx) {
    SavePokegear *pokegear = SaveData_GSPlayerMisc_get(Fsys_GetSaveDataPtr(ctx->fsys));
    u8 number = ScriptGetVar(ctx);
    if (number < NUM_PHONE_CONTACTS) {
        RegisterPhoneNumberInPokeGear(pokegear, number);
    }
    return FALSE;
}

BOOL ScrCmd_CheckRegisteredPhoneNumber(SCRIPTCONTEXT *ctx) {
    SavePokegear *pokegear = SaveData_GSPlayerMisc_get(Fsys_GetSaveDataPtr(ctx->fsys));
    u8 number = ScriptGetVar(ctx);
    u16 *p_ret = ScriptGetVarPointer(ctx);
    if (number < NUM_PHONE_CONTACTS) {
        *p_ret = GSPlayerMisc_IsGearNumberRegistered(pokegear, number);
        if (*p_ret == 0xFF) {
            *p_ret = FALSE;
        } else {
            *p_ret = TRUE;
        }
    } else {
        *p_ret = FALSE;
    }
    return FALSE;
}

BOOL ScrCmd_SetPhoneCall(SCRIPTCONTEXT *ctx) {
    u16 r4 = ScriptGetVar(ctx);
    u16 r6 = ScriptGetVar(ctx);
    u16 r7 = ScriptGetVar(ctx);
    void **p_work = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_AC);
    sub_02092DF4(Fsys_GetGearPhoneRingManager(ctx->fsys));
    ctx->fsys->unkD2_7 = TRUE;
    ov02_02251EB8(Fsys_GetGearPhoneRingManager(ctx->fsys), r4, 0xFF, 0, r6, r7);
    return TRUE;
}

BOOL ScrCmd_RunPhoneCall(SCRIPTCONTEXT *ctx) {
    void **p_work = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_AC);
    *p_work = PhoneUI_new(ctx->fsys);
    SetupNativeScript(ctx, ScrNative_WaitApplication_DestroyTaskData);
    return TRUE;
}

BOOL ScrCmd_LoadPhoneDat(SCRIPTCONTEXT *ctx) {
    u16 idx = ScriptGetVar(ctx);
    u16 *p_ret = ScriptGetVarPointer(ctx);
    *p_ret = LoadPhoneBookEntryI(idx, sub_02092E10(Fsys_GetGearPhoneRingManager(ctx->fsys)), 32);
    return FALSE;
}

BOOL ScrCmd_GetPhoneContactMsgIds(SCRIPTCONTEXT *ctx) {
    u16 *p_scriptno = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_SCRIPT);
    u8 r6 = ScriptReadByte(ctx);
    u16 *sp0 = ScriptGetVarPointer(ctx);
    u16 *p_ret_msg = ScriptGetVarPointer(ctx);
    PhoneBookEntry *entry = sub_02092E10(Fsys_GetGearPhoneRingManager(ctx->fsys));
    *sp0 = GetPhoneMessageGmm(entry->unk0);
    u16 r5, p_ret_gmm;

    if (entry->unk0 == 0xFF) {
        *p_ret_msg = 0;
        return TRUE;
    }
    if (r6 > 4) {
        r6 = 0;
    }
    p_ret_gmm = ScriptNumToTrainerNum(*p_scriptno);
    r5 = r6 + 1;
    if (p_ret_gmm >= LAST_TRAINER_INDEX) {
        *p_ret_msg = r5;
    } else if ((u16)TrainerNumIsDouble(ScriptNumToTrainerNum(*p_scriptno)) == FALSE) {
        *p_ret_msg = r5;
    } else {
        ScriptNoToDoublePartnerNo(*p_scriptno);
        *p_ret_msg = r5;
    }
    return FALSE;
}

BOOL ScrCmd_462(SCRIPTCONTEXT *ctx) {
    u16 idx = ScriptGetVar(ctx);
    PhoneRematches_SetSeeking(SaveData_GetMomsSavingsAddr(ctx->fsys->savedata), idx, FALSE);
    return FALSE;
}

BOOL ScrCmd_GetPhoneContactRandomGiftBerry(SCRIPTCONTEXT *ctx) {
    u16 *p_ret = ScriptGetVarPointer(ctx);
    PhoneBookEntry *entry = sub_02092E10(Fsys_GetGearPhoneRingManager(ctx->fsys));
    if (entry->gift == ITEM_CHERI_BERRY) {
        *p_ret = ITEM_CHERI_BERRY + (LCRandom() % 10);
    } else {
        *p_ret = entry->gift;
    }
    return FALSE;
}

BOOL ScrCmd_GetPhoneContactGiftItem(SCRIPTCONTEXT *ctx) {
    u16 *p_ret = ScriptGetVarPointer(ctx);
    PhoneBookEntry *entry = sub_02092E10(Fsys_GetGearPhoneRingManager(ctx->fsys));
    MomsSavings *momsSavings = SaveData_GetMomsSavingsAddr(ctx->fsys->savedata);
    *p_ret = PhoneRematches_GiftItemIdGet(momsSavings, entry->unk0);
    PhoneRematches_GiftItemIdSet(momsSavings, entry->unk0, ITEM_NONE);
    return FALSE;
}

BOOL ScrCmd_148(SCRIPTCONTEXT *ctx) {
    u8 r4 = ScriptReadByte(ctx);
    sub_02092E14(Fsys_GetGearPhoneRingManager(ctx->fsys), r4, ScriptReadByte(ctx));
    return FALSE;
}

BOOL ScrCmd_149(SCRIPTCONTEXT *ctx) {
    sub_0202F050(SaveData_GetMomsSavingsAddr(ctx->fsys->savedata), ScriptReadByte(ctx));
    return FALSE;
}

BOOL ScrCmd_CameronPhoto(SCRIPTCONTEXT *ctx) {
    u16 photo_num = ScriptReadHalfword(ctx);
    FieldSys_TakePhoto(ctx->fsys, photo_num);
    return TRUE;
}

BOOL ScrCmd_616(SCRIPTCONTEXT *ctx) {
    u16 *p_ret = ScriptGetVarPointer(ctx);
    *p_ret = PhotoAlbum_GetNumSaved(Save_PhotoAlbum_get(ctx->fsys->savedata));
    return FALSE;
}

BOOL ScrCmd_617(SCRIPTCONTEXT *ctx) {
    sub_0206A860(ctx->fsys);
    return TRUE;
}

BOOL ScrCmd_621(SCRIPTCONTEXT *ctx) {
    FieldSystem *fsys = ctx->fsys;
    const struct UnkStruct_020FACDC sp4[3] = {
        {0x00083000, 0x00000000, 0x00041000},
        {0x0008D000, 0x00000000, 0x00041000},
        {0x00088000, 0x00000000, 0x00048000},
    };
    int n, i;

    int partyCount = GetPartyCount(SavArray_PlayerParty_get(fsys->savedata));
    if (FlagGet(fsys, FLAG_GOT_TM51_FROM_FALKNER)) {
        n = 0;
    } else if (FlagGet(fsys, FLAG_MET_PASSERBY_BOY)) {
        n = 1;
    } else if (partyCount > 0) {
        n = 2;
    } else {
        n = 3;
    }
    for (i = 0; i < n; i++) {
        ov01_021F3C0C(fsys->unk9C, 0x8D, &sp4[i], 0, fsys->unk54);
    }
    return FALSE;
}

BOOL ScrCmd_622(SCRIPTCONTEXT *ctx) {
    u16 objectId = ScriptReadHalfword(ctx);
    u16 *p_ret = ScriptGetVarPointer(ctx);
    LocalMapObject *object = GetMapObjectByID(ctx->fsys->mapObjectMan, objectId);
    if (object != NULL) {
        *p_ret = MapObject_GetFacingDirection(object);
    } else {
        *p_ret = DIR_NORTH;
    }
    return FALSE;
}

BOOL ScrCmd_FollowPokeInteract(SCRIPTCONTEXT *ctx) {
    Fsys_FollowPokeInteract(ctx->fsys);
    return TRUE;
}

BOOL ScrCmd_712(SCRIPTCONTEXT *ctx) {
    void **p_work = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_AC);
    u8 action = ScriptReadByte(ctx);
    switch (action) {
    case 1:
        *p_work = sub_0203EEE4(ctx->fsys);
        break;
    case 2:
        *p_work = sub_0203EF40(ctx->fsys);
        break;
    case 3:
        *p_work = sub_0203EFA0(ctx->fsys);
        break;
    default:
    case 0:
        *p_work = sub_0203EEA0(ctx->fsys);
        break;
    }
    SetupNativeScript(ctx, ScrNative_WaitApplication_DestroyTaskData);
    return TRUE;
}

BOOL ScrCmd_AlphPuzzle(SCRIPTCONTEXT *ctx) {
    void **p_work = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_AC);
    u8 puzzle = ScriptReadByte(ctx);
    if (puzzle > 4) {
        puzzle = 0;
    }
    *p_work = Fsys_CreateApplication_AlphPuzzle(ctx->fsys, puzzle);
    SetupNativeScript(ctx, ScrNative_WaitApplication_DestroyTaskData);
    return TRUE;
}

BOOL ScrCmd_722(SCRIPTCONTEXT *ctx) {
    u8 r7 = ScriptReadByte(ctx);
    u8 r6 = ScriptReadByte(ctx);
    u16 sp8 = ScriptReadHalfword(ctx);
    u16 r4 = ScriptReadHalfword(ctx);
    u16 sp4 = ScriptReadHalfword(ctx);
    sub_020977CC(ctx->fsys, r7, r6, sp8, r4, sp4);
    return TRUE;
}

BOOL ScrCmd_723(SCRIPTCONTEXT *ctx) {
    u8 r7 = ScriptReadByte(ctx);
    u8 r6 = ScriptReadByte(ctx);
    u16 sp8 = ScriptReadHalfword(ctx);
    u16 r4 = ScriptReadHalfword(ctx);
    u16 sp4 = ScriptReadHalfword(ctx);
    sub_020979A8(ctx->fsys, r7, r6, sp8, r4, sp4);
    return TRUE;
}

BOOL ScrCmd_Cinematic(SCRIPTCONTEXT *ctx) {
    u16 scene = ScriptReadHalfword(ctx);
    sub_02097BE0(ctx->fsys, scene);
    return TRUE;
}

BOOL ScrCmd_727(SCRIPTCONTEXT *ctx) {
    u16 *p_ret = ScriptGetVarPointer(ctx);
    *p_ret = GetIdxOfFirstAliveMonInParty_CrashIfNone(SavArray_PlayerParty_get(ctx->fsys->savedata));
    return FALSE;
}

BOOL ScrCmd_728(SCRIPTCONTEXT *ctx) {
    u8 r1 = ScriptReadByte(ctx);
    u8 r2 = ScriptReadByte(ctx);
    if (ov01_022060B8(ctx->fsys, r1, r2)) {
        return TRUE;
    } else {
        return FALSE;
    }
}

BOOL ScrCmd_729(SCRIPTCONTEXT *ctx) {
    u16 *p_ret = ScriptGetVarPointer(ctx);
    if (FollowingPokemon_IsActive(ctx->fsys)) {
        *p_ret = TRUE;
    } else {
        *p_ret = FALSE;
    }
    return FALSE;
}

BOOL ScrCmd_730(SCRIPTCONTEXT *ctx) {
    u16 *p_ret = ScriptGetVarPointer(ctx);
    if (!FollowingPokemon_IsActive(ctx->fsys)) {
        *p_ret = TRUE;
    } else if (ov01_022057C4(ctx->fsys)) {
        *p_ret = TRUE;
    } else {
        *p_ret = FALSE;
    }
    return FALSE;
}

BOOL ScrCmd_731(SCRIPTCONTEXT *ctx) {
    ov02_022508B4(ctx->fsys);
    return TRUE;
}

BOOL ScrCmd_732(SCRIPTCONTEXT *ctx) {
    s8 mood = ScriptReadByte(ctx);
    FsysUnkSub108_AddMonMood(ctx->fsys->unk108, mood);
    return FALSE;
}

BOOL ScrCmd_733(SCRIPTCONTEXT *ctx) {
    u8 r6 = ScriptReadByte(ctx);
    u16 *p_ret = ScriptGetVarPointer(ctx);
    if (ov02_02250780(ctx->fsys, r6)) {
        *p_ret = TRUE;
    } else {
        *p_ret = FALSE;
    }
    return FALSE;
}

BOOL ScrCmd_734(SCRIPTCONTEXT *ctx) {
    u8 r1 = ScriptReadByte(ctx);
    ov02_022507B4(ctx->fsys, r1);
    return TRUE;
}

BOOL sub_020476E8(SCRIPTCONTEXT *ctx);

BOOL ScrCmd_TouchscreenMenuHide(SCRIPTCONTEXT *ctx) {
    FieldSystem *fsys = ctx->fsys;
    if (ov01_021F6B00(fsys) == 3) {
        return FALSE;
    }
    ov01_021F6A9C(fsys, 3, 0);
    SetupNativeScript(ctx, sub_020476E8);
    fsys->unk1C = 3;
    return TRUE;
}

BOOL sub_020476E8(SCRIPTCONTEXT *ctx) {
    FieldSystem *fsys = ctx->fsys;
    u16 *p_ret = GetVarPointer(fsys, ctx->data[0]);
    int r5 = ov01_021F6B00(fsys);
    int r0 = ov01_021F6B10(fsys);
    if (r5 == 3 && r0 == 1) {
        return TRUE;
    } else {
        return FALSE;
    }
}

BOOL sub_02047744(SCRIPTCONTEXT *ctx);

BOOL ScrCmd_TouchscreenMenuShow(SCRIPTCONTEXT *ctx) {
    FieldSystem *fsys = ctx->fsys;
    ov01_021F6A9C(fsys, 0, 0);
    SetupNativeScript(ctx, sub_02047744);
    fsys->unk1C = 0;
    return TRUE;
}

BOOL sub_02047744(SCRIPTCONTEXT *ctx) {
    FieldSystem *fsys = ctx->fsys;
    u16 *p_ret = GetVarPointer(fsys, ctx->data[0]);
    int r5 = ov01_021F6B00(fsys);
    int r0 = ov01_021F6B10(fsys);
    if (r5 == 0 && r0 == 1) {
        return TRUE;
    } else {
        return FALSE;
    }
}

BOOL ScrCmd_815(SCRIPTCONTEXT *ctx) {
    FieldSystem *fsys = ctx->fsys;
    u16 r1 = ScriptReadHalfword(ctx);
    sub_0203E33C(fsys, r1);
    return FALSE;
}

BOOL sub_020477C0(SCRIPTCONTEXT *ctx);

BOOL ScrCmd_GetMenuChoice(SCRIPTCONTEXT *ctx) {
    FieldSystem *fsys = ctx->fsys;
    u16 var_ret = ScriptReadHalfword(ctx);
    ctx->data[0] = var_ret;
    ov01_021F6ABC(fsys, 3, 3, &ctx->data[1]);
    SetupNativeScript(ctx, sub_020477C0);
    return TRUE;
}

BOOL sub_020477C0(SCRIPTCONTEXT *ctx) {
    FieldSystem *fsys = ctx->fsys;
    u16 *p_ret = GetVarPointer(fsys, ctx->data[0]);
    int r7 = ov01_021F6B00(fsys);
    int r0 = ov01_021F6AEC(fsys);
    if (r7 == 3 && r0 == 6) {
        *p_ret = ctx->data[1];
        return TRUE;
    } else {
        return FALSE;
    }
}

BOOL ScrCmd_MenuInitStdGmm(SCRIPTCONTEXT *ctx) {
    sub_02041770(ctx, ov01_021F6B20(ctx->fsys), NULL);
    return TRUE;
}

BOOL ScrCmd_MenuInit(SCRIPTCONTEXT *ctx) {
    sub_02041770(ctx, ov01_021F6B20(ctx->fsys), ctx->msg_data);
    return TRUE;
}

BOOL ScrCmd_MenuItemAdd(SCRIPTCONTEXT *ctx) {
    struct UnkStruct_ov01_021EDC28 **p_menu = ov01_021F6B20(ctx->fsys);
    u16 msgId = ScriptGetVar(ctx);
    u16 where = ScriptGetVar(ctx);
    u16 value = ScriptGetVar(ctx);
    MoveTutorMenu_SetListItem(*p_menu, msgId, where, value);
    return FALSE;
}

BOOL sub_020478D0(SCRIPTCONTEXT *ctx);
BOOL sub_02047908(struct UnkStruct_ov01_021EDC28 *menu, int idx);

BOOL ScrCmd_MenuExec(SCRIPTCONTEXT *ctx) {
    FieldSystem *fsys = ctx->fsys;
    struct UnkStruct_ov01_021EDC28 **p_menu = ov01_021F6B20(fsys);
    u16 *p_ret = GetVarPointer(fsys, ctx->data[0]);
    ov01_021F6ABC(fsys, 3, 7, p_ret);
    ov01_021F6B34(fsys, sub_02047908, *p_menu);
    SetupNativeScript(ctx, sub_020478D0);
    return TRUE;
}

BOOL sub_020478D0(SCRIPTCONTEXT *ctx) {
    FieldSystem *fsys = ctx->fsys;
    struct UnkStruct_ov01_021EDC28 **p_menu = ov01_021F6B20(fsys);
    u16 *p_ret = GetVarPointer(fsys, ctx->data[0]);
    if (*p_ret == 0xEEEE) {
        return FALSE;
    } else {
        ov01_021EDF00(*p_menu);
        return TRUE;
    }
}

BOOL sub_02047908(struct UnkStruct_ov01_021EDC28 *menu, int idx) {
    ov01_021EEF9C(menu, idx);
    return FALSE;
}

u32 GetMaxBankTransactionAmount(FieldSystem *fsys, int action) {
    u32 ret;
    u32 wallet = PlayerProfile_GetMoney(Sav2_PlayerData_GetProfileAddr(fsys->savedata));
    u32 bank = MomSavingsBalanceAction(SaveData_GetMomsSavingsAddr(fsys->savedata), MOMS_BALANCE_GET, 0);
    switch (action) {
    case 0:
        ret = MAX_MONEY - bank;
        if (wallet <= ret) {
            ret = wallet;
        }
        break;
    case 1:
        ret = MAX_MONEY - wallet;
        if (bank <= ret) {
            ret = bank;
        }
        break;
    default:
        GF_ASSERT(0);
    }
    return ret;
}

BOOL sub_020479D4(SCRIPTCONTEXT *ctx);

BOOL ScrCmd_BankTransaction(SCRIPTCONTEXT *ctx) {
    struct BankTransactionWork **p_work = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_GENERIC_WORK_PTR);
    u16 mode = ScriptReadHalfword(ctx);
    u16 var_ret = ScriptReadHalfword(ctx);
    struct BankTransactionWork *work = *p_work = AllocFromHeap(4, sizeof(struct BankTransactionWork)); // statement must be this way to match
    work->sub = AllocFromHeap(4, sizeof(struct BankTransactionWorkSub));
    work->mode = mode;
    work->sub->max = GetMaxBankTransactionAmount(ctx->fsys, mode);
    work->sub->selected = -1;
    ov01_021F6A9C(ctx->fsys, 5, work->sub);
    ctx->data[0] = var_ret;
    SetupNativeScript(ctx, sub_020479D4);
    return TRUE;
}

BOOL sub_020479D4(SCRIPTCONTEXT *ctx) {
    struct BankTransactionWork **p_work = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_GENERIC_WORK_PTR);
    u16 *p_ret = GetVarPointer(ctx->fsys, ctx->data[0]);
    struct BankTransactionWork *work = *p_work;
    if (work->sub->selected == -1) {
        return FALSE;
    } else if (work->sub->selected == 0) {
        *p_ret = 1;
    } else {
        SAVEDATA *saveData = ctx->fsys->savedata;
        switch (work->mode) {
        case 0:
            PlayerProfile_SubMoney(Sav2_PlayerData_GetProfileAddr(saveData), work->sub->selected);
            MomSavingsBalanceAction(SaveData_GetMomsSavingsAddr(saveData), MOMS_BALANCE_ADD, work->sub->selected);
            break;
        case 1:
            PlayerProfile_AddMoney(Sav2_PlayerData_GetProfileAddr(saveData), work->sub->selected);
            MomSavingsBalanceAction(SaveData_GetMomsSavingsAddr(saveData), MOMS_BALANCE_SUB, work->sub->selected);
            break;
        default:
            GF_ASSERT(0);
            break;
        }
        *p_ret = 0;
    }
    FreeToHeap(work->sub);
    FreeToHeap(*p_work);
    return TRUE;
}

BOOL ScrCmd_BankOrWalletIsFull(SCRIPTCONTEXT *ctx) {
    u16 action = ScriptReadHalfword(ctx);
    u16 *p_ret = ScriptGetVarPointer(ctx);
    if (action == 0) {
        if (MomSavingsBalanceAction(SaveData_GetMomsSavingsAddr(ctx->fsys->savedata), MOMS_BALANCE_GET, 0) == MAX_MONEY) {
            *p_ret = TRUE;
        } else {
            *p_ret = FALSE;
        }
    } else {
        if (PlayerProfile_GetMoney(Sav2_PlayerData_GetProfileAddr(ctx->fsys->savedata)) == MAX_MONEY) {
            *p_ret = TRUE;
        } else {
            *p_ret = FALSE;
        }
    }
    return TRUE;
}

BOOL ScrCmd_RockSmashItemCheck(SCRIPTCONTEXT *ctx) {
    u16 followMonKnowsHm = ScriptGetVar(ctx);
    u16 *itemFound = ScriptGetVarPointer(ctx);
    u16 *item = ScriptGetVarPointer(ctx);
    FieldSys_RockSmashItemCheck(ctx->fsys, (u8)followMonKnowsHm, itemFound, item);
    return TRUE;
}

BOOL ScrCmd_754(SCRIPTCONTEXT *ctx) {
    u16 *r1 = ScriptGetVarPointer(ctx);
    ov01_02204ED8(ctx->fsys, r1);
    return TRUE;
}

BOOL ScrCmd_755(SCRIPTCONTEXT *ctx) {
    ov02_02250A60(ctx->fsys);
    return FALSE;
}

BOOL ScrCmd_756(SCRIPTCONTEXT *ctx) {
    ov02_02250AC8(ctx->fsys);
    return FALSE;
}

BOOL ScrCmd_757(SCRIPTCONTEXT *ctx) {
    ov02_02250AE8(ctx->fsys);
    return FALSE;
}

BOOL ScrCmd_758(SCRIPTCONTEXT *ctx) {
    u8 r1 = ScriptReadHalfword(ctx);
    ov02_02250AFC(ctx->fsys, r1);
    return TRUE;
}

BOOL ScrCmd_759(SCRIPTCONTEXT *ctx) {
    ov02_02250B80(ctx->fsys);
    return TRUE;
}

BOOL ScrCmd_760(SCRIPTCONTEXT *ctx) {
    ov02_02250B30(ctx->fsys);
    return TRUE;
}

BOOL ScrCmd_761(SCRIPTCONTEXT *ctx) {
    u8 r1 = ScriptReadHalfword(ctx);
    ov02_02251424(ctx->fsys, r1);
    return FALSE;
}

BOOL ScrCmd_762(SCRIPTCONTEXT *ctx) {
    u8 r1 = ScriptReadHalfword(ctx);
    ov02_022514C8(ctx->fsys, r1);
    return FALSE;
}

BOOL ScrCmd_763(SCRIPTCONTEXT *ctx) {
    ov02_02251554(ctx->fsys);
    return TRUE;
}

BOOL ScrCmd_764(SCRIPTCONTEXT *ctx) {
    ov02_022515A4(ctx->fsys);
    return TRUE;
}

BOOL ScrCmd_765(SCRIPTCONTEXT *ctx) {
    ov02_022518E0(ctx->fsys);
    return FALSE;
}

BOOL ScrCmd_766(SCRIPTCONTEXT *ctx) {
    ov02_02251B14(ctx->fsys);
    return FALSE;
}

BOOL ScrCmd_767(SCRIPTCONTEXT *ctx) {
    ov02_02251CF0(ctx->fsys);
    return FALSE;
}

BOOL ScrCmd_768(SCRIPTCONTEXT *ctx) {
    ov02_02251DC4(ctx->fsys);
    return FALSE;
}

BOOL ScrCmd_769(SCRIPTCONTEXT *ctx) {
    ov02_02251DE8(ctx->fsys);
    return TRUE;
}

BOOL ScrCmd_SetFollowPokeInhibitState(SCRIPTCONTEXT *ctx) {
    SavFollowPoke_SetInhibitFlagState(Sav2_FollowPoke_get(ctx->fsys->savedata), ScriptReadByte(ctx));
    return FALSE;
}

// Loads an overlay containing additional script commands or data
BOOL ScrCmd_ScriptOverlayCmd(SCRIPTCONTEXT *ctx) {
    u8 ovy = ScriptReadByte(ctx);
    u8 action = ScriptReadByte(ctx);

    static const FSOverlayID _020FACB0[] = {
        FS_OVERLAY_ID(OVY_20),
        FS_OVERLAY_ID(bug_contest),
        FS_OVERLAY_ID(OVY_21),
        FS_OVERLAY_ID(OVY_22),
        FS_OVERLAY_ID(OVY_25),
    };

    if (ovy >= NELEMS(_020FACB0)) {
        return FALSE;
    }

    if (action == 0) {
        HandleLoadOverlay(_020FACB0[ovy], OVY_LOAD_ASYNC);
    } else {
        UnloadOverlayByID(_020FACB0[ovy]);
    }

    return FALSE;
}

BOOL ScrCmd_CheckBankBalance(SCRIPTCONTEXT *ctx) {
    u16 *p_ret = ScriptGetVarPointer(ctx);
    u32 check_amt = ScriptReadWord(ctx);
    if (MomSavingsBalanceAction(SaveData_GetMomsSavingsAddr(ctx->fsys->savedata), MOMS_BALANCE_GET, 0) >= check_amt) {
        *p_ret = TRUE;
    } else {
        *p_ret = FALSE;
    }
    return FALSE;
}

BOOL ScrCmd_BufferRulesetName(SCRIPTCONTEXT *ctx) {
    u16 ruleset = ScriptReadHalfword(ctx);
    MSGFMT **p_msgFmt = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_MSGFMT);
    ov03_022566D0(ctx->fsys, *p_msgFmt, ruleset);
    return FALSE;
}

BOOL ScrCmd_799(SCRIPTCONTEXT *ctx) {
    u16 *p_var = ScriptGetVarPointer(ctx);
    MSGFMT **p_msgFmt = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_MSGFMT);
    ov03_022566D0(ctx->fsys, *p_msgFmt, *p_var);
    return FALSE;
}

BOOL ScrCmd_800(SCRIPTCONTEXT *ctx) {
    u16 *p_var = ScriptGetVarPointer(ctx);
    ov03_02256710(ctx->fsys, *p_var);
    return FALSE;
}

BOOL ScrCmd_801(SCRIPTCONTEXT *ctx) {
    WINDOW **p_moneyBox = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_MONEY_BOX);
    u16 *p_var = ScriptGetVarPointer(ctx);
    *p_moneyBox = ov01_021EEF68(ctx->fsys, *p_var);
    return FALSE;
}

BOOL ScrCmd_802(SCRIPTCONTEXT *ctx) {
    WINDOW **p_moneyBox = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_MONEY_BOX);
    ov01_021EEF88(*p_moneyBox);
    return FALSE;
}

BOOL ScrCmd_803(SCRIPTCONTEXT *ctx) {
    u16 *r4 = ScriptGetVarPointer(ctx);
    u16 *r6 = ScriptGetVarPointer(ctx);
    MSGFMT **p_msgFmt = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_MSGFMT);
    *r6 = ov03_02256A2C(ctx->fsys, *p_msgFmt, *r4);
    return FALSE;
}

BOOL ScrCmd_805(SCRIPTCONTEXT *ctx) {
    sub_02004B24(75);
    return FALSE;
}

BOOL ScrCmd_806(SCRIPTCONTEXT *ctx) {
    ov02_022523B4(ctx->fsys->taskman);
    return TRUE;
}

BOOL ScrCmd_810(SCRIPTCONTEXT *ctx) {
    ov02_02252534(ctx->fsys);
    return TRUE;
}

BOOL ScrCmd_814(SCRIPTCONTEXT *ctx) {
    SetFlag99A(SavArray_Flags_get(ctx->fsys->savedata));
    return FALSE;
}

BOOL ScrCmd_UnownCircle(SCRIPTCONTEXT *ctx) {
    ov02_022529FC(ctx->fsys);
    return TRUE;
}

BOOL ScrCmd_817(SCRIPTCONTEXT *ctx) {
    ov02_02252EE4(ctx->fsys, ScriptReadByte(ctx));
    return TRUE;
}

BOOL ScrCmd_MystriStageGymmickInit(SCRIPTCONTEXT *ctx) {
    Fsys_InitMystriStageGymmick(ctx->fsys);
    return FALSE;
}

BOOL ScrCmd_819(SCRIPTCONTEXT *ctx) {
    ov04_02256ED8(ctx->fsys);
    return FALSE;
}

BOOL ScrCmd_820(SCRIPTCONTEXT *ctx) {
    ov04_02256F00(ctx->fsys, ScriptReadByte(ctx));
    return TRUE;
}

BOOL ScrCmd_822(SCRIPTCONTEXT *ctx) {
    ov03_02258910(ctx->fsys);
    return TRUE;
}

BOOL ScrCmd_823(SCRIPTCONTEXT *ctx) {
    u16 *p_var = ScriptGetVarPointer(ctx);
    MSGFMT **p_msgFmt = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_MSGFMT);
    PLAYERPROFILE *profile = PlayerProfile_new(4);
    SafariZone_GetLinkLeaderToProfile(Save_SafariZone_get(ctx->fsys->savedata), profile);
    BufferPlayersName(*p_msgFmt, *p_var, profile);
    FreeToHeap(profile);
    return FALSE;
}

BOOL ScrCmd_824(SCRIPTCONTEXT *ctx) {
    SAFARIZONE *safariZone = Save_SafariZone_get(ctx->fsys->savedata);
    u16 *p_ret = ScriptGetVarPointer(ctx);
    SafariZone_DeactivateLinkIfExpired(safariZone);
    if (SafariZone_IsCurrentlyLinked(safariZone)) {
        *p_ret = TRUE;
    } else {
        *p_ret = FALSE;
    }
    return FALSE;
}

BOOL ScrCmd_829(SCRIPTCONTEXT *ctx) {
    u16 *p_ret = ScriptGetVarPointer(ctx);
    if (ov01_02206268(ctx->fsys)) {
        *p_ret = TRUE;
    } else {
        *p_ret = FALSE;
    }
    return FALSE;
}

BOOL ScrCmd_830(SCRIPTCONTEXT *ctx) {
    u16 *p_ret = ScriptGetVarPointer(ctx);
    if (ov02_02253134(ctx->fsys->savedata) == TRUE) {
        *p_ret = TRUE;
    } else {
        *p_ret = FALSE;
    }
    return FALSE;
}

BOOL ScrCmd_831(SCRIPTCONTEXT *ctx) {
    u16 *p_ret = ScriptGetVarPointer(ctx);
    *p_ret = ov02_0225316C();
    return FALSE;
}

BOOL ScrCmd_832(SCRIPTCONTEXT *ctx) {
    u16 *p_ret = ScriptGetVarPointer(ctx);
    if (ov02_02253188(ctx->fsys->savedata) == TRUE) {
        *p_ret = TRUE;
    } else {
        *p_ret = FALSE;
    }
    return FALSE;
}

BOOL ScrCmd_833(SCRIPTCONTEXT *ctx) {
    u16 *p_ret = ScriptGetVarPointer(ctx);
    *p_ret = ov02_022531B4(ctx->fsys->savedata);
    return FALSE;
}

BOOL ScrCmd_837(SCRIPTCONTEXT *ctx) {
    u16 *p_ret = ScriptGetVarPointer(ctx);
    if (sub_020291A4(ctx->fsys->savedata, 0)) {
        *p_ret = TRUE;
    } else {
        *p_ret = FALSE;
    }
    return FALSE;
}
