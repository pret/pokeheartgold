#define _IN_FIELDMAP_C

#include "fieldmap.h"
#include "map_header.h"
#include "event_data.h"
#include "map_events.h"
#include "task.h"
#include "field_map_object.h"
#include "constants/std_script.h"
#include "fielddata/script/scr_seq.naix"
#include "msgdata/msg.naix"

struct ScriptBankMapping {
    u16 scriptIdLo;
    u16 scriptBank;
    u16 msgBank;
};

struct HiddenItemData {
    u16 itemId;
    u8 quantity;
    u8 unk3;
    u16 unk4;
    u16 index;
};

#include "data/fieldmap.h"

const struct ScriptBankMapping sScriptBankMapping[30] = {
    {_std_scratch_card, NARC_scr_seq_scr_seq_0263_bin, NARC_msg_msg_0433_bin},
    {_std_frontier_records, NARC_scr_seq_scr_seq_0264_bin,  NARC_msg_msg_0019_bin},
    {_std_frontier_move_tutor, NARC_scr_seq_scr_seq_0002_bin, NARC_msg_msg_0748_bin},
    {_std_bug_contest, NARC_scr_seq_scr_seq_0151_bin, NARC_msg_msg_0246_bin},
    {_std_trainer_house, NARC_scr_seq_scr_seq_0952_bin, NARC_msg_msg_0726_bin},
    {10300, NARC_scr_seq_scr_seq_0734_bin, NARC_msg_msg_0444_bin},
    {_std_mystery_gift, NARC_scr_seq_scr_seq_0144_bin, NARC_msg_msg_0209_bin},
    {10150, NARC_scr_seq_scr_seq_0955_bin, NARC_msg_msg_0732_bin},
    {_std_tv,               NARC_scr_seq_scr_seq_0954_bin, NARC_msg_msg_0733_bin},
    {_std_field_move,     NARC_scr_seq_scr_seq_0146_bin, NARC_msg_msg_0211_bin},
    {_std_dex_evaluation, NARC_scr_seq_scr_seq_0148_bin, NARC_msg_msg_0666_bin},
    { 9900,               NARC_scr_seq_scr_seq_0136_bin, NARC_msg_msg_0040_bin},
    { _std_pokeathlon,               NARC_scr_seq_scr_seq_0167_bin, NARC_msg_msg_0312_bin},
    { 9800,               NARC_scr_seq_scr_seq_0166_bin, NARC_msg_msg_0043_bin},
    { _std_following_mon,               NARC_scr_seq_scr_seq_0163_bin, NARC_msg_msg_0266_bin},
    { _std_init,               NARC_scr_seq_scr_seq_0149_bin, NARC_msg_msg_0040_bin},
    { _std_daycare,               NARC_scr_seq_scr_seq_0265_bin, NARC_msg_msg_0439_bin},
    { _std_group,               NARC_scr_seq_scr_seq_0143_bin, NARC_msg_msg_0204_bin},
    {_std_wifi_reception, NARC_scr_seq_scr_seq_0164_bin, NARC_msg_msg_0267_bin},
    {_std_colosseum,      NARC_scr_seq_scr_seq_0000_bin, NARC_msg_msg_0014_bin},
    {_std_comm_reception, NARC_scr_seq_scr_seq_0004_bin, NARC_msg_msg_0046_bin},
    {_std_chatot,         NARC_scr_seq_scr_seq_0165_bin, NARC_msg_msg_0268_bin},
    {_std_safari,         NARC_scr_seq_scr_seq_0262_bin, NARC_msg_msg_0427_bin},
    {_std_hidden_item,    NARC_scr_seq_scr_seq_0145_bin, NARC_msg_msg_0210_bin}, // Hidden Items
    {_std_item_ball,      NARC_scr_seq_scr_seq_0141_bin, NARC_msg_msg_0199_bin},
    {_std_npc_trainer_2,  NARC_scr_seq_scr_seq_0953_bin, NARC_msg_msg_0040_bin},
    {_std_npc_trainer,    NARC_scr_seq_scr_seq_0953_bin, NARC_msg_msg_0040_bin},
    {_std_apricorn_tree,  NARC_scr_seq_scr_seq_0150_bin, NARC_msg_msg_0023_bin},
    {_std_bookshelves,    NARC_scr_seq_scr_seq_0001_bin, NARC_msg_msg_0020_bin},
    {_std_misc,           NARC_scr_seq_scr_seq_0003_bin, NARC_msg_msg_0040_bin},
};

