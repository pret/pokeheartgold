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

void StartMapSceneScript(FieldSystem *fieldSystem, u16 script, LocalMapObject *lastInteracted) {
    ScriptEnvironment *r4 = ScriptEnvironment_New();
    SetupScriptEngine(fieldSystem, r4, script, lastInteracted, NULL);
    FieldSystem_CreateTask(fieldSystem, Task_RunScripts, r4);
}

void FieldSystem_SetEngagedTrainer(FieldSystem *fieldSystem, LocalMapObject *obj, int a2, int a3, int a4, int trainerId, int encounterType, int idx) {
    ScriptEnvironment *env = TaskManager_GetEnv(fieldSystem->taskman);
    EngagedTrainer *r0 = &env->engagedTrainers[idx];
    r0->unk0 = a2;
    r0->unk4 = a3;
    r0->unk8 = a4;
    r0->trainerId = trainerId;
    r0->encounterType = encounterType;
    r0->overworldEvent = obj;
}

void QueueScript(TaskManager *taskman, u16 script, LocalMapObject *lastInteracted, void *a3) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskman);
    ScriptEnvironment *env = ScriptEnvironment_New();
    SetupScriptEngine(fieldSystem, env, script, lastInteracted, a3);
    TaskManager_Call(taskman, Task_RunScripts, env);
}

void StartScriptFromMenu(TaskManager *taskman, u16 script, LocalMapObject *lastInteracted) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskman);
    ScriptEnvironment *env = ScriptEnvironment_New();
    SetupScriptEngine(fieldSystem, env, script, lastInteracted, NULL);
    TaskManager_Jump(taskman, Task_RunScripts, env);
}

BOOL Task_RunScripts(TaskManager *taskman) {
    int i;
    FieldSystem *fieldSystem;
    ScriptEnvironment *env;

    env = TaskManager_GetEnv(taskman);
    fieldSystem = TaskManager_GetFieldSystem(taskman);

    switch (env->state) {
    case 0:
        env->scriptContexts[0] = CreateScriptContext(fieldSystem, env->activeScriptNumber);
        env->activeScriptContextCount = 1;
        env->msgfmt = MessageFormat_New_Custom(8, 64, HEAP_ID_FIELD);
        env->stringBuffer0 = String_New(1024, HEAP_ID_FIELD);
        env->stringBuffer1 = String_New(1024, HEAP_ID_FIELD);
        env->state++;
        // fallthrough
    case 1:
        for (i = 0; i < 3; i++) {
            struct ScriptContext *ctx = env->scriptContexts[i];
            if (ctx == NULL) {
                continue;
            }
            if (RunScriptCommand(ctx)) {
                continue;
            }
            DestroyScriptContext(ctx);
            GF_ASSERT(env->activeScriptContextCount != 0);
            env->scriptContexts[i] = NULL;
            env->activeScriptContextCount--;
        }
        if (env->activeScriptContextCount == 0) {
            void (*callback)(FieldSystem *a0) = env->scrctx_end_cb;
            MessageFormat_Delete(env->msgfmt);
            String_Delete(env->stringBuffer0);
            String_Delete(env->stringBuffer1);
            env->check = 0;
            FreeToHeap(env);
            if (callback != NULL) {
                (*callback)(fieldSystem);
                return FALSE;
            } else {
                return TRUE;
            }
        }
    }

    return FALSE;
}

ScriptEnvironment *ScriptEnvironment_New(void) {
    ScriptEnvironment *ret = AllocFromHeap(HEAP_ID_FIELD, sizeof(ScriptEnvironment));
    GF_ASSERT(ret != NULL);
    memset(ret, 0, sizeof(ScriptEnvironment));
    ret->check = Unk80_10_C_MAGIC;
    return ret;
}

void DestroyScriptContext(ScriptContext *ctx) {
    DestroyMsgData(ctx->msgdata);
    FreeToHeap(ctx->mapScripts);
    FreeToHeap(ctx);
}

