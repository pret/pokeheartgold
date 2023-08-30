#define _IN_SCRCMD_C

#include "scrcmd.h"
#include "bg_window.h"
#include "overlay_01.h"
#include "overlay_01_02204ED8.h"
#include "overlay_26.h"
#include "overlay_03.h"
#include "overlay_04.h"
#include "system.h"
#include "task.h"
#include "text.h"
#include "render_window.h"
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
#include "metatile_behavior.h"
#include "unk_0203E348.h"
#include "unk_02055418.h"
#include "unk_020932A4.h"
#include "unk_02092BE8.h"
#include "unk_02097024.h"
#include "unk_020552A4.h"
#include "unk_02078834.h"
#include "unk_020961D8.h"
#include "unk_02055244.h"
#include "field_system.h"
#include "fashion_case.h"
#include "save_local_field_data.h"
#include "unk_0206B910.h"
#include "pokegear.h"
#include "unk_02068FC8.h"
#include "game_clear.h"
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
#include "encounter.h"
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
#include "gymmick_init.h"
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
#include "msgdata/msg.naix"
#include "msgdata/msg/msg_0202.h"
#include "constants/accessories.h"
#include "constants/phone_contacts.h"
#include "constants/trainers.h"
#include "render_window.h"

FS_EXTERN_OVERLAY(OVY_26);
FS_EXTERN_OVERLAY(npc_trade);
FS_EXTERN_OVERLAY(OVY_20);
FS_EXTERN_OVERLAY(bug_contest);
FS_EXTERN_OVERLAY(OVY_21);
FS_EXTERN_OVERLAY(OVY_22);
FS_EXTERN_OVERLAY(OVY_25);

BOOL sub_020416E4(ScriptContext *ctx);
BOOL sub_02042C78(ScriptContext *ctx);
BOOL ScrNative_WaitApplication(ScriptContext *ctx);
LocalMapObject *sub_02041C70(FieldSystem *fieldSystem, u16 person);
void _ScheduleObjectEventMovement(FieldSystem *fieldSystem, EventObjectMovementMan *mvtMan, MovementScriptCommand *a2);
void Script_SetMonSeenFlagBySpecies(FieldSystem *fieldSystem, u16 species);

#include "data/fieldmap.h"

static const WindowTemplate _020FAC94 = {
    .bgId = 3,
    .left = 25,
    .top = 13,
    .width = 6,
    .height = 4,
    .palette = 13,
    .baseTile = 0x021F,
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

BOOL ScrCmd_Nop(ScriptContext* ctx) {
#pragma unused(ctx)
    return FALSE;
}

BOOL ScrCmd_Dummy(ScriptContext* ctx) {
#pragma unused(ctx)
    return FALSE;
}

BOOL ScrCmd_End(ScriptContext* ctx) {
    StopScript(ctx);
    return FALSE;
}

static BOOL RunPauseTimer(ScriptContext* ctx);

BOOL ScrCmd_Wait(ScriptContext* ctx) {
    FieldSystem* fieldSystem = ctx->fieldSystem;
    u16 frames_to_wait = ScriptReadHalfword(ctx);
    u16 ptr_offset = ScriptReadHalfword(ctx);
    u16* ret_ptr = GetVarPointer(fieldSystem, ptr_offset);
    *ret_ptr = frames_to_wait;

    ctx->data[0] = ptr_offset;
    SetupNativeScript(ctx, RunPauseTimer);

    return TRUE;
}

static BOOL RunPauseTimer(ScriptContext* ctx) {
    u16* frames_to_wait = GetVarPointer(ctx->fieldSystem, ctx->data[0]);
    (*frames_to_wait)--;

    return (*frames_to_wait == 0);
}

BOOL ScrCmd_DebugWatch(ScriptContext* ctx) {
    u16 unused_var = ScriptGetVar(ctx);
    return FALSE;
}

BOOL ScrCmd_LoadByte(ScriptContext* ctx) {
    u8 reg = ScriptReadByte(ctx);
    u8 value = ScriptReadByte(ctx);

    ctx->data[reg] = value;

    return FALSE;
}

BOOL ScrCmd_LoadWord(ScriptContext* ctx) {
    u8 reg = ScriptReadByte(ctx);
    u32 value = ScriptReadWord(ctx);

    ctx->data[reg] = value;

    return FALSE;
}

BOOL ScrCmd_LoadByteFromAddr(ScriptContext* ctx) {
    u8 reg = ScriptReadByte(ctx);
    u8* address = (u8*)ScriptReadWord(ctx);

    ctx->data[reg] = *address;

    return FALSE;
}

BOOL ScrCmd_WriteByteToAddr(ScriptContext* ctx) {
    u8* address = (u8*)ScriptReadWord(ctx);
    *address = ScriptReadByte(ctx);

    return FALSE;
}

BOOL ScrCmd_SetPtrByte(ScriptContext* ctx) {
    u8* address = (u8*)ScriptReadWord(ctx);
    u8 reg = ScriptReadByte(ctx);

    *address = ctx->data[reg];

    return FALSE;
}

BOOL ScrCmd_CopyLocal(ScriptContext* ctx) {
    u8 dest_reg = ScriptReadByte(ctx);
    u8 src_reg = ScriptReadByte(ctx);

    ctx->data[dest_reg] = ctx->data[src_reg];

    return FALSE;
}

BOOL ScrCmd_CopyByte(ScriptContext* ctx) {
    u8* dest_address = (u8*)ScriptReadWord(ctx);
    u8* src_address = (u8*)ScriptReadWord(ctx);

    *dest_address = *src_address;

    return FALSE;
}

static u8 Compare(u32 a, u32 b) {
    if (a < b) {
        return SCRIPT_COMPARISON_RESULT_LESS;
    } else if (a == b) {
        return SCRIPT_COMPARISON_RESULT_EQUAL;
    } else {
        return SCRIPT_COMPARISON_RESULT_GREATER;
    }
}

BOOL ScrCmd_CompareLocalToLocal(ScriptContext* ctx) {
    u8 a = ctx->data[ScriptReadByte(ctx)];
    u8 b = ctx->data[ScriptReadByte(ctx)];

    ctx->comparisonResult = Compare(a, b);

    return FALSE;
}

BOOL ScrCmd_CompareLocalToValue(ScriptContext* ctx) {
    u8 a = ctx->data[ScriptReadByte(ctx)];
    u8 b = ScriptReadByte(ctx);

    ctx->comparisonResult = Compare(a, b);

    return FALSE;
}

BOOL ScrCmd_CompareLocalToAddr(ScriptContext* ctx) {
    u8 a = ctx->data[ScriptReadByte(ctx)];
    u8 b = *(u8*)ScriptReadWord(ctx);

    ctx->comparisonResult = Compare(a, b);

    return FALSE;
}

BOOL ScrCmd_CompareAddrToLocal(ScriptContext* ctx) {
    u8 a = *(u8*)ScriptReadWord(ctx);
    u8 b = ctx->data[ScriptReadByte(ctx)];

    ctx->comparisonResult = Compare(a, b);

    return FALSE;
}

BOOL ScrCmd_CompareAddrToValue(ScriptContext* ctx) {
    u8 a = *(u8*)ScriptReadWord(ctx);
    u8 b = ScriptReadByte(ctx);

    ctx->comparisonResult = Compare(a, b);

    return FALSE;
}

BOOL ScrCmd_CompareAddrToAddr(ScriptContext* ctx) {
    u8 a = *(u8*)ScriptReadWord(ctx);
    u8 b = *(u8*)ScriptReadWord(ctx);

    ctx->comparisonResult = Compare(a, b);

    return FALSE;
}

BOOL ScrCmd_CompareVarToValue(ScriptContext* ctx) {
    u16 a = *ScriptGetVarPointer(ctx);
    u16 b = ScriptReadHalfword(ctx);

    ctx->comparisonResult = Compare(a, b);

    return FALSE;
}

BOOL ScrCmd_CompareVarToVar(ScriptContext* ctx) {
    u16* a_ptr = ScriptGetVarPointer(ctx);
    u16* b_ptr = ScriptGetVarPointer(ctx);

    ctx->comparisonResult = Compare(*a_ptr, *b_ptr);

    return FALSE;
}

BOOL ScrCmd_RunScript(ScriptContext* ctx) {
    FieldSystem* fieldSystem = ctx->fieldSystem;
    u8* num_active_script_contexts = FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_ACTIVE_SCRIPT_CONTEXT_COUNT);
    ScriptContext** new_context_ptr = FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_SCRIPT_CONTEXT_1);

    u16 script_to_run = ScriptReadHalfword(ctx);
    *new_context_ptr = CreateScriptContext(fieldSystem, script_to_run);
    (*num_active_script_contexts)++;

    return TRUE;
}

static BOOL ScrNative_WaitStd(ScriptContext* ctx);

BOOL ScrCmd_CallStd(ScriptContext* ctx) {
    FieldSystem* fieldSystem = ctx->fieldSystem;
    u8* unk = FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_FIELD_07);
    u8* num_active_script_contexts = FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_ACTIVE_SCRIPT_CONTEXT_COUNT);
    ScriptContext** new_context_ptr = (ScriptContext**)FieldSysGetAttrAddr(fieldSystem, (ScriptEnvField)(SCRIPTENV_SCRIPT_CONTEXT_0 + *num_active_script_contexts));

    u16 script_to_run = ScriptReadHalfword(ctx);
    ScriptContext* new_context = CreateScriptContext(fieldSystem, script_to_run);
    *new_context_ptr = new_context;

    new_context->id = *num_active_script_contexts;
    (*num_active_script_contexts)++;

    *unk |= (1 << ctx->id);

    SetupNativeScript(ctx, ScrNative_WaitStd);
    return TRUE;
}

static BOOL ScrNative_WaitStd(ScriptContext* ctx) {
    FieldSystem* fieldSystem = ctx->fieldSystem;
    u8* unk = FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_FIELD_07);
    u8* unused = FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_ACTIVE_SCRIPT_CONTEXT_COUNT);

    return (*unk & (1 << ctx->id)) == 0;
}

BOOL ScrCmd_RestartCurrentScript(ScriptContext* ctx) {
    FieldSystem* fieldSystem = ctx->fieldSystem;
    u8* unk = FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_FIELD_07);
    u8* unused = FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_ACTIVE_SCRIPT_CONTEXT_COUNT);

    *unk ^= (1 << (ctx->id - 1));
    return FALSE;
}

BOOL ScrCmd_GoTo(ScriptContext* ctx) {
    u32 offset_in_script = ScriptReadWord(ctx);
    ScriptJump(ctx, ctx->script_ptr + offset_in_script);

    return FALSE;
}

BOOL ScrCmd_ObjectGoTo(ScriptContext* ctx) {
    LocalMapObject** lmo = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_LAST_INTERACTED);
    u8 id = ScriptReadByte(ctx);

    u32 offset_in_script = ScriptReadWord(ctx);
    if (id == MapObject_GetID(*lmo)) {
        ScriptJump(ctx, ctx->script_ptr + offset_in_script);
    }

    return FALSE;
}

BOOL ScrCmd_BgGoTo(ScriptContext* ctx) {
    u32 bg = sub_02050658(ctx->taskman);
    u8 required_bg = ScriptReadByte(ctx);

    u32 offset_in_script = ScriptReadWord(ctx);
    if (bg == required_bg) {
        ScriptJump(ctx, ctx->script_ptr + offset_in_script);
    }

    return FALSE;
}

BOOL ScrCmd_DirectionGoTo(ScriptContext* ctx) {
    u32* direction = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_FACING_DIRECTION);
    u8 required_direction = ScriptReadByte(ctx);

    u32 offset_in_script = ScriptReadWord(ctx);
    if (*direction == required_direction) {
        ScriptJump(ctx, ctx->script_ptr + offset_in_script);
    }

    return FALSE;
}

BOOL ScrCmd_Call(ScriptContext* ctx) {
    u32 offset_in_script = ScriptReadWord(ctx);
    ScriptCall(ctx, ctx->script_ptr + offset_in_script);

    return FALSE;
}

BOOL ScrCmd_Return(ScriptContext* ctx) {
    ScriptReturn(ctx);
    return FALSE;
}

BOOL ScrCmd_GoToIf(ScriptContext* ctx) {
    u8 condition = ScriptReadByte(ctx);
    u32 offset_in_script = ScriptReadWord(ctx);

    if (sConditionTable[condition][ctx->comparisonResult] == 1) {
        ScriptJump(ctx, ctx->script_ptr + offset_in_script);
    }

    return FALSE;
}

BOOL ScrCmd_CallIf(ScriptContext* ctx) {
    u8 condition = ScriptReadByte(ctx);
    u32 offset_in_script = ScriptReadWord(ctx);

    if (sConditionTable[condition][ctx->comparisonResult] == 1) {
        ScriptCall(ctx, ctx->script_ptr + offset_in_script);
    }

    return FALSE;
}

BOOL ScrCmd_SetFlag(ScriptContext* ctx) {
    FieldSystem* fieldSystem = ctx->fieldSystem;
    u16 flag_to_set = ScriptReadHalfword(ctx);

    FlagSet(fieldSystem, flag_to_set);

    return FALSE;
}

BOOL ScrCmd_ClearFlag(ScriptContext* ctx) {
    FieldSystem* fieldSystem = ctx->fieldSystem;
    u16 flag_to_clear = ScriptReadHalfword(ctx);

    FlagClear(fieldSystem, flag_to_clear);

    return FALSE;
}

BOOL ScrCmd_CheckFlag(ScriptContext* ctx) {
    FieldSystem* fieldSystem = ctx->fieldSystem;
    u16 flag_to_check = ScriptReadHalfword(ctx);

    ctx->comparisonResult = FlagGet(fieldSystem, flag_to_check);

    return FALSE;
}

BOOL ScrCmd_CheckFlagVar(ScriptContext* ctx) {
    FieldSystem* fieldSystem = ctx->fieldSystem;
    u16* flag_in_var_to_check = ScriptGetVarPointer(ctx);
    u16* ret_ptr = ScriptGetVarPointer(ctx);

    *ret_ptr = FlagGet(fieldSystem, *flag_in_var_to_check);

    return FALSE;
}

BOOL ScrCmd_SetFlagVar(ScriptContext* ctx) {
    FieldSystem* fieldSystem = ctx->fieldSystem;
    u16* flag_in_var_to_set = ScriptGetVarPointer(ctx);

    FlagSet(fieldSystem, *flag_in_var_to_set);

    return FALSE;
}

BOOL ScrCmd_ClearFlagVar(ScriptContext* ctx) {
    FieldSystem* fieldSystem = ctx->fieldSystem;
    u16* flag_in_var_to_clear = ScriptGetVarPointer(ctx);

    FlagClear(fieldSystem, *flag_in_var_to_clear);

    return FALSE;
}

BOOL ScrCmd_SetTrainerFlag(ScriptContext* ctx) {
    u16 flag_to_set = ScriptGetVar(ctx);

    TrainerFlagSet(ctx->fieldSystem->saveData, flag_to_set);

    return FALSE;
}

BOOL ScrCmd_ClearTrainerFlag(ScriptContext* ctx) {
    u16 flag_to_clear = ScriptGetVar(ctx);

    TrainerFlagClear(ctx->fieldSystem->saveData, flag_to_clear);

    return FALSE;
}

BOOL ScrCmd_CheckTrainerFlag(ScriptContext* ctx) {
    FieldSystem* fieldSystem = ctx->fieldSystem;
    u16 flag_to_check = ScriptGetVar(ctx);

    ctx->comparisonResult = TrainerFlagCheck(fieldSystem->saveData, flag_to_check);

    return FALSE;
}

BOOL ScrCmd_AddVar(ScriptContext* ctx) {
    u16* dest_var = ScriptGetVarPointer(ctx);
    u16 addend = ScriptGetVar(ctx);

    *dest_var += addend;

    return FALSE;
}

BOOL ScrCmd_SubVar(ScriptContext* ctx) {
    u16* dest_var = ScriptGetVarPointer(ctx);
    u16 subtrahend = ScriptGetVar(ctx);

    *dest_var -= subtrahend;

    return FALSE;
}

BOOL ScrCmd_SetVar(ScriptContext* ctx) {
    u16* dest_var = ScriptGetVarPointer(ctx);
    u16 value = ScriptReadHalfword(ctx);

    *dest_var = value;

    return FALSE;
}

BOOL ScrCmd_CopyVar(ScriptContext* ctx) {
    u16* dest_var = ScriptGetVarPointer(ctx);
    u16* src_var = ScriptGetVarPointer(ctx);

    *dest_var = *src_var;

    return FALSE;
}

BOOL ScrCmd_SetOrCopyVar(ScriptContext* ctx) {
    u16* dest_var = ScriptGetVarPointer(ctx);
    u16 src_var = ScriptGetVar(ctx);

    *dest_var = src_var;

    return FALSE;
}

BOOL ScrCmd_048(ScriptContext* ctx) {
    u8 msg_no = ScriptReadByte(ctx);

    if (!sub_02037474()) {
        ov01_021EF4DC(ctx, ctx->msgdata, msg_no, TRUE, NULL);
    } else {
        struct UnkStruct_Ov01_021EF4C4 unk_struct;
        ov01_021EF4C4(&unk_struct, ctx);
        unk_struct.textFrameDelay = 1;
        unk_struct.unk1 = 1;
        ov01_021EF4DC(ctx, ctx->msgdata, msg_no, FALSE, &unk_struct);
    }

    SetupNativeScript(ctx, ov01_021EF348);
    return TRUE;
}

static BOOL sub_02041000(ScriptContext* ctx);

BOOL ScrCmd_WaitButton(ScriptContext* ctx) {
    SetupNativeScript(ctx, sub_02041000);
    return TRUE;
}

static BOOL sub_02041000(ScriptContext* ctx) {
    return (gSystem.newKeys & (PAD_BUTTON_A | PAD_BUTTON_B)) != 0;
}

static BOOL sub_02041040(ScriptContext* ctx);

BOOL ScrCmd_WaitButtonOrDelay(ScriptContext* ctx) {
    ctx->data[0] = ScriptGetVar(ctx);
    SetupNativeScript(ctx, sub_02041040);
    return TRUE;
}

static BOOL sub_02041040(ScriptContext* ctx) {
    if ((gSystem.newKeys & (PAD_BUTTON_A | PAD_BUTTON_B)) != 0) {
        return TRUE;
    }

    return --ctx->data[0] == 0;
}

static BOOL sub_02041074(ScriptContext* ctx);

BOOL ScrCmd_WaitButtonOrWalkAway(ScriptContext* ctx) {
    SetupNativeScript(ctx, sub_02041074);
    return TRUE;
}

static BOOL sub_02041074(ScriptContext* ctx) {
    int new_keys = gSystem.newKeys;

    if ((new_keys & (PAD_BUTTON_A | PAD_BUTTON_B)) != 0) {
        return TRUE;
    }

    if ((new_keys & PAD_KEY_UP) != 0) {
        PlayerAvatar_SetFacingDirection(ctx->fieldSystem->playerAvatar, DIR_NORTH);
    } else if ((new_keys & PAD_KEY_DOWN) != 0) {
        PlayerAvatar_SetFacingDirection(ctx->fieldSystem->playerAvatar, DIR_SOUTH);
    } else if ((new_keys & PAD_KEY_LEFT) != 0) {
        PlayerAvatar_SetFacingDirection(ctx->fieldSystem->playerAvatar, DIR_WEST);
    } else if ((new_keys & PAD_KEY_RIGHT) != 0) {
        PlayerAvatar_SetFacingDirection(ctx->fieldSystem->playerAvatar, DIR_EAST);
    } else {
        return FALSE;
    }

    return TRUE;
}

static BOOL sub_020410F0(ScriptContext* ctx);

BOOL ScrCmd_WaitButtonOrDpad(ScriptContext* ctx) {
    SetupNativeScript(ctx, sub_020410F0);
    return TRUE;
}

static BOOL sub_020410F0(ScriptContext* ctx) {
    if ((gSystem.newKeys & (PAD_BUTTON_A | PAD_BUTTON_B)) != 0) {
        return TRUE;
    }

    if ((gSystem.newKeys & (PAD_KEY_UP | PAD_KEY_DOWN | PAD_KEY_LEFT | PAD_KEY_RIGHT)) != 0) {
        return TRUE;
    }

    return FALSE;
}

BOOL ScrCmd_OpenMsg(ScriptContext* ctx) {
    FieldSystem* fieldSystem = ctx->fieldSystem;
    u8* unk = FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_FIELD_08);

    sub_0205B514(fieldSystem->bgConfig, FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_WINDOW), 3);
    sub_0205B564(FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_WINDOW), Save_PlayerData_GetOptionsAddr(ctx->fieldSystem->saveData));

    fieldSystem->unkD2_6 = 1;
    *unk = 1;

    return FALSE;
}

BOOL ScrCmd_CloseMsg(ScriptContext* ctx) {
    FieldSystem* fieldSystem = ctx->fieldSystem;
    Window* window = FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_WINDOW);
    u8* unk = FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_FIELD_08);

    ClearFrameAndWindow2(window, 0);
    RemoveWindow(window);

    fieldSystem->unkD2_6 = 0;
    *unk = 0;

    return FALSE;
}

BOOL ScrCmd_HoldMsg(ScriptContext* ctx) {
    FieldSystem* fieldSystem = ctx->fieldSystem;
    Window* window = FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_WINDOW);
    u8* unk = FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_FIELD_08);

    RemoveWindow(window);

    fieldSystem->unkD2_6 = 0;
    *unk = 0;

    return FALSE;
}

static BOOL sub_02041270(ScriptContext* ctx);

BOOL ScrCmd_062(ScriptContext* ctx) {
    FieldSystem* fieldSystem = ctx->fieldSystem;
    u16* var_8008 = FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_SPECIAL_VAR_8008);
    u16* var_8004 = FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_SPECIAL_VAR_8004);
    u16* var_8009 = FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_SPECIAL_VAR_8009);
    u16* var_800A = FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_SPECIAL_VAR_800A);
    u16* var_8005 = FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_SPECIAL_VAR_8005);
    u16* var_800B = FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_SPECIAL_VAR_800B);

    *var_8008 = ScriptReadByte(ctx);
    *var_8004 = ScriptReadByte(ctx);
    *var_8009 = ScriptReadByte(ctx);
    *var_800A = ScriptReadByte(ctx);
    *var_8005 = ScriptReadByte(ctx);
    *var_800B = ScriptReadByte(ctx);

    SetupNativeScript(ctx, sub_02041270);
    return TRUE;
}

static BOOL sub_02041270(ScriptContext* ctx) {
    FieldSystem* fieldSystem = ctx->fieldSystem;
    u16* var_8008 = FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_SPECIAL_VAR_8008);
    u16* var_8009 = FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_SPECIAL_VAR_8009);
    u16* var_800A = FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_SPECIAL_VAR_800A);
    u16* var_800B = FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_SPECIAL_VAR_800B);
    u16* var_8004 = FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_SPECIAL_VAR_8004);
    u16* var_8005 = FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_SPECIAL_VAR_8005);

    if (*var_8004 == 0 && *var_8005 == 0) {
        return TRUE;
    }

    if (*var_8008 != 0) {
        if (*var_8009 == 0) {
            BgSetPosTextAndCommit(fieldSystem->bgConfig, GF_BG_LYR_MAIN_3, BG_POS_OP_ADD_X, *var_8008);
        } else {
            BgSetPosTextAndCommit(fieldSystem->bgConfig, GF_BG_LYR_MAIN_3, BG_POS_OP_SUB_X, *var_8008);
        }
    }

    if (*var_800A != 0) {
        if (*var_800B == 0) {
            BgSetPosTextAndCommit(fieldSystem->bgConfig, GF_BG_LYR_MAIN_3, BG_POS_OP_ADD_Y, *var_800A);
        } else {
            BgSetPosTextAndCommit(fieldSystem->bgConfig, GF_BG_LYR_MAIN_3, BG_POS_OP_SUB_Y, *var_800A);
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

BOOL ScrCmd_DirectionSignpost(ScriptContext* ctx) {
    u8 unk2;

    FieldSystem* fieldSystem = ctx->fieldSystem;
    String** tmp_str = FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_STRING_BUFFER_1);
    String** unk1 = FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_STRING_BUFFER_0);
    MessageFormat** msg_fmt = FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_MESSAGE_FORMAT);
    u8 msg_no = ScriptReadByte(ctx);
    unk2 = ScriptReadByte(ctx);
    u16 arrow = ScriptReadHalfword(ctx);
    u16 unused_result_var_id = ScriptReadHalfword(ctx);

    fieldSystem->unkD2_6 = 1;

    ov01_021F3D68(fieldSystem->unk68, unk2, arrow);
    ov01_021F3D70(fieldSystem->unk68, 1);
    ov01_021F3D98(fieldSystem);

    ReadMsgDataIntoString(ctx->msgdata, msg_no, *tmp_str);
    StringExpandPlaceholders(*msg_fmt, *unk1, *tmp_str);
    Window* window = ov01_021F3D80(fieldSystem->unk68);
    AddTextPrinterParameterized2(window, 1, *unk1, 0, 0, 0, MakeTextColor(2, 10, 15), NULL);

    return TRUE;
}

BOOL ScrCmd_055(ScriptContext* ctx) {
    FieldSystem* fieldSystem = ctx->fieldSystem;
    u8 unk1 = ScriptReadByte(ctx);
    u16 unk2 = ScriptReadHalfword(ctx);

    fieldSystem->unkD2_6 = 1;

    ov01_021F3D68(fieldSystem->unk68, unk1, unk2);
    ov01_021F3D70(fieldSystem->unk68, 1);

    return TRUE;
}