#define HEAP_ID_FIELDMAP                  11

void StartMapSceneScript(FieldSystem *fsys, u16 script, LocalMapObject *lastTalked) {
    ScriptEnvironment *r4 = ScriptEnvironment_new();
    SetupScriptEngine(fsys, r4, script, lastTalked, NULL);
    FieldSys_CreateTask(fsys, Task_RunScripts, r4);
}

void FieldSys_SetEngagedTrainer(FieldSystem *fsys, LocalMapObject *obj, int a2, int a3, int a4, int trainerNum, int encounterType, int idx) {
    ScriptEnvironment *env = TaskManager_GetEnv(fsys->taskman);
    EngagedTrainer *r0 = &env->engagedTrainers[idx];
    r0->unk0 = a2;
    r0->unk4 = a3;
    r0->unk8 = a4;
    r0->trainerNum = trainerNum;
    r0->encounterType = encounterType;
    r0->objectEvent = obj;
}

void QueueScript(TaskManager *taskman, u16 script, LocalMapObject *lastTalked, void *a3) {
    FieldSystem *fsys = TaskManager_GetSys(taskman);
    ScriptEnvironment *env = ScriptEnvironment_new();
    SetupScriptEngine(fsys, env, script, lastTalked, a3);
    TaskManager_Call(taskman, Task_RunScripts, env);
}

void StartScriptFromMenu(TaskManager *taskman, u16 script, LocalMapObject *lastTalked) {
    FieldSystem *fsys = TaskManager_GetSys(taskman);
    ScriptEnvironment *env = ScriptEnvironment_new();
    SetupScriptEngine(fsys, env, script, lastTalked, NULL);
    TaskManager_Jump(taskman, Task_RunScripts, env);
}

BOOL Task_RunScripts(TaskManager *taskman) {
    int i;
    FieldSystem *fsys;
    ScriptEnvironment *env;

    env = TaskManager_GetEnv(taskman);
    fsys = TaskManager_GetSys(taskman);

    switch (env->state) {
    case 0:
        env->scriptContexts[0] = CreateScriptContext(fsys, env->script);
        env->numActiveScrCtx = 1;
        env->msgfmt = ScrStrBufs_new_custom(8, 64, HEAP_ID_FIELDMAP);
        env->strbuf1 = String_ctor(1024, HEAP_ID_FIELDMAP);
        env->strbuf2 = String_ctor(1024, HEAP_ID_FIELDMAP);
        env->state++;
        // fallthrough
    case 1:
        for (i = 0; i < 3; i++) {
            struct SCRIPTCONTEXT *ctx = env->scriptContexts[i];
            if (ctx == NULL) {
                continue;
            }
            if (RunScriptCommand(ctx)) {
                continue;
            }
            DestroyScriptContext(ctx);
            GF_ASSERT(env->numActiveScrCtx != 0);
            env->scriptContexts[i] = NULL;
            env->numActiveScrCtx--;
        }
        if (env->numActiveScrCtx == 0) {
            void (*callback)(FieldSystem *a0) = env->scrctx_end_cb;
            ScrStrBufs_delete(env->msgfmt);
            String_dtor(env->strbuf1);
            String_dtor(env->strbuf2);
            env->check = 0;
            FreeToHeap(env);
            if (callback != NULL) {
                (*callback)(fsys);
                return FALSE;
            } else {
                return TRUE;
            }
        }
    }

    return FALSE;
}

ScriptEnvironment *ScriptEnvironment_new(void) {
    ScriptEnvironment *ret = AllocFromHeap(HEAP_ID_FIELDMAP, sizeof(ScriptEnvironment));
    GF_ASSERT(ret != NULL);
    memset(ret, 0, sizeof(ScriptEnvironment));
    ret->check = Unk80_10_C_MAGIC;
    return ret;
}

void DestroyScriptContext(SCRIPTCONTEXT *ctx) {
    DestroyMsgData(ctx->msg_data);
    FreeToHeap(ctx->mapScripts);
    FreeToHeap(ctx);
}

