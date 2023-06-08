#include "script.h"

void InitScriptContext(ScriptContext* ctx, const ScrCmdFunc* cmd_table, u32 cmd_count) {
    s32 i = 0;

    ctx->mode = SCRIPT_MODE_STOPPED;
    ctx->script_ptr = NULL;
    ctx->stackDepth = 0;
    ctx->id = 0;
    ctx->native_ptr = NULL;
    ctx->cmdTable = cmd_table;
    ctx->cmd_count = cmd_count;

    for (i = 0; i < NELEMS(ctx->data); i++) {
        ctx->data[i] = 0;
    }

    for (i = 0; i < NELEMS(ctx->stack); i++) {
        ctx->stack[i] = NULL;
    }

    ctx->taskman = NULL;
}

BOOL SetupBytecodeScript(ScriptContext* ctx, const u8* ptr) {
    ctx->script_ptr = ptr;
    ctx->mode = SCRIPT_MODE_BYTECODE;
    return TRUE;
}

void SetupNativeScript(ScriptContext* ctx, ScrCmdFunc ptr) {
    ctx->mode = SCRIPT_MODE_NATIVE;
    ctx->native_ptr = ptr;
}

void StopScript(ScriptContext* ctx) {
    ctx->mode = SCRIPT_MODE_STOPPED;
    ctx->script_ptr = NULL;
}

void sub_0203FD68(ScriptContext* ctx, TaskManager *unk) {
    ctx->taskman = unk;
}

BOOL RunScriptCommand(ScriptContext* ctx) {
    if (ctx->mode == SCRIPT_MODE_STOPPED) {
        return FALSE;
    }

    switch (ctx->mode) {
    // Never gets run, since we have already checked for this
    case SCRIPT_MODE_STOPPED:
        return FALSE;

    case SCRIPT_MODE_NATIVE:
        if (ctx->native_ptr != NULL) {
            if (ctx->native_ptr(ctx) == TRUE) {
                ctx->mode = SCRIPT_MODE_BYTECODE;
            }

            return TRUE;
        }

        ctx->mode = SCRIPT_MODE_BYTECODE;

        // fallthrough

    case SCRIPT_MODE_BYTECODE:
        while (TRUE) {
            if (ctx->script_ptr == NULL) {
                ctx->mode = SCRIPT_MODE_STOPPED;
                return FALSE;
            }

            u16 cmd_code = ScriptReadHalfword(ctx);
            if (cmd_code >= ctx->cmd_count) {
                GF_ASSERT(FALSE);
                ctx->mode = SCRIPT_MODE_STOPPED;
                return FALSE;
            }

            ScrCmdFunc cmd = ctx->cmdTable[cmd_code];
            if ((*cmd)(ctx) == TRUE) {
                break;
            }
        }
    }

    return TRUE;
}

BOOL ScriptPush(ScriptContext* ctx, const u8* ptr) {
    if (ctx->stackDepth + 1 >= (s32)NELEMS(ctx->stack)) {
        return TRUE;
    }

    ctx->stack[ctx->stackDepth] = ptr;
    ctx->stackDepth++;

    return FALSE;
}

const u8* ScriptPop(ScriptContext* ctx) {
    if (ctx->stackDepth == 0) {
        return NULL;
    }

    return ctx->stack[--ctx->stackDepth];
}

void ScriptJump(ScriptContext* ctx, const u8* ptr) {
    ctx->script_ptr = ptr;
}

void ScriptCall(ScriptContext* ctx, const u8* ptr) {
    ScriptPush(ctx, ctx->script_ptr);
    ctx->script_ptr = ptr;
}

void ScriptReturn(ScriptContext* ctx) {
    ctx->script_ptr = ScriptPop(ctx);
}

u16 ScriptReadHalfword(ScriptContext* ctx) {
    u16 value = ScriptReadByte(ctx);
    value += ScriptReadByte(ctx) << 8;

    return value;
}

u32 ScriptReadWord(ScriptContext* ctx) {
    u32 value0 = ScriptReadByte(ctx);
    u32 value1 = ScriptReadByte(ctx);
    u32 value2 = ScriptReadByte(ctx);
    u32 value3 = ScriptReadByte(ctx);

    u32 ret = 0;

    ret += value3;
    ret <<= 8;
    ret += value2;
    ret <<= 8;
    ret += value1;
    ret <<= 8;
    ret += value0;

    return ret;
}