BOOL ScrCmd_057(ScriptContext* ctx) {
    FieldSystem* fieldSystem = ctx->fieldSystem;
    ov01_021F3D70(fieldSystem->unk68, ScriptReadByte(ctx));
    return TRUE;
}

static BOOL sub_02041454(ScriptContext* ctx);

BOOL ScrCmd_058(ScriptContext* ctx) {
    if (ov01_021F3D88(ctx->fieldSystem->unk68) == TRUE) {
        return FALSE;
    }

    SetupNativeScript(ctx, sub_02041454);
    return TRUE;
}

static BOOL sub_02041454(ScriptContext* ctx) {
    return ov01_021F3D88(ctx->fieldSystem->unk68) == TRUE;
}

static BOOL sub_02041520(ScriptContext* ctx);

BOOL ScrCmd_TrainerTips(ScriptContext* ctx) {
    FieldSystem* fieldSystem = ctx->fieldSystem;
    u8* printer_id_ptr = FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_TEXT_PRINTER_NUMBER);
    String** tmp_str = FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_STRING_BUFFER_1);
    String** unk = FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_STRING_BUFFER_0);
    MessageFormat** msg_fmt = FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_MESSAGE_FORMAT);
    u8 msg_no = ScriptReadByte(ctx);
    u16 result_var_id = ScriptReadHalfword(ctx);

    ReadMsgDataIntoString(ctx->msgdata, msg_no, *tmp_str);
    StringExpandPlaceholders(*msg_fmt, *unk, *tmp_str);

    TextFlags_SetCanABSpeedUpPrint(TRUE);
    sub_02002B50(FALSE);
    sub_02002B8C(FALSE);

    Window* window = ov01_021F3D80(fieldSystem->unk68);
    u8 text_speed = Options_GetTextFrameDelay(Save_PlayerData_GetOptionsAddr(fieldSystem->saveData));
    *printer_id_ptr = AddTextPrinterParameterized2(window, 1, *unk, 0, 0, text_speed, MakeTextColor(2, 10, 15), NULL);

    ctx->data[0] = result_var_id;
    SetupNativeScript(ctx, sub_02041520);
    return TRUE;
}

static BOOL sub_02041520(ScriptContext* ctx) {
    FieldSystem* fieldSystem = ctx->fieldSystem;
    u8* printer_id_ptr = FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_TEXT_PRINTER_NUMBER);
    u16* ret_ptr = GetVarPointer(fieldSystem, ctx->data[0]);
    u8 unused = ov01_021F3D84(fieldSystem->unk68);

    u16 direction = 0xFFFF;

    if (IsPrintFinished(*printer_id_ptr) == TRUE) {
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
        PlayerAvatar_SetFacingDirection(ctx->fieldSystem->playerAvatar, direction);
        *ret_ptr = 0;
        ctx->fieldSystem->unkD2_6 = 0;
        return TRUE;
    }

    return FALSE;
}

static BOOL sub_020415E0(ScriptContext* ctx);

BOOL ScrCmd_060(ScriptContext* ctx) {
    ctx->data[0] = ScriptReadHalfword(ctx);
    SetupNativeScript(ctx, sub_020415E0);
    return TRUE;
}

static BOOL sub_020415E0(ScriptContext* ctx) {
    FieldSystem* fieldSystem = ctx->fieldSystem;
    u16* ret_ptr = GetVarPointer(fieldSystem, ctx->data[0]);
    u16 direction = 0xFFFF;
    int new_keys = gSystem.newKeys;

    if ((new_keys & (PAD_BUTTON_A | PAD_BUTTON_B)) != 0) {
        *ret_ptr = 0;
        fieldSystem->unkD2_6 = 0;
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
        PlayerAvatar_SetFacingDirection(ctx->fieldSystem->playerAvatar, direction);
        *ret_ptr = 0;
        fieldSystem->unkD2_6 = 0;
        return TRUE;
    }

    return FALSE;
}

BOOL ScrCmd_061(ScriptContext* ctx) {
    sub_0204031C(ctx->fieldSystem);
    return FALSE;
}

BOOL ScrCmd_YesNo(ScriptContext* ctx) {
    FieldSystem *fieldSystem = ctx->fieldSystem;
    struct ListMenu2D **listMenu2D = FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_LIST_MENU_2D);
    u16 data = ScriptReadHalfword(ctx);
    LoadUserFrameGfx1(fieldSystem->bgConfig, GF_BG_LYR_MAIN_3, 0x3D9, 11, 0, HEAP_ID_4);
    *listMenu2D = Std_CreateYesNoMenu(fieldSystem->bgConfig, &_020FAC94, 0x3D9, 11, HEAP_ID_4);
    ctx->data[0] = data;
    SetupNativeScript(ctx, sub_020416E4);
    return TRUE;
}

BOOL sub_020416E4(ScriptContext *ctx) {
    FieldSystem *fieldSystem = ctx->fieldSystem;
    struct ListMenu2D **listMenu2D = FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_LIST_MENU_2D);
    u16 *ret_p = GetVarPointer(fieldSystem, ctx->data[0]);
    int selection = Handle2dMenuInput_DeleteOnFinish(*listMenu2D, HEAP_ID_4);
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

BOOL ScrCmd_AddWaitingIcon(ScriptContext *ctx) {
    Window *window = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_WINDOW);
    WaitingIcon **waitingIcon = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_WAITING_ICON);
    *waitingIcon = WaitingIcon_New(window, 0x3E2);
    return FALSE;
}

BOOL ScrCmd_RemoveWaitingIcon(ScriptContext *ctx) {
    WaitingIcon **waitingIcon = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_WAITING_ICON);
    sub_0200F450(*waitingIcon);
    return FALSE;
}

static void sub_02041770(ScriptContext *ctx, struct UnkStruct_ov01_021EDC28 **a1, MsgData *msgData) {
    FieldSystem *fieldSystem = ctx->fieldSystem;
    MessageFormat **msgFmt = FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_MESSAGE_FORMAT);
    u8 x = ScriptReadByte(ctx);
    u8 y = ScriptReadByte(ctx);
    u8 initCursorPos = ScriptReadByte(ctx);
    u8 cancellable = ScriptReadByte(ctx);
    u16 var = ScriptReadHalfword(ctx);
    *a1 = ov01_021EDF78(fieldSystem, x, y, initCursorPos, cancellable, GetVarPointer(fieldSystem, var), *msgFmt, FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_WINDOW), msgData);
    ctx->data[0] = var;
}

BOOL ScrCmd_064(ScriptContext *ctx) {
    sub_02041770(ctx, FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MENU_WINDOW), NULL);
    return TRUE;
}

BOOL ScrCmd_065(ScriptContext *ctx) {
    sub_02041770(ctx, FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MENU_WINDOW), ctx->msgdata);
    return TRUE;
}

BOOL ScrCmd_066(ScriptContext *ctx) {
    struct UnkStruct_ov01_021EDC28 **pp_menu = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MENU_WINDOW);
    u8 msgId = ScriptReadByte(ctx);
    u8 value = ScriptReadByte(ctx);
    ov01_021EDC7C(*pp_menu, msgId, value);
    return FALSE;
}

BOOL ScrCmd_559(ScriptContext *ctx) {
    struct UnkStruct_ov01_021EDC28 **pp_menu = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MENU_WINDOW);
    u16 msgId = ScriptGetVar(ctx);
    u16 value = ScriptGetVar(ctx);
    ov01_021EDC7C(*pp_menu, msgId, value);
    return FALSE;
}

BOOL sub_020418B4(ScriptContext *ctx);

BOOL ScrCmd_067(ScriptContext *ctx) {
    struct UnkStruct_ov01_021EDC28 **pp_menu = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MENU_WINDOW);
    ov01_021EDC84(*pp_menu);
    SetupNativeScript(ctx, sub_020418B4);
    return TRUE;
}

BOOL sub_020418B4(ScriptContext *ctx) {
    return *GetVarPointer(ctx->fieldSystem, ctx->data[0]) != 0xEEEE;
}

BOOL sub_02041900(ScriptContext *ctx);

BOOL ScrCmd_585(ScriptContext *ctx) {
    struct UnkStruct_ov01_021EDC28 **pp_menu = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MENU_WINDOW);
    ov01_021EDC84(*pp_menu);
    SetupNativeScript(ctx, sub_02041900);
    return TRUE;
}

BOOL sub_02041900(ScriptContext *ctx) {
    FieldSystem *fieldSystem = ctx->fieldSystem;
    u16 *p_var = GetVarPointer(fieldSystem, ctx->data[0]);
    struct UnkStruct_ov01_021EDC28 **pp_menu = FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_MENU_WINDOW);
    if (*p_var == 0xEEEE) {
        if (sub_0205A478(fieldSystem->unk80)) {
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

BOOL ScrCmd_068(ScriptContext *ctx) {
    sub_02041770(ctx, FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MENU_WINDOW), NULL);
    return TRUE;
}

BOOL ScrCmd_069(ScriptContext *ctx) {
    sub_02041770(ctx, FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MENU_WINDOW), ctx->msgdata);
    return TRUE;
}

BOOL ScrCmd_070(ScriptContext *ctx) {
    struct UnkStruct_ov01_021EDC28 **pp_menu = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MENU_WINDOW);
    u16 r6 = ScriptGetVar(ctx);
    u16 r7 = ScriptGetVar(ctx);
    u16 r3 = ScriptGetVar(ctx);
    MoveTutorMenu_SetListItem(*pp_menu, (u8)r6, (u8)r7, (u8)r3);
    return FALSE;
}

BOOL ScrCmd_071(ScriptContext *ctx) {
    struct UnkStruct_ov01_021EDC28 **pp_menu = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MENU_WINDOW);
    ov01_021EDFA4(*pp_menu);
    SetupNativeScript(ctx, sub_020418B4);
    return TRUE;
}

BOOL ScrCmd_695(ScriptContext *ctx) {
    struct UnkStruct_ov01_021EDC28 **pp_menu = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MENU_WINDOW);
    u16 var = ScriptGetVar(ctx);
    ov01_021EE014(*pp_menu, var);
    SetupNativeScript(ctx, sub_020418B4);
    return TRUE;
}

BOOL ScrCmd_677(ScriptContext *ctx) {
    struct UnkStruct_ov01_021EDC28 **pp_menu = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MENU_WINDOW);
    u16 *var1 = ScriptGetVarPointer(ctx);
    u16 *var2 = ScriptGetVarPointer(ctx);
    ov01_021EE0EC(*pp_menu, var1, var2);
    SetupNativeScript(ctx, sub_020418B4);
    return TRUE;
}

BOOL ScrCmd_072(ScriptContext *ctx) {
    struct UnkStruct_ov01_021EDC28 **pp_menu = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MENU_WINDOW);
    u8 val = ScriptReadByte(ctx);
    ov01_021EE974(*pp_menu, val);
    SetupNativeScript(ctx, sub_020418B4);
    return TRUE;
}

BOOL ScrCmd_841(ScriptContext *ctx) {
    struct UnkStruct_ov01_021EDC28 **pp_menu = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MENU_WINDOW);
    u8 val = ScriptReadByte(ctx);
    ov01_021EF018(*pp_menu, val);
    return TRUE;
}

BOOL ScrCmd_842(ScriptContext *ctx) {
    struct UnkStruct_ov01_021EDC28 **pp_menu = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MENU_WINDOW);
    u8 val = ScriptReadByte(ctx);
    ov01_021EF034(*pp_menu, val);
    return TRUE;
}

BOOL ScrCmd_ApplyMovement(ScriptContext *ctx) {
    u16 person = ScriptGetVar(ctx);
    u32 offset = ScriptReadWord(ctx);
    LocalMapObject *object = sub_02041C70(ctx->fieldSystem, person);
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
    mvtCounter = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_ACTIVE_MOVEMENT_COUNTER);
    (*mvtCounter)++;
    _ScheduleObjectEventMovement(ctx->fieldSystem, mvtMan, NULL);
    return FALSE;
}

BOOL ScrCmd_563(ScriptContext *ctx) {
    u16 person = ScriptGetVar(ctx);
    u16 x = ScriptGetVar(ctx);
    u16 y = ScriptGetVar(ctx);
    u16 now_x, now_y;
    int i;
    LocalMapObject *object = sub_02041C70(ctx->fieldSystem, person);
    MovementScriptCommand *cmd;
    EventObjectMovementMan *mvtMan;
    u8 *mvtCounter;

    GF_ASSERT(object != NULL);
    cmd = AllocFromHeap(HEAP_ID_4, 64 * sizeof(MovementScriptCommand));
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
    mvtCounter = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_ACTIVE_MOVEMENT_COUNTER);
    (*mvtCounter)++;
    _ScheduleObjectEventMovement(ctx->fieldSystem, mvtMan, cmd);
    return FALSE;
}

LocalMapObject *sub_02041C70(FieldSystem *fieldSystem, u16 person) {
    if (person == 0xF2) {
        return sub_0205EEB4(fieldSystem->mapObjectMan, 0x30);
    } else if (person == 0xF1) {
        LocalMapObject **attr = FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_CAMERA_TARGET);
        return *attr;
    } else {
        return GetMapObjectByID(fieldSystem->mapObjectMan, person);
    }
}

static BOOL IsAllMovementFinished(ScriptContext *ctx);

BOOL ScrCmd_WaitMovement(ScriptContext *ctx) {
    SetupNativeScript(ctx, IsAllMovementFinished);
    return TRUE;
}

static BOOL IsAllMovementFinished(ScriptContext *ctx) {
    u8 *movCounter = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_ACTIVE_MOVEMENT_COUNTER);
    return *movCounter == 0;
}

struct ObjectMovementTaskEnv {
    SysTask *task;
    EventObjectMovementMan *mvtMan;
    struct MovementScriptCommand *cmd;
    FieldSystem *fieldSystem;
};

void _RunObjectEventMovement(SysTask *task, struct ObjectMovementTaskEnv *env);

void _ScheduleObjectEventMovement(FieldSystem *fieldSystem, EventObjectMovementMan *mvtMan, MovementScriptCommand *a2) {
    struct ObjectMovementTaskEnv *env = AllocFromHeap(HEAP_ID_4, sizeof(struct ObjectMovementTaskEnv));
    if (env == NULL) {
        GF_ASSERT(0);
        return;
    }
    env->fieldSystem = fieldSystem;
    env->mvtMan = mvtMan;
    env->cmd = a2;
    env->task = CreateSysTask((SysTaskFunc)_RunObjectEventMovement, env, 0);
}

void _RunObjectEventMovement(SysTask *task, struct ObjectMovementTaskEnv *env) {
    u8 *mvtCnt = FieldSysGetAttrAddr(env->fieldSystem, SCRIPTENV_ACTIVE_MOVEMENT_COUNTER);
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

BOOL _WaitFollowPokePaused(ScriptContext *ctx);

BOOL ScrCmd_LockAll(ScriptContext *ctx) {
    LocalMapObject **p_lastInteracted;
    LocalMapObject *followingPoke;
    FieldSystem *fieldSystem = ctx->fieldSystem;

    p_lastInteracted = FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_LAST_INTERACTED);
    if (*p_lastInteracted == NULL) {
        MapObjectManager_PauseAllMovement(fieldSystem->mapObjectMan);
        followingPoke = FollowingPokemon_GetMapObject(fieldSystem);
        if (FollowingPokemon_IsActive(fieldSystem) && MapObject_IsSingleMovementActive(followingPoke)) {
            MapObject_UnpauseMovement(followingPoke);
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

static BOOL _WaitMovementPauseBeforeMsg(ScriptContext *ctx) {
    FieldSystem *fieldSystem = ctx->fieldSystem;
    LocalMapObject **p_lastInteracted = FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_LAST_INTERACTED);
    LocalMapObject *playerObj = PlayerAvatar_GetMapObject(fieldSystem->playerAvatar);
    LocalMapObject *unk;

    if (_CheckMovementPauseWaitFlag(1)) {
        if (MapObject_IsMovementPaused(playerObj) == TRUE) {
            MapObject_PauseMovement(playerObj);
            _ClearMovementPauseWaitFlag(1);
        }
    }

    if (_CheckMovementPauseWaitFlag(4)) {
        if (MapObject_IsSingleMovementActive(*p_lastInteracted) == FALSE) {
            MapObject_PauseMovement(*p_lastInteracted);
            _ClearMovementPauseWaitFlag(4);
        }
    }

    if (_CheckMovementPauseWaitFlag(2)) {
        unk = sub_0205EEB4(fieldSystem->mapObjectMan, 0x30);
        if (MapObject_IsSingleMovementActive(unk) == FALSE) {
            MapObject_PauseMovement(unk);
            _ClearMovementPauseWaitFlag(2);
        }
    }

    if (_CheckMovementPauseWaitFlag(8)) {
        unk = sub_020660C0(*p_lastInteracted);
        if (MapObject_IsSingleMovementActive(unk) == FALSE) {
            MapObject_PauseMovement(unk);
            _ClearMovementPauseWaitFlag(8);
        }
    }

    return _AllMovementPauseWaitsFinish();
}

BOOL _WaitFollowPokePaused(ScriptContext *ctx) {
    LocalMapObject *tsurePoke = FollowingPokemon_GetMapObject(ctx->fieldSystem);
    if (MapObject_IsSingleMovementActive(tsurePoke) == FALSE) {
        MapObject_PauseMovement(tsurePoke);
        return TRUE;
    }

    return FALSE;
}

BOOL ScrCmd_LockLastTalked(ScriptContext *ctx) {
    FieldSystem *fieldSystem = ctx->fieldSystem;
    LocalMapObject **p_lastInteracted = FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_LAST_INTERACTED);
    LocalMapObject *playerObject = PlayerAvatar_GetMapObject(fieldSystem->playerAvatar);
    LocalMapObject *unk = sub_0205EEB4(fieldSystem->mapObjectMan, 0x30);
    LocalMapObject *unk2 = sub_020660C0(*p_lastInteracted);
    MapObjectManager *mapObjectMan = fieldSystem->mapObjectMan;

    _ResetMovementPauseWaitFlags();

    MapObjectManager_PauseAllMovement(mapObjectMan);

    if (MapObject_IsMovementPaused(playerObject) == FALSE) {
        _SetMovementPauseWaitFlag(1);
        MapObject_UnpauseMovement(playerObject);
    }

    if (MapObject_IsSingleMovementActive(*p_lastInteracted) != FALSE) {
        _SetMovementPauseWaitFlag(4);
        MapObject_UnpauseMovement(*p_lastInteracted);
    }

    if (unk != NULL && FollowingPokemon_IsActive(fieldSystem) && MapObject_IsSingleMovementActive(unk) == FALSE) {
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

BOOL ScrCmd_ReleaseAll(ScriptContext *ctx) {
    MapObjectManager_UnpauseAllMovement(ctx->fieldSystem->mapObjectMan);
    return TRUE;
}

BOOL ScrCmd_098(ScriptContext *ctx) {
    FieldSystem *fieldSystem = ctx->fieldSystem;
    u16 objectId = ScriptReadHalfword(ctx);
    LocalMapObject *object = GetMapObjectByID(fieldSystem->mapObjectMan, objectId);
    if (object != NULL) {
        MapObject_PauseMovement(object);
    } else {
        GF_ASSERT(objectId == obj_partner_poke);
    }
    return FALSE;
}

BOOL ScrCmd_099(ScriptContext *ctx) {
    FieldSystem *fieldSystem = ctx->fieldSystem;
    u16 objectId = ScriptReadHalfword(ctx);
    LocalMapObject *object = GetMapObjectByID(fieldSystem->mapObjectMan, objectId);
    if (object != NULL) {
        MapObject_UnpauseMovement(object);
    } else {
        GF_ASSERT(objectId == obj_partner_poke);
    }
    return FALSE;
}

BOOL ScrCmd_ShowPerson(ScriptContext *ctx) {
    FieldSystem *fieldSystem = ctx->fieldSystem;
    u16 objectId = ScriptGetVar(ctx);
    u32 nobjs = Field_GetNumObjectEvents(fieldSystem);
    const ObjectEvent *objectEvents = Field_GetObjectEvents(fieldSystem);
    GF_ASSERT(CreateMapObjectFromTemplate(fieldSystem->mapObjectMan, objectId, nobjs, fieldSystem->location->mapId, objectEvents));
    return FALSE;
}

BOOL ScrCmd_HidePerson(ScriptContext *ctx) {
    FieldSystem *fieldSystem = ctx->fieldSystem;
    u16 objectId = ScriptGetVar(ctx);
    LocalMapObject *object = GetMapObjectByID(fieldSystem->mapObjectMan, objectId);
    if (object == NULL) {
        GF_ASSERT(0);
    } else {
        DeleteMapObject(object);
    }
    return FALSE;
}

BOOL ScrCmd_102(ScriptContext *ctx) {
    u16 x = ScriptGetVar(ctx);
    u16 y = ScriptGetVar(ctx);
    LocalMapObject **p_cameraObj = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_CAMERA_TARGET);
    VecFx32 *pos;
    *p_cameraObj = CreateSpecialFieldObject(ctx->fieldSystem->mapObjectMan, x, y, 0, SPRITE_CAMERA_FOCUS, 0, ctx->fieldSystem->location->mapId);
    sub_02061070(*p_cameraObj);
    MapObject_SetVisible(*p_cameraObj, TRUE);
    MapObject_ClearFlag18(*p_cameraObj, FALSE);
    pos = MapObject_GetPositionVecPtr(*p_cameraObj);
    ov01_021F62E8(pos, ctx->fieldSystem->unk2C);
    Camera_SetFixedTarget(pos, ctx->fieldSystem->camera);
    return FALSE;
}

BOOL ScrCmd_103(ScriptContext *ctx) {
    LocalMapObject **p_cameraObj = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_CAMERA_TARGET);
    VecFx32 *pos;
    MapObject_Remove(*p_cameraObj);
    pos = MapObject_GetPositionVecPtr(GetMapObjectByID(ctx->fieldSystem->mapObjectMan, obj_player));
    ov01_021F62E8(pos, ctx->fieldSystem->unk2C);
    Camera_SetFixedTarget(pos, ctx->fieldSystem->camera);
    return FALSE;
}

BOOL ScrCmd_678(ScriptContext *ctx) {
    u16 x = ScriptGetVar(ctx);
    u16 y = ScriptGetVar(ctx);
    LocalMapObject **p_cameraObj = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_CAMERA_TARGET);
    *p_cameraObj = CreateSpecialFieldObject(ctx->fieldSystem->mapObjectMan, x, y, 0, SPRITE_CAMERA_FOCUS, 0, ctx->fieldSystem->location->mapId);
    sub_02061070(*p_cameraObj);
    MapObject_SetVisible(*p_cameraObj, TRUE);
    MapObject_ClearFlag18(*p_cameraObj, FALSE);
    return FALSE;
}

BOOL ScrCmd_679(ScriptContext *ctx) {
    LocalMapObject **p_cameraObj = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_CAMERA_TARGET);
    MapObject_Remove(*p_cameraObj);
    return FALSE;
}

BOOL ScrCmd_FacePlayer(ScriptContext *ctx) {
    FieldSystem *fieldSystem = ctx->fieldSystem;
    u32 rvsDir = sub_020611F4(PlayerAvatar_GetFacingDirection(fieldSystem->playerAvatar));
    LocalMapObject **p_lastInteracted = FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_LAST_INTERACTED);
    u32 oldDir;
    int x, y;
    int metatile;

    if (*p_lastInteracted == NULL) {
        return FALSE;
    }
    oldDir = MapObject_GetFacingDirection(*p_lastInteracted);
    ov01_021F9408(*p_lastInteracted, rvsDir);
    if (MapObject_GetID(*p_lastInteracted) == obj_partner_poke) {
        if (ov01_022055DC(*p_lastInteracted) && oldDir != rvsDir) {
            ov01_02205604(*p_lastInteracted, &x, &y);
            metatile = GetMetatileBehaviorAt(fieldSystem, x, y);
            if (rvsDir == 2 || rvsDir == 3) {
                if (MetatileBehavior_IsEncounterGrass(metatile) == TRUE) {
                    ov01_021FF0E4(*p_lastInteracted, 0, x, y, 1);
                } else if (sub_0205B6F4(metatile) == TRUE) {
                    ov01_021FF964(*p_lastInteracted, 0, x, y, 1);
                }
            }
            if (MetatileBehavior_IsEncounterGrass(metatile) == FALSE
             && sub_0205B6F4(metatile) == FALSE
             && sub_02060E54(*p_lastInteracted, metatile) == FALSE
             && sub_0205B984(metatile) == FALSE
             && sub_0205B7A4(metatile) == FALSE
             && sub_02060EBC(*p_lastInteracted, metatile) == FALSE
             && sub_0205B8AC(metatile) == FALSE
             && sub_0205BA70(metatile) == FALSE
            ) {
                MapObject_ClearFlagsBits(*p_lastInteracted, MAPOBJECTFLAG_UNK20);
            }
        }
    }
    return FALSE;
}

BOOL ScrCmd_GetPlayerCoords(ScriptContext *ctx) {
    FieldSystem *fieldSystem = ctx->fieldSystem;
    u16 *p_x = ScriptGetVarPointer(ctx);
    u16 *p_y = ScriptGetVarPointer(ctx);

    *p_x = GetPlayerXCoord(fieldSystem->playerAvatar);
    *p_y = GetPlayerYCoord(fieldSystem->playerAvatar);
    return FALSE;
}

