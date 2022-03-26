#ifndef POKEHEARTGOLD_SCRIPT_H
#define POKEHEARTGOLD_SCRIPT_H

#include "save.h"
#include "map_events_internal.h"
#include "map_matrix.h"
#include "msgdata.h"
#include "window.h"
#include "field_player_avatar.h"
#include "gear_phone.h"
#include "bug_contest_internal.h"
#include "constants/vars.h"
#include "overlay_manager.h"

#define SCRIPT_MODE_STOPPED  0
#define SCRIPT_MODE_BYTECODE 1
#define SCRIPT_MODE_NATIVE   2

#define SCRIPT_COMPARISON_RESULT_LESS    0
#define SCRIPT_COMPARISON_RESULT_EQUAL   1
#define SCRIPT_COMPARISON_RESULT_GREATER 2

#define ScriptReadByte(ctx) *(ctx->script_ptr++)

typedef struct FieldSystem FieldSystem;
typedef struct SCRIPTCONTEXT SCRIPTCONTEXT;
typedef struct LocalMapObject LocalMapObject;

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
    u8 unk_5;
    u8 numActiveMovement;
    u8 unk_7;
    u8 unk_8;
    u8 numActiveScrCtx;
    u16 script;
    u32 unk_C;
    u32 unk_10;
    u32 unk_14;
    u32 unk_18;
    u32 unk_1C;
    u32 unk_20;
    u32 unk_24;
    int facingDirection;
    LocalMapObject* lastTalked;
    u32 unk_30;
    void* unk_34;
    SCRIPTCONTEXT* scriptContexts[3];
    MSGFMT* msgfmt;
    STRING* strbuf1;
    STRING* strbuf2;
    u32 unk_50;
    EngagedTrainer engagedTrainers[2];
    u16 specialVars[NUM_SPECIAL_VARS];
    void (*scrctx_end_cb)(FieldSystem* fsys);
    void *unk_AC;
    void *genericWorkPtr;
    void *unk_B4;
    void *unk_B8;
    WINDOW unk_BC;
    WINDOW unk_CC;
    void *unk_DC;
} ScriptEnvironment;

enum ScriptEnvField {
    SCRIPTENV_10                              =  0,
    SCRIPTENV_14                              =  1,
    SCRIPTENV_24                              =  2,
    SCRIPTENV_05                              =  3,
    SCRIPTENV_NUM_ACTIVE_MOVEMENT             =  4,
    SCRIPTENV_07                              =  5,
    SCRIPTENV_08                              =  6,
    SCRIPTENV_NUM_ACTIVE_SCRCTX               =  7,
    SCRIPTENV_SCRIPT                          =  8,
    SCRIPTENV_FACING_DIRECTION                =  9,
    SCRIPTENV_LAST_TALKED                     = 10,
    SCRIPTENV_30                              = 11,
    SCRIPTENV_34                              = 12,
    SCRIPTENV_SCRCTX_0                        = 13,
    SCRIPTENV_SCRCTX_1                        = 14,
    SCRIPTENV_SCRCTX_2                        = 15,
    SCRIPTENV_MSGFMT                          = 16,
    SCRIPTENV_STRBUF1                         = 17,
    SCRIPTENV_STRBUF2                         = 18,
    SCRIPTENV_50                              = 19,
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
    SCRIPTENV_CC                              = 40,
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
};

typedef struct TaskManager TaskManager;

typedef struct Location {
    int mapId;
    int warpId;
    int x;
    int z;
    int direction;
} Location;

typedef struct FollowMon {
    LocalMapObject *mapObject;
    u32 unk4;
    u32 unk8;
    u32 unkC;
    u32 species;
    u8 gender;
    u8 unk15;
    u8 active;
    u8 shiny;
    u16 forme;
    u16 dummy;
    u32 unk1C;
} FollowMon;

struct FieldSystemUnk108 {
    u32 personality;
    u16 species;
    u16 isRegistered;
    POKEMON *pokemon;
};

typedef struct MapObjectMan MapObjectMan;

struct FieldSystemUnkSub0 {
    OVY_MANAGER *unk0;
    OVY_MANAGER *unk4;
    BOOL unk8;
    BOOL unkC;
};

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

struct FieldSystem {
    struct FieldSystemUnkSub0 *unk0;
    void *unk4;
    BGCONFIG* bg_config;
    SAVEDATA* savedata;
    TaskManager* taskman;
    MAP_EVENTS* map_events;
    int unk18;
    int unk1C;
    Location* location;
    u8 filler24[0xC];
    MAPMATRIX* map_matrix;
    u8 filler34[0x8];
    MapObjectMan* mapObjectMan;
    FIELD_PLAYER_AVATAR *playerAvatar;
    u8 filler44[0x1C];
    u32 unk60;
    int unk64;
    int unk68;
    u32 unk6C;
    int unk70;
    const struct UnkStruct_020FC5CC *unk74;
    u16 unk78;
    u16 unk7A;
    u16 unk7C;
    u16 unk7E;
    struct UnkStruct_02059E1C *unk80;
    struct UnkStruct_0205AC88 *unk84;
    u8 filler_88[0x24];
    u32 unkAC;
    u8 unkB0[0x4];
    s64 unkB4;
    u8 unkBC[8];
    int unkC4;
    u8 filler_C8[0xA];
    u8 unkD2_0:6;
    u8 unkD2_6:1;
    u8 unkD2_7:1;
    u8 filler_D3[0x11];
    FollowMon followMon; // A4
    u8 unk104[4];
    struct FieldSystemUnk108 *unk108;
    u32 unk_10C[2];
    struct UnkFsysSub_114* unk114;
    BUGCONTEST* bugContest;
    u8 unk11C[0xC];
}; // size: 0x128

typedef struct SCRIPTCONTEXT SCRIPTCONTEXT;
typedef BOOL (*ScrCmdFunc)(SCRIPTCONTEXT* ctx);

struct SCRIPTCONTEXT {
    u8 stack_depth;
    u8 mode;
    u8 comparison_result;
    u8 id;
    ScrCmdFunc native_ptr;
    const u8* script_ptr;
    const u8* stack[20];
    const ScrCmdFunc* cmd_table;
    u32 cmd_count;
    u32 data[4];
    TaskManager* taskman;
    MSGDATA* msg_data;
    u8* mapScripts;
    FieldSystem* fsys;
};

void InitScriptContext(SCRIPTCONTEXT* ctx, const ScrCmdFunc* cmd_table, u32 cmd_count);
BOOL SetupBytecodeScript(SCRIPTCONTEXT* ctx, const u8* ptr);
void SetupNativeScript(SCRIPTCONTEXT* ctx, ScrCmdFunc ptr);
void StopScript(SCRIPTCONTEXT* ctx);
void sub_0203FD68(SCRIPTCONTEXT* ctx, TaskManager *unk);
BOOL RunScriptCommand(SCRIPTCONTEXT* ctx);
BOOL ScriptPush(SCRIPTCONTEXT* ctx, const u8* ptr);
const u8* ScriptPop(SCRIPTCONTEXT* ctx);
void ScriptJump(SCRIPTCONTEXT* ctx, const u8* ptr);
void ScriptCall(SCRIPTCONTEXT* ctx, const u8* ptr);
void ScriptReturn(SCRIPTCONTEXT* ctx);
u16 ScriptReadHalfword(SCRIPTCONTEXT* ctx);
u32 ScriptReadWord(SCRIPTCONTEXT* ctx);

#endif
