#ifndef POKEHEARTGOLD_SCRIPT_H
#define POKEHEARTGOLD_SCRIPT_H

#define SCRIPT_MODE_STOPPED  0
#define SCRIPT_MODE_BYTECODE 1
#define SCRIPT_MODE_NATIVE   2

#define SCRIPT_COMPARISON_RESULT_LESS    0
#define SCRIPT_COMPARISON_RESULT_EQUAL   1
#define SCRIPT_COMPARISON_RESULT_GREATER 2

#define ScriptReadByte(ctx) *(ctx->script_ptr++)

struct ScriptContext;
typedef BOOL (*ScrCmdFunc)(struct ScriptContext* ctx);

struct ScriptContext {
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
    void* unk80;
};

void InitScriptContext(struct ScriptContext* ctx, ScrCmdFunc* cmd_table, u32 cmd_count);
BOOL SetupBytecodeScript(struct ScriptContext* ctx, const u8* ptr);
void SetupNativeScript(struct ScriptContext* ctx, ScrCmdFunc ptr);
void StopScript(struct ScriptContext* ctx);
void sub_0203FD68(struct ScriptContext* ctx, void* unk);
BOOL RunScriptCommand(struct ScriptContext* ctx);
BOOL ScriptPush(struct ScriptContext* ctx, const u8* ptr);
const u8* ScriptPop(struct ScriptContext* ctx);
void ScriptJump(struct ScriptContext* ctx, const u8* ptr);
void ScriptCall(struct ScriptContext* ctx, const u8* ptr);
void ScriptReturn(struct ScriptContext* ctx);
u16 ScriptReadHalfword(struct ScriptContext* ctx);
u32 ScriptReadWord(struct ScriptContext* ctx);

#endif
