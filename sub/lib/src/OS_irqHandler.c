#include <nitro/os/interrupt.h>
#include <nitro/os/system.h>
#include <nitro/os/thread.h>
#include <nitro/os/irqHandler.h>
#include <nitro/os/irqTable.h>
#include <nitro/os/context.h>

extern OSThreadQueue OSi_IrqThreadQueue;
asm void OS_IrqHandler_ThreadSwitch(void);

void OS_WaitIrq(BOOL clear, OSIrqMask irqFlags) {
    OSIntrMode enabled = OS_DisableInterrupts();
    if (clear) {
        OS_ClearIrqCheckFlag(irqFlags);
    }
    OS_RestoreInterrupts(enabled);
    while (!(OS_GetIrqCheckFlag() & irqFlags)) {
        OS_SleepThread(&OSi_IrqThreadQueue);
    }
}

#ifdef SDK_ARM9
#include <nitro/dtcm_begin.h>
#endif

OSThreadQueue OSi_IrqThreadQueue = {NULL, NULL};

#ifdef SDK_ARM9
#include <nitro/dtcm_end.h>
#endif

#ifdef SDK_ARM9
#include <nitro/itcm_begin.h>
#endif //SDK_ARM9

asm void OS_IrqHandler(register OSIrqMask irq) {
    stmdb sp!, {lr}
    mov r12, #HW_REG_BASE
    add r12, r12, #REG_IE_OFFSET
    // Are intr disabled?
    ldr r1, [r12, #REG_IME_OFFSET - REG_IE_OFFSET]
    cmp r1, #0
    ldmeqia sp!, {pc}
    // Is intr requested?
    ldmia r12, {r1, r2}
    ands r1, r1, r2
    ldmeqia sp!, {pc}
    // Least significant intr flag takes highest priority
#ifdef SDK_ARM9
    mov r3, #1 << 31
@clzLoop:
    clz r0, r1
    bics r1, r1, r3, lsr r0
    bne @clzLoop
    mov r1, r3, lsr r0
    str r1, [r12, #REG_IF_OFFSET - REG_IE_OFFSET]
    rsbs r0, r0, #31
#else
    mov r3, #1
    mov r0, #0
@clzLoop:
    ands r2, r1, r3, lsl r0
    addeq r0, r0, #1
    beq @clzLoop
    str r2, [r12, #REG_IF_OFFSET - REG_IE_OFFSET]
#endif
    ldr r1, =OS_IRQTable
    ldr r0, [r1, r0, lsl #2]
    ldr lr, =OS_IrqHandler_ThreadSwitch
    bx r0
}

asm void OS_IrqHandler_ThreadSwitch(void) {
    ldr r12, =OSi_IrqThreadQueue
    mov r3, #0
    ldr r12, [r12, #OSThreadQueue.head]
    mov r2, #1
    cmp r12, #0
    beq @noThreadsToWake
@wakeThreadsLoop:
    str r2, [r12, #OSThread.state]
    str r3, [r12, #OSThread.queue]
    str r3, [r12, #OSThread.link.prev]
    ldr r0, [r12, #OSThread.link.next]
    str r3, [r12, #OSThread.link.next]
    mov r12, r0
    cmp r12, #0
    bne @wakeThreadsLoop
    ldr r12, =OSi_IrqThreadQueue
    str r3, [r12, #OSThreadQueue.head]
    str r3, [r12, #OSThreadQueue.tail]
    ldr r12, =OSi_ThreadInfo
    mov r1, #1
    strh r1, [r12, #OSThreadInfo.isNeedRescheduling]
@noThreadsToWake:
    ldr r12, =OSi_ThreadInfo
    ldrh r1, [r12, #OSThreadInfo.isNeedRescheduling]
    cmp r1, #0
    ldreq pc, [sp], #4
    mov r1, #0
    strh r1, [r12, #OSThreadInfo.isNeedRescheduling]
    mov r3, #HW_PSR_DISABLE_IRQ_FIQ | HW_PSR_IRQ_MODE
    msr cpsr_c, r3
    add r2, r12, #OSThreadInfo.list
    ldr r1, [r2]
@listLoop:
    cmp r1, #0
    ldrneh r0, [r1, #OSThread.state]
    cmpne r0, #OS_THREAD_STATE_READY
    ldrne r1, [r1, #OSThread.next]
    bne @listLoop
    cmp r1, #0
    bne @checkNext
@enableFiqAndBail:
    mov r3, #HW_PSR_DISABLE_IRQ | HW_PSR_IRQ_MODE
    msr cpsr_c, r3
    ldr pc, [sp], #4
@checkNext:
    ldr r0, [r12, #OSThreadInfo.current]
    cmp r1, r0
    beq @enableFiqAndBail
    ldr r3, [r12, #OSThreadInfo.switchCallback]
    cmp r3, #0
    beq @noSwitchCB
    stmdb sp!, {r0, r1, r12}
    mov lr, pc
    bx r3
    ldmia sp!, {r0, r1, r12}
@noSwitchCB:
    str r1, [r12, #OSThreadInfo.current]
    mrs r2, spsr
    str r2, [r0, #OSThread.context + OS_CONTEXT_CPSR]!
#ifdef SDK_ARM9
    stmdb sp!, {r0, r1}
    add r0, r0, #OSThread.context
    add r0, r0, #OSContext.cp_context
    ldr r1, =CP_SaveContext
    blx r1
    ldmia sp!, {r0, r1}
#endif
    ldmib sp!, {r2, r3}
    stmib r0!, {r2, r3}
    ldmib sp!, {r2, r3, r12, lr}
    stmib r0!, {r2-r14} ^
    stmib r0!, {lr}
#ifdef SDK_CONTEXT_HAS_SP_SVC
    mov r3, #HW_PSR_DISABLE_IRQ_FIQ | HW_PSR_SVC_MODE
    msr cpsr_c, r3
    stmib r0!, {sp}
#endif
#ifdef SDK_ARM9
stmdb sp!, {r1}
    add r0, r1, #OSThread.context
    add r0, r0, #OSContext.cp_context
    ldr r1, =CPi_RestoreContext
    blx r1
    ldmia sp!, {r1}
#endif
#ifdef SDK_CONTEXT_HAS_SP_SVC
    ldr sp, [r1, #OSThread.context + OSContext.sp_svc]
    mov r3, #HW_PSR_DISABLE_IRQ_FIQ | HW_PSR_IRQ_MODE
    msr cpsr_c, r3
#endif
    ldr r2, [r1, #OSThread.context + OSContext.cpsr]!
    msr spsr_fc, r2
    ldr lr, [r1, #OSThread.context + OSContext.pc_plus4]
    ldmib r1, {r0-r14} ^
    nop
    stmda sp!, {r0-r3, r12, lr}
    ldmia sp!, {pc}
}