void SetupScriptEngine(FieldSystem *fsys, ScriptEnvironment *env, u16 script, LocalMapObject *lastTalked, void* a4) {
    u16 *varLastTalked = FieldSysGetAttrAddrInternal(env, SCRIPTENV_SPECIAL_VAR_LAST_TALKED);
    env->facingDirection = PlayerAvatar_GetFacingDirection(fsys->playerAvatar);
    env->lastTalked = lastTalked;
    env->script = script;
    env->unk_34 = a4;
    if (lastTalked != NULL) {
        *varLastTalked = MapObject_GetID(lastTalked);
    }
    if (script >= _std_hidden_item && script <= _std_safari - 1) {
        GetHiddenItemParams(env, script);
    }
}

SCRIPTCONTEXT *CreateScriptContext(FieldSystem *fsys, u16 script) {
    SCRIPTCONTEXT *ctx = AllocFromHeap(HEAP_ID_FIELDMAP, sizeof(SCRIPTCONTEXT));
    GF_ASSERT(ctx != NULL);
    InitScriptContext(ctx, gScriptCmdTable, sNumScriptCmds);
    SetUpScriptContextForMap(fsys, ctx, script, 0);
    return ctx;
}

void SetUpScriptContextForMap(FieldSystem *fsys, SCRIPTCONTEXT *ctx, u16 scriptId, u32 unused_r3) {
#pragma unused(unused_r3)
    u16 r6;

    ctx->fsys = fsys;
    r6 = LoadScriptsAndMessagesByMapId(fsys, ctx, scriptId);
    SetupBytecodeScript(ctx, ctx->mapScripts);
    ScriptRunByIndex(ctx, r6);
    sub_0203FD68(ctx, fsys->taskman);
}

u16 LoadScriptsAndMessagesByMapId(FieldSystem *fsys, SCRIPTCONTEXT *ctx, u16 scriptId) {
    const struct ScriptBankMapping *mapping_p = sScriptBankMapping;
    int i;
    for (i = 0; i < NELEMS(sScriptBankMapping); i++) {
        if (scriptId >= mapping_p[i].scriptIdLo) {
            LoadScriptsAndMessagesParameterized(fsys, ctx, mapping_p[i].scriptBank, mapping_p[i].msgBank);
            return scriptId - mapping_p[i].scriptIdLo;
        }
    }
    if (scriptId >= 1) {
        LoadScriptsAndMessagesForCurrentMap(fsys, ctx);
        return scriptId - 1;
    } else {
        LoadScriptsAndMessagesParameterized(fsys, ctx, NARC_scr_seq_scr_seq_0140_bin, NARC_msg_msg_0184_bin);
        return 0;
    }
}

void LoadScriptsAndMessagesParameterized(FieldSystem *fsys, SCRIPTCONTEXT *ctx, int scriptBank, u32 msgBank) {
    ctx->mapScripts = AllocAndReadWholeNarcMemberByIdPair(NARC_fielddata_script_scr_seq, scriptBank, HEAP_ID_FIELDMAP);
    ctx->msg_data = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, msgBank, HEAP_ID_FIELDMAP);
}

void LoadScriptsAndMessagesForCurrentMap(FieldSystem *fsys, SCRIPTCONTEXT *ctx) {
    ctx->mapScripts = LoadScriptsForCurrentMap(fsys->location->mapId);
    ctx->msg_data = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, GetCurrentMapMessageBank(fsys->location->mapId), HEAP_ID_FIELDMAP);
}