void SetupScriptEngine(FieldSystem *fieldSystem, ScriptEnvironment *env, u16 script, LocalMapObject *lastInteracted, void* a4) {
    u16 *varLastInteracted = FieldSysGetAttrAddrInternal(env, SCRIPTENV_SPECIAL_VAR_LAST_INTERACTED);
    env->facingDirection = PlayerAvatar_GetFacingDirection(fieldSystem->playerAvatar);
    env->lastInteracted = lastInteracted;
    env->activeScriptNumber = script;
    env->unk_34 = a4;
    if (lastInteracted != NULL) {
        *varLastInteracted = MapObject_GetID(lastInteracted);
    }
    if (script >= _std_hidden_item && script <= _std_safari - 1) {
        GetHiddenItemParams(env, script);
    }
}

ScriptContext *CreateScriptContext(FieldSystem *fieldSystem, u16 script) {
    ScriptContext *ctx = AllocFromHeap(HEAP_ID_FIELD, sizeof(ScriptContext));
    GF_ASSERT(ctx != NULL);
    InitScriptContext(ctx, gScriptCmdTable, sNumScriptCmds);
    SetUpScriptContextForMap(fieldSystem, ctx, script, 0);
    return ctx;
}

void SetUpScriptContextForMap(FieldSystem *fieldSystem, ScriptContext *ctx, u16 scriptId, u32 unused_r3) {
#pragma unused(unused_r3)
    u16 r6;

    ctx->fieldSystem = fieldSystem;
    r6 = LoadScriptsAndMessagesByMapId(fieldSystem, ctx, scriptId);
    SetupBytecodeScript(ctx, ctx->mapScripts);
    ScriptRunByIndex(ctx, r6);
    sub_0203FD68(ctx, fieldSystem->taskman);
}

u16 LoadScriptsAndMessagesByMapId(FieldSystem *fieldSystem, ScriptContext *ctx, u16 scriptId) {
    const struct ScriptBankMapping *mapping_p = sScriptBankMapping;
    int i;
    for (i = 0; i < NELEMS(sScriptBankMapping); i++) {
        if (scriptId >= mapping_p[i].scriptIdLo) {
            LoadScriptsAndMessagesParameterized(fieldSystem, ctx, mapping_p[i].scriptBank, mapping_p[i].msgBank);
            return scriptId - mapping_p[i].scriptIdLo;
        }
    }
    if (scriptId >= 1) {
        LoadScriptsAndMessagesForCurrentMap(fieldSystem, ctx);
        return scriptId - 1;
    } else {
        LoadScriptsAndMessagesParameterized(fieldSystem, ctx, NARC_scr_seq_scr_seq_0140_bin, NARC_msg_msg_0184_bin);
        return 0;
    }
}

void LoadScriptsAndMessagesParameterized(FieldSystem *fieldSystem, ScriptContext *ctx, int scriptBank, u32 msgBank) {
    ctx->mapScripts = AllocAndReadWholeNarcMemberByIdPair(NARC_fielddata_script_scr_seq, scriptBank, HEAP_ID_FIELD);
    ctx->msgdata = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, msgBank, HEAP_ID_FIELD);
}

void LoadScriptsAndMessagesForCurrentMap(FieldSystem *fieldSystem, ScriptContext *ctx) {
    ctx->mapScripts = LoadScriptsForCurrentMap(fieldSystem->location->mapId);
    ctx->msgdata = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, GetCurrentMapMessageBank(fieldSystem->location->mapId), HEAP_ID_FIELD);
}