BOOL ScrCmd_GetPersonCoords(ScriptContext *ctx) {
    FieldSystem *fieldSystem = ctx->fieldSystem;
    u16 personId = ScriptGetVar(ctx);
    LocalMapObject *object = GetMapObjectByID(fieldSystem->mapObjectMan, personId);
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

BOOL ScrCmd_GetPlayerFacing(ScriptContext *ctx) {
    u16 *p_direction = ScriptGetVarPointer(ctx);
    *p_direction = PlayerAvatar_GetFacingDirection(ctx->fieldSystem->playerAvatar);
    return FALSE;
}

BOOL ScrCmd_107(ScriptContext *ctx) {
    VecFx32 shift_v;

    u16 x = ScriptGetVar(ctx);
    u16 y = ScriptGetVar(ctx);
    u16 z = ScriptGetVar(ctx);

    shift_v.x = FX32_CONST(x);
    shift_v.y = FX32_CONST(y);
    shift_v.z = FX32_CONST(z);

    sub_0205F9A0(PlayerAvatar_GetMapObject(ctx->fieldSystem->playerAvatar), &shift_v);
    Camera_OffsetLookAtPosAndTarget(&shift_v, ctx->fieldSystem->camera);
    return FALSE;
}

BOOL ScrCmd_108(ScriptContext *ctx) {
    u16 objectId = ScriptGetVar(ctx);
    LocalMapObject *object = GetMapObjectByID(ctx->fieldSystem->mapObjectMan, objectId);
    u8 arg = ScriptReadByte(ctx);
    MapObject_SetFlag10(object, arg);
    return FALSE;
}

BOOL ScrCmd_109(ScriptContext *ctx) {
    u16 objectId = ScriptGetVar(ctx);
    LocalMapObject *object = GetMapObjectByID(ctx->fieldSystem->mapObjectMan, objectId);
    u16 arg = ScriptReadHalfword(ctx);
    if (object != NULL) {
        sub_0205FC94(object, arg);
    }
    return FALSE;
}

BOOL ScrCmd_574(ScriptContext *ctx) {
    u16 *p_dest = ScriptGetVarPointer(ctx);
    *p_dest = 0;
    u16 objectId = ScriptGetVar(ctx);
    LocalMapObject *object = GetMapObjectByID(ctx->fieldSystem->mapObjectMan, objectId);
    if (object != NULL) {
        *p_dest = MapObject_GetMovement(object);
    }
    return FALSE;
}

BOOL ScrCmd_136(ScriptContext *ctx) {
    u16 partyIdx = ScriptGetVar(ctx);
    u16 *p_dest = ScriptGetVarPointer(ctx);
    *p_dest = GetMonUnownLetter(Party_GetMonByIndex(SaveArray_Party_Get(ctx->fieldSystem->saveData), partyIdx));
    return FALSE;
}

BOOL ScrCmd_PartySelectUI(ScriptContext *ctx) {
    PartyMenuAppData **partyMenu = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_RUNNING_APP_DATA);
    *partyMenu = sub_0203E580(HEAP_ID_32, ctx->fieldSystem);
    SetupNativeScript(ctx, ScrNative_WaitApplication);
    return TRUE;
}

BOOL ScrCmd_566(ScriptContext *ctx) { //todo: trade screen
    PartyMenuAppData **partyMenu = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_RUNNING_APP_DATA);
    *partyMenu = sub_0203E5A4(HEAP_ID_32, ctx->fieldSystem);
    SetupNativeScript(ctx, ScrNative_WaitApplication);
    return TRUE;
}

BOOL ScrCmd_350(ScriptContext *ctx) { //todo: union pokemon selection
    PartyMenuAppData **partyMenu = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_RUNNING_APP_DATA);
    *partyMenu = sub_0203E6D4(ctx->fieldSystem->taskman, HEAP_ID_32);
    return TRUE;
}

BOOL ScrCmd_PartySelect(ScriptContext *ctx) { //todo: get selected pokemon slot
    u16 *dest_p = ScriptGetVarPointer(ctx);
    PartyMenuAppData **partyMenu = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_RUNNING_APP_DATA);
    GF_ASSERT(*partyMenu != NULL);
    *dest_p = sub_0203E5C8(*partyMenu);
    if (*dest_p == 7) {
        *dest_p = 255;
    }
    FreeToHeap(*partyMenu);
    *partyMenu = NULL;
    return FALSE;
}

BOOL ScrCmd_635(ScriptContext *ctx) {
    u16 *r5 = ScriptGetVarPointer(ctx);
    u16 *r6 = ScriptGetVarPointer(ctx);
    PartyMenuAppData **partyMenuPtr = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_RUNNING_APP_DATA);
    PartyMenuAppData *partyMenu;
    int r0;
    partyMenu = *partyMenuPtr;
    GF_ASSERT(*partyMenuPtr != NULL);
    r0 = sub_0203E5C8(*partyMenuPtr);
    if (r0 == 7) {
        *r5 = 255;
    } else if (r0 == 6) {
        *r5 = partyMenu->unk_30[0];
        (*r5)--;
        *r6 = partyMenu->unk_30[1];
        if (*r6 != 0) {
            (*r6)--;
        }
    }
    FreeToHeap(*partyMenuPtr);
    *partyMenuPtr = NULL;
    return FALSE;
}

BOOL ScrCmd_639(ScriptContext *ctx) {
    u16 *r5 = ScriptGetVarPointer(ctx);
    u16 *sp0 = ScriptGetVarPointer(ctx);
    u16 *r7 = ScriptGetVarPointer(ctx);
    struct PartyMenuAppData **partyMenuPtr = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_RUNNING_APP_DATA);
    struct PartyMenuAppData *partyMenu = *partyMenuPtr;
    GF_ASSERT(partyMenu != NULL);
    int r0 = sub_0203E5C8(*partyMenuPtr);
    if (r0 == 7) {
        *r5 = 255;
    } else if (r0 == 6) {
        *r5 = partyMenu->unk_30[0];
        (*r5)--;
        *sp0 = partyMenu->unk_30[1];
        (*sp0)--;
        *r7 = partyMenu->unk_30[2];
        if (*r7 != 0) {
            (*r7)--;
        }
    }
    FreeToHeap(*partyMenuPtr);
    *partyMenuPtr = NULL;
    return FALSE;
}

BOOL ScrCmd_645(ScriptContext *ctx) {
    u16 *r5 = ScriptGetVarPointer(ctx);
    u16 *sp0 = ScriptGetVarPointer(ctx);
    u16 *r7 = ScriptGetVarPointer(ctx);
    struct PartyMenuAppData **partyMenuPtr = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_RUNNING_APP_DATA);
    struct PartyMenuAppData *partyMenu = *partyMenuPtr;
    GF_ASSERT(partyMenu != NULL);
    int r0 = sub_0203E5C8(*partyMenuPtr);
    if (r0 == 7) {
        *r5 = 255;
    } else if (r0 == 6) {
        *r5 = partyMenu->unk_30[0];
        (*r5)--;
        *sp0 = partyMenu->unk_30[1];
        (*sp0)--;
        *r7 = partyMenu->unk_30[2];
        if (*r7 != 0) {
            (*r7)--;
        }
    }
    FreeToHeap(*partyMenuPtr);
    *partyMenuPtr = NULL;
    return FALSE;
}

BOOL ScrCmd_GetMoveSelection(ScriptContext *ctx) {
    u8 r6 = ScriptReadByte(ctx);
    u16 *r5 = ScriptGetVarPointer(ctx);
    void **p_work = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_RUNNING_APP_DATA); //presumably move selection data?
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

BOOL ScrCmd_ChooseMoveUI(ScriptContext *ctx) {
    void **p_work = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_RUNNING_APP_DATA);
    u8 r6 = ScriptReadByte(ctx);
    u16 r7 = ScriptGetVar(ctx);
    u16 r3 = ScriptGetVar(ctx);
    if (r6 == 1) {
        *p_work = sub_0203E7F4(HEAP_ID_32, ctx->fieldSystem, r7, r3);
    } else {
        *p_work = sub_0203FB94(HEAP_ID_32, ctx->fieldSystem, r7, r3);
    }
    SetupNativeScript(ctx, ScrNative_WaitApplication);
    return TRUE;
}

BOOL ScrCmd_GetPhoneBookRematch(ScriptContext *ctx) {
    u16 r4 = ScriptGetVar(ctx);
    u16 *r6 = ScriptGetVarPointer(ctx);
    struct PhoneBook *phoneBook = AllocAndReadPhoneBook(HEAP_ID_32);
    HandleLoadOverlay(FS_OVERLAY_ID(OVY_26), OVY_LOAD_ASYNC);
    *r6 = PhoneBookTrainerGetRematchInfo(r4, ctx->fieldSystem->saveData, phoneBook, (TimeOfDayWildParam)(u8)Field_GetTimeOfDayWildParam(ctx->fieldSystem));
    UnloadOverlayByID(FS_OVERLAY_ID(OVY_26));
    FreePhoneBook(phoneBook);
    return FALSE;
}

BOOL ScrCmd_684(ScriptContext *ctx) {
    u16 *p_dest = ScriptGetVarPointer(ctx);
    *p_dest = LocalFieldData_GetWeatherType(Save_LocalFieldData_Get(ctx->fieldSystem->saveData));
    return FALSE;
}

BOOL ScrNative_WaitApplication_DestroyTaskData(ScriptContext *ctx) {
    FieldSystem *fieldSystem = ctx->fieldSystem;
    void **p_work = FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_RUNNING_APP_DATA);
    if (FieldSystem_ApplicationIsRunning(fieldSystem)) {
        return FALSE;
    }
    FreeToHeap(*p_work);
    *p_work = NULL;
    return TRUE;
}

static BOOL sub_020429A0(ScriptContext *ctx) {
    FieldSystem *fieldSystem = ctx->fieldSystem;
    void **p_work = FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_RUNNING_APP_DATA);
    if (FieldSystem_ApplicationIsRunning(fieldSystem)) {
        return FALSE;
    }
    sub_02093070(fieldSystem);
    FreeToHeap(*p_work);
    *p_work = NULL;
    return TRUE;
}

static BOOL sub_020429D4(ScriptContext *ctx) {
    FieldSystem *fieldSystem = ctx->fieldSystem;
    void **p_work = FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_RUNNING_APP_DATA);
    if (!sub_020970C0(*p_work)) {
        return FALSE;
    }
    *p_work = NULL;
    return TRUE;
}

BOOL ScrNative_WaitApplication(ScriptContext *ctx) {
    if (!FieldSystem_ApplicationIsRunning(ctx->fieldSystem)) {
        return TRUE;
    } else {
        return FALSE;
    }
}

BOOL ScrCmd_150(ScriptContext *ctx) {
    sub_020552A4(ctx->fieldSystem->taskman);
    return TRUE;
}

BOOL ScrCmd_436(ScriptContext *ctx) {
    sub_0205525C(ctx->fieldSystem->taskman);
    return TRUE;
}

static BOOL sub_02042A30(FieldSystem *fieldSystem, int a1, int a2) {
    SaveFashionData *fashionData = Save_FashionData_Get(fieldSystem->saveData);
    if (a1 == 0) {
        if (!sub_0202B9EC(fashionData, a2)) {
            return FALSE;
        }
    } else {
        if (!sub_0202BA08(fashionData, a2)) {
            return FALSE;
        }
    }
    return TRUE;
}

static FashionAppData *sub_02042A60(HeapID heapId, FieldSystem *fieldSystem, int a2, int a3) {
    SaveFashionData *saveFashionData = Save_FashionData_Get(fieldSystem->saveData);
    FashionAppData *fashionAppData;
    if (!sub_02042A30(fieldSystem, a2, a3)) {
        return NULL;
    }
    fashionAppData = AllocFromHeap(heapId, sizeof(FashionAppData));
    memset(fashionAppData, 0, sizeof(FashionAppData));
    fashionAppData->saveFashionData = saveFashionData;
    fashionAppData->unk_8 = a2;
    fashionAppData->unk_4 = a3;
    return fashionAppData;
}

BOOL ScrCmd_151(ScriptContext *ctx) {
    ov01_021F729C(ctx->fieldSystem);
    return TRUE;
}

BOOL ScrCmd_152(ScriptContext *ctx) {
    sub_02078B58(ctx->taskman);
    return TRUE;
}

BOOL ScrCmd_153(ScriptContext *ctx) {
    struct FashionAppData **p_data = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_RUNNING_APP_DATA);
    u16 *p_dest = ScriptGetVarPointer(ctx);
    *p_dest = (*p_data)->unk_4;
    FreeToHeap(*p_data);
    return FALSE;
}

BOOL ScrCmd_451(ScriptContext *ctx) {
    u16 *p_dest = ScriptGetVarPointer(ctx);
    *p_dest = sub_0203769C();
    return TRUE;
}

BOOL ScrCmd_452(ScriptContext *ctx) {
    struct PokepicManager **p_work = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MISC_DATA_PTR);
    u16 species = ScriptGetVar(ctx);
    u16 gender = ScriptGetVar(ctx);
    LoadUserFrameGfx1(ctx->fieldSystem->bgConfig, GF_BG_LYR_MAIN_3, 0x3D9, 0xB, 0, HEAP_ID_4);
    *p_work = DrawPokemonPicFromSpecies(ctx->fieldSystem->bgConfig, GF_BG_LYR_MAIN_3, 10, 5, 11, 0x3D9, species, gender, HEAP_ID_4);
    Script_SetMonSeenFlagBySpecies(ctx->fieldSystem, species);
    return FALSE;
}

BOOL ScrCmd_547(ScriptContext *ctx) {
    struct PokepicManager **p_work = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MISC_DATA_PTR);
    u16 partyIdx = ScriptGetVar(ctx);
    Pokemon *mon = Party_GetMonByIndex(SaveArray_Party_Get(ctx->fieldSystem->saveData), partyIdx);
    LoadUserFrameGfx1(ctx->fieldSystem->bgConfig, GF_BG_LYR_MAIN_3, 0x3D9, 0xB, 0, HEAP_ID_4);
    *p_work = DrawPokemonPicFromMon(ctx->fieldSystem->bgConfig, GF_BG_LYR_MAIN_3, 10, 5, 11, 0x3D9, mon, HEAP_ID_4);
    return FALSE;
}

BOOL ScrCmd_453(ScriptContext *ctx) {
    u8 **r0 = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MISC_DATA_PTR);
    **r0 = 1;
    return TRUE;
}

BOOL ScrCmd_548(ScriptContext *ctx) {
    u8 **r0 = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MISC_DATA_PTR);
    **r0 = 2;
    return TRUE;
}

BOOL ScrCmd_549(ScriptContext *ctx) {
    ctx->data[0] = ScriptReadHalfword(ctx);
    SetupNativeScript(ctx, sub_02042C78);
    return TRUE;
}

BOOL sub_02042C78(ScriptContext *ctx) {
    u8 **r0 = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MISC_DATA_PTR);
    u16 *dest_p = GetVarPointer(ctx->fieldSystem, ctx->data[0]);
    return **r0 != 3;
}

BOOL ScrCmd_454(ScriptContext *ctx) {
    LocalMapObject **p_lastInteracted = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_LAST_INTERACTED);
    HandleLoadOverlay(FS_OVERLAY_ID(OVY_26), OVY_LOAD_ASYNC);
    if (*p_lastInteracted != NULL) {
        ov26_022599D8(ctx->fieldSystem, *p_lastInteracted);
    }
    UnloadOverlayByID(FS_OVERLAY_ID(OVY_26));
    return FALSE;
}

BOOL ScrCmd_681(ScriptContext *ctx) {
    u16 *var_p = ScriptGetVarPointer(ctx);
    sub_020961D8(ctx->taskman, var_p);
    return TRUE;
}

BOOL ScrCmd_154(ScriptContext *ctx) {
    u16 r4 = ScriptGetVar(ctx);
    u16 *r6 = ScriptGetVarPointer(ctx);
    u16 sp0 = ScriptGetVar(ctx);
    sub_0203F198(ctx->fieldSystem->taskman, r6, ctx->fieldSystem->saveData, r4, sp0);
    return TRUE;
}

BOOL ScrCmd_155(ScriptContext *ctx) {
    struct FashionAppData **fashionAppData = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_RUNNING_APP_DATA);
    u16 r7 = ScriptReadHalfword(ctx);
    u16 *r6 = ScriptGetVarPointer(ctx);
    *fashionAppData = sub_02042A60(HEAP_ID_FIELD, ctx->fieldSystem, 0, r7);
    if (*fashionAppData == NULL) {
        *r6 = 1;
        return TRUE;
    } else {
        *r6 = 0;
        sub_0203F204(ctx->fieldSystem, *fashionAppData);
        SetupNativeScript(ctx, ScrNative_WaitApplication_DestroyTaskData);
        return TRUE;
    }
}

BOOL ScrCmd_255(ScriptContext *ctx) {
    u16 r6 = ScriptReadHalfword(ctx);
    u16 *r4 = ScriptGetVarPointer(ctx);
    if (sub_02042A30(ctx->fieldSystem, 0, r6) == TRUE) {
        *r4 = 1;
        return TRUE;
    } else {
        *r4 = 0;
        return TRUE;
    }
}

BOOL ScrCmd_256(ScriptContext *ctx) {
    u16 r4 = ScriptGetVar(ctx);
    sub_0202BD7C(sub_0202B9B8(Save_FashionData_Get(ctx->fieldSystem->saveData), 0), r4);
    return TRUE;
}

BOOL ScrCmd_450(ScriptContext *ctx) {
    sub_0203F964(ctx->fieldSystem);
    SetupNativeScript(ctx, ScrNative_WaitApplication);
    return TRUE;
}

BOOL ScrCmd_156(ScriptContext *ctx) {
    sub_0206B910(ctx->taskman, ctx->fieldSystem->saveData);
    return TRUE;
}

BOOL ScrCmd_TownMap(ScriptContext *ctx) {
    TownMap **p_townMap = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_RUNNING_APP_DATA);
    *p_townMap = TownMap_New(ctx->fieldSystem, 1);
    SetupNativeScript(ctx, ScrNative_WaitApplication_DestroyTaskData);
    return TRUE;
}

BOOL ScrCmd_408(ScriptContext *ctx) {
    u16 r7 = ScriptGetVar(ctx);
    u16 sp0 = ScriptGetVar(ctx);
    struct UnkStruct_ScrCmd408 **p_work = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_RUNNING_APP_DATA);
    *p_work = AllocFromHeap(HEAP_ID_FIELD, sizeof(struct UnkStruct_ScrCmd408));
    InitUnkStructScrCmd408(*p_work, r7, sp0, ctx);
    sub_0203F0A8(ctx->fieldSystem, *p_work);
    SetupNativeScript(ctx, ScrNative_WaitApplication_DestroyTaskData);
    return TRUE;
}

BOOL ScrCmd_158(ScriptContext *ctx) { //todo: PC box screen
    struct PCBoxAppData **p_work;

    p_work = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_RUNNING_APP_DATA);
    *p_work = PCBoxAppData_New(ctx);
    sub_0203E868(ctx->fieldSystem, *p_work);
    SetupNativeScript(ctx, sub_020429A0);
    return TRUE;
}

BOOL ScrCmd_159(ScriptContext *ctx) {
    sub_0203F4C8(ctx->fieldSystem);
    SetupNativeScript(ctx, ScrNative_WaitApplication);
    return TRUE;
}

BOOL ScrCmd_160(ScriptContext *ctx) {
    sub_02069464(ctx->fieldSystem);
    return TRUE;
}

BOOL ScrCmd_161(ScriptContext *ctx) {
    sub_0203F4A8(ctx->fieldSystem->taskman);
    return TRUE;
}

BOOL ScrCmd_162(ScriptContext *ctx) {
    void **p_work = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_RUNNING_APP_DATA);
    *p_work = sub_0203F4F8(ctx->fieldSystem);
    SetupNativeScript(ctx, ScrNative_WaitApplication_DestroyTaskData);
    return TRUE;
}

BOOL ScrCmd_HOF_Credits(ScriptContext *ctx) {
    u16 vsTrainerRed = ScriptReadHalfword(ctx);
    CallTask_GameClear(ctx->fieldSystem->taskman, vsTrainerRed);
    return TRUE;
}

BOOL ScrCmd_164(ScriptContext *ctx) {
    void **p_work = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_RUNNING_APP_DATA); //todo: hall of fame data
    *p_work = sub_0203F984(ctx->fieldSystem);
    SetupNativeScript(ctx, ScrNative_WaitApplication_DestroyTaskData);
    return TRUE;
}

BOOL ScrCmd_706(ScriptContext *ctx) {
    int saveOk;
    HALL_OF_FAME *hof = LoadHallOfFame(ctx->fieldSystem->saveData, HEAP_ID_4, &saveOk);
    u16 *p_var = ScriptGetVarPointer(ctx);
    *p_var = 0;
    if (saveOk == 2) {
        *p_var = 1;
    }
    FreeToHeap(hof);
    return FALSE;
}

BOOL ScrCmd_165(ScriptContext *ctx) {
    u16 r6 = ScriptGetVar(ctx);
    u16 *r4 = ScriptGetVarPointer(ctx);
    if (sub_0203A05C(ctx->fieldSystem->saveData)) {
        *r4 = 1;
        sub_0203F844(ctx->fieldSystem, r6);
        SetupNativeScript(ctx, ScrNative_WaitApplication);
    } else {
        *r4 = 0;
    }
    return TRUE;
}

BOOL ScrCmd_166(ScriptContext *ctx) {
    u16 *var_p = ScriptGetVarPointer(ctx);
    sub_02078B78(ctx->taskman, var_p);
    return TRUE;
}

BOOL ScrCmd_ChooseStarter(ScriptContext *ctx) {
    LaunchStarterChoiceScene(ctx->fieldSystem);
    return TRUE;
}

BOOL ScrCmd_333(ScriptContext *ctx) { //todo: bag select screen
    void **p_work;
    u8 r4 = ScriptReadByte(ctx) != 0 ? 1 : 0;
    p_work = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_RUNNING_APP_DATA);
    GF_ASSERT(*p_work == NULL);
    *p_work = sub_0203E460(ctx->fieldSystem, r4);
    SetupNativeScript(ctx, ScrNative_WaitApplication);
    return TRUE;
}

BOOL ScrCmd_334(ScriptContext *ctx) { //todo: bag select screen result
    u16 *r5 = ScriptGetVarPointer(ctx);
    void **p_work = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_RUNNING_APP_DATA);
    GF_ASSERT(*p_work != NULL);
    *r5 = sub_0203E4CC(*p_work);
    FreeToHeap(*p_work);
    *p_work = NULL;
    return FALSE;
}

BOOL ScrCmd_370(ScriptContext *ctx) { //unknown? possibly daycare select screen??
    void **p_work;
    u8 r4 = ScriptReadByte(ctx) != 0 ? 1 : 0;
    p_work = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_RUNNING_APP_DATA);
    GF_ASSERT(*p_work == NULL);
    *p_work = sub_0203E460(ctx->fieldSystem, r4);
    SetupNativeScript(ctx, ScrNative_WaitApplication_DestroyTaskData);
    return TRUE;
}

BOOL ScrCmd_NamePlayer(ScriptContext *ctx) {
    u16 *p_var = ScriptGetVarPointer(ctx);
    CreateNamingScreen(ctx->taskman, NAMINGSCREEN_PLAYER, 0, PLAYER_NAME_LENGTH, 0, NULL, p_var);
    return TRUE;
}

BOOL ScrCmd_NameRival(ScriptContext *ctx) {
    u16 *p_var = ScriptGetVarPointer(ctx);
    CreateNamingScreen(ctx->taskman, NAMINGSCREEN_RIVAL, 0, PLAYER_NAME_LENGTH, 0, NULL, p_var);
    return TRUE;
}

BOOL ScrCmd_NicknameInput(ScriptContext *ctx) {
    FieldSystem *fieldSystem = ctx->fieldSystem;
    u16 partyPos = ScriptGetVar(ctx);
    BUGCONTEST *contest;
    Pokemon *mon;
    u16 nickname[20];
    u16 *var_ret;
    int species;

    if (partyPos == 255) {
        contest = FieldSystem_BugContest_Get(fieldSystem);
        if (!contest->caught_poke) {
            return TRUE;
        }
        mon = contest->mon;
    } else {
        mon = Party_GetMonByIndex(SaveArray_Party_Get(fieldSystem->saveData), partyPos);
    }
    GetMonData(mon, MON_DATA_NICKNAME, nickname);
    var_ret = ScriptGetVarPointer(ctx);
    species = GetMonData(mon, MON_DATA_SPECIES, NULL);
    CreateNamingScreen(ctx->taskman, NAMINGSCREEN_POKEMON, species, POKEMON_NAME_LENGTH, partyPos, nickname, var_ret);
    return TRUE;
}

BOOL ScrCmd_629(ScriptContext *ctx) {
    void **p_work = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_RUNNING_APP_DATA);
    *p_work = sub_0209707C(ctx->fieldSystem);
    SetupNativeScript(ctx, sub_020429D4);
    return TRUE;
}

