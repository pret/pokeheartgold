#ifndef POKEHEARTGOLD_SCRIPT_H
#define POKEHEARTGOLD_SCRIPT_H

#include "map_events_internal.h"
#include "msgdata.h"
#include "window.h"
#include "field_player_avatar.h"
#include "gear_phone.h"
#include "save_pokegear.h"
#include "bug_contest_internal.h"
#include "constants/vars.h"
#include "overlay_manager.h"
#include "unk_0200E320.h"
#include "list_menu_2d.h"
#include "unk_0200E398.h"
#include "unk_02022D74.h"
#include "field_system.h"

#define SCRIPT_MODE_STOPPED  0
#define SCRIPT_MODE_BYTECODE 1
#define SCRIPT_MODE_NATIVE   2

#define SCRIPT_COMPARISON_RESULT_LESS    0
#define SCRIPT_COMPARISON_RESULT_EQUAL   1
#define SCRIPT_COMPARISON_RESULT_GREATER 2

#define ScriptReadByte(ctx) *(ctx->script_ptr++)

typedef struct SCRIPTCONTEXT SCRIPTCONTEXT;

#define Unk80_10_C_MAGIC         (222271)

typedef struct EngagedTrainer {
    int unk0;
    int unk4;
    int unk8;
    int trainerNum;
    int encounterType; // 0: single trainer; 1: double-battle trainer; 2: two trainers
    LocalMapObject *objectEvent;
    int unk18;
} EngagedTrainer;

typedef struct _NPC_TRADE_WORK NPC_TRADE_WORK;

typedef struct ScriptEnvironment {
    u32 check;
    u8 state;
    u8 textPrinterNum;
    u8 activeMovementCounter;
    u8 unk_7;
    u8 unk_8;
    u8 activeScriptContextCount;
    u16 activeScriptNumber;
    u32 unk_C;
    u32 unk_10;
    WINDOW unk_14;
    struct ListMenu2D *listMenu2D;
    int facingDirection;
    LocalMapObject *lastInteracted;
    u32 cameraTarget;
    LocalMapObject *unk_34;
    SCRIPTCONTEXT *scriptContexts[3];
    MessageFormat *msgfmt;
    STRING *strbuf1;
    STRING *strbuf2;
    struct WaitingIconManager *unk_50;
    EngagedTrainer engagedTrainers[2];
    u16 specialVars[NUM_SPECIAL_VARS];
    void (*scrctx_end_cb)(FieldSystem *fsys);
    void *unk_AC;
    void *genericWorkPtr;
    void *unk_B4;
    void *unk_B8;
    WINDOW unk_BC;
    WINDOW moneyBox;
    struct SaveStatsPrinter *unk_DC;
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
    SCRIPTENV_MSGFMT                          = 16,
    SCRIPTENV_STRBUF1                         = 17,
    SCRIPTENV_STRBUF2                         = 18,
    SCRIPTENV_WAITING_ICON                    = 19,
    SCRIPTENV_AC                              = 20,
    SCRIPTENV_GENERIC_WORK_PTR                = 21,
    SCRIPTENV_B4                              = 22,
    SCRIPTENV_B8                              = 23,
    SCRIPTENV_0C                              = 24,
    SCRIPTENV_54_0_00                         = 25,
    SCRIPTENV_54_0_04                         = 26,
    SCRIPTENV_54_0_08                         = 27,
    SCRIPTENV_EYE_TRAINER_1_NUM               = 28,
    SCRIPTENV_EYE_TRAINER_1_ENCTYPE           = 29,
    SCRIPTENV_EYE_TRAINER_1_OBJPTR            = 30,
    SCRIPTENV_54_0_18                         = 31,
    SCRIPTENV_54_1_00                         = 32,
    SCRIPTENV_54_1_04                         = 33,
    SCRIPTENV_54_1_08                         = 34,
    SCRIPTENV_EYE_TRAINER_2_NUM               = 35,
    SCRIPTENV_EYE_TRAINER_2_ENCTYPE           = 36,
    SCRIPTENV_EYE_TRAINER_2_OBJPTR            = 37,
    SCRIPTENV_54_1_18                         = 38,
    SCRIPTENV_BC                              = 39,
    SCRIPTENV_MONEY_BOX                       = 40,
    SCRIPTENV_DC                              = 41,
    SCRIPTENV_SPECIAL_VAR_8000                = 42,
    SCRIPTENV_SPECIAL_VAR_8001                = 43,
    SCRIPTENV_SPECIAL_VAR_8002                = 44,
    SCRIPTENV_SPECIAL_VAR_8003                = 45,
    SCRIPTENV_SPECIAL_VAR_8004                = 46,
    SCRIPTENV_SPECIAL_VAR_8005                = 47,
    SCRIPTENV_SPECIAL_VAR_8006                = 48,
    SCRIPTENV_SPECIAL_VAR_8007                = 49,
    SCRIPTENV_SPECIAL_VAR_8008                = 50,
    SCRIPTENV_SPECIAL_VAR_8009                = 51,
    SCRIPTENV_SPECIAL_VAR_800A                = 52,
    SCRIPTENV_SPECIAL_VAR_800B                = 53,
    SCRIPTENV_SPECIAL_VAR_RESULT              = 54,
    SCRIPTENV_SPECIAL_VAR_LAST_TALKED         = 55,
} ScriptEnvField;

struct UnkStruct_020FC5CC {
    u32 unk0_00:4;
    u32 unk0_04:4;
    u32 unk0_08:4;
    u32 unk0_0C:4;
    u32 unk0_10:4;
    u32 unk0_14:4;
    u32 unk0_18:8;
    u8 unk_4;
    u8 unk_5;
    u8 unk_6;
};

struct UnkStruct_02059E1C;
struct UnkStruct_0205AC88;

typedef BOOL (*ScrCmdFunc)(SCRIPTCONTEXT *ctx);

struct SCRIPTCONTEXT {
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
    MSGDATA *msgdata;
    u8 *mapScripts;
    FieldSystem *fsys;
};

void InitScriptContext(SCRIPTCONTEXT *ctx, const ScrCmdFunc *cmd_table, u32 cmd_count);
BOOL SetupBytecodeScript(SCRIPTCONTEXT *ctx, const u8 *ptr);
void SetupNativeScript(SCRIPTCONTEXT *ctx, ScrCmdFunc ptr);
BOOL ScrNative_WaitApplication_DestroyTaskData(SCRIPTCONTEXT *ctx);
void StopScript(SCRIPTCONTEXT *ctx);
void sub_0203FD68(SCRIPTCONTEXT *ctx, TaskManager *unk);
BOOL RunScriptCommand(SCRIPTCONTEXT *ctx);
BOOL ScriptPush(SCRIPTCONTEXT *ctx, const u8 *ptr);
const u8 *ScriptPop(SCRIPTCONTEXT *ctx);
void ScriptJump(SCRIPTCONTEXT *ctx, const u8 *ptr);
void ScriptCall(SCRIPTCONTEXT *ctx, const u8 *ptr);
void ScriptReturn(SCRIPTCONTEXT *ctx);
u16 ScriptReadHalfword(SCRIPTCONTEXT *ctx);
u32 ScriptReadWord(SCRIPTCONTEXT *ctx);

#endif