void *FieldSysGetAttrAddrInternal(ScriptEnvironment *environment, enum ScriptEnvField field) {
    switch (field) {
    case SCRIPTENV_MENU_WINDOW:
        return &environment->unk_10;
    case SCRIPTENV_WINDOW:
        return &environment->unk_14;
    case SCRIPTENV_LIST_MENU_2D:
        return &environment->listMenu2D;
    case SCRIPTENV_TEXT_PRINTER_NUMBER:
        return &environment->textPrinterNum;
    case SCRIPTENV_ACTIVE_MOVEMENT_COUNTER:
        return &environment->activeMovementCounter;
    case SCRIPTENV_FIELD_07:
        return &environment->unk_7;
    case SCRIPTENV_FIELD_08:
        return &environment->unk_8;
    case SCRIPTENV_ACTIVE_SCRIPT_CONTEXT_COUNT:
        return &environment->activeScriptContextCount;
    case SCRIPTENV_ACTIVE_SCRIPT_NUMBER:
        return &environment->activeScriptNumber;
    case SCRIPTENV_FACING_DIRECTION:
        return &environment->facingDirection;
    case SCRIPTENV_LAST_INTERACTED:
        return &environment->lastInteracted;
    case SCRIPTENV_CAMERA_TARGET:
        return &environment->cameraTarget;
    case SCRIPTENV_FIELD_34:
        return &environment->unk_34;
    case SCRIPTENV_SCRIPT_CONTEXT_0:
    case SCRIPTENV_SCRIPT_CONTEXT_1:
    case SCRIPTENV_SCRIPT_CONTEXT_2:
        return &environment->scriptContexts[field - SCRIPTENV_SCRIPT_CONTEXT_0];
    case SCRIPTENV_MESSAGE_FORMAT:
        return &environment->msgfmt;
    case SCRIPTENV_STRING_BUFFER_0:
        return &environment->stringBuffer0;
    case SCRIPTENV_STRING_BUFFER_1:
        return &environment->stringBuffer1;
    case SCRIPTENV_WAITING_ICON:
        return &environment->waitingIcon;
    case SCRIPTENV_RUNNING_APP_DATA:
        return &environment->runningAppData;
    case SCRIPTENV_MISC_DATA_PTR:
        return &environment->miscDataPtr;
    case SCRIPTENV_FIELD_B4:
        return &environment->unk_B4;
    case SCRIPTENV_FIELD_B8:
        return &environment->unk_B8;
    case SCRIPTENV_BATTLE_WIN_FLAG:
        return &environment->battleWinFlag;
    case SCRIPTENV_ENGAGED_TRAINER_0_FIELD_00:
        return &environment->engagedTrainers[0].unk0;
    case SCRIPTENV_ENGAGED_TRAINER_0_FIELD_04:
        return &environment->engagedTrainers[0].unk4;
    case SCRIPTENV_ENGAGED_TRAINER_0_FIELD_08:
        return &environment->engagedTrainers[0].unk8;
    case SCRIPTENV_ENGAGED_TRAINER_0_ID:
        return &environment->engagedTrainers[0].trainerId;
    case SCRIPTENV_ENGAGED_TRAINER_0_ENCOUNTER_TYPE:
        return &environment->engagedTrainers[0].encounterType;
    case SCRIPTENV_ENGAGED_TRAINER_0_EVENT:
        return &environment->engagedTrainers[0].overworldEvent;
    case SCRIPTENV_ENGAGED_TRAINER_0_FIELD_18:
        return &environment->engagedTrainers[0].unk18;
    case SCRIPTENV_ENGAGED_TRAINER_1_FIELD_00:
        return &environment->engagedTrainers[1].unk0;
    case SCRIPTENV_ENGAGED_TRAINER_1_FIELD_04:
        return &environment->engagedTrainers[1].unk4;
    case SCRIPTENV_ENGAGED_TRAINER_1_FIELD_08:
        return &environment->engagedTrainers[1].unk8;
    case SCRIPTENV_ENGAGED_TRAINER_1_ID:
        return &environment->engagedTrainers[1].trainerId;
    case SCRIPTENV_ENGAGED_TRAINER_1_ENCOUNTER_TYPE:
        return &environment->engagedTrainers[1].encounterType;
    case SCRIPTENV_ENGAGED_TRAINER_1_EVENT:
        return &environment->engagedTrainers[1].overworldEvent;
    case SCRIPTENV_ENGAGED_TRAINER_1_FIELD_18:
        return &environment->engagedTrainers[1].unk18;
    case SCRIPTENV_POINTS_BOX:
        return &environment->pointsBox;
    case SCRIPTENV_MONEY_BOX:
        return &environment->moneyBox;
    case SCRIPTENV_SAVE_STATS_PRINTER:
        return &environment->saveStatsPrinter;
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
    case SCRIPTENV_SPECIAL_VAR_LAST_INTERACTED:
        return &environment->specialVars[field - SCRIPTENV_SPECIAL_VAR_8000];
    default:
        GF_ASSERT(FALSE);
        return NULL;
    }
}

