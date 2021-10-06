#include <nitro.h>

typedef struct {
    OSContext context;
    u32 cp15;
    u32 spsr;
    u32 exinfo;
    u32 debug[4];
} OSiExContext;

static OSiExContext OSi_ExContext;
static OSExceptionHandler OSi_UserExceptionHandler;
static void *OSi_UserExceptionHandlerArg;
static void *OSi_DebuggerHandler = NULL;
static u32 OSi_ExceptionHookStack[8];

asm void OSi_GetAndDisplayContext(void);
asm void OSi_SetExContext(void);
void OSi_DisplayExContext(void);

void OSi_ExceptionHandler(void);

#define HW_EXCP_VECTOR_BUF_FOR_DEBUGGER  0x027ffd9c

void OS_InitException(void) {
    if (0x02600000 <= *(u32 *)HW_EXCP_VECTOR_BUF_FOR_DEBUGGER && *(u32 *)HW_EXCP_VECTOR_BUF_FOR_DEBUGGER < 0x02800000) {
        OSi_DebuggerHandler = *(void **)HW_EXCP_VECTOR_BUF_FOR_DEBUGGER;
    } else {
        OSi_DebuggerHandler = NULL;
    }
    if (!OSi_DebuggerHandler) {
        *(u32 *)(HW_EXCP_VECTOR_BUF_FOR_DEBUGGER) = (u32)OSi_ExceptionHandler;
        *(u32 *)(HW_EXCP_VECTOR_BUF) = (u32)OSi_ExceptionHandler;
    }
    OSi_UserExceptionHandler = NULL;
    (void)OSi_ExceptionHookStack; // force active
}

asm void OSi_ExceptionHandler(void) {
    ldr r12, =OSi_DebuggerHandler
    ldr r12, [r12]
    cmp r12, #0
    movne lr, pc
    bxne r12
    ldr r12, =HW_ITCM_END
    stmdb r12!, {r0-r3, sp, lr}
    and r0, sp, #1
    mov sp, r12
    mrs r1, cpsr
    and r1, r1, #0x1f
    teq r1, #0x17
    bne @skip1
    bl OSi_GetAndDisplayContext
    b @ok
@skip1:
    teq r1, #0x1b
    bne @ok
    bl OSi_GetAndDisplayContext
@ok:
    ldr r12, =OSi_DebuggerHandler
    ldr r12, [r12]
    cmp r12, #0
@trap:
    beq @trap
@trap2:
    nop
    b @trap2
    // Never reached
    ldmia sp!, {r0-r3, r12, lr}
    mov sp, r12
    bx lr
}

asm void OSi_GetAndDisplayContext(void) {
    stmdb sp!, {r0, lr}
    bl OSi_SetExContext
    bl OSi_DisplayExContext
    ldmia sp!, {r0, lr}
    bx lr
}

asm void OSi_SetExContext(void) {
    ldr r1, =OSi_ExContext
    mrs r2, cpsr
    str r2, [r1, #OSiExContext.debug[1]]
    str r0, [r1, #OSiExContext.exinfo]
    ldr r0, [r12]
    str r0, [r1, #OSiExContext.context.r[0]]
    ldr r0, [r12, #4]
    str r0, [r1, #OSiExContext.context.r[1]]
    ldr r0, [r12, #8]
    str r0, [r1, #OSiExContext.context.r[2]]
    ldr r0, [r12, #12]
    str r0, [r1, #OSiExContext.context.r[3]]
    ldr r2, [r12, #16]
    bic r2, r2, #1
    add r0, r1, #OSiExContext.context.r[4]
    stmia r0, {r4-r11}
    str r12, [r1, #OSiExContext.debug[0]]
    ldr r0, [r2]
    str r0, [r1, #OSiExContext.cp15]
    ldr r3, [r2, #4]
    str r3, [r1, #OSiExContext.context.cpsr]
    ldr r0, [r2, #8]
    str r0, [r1, #OSiExContext.context.r[12]]
    ldr r0, [r2, #12]
    str r0, [r1, #OSiExContext.context.pc_plus4]
    mrs r0, cpsr
    orr r3, r3, #0x80
    bic r3, r3, #0x20
    msr cpsr_fsxc, r3
    str sp, [r1, #OSiExContext.context.sp]
    str lr, [r1, #OSiExContext.context.lr]
    mrs r2, spsr
    str r2, [r1, #OSiExContext.debug[3]]
    msr cpsr_fsxc, r0
    bx lr
}

void OSi_DisplayExContext(void) {
    if (OSi_UserExceptionHandler) {
        // asm must be on its own line
        asm
        {
            /* *INDENT-OFF* */
            mrs r2, cpsr
            mov r0, sp
            ldr r1, =0x9F // why not mov?
            msr cpsr_fsxc, r1
            mov r1, sp
            mov sp, r0
            stmdb sp!, {r1, r2}
            bl OS_EnableProtectionUnit
            ldr r0, =OSi_ExContext
            ldr r1, =OSi_UserExceptionHandlerArg
            ldr r1, [r1]
            ldr r12, =OSi_UserExceptionHandler
            ldr r12, [r12]
            ldr lr, =@ret
            bx r12
@ret:
            bl OS_DisableProtectionUnit
            ldmia sp!, {r1, r2}
            mov sp, r1
            msr cpsr_fsxc, r2
            /* *INDENT-ON* */
        }
    }
}
