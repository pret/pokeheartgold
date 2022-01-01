#ifndef POKEHEARTGOLD_SCRIPT_H
#define POKEHEARTGOLD_SCRIPT_H

#include "save.h"
#include "map_events_internal.h"
#include "map_matrix.h"
#include "msgdata.h"
#include "window.h"
#include "field_player_avatar.h"
#include "gear_phone.h"
#include "constants/vars.h"

#define SCRIPT_MODE_STOPPED  0
#define SCRIPT_MODE_BYTECODE 1
#define SCRIPT_MODE_NATIVE   2

#define SCRIPT_COMPARISON_RESULT_LESS    0
#define SCRIPT_COMPARISON_RESULT_EQUAL   1
#define SCRIPT_COMPARISON_RESULT_GREATER 2

#define ScriptReadByte(ctx) *(ctx->script_ptr++)

typedef struct UnkSavStruct80 UnkSavStruct80;
typedef struct SCRIPTCONTEXT SCRIPTCONTEXT;
typedef struct LocalMapObject LocalMapObject;

#define Unk80_10_C_MAGIC         (222271)

typedef struct UnkSavStruct80_Sub10_SubC_Sub54 {
    int unk0;
    int unk4;
    int unk8;
    int unkC;
    int unk10;
    LocalMapObject *unk14;
    int unk18;
} UnkSavStruct80_Sub10_SubC_Sub54;

typedef struct UnkSavStruct80_Sub10_SubC {
    u32 check;
    u8 unk_4;
    u8 unk_5;
    u8 numActiveMovement;
    u8 unk_7;
    u8 unk_8;
    u8 numActiveScrCtx;
    u16 unk_A;
    u32 unk_C;
    u32 unk_10;
    u32 unk_14;
    u32 unk_18;
    u32 unk_1C;
    u32 unk_20;
    u32 unk_24;
    void* unk_28;
    LocalMapObject* mapObjects;
    u32 unk_30;
    void* unk_34;
    SCRIPTCONTEXT* scriptContexts[3];
    MSGFMT* unk_44;
    STRING* unk_48;
    STRING* unk_4C;
    u32 unk_50;
    UnkSavStruct80_Sub10_SubC_Sub54 unk_54[2];
    u16 specialVars[NUM_SPECIAL_VARS];
    void (*scrctx_end_cb)(UnkSavStruct80* fsys);
    void *unk_AC;
    u32 unk_B0;
    u32 unk_B4;
    u32 unk_B8;
    WINDOW unk_BC;
    WINDOW unk_CC;
    u32 unk_DC;
} UnkSavStruct80_Sub10_SubC;

enum Unk80_10_C_Field {
    UNK80_10_C_10                              =  0,
    UNK80_10_C_14                              =  1,
    UNK80_10_C_24                              =  2,
    UNK80_10_C_05                              =  3,
    UNK80_10_C_NUM_ACTIVE_MOVEMENT             =  4,
    UNK80_10_C_07                              =  5,
    UNK80_10_C_08                              =  6,
    UNK80_10_C_NUM_ACTIVE_SCRCTX               =  7,
    UNK80_10_C_0A                              =  8,
    UNK80_10_C_28                              =  9,
    UNK80_10_C_MAP_OBJECTS                     = 10,
    UNK80_10_C_30                              = 11,
    UNK80_10_C_34                              = 12,
    UNK80_10_C_SCRCTX_0                        = 13,
    UNK80_10_C_SCRCTX_1                        = 14,
    UNK80_10_C_SCRCTX_2                        = 15,
    UNK80_10_C_MSGFMT                          = 16,
    UNK80_10_C_STRBUF1                         = 17,
    UNK80_10_C_STRBUF2                         = 18,
    UNK80_10_C_50                              = 19,
    UNK80_10_C_AC                              = 20,
    UNK80_10_C_B0                              = 21,
    UNK80_10_C_B4                              = 22,
    UNK80_10_C_B8                              = 23,
    UNK80_10_C_0C                              = 24,
    UNK80_10_C_54_0_00                         = 25,
    UNK80_10_C_54_0_04                         = 26,
    UNK80_10_C_54_0_08                         = 27,
    UNK80_10_C_54_0_0C                         = 28,
    UNK80_10_C_54_0_10                         = 29,
    UNK80_10_C_54_0_14                         = 30,
    UNK80_10_C_54_0_18                         = 31,
    UNK80_10_C_54_1_00                         = 32,
    UNK80_10_C_54_1_04                         = 33,
    UNK80_10_C_54_1_08                         = 34,
    UNK80_10_C_54_1_0C                         = 35,
    UNK80_10_C_54_1_10                         = 36,
    UNK80_10_C_54_1_14                         = 37,
    UNK80_10_C_54_1_18                         = 38,
    UNK80_10_C_BC                              = 39,
    UNK80_10_C_CC                              = 40,
    UNK80_10_C_DC                              = 41,
    UNK80_10_C_SPECIAL_VAR_8000                = 42,
    UNK80_10_C_SPECIAL_VAR_8001                = 43,
    UNK80_10_C_SPECIAL_VAR_8002                = 44,
    UNK80_10_C_SPECIAL_VAR_8003                = 45,
    UNK80_10_C_SPECIAL_VAR_8004                = 46,
    UNK80_10_C_SPECIAL_VAR_8005                = 47,
    UNK80_10_C_SPECIAL_VAR_8006                = 48,
    UNK80_10_C_SPECIAL_VAR_8007                = 49,
    UNK80_10_C_SPECIAL_VAR_8008                = 50,
    UNK80_10_C_SPECIAL_VAR_8009                = 51,
    UNK80_10_C_SPECIAL_VAR_800A                = 52,
    UNK80_10_C_SPECIAL_VAR_800B                = 53,
    UNK80_10_C_SPECIAL_VAR_800C                = 54,
    UNK80_10_C_SPECIAL_VAR_800D                = 55,
};