void* FieldSysGetAttrAddr(FieldSystem *fieldSystem, enum ScriptEnvField field) {
    ScriptEnvironment *unk = TaskManager_GetEnv(fieldSystem->taskman);
    GF_ASSERT(unk != NULL);
    GF_ASSERT(unk->check == Unk80_10_C_MAGIC);
    return FieldSysGetAttrAddrInternal(unk, field);
}

void sub_0204031C(FieldSystem *fieldSystem) {
    ScriptEnvironment *unk = TaskManager_GetEnv(fieldSystem->taskman);
    if (sub_0203BC10(fieldSystem) == TRUE) {
        unk->scrctx_end_cb = sub_0203BD64;
    }
}

void ScriptRunByIndex(ScriptContext *ctx, int idx) {
    ctx->script_ptr += 4 * idx;
    ctx->script_ptr += ScriptReadWord(ctx);
}

u8 *LoadScriptsForCurrentMap(u32 mapno) {
    return AllocAndReadWholeNarcMemberByIdPair(NARC_fielddata_script_scr_seq, MapHeader_GetScriptsBank(mapno), HEAP_ID_FIELD);
}

u32 GetCurrentMapMessageBank(u32 mapno) {
    return MapHeader_GetMsgBank(mapno);
}

u16 *GetVarPointer(FieldSystem *fieldSystem, u16 varIdx) {
    SaveVarsFlags *state = Save_VarsFlags_Get(fieldSystem->saveData);
    if (varIdx < VAR_BASE) {
        return NULL;
    } else if (varIdx < SPECIAL_VAR_BASE) {
        return GetVarAddr(state, varIdx);
    } else {
        return FieldSysGetAttrAddr(fieldSystem, (enum ScriptEnvField)(SCRIPTENV_SPECIAL_VAR_8000 + varIdx - SPECIAL_VAR_BASE));
    }
}

u16 VarGet(FieldSystem *fieldSystem, u16 varIdx) {
    u16 *ptr = GetVarPointer(fieldSystem, varIdx);
    if (ptr != NULL) {
        varIdx = *ptr;
    }
    return varIdx;
}

BOOL VarSet(FieldSystem *fieldSystem, u16 varIdx, u16 value) {
    u16 *ptr = GetVarPointer(fieldSystem, varIdx);
    if (ptr == NULL) {
        return FALSE;
    }
    *ptr = value;
    return TRUE;
}

u16 VarGetObjectEventGraphicsId(FieldSystem *fieldSystem, u16 varobjId) {
    GF_ASSERT(varobjId < NUM_OBJ_GFX_VARS);
    return VarGet(fieldSystem, VAR_OBJ_GFX_BASE + varobjId);
}

BOOL FlagGet(FieldSystem *fieldSystem, u16 flagId) {
    return CheckFlagInArray(Save_VarsFlags_Get(fieldSystem->saveData), flagId);
}

void FlagSet(FieldSystem *fieldSystem, u16 flagId) {
    return SetFlagInArray(Save_VarsFlags_Get(fieldSystem->saveData), flagId);
}

void FlagClear(FieldSystem *fieldSystem, u16 flagId) {
    return ClearFlagInArray(Save_VarsFlags_Get(fieldSystem->saveData), flagId);
}

void ClearTempFieldEventData(FieldSystem *fieldSystem) {
    u8 *flags;
    u16 *vars;

    SaveVarsFlags *state = Save_VarsFlags_Get(fieldSystem->saveData);
    flags = GetFlagAddr(state, MAPTEMP_FLAG_BASE);
    memset(flags, 0, NUM_MAPTEMP_FLAGS / 8);
    vars = GetVarAddr(state, TEMP_VAR_BASE);
    memset(vars, 0, NUM_TEMP_VARS * 2);
}

void ClearDailyFlags(FieldSystem *fieldSystem) {
    u8 *flags;

    SaveVarsFlags *state = Save_VarsFlags_Get(fieldSystem->saveData);
    flags = GetFlagAddr(state, DAILY_FLAG_BASE);
    memset(flags, 0, NUM_DAILY_FLAGS / 8);
}