BOOL ScrCmd_630(ScriptContext *ctx) {
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

BOOL ScrCmd_492(ScriptContext *ctx) {
    u16 r4 = ScriptGetVar(ctx);
    u16 *r6 = ScriptGetVarPointer(ctx);
    u16 *r3 = ScriptGetVarPointer(ctx);

    *r3 = 0xFFFF;
    sub_0203E960(ctx->fieldSystem->taskman, r4, r6, r3, NULL);
    return TRUE;
}

BOOL ScrCmd_PromptEasyChat(ScriptContext *ctx) {
    u16 *r6 = ScriptGetVarPointer(ctx);
    u16 *r4 = ScriptGetVarPointer(ctx);
    u16 *r0 = ScriptGetVarPointer(ctx);

    *r4 = 0xFFFF;
    *r0 = 0xFFFF;
    sub_0203E960(ctx->fieldSystem->taskman, 1, r6, r4, r0);
    return TRUE;
}

BOOL ScrCmd_494(ScriptContext *ctx) {
    MessageFormat **p_msgFmt = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MESSAGE_FORMAT);
    u16 idx = ScriptGetVar(ctx);
    u16 word = ScriptGetVar(ctx);
    BufferECWord(*p_msgFmt, idx, word);
    return FALSE;
}

BOOL ScrCmd_FadeScreen(ScriptContext *ctx) {
    u16 duration = ScriptReadHalfword(ctx);
    u16 speed = ScriptReadHalfword(ctx);
    u16 type = ScriptReadHalfword(ctx);
    u16 color = ScriptReadHalfword(ctx);
    BeginNormalPaletteFade(0, type, type, color, duration, speed, HEAP_ID_4);
    sub_0200FBDC(0);
    sub_0200FBDC(1);
    return FALSE;
}

BOOL sub_02043458(ScriptContext *ctx);

BOOL ScrCmd_WaitFade(ScriptContext *ctx) {
    SetupNativeScript(ctx, sub_02043458);
    return TRUE;
}

BOOL sub_02043458(ScriptContext *ctx) {
    return IsPaletteFadeFinished() == TRUE;
}

BOOL ScrCmd_Warp(ScriptContext *ctx) {
    u16 mapId = ScriptGetVar(ctx);
    u16 unused = ScriptReadHalfword(ctx);
    u16 x = ScriptGetVar(ctx);
    u16 y = ScriptGetVar(ctx);
    u16 direction = ScriptGetVar(ctx);
    CallTask_ScriptWarp(ctx->taskman, mapId, -1, x, y, direction);
    return TRUE;
}

BOOL ScrCmd_448(ScriptContext *ctx) {
    u16 mapId = ScriptReadHalfword(ctx);
    u16 unused = ScriptReadHalfword(ctx);
    u16 x = ScriptGetVar(ctx);
    u16 y = ScriptGetVar(ctx);
    u16 direction = ScriptReadHalfword(ctx);
    sub_0205412C(ctx->fieldSystem->taskman, mapId, -1, x, y, direction);
    return TRUE;
}

BOOL ScrCmd_449(ScriptContext *ctx) {
    sub_02054190(ctx->fieldSystem->taskman);
    return TRUE;
}

BOOL ScrCmd_445(ScriptContext *ctx) {
    Location *location = LocalFieldData_GetPreviousPosition(Save_LocalFieldData_Get(ctx->fieldSystem->saveData));
    u16 *ret_p = ScriptGetVarPointer(ctx);
    *ret_p = location->mapId;
    return FALSE;
}

BOOL ScrCmd_446(ScriptContext *ctx) {
    u16 *ret_p = ScriptGetVarPointer(ctx);
    *ret_p = ctx->fieldSystem->location->mapId;
    return FALSE;
}

BOOL ScrCmd_840(ScriptContext *ctx) {
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

BOOL ScrCmd_RockClimb(ScriptContext *ctx) {
    u16 partySlot = ScriptGetVar(ctx);
    int playerDirection = PlayerAvatar_GetFacingDirection(ctx->fieldSystem->playerAvatar);
    CallFieldTask_RockClimb(ctx->taskman, playerDirection, partySlot);
    return TRUE;
}

BOOL ScrCmd_Surf(ScriptContext *ctx) {
    u16 partySlot = ScriptGetVar(ctx);
    int playerDirection = PlayerAvatar_GetFacingDirection(ctx->fieldSystem->playerAvatar);
    CallFieldTask_Surf(ctx->taskman, playerDirection, partySlot);
    return TRUE;
}

BOOL ScrCmd_Waterfall(ScriptContext *ctx) {
    u16 partySlot = ScriptGetVar(ctx);
    int playerDirection = PlayerAvatar_GetFacingDirection(ctx->fieldSystem->playerAvatar);
    CallFieldTask_Waterfall(ctx->taskman, playerDirection, partySlot);
    return TRUE;
}

BOOL ScrCmd_180(ScriptContext *ctx) {
    u16 mapId = ScriptReadHalfword(ctx);
    u16 x = ScriptGetVar(ctx);
    u16 y = ScriptGetVar(ctx);
    sub_020538C0(ctx->fieldSystem, mapId, -1, x, y, DIR_SOUTH);
    return TRUE;
}

BOOL ScrCmd_FlashEffect(ScriptContext *ctx) {
    LocalFieldData *localFieldData = Save_LocalFieldData_Get(ctx->fieldSystem->saveData);
    LocalFieldData_SetWeatherType(localFieldData, 12);
    FieldWeatherUpdate_UsedFlash(ctx->fieldSystem->unk4->unk_0C, LocalFieldData_GetWeatherType(localFieldData)); //CallFieldTask_Flash?
    return TRUE;
}

BOOL ScrCmd_Whirlpool(ScriptContext *ctx) {
    u16 partySlot = ScriptGetVar(ctx);
    int playerDirection = PlayerAvatar_GetFacingDirection(ctx->fieldSystem->playerAvatar);
    CallFieldTask_Whirlpool(ctx->taskman, playerDirection, partySlot);
    return TRUE;
}

BOOL sub_0204378C(ScriptContext *ctx);

BOOL ScrCmd_183(ScriptContext *ctx) {
    void **p_work = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MISC_DATA_PTR);
    u16 partyIdx = ScriptGetVar(ctx);
    Pokemon *mon = Party_GetMonByIndex(SaveArray_Party_Get(ctx->fieldSystem->saveData), partyIdx);
    int playerGender = PlayerAvatar_GetGender(ctx->fieldSystem->playerAvatar);
    *p_work = ov02_02249458(ctx->fieldSystem, 0, mon, playerGender);
    SetupNativeScript(ctx, sub_0204378C);
    return TRUE;
}

BOOL sub_0204378C(ScriptContext *ctx) {
    void **p_work = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MISC_DATA_PTR);
    if (ov02_0224953C(*p_work) == TRUE) {
        ov02_02249548(*p_work);
        return TRUE;
    } else {
        return FALSE;
    }
}

BOOL ScrCmd_PlayerOnBikeCheck(ScriptContext *ctx) {
    u16 *p_ret = ScriptGetVarPointer(ctx);
    if (PlayerAvatar_GetState(ctx->fieldSystem->playerAvatar) == PLAYER_STATE_CYCLING) {
        *p_ret = TRUE;
    } else {
        *p_ret = FALSE;
    }
    return FALSE;
}

BOOL ScrCmd_PlayerOnBikeSet(ScriptContext *ctx) {
    u8 flag = ScriptReadByte(ctx);
    if (flag == TRUE) {
        FieldSystem_SetSavedMusicId(ctx->fieldSystem, SEQ_GS_BICYCLE);
        FieldSystem_PlayOrFadeToNewMusicId(ctx->fieldSystem, SEQ_GS_BICYCLE, 1);
        Field_PlayerAvatar_OrrTransitionFlags(ctx->fieldSystem->playerAvatar, PLAYER_TRANSITION_CYCLING);
        Field_PlayerAvatar_ApplyTransitionFlags(ctx->fieldSystem->playerAvatar);
    } else {
        Field_PlayerAvatar_OrrTransitionFlags(ctx->fieldSystem->playerAvatar, PLAYER_TRANSITION_WALKING);
        Field_PlayerAvatar_ApplyTransitionFlags(ctx->fieldSystem->playerAvatar);
        FieldSystem_SetSavedMusicId(ctx->fieldSystem, 0);
        FieldSystem_PlayOrFadeToNewMusicId(ctx->fieldSystem, FieldSystem_GetOverriddenMusicId(ctx->fieldSystem, ctx->fieldSystem->location->mapId), 1);
    }
    return FALSE;
}

BOOL ScrCmd_591(ScriptContext *ctx) {
    FieldSystem_SetSavedMusicId(ctx->fieldSystem, SEQ_PL_BICYCLE);
    return FALSE;
}

BOOL ScrCmd_186(ScriptContext *ctx) {
    u8 r1 = ScriptReadByte(ctx);
    sub_0205CAA4(ctx->fieldSystem->playerAvatar, r1);
    return FALSE;
}

BOOL ScrCmd_GetPlayerState(ScriptContext *ctx) {
    u16 *p_ret = ScriptGetVarPointer(ctx);
    *p_ret = PlayerAvatar_GetState(ctx->fieldSystem->playerAvatar);
    return FALSE;
}

BOOL ScrCmd_SetAvatarBits(ScriptContext *ctx) {
    u16 flags = ScriptReadHalfword(ctx);
    PlayerAvatar_OrrTransitionFlags(ctx->fieldSystem->playerAvatar, flags);
    return TRUE;
}

BOOL ScrCmd_UpdateAvatarState(ScriptContext *ctx) {
    Field_PlayerAvatar_ApplyTransitionFlags(ctx->fieldSystem->playerAvatar);
    return FALSE;
}

BOOL ScrCmd_211(ScriptContext *ctx) {
    RoamerSaveData *roamerSave = Save_Roamers_Get(ctx->fieldSystem->saveData);
    u16 *r6 = ScriptGetVarPointer(ctx);
    u16 *r4 = ScriptGetVarPointer(ctx);
    GetSwarmInfoFromRand(Roamers_GetRand(roamerSave, 2), r6, r4);
    return FALSE;
}

BOOL ScrCmd_GetStarterChoice(ScriptContext *ctx) {
    u16 *p_ret = ScriptGetVarPointer(ctx);
    *p_ret = Save_VarsFlags_GetStarter(Save_VarsFlags_Get(ctx->fieldSystem->saveData));
    return FALSE;
}

BOOL ScrCmd_SetStarterChoice(ScriptContext *ctx) {
    u16 choice = ScriptGetVar(ctx);
    Save_VarsFlags_SetStarter(Save_VarsFlags_Get(ctx->fieldSystem->saveData), choice);
    return FALSE;
}

BOOL ScrCmd_TrainerMessage(ScriptContext *ctx) {
    FieldSystem *fieldSystem = ctx->fieldSystem;

    u16 *p_scripno = FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_ACTIVE_SCRIPT_NUMBER);
    String **p_strbuf1 = FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_STRING_BUFFER_0);
    u8 *p_printerno = FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_TEXT_PRINTER_NUMBER);
    u16 trainerno = ScriptGetVar(ctx);
    u16 msgno = ScriptGetVar(ctx);

    GetTrainerMessageByIdPair(trainerno, msgno, *p_strbuf1, HEAP_ID_FIELD);
    FillWindowPixelBuffer(FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_WINDOW), 15);
    *p_printerno = sub_0205B5B4(
        FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_WINDOW),
        *p_strbuf1,
        Save_PlayerData_GetOptionsAddr(ctx->fieldSystem->saveData),
        TRUE
    );
    SetupNativeScript(ctx, ov01_021EF348);
    return TRUE;
}

BOOL sub_02043A98(ScriptContext *ctx);

BOOL ScrCmd_226(ScriptContext *ctx) {
    FieldSystem *fieldSystem = ctx->fieldSystem;
    u16 r7 = ScriptGetVar(ctx);
    u16 sp0 = ScriptGetVar(ctx);
    u16 sp4 = ScriptGetVar(ctx);
    u16 r6 = ScriptReadHalfword(ctx);
    ov03_02255BB0(fieldSystem, r7, sp0, sp4);
    ctx->data[0] = r6;
    SetupNativeScript(ctx, sub_02043A98);
    return TRUE;
}

BOOL sub_02043A98(ScriptContext *ctx) {
    u16 *p_ret = GetVarPointer(ctx->fieldSystem, ctx->data[0]);
    int result = ov03_02255BFC();
    if (result == 0) {
        return FALSE;
    } else {
        *p_ret = result;
        return TRUE;
    }
}

BOOL sub_02043B30(ScriptContext *ctx);

BOOL ScrCmd_227(ScriptContext *ctx) {
    FieldSystem *fieldSystem = ctx->fieldSystem;
    u16 r7 = ScriptGetVar(ctx);
    u16 sp0 = ScriptGetVar(ctx);
    u16 sp4 = ScriptGetVar(ctx);
    u16 r6 = ScriptReadHalfword(ctx);
    ov03_02255C18(fieldSystem, r7, sp0, sp4);
    ctx->data[0] = r6;
    SetupNativeScript(ctx, sub_02043B30);
    return TRUE;
}

BOOL sub_02043B30(ScriptContext *ctx) {
    u16 *p_ret = GetVarPointer(ctx->fieldSystem, ctx->data[0]);
    int result = ov03_02255C64();
    if (result == 0) {
        return FALSE;
    } else {
        *p_ret = result;
        return TRUE;
    }
}

BOOL ScrCmd_228(ScriptContext *ctx) {
    u16 unused = ScriptReadHalfword(ctx);
    return TRUE;
}

BOOL ScrCmd_229(ScriptContext *ctx) {
    u16 unused = ScriptReadHalfword(ctx);
    return TRUE;
}

BOOL ScrCmd_230(ScriptContext *ctx) {
    struct UnkStruct_ScrCmd230 **p_work = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_RUNNING_APP_DATA);
    struct UnkStruct_ScrCmd230 *work = *p_work;
    sub_02051428(ctx->fieldSystem->taskman, &work->unk_30, 5);
    FreeToHeap(work);
    *p_work = NULL;
    return TRUE;
}

BOOL ScrCmd_231(ScriptContext *ctx) {
    // dummy
    return TRUE;
}

BOOL ScrCmd_SetDynamicWarp(ScriptContext *ctx) {
    Location warp;
    warp.mapId = ScriptGetVar(ctx);
    warp.warpId = ScriptGetVar(ctx);
    warp.x = ScriptGetVar(ctx);
    warp.y = ScriptGetVar(ctx);
    warp.direction = ScriptGetVar(ctx);
    LocalFieldData_SetDynamicWarp(Save_LocalFieldData_Get(ctx->fieldSystem->saveData), &warp);
    return FALSE;
}

BOOL ScrCmd_GetDynamicWarpFloorNo(ScriptContext *ctx) {
    u16 *p_ret = ScriptGetVarPointer(ctx);
    Location *warp = LocalFieldData_GetDynamicWarp(Save_LocalFieldData_Get(ctx->fieldSystem->saveData));
    *p_ret = MapNumToFloorNo(warp->mapId);
    return FALSE;
}

BOOL ScrCmd_ElevatorCurFloorBox(ScriptContext *ctx) {
    FieldSystem *fieldSystem = ctx->fieldSystem;
    MessageFormat **p_msgFmt = FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_MESSAGE_FORMAT);
    u8 x = ScriptReadByte(ctx);
    u8 y = ScriptReadByte(ctx);
    u16 *p_ret = ScriptGetVarPointer(ctx);
    u16 floor = ScriptGetVar(ctx);
    PrintCurFloorInNewWindow(fieldSystem, x, y, p_ret, *p_msgFmt, floor);
    return FALSE;
}

BOOL ScrCmd_CountJohtoDexSeen(ScriptContext *ctx) {
    Pokedex *pokedex = Save_Pokedex_Get(ctx->fieldSystem->saveData);
    u16 *p_ret = ScriptGetVarPointer(ctx);
    *p_ret = Pokedex_CountJohtoDexSeen(pokedex);
    return FALSE;
}

BOOL ScrCmd_CountJohtoDexOwned(ScriptContext *ctx) {
    Pokedex *pokedex = Save_Pokedex_Get(ctx->fieldSystem->saveData);
    u16 *p_ret = ScriptGetVarPointer(ctx);
    *p_ret = Pokedex_CountJohtoDexOwned(pokedex);
    return FALSE;
}

BOOL ScrCmd_CountNationalDexSeen(ScriptContext *ctx) {
    Pokedex *pokedex = Save_Pokedex_Get(ctx->fieldSystem->saveData);
    u16 *p_ret = ScriptGetVarPointer(ctx);
    *p_ret = Pokedex_CountNationalDexSeen(pokedex);
    return FALSE;
}

BOOL ScrCmd_CountNationalDexOwned(ScriptContext *ctx) {
    Pokedex *pokedex = Save_Pokedex_Get(ctx->fieldSystem->saveData);
    u16 *p_ret = ScriptGetVarPointer(ctx);
    *p_ret = Pokedex_CountNationalDexOwned(pokedex);
    return FALSE;
}

BOOL ScrCmd_247(ScriptContext *ctx) {
    // dummy
    return FALSE;
}

BOOL ScrCmd_GetDexEvalResult(ScriptContext *ctx) {
    Pokedex *pokedex = Save_Pokedex_Get(ctx->fieldSystem->saveData);
    PlayerProfile *profile = Save_PlayerData_GetProfileAddr(ctx->fieldSystem->saveData);
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

BOOL ScrCmd_RocketTrapBattle(ScriptContext *ctx) {
    u32 *winFlag = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_BATTLE_WIN_FLAG);
    u16 species = ScriptGetVar(ctx);
    u16 level = ScriptGetVar(ctx);
    SetupAndStartWildBattle(ctx->taskman, species, level, winFlag, FALSE, FALSE);
    return TRUE;
}

BOOL ScrCmd_WildBattle(ScriptContext *ctx) {
    u32 *winFlag = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_BATTLE_WIN_FLAG);
    u16 species = ScriptGetVar(ctx);
    u16 level = ScriptGetVar(ctx);
    u8 shiny = ScriptReadByte(ctx);
    SetupAndStartWildBattle(ctx->taskman, species, level, winFlag, TRUE, shiny);
    return TRUE;
}

BOOL ScrCmd_686(ScriptContext *ctx) {
    u32 *winFlag = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_BATTLE_WIN_FLAG);
    u16 species = ScriptGetVar(ctx);
    u16 level = ScriptGetVar(ctx);
    sub_02051090(ctx->taskman, species, level, winFlag, TRUE);
    return TRUE;
}

BOOL ScrCmd_250(ScriptContext *ctx) {
    u16 species = ScriptGetVar(ctx);
    u16 level = ScriptGetVar(ctx);
    sub_02051228(ctx->taskman, species, level);
    return TRUE;
}

BOOL ScrCmd_CatchingTutorial(ScriptContext *ctx) {
    SetupAndStartTutorialBattle(ctx->taskman);
    return TRUE;
}

BOOL ScrCmd_252(ScriptContext *ctx) {
    sub_0203F818(ctx->fieldSystem);
    SetupNativeScript(ctx, ScrNative_WaitApplication);
    return TRUE;
}

BOOL ScrCmd_GetSaveFileState(ScriptContext *ctx) {
    SaveData *saveData = ctx->fieldSystem->saveData;
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

BOOL ScrCmd_SaveGameNormal(ScriptContext *ctx) {
    FieldSystem *fieldSystem = ctx->fieldSystem;
    u16 *p_ret = ScriptGetVarPointer(ctx);

    *p_ret = Field_SaveGameNormal(fieldSystem);
    return FALSE;
}

BOOL ScrCmd_SaveWipeExtraChunks(ScriptContext *ctx) {
    Save_WipeExtraChunks(ctx->fieldSystem->saveData);
    return FALSE;
}

BOOL ScrCmd_642(ScriptContext *ctx) {
    u16 *p_ret = ScriptGetVarPointer(ctx);
    *p_ret = Save_CheckExtraChunksExist(ctx->fieldSystem->saveData);
    return FALSE;
}

BOOL sub_02044054(ScriptContext *ctx);

BOOL ScrCmd_257(ScriptContext *ctx) {
    u16 r0 = ScriptGetVar(ctx);
    ctx->data[0] = r0;
    sub_02037AC0(r0);
    SetupNativeScript(ctx, sub_02044054);
    return TRUE;
}

BOOL sub_02044054(ScriptContext *ctx) {
    if (sub_02037454() < 2) {
        return TRUE;
    } else {
        return sub_02037B38(ctx->data[0]);
    }
}

BOOL ScrCmd_258(ScriptContext *ctx) {
    sub_02037BEC();
    return FALSE;
}

BOOL ScrCmd_259(ScriptContext *ctx) {
    MessageFormat **p_msgFmt = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MESSAGE_FORMAT);
    u16 *p_ret = ScriptGetVarPointer(ctx);

    *p_ret = sub_0205A6AC(*p_msgFmt);
    return FALSE;
}

BOOL ScrCmd_260(ScriptContext *ctx) {
    u16 *p_ret = ScriptGetVarPointer(ctx);
    MessageFormat **p_msgFmt = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MESSAGE_FORMAT);

    *p_ret = sub_0205A9A0(ctx->fieldSystem->unk80, *p_msgFmt);
    return FALSE;
}

BOOL ScrCmd_261(ScriptContext *ctx) {
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

BOOL ScrCmd_264(ScriptContext *ctx) {
    LocalMapObject **p_lastInteracted = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_LAST_INTERACTED);
    MessageFormat **p_msgFmt = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MESSAGE_FORMAT);
    u16 r4 = ScriptReadHalfword(ctx);
    PlayerProfile *profile = Save_PlayerData_GetProfileAddr(FieldSystem_GetSaveData(ctx->fieldSystem));
    SaveEasyChat *easyChat = Save_EasyChat_Get(FieldSystem_GetSaveData(ctx->fieldSystem));
    u16 objId;

    if (r4 == 0) {
        objId = MapObject_GetID(*p_lastInteracted);
    } else {
        objId = 0;
    }
    sub_0205AA9C(*p_msgFmt, r4, objId, profile, easyChat);
    return FALSE;
}

BOOL ScrCmd_265(ScriptContext *ctx) {
    sub_02091574(ctx->fieldSystem);
    return FALSE;
}

BOOL sub_020441C4(ScriptContext *ctx);

BOOL ScrCmd_266(ScriptContext *ctx) {
    sub_0205AD0C(ctx->fieldSystem->unk84);
    sub_02037FF0();
    SetupNativeScript(ctx, sub_020441C4);
    return TRUE;
}

BOOL sub_020441C4(ScriptContext *ctx) {
    return sub_02037454() < 2;
}

BOOL ScrCmd_267(ScriptContext *ctx) {
    LocalMapObject **p_lastInteracted = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_LAST_INTERACTED);
    u16 sp0 = ScriptReadHalfword(ctx);
    u16 *p_ret = ScriptGetVarPointer(ctx);
    MessageFormat **p_msgFmt = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MESSAGE_FORMAT);
    *p_ret = sub_0205A750(ctx->fieldSystem->unk80, MapObject_GetID(*p_lastInteracted), sp0, *p_msgFmt);
    return FALSE;
}

BOOL ScrCmd_586(ScriptContext *ctx) {
    u16 *p_ret = ScriptGetVarPointer(ctx);
    *p_ret = sub_0205A4D8(ctx->fieldSystem->unk80);
    if (*p_ret) {
        void **p_work = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_RUNNING_APP_DATA);
        FreeToHeap(*p_work);
    }
    return FALSE;
}

BOOL ScrCmd_268(ScriptContext *ctx) {
    FieldSystem *fieldSystem = ctx->fieldSystem;
    LocalMapObject **p_lastInteracted = FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_LAST_INTERACTED);
    u16 *p_ret = ScriptGetVarPointer(ctx);
    *p_ret = sub_0205A200(fieldSystem->unk80, MapObject_GetID(*p_lastInteracted));
    return FALSE;
}

BOOL ScrCmd_274(ScriptContext *ctx) {
    FieldSystem *fieldSystem = ctx->fieldSystem;
    LocalMapObject **p_lastInteracted = FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_LAST_INTERACTED);
    u16 r7 = ScriptGetVar(ctx);
    u16 *p_ret = ScriptGetVarPointer(ctx);
    *p_ret = sub_0205A284(fieldSystem->unk80, MapObject_GetID(*p_lastInteracted), r7);
    return FALSE;
}

BOOL sub_02044318(ScriptContext *ctx);

BOOL ScrCmd_269(ScriptContext *ctx) {
    u16 var_idx = ScriptReadHalfword(ctx);
    ctx->data[0] = var_idx;
    SetupNativeScript(ctx, sub_02044318);
    return TRUE;
}

BOOL sub_02044318(ScriptContext *ctx) {
    FieldSystem *fieldSystem = ctx->fieldSystem;
    int result = sub_0205A358(fieldSystem->unk80);
    u16 *p_ret = GetVarPointer(fieldSystem, ctx->data[0]);
    if (result == 0) {
        return FALSE;
    } else {
        *p_ret = result;
        return TRUE;
    }
}

BOOL ScrCmd_270(ScriptContext *ctx) {
    sub_0205B27C(ctx->fieldSystem->mapObjectMan, ctx->fieldSystem->unk84);
    return FALSE;
}

BOOL ScrCmd_262(ScriptContext *ctx) {
    sub_0205A904(4);
    sub_020380CC();
    return FALSE;
}

BOOL ScrCmd_263(ScriptContext *ctx) {
    sub_02038104();
    sub_02037FF0();
    sub_0205A904(0);
    return FALSE;
}

BOOL ScrCmd_271(ScriptContext *ctx) {
    FieldSystem *fieldSystem = ctx->fieldSystem;
    u16 r6 = ScriptGetVar(ctx);
    u16 r2 = ScriptGetVar(ctx);
    sub_0205A3B0(fieldSystem->unk80, r6, r2);
    return FALSE;
}