typedef struct UnkSavStruct80_Sub10 {
    u32 unk0;
    u32 unk4;
    u32 unk8;
    void *unkC; // maybe a union? sometimes cast to UnkSavStruct80_Sub10_SubC
    u32 unk10;
    u32 unk14;
    u32 unk18;
    void *unk1C; // size=4
} UnkSavStruct80_Sub10;

typedef struct UnkSavStruct80_Sub20 {
    int unk0;
} UnkSavStruct80_Sub20;

struct UnkSavStruct80 {
    u8 unk0[0x8];
    void* bg_config;
    SAVEDATA* savedata;
    UnkSavStruct80_Sub10* unk10;
    MAP_EVENTS* map_events;
    u8 unk18[0x8];
    UnkSavStruct80_Sub20* unk20;
    u8 unk24[0xC];
    MAPMATRIX* map_matrix;
    u8 unk34[0x8];
    LocalMapObject* unk3C;
    FIELD_PLAYER_AVATAR *unk40;
    u8 unk44[0x68];
    u32 unkAC;
    u8 unkB0[0x44];
    struct UnkFsysSub_114* unk114;
    u8 unk118[0x10];
}; // size: 0x128

typedef struct SCRIPTCONTEXT SCRIPTCONTEXT;
typedef BOOL (*ScrCmdFunc)(SCRIPTCONTEXT* ctx);

struct SCRIPTCONTEXT {
    u8 stack_depth;
    u8 mode;
    u8 comparison_result;
    u8 unk3;
    ScrCmdFunc native_ptr;
    const u8* script_ptr;
    const u8* stack[20];
    const ScrCmdFunc* cmd_table;
    u32 cmd_count;
    u32 data[4];
    UnkSavStruct80_Sub10* unk74;
    MSGDATA* msg_data;
    u8* mapScripts;
    UnkSavStruct80* unk80;
};

void InitScriptContext(SCRIPTCONTEXT* ctx, const ScrCmdFunc* cmd_table, u32 cmd_count);
BOOL SetupBytecodeScript(SCRIPTCONTEXT* ctx, const u8* ptr);
void SetupNativeScript(SCRIPTCONTEXT* ctx, ScrCmdFunc ptr);
void StopScript(SCRIPTCONTEXT* ctx);
void sub_0203FD68(SCRIPTCONTEXT* ctx, UnkSavStruct80_Sub10 *unk);
BOOL RunScriptCommand(SCRIPTCONTEXT* ctx);
BOOL ScriptPush(SCRIPTCONTEXT* ctx, const u8* ptr);
const u8* ScriptPop(SCRIPTCONTEXT* ctx);
void ScriptJump(SCRIPTCONTEXT* ctx, const u8* ptr);
void ScriptCall(SCRIPTCONTEXT* ctx, const u8* ptr);
void ScriptReturn(SCRIPTCONTEXT* ctx);
u16 ScriptReadHalfword(SCRIPTCONTEXT* ctx);
u32 ScriptReadWord(SCRIPTCONTEXT* ctx);

#endif