void *FieldSysGetAttrAddrInternal(ScriptEnvironment *unk, enum ScriptEnvField field) {
    switch (field) {
    case SCRIPTENV_MENU_WINDOW:
        return &unk->unk_10;
    case SCRIPTENV_WINDOW:
        return &unk->unk_14;
    case SCRIPTENV_MENU:
        return &unk->listMenu;
    case SCRIPTENV_PRINTER_NUM:
        return &unk->textPrinterNum;
    case SCRIPTENV_NUM_ACTIVE_MOVEMENT:
        return &unk->numActiveMovement;
    case SCRIPTENV_07:
        return &unk->unk_7;
    case SCRIPTENV_08:
        return &unk->unk_8;
    case SCRIPTENV_NUM_ACTIVE_SCRCTX:
        return &unk->numActiveScrCtx;
    case SCRIPTENV_SCRIPT:
        return &unk->script;
    case SCRIPTENV_FACING_DIRECTION:
        return &unk->facingDirection;
    case SCRIPTENV_LAST_TALKED:
        return &unk->lastTalked;
    case SCRIPTENV_CAMERA_FOCUS_OBJ:
        return &unk->cameraFocusObj;
    case SCRIPTENV_34:
        return &unk->unk_34;
    case SCRIPTENV_SCRCTX_0:
    case SCRIPTENV_SCRCTX_1:
    case SCRIPTENV_SCRCTX_2:
        return &unk->scriptContexts[field - SCRIPTENV_SCRCTX_0];
    case SCRIPTENV_MSGFMT:
        return &unk->msgfmt;
    case SCRIPTENV_STRBUF1:
        return &unk->strbuf1;
    case SCRIPTENV_STRBUF2:
        return &unk->strbuf2;
    case SCRIPTENV_WAITING_ICON:
        return &unk->unk_50;
    case SCRIPTENV_AC:
        return &unk->unk_AC;
    case SCRIPTENV_GENERIC_WORK_PTR:
        return &unk->genericWorkPtr;
    case SCRIPTENV_B4:
        return &unk->unk_B4;
    case SCRIPTENV_B8:
        return &unk->unk_B8;
    case SCRIPTENV_0C:
        return &unk->unk_C;
    case SCRIPTENV_54_0_00:
        return &unk->engagedTrainers[0].unk0;
    case SCRIPTENV_54_0_04:
        return &unk->engagedTrainers[0].unk4;
    case SCRIPTENV_54_0_08:
        return &unk->engagedTrainers[0].unk8;
    case SCRIPTENV_EYE_TRAINER_1_NUM:
        return &unk->engagedTrainers[0].trainerNum;
    case SCRIPTENV_EYE_TRAINER_1_ENCTYPE:
        return &unk->engagedTrainers[0].encounterType;
    case SCRIPTENV_EYE_TRAINER_1_OBJPTR:
        return &unk->engagedTrainers[0].objectEvent;
    case SCRIPTENV_54_0_18:
        return &unk->engagedTrainers[0].unk18;
    case SCRIPTENV_54_1_00:
        return &unk->engagedTrainers[1].unk0;
    case SCRIPTENV_54_1_04:
        return &unk->engagedTrainers[1].unk4;
    case SCRIPTENV_54_1_08:
        return &unk->engagedTrainers[1].unk8;
    case SCRIPTENV_EYE_TRAINER_2_NUM:
        return &unk->engagedTrainers[1].trainerNum;
    case SCRIPTENV_EYE_TRAINER_2_ENCTYPE:
        return &unk->engagedTrainers[1].encounterType;
    case SCRIPTENV_EYE_TRAINER_2_OBJPTR:
        return &unk->engagedTrainers[1].objectEvent;
    case SCRIPTENV_54_1_18:
        return &unk->engagedTrainers[1].unk18;
    case SCRIPTENV_BC:
        return &unk->unk_BC;
    case SCRIPTENV_MONEY_BOX:
        return &unk->moneyBox;
    case SCRIPTENV_DC:
        return &unk->unk_DC;
    case SCRIPTENV_SPECIAL_VAR_8000:
    case SCRIPTENV_SPECIAL_VAR_8001:
    case SCRIPTENV_SPECIAL_VAR_8002:
    case SCRIPTENV_SPECIAL_VAR_8003:
    case SCRIPTENV_SPECIAL_VAR_8004:
    case SCRIPTENV_SPECIAL_VAR_8005:
    case SCRIPTENV_SPECIAL_VAR_8006:
    case SCRIPTENV_SPECIAL_VAR_8007:
    case SCRIPTENV_SPECIAL_VAR_8008:
    case SCRIPTENV_SPECIAL_VAR_8009:
    case SCRIPTENV_SPECIAL_VAR_800A:
    case SCRIPTENV_SPECIAL_VAR_800B:
    case SCRIPTENV_SPECIAL_VAR_RESULT:
    case SCRIPTENV_SPECIAL_VAR_LAST_TALKED:
        return &unk->specialVars[field - SCRIPTENV_SPECIAL_VAR_8000];
    default:
        GF_ASSERT(0);
        return NULL;
    }
}