BOOL sub_020443D8(ScriptContext *ctx);

BOOL ScrCmd_272(ScriptContext *ctx) {
    u16 var_idx = ScriptReadHalfword(ctx);
    ctx->data[0] = var_idx;
    SetupNativeScript(ctx, sub_020443D8);
    return TRUE;
}

BOOL sub_020443D8(ScriptContext *ctx) {
    u16 *p_ret = GetVarPointer(ctx->fieldSystem, ctx->data[0]);
    u32 r0 = sub_0205A35C(ctx->fieldSystem->unk80);
    if (r0 >= 1) {
        *p_ret = r0;
        sub_0205ABB0(ctx->fieldSystem->unk80);
        return TRUE;
    } else {
        *p_ret = 0;
        return FALSE;
    }
}

BOOL sub_02044434(ScriptContext *ctx);

BOOL ScrCmd_273(ScriptContext *ctx) {
    u16 var_idx = ScriptReadHalfword(ctx);
    ctx->data[0] = var_idx;
    SetupNativeScript(ctx, sub_02044434);
    return TRUE;
}

BOOL sub_02044434(ScriptContext *ctx) {
    u16 *p_ret = GetVarPointer(ctx->fieldSystem, ctx->data[0]);
    int r0 = sub_0205A39C(ctx->fieldSystem->unk80);
    if (gSystem.newKeys & PAD_BUTTON_B) {
        r0 = sub_0205A47C(ctx->fieldSystem->unk80, 8);
    }
    if (r0 != 0) {
        *p_ret = r0;
        return TRUE;
    } else {
        return FALSE;
    }
}

BOOL ScrCmd_286(ScriptContext *ctx) {
    sub_02054030(ctx->fieldSystem->taskman);
    return TRUE;
}

BOOL ScrCmd_BufferUnionRoomAvatarChoices(ScriptContext *ctx) {
    PlayerProfile *profile = Save_PlayerData_GetProfileAddr(FieldSystem_GetSaveData(ctx->fieldSystem));
    MessageFormat **p_msgFmt = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MESSAGE_FORMAT);
    BufferUnionRoomAvatarChoicesNames(
        PlayerProfile_GetTrainerID(profile),
        PlayerProfile_GetTrainerGender(profile),
        *p_msgFmt
    );
    return FALSE;
}

BOOL ScrCmd_UnionRoomAvatarIdxToTrainerClass(ScriptContext *ctx) {
    PlayerProfile *profile = Save_PlayerData_GetProfileAddr(FieldSystem_GetSaveData(ctx->fieldSystem));
    u16 choice = ScriptGetVar(ctx);
    u16 *p_ret = ScriptGetVarPointer(ctx);
    *p_ret = UnionRoomAvatarIdxToSprite(
        PlayerProfile_GetTrainerID(profile),
        PlayerProfile_GetTrainerGender(profile),
        choice
    );
    *p_ret = GetUnionRoomAvatarAttrBySprite(
        PlayerProfile_GetTrainerGender(profile),
        *p_ret,
        2
    );
    return FALSE;
}

BOOL ScrCmd_UnionRoomAvatarIdxToSprite(ScriptContext *ctx) {
    PlayerProfile *profile = Save_PlayerData_GetProfileAddr(FieldSystem_GetSaveData(ctx->fieldSystem));
    u16 choice = ScriptGetVar(ctx);
    u16 *p_ret = ScriptGetVarPointer(ctx);
    *p_ret = UnionRoomAvatarIdxToSprite(
        PlayerProfile_GetTrainerID(profile),
        PlayerProfile_GetTrainerGender(profile),
        choice
    );
    return FALSE;
}

BOOL ScrCmd_289(ScriptContext *ctx) {
    PlayerProfile *profile = Save_PlayerData_GetProfileAddr(FieldSystem_GetSaveData(ctx->fieldSystem));
    u16 choice = ScriptGetVar(ctx);
    PlayerProfile_SetAvatar(profile, choice);
    return FALSE;
}

BOOL ScrCmd_OverworldWhiteOut(ScriptContext *ctx) {
    CallFieldTask_BlackOut(ctx->taskman);
    return TRUE;
}

BOOL ScrCmd_SetSpawn(ScriptContext *ctx) {
    u16 spawnPoint = ScriptGetVar(ctx);
    LocalFieldData *localFieldData = Save_LocalFieldData_Get(ctx->fieldSystem->saveData);
    LocalFieldData_SetBlackoutSpawn(localFieldData, spawnPoint);
    return FALSE;
}

BOOL ScrCmd_GetPlayerGender(ScriptContext *ctx) {
    PlayerProfile *profile = Save_PlayerData_GetProfileAddr(FieldSystem_GetSaveData(ctx->fieldSystem));
    u16 *p_ret = ScriptGetVarPointer(ctx);
    *p_ret = PlayerProfile_GetTrainerGender(profile);
    return FALSE;
}

BOOL ScrCmd_HealParty(ScriptContext *ctx) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(ctx->taskman); // ???
    HealParty(SaveArray_Party_Get(fieldSystem->saveData));
    return FALSE;
}

BOOL sub_02044658(ScriptContext *ctx);

BOOL ScrCmd_283(ScriptContext *ctx) {
    sub_02058284();
    SetupNativeScript(ctx, sub_02044658);
    return TRUE;
}

BOOL sub_02044658(ScriptContext *ctx) {
    if (sub_02037D78() != TRUE && sub_02035650() != TRUE) {
        return TRUE;
    } else {
        return FALSE;
    }
}

BOOL ScrCmd_587(ScriptContext *ctx) {
    sub_020582A8();
    SetupNativeScript(ctx, sub_02044658);
    return TRUE;
}

BOOL ScrCmd_284(ScriptContext *ctx) {
    sub_02058190(ctx->fieldSystem);
    return FALSE;
}

BOOL ScrCmd_285(ScriptContext *ctx) {
    u16 val = ScriptReadHalfword(ctx);
    sub_02057F28(val);
    return FALSE;
}

BOOL ScrCmd_335(ScriptContext *ctx) {
    u16 pocket = ScriptGetVar(ctx);
    u16 *p_ret = ScriptGetVarPointer(ctx);
    *p_ret = Bag_PocketNotEmpty(Save_Bag_Get(ctx->fieldSystem->saveData), pocket);
    return FALSE;
}

BOOL ScrCmd_MovePerson(ScriptContext *ctx) {
    u16 objectId = ScriptGetVar(ctx);
    u16 x = ScriptGetVar(ctx);
    u16 y = ScriptGetVar(ctx);
    Field_SetEventDefaultXYPos(ctx->fieldSystem, objectId, x, y);
    return FALSE;
}

BOOL ScrCmd_MovePersonFacing(ScriptContext *ctx) {
    u16 objectId = ScriptGetVar(ctx);
    u16 x = ScriptGetVar(ctx);
    u16 height = ScriptGetVar(ctx);
    u16 y = ScriptGetVar(ctx);
    u16 direction = ScriptGetVar(ctx);
    LocalMapObject *object = GetMapObjectByID(ctx->fieldSystem->mapObjectMan, objectId);
    sub_0205FC2C(object, x, height, y, direction);
    sub_02061070(object);
    return FALSE;
}

BOOL ScrCmd_SetObjectMovementType(ScriptContext *ctx) {
    u16 objectId = ScriptGetVar(ctx);
    u16 movementType = ScriptGetVar(ctx);
    Field_SetEventDefaultMovement(ctx->fieldSystem, objectId, movementType);
    return FALSE;
}

BOOL ScrCmd_SetObjectFacing(ScriptContext *ctx) {
    u16 objectId = ScriptGetVar(ctx);
    u16 facing = ScriptGetVar(ctx);
    Field_SetEventDefaultDirection(ctx->fieldSystem, objectId, facing);
    return FALSE;
}

BOOL ScrCmd_MoveWarp(ScriptContext *ctx) {
    u16 warpId = ScriptGetVar(ctx);
    u16 x = ScriptGetVar(ctx);
    u16 y = ScriptGetVar(ctx);
    Field_SetWarpXYPos(ctx->fieldSystem, warpId, x, y);
    return FALSE;
}

BOOL ScrCmd_MoveBgEvent(ScriptContext *ctx) {
    u16 bgId = ScriptGetVar(ctx);
    u16 x = ScriptGetVar(ctx);
    u16 y = ScriptGetVar(ctx);
    Field_SetBgEventXYPos(ctx->fieldSystem, bgId, x, y);
    return FALSE;
}

BOOL ScrCmd_344(ScriptContext *ctx) {
    u16 objectId = ScriptGetVar(ctx);
    u16 dir = ScriptGetVar(ctx);
    LocalMapObject *object = GetMapObjectByID(ctx->fieldSystem->mapObjectMan, objectId);
    GF_ASSERT(object != NULL);
    ov01_021F9408(object, dir);
    return FALSE;
}

BOOL ScrCmd_347(ScriptContext *ctx) {
    u16 **r5 = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_FIELD_34);
    u16 r0 = ScriptGetVar(ctx);
    if (*r5 != NULL) {
        **r5 = r0;
    }
    return FALSE;
}

BOOL ScrCmd_307(ScriptContext *ctx) {
    u16 r4 = ScriptReadHalfword(ctx);
    u16 r6 = ScriptReadHalfword(ctx);
    u16 r7 = ScriptGetVar(ctx);
    u16 r2 = ScriptGetVar(ctx);
    u8 r3 = ScriptReadByte(ctx);
    ov01_021E9AE8(ctx->fieldSystem, r7 + 32 * r4, r2 + 32 * r6, r3);
    return FALSE;
}

BOOL ScrCmd_308(ScriptContext *ctx) {
    u8 r1 = ScriptReadByte(ctx);
    ov01_021E9C00(ctx->fieldSystem, r1);
    return TRUE;
}

BOOL ScrCmd_309(ScriptContext *ctx) {
    u8 r1 = ScriptReadByte(ctx);
    ov01_021E9C20(ctx->fieldSystem, r1);
    return FALSE;
}

BOOL ScrCmd_310(ScriptContext *ctx) {
    u8 r1 = ScriptReadByte(ctx);
    ov01_021E9BB8(ctx->fieldSystem, r1);
    return FALSE;
}

BOOL ScrCmd_311(ScriptContext *ctx) {
    u8 r1 = ScriptReadByte(ctx);
    ov01_021E9BDC(ctx->fieldSystem, r1);
    return FALSE;
}

BOOL ScrCmd_EcruteakGymInit(ScriptContext *ctx) {
    InitEcruteakGym(ctx->fieldSystem);
    return FALSE;
}

BOOL ScrCmd_315(ScriptContext *ctx) {
    FieldSystem *fieldSystem = ctx->fieldSystem;
    if (Save_Gymmick_GetType(Save_GetGymmickPtr(FieldSystem_GetSaveData(fieldSystem))) != GYMMICK_ECRUTEAK) {
        return FALSE;
    }
    ov04_02254D98(fieldSystem);
    return FALSE;
}

BOOL ScrCmd_316(ScriptContext *ctx) {
    FieldSystem *fieldSystem = ctx->fieldSystem;
    if (Save_Gymmick_GetType(Save_GetGymmickPtr(FieldSystem_GetSaveData(fieldSystem))) != GYMMICK_ECRUTEAK) {
        return FALSE;
    }
    ov04_02254DD0(fieldSystem);
    return FALSE;
}

BOOL ScrCmd_317(ScriptContext *ctx) {
    FieldSystem *fieldSystem = ctx->fieldSystem;
    u8 r5 = ScriptReadByte(ctx);
    if (Save_Gymmick_GetType(Save_GetGymmickPtr(FieldSystem_GetSaveData(fieldSystem))) != GYMMICK_ECRUTEAK) {
        return TRUE;
    }
    ov04_02254DE0(fieldSystem, (r5 != 0) ? 10 : 30);
    return TRUE;
}

BOOL ScrCmd_CianwoodGymInit(ScriptContext *ctx) {
    InitCianwoodGym(ctx->fieldSystem);
    return FALSE;
}

BOOL ScrCmd_CianwoodGymTurnWinch(ScriptContext *ctx) {
    FieldSystem *fieldSystem = ctx->fieldSystem;
    u16 *p_ret = ScriptGetVarPointer(ctx);
    *p_ret = ov04_02256058(fieldSystem);
    return TRUE;
}

BOOL ScrCmd_VermilionGymInit(ScriptContext *ctx) {
    InitVermilionGym(ctx->fieldSystem);
    return FALSE;
}

BOOL ScrCmd_VermilionGymLockAction(ScriptContext *ctx) {
    FieldSystem *fieldSystem = ctx->fieldSystem;
    u8 lockno = ScriptReadByte(ctx);
    u8 relock = ScriptReadByte(ctx);
    ov04_0225640C(fieldSystem, lockno, relock);
    return TRUE;
}

BOOL ScrCmd_VermilionGymCanCheck(ScriptContext *ctx) {
    FieldSystem *fieldSystem = ctx->fieldSystem;
    u8 canId = ScriptReadByte(ctx);
    u16 *p_ret = ScriptGetVarPointer(ctx);
    *p_ret = ov04_022563C4(fieldSystem, canId);
    return FALSE;
}

BOOL ScrCmd_ResampleVermilionGymCans(ScriptContext *ctx) {
    PlaceVermilionGymSwitches(ctx->fieldSystem);
    return FALSE;
}

BOOL ScrCmd_VioletGymInit(ScriptContext *ctx) {
    InitVioletGym(ctx->fieldSystem);
    return FALSE;
}

BOOL ScrCmd_VioletGymElevator(ScriptContext *ctx) {
    ov04_02253ED4(ctx->fieldSystem);
    return TRUE;
}

BOOL ScrCmd_AzaleaGymInit(ScriptContext *ctx) {
    InitAzaleaGym(ctx->fieldSystem);
    return FALSE;
}

BOOL ScrCmd_AzaleaGymSpinarak(ScriptContext *ctx) {
    FieldSystem *fieldSystem = ctx->fieldSystem;
    u8 spinarakNo = ScriptReadByte(ctx);
    BeginAzaleaGymSpinarakRide(fieldSystem, spinarakNo);
    return TRUE;
}

BOOL ScrCmd_AzaleaGymSwitch(ScriptContext *ctx) {
    FieldSystem *fieldSystem = ctx->fieldSystem;
    u8 switchNo = ScriptReadByte(ctx);
    FlipAzaleaGymSwitch(fieldSystem, switchNo);
    return TRUE;
}

BOOL ScrCmd_BlackthornGymInit(ScriptContext *ctx) {
    InitBlackthornGym(ctx->fieldSystem);
    return FALSE;
}

BOOL ScrCmd_FuchsiaGymInit(ScriptContext *ctx) {
    InitFuchsiaGym(ctx->fieldSystem);
    return FALSE;
}

BOOL ScrCmd_ViridianGymInit(ScriptContext *ctx) {
    InitViridianGym(ctx->fieldSystem);
    return FALSE;
}

BOOL ScrCmd_GetPlayerXYZ(ScriptContext *ctx) {
    FieldSystem *fieldSystem = ctx->fieldSystem;
    u16 *p_x = ScriptGetVarPointer(ctx);
    u16 *p_h = ScriptGetVarPointer(ctx);
    u16 *p_y = ScriptGetVarPointer(ctx);
    LocalMapObject *playerObj = PlayerAvatar_GetMapObject(fieldSystem->playerAvatar);
    *p_x = MapObject_GetCurrentX(playerObj);
    *p_h = MapObject_GetCurrentHeight(playerObj) / 2;
    *p_y = MapObject_GetCurrentY(playerObj);
    return FALSE;
}

BOOL ScrCmd_EggHatchAnim(ScriptContext *ctx) {
    HatchEggInParty(ctx->fieldSystem);
    return TRUE;
}

BOOL ScrCmd_374(ScriptContext *ctx) {
    FieldSystem *fieldSystem = ctx->fieldSystem;
    u16 objId = ScriptGetVar(ctx);
    LocalMapObject *object = GetMapObjectByID(fieldSystem->mapObjectMan, objId);
    GF_ASSERT(object != NULL);
    MapObject_SetVisible(object, FALSE);
    return FALSE;
}

BOOL ScrCmd_375(ScriptContext *ctx) {
    FieldSystem *fieldSystem = ctx->fieldSystem;
    u16 objId = ScriptGetVar(ctx);
    LocalMapObject *object = GetMapObjectByID(fieldSystem->mapObjectMan, objId);
    GF_ASSERT(object != NULL);
    MapObject_SetVisible(object, TRUE);
    return FALSE;
}

BOOL ScrCmd_376(ScriptContext *ctx) { //todo: mail screen
    void **p_work = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_RUNNING_APP_DATA); //MailAppData
    *p_work = sub_0203F074(ctx->fieldSystem, HEAP_ID_FIELD);
    SetupNativeScript(ctx, ScrNative_WaitApplication_DestroyTaskData);
    return TRUE;
}

BOOL ScrCmd_377(ScriptContext *ctx) {
    FieldSystem *fieldSystem = ctx->fieldSystem;
    u16 *p_ret = ScriptGetVarPointer(ctx);
    *p_ret = Mailbox_CountMessages(Save_Mailbox_Get(fieldSystem->saveData), 0);
    return FALSE;
}

BOOL ScrCmd_378(ScriptContext *ctx) {
    u16 r4 = ScriptGetVar(ctx);
    u16 r2 = ScriptGetVar(ctx);
    sub_02097D3C(ctx->fieldSystem, r4, r2);
    return TRUE;
}

BOOL ScrCmd_379(ScriptContext *ctx) {
    u16 *p_ret = ScriptGetVarPointer(ctx);
    *p_ret = Field_GetTimeOfDay(ctx->fieldSystem);
    return FALSE;
}

BOOL ScrCmd_Random(ScriptContext *ctx) {
    u16 *p_ret = ScriptGetVarPointer(ctx);
    u16 modulo = ScriptGetVar(ctx);
    *p_ret = LCRandom() % modulo;
    return TRUE;
}

BOOL ScrCmd_381(ScriptContext *ctx) {
    u16 *p_ret = ScriptGetVarPointer(ctx);
    u16 modulo = ScriptGetVar(ctx);
    *p_ret = LCRandom() % modulo;
    return TRUE;
}

BOOL ScrCmd_403(ScriptContext *ctx) {
    u16 r4 = ScriptGetVar(ctx);
    u16 r6 = ScriptGetVar(ctx);
    sub_0202BB08(Save_FashionData_GetFashionCase(Save_FashionData_Get(ctx->fieldSystem->saveData)), r4, r6);
    return FALSE;
}

BOOL ScrCmd_404(ScriptContext *ctx) {
    u16 r4 = ScriptGetVar(ctx);
    u16 r6 = ScriptGetVar(ctx);
    u16 *p_ret = ScriptGetVarPointer(ctx);
    *p_ret = sub_0202BA2C(Save_FashionData_GetFashionCase(Save_FashionData_Get(ctx->fieldSystem->saveData)), r4, r6);
    return FALSE;
}

BOOL ScrCmd_405(ScriptContext *ctx) {
    u16 r7 = ScriptGetVar(ctx);
    u16 r6 = ScriptGetVar(ctx);
    u16 *p_ret = ScriptGetVarPointer(ctx);
    *p_ret = r6 <= sub_0202BA70(Save_FashionData_GetFashionCase(Save_FashionData_Get(ctx->fieldSystem->saveData)), r7);
    return FALSE;
}

BOOL ScrCmd_406(ScriptContext *ctx) {
    u16 r4 = ScriptGetVar(ctx);
    sub_0202BBD8(Save_FashionData_GetFashionCase(Save_FashionData_Get(ctx->fieldSystem->saveData)), r4);
    return FALSE;
}

BOOL ScrCmd_407(ScriptContext *ctx) {
    u16 r6 = ScriptGetVar(ctx);
    u16 *p_ret = ScriptGetVarPointer(ctx);
    *p_ret = sub_0202BA5C(Save_FashionData_GetFashionCase(Save_FashionData_Get(ctx->fieldSystem->saveData)), r6);
    return FALSE;
}

BOOL ScrCmd_CheckJohtoDexComplete(ScriptContext *ctx) {
    Pokedex *pokedex = Save_Pokedex_Get(ctx->fieldSystem->saveData);
    u16 *p_ret = ScriptGetVarPointer(ctx);
    *p_ret = FALSE;
    if (Pokedex_JohtoDexIsComplete(pokedex) == TRUE) {
        *p_ret = TRUE;
    }
    return FALSE;
}

BOOL ScrCmd_CheckNationalDexComplete(ScriptContext *ctx) {
    Pokedex *pokedex = Save_Pokedex_Get(ctx->fieldSystem->saveData);
    u16 *p_ret = ScriptGetVarPointer(ctx);
    *p_ret = FALSE;
    if (Pokedex_NationalDexIsComplete(pokedex) == TRUE) {
        *p_ret = TRUE;
    }
    return FALSE;
}

BOOL ScrCmd_425(ScriptContext *ctx) { //todo: pokedex screen
    void **p_work = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_RUNNING_APP_DATA); //PokedexAppData
    u16 r2 = ScriptGetVar(ctx);
    *p_work = sub_0203FA8C(ctx->fieldSystem, HEAP_ID_32, r2);
    SetupNativeScript(ctx, ScrNative_WaitApplication_DestroyTaskData);
    return TRUE;
}

BOOL ScrCmd_427(ScriptContext *ctx) {
    u16 *p_ret = ScriptGetVarPointer(ctx);
    // dummy
    return FALSE;
}

BOOL ScrCmd_420(ScriptContext *ctx) {
    u16 statno = ScriptReadHalfword(ctx);
    GameStats_Inc(Save_GameStats_Get(ctx->fieldSystem->saveData), statno);
    return FALSE;
}

BOOL ScrCmd_421(ScriptContext *ctx) {
    u16 r7 = ScriptReadHalfword(ctx);
    u16 r4 = ScriptReadHalfword(ctx);
    u16 r6 = ScriptReadHalfword(ctx);
    u16 *p_ret_hi = GetVarPointer(ctx->fieldSystem, r4);
    u16 *p_ret_lo = GetVarPointer(ctx->fieldSystem, r6);
    u32 statval = GameStats_GetCapped(Save_GameStats_Get(ctx->fieldSystem->saveData), r7);
    *p_ret_hi = (statval & 0xFFFF0000) >> 16;
    *p_ret_lo = statval & 0x0000FFFF;
    return FALSE;
}

BOOL ScrCmd_422(ScriptContext *ctx) {
    u16 statIdx = ScriptReadHalfword(ctx);
    u16 value_hi = ScriptReadHalfword(ctx);
    u16 value_lo = ScriptReadHalfword(ctx);
    u8 action = ScriptReadByte(ctx);

    u32 value = (value_hi << 16) | value_lo;
    switch (action) {
    case 0:
        GameStats_Add(Save_GameStats_Get(ctx->fieldSystem->saveData), statIdx, value);
        break;
    case 1:
        GameStats_SetCapped(Save_GameStats_Get(ctx->fieldSystem->saveData), statIdx, value);
        break;
    case 2:
        GameStats_UpdateBounded(Save_GameStats_Get(ctx->fieldSystem->saveData), statIdx, value);
        break;
    }
    return FALSE;
}

BOOL ScrCmd_704(ScriptContext *ctx) {
    u16 statIdx = ScriptReadHalfword(ctx);
    u16 value = ScriptGetVar(ctx);
    GameStats_Add(Save_GameStats_Get(ctx->fieldSystem->saveData), statIdx, value);
    return FALSE;
}

BOOL ScrCmd_705(ScriptContext *ctx) {
    u16 statIdx = ScriptReadHalfword(ctx);
    u32 value = ScriptReadWord(ctx);
    GameStats_Add(Save_GameStats_Get(ctx->fieldSystem->saveData), statIdx, value);
    return FALSE;
}

BOOL ScrCmd_SafariZoneAction(ScriptContext *ctx) {
    LocalFieldData *localFieldData = Save_LocalFieldData_Get(ctx->fieldSystem->saveData);
    SaveVarsFlags *varsFlags = Save_VarsFlags_Get(ctx->fieldSystem->saveData);
    SafariZone *safariZone = Save_SafariZone_Get(ctx->fieldSystem->saveData);
    u8 action = ScriptReadByte(ctx);
    u8 areaSet = ScriptReadByte(ctx);
    u16 *p_nSafariBall = LocalFieldData_GetSafariBallsCounter(localFieldData);
    u16 *p_nSafariSteps = LocalFieldData_GetSafariStepsCounter(localFieldData);
    int r1;

    switch (action) {
    case 0:
        Save_VarsFlags_SetSafariSysFlag(varsFlags);
        sub_0202F5F8(safariZone, areaSet);
        *p_nSafariBall = 30;
        *p_nSafariSteps = 0;
        break;
    case 1:
        Save_VarsFlags_ClearSafariSysFlag(varsFlags);
        sub_0202F5F8(safariZone, 1);
        r1 = sub_0202F6AC(safariZone);
        if (r1 != 0) {
            sub_0209730C(ctx->fieldSystem->saveData, r1);
            sub_0202F6A0(safariZone, 0);
        }
        *p_nSafariBall = 0;
        *p_nSafariSteps = 0;
        break;
    }
    return FALSE;
}

BOOL ScrCmd_459(ScriptContext *ctx) {
    ov02_02245B80(ctx->taskman);
    return TRUE;
}

