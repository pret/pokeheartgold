#include "OS_context.h"
#include "consts.h"
#include "function_target.h"

ARM_FUNC asm void OS_InitContext(register OSContext *context, register u32 newpc, register u32 newsp)
{
    add newpc, newpc, #4
    str newpc, [context, #0x40]

    str newsp, [context, #0x44]
    sub newsp, newsp, #HW_SVC_STACK_SIZE

    tst newsp, #4
    subne newsp, newsp, #4
    str newsp, [context, #0x38]

    ands r1, newpc, #1
    movne r1, #0x3f
    moveq r1, #0x1f
    str r1, [context]

    mov r1, #0
    str r1, [context, #0x4]
    str r1, [context, #0x8]
    str r1, [context, #0xc]
    str r1, [context, #0x10]
    str r1, [context, #0x14]
    str r1, [context, #0x18]
    str r1, [context, #0x1c]
    str r1, [context, #0x20]
    str r1, [context, #0x24]
    str r1, [context, #0x28]
    str r1, [context, #0x2c]
    str r1, [context, #0x30]
    str r1, [context, #0x34]
    str r1, [context, #0x3c]

    bx lr
}

ARM_FUNC asm BOOL OS_SaveContext(register OSContext *context)
{
    add r1, r0, #0

    mrs r2, cpsr
    str r2, [r1], #0x4

    mov r0, #0xd3
    msr cpsr_c, r0
    str sp, [r1, #0x40]
    msr cpsr_c, r2

    mov r0, #1
    stmia r1, {r0-r14}
    add r0, pc, #8
    str r0, [r1, #0x3c]

    mov r0, #0
    bx lr
}

ARM_FUNC asm void OS_LoadContext(register OSContext* context)
{
    mrs r1, cpsr
    bic r1, r1, #HW_PSR_CPU_MODE_MASK
    orr r1, r1, #0xd3
    msr cpsr_c, r1

    ldr r1, [r0], #0x4
    msr spsr_fsxc, r1

    ldr sp, [r0, #0x40]

    ldr lr, [r0, #0x3c]
    ldmia r0, {r0-r14}^
    nop

    subs pc, lr, #4
}
