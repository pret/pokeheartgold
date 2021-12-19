#include <nitro/os/context.h>
#include <nitro/code32.h>

asm void OS_InitContext(register OSContext *context, register u32 newpc, register u32 newsp) {
add newpc, newpc, #4
str newpc, [context, #OS_CONTEXT_PC_PLUS4]

#ifdef SDK_CONTEXT_HAS_SP_SVC
str newsp, [context, #OS_CONTEXT_SP_SVC]
sub newsp, newsp, #HW_SVC_STACK_SIZE
#endif

tst newsp, #4
subne newsp, newsp, #4
str newsp, [context, #OS_CONTEXT_SP]

ands newpc, newpc, #1
movne r1, #HW_PSR_SYS_MODE | HW_PSR_THUMB_STATE
moveq r1, #HW_PSR_SYS_MODE | HW_PSR_ARM_STATE
str r1, [context, #OS_CONTEXT_CPSR]

// Zero-initialize the registers
mov r1, #0
str r1, [context, #OS_CONTEXT_R0]
str r1, [context, #OS_CONTEXT_R1]
str r1, [context, #OS_CONTEXT_R2]
str r1, [context, #OS_CONTEXT_R3]
str r1, [context, #OS_CONTEXT_R4]
str r1, [context, #OS_CONTEXT_R5]
str r1, [context, #OS_CONTEXT_R6]
str r1, [context, #OS_CONTEXT_R7]
str r1, [context, #OS_CONTEXT_R8]
str r1, [context, #OS_CONTEXT_R9]
str r1, [context, #OS_CONTEXT_R10]
str r1, [context, #OS_CONTEXT_R11]
str r1, [context, #OS_CONTEXT_R12]
str r1, [context, #OS_CONTEXT_R14]
bx lr
}

asm BOOL OS_SaveContext(register OSContext *context) {
#ifdef SDK_ARM9
stmdb sp!, {r0, lr}
    add r0, r0, #OS_CONTEXT_CP_CONTEXT
    ldr r1, =CP_SaveContext
    blx r1
    ldmia sp!, {r0, lr}
#endif
add r1, r0, #0

mrs r2, cpsr
str r2, [r1], #OS_CONTEXT_R0 - OS_CONTEXT_CPSR

#ifdef SDK_CONTEXT_HAS_SP_SVC
mov r0, #HW_PSR_SVC_MODE | HW_PSR_IRQ_DISABLE | HW_PSR_FIQ_DISABLE | HW_PSR_ARM_STATE
msr cpsr_c, r0
str sp, [r1, #OS_CONTEXT_SP_SVC - OS_CONTEXT_R0]
msr cpsr_c, r2
#endif

mov r0, #1 // Return value if restoring context via OS_LoadContext
stmia r1, {r0-r14}
add r0, pc, #0x8
str r0, [r1, #OS_CONTEXT_PC_PLUS4 - OS_CONTEXT_R0]

mov r0, #0
bx lr
}

asm void OS_LoadContext(register OSContext *context) {
#ifdef SDK_ARM9
stmdb sp!, {r0, lr}
    add r0, r0, #OS_CONTEXT_CP_CONTEXT
    ldr r1, =CPi_RestoreContext
    blx r1
    ldmia sp!, {r0, lr}
#endif

mrs r1, cpsr
bic r1, r1, #HW_PSR_CPU_MODE_MASK
orr r1, r1, #HW_PSR_SVC_MODE | HW_PSR_IRQ_DISABLE | HW_PSR_FIQ_DISABLE
msr cpsr_c, r1

ldr r1, [r0], #OS_CONTEXT_R0 - OS_CONTEXT_CPSR
msr spsr_fsxc, r1

#ifdef SDK_CONTEXT_HAS_SP_SVC
ldr sp, [r0, #OS_CONTEXT_SP_SVC - OS_CONTEXT_R0]
#endif

ldr lr, [r0, #OS_CONTEXT_PC_PLUS4 - OS_CONTEXT_R0]
ldmia r0, {r0-r14} ^
nop

    subs pc, lr, #4
}