BOOL ScrCmd_456(ScriptContext *ctx) {
    u8 arg = ScriptReadByte(ctx);
    PlayerAvatar_ToggleAutomaticHeightUpdating(ctx->fieldSystem->playerAvatar, arg);
    return TRUE;
}

BOOL ScrCmd_EnableMassOutbreaks(ScriptContext *ctx) {
    RoamerSave_SetOutbreakActive(ctx->fieldSystem->saveData);
    return FALSE;
}

BOOL ScrCmd_CreateRoamer(ScriptContext *ctx) {
    u8 roamerNo = ScriptReadByte(ctx);
    Save_CreateRoamerByID(ctx->fieldSystem->saveData, roamerNo);
    return FALSE;
}

BOOL ScrCmd_LoadNPCTrade(ScriptContext *ctx) {
    NPCTradeAppData **p_tradeWork = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MISC_DATA_PTR);
    u8 tradeNo = ScriptReadByte(ctx);

    HandleLoadOverlay(FS_OVERLAY_ID(npc_trade), OVY_LOAD_ASYNC);
    *p_tradeWork = NPCTradeApp_Init(HEAP_ID_FIELD, tradeNo);
    return FALSE;
}

BOOL ScrCmd_GetOfferedSpecies(ScriptContext *ctx) {
    NPCTradeAppData **p_tradeWork = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MISC_DATA_PTR);
    u16 *p_ret = ScriptGetVarPointer(ctx);
    *p_ret = NPCTradeApp_GetOfferedSpecies(*p_tradeWork);
    return FALSE;
}

BOOL ScrCmd_NPCTradeGetReqSpecies(ScriptContext *ctx) {
    NPCTradeAppData **p_tradeWork = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MISC_DATA_PTR);
    u16 *p_ret = ScriptGetVarPointer(ctx);
    *p_ret = NPCTradeApp_GetRequestedSpecies(*p_tradeWork);
    return FALSE;
}

BOOL ScrCmd_GetNpcTradeUnusedFlag(ScriptContext *ctx) {
    NPCTradeAppData **p_tradeWork = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MISC_DATA_PTR);
    u16 *p_ret = ScriptGetVarPointer(ctx);
    *p_ret = NPCTradeApp_GetUnusedFlag(*p_tradeWork);
    return FALSE;
}

BOOL ScrCmd_NPCTradeExec(ScriptContext *ctx) {
    NPCTradeAppData **p_tradeWork = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MISC_DATA_PTR);
    u16 arg = ScriptGetVar(ctx);
    CallTask_NPCTrade(ctx->taskman, *p_tradeWork, arg, HEAP_ID_FIELD);
    return TRUE;
}

BOOL ScrCmd_NPCTradeEnd(ScriptContext *ctx) {
    NPCTradeAppData **p_tradeWork = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MISC_DATA_PTR);
    NPCTradeApp_Delete(*p_tradeWork);
    UnloadOverlayByID(FS_OVERLAY_ID(npc_trade));
    return FALSE;
}

BOOL ScrCmd_GiveLoanMon(ScriptContext *ctx) {
    u8 tradeno = ScriptReadByte(ctx);
    u8 level = ScriptReadByte(ctx);
    u16 mapno = ScriptReadHalfword(ctx);
    HandleLoadOverlay(FS_OVERLAY_ID(npc_trade), OVY_LOAD_ASYNC);
    NPCTrade_MakeAndGiveLoanMon(ctx->fieldSystem, tradeno, level, mapno);
    UnloadOverlayByID(FS_OVERLAY_ID(npc_trade));
    return FALSE;
}

BOOL ScrCmd_CheckReturnLoanMon(ScriptContext *ctx) {
    u8 tradeno = ScriptReadByte(ctx);
    u16 idx = ScriptGetVar(ctx);
    u16 *p_ret = ScriptGetVarPointer(ctx);
    HandleLoadOverlay(FS_OVERLAY_ID(npc_trade), OVY_LOAD_ASYNC);
    *p_ret = NPCTrade_CanGiveUpLoanMon(ctx->fieldSystem, tradeno, idx);
    UnloadOverlayByID(FS_OVERLAY_ID(npc_trade));
    return FALSE;
}

BOOL ScrCmd_475(ScriptContext *ctx) {
    // dummy
    return FALSE;
}

BOOL ScrCmd_476(ScriptContext *ctx) {
    sub_0202A57C(Save_Pokedex_Get(ctx->fieldSystem->saveData));
    return FALSE;
}

BOOL ScrCmd_NatDexFlagAction(ScriptContext *ctx) {
    u8 action = ScriptReadByte(ctx);
    u16 *p_ret = ScriptGetVarPointer(ctx);
    *p_ret = 0;
    if (action == 1) {
        Pokedex_SetNatDexFlag(Save_Pokedex_Get(ctx->fieldSystem->saveData));
        PlayerProfile_SetNatDexFlag(Save_PlayerData_GetProfileAddr(ctx->fieldSystem->saveData));
    } else if (action == 2) {
        *p_ret = Pokedex_GetNatDexFlag(Save_Pokedex_Get(ctx->fieldSystem->saveData));
    } else {
        GF_ASSERT(0);
    }
    return FALSE;
}

BOOL ScrCmd_GetEVTotal(ScriptContext *ctx) {
    u16 *p_ret = ScriptGetVarPointer(ctx);
    u16 partyIdx = ScriptGetVar(ctx);
    Pokemon *mon = Party_GetMonByIndex(SaveArray_Party_Get(ctx->fieldSystem->saveData),  partyIdx);

    int hpEv = GetMonData(mon, MON_DATA_HP_EV, NULL);
    int atkEv = GetMonData(mon, MON_DATA_ATK_EV, NULL);
    int defEv = GetMonData(mon, MON_DATA_DEF_EV, NULL);
    int speedEv = GetMonData(mon, MON_DATA_SPEED_EV, NULL);
    int spAtkEv = GetMonData(mon, MON_DATA_SPATK_EV, NULL);
    int spDefEv = GetMonData(mon, MON_DATA_SPDEF_EV, NULL);
    *p_ret = hpEv + atkEv + defEv + speedEv + spAtkEv + spDefEv;
    return FALSE;
}

BOOL ScrCmd_GetWeekday(ScriptContext *ctx) {
    u16 *p_ret = ScriptGetVarPointer(ctx);
    RTCDate date;
    GF_RTC_CopyDate(&date);
    *p_ret = date.week;
    return FALSE;
}

BOOL ScrCmd_485(ScriptContext *ctx) {
    u16 *p_var = ScriptGetVarPointer(ctx);
    ov03_022566B0(ctx->taskman, p_var);
    return TRUE;
}

BOOL ScrCmd_PokeCenAnim(ScriptContext *ctx) {
    u16 kind = ScriptGetVar(ctx);
    PokecenterAnimCreate(ctx->fieldSystem, kind);
    return TRUE;
}

BOOL ScrCmd_ElevatorAnim(ScriptContext *ctx) {
    u16 direction = ScriptGetVar(ctx);
    u16 length = ScriptGetVar(ctx);
    ov02_0224BDE8(ctx->fieldSystem, direction, length);
    return TRUE;
}

BOOL ScrCmd_GetGameVersion(ScriptContext *ctx) {
    u16 *p_ret = ScriptGetVarPointer(ctx);
    *p_ret = GAME_VERSION;
    return FALSE;
}

BOOL ScrCmd_PrimoPasswordCheck1(ScriptContext *ctx) {
    FieldSystem *fieldSystem = ctx->fieldSystem;
    PlayerProfile *profile = Save_PlayerData_GetProfileAddr(FieldSystem_GetSaveData(fieldSystem));
    u16 *p_ret = ScriptGetVarPointer(ctx);
    PC_STORAGE *pcStorage = SaveArray_PCStorage_Get(fieldSystem->saveData);
    u16 a = ScriptGetVar(ctx);
    u16 b = ScriptGetVar(ctx);
    u16 c = ScriptGetVar(ctx);
    u16 d = ScriptGetVar(ctx);
    int wallpaper = ov02_0224CD38(profile, a, b, c, d, HEAP_ID_4);
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

BOOL ScrCmd_PrimoPasswordCheck2(ScriptContext *ctx) {
    FieldSystem *fieldSystem = ctx->fieldSystem;
    PlayerProfile *profile = Save_PlayerData_GetProfileAddr(FieldSystem_GetSaveData(fieldSystem));
    u16 *p_ret = ScriptGetVarPointer(ctx);
    PC_STORAGE *pcStorage = SaveArray_PCStorage_Get(fieldSystem->saveData);
    u16 a = ScriptGetVar(ctx);
    u16 b = ScriptGetVar(ctx);
    u16 c = ScriptGetVar(ctx);
    u16 d = ScriptGetVar(ctx);
    int result = ov02_0224CD74(profile, a, b, c, d, HEAP_ID_4);
    if (result == -1) {
        *p_ret = 0xFF;
        return FALSE;
    } else {
        *p_ret = result;
    }
    return FALSE;
}

BOOL ScrCmd_500(ScriptContext *ctx) {
    FieldSystem *fieldSystem = ctx->fieldSystem;
    u8 r1 = ScriptReadByte(ctx);
    ov02_0224BF58(fieldSystem, r1);
    return FALSE;
}

BOOL ScrCmd_501(ScriptContext *ctx) {
    FieldSystem *fieldSystem = ctx->fieldSystem;
    u8 r1 = ScriptReadByte(ctx);
    ov02_0224BFC0(fieldSystem, r1);
    return FALSE;
}

BOOL ScrCmd_502(ScriptContext *ctx) {
    FieldSystem *fieldSystem = ctx->fieldSystem;
    u8 r1 = ScriptReadByte(ctx);
    ov02_0224BFCC(fieldSystem, r1);
    return FALSE;
}

void Script_SetMonSeenFlagBySpecies(FieldSystem *fieldSystem, u16 species) {
    Pokedex *pokedex = Save_Pokedex_Get(fieldSystem->saveData);
    Pokemon *mon = AllocMonZeroed(HEAP_ID_32);
    ZeroMonData(mon);
    CreateMon(mon, species, 50, 32, FALSE, 0, OT_ID_PLAYER_ID, 0);
    Pokedex_SetMonSeenFlag(pokedex, mon);
    FreeToHeap(mon);
}

BOOL ScrCmd_687(ScriptContext *ctx) {
    u16 species = ScriptGetVar(ctx);
    Script_SetMonSeenFlagBySpecies(ctx->fieldSystem, species);
    return FALSE;
}

BOOL ScrCmd_CountPCEmptySpace(ScriptContext *ctx) {
    u16 *p_ret = ScriptGetVarPointer(ctx);
    *p_ret = PCStorage_CountEmptySpotsInAllBoxes(SaveArray_PCStorage_Get(ctx->fieldSystem->saveData));
    return FALSE;
}

BOOL ScrCmd_PlayerMovementSavingSet(ScriptContext *ctx) {
    s32 *r4 = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_FIELD_B8);
    *r4 = PLAYER_STATE_WALKING;
    *r4 = Field_PlayerMovementSavingSet(ctx->fieldSystem);
    return TRUE;
}

BOOL ScrCmd_PlayerMovementSavingClear(ScriptContext *ctx) {
    s32 *r4 = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_FIELD_B8);
    Field_PlayerMovementSavingClear(*r4);
    return TRUE;
}

BOOL ScrCmd_HallOfFameAnim(ScriptContext *ctx) {
    u16 kind = ScriptGetVar(ctx);
    ov02_0224CDB0(ctx->fieldSystem, kind);
    return TRUE;
}

BOOL ScrCmd_AddSpecialGameStat(ScriptContext *ctx) {
    u16 statno = ScriptReadHalfword(ctx);
    GameStats_AddSpecial(Save_GameStats_Get(ctx->fieldSystem->saveData), statno);
    return FALSE;
}

BOOL ScrCmd_517(ScriptContext *ctx) {
    u16 species = ScriptGetVar(ctx);
    u16 *p_ret = ScriptGetVarPointer(ctx);
    *p_ret = Party_HasMon(SaveArray_Party_Get(ctx->fieldSystem->saveData), species);
    return TRUE;
}

BOOL ScrCmd_518(ScriptContext *ctx) {
    u16 form = ScriptGetVar(ctx);
    Party *party = SaveArray_Party_Get(ctx->fieldSystem->saveData);
    int partyCount = Party_GetCount(party);
    Pokedex *pokedex = Save_Pokedex_Get(ctx->fieldSystem->saveData);
    int i;

    for (i = 0; i < partyCount; i++) {
        Pokemon *mon = Party_GetMonByIndex(party, i);
        if (GetMonData(mon, MON_DATA_SPECIES, NULL) == SPECIES_DEOXYS) {
            SetMonData(mon, MON_DATA_FORM, &form);
            CalcMonLevelAndStats(mon);
            Pokedex_SetMonCaughtFlag(pokedex, mon);
        }
    }
    return TRUE;
}

BOOL ScrCmd_519(ScriptContext *ctx) {
    u16 *sp0 = ScriptGetVarPointer(ctx);
    Party *party = SaveArray_Party_Get(ctx->fieldSystem->saveData);
    int partyCount = Party_GetCount(party);

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
        Pokemon *mon = Party_GetMonByIndex(party, i);
        u32 species = GetMonData(mon, MON_DATA_SPECIES, NULL);
        u32 form = GetMonData(mon, MON_DATA_FORM, NULL);
        if (species == SPECIES_BURMY) {
            hasMultiple = FALSE;
            for (j = 0, sp18[i] = form; j < i; j++) {
                if (sp18[j] == form) {
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

BOOL ScrCmd_520(ScriptContext *ctx) {
    SetFlag975(Save_VarsFlags_Get(ctx->fieldSystem->saveData));
    return FALSE;
}

BOOL ScrCmd_521(ScriptContext *ctx) {
    ClearFlag975(Save_VarsFlags_Get(ctx->fieldSystem->saveData));
    return FALSE;
}

BOOL ScrCmd_522(ScriptContext *ctx) {
    u16 *p_ret = ScriptGetVarPointer(ctx);
    *p_ret = Field_GetHour(ctx->fieldSystem);
    return FALSE;
}

BOOL ScrCmd_523(ScriptContext *ctx) {
    u16 objectId = ScriptGetVar(ctx);
    u16 spC = ScriptGetVar(ctx);
    u16 sp8 = ScriptGetVar(ctx);
    u16 r6 = ScriptGetVar(ctx);
    u16 r4 = ScriptGetVar(ctx);
    LocalMapObject *object = GetMapObjectByID(ctx->fieldSystem->mapObjectMan, objectId);
    GF_ASSERT(object != NULL);
    sub_0205BED8(ctx->taskman, object, spC, sp8, r6, r4);
    return TRUE;
}

BOOL ScrCmd_524(ScriptContext *ctx) {
    u16 objectId = ScriptGetVar(ctx);
    u16 r7 = ScriptGetVar(ctx);
    u16 r6 = ScriptGetVar(ctx);
    LocalMapObject *object = GetMapObjectByID(ctx->fieldSystem->mapObjectMan, objectId);
    GF_ASSERT(object != NULL);
    sub_0205BFB4(ctx->taskman, object, r7, r6);
    return TRUE;
}

BOOL ScrCmd_525(ScriptContext *ctx) {
    u16 *p_ret = ScriptGetVarPointer(ctx);
    *p_ret = Save_PlayerHasAllRegisInParty(ctx->fieldSystem->saveData);
    return FALSE;
}

BOOL ScrCmd_526(ScriptContext *ctx) {
    u16 *p_ret = ScriptGetVarPointer(ctx);
    FashionCase *fashionCase = Save_FashionData_GetFashionCase(Save_FashionData_Get(ctx->fieldSystem->saveData));
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

BOOL ScrCmd_528(ScriptContext *ctx) {
    u16 *p_ret = ScriptGetVarPointer(ctx);
    *p_ret = gSystem.unk6A;
    return TRUE;
}

BOOL ScrCmd_530(ScriptContext *ctx) {
    u16 r6 = ScriptGetVar(ctx);
    u8 action = ScriptReadByte(ctx);
    SaveVarsFlags *varsFlags = Save_VarsFlags_Get(ctx->fieldSystem->saveData);
    if (action) {
        sub_02066C1C(varsFlags, r6);
    } else {
        sub_02066C4C(varsFlags, r6);
    }
    return FALSE;
}

BOOL ScrCmd_BufferBackgroundName(ScriptContext *ctx) {
    MessageFormat **p_msgFmt = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MESSAGE_FORMAT);
    u8 bufferId = ScriptReadByte(ctx);
    u16 backgroundId = ScriptGetVar(ctx);
    BufferContestBackgroundName(*p_msgFmt, bufferId, backgroundId);
    return TRUE;
}

BOOL ScrCmd_534(ScriptContext *ctx) {
    u16 *p_ret = ScriptGetVarPointer(ctx);
    *p_ret = Save_VarsFlags_GetVar4041(Save_VarsFlags_Get(ctx->fieldSystem->saveData));
    return FALSE;
}

BOOL ScrCmd_536(ScriptContext *ctx) {
    u16 r4 = ScriptGetVar(ctx);
    u16 r6 = ScriptGetVar(ctx);
    sub_0202BB7C(Save_FashionData_GetFashionCase(Save_FashionData_Get(ctx->fieldSystem->saveData)), r4, r6);
    return FALSE;
}

BOOL ScrCmd_537(ScriptContext *ctx) {
    sub_02066D60(ctx->fieldSystem->saveData);
    return FALSE;
}

BOOL ScrCmd_538(ScriptContext *ctx) {
    u16 *p_ret = ScriptGetVarPointer(ctx);
    u16 wordIdx = ScriptGetVar(ctx);
    MessageFormat **p_msgFmt = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MESSAGE_FORMAT);
    int trendy = Save_EasyChat_SetRandomTrendySaying(Save_EasyChat_Get(ctx->fieldSystem->saveData));
    if (trendy == 32) {
        *p_ret = 0xFFFF;
        return FALSE;
    }
    *p_ret = trendy;
    BufferECWord(*p_msgFmt, wordIdx, TrendyWordIdxToECWord(trendy));
    return FALSE;
}

BOOL ScrCmd_540(ScriptContext *ctx) {
    u16 *p_ret = ScriptGetVarPointer(ctx);
    *p_ret = Save_EasyChat_TrendySayingsUnlockedAllCheck(Save_EasyChat_Get(ctx->fieldSystem->saveData)) == TRUE;
    return FALSE;
}

BOOL ScrCmd_539(ScriptContext *ctx) {
    SaveVarsFlags *varsFlags = Save_VarsFlags_Get(ctx->fieldSystem->saveData);
    u16 *p_ret = ScriptGetVarPointer(ctx);
    *p_ret = Save_VarsFlags_GetVar4042(varsFlags) >= 5;
    return FALSE;
}

BOOL ScrCmd_543(ScriptContext *ctx) {
    u16 *p_ret = ScriptGetVarPointer(ctx);
    FieldSystem *fieldSystem = ctx->fieldSystem;
    SysInfo *sysInfo = Save_SysInfo_Get(fieldSystem->saveData);
    if (Save_SysInfo_GetBirthMonth(sysInfo) == Field_GetMonth(fieldSystem) && Save_SysInfo_GetBirthDay(sysInfo) == Field_GetDay(fieldSystem)) {
        *p_ret = TRUE;
    } else {
        *p_ret = FALSE;
    }
    return FALSE;
}

BOOL ScrCmd_545(ScriptContext *ctx) {
    Pokedex *pokedex = Save_Pokedex_Get(ctx->fieldSystem->saveData);
    u16 *p_ret = ScriptGetVarPointer(ctx);
    *p_ret = Pokedex_GetSeenFormNum_Unown(pokedex, TRUE);
    return FALSE;
}

BOOL ScrCmd_546(ScriptContext *ctx) {
    u8 mode = ScriptReadByte(ctx);
    u16 *p_ret = ScriptGetVarPointer(ctx);
    SaveVarsFlags *varsFlags = Save_VarsFlags_Get(ctx->fieldSystem->saveData);
    GF_ASSERT(mode <= 1);
    *p_ret = sub_02066BC0(varsFlags, mode);
    return FALSE;
}

BOOL ScrCmd_550(ScriptContext *ctx) {
    u16 *p_ret = ScriptGetVarPointer(ctx);
    int loadResult;
    HALL_OF_FAME *hof = LoadHallOfFame(ctx->fieldSystem->saveData, HEAP_ID_32, &loadResult);
    if (loadResult == 0) {
        *p_ret = 0;
        FreeToHeap(hof);
        return TRUE;
    } else if (loadResult == 1) {
        *p_ret = Save_HOF_TranslateRecordIdx(hof, 0);
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

BOOL ScrCmd_551(ScriptContext *ctx) {
    u16 r6 = ScriptGetVar(ctx);
    void **p_work = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_RUNNING_APP_DATA);
    *p_work = sub_0203E5D0(HEAP_ID_32, ctx->fieldSystem, r6);
    SetupNativeScript(ctx, ScrNative_WaitApplication);
    return TRUE;
}

BOOL ScrCmd_552(ScriptContext *ctx) {
    u16 *r6 = ScriptGetVarPointer(ctx);
    u16 *r5 = ScriptGetVarPointer(ctx);
    struct PartyMenuAppData **partyMenu = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_RUNNING_APP_DATA);
    GF_ASSERT(*partyMenu != NULL);
    *r6 = sub_0203E5C8(*partyMenu);
    if (*r6 == 7) {
        *r6 = 255;
    }
    *r5 = sub_0203E5F8(*partyMenu);
    *r5 = (*r5 == TRUE);
    FreeToHeap(*partyMenu);
    *partyMenu = NULL;
    return FALSE;
}

BOOL ScrCmd_553(ScriptContext *ctx) {
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

BOOL ScrCmd_560(ScriptContext *ctx) {
    u16 my_case = ScriptGetVar(ctx);
    u16 *p_ret = ScriptGetVarPointer(ctx);
    FieldSystem *fieldSystem = ctx->fieldSystem;
    switch (my_case) {
    case 0:
        ov02_0224E074(fieldSystem, p_ret, 0, HEAP_ID_32);
        break;
    case 1:
        ov02_0224E074(fieldSystem, p_ret, 1, HEAP_ID_32);
        break;
    case 2:
        ov02_0224E074(fieldSystem, p_ret, 2, HEAP_ID_32);
        break;
    case 3:
        ov02_0224E074(fieldSystem, p_ret, 3, HEAP_ID_32);
        break;
    case 4:
        ov02_0224E074(fieldSystem, p_ret, 4, HEAP_ID_32);
        break;
    case 5:
        ov02_0224E074(fieldSystem, p_ret, 5, HEAP_ID_32);
        break;
    default:
        GF_ASSERT(0);
        break;
    }
    return TRUE;
}

BOOL ScrCmd_564(ScriptContext *ctx) {
    u16 *p_ret = ScriptGetVarPointer(ctx);
    *p_ret = sub_0203A05C(ctx->fieldSystem->saveData);
    return FALSE;
}

BOOL ScrCmd_565(ScriptContext *ctx) {
    u16 *p_ret = ScriptGetVarPointer(ctx);
    *p_ret = sub_0202C2F8(sub_0202C6F4(ctx->fieldSystem->saveData));
    return FALSE;
}

BOOL ScrCmd_568(ScriptContext *ctx) {
    u16 r4 = ScriptGetVar(ctx);
    u16 *p_ret = ScriptGetVarPointer(ctx);
    *p_ret = 0;
    if (r4 >= 0x12A && r4 <= 0x139) {
        *p_ret = 1;
    }
    return FALSE;
}

BOOL ScrCmd_571(ScriptContext *ctx) {
    u16 *p_ret = ScriptGetVarPointer(ctx);
    u16 sp4 = ScriptGetVar(ctx);
    u16 sp8 = ScriptGetVar(ctx);
    u16 spC = ScriptGetVar(ctx);
    u16 r7 = ScriptGetVar(ctx);
    String *r7_str;
    String *sp0_str;
    MessageFormat *msgFmt = MessageFormat_New(HEAP_ID_32);
    MsgData *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, NARC_msg_msg_0202_bin, HEAP_ID_32);
    BufferECWord(msgFmt, 0, sp4);
    BufferECWord(msgFmt, 1, sp8);
    BufferECWord(msgFmt, 2, spC);
    BufferECWord(msgFmt, 3, r7);
    r7_str = ReadMsgData_ExpandPlaceholders(msgFmt, msgData, msg_0202_00001, HEAP_ID_32);
    sp0_str = NewString_ReadMsgData(msgData, msg_0202_00000);
    *p_ret = String_Compare(r7_str, sp0_str) == FALSE;
    String_Delete(r7_str);
    String_Delete(sp0_str);
    DestroyMsgData(msgData);
    MessageFormat_Delete(msgFmt);
    return FALSE;
}

BOOL ScrCmd_573(ScriptContext *ctx) {
    Save_SysInfo_SetMysteryGiftActive(Save_SysInfo_Get(ctx->fieldSystem->saveData), 1);
    return FALSE;
}

BOOL ScrCmd_576(ScriptContext *ctx) {
    FieldSystem *fieldSystem = ctx->fieldSystem;
    u16 *p_ret = ScriptGetVarPointer(ctx);
    MessageFormat **p_msgFmt = FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_MESSAGE_FORMAT);
    *p_ret = sub_0205A6AC(*p_msgFmt);
    return FALSE;
}

BOOL ScrCmd_577(ScriptContext *ctx) {
    sub_0203A880();
    return FALSE;
}

BOOL ScrCmd_578(ScriptContext *ctx) {
    sub_0203A914();
    return FALSE;
}

BOOL ScrCmd_579(ScriptContext *ctx) {
    FieldSystem_SyncMapObjectsToSave(ctx->fieldSystem);
    return FALSE;
}

BOOL ScrCmd_582(ScriptContext *ctx) {
    u16 mapId = ScriptGetVar(ctx);
    u16 x = ScriptGetVar(ctx);
    u16 y = ScriptGetVar(ctx);
    Location *specialSpawn = LocalFieldData_GetSpecialSpawnWarpPtr(Save_LocalFieldData_Get(ctx->fieldSystem->saveData));
    specialSpawn->mapId = mapId;
    specialSpawn->x = x;
    specialSpawn->y = y;
    specialSpawn->warpId = -1;
    specialSpawn->direction = DIR_SOUTH;
    return FALSE;
}

BOOL ScrCmd_583(ScriptContext *ctx) {
    u16 objectId = ScriptGetVar(ctx);
    u8 r4 = ScriptReadByte(ctx);
    LocalMapObject *object = GetMapObjectByID(ctx->fieldSystem->mapObjectMan, objectId);
    GF_ASSERT(object != NULL);
    MapObject_ClearFlag18(object, r4);
    return FALSE;
}

BOOL ScrCmd_GetTrcardStars(ScriptContext *ctx) {
    FieldSystem *fieldSystem = ctx->fieldSystem;
    u16 *p_ret = ScriptGetVarPointer(ctx);
    *p_ret = sub_020691E8(fieldSystem);
    return FALSE;
}

BOOL ScrCmd_ShowSaveStats(ScriptContext *ctx) {
    FieldSystem *fieldSystem = ctx->fieldSystem;
    struct SaveStatsPrinter **saveStatsPrinter = FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_SAVE_STATS_PRINTER);
    if (!Save_FileDoesNotBelongToPlayer(fieldSystem->saveData)) {
        *saveStatsPrinter = Field_SaveStatsPrinter_New(fieldSystem, HEAP_ID_4, 3);
        Field_SaveStatsPrinter_Print(*saveStatsPrinter);
    }
    return FALSE;
}

BOOL ScrCmd_HideSaveStats(ScriptContext *ctx) {
    FieldSystem *fieldSystem = ctx->fieldSystem;
    struct SaveStatsPrinter **saveStatsPrinter = FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_SAVE_STATS_PRINTER);
    if (!Save_FileDoesNotBelongToPlayer(fieldSystem->saveData)) {
        Field_SaveStatsPrinter_RemoveFromScreen(*saveStatsPrinter);
        Field_SaveStatsPrinter_Delete(*saveStatsPrinter);
    }
    return FALSE;
}

