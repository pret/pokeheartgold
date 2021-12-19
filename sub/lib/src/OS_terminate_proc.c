#include <nitro.h>

void OS_Terminate(void) {
#ifdef SDK_ARM7
    CTRDG_VibPulseEdgeUpdate(0);
#endif
    while (1) {
        OS_DisableInterrupts();
        OS_Halt();
    }
}

#ifdef SDK_ARM9
asm void OS_Halt(void) {
    mov r0, #0
    mcr p15, 0, r0, c7, c0, 4
    bx lr
}
#endif