void FieldMoveArgsSet(FieldSystem *fieldSystem, u16 v8000, u16 v8001, u16 v8002, u16 v8003) {
    *(u16 *)FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_SPECIAL_VAR_8000) = v8000;
    *(u16 *)FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_SPECIAL_VAR_8001) = v8001;
    *(u16 *)FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_SPECIAL_VAR_8002) = v8002;
    *(u16 *)FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_SPECIAL_VAR_8003) = v8003;
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

BOOL TrainerFlagCheck(SaveData *saveData, u32 trainer) {
    SaveVarsFlags *varsFlags = Save_VarsFlags_Get(saveData);
    return CheckFlagInArray(varsFlags, trainer + TRAINER_FLAG_BASE);
}

void TrainerFlagSet(SaveData *saveData, u32 trainer) {
    SaveVarsFlags *varsFlags = Save_VarsFlags_Get(saveData);
    SetFlagInArray(varsFlags, trainer + TRAINER_FLAG_BASE);
}

void TrainerFlagClear(SaveData *saveData, u32 trainer) {
    SaveVarsFlags *varsFlags = Save_VarsFlags_Get(saveData);
    ClearFlagInArray(varsFlags, trainer + TRAINER_FLAG_BASE);
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

HiddenItemResponse* AllocAndFetchNearbyHiddenItems(FieldSystem *fieldSystem, HeapID heapId) {
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
    num_bgs = Field_GetNumBgEvents(fieldSystem);
    num_bgs++;
    ret = AllocFromHeap(heapId, num_bgs * sizeof(HiddenItemResponse));
    if (num_bgs == 1) {
        ret[0].unk4 = 0xFF;
        ret[0].x = -1;
        ret[0].y = -1;
        return ret;
    }
    bgEvents = Field_GetBgEvents(fieldSystem);
    if (bgEvents == NULL) {
        ret[0].unk4 = 0xFF;
        ret[0].x = -1;
        ret[0].y = -1;
        return ret;
    }
    x = GetPlayerXCoord(fieldSystem->playerAvatar);
    y = GetPlayerYCoord(fieldSystem->playerAvatar);
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
        && !FlagGet(fieldSystem, HiddenItemScriptNoToFlagId(bgEvents[i].scr))) {
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

void RunInitScript(FieldSystem *fieldSystem) {
    StartMapLoadScript(fieldSystem, _std_init);
}

void StartMapLoadScript(FieldSystem *fieldSystem, u16 script) {
    ScriptContext *ctx = CreateScriptContext(fieldSystem, script);
    while (RunScriptCommand(ctx) == TRUE) {}
    DestroyScriptContext(ctx);
}

BOOL TryStartMapScriptByType(FieldSystem *fieldSystem, u8 type) {
    u8 *header;
    u16 script;
    if (fieldSystem->unkAC != 0) {
        return FALSE;
    }
    header = MapEvents_GetScriptHeader(fieldSystem);
    if (header == NULL) {
        return FALSE;
    }
    script = (type == 1) ? GetMapSceneScriptId(fieldSystem, header, type) : GetMapLoadScriptId(header, type);
    if (script == 0xFFFF) {
        return FALSE;
    }
    (type == 1) ? StartMapSceneScript(fieldSystem, script, NULL) : StartMapLoadScript(fieldSystem, script);
    return TRUE;
}

BOOL MapSceneScriptCheck(FieldSystem *fieldSystem) {
    u8 *header;
    u16 script;
    if (fieldSystem->unkAC != 0) {
        return FALSE;
    }
    header = MapEvents_GetScriptHeader(fieldSystem);
    if (header == NULL) {
        return FALSE;
    }
    script = GetMapSceneScriptId(fieldSystem, header, 1);
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

u16 GetMapSceneScriptId(FieldSystem *fieldSystem, u8 *header, u8 type) {
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
        if (VarGet(fieldSystem, var1) == VarGet(fieldSystem, var2)) {
            return header[4] + (header[5] << 8);
        }
        header += 6;
    }
}
