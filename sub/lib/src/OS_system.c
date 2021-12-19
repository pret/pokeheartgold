#include <nitro.h>

asm OSIntrMode OS_EnableInterrupts(void) {
    mrs r0, cpsr
    bic r1, r0, #HW_PSR_IRQ_DISABLE
    msr cpsr_c, r1
    and r0, r0, #HW_PSR_IRQ_DISABLE
    bx lr
}

asm OSIntrMode OS_DisableInterrupts(void) {
    mrs r0, cpsr
    orr r1, r0, #HW_PSR_IRQ_DISABLE
    msr cpsr_c, r1
    and r0, r0, #HW_PSR_IRQ_DISABLE
    bx lr
}

asm OSIntrMode OS_RestoreInterrupts(register OSIntrMode prev) {
    mrs r1, cpsr
    bic r2, r1, #HW_PSR_IRQ_DISABLE
    orr r2, r2, r0
    msr cpsr_c, r2
    and r0, r1, #HW_PSR_IRQ_DISABLE
    bx lr
}

asm OSIntrMode OS_DisableInterrupts_IrqAndFiq(void) {
    mrs r0, cpsr
    orr r1, r0, #HW_PSR_IRQ_DISABLE | HW_PSR_FIQ_DISABLE
    msr cpsr_c, r1
    and r0, r0, #HW_PSR_IRQ_DISABLE | HW_PSR_FIQ_DISABLE
    bx lr
}

asm OSIntrMode OS_RestoreInterrupts_IrqAndFiq(register OSIntrMode prev) {
    mrs r1, cpsr
    bic r2, r1, #HW_PSR_IRQ_DISABLE | HW_PSR_FIQ_DISABLE
    orr r2, r2, r0
    msr cpsr_c, r2
    and r0, r1, #HW_PSR_IRQ_DISABLE | HW_PSR_FIQ_DISABLE
    bx lr
}

asm OSIntrMode_Irq OS_GetCpsrIrq(void) {
    mrs r0, cpsr
    and r0, r0, #HW_PSR_IRQ_DISABLE
    bx lr
}

asm OSProcMode OS_GetProcMode(void) {
    mrs r0, cpsr
    and r0, r0, #HW_PSR_CPU_MODE_MASK
    bx lr
}

#ifdef SDK_ARM9
#include <nitro/code32.h>
asm void OS_SpinWait(register u32 cycles) {
@loop:
    subs r0, r0, #4
    bhs @loop
    bx lr
}
#include <nitro/codereset.h>
#else
void OS_SpinWait(u32 cycles) {
    SVC_WaitByLoop((s32)cycles / 4);
}
#endif

void OS_WaitVBlankIntr(void) {
    SVC_WaitByLoop(1);
    OS_WaitIrq(TRUE, OS_IE_VBLANK);
}
