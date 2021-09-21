#ifndef NITRO_OS_CONTEXT_H_
#define NITRO_OS_CONTEXT_H_

#include <nitro/os/system.h>

#ifdef SDK_ARM9
#include <nitro/cp/context.h>
#endif

#define SDK_CONTEXT_HAS_SP_SVC

// All the context functions are plain ASM,
// so these offsets are defined for readibility.
#define OS_CONTEXT_CPSR      0
#define OS_CONTEXT_R0        4
#define OS_CONTEXT_R1        8
#define OS_CONTEXT_R2       12
#define OS_CONTEXT_R3       16
#define OS_CONTEXT_R4       20
#define OS_CONTEXT_R5       24
#define OS_CONTEXT_R6       28
#define OS_CONTEXT_R7       32
#define OS_CONTEXT_R8       36
#define OS_CONTEXT_R9       40
#define OS_CONTEXT_R10      44
#define OS_CONTEXT_R11      48
#define OS_CONTEXT_R12      52
#define OS_CONTEXT_R13      56
#define OS_CONTEXT_R14      60
#define OS_CONTEXT_PC_PLUS4 64

#define OS_CONTEXT_SP       OS_CONTEXT_R13
#define OS_CONTEXT_LR       OS_CONTEXT_R14

#ifdef  SDK_CONTEXT_HAS_SP_SVC
#define OS_CONTEXT_R13_SVC  68
#define OS_CONTEXT_SP_SVC   OS_CONTEXT_R13_SVC
#endif

#ifdef SDK_ARM9
#ifdef SDK_CONTEXT_HAS_SP_SVC
#define OS_CONTEXT_CP_CONTEXT 72
#else
#define OS_CONTEXT_CP_CONTEXT 68
#endif
#endif

typedef struct OSContext
{
    u32 cpsr;
    u32 r[13];
    u32 sp;
    u32 lr;
    u32 pc_plus4;
#ifdef SDK_CONTEXT_HAS_SP_SVC
    u32 sp_svc;
#endif
#ifdef SDK_ARM9
    CPContext cp_context;
#endif
} OSContext;

void OS_InitContext(register OSContext *context, register u32 newpc, register u32 newsp);
BOOL OS_SaveContext(register OSContext *context);
void OS_LoadContext(register OSContext *context);

#endif //NITRO_OS_CONTEXT_H_
