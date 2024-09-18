#ifndef POKEHEARTGOLD_SCRIPT_H
#define POKEHEARTGOLD_SCRIPT_H

#include "global.h"

#include "constants/vars.h"

#include "bg_window.h"
#include "bug_contest_internal.h"
#include "camera.h"
#include "field_player_avatar.h"
#include "field_types_def.h"
#include "gear_phone.h"
#include "list_menu_2d.h"
#include "map_events_internal.h"
#include "msgdata.h"
#include "overlay_manager.h"
#include "render_window.h"
#include "save_pokegear.h"
#include "sys_task_api.h"

#define SCRIPT_MODE_STOPPED  0
#define SCRIPT_MODE_BYTECODE 1
#define SCRIPT_MODE_NATIVE   2

#define SCRIPT_COMPARISON_RESULT_LESS    0
#define SCRIPT_COMPARISON_RESULT_EQUAL   1
#define SCRIPT_COMPARISON_RESULT_GREATER 2

#define ScriptReadByte(ctx) *(ctx->script_ptr++)

typedef struct ScriptContext ScriptContext;

#define Unk80_10_C_MAGIC (222271)

typedef struct EngagedTrainer {
    int unk0;
    int unk4;
    int unk8;
    int trainerId;
    int encounterType; // 0: single trainer; 1: double-battle trainer; 2: two trainers
    LocalMapObject *overworldEvent;
    int unk18;
} EngagedTrainer;

typedef struct ScriptEnvironment {
    u32 check;
    u8 state;
    u8 textPrinterNum;
    u8 activeMovementCounter;
    u8 unk_7;
    u8 unk_8;
    u8 activeScriptContextCount;
    u16 activeScriptNumber;
    u32 battleWinFlag;
    u32 unk_10;
    Window unk_14;
    struct ListMenu2D *listMenu2D;
    int facingDirection;
    LocalMapObject *lastInteracted;
    u32 cameraTarget;
    LocalMapObject *unk_34;
    ScriptContext *scriptContexts[3];
    MessageFormat *msgfmt;
    String *stringBuffer0;
    String *stringBuffer1;
    WaitingIcon *waitingIcon;
    EngagedTrainer engagedTrainers[2];
    u16 specialVars[NUM_SPECIAL_VARS];
    void (*scrctx_end_cb)(FieldSystem *fieldSystem);
    void *runningAppData;
    void *miscDataPtr;
    void *unk_B4;
    void *unk_B8; // PlayerMovementState
    Window *pointsBox;
    u8 padding[0xC]; // FIXME: ugly hack
    Window *moneyBox;
    u8 padding2[0xC]; // FIXME: ugly hack 2
    struct SaveStatsPrinter *saveStatsPrinter;
} ScriptEnvironment;