void* FieldSysGetAttrAddr(FieldSystem *fsys, enum ScriptEnvField field) {
    ScriptEnvironment *unk = TaskManager_GetEnv(fsys->taskman);
    GF_ASSERT(unk != NULL);
    GF_ASSERT(unk->check == Unk80_10_C_MAGIC);
    return FieldSysGetAttrAddrInternal(unk, field);
}

void sub_0204031C(FieldSystem *fsys) {
    ScriptEnvironment *unk = TaskManager_GetEnv(fsys->taskman);
    if (sub_0203BC10(fsys) == TRUE) {
        unk->scrctx_end_cb = sub_0203BD64;
    }
}

void ScriptRunByIndex(SCRIPTCONTEXT *ctx, int idx) {
    ctx->script_ptr += 4 * idx;
    ctx->script_ptr += ScriptReadWord(ctx);
}

u8 *LoadScriptsForCurrentMap(u32 mapno) {
    return AllocAndReadWholeNarcMemberByIdPair(NARC_fielddata_script_scr_seq, MapHeader_GetScriptsBank(mapno), HEAP_ID_FIELDMAP);
}

u32 GetCurrentMapMessageBank(u32 mapno) {
    return MapHeader_GetMsgBank(mapno);
}

u16 *GetVarPointer(FieldSystem *fsys, u16 varIdx) {
    SCRIPT_STATE *state = SavArray_Flags_get(fsys->savedata);
    if (varIdx < VAR_BASE) {
        return NULL;
    } else if (varIdx < SPECIAL_VAR_BASE) {
        return GetVarAddr(state, varIdx);
    } else {
        return FieldSysGetAttrAddr(fsys, SCRIPTENV_SPECIAL_VAR_8000 + varIdx - SPECIAL_VAR_BASE);
    }
}

u16 VarGet(FieldSystem *fsys, u16 varIdx) {
    u16 *ptr = GetVarPointer(fsys, varIdx);
    if (ptr != NULL) {
        varIdx = *ptr;
    }
    return varIdx;
}

BOOL VarSet(FieldSystem *fsys, u16 varIdx, u16 value) {
    u16 *ptr = GetVarPointer(fsys, varIdx);
    if (ptr == NULL) {
        return FALSE;
    }
    *ptr = value;
    return TRUE;
}

u16 VarGetObjectEventGraphicsId(FieldSystem *fsys, u16 varobjId) {
    GF_ASSERT(varobjId < NUM_OBJ_GFX_VARS);
    return VarGet(fsys, VAR_OBJ_GFX_BASE + varobjId);
}

BOOL FlagGet(FieldSystem *fsys, u16 flagId) {
    return CheckFlagInArray(SavArray_Flags_get(fsys->savedata), flagId);
}

void FlagSet(FieldSystem *fsys, u16 flagId) {
    return SetFlagInArray(SavArray_Flags_get(fsys->savedata), flagId);
}

void FlagClear(FieldSystem *fsys, u16 flagId) {
    return ClearFlagInArray(SavArray_Flags_get(fsys->savedata), flagId);
}

void ClearTempFieldEventData(FieldSystem *fsys) {
    u8 *flags;
    u16 *vars;

    SCRIPT_STATE *state = SavArray_Flags_get(fsys->savedata);
    flags = GetFlagAddr(state, MAPTEMP_FLAG_BASE);
    memset(flags, 0, NUM_MAPTEMP_FLAGS / 8);
    vars = GetVarAddr(state, TEMP_VAR_BASE);
    memset(vars, 0, NUM_TEMP_VARS * 2);
}

void ClearDailyFlags(FieldSystem *fsys) {
    u8 *flags;

    SCRIPT_STATE *state = SavArray_Flags_get(fsys->savedata);
    flags = GetFlagAddr(state, DAILY_FLAG_BASE);
    memset(flags, 0, NUM_DAILY_FLAGS / 8);
}

