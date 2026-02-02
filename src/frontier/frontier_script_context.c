#include "frontier/frontier_script_context.h"

#include <nitro.h>

enum FrontierScriptState {
    SCRIPT_STATE_STOPPED,
    SCRIPT_STATE_RUNNING,
    SCRIPT_STATE_WAITING,
};

void FrontierScriptContext_Init(FrontierScriptContext *ctx, const FrontierScrCmdFunc *cmdTable, u32 cmdTableSize) {
    ctx->state = SCRIPT_STATE_STOPPED;
    ctx->scriptPtr = NULL;
    ctx->stackPointer = 0;
    ctx->shouldResume = NULL;
    ctx->cmdTable = cmdTable;
    ctx->cmdTableSize = cmdTableSize;

    u32 i;
    for (i = 0; i < NELEMS(ctx->data); i++) {
        ctx->data[i] = 0;
    }

    for (i = 0; i < NELEMS(ctx->stack); i++) {
        ctx->stack[i] = NULL;
    }
}

BOOL FrontierScriptContext_Start(FrontierScriptContext *ctx, const u8 *ptr) {
    ctx->scriptPtr = ptr;
    ctx->state = SCRIPT_STATE_RUNNING;

    return TRUE;
}

void FrontierScriptContext_Pause(FrontierScriptContext *ctx, FrontierShouldResumeScriptFunc shouldResume) {
    ctx->state = SCRIPT_STATE_WAITING;
    ctx->shouldResume = shouldResume;
}

void FrontierScriptContext_Stop(FrontierScriptContext *ctx) {
    ctx->state = SCRIPT_STATE_STOPPED;
    ctx->scriptPtr = NULL;
}

BOOL FrontierScriptContext_Run(FrontierScriptContext *ctx) {
    switch (ctx->state) {
    case SCRIPT_STATE_STOPPED:
        return FALSE;
    case SCRIPT_STATE_WAITING:
        if (ctx->shouldResume != NULL) {
            if (ctx->shouldResume(ctx) == TRUE) {
                ctx->state = SCRIPT_STATE_RUNNING;
                ctx->shouldResume = NULL;
            }
            return TRUE;
        }
        ctx->state = SCRIPT_STATE_RUNNING;
    case SCRIPT_STATE_RUNNING:
        while (TRUE) {
            if (ctx->scriptPtr == NULL) {
                ctx->state = SCRIPT_STATE_STOPPED;
                return FALSE;
            }

            u16 cmdCode = FrontierScriptContext_ReadHalfWord(ctx);
            if (cmdCode >= ctx->cmdTableSize) {
                GF_ASSERT(FALSE);
                ctx->state = SCRIPT_STATE_STOPPED;
                return FALSE;
            }

            if (ctx->cmdTable[cmdCode](ctx) == TRUE) {
                break;
            }
        }
    }

    return TRUE;
}

static BOOL FrontierScriptContext_Push(FrontierScriptContext *ctx, const u8 *ptr) {
    if (ctx->stackPointer + 1 >= (int)NELEMS(ctx->stack)) {
        return TRUE;
    }

    ctx->stack[ctx->stackPointer] = ptr;
    ctx->stackPointer++;

    return FALSE;
}

static const u8 *FrontierScriptContext_Pop(FrontierScriptContext *ctx) {
    if (ctx->stackPointer == 0) {
        return NULL;
    }

    return ctx->stack[--ctx->stackPointer];
}

void FrontierScriptContext_Call(FrontierScriptContext *ctx, const u8 *ptr) {
    FrontierScriptContext_Push(ctx, ctx->scriptPtr);
    ctx->scriptPtr = ptr;
}

void FrontierScriptContext_Return(FrontierScriptContext *ctx) {
    ctx->scriptPtr = FrontierScriptContext_Pop(ctx);
}

u16 FrontierScriptContext_ReadHalfWord(FrontierScriptContext *ctx) {
    u16 value = FrontierScriptContext_ReadByte(ctx);
    value += FrontierScriptContext_ReadByte(ctx) << 8;

    return value;
}

u32 FrontierScriptContext_ReadWord(FrontierScriptContext *ctx) {
    u8 byte0 = FrontierScriptContext_ReadByte(ctx);
    u8 byte1 = FrontierScriptContext_ReadByte(ctx);
    u8 byte2 = FrontierScriptContext_ReadByte(ctx);
    u8 byte3 = FrontierScriptContext_ReadByte(ctx);
    u32 value = 0;

    value += byte3;
    value <<= 8;
    value += byte2;
    value <<= 8;
    value += byte1;
    value <<= 8;
    value += byte0;

    return value;
}