typedef enum ScriptEnvField {
    SCRIPTENV_MENU_WINDOW,
    SCRIPTENV_WINDOW,
    SCRIPTENV_LIST_MENU_2D,
    SCRIPTENV_TEXT_PRINTER_NUMBER,
    SCRIPTENV_ACTIVE_MOVEMENT_COUNTER,
    SCRIPTENV_FIELD_07,
    SCRIPTENV_FIELD_08,
    SCRIPTENV_ACTIVE_SCRIPT_CONTEXT_COUNT,
    SCRIPTENV_ACTIVE_SCRIPT_NUMBER,
    SCRIPTENV_FACING_DIRECTION,
    SCRIPTENV_LAST_INTERACTED,
    SCRIPTENV_CAMERA_TARGET,
    SCRIPTENV_FIELD_34,
    SCRIPTENV_SCRIPT_CONTEXT_0,
    SCRIPTENV_SCRIPT_CONTEXT_1,
    SCRIPTENV_SCRIPT_CONTEXT_2,
    SCRIPTENV_MESSAGE_FORMAT,
    SCRIPTENV_STRING_BUFFER_0,
    SCRIPTENV_STRING_BUFFER_1,
    SCRIPTENV_WAITING_ICON,
    SCRIPTENV_RUNNING_APP_DATA,
    SCRIPTENV_MISC_DATA_PTR,
    SCRIPTENV_FIELD_B4,
    SCRIPTENV_FIELD_B8,
    SCRIPTENV_BATTLE_WIN_FLAG,
    SCRIPTENV_ENGAGED_TRAINER_0_FIELD_00,
    SCRIPTENV_ENGAGED_TRAINER_0_FIELD_04,
    SCRIPTENV_ENGAGED_TRAINER_0_FIELD_08,
    SCRIPTENV_ENGAGED_TRAINER_0_ID,
    SCRIPTENV_ENGAGED_TRAINER_0_ENCOUNTER_TYPE,
    SCRIPTENV_ENGAGED_TRAINER_0_EVENT,
    SCRIPTENV_ENGAGED_TRAINER_0_FIELD_18,
    SCRIPTENV_ENGAGED_TRAINER_1_FIELD_00,
    SCRIPTENV_ENGAGED_TRAINER_1_FIELD_04,
    SCRIPTENV_ENGAGED_TRAINER_1_FIELD_08,
    SCRIPTENV_ENGAGED_TRAINER_1_ID,
    SCRIPTENV_ENGAGED_TRAINER_1_ENCOUNTER_TYPE,
    SCRIPTENV_ENGAGED_TRAINER_1_EVENT,
    SCRIPTENV_ENGAGED_TRAINER_1_FIELD_18,
    SCRIPTENV_POINTS_BOX, // differs from diamond due to athlete points
    SCRIPTENV_MONEY_BOX,
    SCRIPTENV_SAVE_STATS_PRINTER,
    SCRIPTENV_SPECIAL_VAR_8000,
    SCRIPTENV_SPECIAL_VAR_8001,
    SCRIPTENV_SPECIAL_VAR_8002,
    SCRIPTENV_SPECIAL_VAR_8003,
    SCRIPTENV_SPECIAL_VAR_8004,
    SCRIPTENV_SPECIAL_VAR_8005,
    SCRIPTENV_SPECIAL_VAR_8006,
    SCRIPTENV_SPECIAL_VAR_8007,
    SCRIPTENV_SPECIAL_VAR_8008,
    SCRIPTENV_SPECIAL_VAR_8009,
    SCRIPTENV_SPECIAL_VAR_800A,
    SCRIPTENV_SPECIAL_VAR_800B,
    SCRIPTENV_SPECIAL_VAR_RESULT,
    SCRIPTENV_SPECIAL_VAR_LAST_INTERACTED
} ScriptEnvField;

struct UnkStruct_020FC5CC {
    u32 unk0_00 : 4;
    u32 unk0_04 : 4;
    u32 unk0_08 : 4;
    u32 unk0_0C : 4;
    u32 unk0_10 : 4;
    u32 unk0_14 : 4;
    u32 unk0_18 : 8;
    u8 unk_4;
    u8 unk_5;
    u8 unk_6;
};

struct UnkStruct_02059E1C;
struct UnkStruct_0205AC88;

typedef BOOL (*ScrCmdFunc)(ScriptContext *ctx);

struct ScriptContext {
    u8 stackDepth;
    u8 mode;
    u8 comparisonResult;
    u8 id;
    ScrCmdFunc native_ptr;
    const u8 *script_ptr;
    const u8 *stack[20];
    const ScrCmdFunc *cmdTable;
    u32 cmd_count;
    u32 data[4];
    TaskManager *taskman;
    MsgData *msgdata;
    u8 *mapScripts;
    FieldSystem *fieldSystem;
};

void InitScriptContext(ScriptContext *ctx, const ScrCmdFunc *cmd_table, u32 cmd_count);
BOOL SetupBytecodeScript(ScriptContext *ctx, const u8 *ptr);
void SetupNativeScript(ScriptContext *ctx, ScrCmdFunc ptr);
BOOL ScrNative_WaitApplication_DestroyTaskData(ScriptContext *ctx);
void StopScript(ScriptContext *ctx);
void sub_0203FD68(ScriptContext *ctx, TaskManager *unk);
BOOL RunScriptCommand(ScriptContext *ctx);
BOOL ScriptPush(ScriptContext *ctx, const u8 *ptr);
const u8 *ScriptPop(ScriptContext *ctx);
void ScriptJump(ScriptContext *ctx, const u8 *ptr);
void ScriptCall(ScriptContext *ctx, const u8 *ptr);
void ScriptReturn(ScriptContext *ctx);
u16 ScriptReadHalfword(ScriptContext *ctx);
u32 ScriptReadWord(ScriptContext *ctx);

#endif