void FieldMoveArgsSet(FieldSystem *fsys, u16 v8000, u16 v8001, u16 v8002, u16 v8003) {
    *(u16 *)FieldSysGetAttrAddr(fsys, SCRIPTENV_SPECIAL_VAR_8000) = v8000;
    *(u16 *)FieldSysGetAttrAddr(fsys, SCRIPTENV_SPECIAL_VAR_8001) = v8001;
    *(u16 *)FieldSysGetAttrAddr(fsys, SCRIPTENV_SPECIAL_VAR_8002) = v8002;
    *(u16 *)FieldSysGetAttrAddr(fsys, SCRIPTENV_SPECIAL_VAR_8003) = v8003;
}

u16 ScriptNumToTrainerNum(u16 script) {
    if (script < _std_npc_trainer_2) {
        return script - _std_npc_trainer + FIRST_TRAINER_INDEX;
    } else {
        return script - _std_npc_trainer_2 + FIRST_TRAINER_INDEX;
    }
}

BOOL ScriptNoToDoublePartnerNo(u16 a0) {
    return a0 >= _std_npc_trainer_2;
}

BOOL TrainerNumIsDouble(u32 trainer) {
    return TrainerData_GetAttr(trainer, TRATTR_DOUBLEBTL) != 0;
}

BOOL TrainerFlagCheck(SAVEDATA *saveData, u32 trainer) {
    SCRIPT_STATE *scriptState = SavArray_Flags_get(saveData);
    return CheckFlagInArray(scriptState, trainer + TRAINER_FLAG_BASE);
}

void TrainerFlagSet(SAVEDATA *saveData, u32 trainer) {
    SCRIPT_STATE *scriptState = SavArray_Flags_get(saveData);
    SetFlagInArray(scriptState, trainer + TRAINER_FLAG_BASE);
}

void TrainerFlagClear(SAVEDATA *saveData, u32 trainer) {
    SCRIPT_STATE *scriptState = SavArray_Flags_get(saveData);
    ClearFlagInArray(scriptState, trainer + TRAINER_FLAG_BASE);
}

u16 HiddenItemScriptNoToFlagId(u16 script) {
    return script - _std_hidden_item + HIDDEN_ITEMS_FLAG_BASE;
}

u16 HiddenItemScriptNoToHiddenItemIdx(u16 script) {
    return script - _std_hidden_item;
}

u8 sub_02040578(u16 script) {
    const struct HiddenItemData *table = sHiddenItemParam;
    int i;
    u16 hiddenItemIdx = HiddenItemScriptNoToHiddenItemIdx(script);

    for (i = 0; i < NELEMS(sHiddenItemParam); i++) {
        if (hiddenItemIdx == table[i].index) {
            break;
        }
    }
    if (i >= NELEMS(sHiddenItemParam)) {
        GF_ASSERT(0);
        return 0;
    }

    return table[i].unk3;
}

BOOL GetHiddenItemParams(ScriptEnvironment *env, u16 script) {
    int i;
    u16 idx;
    const struct HiddenItemData *table;
    u16 *var_8000;
    u16 *var_8001;
    u16 *var_8002;

    var_8000 = FieldSysGetAttrAddrInternal(env, SCRIPTENV_SPECIAL_VAR_8000);
    var_8001 = FieldSysGetAttrAddrInternal(env, SCRIPTENV_SPECIAL_VAR_8001);
    var_8002 = FieldSysGetAttrAddrInternal(env, SCRIPTENV_SPECIAL_VAR_8002);
    table = sHiddenItemParam;
    idx = HiddenItemScriptNoToHiddenItemIdx(script);

    for (i = 0; i < NELEMS(sHiddenItemParam); i++) {
        if (idx == table[i].index) {
            break;
        }
    }
    if (i >= NELEMS(sHiddenItemParam)) {
        GF_ASSERT(0);
        return FALSE;
    }

    *var_8000 = table[i].itemId;
    *var_8001 = table[i].quantity;
    *var_8002 = HiddenItemScriptNoToFlagId(script);
    return TRUE;
}

