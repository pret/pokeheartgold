#ifndef POKEHEARTGOLD_SCRIPT_H
#define POKEHEARTGOLD_SCRIPT_H

#include "save.h"
#include "map_events_internal.h"
// #include "map_matrix.h"
typedef struct MAPMATRIX MAPMATRIX;

#define SCRIPT_MODE_STOPPED  0
#define SCRIPT_MODE_BYTECODE 1
#define SCRIPT_MODE_NATIVE   2

#define SCRIPT_COMPARISON_RESULT_LESS    0
#define SCRIPT_COMPARISON_RESULT_EQUAL   1
#define SCRIPT_COMPARISON_RESULT_GREATER 2

#define ScriptReadByte(ctx) *(ctx->script_ptr++)

typedef struct UnkSavStruct80 UnkSavStruct80;

typedef struct UnkSavStruct80_Sub10_SubC {
    u32 check;
    u8 unk_4;
    u8 unk_5;
    u8 unk_6;
    u8 unk_7;
    u8 unk_8;
    u8 unk_9;
    u16 unk_A;
    u32 unk_C;
    u32 unk_10;
    u32 unk_14;
    u32 unk_18;
    u32 unk_1C;
    u32 unk_20;
    u32 unk_24;
    u32 unk_28;
    u32 unk_2C;
    u32 unk_30;
    u32 unk_34;
    u32 unk_38[3];
    u32 unk_44;
    u32 unk_48;
    u32 unk_4C;
    u32 unk_50;
    u32 unk_54;
    u32 unk_58;
    u32 unk_5C;
    u32 unk_60;
    u32 unk_64;
    u32 unk_68;
    u32 unk_6C;
    u32 unk_70;
    u32 unk_74;
    u32 unk_78;
    u32 unk_7C;
    u32 unk_80;
    u32 unk_84;
    u32 unk_88;
    u16 unk_8C[14];
    void (*unk_A8)(UnkSavStruct80* fsys);
    u32 unk_AC;
    u32 unk_B0;
    u32 unk_B4;
    u32 unk_B8;
    u32 unk_BC;
    u32 unk_C0;
    u32 unk_C4;
    u32 unk_C8;
    u32 unk_CC;
    u32 unk_D0;
    u32 unk_D4;
    u32 unk_D8;
    u32 unk_DC;
} UnkSavStruct80_Sub10_SubC;

typedef struct UnkSavStruct80_Sub10 {
    u8 filler_00[12];
    void *unkC; // maybe a union? sometimes cast to UnkSavStruct80_Sub10_SubC
    u8 filler_10[0x10];
} UnkSavStruct80_Sub10;

typedef struct UnkSavStruct80_Sub20 {
    int unk0;
} UnkSavStruct80_Sub20;

typedef struct UnkSavStruct80_Sub3C UnkSavStruct80_Sub3C;

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
    UnkSavStruct80_Sub3C* unk3C;
    u8 unk40[0xE8];
}; // size: 0x128

typedef struct SCRIPTCONTEXT SCRIPTCONTEXT;
typedef BOOL (*ScrCmdFunc)(SCRIPTCONTEXT* ctx);

typedef struct SCRIPTCONTEXT {
    u8 stack_depth;
    u8 mode;
    u8 comparison_result;
    u8 unk3;
    ScrCmdFunc native_ptr;
    const u8* script_ptr;
    const u8* stack[20];
    ScrCmdFunc* cmd_table;
    u32 cmd_count;
    u32 data[4];
    void* unk74;
    void* msg_data;
    u8* unk7C;
    UnkSavStruct80* unk80;
} SCRIPTCONTEXT;

void InitScriptContext(SCRIPTCONTEXT* ctx, ScrCmdFunc* cmd_table, u32 cmd_count);
BOOL SetupBytecodeScript(SCRIPTCONTEXT* ctx, const u8* ptr);
void SetupNativeScript(SCRIPTCONTEXT* ctx, ScrCmdFunc ptr);
void StopScript(SCRIPTCONTEXT* ctx);
void sub_0203FD68(SCRIPTCONTEXT* ctx, void* unk);
BOOL RunScriptCommand(SCRIPTCONTEXT* ctx);
BOOL ScriptPush(SCRIPTCONTEXT* ctx, const u8* ptr);
const u8* ScriptPop(SCRIPTCONTEXT* ctx);
void ScriptJump(SCRIPTCONTEXT* ctx, const u8* ptr);
void ScriptCall(SCRIPTCONTEXT* ctx, const u8* ptr);
void ScriptReturn(SCRIPTCONTEXT* ctx);
u16 ScriptReadHalfword(SCRIPTCONTEXT* ctx);
u32 ScriptReadWord(SCRIPTCONTEXT* ctx);

#endif