BOOL ScrCmd_595(ScriptContext *ctx) {
    u8 r1 = ScriptReadByte(ctx);
    sub_02067A80(ctx->fieldSystem, r1);
    return FALSE;
}

BOOL ScrCmd_627(ScriptContext *ctx) {
    struct UnkStruct_ScrCmd627 **p_work = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_RUNNING_APP_DATA);
    u8 r6 = ScriptReadByte(ctx);
    struct UnkStruct_ScrCmd627 *work = AllocFromHeapAtEnd(HEAP_ID_FIELD, sizeof(struct UnkStruct_ScrCmd627));
    MI_CpuClear8(work, sizeof(struct UnkStruct_ScrCmd627));
    *p_work = work;
    if (r6 == 5 || r6 == 6) {
        work->unk_0 = ctx->fieldSystem->unkA0;
    } else {
        work->unk_0 = NULL;
    }
    work->options = Save_PlayerData_GetOptionsAddr(ctx->fieldSystem->saveData);
    work->unk_20 = r6;
    work->saveData = ctx->fieldSystem->saveData;
    work->mapId = ctx->fieldSystem->location->mapId;
    work->unk_0C = ctx->fieldSystem->unk94;
    work->unk_1C = ctx->fieldSystem->unkB0;
    CallApplicationAsTask(ctx->taskman, &_02108584, work);
    SetupNativeScript(ctx, ScrNative_WaitApplication_DestroyTaskData);
    return TRUE;
}

BOOL ScrCmd_631(ScriptContext *ctx) {
    void **p_work = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_RUNNING_APP_DATA);
    u16 r6 = ScriptGetVar(ctx);
    u16 r7 = ScriptGetVar(ctx);
    u16 r3 = ScriptGetVar(ctx);
    *p_work = sub_0203FAB4(ctx->fieldSystem, r6, r7, r3, HEAP_ID_32);
    SetupNativeScript(ctx, ScrNative_WaitApplication_DestroyTaskData);
    return TRUE;
}

BOOL ScrCmd_ScratchOffCard(ScriptContext *ctx) {
    ScratchCardAppData **scratchCardData = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_RUNNING_APP_DATA);
    *scratchCardData = ScratchOffCards_Create(ctx->fieldSystem, HEAP_ID_32);
    SetupNativeScript(ctx, ScrNative_WaitApplication);
    return TRUE;
}

BOOL ScrCmd_ScratchOffCardEnd(ScriptContext *ctx) {
    ScratchCardAppData **scratchCardData = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_RUNNING_APP_DATA);
    FreeToHeap(*scratchCardData);
    *scratchCardData = NULL;
    return TRUE;
}

BOOL ScrCmd_GetScratchOffPrize(ScriptContext *ctx) {
    u16 cardno = ScriptGetVar(ctx);
    u16 *p_ret1 = ScriptGetVarPointer(ctx);
    u16 *p_ret2 = ScriptGetVarPointer(ctx);
    ScratchCardAppData **scratchCardDataPtr = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_RUNNING_APP_DATA);
    ScratchCardAppData *scratchCardData = *scratchCardDataPtr;
    *p_ret1 = scratchCardData->unk_08[cardno];
    *p_ret2 = scratchCardData->unk_0E[cardno];
    return FALSE;
}

BOOL ScrCmd_662(ScriptContext *ctx) {
    u16 r6 = ScriptGetVar(ctx);
    u16 r7 = ScriptGetVar(ctx);
    u16 *p_ret = ScriptGetVarPointer(ctx);
    if (sub_0203A05C(ctx->fieldSystem->saveData)) {
        *p_ret = 1;
        sub_0203FC14(ctx->fieldSystem, r7, r6);
        SetupNativeScript(ctx, ScrNative_WaitApplication);
    } else {
        *p_ret = 0;
    }
    return TRUE;
}

BOOL ScrCmd_663(ScriptContext *ctx) {
    u16 *p_var = ScriptGetVarPointer(ctx);
    if (sub_0203A05C(ctx->fieldSystem->saveData)) {
        sub_02056D00(ctx->taskman, *p_var);
    }
    return TRUE;
}