HiddenItemResponse* AllocAndFetchNearbyHiddenItems(FieldSystem *fsys, HeapID heapId) {
    HiddenItemResponse *ret;
    const BG_EVENT *bgEvents;
    int i;
    int num_bgs;
    int j;
    int x;
    int y;
    int left;
    int right;
    int top;
    int bottom;

    j = 0;
    num_bgs = Field_GetNumBgEvents(fsys);
    num_bgs++;
    ret = AllocFromHeap(heapId, num_bgs * sizeof(HiddenItemResponse));
    if (num_bgs == 1) {
        ret[0].unk4 = 0xFF;
        ret[0].x = -1;
        ret[0].y = -1;
        return ret;
    }
    bgEvents = Field_GetBgEvents(fsys);
    if (bgEvents == NULL) {
        ret[0].unk4 = 0xFF;
        ret[0].x = -1;
        ret[0].y = -1;
        return ret;
    }
    x = GetPlayerXCoord(fsys->playerAvatar);
    y = GetPlayerYCoord(fsys->playerAvatar);
    left = x - 17;
    right = x + 17;
    top = y - 17;
    bottom = y + 17;
    if (left < 0) {
        left = 0;
    }
    if (top < 0) {
        top = 0;
    }
    // UB: Out-of-array access
    // To fix, subtract 1 from num_bgs in the condition clause
    for (i = 0; i < num_bgs; i++) {
        if (bgEvents[i].type == 2
        && !FlagGet(fsys, HiddenItemScriptNoToFlagId(bgEvents[i].scr))) {
            if (bgEvents[i].x >= left
               && bgEvents[i].x <= right
               && bgEvents[i].y >= top
               && bgEvents[i].y <= bottom
            ) {
                ret[j].unk4 = sub_02040578(bgEvents[i].scr);
                ret[j].x = bgEvents[i].x - x;
                ret[j].y = bgEvents[i].y - y;
                j++;
            }
        }
    }
    ret[j].unk4 = 0xFF;
    ret[j].x = -1;
    ret[j].y = -1;
    return ret;
}

void RunInitScript(FieldSystem *fsys) {
    StartMapLoadScript(fsys, _std_init);
}

void StartMapLoadScript(FieldSystem *fsys, u16 script) {
    SCRIPTCONTEXT *ctx = CreateScriptContext(fsys, script);
    while (RunScriptCommand(ctx) == TRUE) {}
    DestroyScriptContext(ctx);
}

BOOL TryStartMapScriptByType(FieldSystem *fsys, u8 type) {
    u8 *header;
    u16 script;
    if (fsys->unkAC != 0) {
        return FALSE;
    }
    header = MapEvents_GetScriptHeader(fsys);
    if (header == NULL) {
        return FALSE;
    }
    script = (type == 1) ? GetMapSceneScriptId(fsys, header, type) : GetMapLoadScriptId(header, type);
    if (script == 0xFFFF) {
        return FALSE;
    }
    (type == 1) ? StartMapSceneScript(fsys, script, NULL) : StartMapLoadScript(fsys, script);
    return TRUE;
}

BOOL MapSceneScriptCheck(FieldSystem *fsys) {
    u8 *header;
    u16 script;
    if (fsys->unkAC != 0) {
        return FALSE;
    }
    header = MapEvents_GetScriptHeader(fsys);
    if (header == NULL) {
        return FALSE;
    }
    script = GetMapSceneScriptId(fsys, header, 1);
    return script != 0xFFFF;
}

u16 GetMapLoadScriptId(u8 *header, u8 type) {
    while (1) {
        if (header[0] == 0) {
            return 0xFFFF;
        } else if (header[0] == type) {
            return header[1] + (header[2] << 8);
        } else {
            header += 5;
        }
    }
}

u16 GetMapSceneScriptId(FieldSystem *fsys, u8 *header, u8 type) {
    u32 ofs;
    while (1) {
        if (header[0] == 0) {
            return 0xFFFF;
        } else if (header[0] == type) {
            ofs = header[1] + (header[2] << 8) + (header[3] << 16) + (header[4] << 24);
            header += 5;
            break;
        } else {
            header += 5;
        }
    }
    if (ofs == 0) {
        return 0xFFFF;
    }
    header += ofs;
    while (1) {
        u16 var1;
        u16 var2;
        var1 = header[0] + (header[1] << 8);
        if (var1 == 0) {
            return 0xFFFF;
        }
        var2 = header[2] + (header[3] << 8);
        if (VarGet(fsys, var1) == VarGet(fsys, var2)) {
            return header[4] + (header[5] << 8);
        }
        header += 6;
    }
}
