#include <nitro.h>

asm void OS_SetDPermissionsForProtectionRegion(register u32 setMask, register u32 flags) {
    mrc p15, 0, r2, c5, c0, 2
    bic r2, r2, r0
    orr r2, r2, r1
    mcr p15, 0, r2, c5, c0, 2
    bx lr
}

asm void OS_SetProtectionRegion1(u32 param) {
    mcr p15, 0, r0, c6, c1, 0
    bx lr
}

asm void OS_SetProtectionRegion2(u32 param) {
    mcr p15, 0, r0, c6, c2, 0
    bx lr
}