BOOL ScrCmd_667(ScriptContext *ctx) {
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

u32 sub_020467A8(SaveData *saveData);

BOOL ScrCmd_GetOwnedRotomForms(ScriptContext *ctx) {
    FieldSystem *fieldSystem = ctx->fieldSystem;
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

    flag = sub_020467A8(fieldSystem->saveData);
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

u32 sub_020467A8(SaveData *saveData) {
    u32 ret = 0;
    Party *party = SaveArray_Party_Get(saveData);
    int partyCount = Party_GetCount(party);
    int i, j;

    for (i = 0; i < partyCount; i++) {
        Pokemon *mon = Party_GetMonByIndex(party, i);
        if (GetMonData(mon, MON_DATA_SPECIES, NULL) == SPECIES_ROTOM && !GetMonData(mon, MON_DATA_IS_EGG, NULL)) {
            ret |= 1 << GetMonData(mon, MON_DATA_FORM, NULL);
        }
    }

    Daycare *dayCare = Save_Daycare_Get(saveData);
    for (i = 0; i < 2; i++) {
        BoxPokemon *boxMon = DaycareMon_GetBoxMon(Save_Daycare_GetMonX(dayCare, i));
        if (GetBoxMonData(boxMon, MON_DATA_SPECIES, NULL) == SPECIES_ROTOM && !GetBoxMonData(boxMon, MON_DATA_IS_EGG, NULL)) {
            ret |= 1 << GetBoxMonData(boxMon, MON_DATA_FORM, NULL);
        }
    }

    PC_STORAGE *pcStorage = SaveArray_PCStorage_Get(saveData);
    for (i = 0; i < (u32)NUM_BOXES; i++) {
        for (j = 0; j < MONS_PER_BOX; j++) {
            BoxPokemon *boxMon = PCStorage_GetMonByIndexPair(pcStorage, i, j);
            if (GetBoxMonData(boxMon, MON_DATA_SPECIES, NULL) == SPECIES_ROTOM && !GetBoxMonData(boxMon, MON_DATA_IS_EGG, NULL)) {
                ret |= 1 << GetBoxMonData(boxMon, MON_DATA_FORM, NULL);
            }
        }
    }

    Pokemon *walkerMon = AllocMonZeroed(HEAP_ID_32);
    BoxPokemon *walkerBoxMon = Mon_GetBoxMon(walkerMon);
    POKEWALKER *pokeWalker = Save_Pokewalker_Get(saveData);
    if (Pokewalker_TryGetBoxMon(pokeWalker, walkerBoxMon)) {
        if (GetBoxMonData(walkerBoxMon, MON_DATA_SPECIES, NULL) == SPECIES_ROTOM && !GetBoxMonData(walkerBoxMon, MON_DATA_IS_EGG, NULL)) {
            ret |= 1 << GetBoxMonData(walkerBoxMon, MON_DATA_FORM, NULL);
        }
    }
    FreeToHeap(walkerMon);

    return ret;
}

BOOL ScrCmd_AddSpecialGameStat2(ScriptContext *ctx) {
    u16 statno = ScriptReadHalfword(ctx);
    GameStats_AddSpecial(Save_GameStats_Get(ctx->fieldSystem->saveData), statno);
    return FALSE;
}

BOOL ScrCmd_682(ScriptContext *ctx) {
    static u32 sHeap4Size;
    static u32 sHeap32Size;
    static u32 sHeap11Size;
    u16 action = ScriptGetVar(ctx);
    u32 heap11Size = GF_ExpHeap_FndGetTotalFreeSize(HEAP_ID_FIELD);
    u32 heap4Size = GF_ExpHeap_FndGetTotalFreeSize(HEAP_ID_4);
    u32 heap32Size = GF_ExpHeap_FndGetTotalFreeSize(HEAP_ID_32);

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

BOOL ScrCmd_691(ScriptContext *ctx) {
    FieldSystem *fieldSystem = ctx->fieldSystem;
    u16 *p_ret = ScriptGetVarPointer(ctx);
    if (GF_RTC_DateTimeToSec() - fieldSystem->unkB4 >= 120) {
        *p_ret = TRUE;
    } else {
        *p_ret = FALSE;
    }
    return FALSE;
}

BOOL ScrCmd_696(ScriptContext *ctx) {
    FieldSystem *fieldSystem = ctx->fieldSystem;
    u16 r5 = ScriptGetVar(ctx);
    Party *party = SaveArray_Party_Get(ctx->fieldSystem->saveData);
    int i, partyCount;
    Pokemon *mon;

    Party_UpdateAllGiratina_DistortionWorld(party, r5);
    partyCount = Party_GetCount(party);
    for (i = 0; i < partyCount; i++) {
        mon = Party_GetMonByIndex(party, i);
        if (!GetMonData(mon, MON_DATA_IS_EGG, NULL)) {
            Pokedex_SetMonCaughtFlag(Save_Pokedex_Get(fieldSystem->saveData), mon);
        }
    }
    return FALSE;
}

BOOL ScrCmd_FollowerPokeIsEventTrigger(ScriptContext *ctx) {
    u8 r4 = ScriptReadByte(ctx);
    u16 r7 = ScriptGetVar(ctx);
    u16 *r6 = ScriptGetVarPointer(ctx);
    Pokemon *mon;
    int species;

    *r6 = 0;
    mon = Party_GetMonByIndex(SaveArray_Party_Get(ctx->fieldSystem->saveData), r7);

    if (r4 >= 4) {
        return FALSE;
    }
    if (GetMonData(mon, MON_DATA_IS_EGG, NULL) || GetMonData(mon, MON_DATA_CHECKSUM_FAILED, NULL)) {
        return FALSE;
    }
    if (!sub_0208E9E0(r4, mon, GetMonData(mon, MON_DATA_OTID, NULL) == PlayerProfile_GetTrainerID(
        Save_PlayerData_GetProfileAddr(ctx->fieldSystem->saveData)))) {
        return FALSE;
    }

    species = GetMonData(mon, MON_DATA_SPECIES, NULL);
    switch (r4) {
    case 0:
        if ((species == SPECIES_PICHU || species == SPECIES_PIKACHU || species == SPECIES_RAICHU) && MonIsShiny(mon)) {
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

BOOL ScrCmd_596(ScriptContext *ctx) {
    FieldSystem *fieldSystem = ctx->fieldSystem;
    u16 *p_ret = ScriptGetVarPointer(ctx);
    *p_ret = ov01_022055DC(GetMapObjectByID(fieldSystem->mapObjectMan, obj_partner_poke));
    return FALSE;
}

BOOL ScrCmd_597(ScriptContext *ctx) {
    FieldSystem *fieldSystem = ctx->fieldSystem;
    ov01_02203AB4(fieldSystem, GetMapObjectByID(fieldSystem->mapObjectMan, obj_partner_poke), 0);
    return TRUE;
}

BOOL ScrCmd_598(ScriptContext *ctx) {
    FieldSystem *fieldSystem = ctx->fieldSystem;
    u16 mode = ScriptReadHalfword(ctx);
    LocalMapObject *obj1, *obj2;
    if (mode == 1) {
        obj1 = PlayerAvatar_GetMapObject(fieldSystem->playerAvatar);
        obj2 = FollowingPokemon_GetMapObject(fieldSystem);
    } else if (mode == 2) {
        obj1 = FollowingPokemon_GetMapObject(fieldSystem);
        obj2 = PlayerAvatar_GetMapObject(fieldSystem->playerAvatar);
    } else {
        GF_ASSERT(0);
        return FALSE;
    }
    ov02_0224E0BC(obj1, obj2, ctx->taskman);
    return TRUE;
}

BOOL ScrCmd_599(ScriptContext *ctx) {
    ov01_02205AEC(ctx->fieldSystem);
    return TRUE;
}

BOOL ScrCmd_600(ScriptContext *ctx) {
    if (ov01_02205D68(ctx->fieldSystem)) {
        return TRUE;
    } else {
        return FALSE;
    }
}

BOOL ScrCmd_FollowPokeFacePlayer(ScriptContext *ctx) {
    BOOL doFace = TRUE;
    if (FollowingPokemon_IsActive(ctx->fieldSystem)) {
        if (ov01_022055DC(FollowingPokemon_GetMapObject(ctx->fieldSystem))) {
            LocalMapObject *myObject = PlayerAvatar_GetMapObject(FieldSystem_GetPlayerAvatar(ctx->fieldSystem));
            int facingDirection = PlayerAvatar_GetFacingDirection(FieldSystem_GetPlayerAvatar(ctx->fieldSystem));
            int playerX = MapObject_GetCurrentX(myObject);
            int deltaX = GetDeltaXByFacingDirection(facingDirection) * 2;
            int playerElev = MapObject_GetCurrentHeight(myObject);
            int playerY = MapObject_GetCurrentY(myObject);
            int deltaY = GetDeltaYByFacingDirection(facingDirection) * 2;
            u8 facingTile = GetMetatileBehaviorAt(ctx->fieldSystem, playerX + deltaX, playerY + deltaY);
            VecFx32 posVec;
            MapObject_GetPositionVec(myObject, &posVec);
            if (sub_020549A8(ctx->fieldSystem, &posVec, playerX + deltaX, playerY + deltaY, 0) || MetatileBehavior_IsSurfableWater(facingTile) || sub_02060BFC(myObject, playerX + deltaX, playerElev, playerY + deltaY)) {
                doFace = FALSE;
            }
        }
        if (doFace) {
            return ScrCmd_FacePlayer(ctx);
        }
    }
    return FALSE;
}

BOOL ScrCmd_ToggleFollowingPokemonMovement(ScriptContext *ctx) {
    u16 mode = ScriptReadHalfword(ctx);
    if (FollowingPokemon_IsActive(ctx->fieldSystem)) {
        if (mode) {
            MapObject_PauseMovement(FollowingPokemon_GetMapObject(ctx->fieldSystem));
        } else {
            MapObject_UnpauseMovement(FollowingPokemon_GetMapObject(ctx->fieldSystem));
        }
    }
    return FALSE;
}

static BOOL NativeScript_WaitFollowingPokemonMovement(ScriptContext *ctx);

BOOL ScrCmd_WaitFollowingPokemonMovement(ScriptContext *ctx) {
    if (FollowingPokemon_IsActive(ctx->fieldSystem)) {
        SetupNativeScript(ctx, NativeScript_WaitFollowingPokemonMovement);
    }
    return TRUE;
}

BOOL ScrCmd_FollowingPokemonMovement(ScriptContext *ctx) {
    u16 movement = ScriptReadHalfword(ctx);
    if (FollowingPokemon_IsActive(ctx->fieldSystem)) {
        sub_0205FC94(GetMapObjectByID(ctx->fieldSystem->mapObjectMan, obj_partner_poke), movement);
    }
    return TRUE;
}

static BOOL NativeScript_WaitFollowingPokemonMovement(ScriptContext *ctx) {
    if (MapObject_IsMovementPaused(FollowingPokemon_GetMapObject(ctx->fieldSystem))) {
        return TRUE;
    } else {
        return FALSE;
    }
}

BOOL ScrCmd_605(ScriptContext *ctx) {
    u8 r6 = ScriptReadByte(ctx);
    u8 r4 = ScriptReadByte(ctx);
    if (FollowingPokemon_IsActive(ctx->fieldSystem)) {
        LocalMapObject *playerObj = PlayerAvatar_GetMapObject(ctx->fieldSystem->playerAvatar);
        LocalMapObject *tsurePokeObj = GetMapObjectByID(ctx->fieldSystem->mapObjectMan, obj_partner_poke);
        ov01_02205720(playerObj, tsurePokeObj, r6, r4);
    }
    return FALSE;
}

BOOL ScrCmd_606(ScriptContext *ctx) {
    if (FollowingPokemon_IsActive(ctx->fieldSystem)) {
        LocalMapObject *object = FollowingPokemon_GetMapObject(ctx->fieldSystem);
        if (GetFollowPokePermissionBySpeciesAndMap(FollowPokeObj_GetSpecies(object), ctx->fieldSystem->location->mapId)) {
            sub_02069E84(object, 1);
            sub_02069DEC(object, TRUE);
            ov01_02205790(ctx->fieldSystem, 1);
        }
    }
    return FALSE;
}

BOOL ScrCmd_607(ScriptContext *ctx) {
    if (FollowingPokemon_IsActive(ctx->fieldSystem)) {
        LocalMapObject *object = FollowingPokemon_GetMapObject(ctx->fieldSystem);
        if (GetFollowPokePermissionBySpeciesAndMap(FollowPokeObj_GetSpecies(object), ctx->fieldSystem->location->mapId)) {
            ov01_02205790(ctx->fieldSystem, 1);
        }
    }
    return FALSE;
}

BOOL ScrCmd_608(ScriptContext *ctx) {
    if (FollowingPokemon_IsActive(ctx->fieldSystem)) {
        LocalMapObject *object = GetMapObjectByID(ctx->fieldSystem->mapObjectMan, obj_partner_poke);
        ov01_02205784(object);
    }
    return FALSE;
}

BOOL ScrCmd_609(ScriptContext *ctx) {
    if (FollowingPokemon_IsActive(ctx->fieldSystem)) {
        LocalMapObject *object = GetMapObjectByID(ctx->fieldSystem->mapObjectMan, obj_partner_poke);
        sub_020659CC(object);
    }
    return TRUE;
}

BOOL ScrCmd_610(ScriptContext *ctx) {
    u16 r1 = ScriptReadHalfword(ctx);
    ov01_021EACBC(ctx->fieldSystem->unk28, r1);
    return TRUE;
}

BOOL ScrCmd_Pokeathlon(ScriptContext *ctx) {
    u8 r6 = ScriptReadByte(ctx);
    u8 r4 = ScriptReadByte(ctx);
    u16 r7 = ScriptGetVar(ctx);
    u16 *sp10 = ScriptGetVarPointer(ctx);
    u16 *sp14 = ScriptGetVarPointer(ctx);
    u16 *sp18 = ScriptGetVarPointer(ctx);
    u16 *spC = ScriptGetVarPointer(ctx);
    sub_02095DF4(ctx->fieldSystem, r6, r4, r7, sp10, sp14, sp18, spC);
    return TRUE;
}

BOOL ScrCmd_GetFriendSprite(ScriptContext *ctx) {
    u16 *p_ret = ScriptGetVarPointer(ctx);
    if (PlayerProfile_GetTrainerGender(Save_PlayerData_GetProfileAddr(FieldSystem_GetSaveData(ctx->fieldSystem))) != PLAYER_GENDER_MALE) {
        *p_ret = SPRITE_HERO;
    } else {
        *p_ret = SPRITE_HEROINE;
    }
    return TRUE;
}

BOOL ScrCmd_RegisterPokegearCard(ScriptContext *ctx) {
    SavePokegear *pokegear = SaveData_GSPlayerMisc_Get(FieldSystem_GetSaveData(ctx->fieldSystem));
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

BOOL ScrCmd_804(ScriptContext *ctx) {
    sub_0202EE58(SaveData_GSPlayerMisc_Get(ctx->fieldSystem->saveData), ScriptReadByte(ctx));
    return FALSE;
}

BOOL ScrCmd_RegisterGearNumber(ScriptContext *ctx) {
    SavePokegear *pokegear = SaveData_GSPlayerMisc_Get(FieldSystem_GetSaveData(ctx->fieldSystem));
    u8 number = ScriptGetVar(ctx);
    if (number < NUM_PHONE_CONTACTS) {
        RegisterPhoneNumberInPokeGear(pokegear, number);
    }
    return FALSE;
}

BOOL ScrCmd_CheckRegisteredPhoneNumber(ScriptContext *ctx) {
    SavePokegear *pokegear = SaveData_GSPlayerMisc_Get(FieldSystem_GetSaveData(ctx->fieldSystem));
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

BOOL ScrCmd_SetPhoneCall(ScriptContext *ctx) {
    u16 r4 = ScriptGetVar(ctx);
    u16 r6 = ScriptGetVar(ctx);
    u16 r7 = ScriptGetVar(ctx);
    void **p_work = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_RUNNING_APP_DATA); //PhoneCallAppData
    sub_02092DF4(FieldSystem_GetGearPhoneRingManager(ctx->fieldSystem));
    ctx->fieldSystem->unkD2_7 = TRUE;
    ov02_02251EB8(FieldSystem_GetGearPhoneRingManager(ctx->fieldSystem), r4, 0xFF, 0, r6, r7);
    return TRUE;
}

BOOL ScrCmd_RunPhoneCall(ScriptContext *ctx) {
    void **p_work = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_RUNNING_APP_DATA);
    *p_work = PhoneUI_New(ctx->fieldSystem);
    SetupNativeScript(ctx, ScrNative_WaitApplication_DestroyTaskData);
    return TRUE;
}

BOOL ScrCmd_LoadPhoneDat(ScriptContext *ctx) {
    u16 idx = ScriptGetVar(ctx);
    u16 *p_ret = ScriptGetVarPointer(ctx);
    *p_ret = LoadPhoneBookEntryI(idx, sub_02092E10(FieldSystem_GetGearPhoneRingManager(ctx->fieldSystem)), HEAP_ID_32);
    return FALSE;
}

BOOL ScrCmd_GetPhoneContactMsgIds(ScriptContext *ctx) {
    u16 *p_scriptno = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_ACTIVE_SCRIPT_NUMBER);
    u8 r6 = ScriptReadByte(ctx);
    u16 *sp0 = ScriptGetVarPointer(ctx);
    u16 *p_ret_msg = ScriptGetVarPointer(ctx);
    PhoneBookEntry *entry = sub_02092E10(FieldSystem_GetGearPhoneRingManager(ctx->fieldSystem));
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

BOOL ScrCmd_462(ScriptContext *ctx) {
    u16 idx = ScriptGetVar(ctx);
    PhoneRematches_SetSeeking(SaveData_GetMomsSavingsAddr(ctx->fieldSystem->saveData), idx, FALSE);
    return FALSE;
}

BOOL ScrCmd_GetPhoneContactRandomGiftBerry(ScriptContext *ctx) {
    u16 *p_ret = ScriptGetVarPointer(ctx);
    PhoneBookEntry *entry = sub_02092E10(FieldSystem_GetGearPhoneRingManager(ctx->fieldSystem));
    if (entry->gift == ITEM_CHERI_BERRY) {
        *p_ret = ITEM_CHERI_BERRY + (LCRandom() % 10);
    } else {
        *p_ret = entry->gift;
    }
    return FALSE;
}

BOOL ScrCmd_GetPhoneContactGiftItem(ScriptContext *ctx) {
    u16 *p_ret = ScriptGetVarPointer(ctx);
    PhoneBookEntry *entry = sub_02092E10(FieldSystem_GetGearPhoneRingManager(ctx->fieldSystem));
    MomsSavings *momsSavings = SaveData_GetMomsSavingsAddr(ctx->fieldSystem->saveData);
    *p_ret = PhoneRematches_GiftItemIdGet(momsSavings, entry->unk0);
    PhoneRematches_GiftItemIdSet(momsSavings, entry->unk0, ITEM_NONE);
    return FALSE;
}

BOOL ScrCmd_148(ScriptContext *ctx) {
    u8 r4 = ScriptReadByte(ctx);
    sub_02092E14(FieldSystem_GetGearPhoneRingManager(ctx->fieldSystem), r4, ScriptReadByte(ctx));
    return FALSE;
}

BOOL ScrCmd_149(ScriptContext *ctx) {
    sub_0202F050(SaveData_GetMomsSavingsAddr(ctx->fieldSystem->saveData), ScriptReadByte(ctx));
    return FALSE;
}

BOOL ScrCmd_CameronPhoto(ScriptContext *ctx) {
    u16 photo_num = ScriptReadHalfword(ctx);
    FieldSystem_TakePhoto(ctx->fieldSystem, photo_num);
    return TRUE;
}

BOOL ScrCmd_616(ScriptContext *ctx) {
    u16 *p_ret = ScriptGetVarPointer(ctx);
    *p_ret = PhotoAlbum_GetNumSaved(Save_PhotoAlbum_Get(ctx->fieldSystem->saveData));
    return FALSE;
}

BOOL ScrCmd_617(ScriptContext *ctx) {
    sub_0206A860(ctx->fieldSystem);
    return TRUE;
}

BOOL ScrCmd_621(ScriptContext *ctx) {
    FieldSystem *fieldSystem = ctx->fieldSystem;
    const struct UnkStruct_020FACDC sp4[3] = {
        {0x00083000, 0x00000000, 0x00041000},
        {0x0008D000, 0x00000000, 0x00041000},
        {0x00088000, 0x00000000, 0x00048000},
    };
    int n, i;

    int partyCount = Party_GetCount(SaveArray_Party_Get(fieldSystem->saveData));
    if (FlagGet(fieldSystem, FLAG_GOT_TM51_FROM_FALKNER)) {
        n = 0;
    } else if (FlagGet(fieldSystem, FLAG_MET_PASSERBY_BOY)) {
        n = 1;
    } else if (partyCount > 0) {
        n = 2;
    } else {
        n = 3;
    }
    for (i = 0; i < n; i++) {
        ov01_021F3C0C(fieldSystem->unk9C, 0x8D, &sp4[i], 0, fieldSystem->unk54);
    }
    return FALSE;
}

BOOL ScrCmd_622(ScriptContext *ctx) {
    u16 objectId = ScriptReadHalfword(ctx);
    u16 *p_ret = ScriptGetVarPointer(ctx);
    LocalMapObject *object = GetMapObjectByID(ctx->fieldSystem->mapObjectMan, objectId);
    if (object != NULL) {
        *p_ret = MapObject_GetFacingDirection(object);
    } else {
        *p_ret = DIR_NORTH;
    }
    return FALSE;
}

BOOL ScrCmd_FollowPokeInteract(ScriptContext *ctx) {
    FieldSystem_FollowPokeInteract(ctx->fieldSystem);
    return TRUE;
}

BOOL ScrCmd_712(ScriptContext *ctx) { //smth creating alph puzzle screen?
    void **p_work = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_RUNNING_APP_DATA);
    u8 action = ScriptReadByte(ctx);
    switch (action) {
    case 1:
        *p_work = sub_0203EEE4(ctx->fieldSystem);
        break;
    case 2:
        *p_work = sub_0203EF40(ctx->fieldSystem);
        break;
    case 3:
        *p_work = sub_0203EFA0(ctx->fieldSystem);
        break;
    default:
    case 0:
        *p_work = sub_0203EEA0(ctx->fieldSystem);
        break;
    }
    SetupNativeScript(ctx, ScrNative_WaitApplication_DestroyTaskData);
    return TRUE;
}

BOOL ScrCmd_AlphPuzzle(ScriptContext *ctx) { //this just loads a different puzzle with another ID
    void **p_work = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_RUNNING_APP_DATA);
    u8 puzzle = ScriptReadByte(ctx);
    if (puzzle > 4) {
        puzzle = 0;
    }
    *p_work = FieldSystem_CreateApplication_AlphPuzzle(ctx->fieldSystem, puzzle);
    SetupNativeScript(ctx, ScrNative_WaitApplication_DestroyTaskData);
    return TRUE;
}

BOOL ScrCmd_722(ScriptContext *ctx) {
    u8 r7 = ScriptReadByte(ctx);
    u8 r6 = ScriptReadByte(ctx);
    u16 sp8 = ScriptReadHalfword(ctx);
    u16 r4 = ScriptReadHalfword(ctx);
    u16 sp4 = ScriptReadHalfword(ctx);
    sub_020977CC(ctx->fieldSystem, r7, r6, sp8, r4, sp4);
    return TRUE;
}

BOOL ScrCmd_723(ScriptContext *ctx) {
    u8 r7 = ScriptReadByte(ctx);
    u8 r6 = ScriptReadByte(ctx);
    u16 sp8 = ScriptReadHalfword(ctx);
    u16 r4 = ScriptReadHalfword(ctx);
    u16 sp4 = ScriptReadHalfword(ctx);
    sub_020979A8(ctx->fieldSystem, r7, r6, sp8, r4, sp4);
    return TRUE;
}

BOOL ScrCmd_Cinematic(ScriptContext *ctx) {
    u16 scene = ScriptReadHalfword(ctx);
    sub_02097BE0(ctx->fieldSystem, scene);
    return TRUE;
}

BOOL ScrCmd_727(ScriptContext *ctx) {
    u16 *p_ret = ScriptGetVarPointer(ctx);
    *p_ret = GetIdxOfFirstAliveMonInParty_CrashIfNone(SaveArray_Party_Get(ctx->fieldSystem->saveData));
    return FALSE;
}

BOOL ScrCmd_728(ScriptContext *ctx) {
    u8 r1 = ScriptReadByte(ctx);
    u8 r2 = ScriptReadByte(ctx);
    if (ov01_022060B8(ctx->fieldSystem, r1, r2)) {
        return TRUE;
    } else {
        return FALSE;
    }
}

BOOL ScrCmd_729(ScriptContext *ctx) {
    u16 *p_ret = ScriptGetVarPointer(ctx);
    if (FollowingPokemon_IsActive(ctx->fieldSystem)) {
        *p_ret = TRUE;
    } else {
        *p_ret = FALSE;
    }
    return FALSE;
}

BOOL ScrCmd_730(ScriptContext *ctx) {
    u16 *p_ret = ScriptGetVarPointer(ctx);
    if (!FollowingPokemon_IsActive(ctx->fieldSystem)) {
        *p_ret = TRUE;
    } else if (ov01_022057C4(ctx->fieldSystem)) {
        *p_ret = TRUE;
    } else {
        *p_ret = FALSE;
    }
    return FALSE;
}

BOOL ScrCmd_731(ScriptContext *ctx) {
    ov02_022508B4(ctx->fieldSystem);
    return TRUE;
}

BOOL ScrCmd_732(ScriptContext *ctx) {
    s8 mood = ScriptReadByte(ctx);
    FieldSystemUnkSub108_AddMonMood(ctx->fieldSystem->unk108, mood);
    return FALSE;
}

BOOL ScrCmd_733(ScriptContext *ctx) {
    u8 r6 = ScriptReadByte(ctx);
    u16 *p_ret = ScriptGetVarPointer(ctx);
    if (ov02_02250780(ctx->fieldSystem, r6)) {
        *p_ret = TRUE;
    } else {
        *p_ret = FALSE;
    }
    return FALSE;
}

BOOL ScrCmd_734(ScriptContext *ctx) {
    u8 r1 = ScriptReadByte(ctx);
    ov02_022507B4(ctx->fieldSystem, r1);
    return TRUE;
}

BOOL sub_020476E8(ScriptContext *ctx);

BOOL ScrCmd_TouchscreenMenuHide(ScriptContext *ctx) {
    FieldSystem *fieldSystem = ctx->fieldSystem;
    if (ov01_021F6B00(fieldSystem) == 3) {
        return FALSE;
    }
    ov01_021F6A9C(fieldSystem, 3, 0);
    SetupNativeScript(ctx, sub_020476E8);
    fieldSystem->unk1C = 3;
    return TRUE;
}

BOOL sub_020476E8(ScriptContext *ctx) {
    FieldSystem *fieldSystem = ctx->fieldSystem;
    u16 *p_ret = GetVarPointer(fieldSystem, ctx->data[0]);
    int r5 = ov01_021F6B00(fieldSystem);
    int r0 = ov01_021F6B10(fieldSystem);
    if (r5 == 3 && r0 == 1) {
        return TRUE;
    } else {
        return FALSE;
    }
}

BOOL sub_02047744(ScriptContext *ctx);

BOOL ScrCmd_TouchscreenMenuShow(ScriptContext *ctx) {
    FieldSystem *fieldSystem = ctx->fieldSystem;
    ov01_021F6A9C(fieldSystem, 0, 0);
    SetupNativeScript(ctx, sub_02047744);
    fieldSystem->unk1C = 0;
    return TRUE;
}

BOOL sub_02047744(ScriptContext *ctx) {
    FieldSystem *fieldSystem = ctx->fieldSystem;
    u16 *p_ret = GetVarPointer(fieldSystem, ctx->data[0]);
    int r5 = ov01_021F6B00(fieldSystem);
    int r0 = ov01_021F6B10(fieldSystem);
    if (r5 == 0 && r0 == 1) {
        return TRUE;
    } else {
        return FALSE;
    }
}

BOOL ScrCmd_815(ScriptContext *ctx) {
    FieldSystem *fieldSystem = ctx->fieldSystem;
    u16 r1 = ScriptReadHalfword(ctx);
    sub_0203E33C(fieldSystem, r1);
    return FALSE;
}

BOOL sub_020477C0(ScriptContext *ctx);

BOOL ScrCmd_GetMenuChoice(ScriptContext *ctx) {
    FieldSystem *fieldSystem = ctx->fieldSystem;
    u16 var_ret = ScriptReadHalfword(ctx);
    ctx->data[0] = var_ret;
    ov01_021F6ABC(fieldSystem, 3, 3, &ctx->data[1]);
    SetupNativeScript(ctx, sub_020477C0);
    return TRUE;
}

BOOL sub_020477C0(ScriptContext *ctx) {
    FieldSystem *fieldSystem = ctx->fieldSystem;
    u16 *p_ret = GetVarPointer(fieldSystem, ctx->data[0]);
    int r7 = ov01_021F6B00(fieldSystem);
    int r0 = ov01_021F6AEC(fieldSystem);
    if (r7 == 3 && r0 == 6) {
        *p_ret = ctx->data[1];
        return TRUE;
    } else {
        return FALSE;
    }
}

BOOL ScrCmd_MenuInitStdGmm(ScriptContext *ctx) {
    sub_02041770(ctx, ov01_021F6B20(ctx->fieldSystem), NULL);
    return TRUE;
}

BOOL ScrCmd_MenuInit(ScriptContext *ctx) {
    sub_02041770(ctx, ov01_021F6B20(ctx->fieldSystem), ctx->msgdata);
    return TRUE;
}

BOOL ScrCmd_MenuItemAdd(ScriptContext *ctx) {
    struct UnkStruct_ov01_021EDC28 **p_menu = ov01_021F6B20(ctx->fieldSystem);
    u16 msgId = ScriptGetVar(ctx);
    u16 where = ScriptGetVar(ctx);
    u16 value = ScriptGetVar(ctx);
    MoveTutorMenu_SetListItem(*p_menu, msgId, where, value);
    return FALSE;
}

BOOL sub_020478D0(ScriptContext *ctx);
BOOL sub_02047908(struct UnkStruct_ov01_021EDC28 *menu, int idx);

BOOL ScrCmd_MenuExec(ScriptContext *ctx) {
    FieldSystem *fieldSystem = ctx->fieldSystem;
    struct UnkStruct_ov01_021EDC28 **p_menu = ov01_021F6B20(fieldSystem);
    u16 *p_ret = GetVarPointer(fieldSystem, ctx->data[0]);
    ov01_021F6ABC(fieldSystem, 3, 7, p_ret);
    ov01_021F6B34(fieldSystem, sub_02047908, *p_menu);
    SetupNativeScript(ctx, sub_020478D0);
    return TRUE;
}

BOOL sub_020478D0(ScriptContext *ctx) {
    FieldSystem *fieldSystem = ctx->fieldSystem;
    struct UnkStruct_ov01_021EDC28 **p_menu = ov01_021F6B20(fieldSystem);
    u16 *p_ret = GetVarPointer(fieldSystem, ctx->data[0]);
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

static u32 GetMaxBankTransactionAmount(FieldSystem *fieldSystem, int action) {
    u32 ret;
    u32 wallet = PlayerProfile_GetMoney(Save_PlayerData_GetProfileAddr(fieldSystem->saveData));
    u32 bank = MomSavingsBalanceAction(SaveData_GetMomsSavingsAddr(fieldSystem->saveData), MOMS_BALANCE_GET, 0);
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

BOOL sub_020479D4(ScriptContext *ctx);

BOOL ScrCmd_BankTransaction(ScriptContext *ctx) {
    struct BankTransactionWork **p_work = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MISC_DATA_PTR);
    u16 mode = ScriptReadHalfword(ctx);
    u16 var_ret = ScriptReadHalfword(ctx);
    struct BankTransactionWork *work = *p_work = AllocFromHeap(HEAP_ID_4, sizeof(struct BankTransactionWork)); // statement must be this way to match
    work->sub = AllocFromHeap(HEAP_ID_4, sizeof(struct BankTransactionWorkSub));
    work->mode = mode;
    work->sub->max = GetMaxBankTransactionAmount(ctx->fieldSystem, mode);
    work->sub->selected = -1;
    ov01_021F6A9C(ctx->fieldSystem, 5, work->sub);
    ctx->data[0] = var_ret;
    SetupNativeScript(ctx, sub_020479D4);
    return TRUE;
}

BOOL sub_020479D4(ScriptContext *ctx) {
    struct BankTransactionWork **p_work = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MISC_DATA_PTR);
    u16 *p_ret = GetVarPointer(ctx->fieldSystem, ctx->data[0]);
    struct BankTransactionWork *work = *p_work;
    if (work->sub->selected == -1) {
        return FALSE;
    } else if (work->sub->selected == 0) {
        *p_ret = 1;
    } else {
        SaveData *saveData = ctx->fieldSystem->saveData;
        switch (work->mode) {
        case 0:
            PlayerProfile_SubMoney(Save_PlayerData_GetProfileAddr(saveData), work->sub->selected);
            MomSavingsBalanceAction(SaveData_GetMomsSavingsAddr(saveData), MOMS_BALANCE_ADD, work->sub->selected);
            break;
        case 1:
            PlayerProfile_AddMoney(Save_PlayerData_GetProfileAddr(saveData), work->sub->selected);
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

BOOL ScrCmd_BankOrWalletIsFull(ScriptContext *ctx) {
    u16 action = ScriptReadHalfword(ctx);
    u16 *p_ret = ScriptGetVarPointer(ctx);
    if (action == 0) {
        if (MomSavingsBalanceAction(SaveData_GetMomsSavingsAddr(ctx->fieldSystem->saveData), MOMS_BALANCE_GET, 0) == MAX_MONEY) {
            *p_ret = TRUE;
        } else {
            *p_ret = FALSE;
        }
    } else {
        if (PlayerProfile_GetMoney(Save_PlayerData_GetProfileAddr(ctx->fieldSystem->saveData)) == MAX_MONEY) {
            *p_ret = TRUE;
        } else {
            *p_ret = FALSE;
        }
    }
    return TRUE;
}

BOOL ScrCmd_RockSmashItemCheck(ScriptContext *ctx) {
    u16 followMonKnowsHm = ScriptGetVar(ctx);
    u16 *itemFound = ScriptGetVarPointer(ctx);
    u16 *item = ScriptGetVarPointer(ctx);
    FieldSystem_RockSmashItemCheck(ctx->fieldSystem, (u8)followMonKnowsHm, itemFound, item);
    return TRUE;
}

BOOL ScrCmd_754(ScriptContext *ctx) {
    u16 *r1 = ScriptGetVarPointer(ctx);
    ov01_02204ED8(ctx->fieldSystem, r1);
    return TRUE;
}

BOOL ScrCmd_755(ScriptContext *ctx) {
    ov02_02250A60(ctx->fieldSystem);
    return FALSE;
}

BOOL ScrCmd_756(ScriptContext *ctx) {
    ov02_02250AC8(ctx->fieldSystem);
    return FALSE;
}

BOOL ScrCmd_757(ScriptContext *ctx) {
    ov02_02250AE8(ctx->fieldSystem);
    return FALSE;
}

BOOL ScrCmd_758(ScriptContext *ctx) {
    u8 r1 = ScriptReadHalfword(ctx);
    ov02_02250AFC(ctx->fieldSystem, r1);
    return TRUE;
}

BOOL ScrCmd_759(ScriptContext *ctx) {
    ov02_02250B80(ctx->fieldSystem);
    return TRUE;
}

BOOL ScrCmd_760(ScriptContext *ctx) {
    ov02_02250B30(ctx->fieldSystem);
    return TRUE;
}

BOOL ScrCmd_761(ScriptContext *ctx) {
    u8 r1 = ScriptReadHalfword(ctx);
    ov02_02251424(ctx->fieldSystem, r1);
    return FALSE;
}

BOOL ScrCmd_762(ScriptContext *ctx) {
    u8 r1 = ScriptReadHalfword(ctx);
    ov02_022514C8(ctx->fieldSystem, r1);
    return FALSE;
}

BOOL ScrCmd_763(ScriptContext *ctx) {
    ov02_02251554(ctx->fieldSystem);
    return TRUE;
}

BOOL ScrCmd_764(ScriptContext *ctx) {
    ov02_022515A4(ctx->fieldSystem);
    return TRUE;
}

BOOL ScrCmd_765(ScriptContext *ctx) {
    ov02_022518E0(ctx->fieldSystem);
    return FALSE;
}

BOOL ScrCmd_766(ScriptContext *ctx) {
    ov02_02251B14(ctx->fieldSystem);
    return FALSE;
}

BOOL ScrCmd_767(ScriptContext *ctx) {
    ov02_02251CF0(ctx->fieldSystem);
    return FALSE;
}

BOOL ScrCmd_768(ScriptContext *ctx) {
    ov02_02251DC4(ctx->fieldSystem);
    return FALSE;
}

BOOL ScrCmd_769(ScriptContext *ctx) {
    ov02_02251DE8(ctx->fieldSystem);
    return TRUE;
}

BOOL ScrCmd_SetFollowPokeInhibitState(ScriptContext *ctx) {
    SavFollowPoke_SetInhibitFlagState(Save_FollowPoke_Get(ctx->fieldSystem->saveData), ScriptReadByte(ctx));
    return FALSE;
}

// Loads an overlay containing additional script commands or data
BOOL ScrCmd_ScriptOverlayCmd(ScriptContext *ctx) {
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

BOOL ScrCmd_CheckBankBalance(ScriptContext *ctx) {
    u16 *p_ret = ScriptGetVarPointer(ctx);
    u32 check_amt = ScriptReadWord(ctx);
    if (MomSavingsBalanceAction(SaveData_GetMomsSavingsAddr(ctx->fieldSystem->saveData), MOMS_BALANCE_GET, 0) >= check_amt) {
        *p_ret = TRUE;
    } else {
        *p_ret = FALSE;
    }
    return FALSE;
}

BOOL ScrCmd_BufferRulesetName(ScriptContext *ctx) {
    u16 ruleset = ScriptReadHalfword(ctx);
    MessageFormat **p_msgFmt = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MESSAGE_FORMAT);
    ov03_022566D0(ctx->fieldSystem, *p_msgFmt, ruleset);
    return FALSE;
}

BOOL ScrCmd_799(ScriptContext *ctx) {
    u16 *p_var = ScriptGetVarPointer(ctx);
    MessageFormat **p_msgFmt = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MESSAGE_FORMAT);
    ov03_022566D0(ctx->fieldSystem, *p_msgFmt, *p_var);
    return FALSE;
}

BOOL ScrCmd_800(ScriptContext *ctx) {
    u16 *p_var = ScriptGetVarPointer(ctx);
    ov03_02256710(ctx->fieldSystem, *p_var);
    return FALSE;
}

BOOL ScrCmd_801(ScriptContext *ctx) {
    Window **p_moneyBox = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MONEY_BOX);
    u16 *p_var = ScriptGetVarPointer(ctx);
    *p_moneyBox = ov01_021EEF68(ctx->fieldSystem, *p_var);
    return FALSE;
}

BOOL ScrCmd_802(ScriptContext *ctx) {
    Window **p_moneyBox = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MONEY_BOX);
    ov01_021EEF88(*p_moneyBox);
    return FALSE;
}

BOOL ScrCmd_803(ScriptContext *ctx) {
    u16 *r4 = ScriptGetVarPointer(ctx);
    u16 *r6 = ScriptGetVarPointer(ctx);
    MessageFormat **p_msgFmt = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MESSAGE_FORMAT);
    *r6 = ov03_02256A2C(ctx->fieldSystem, *p_msgFmt, *r4);
    return FALSE;
}

BOOL ScrCmd_805(ScriptContext *ctx) {
    sub_02004B24(75);
    return FALSE;
}

BOOL ScrCmd_806(ScriptContext *ctx) {
    ov02_022523B4(ctx->fieldSystem->taskman);
    return TRUE;
}

BOOL ScrCmd_810(ScriptContext *ctx) {
    ov02_02252534(ctx->fieldSystem);
    return TRUE;
}

BOOL ScrCmd_814(ScriptContext *ctx) {
    SetFlag99A(Save_VarsFlags_Get(ctx->fieldSystem->saveData));
    return FALSE;
}

BOOL ScrCmd_UnownCircle(ScriptContext *ctx) {
    ov02_022529FC(ctx->fieldSystem);
    return TRUE;
}

BOOL ScrCmd_817(ScriptContext *ctx) {
    ov02_02252EE4(ctx->fieldSystem, ScriptReadByte(ctx));
    return TRUE;
}

BOOL ScrCmd_MystriStageGymmickInit(ScriptContext *ctx) {
    FieldSystem_InitMystriStageGymmick(ctx->fieldSystem);
    return FALSE;
}

BOOL ScrCmd_819(ScriptContext *ctx) {
    ov04_02256ED8(ctx->fieldSystem);
    return FALSE;
}

BOOL ScrCmd_820(ScriptContext *ctx) {
    ov04_02256F00(ctx->fieldSystem, ScriptReadByte(ctx));
    return TRUE;
}

BOOL ScrCmd_822(ScriptContext *ctx) {
    ov03_02258910(ctx->fieldSystem);
    return TRUE;
}

BOOL ScrCmd_823(ScriptContext *ctx) {
    u16 *p_var = ScriptGetVarPointer(ctx);
    MessageFormat **p_msgFmt = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MESSAGE_FORMAT);
    PlayerProfile *profile = PlayerProfile_New(HEAP_ID_4);
    SafariZone_GetLinkLeaderToProfile(Save_SafariZone_Get(ctx->fieldSystem->saveData), profile);
    BufferPlayersName(*p_msgFmt, *p_var, profile);
    FreeToHeap(profile);
    return FALSE;
}

BOOL ScrCmd_824(ScriptContext *ctx) {
    SafariZone *safariZone = Save_SafariZone_Get(ctx->fieldSystem->saveData);
    u16 *p_ret = ScriptGetVarPointer(ctx);
    SafariZone_DeactivateLinkIfExpired(safariZone);
    if (SafariZone_IsCurrentlyLinked(safariZone)) {
        *p_ret = TRUE;
    } else {
        *p_ret = FALSE;
    }
    return FALSE;
}

BOOL ScrCmd_829(ScriptContext *ctx) {
    u16 *p_ret = ScriptGetVarPointer(ctx);
    if (ov01_02206268(ctx->fieldSystem)) {
        *p_ret = TRUE;
    } else {
        *p_ret = FALSE;
    }
    return FALSE;
}

BOOL ScrCmd_830(ScriptContext *ctx) {
    u16 *p_ret = ScriptGetVarPointer(ctx);
    if (ov02_02253134(ctx->fieldSystem->saveData) == TRUE) {
        *p_ret = TRUE;
    } else {
        *p_ret = FALSE;
    }
    return FALSE;
}

BOOL ScrCmd_831(ScriptContext *ctx) {
    u16 *p_ret = ScriptGetVarPointer(ctx);
    *p_ret = ov02_0225316C();
    return FALSE;
}

BOOL ScrCmd_832(ScriptContext *ctx) {
    u16 *p_ret = ScriptGetVarPointer(ctx);
    if (ov02_02253188(ctx->fieldSystem->saveData) == TRUE) {
        *p_ret = TRUE;
    } else {
        *p_ret = FALSE;
    }
    return FALSE;
}

BOOL ScrCmd_833(ScriptContext *ctx) {
    u16 *p_ret = ScriptGetVarPointer(ctx);
    *p_ret = ov02_022531B4(ctx->fieldSystem->saveData);
    return FALSE;
}

BOOL ScrCmd_837(ScriptContext *ctx) {
    u16 *p_ret = ScriptGetVarPointer(ctx);
    if (sub_020291A4(ctx->fieldSystem->saveData, 0)) {
        *p_ret = TRUE;
    } else {
        *p_ret = FALSE;
    }
    return FALSE;
}
