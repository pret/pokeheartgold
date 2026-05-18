#ifndef POKEHEARTGOLD_FRONTIER_SCRIPT_CONTEXT_H
#define POKEHEARTGOLD_FRONTIER_SCRIPT_CONTEXT_H

#include "frontier/frontier_system.h"

#include "msgdata.h"

typedef struct FrontierScriptContext FrontierScriptContext;

typedef BOOL (*FrontierScrCmdFunc)(FrontierScriptContext *);
typedef BOOL (*FrontierShouldResumeScriptFunc)(FrontierScriptContext *);

struct FrontierScriptContext {
    FrontierSystem *frontierSystem;
    u8 padding[4];
    u16 unk_08[8];
    u8 stackPointer;
    u8 state;
    const u8 *scriptPtr;
    const u8 *stack[20];
    const FrontierScrCmdFunc *cmdTable;
    u32 cmdTableSize;
    u16 data[4];
    MsgData *msgLoader;
    u8 *scripts;
    FrontierShouldResumeScriptFunc shouldResume;
    u8 unk_8C;
};

#define FrontierScriptContext_ReadByte(ctx) (*(ctx->scriptPtr++))

void FrontierScriptContext_Init(FrontierScriptContext *ctx, const FrontierScrCmdFunc *cmdTable, u32 cmdTableSize);
BOOL FrontierScriptContext_Start(FrontierScriptContext *ctx, const u8 *ptr);
void FrontierScriptContext_Pause(FrontierScriptContext *ctx, FrontierShouldResumeScriptFunc shouldResume);
void FrontierScriptContext_Stop(FrontierScriptContext *ctx);
BOOL FrontierScriptContext_Run(FrontierScriptContext *ctx);
void FrontierScriptContext_Call(FrontierScriptContext *ctx, const u8 *ptr);
void FrontierScriptContext_Return(FrontierScriptContext *ctx);
u16 FrontierScriptContext_ReadHalfWord(FrontierScriptContext *ctx);
u32 FrontierScriptContext_ReadWord(FrontierScriptContext *ctx);

#endif // POKEHEARTGOLD_FRONTIER_SCRIPT_CONTEXT_H
