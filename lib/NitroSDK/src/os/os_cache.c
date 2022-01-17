#include <nitro.h>
#include <nitro/code32.h>

asm void DC_InvalidateAll(void) {
    mov r0, #0
    mcr p15, 0, r0, c7, c6, 0
    bx lr
}

asm void DC_StoreAll(void) {
    mov r1, #0
@outerLoop:
    mov r0, #0
@innerLoop:
    orr r2, r1, r0
    mcr p15, 0, r2, c7, c10, 2
    add r0, r0, #HW_CACHE_LINE_SIZE
    cmp r0, #HW_DCACHE_SIZE / 4
    blt @innerLoop
    add r1, r1, #1 << HW_C7_CACHE_SET_NO_SHIFT
    cmp r1, #0
    bne @outerLoop
    bx lr
}

asm void DC_FlushAll(void) {
    mov r12, #0
    mov r1, #0
@outerLoop:
    mov r0, #0
@innerLoop:
    orr r2, r1, r0
    mcr p15, 0, r12, c7, c10, 4
    mcr p15, 0, r2, c7, c14, 2
    add r0, r0, #HW_CACHE_LINE_SIZE
    cmp r0, #HW_DCACHE_SIZE / 4
    blt @innerLoop
    add r1, r1, #1 << HW_C7_CACHE_SET_NO_SHIFT
    cmp r1, #0
    bne @outerLoop
    bx lr
}

asm void DC_InvalidateRange(register void * startAddr, register u32 nBytes) {
    add r1, r1, r0
    bic r0, r0, #HW_CACHE_LINE_SIZE - 1
@loop:
    mcr p15, 0, r0, c7, c6, 1
    add r0, r0, #HW_CACHE_LINE_SIZE
    cmp r0, r1
    blt @loop
    bx lr
}

asm void DC_StoreRange(register void * startAddr, register u32 nBytes) {
    add r1, r1, r0
    bic r0, r0, #HW_CACHE_LINE_SIZE - 1
@loop:
    mcr p15, 0, r0, c7, c10, 1
    add r0, r0, #HW_CACHE_LINE_SIZE
    cmp r0, r1
    blt @loop
    bx lr
}

asm void DC_FlushRange(register const void * startAddr, register u32 nBytes) {
    mov r12, #0
    add r1, r1, r0
    bic r0, r0, #HW_CACHE_LINE_SIZE - 1
@loop:
    mcr p15, 0, r12, c7, c10, 4
    mcr p15, 0, r0, c7, c14, 1
    add r0, r0, #HW_CACHE_LINE_SIZE
    cmp r0, r1
    blt @loop
    bx lr
}

asm void DC_WaitWriteBufferEmpty(void) {
    mov r0, #0
    mcr p15, 0, r0, c7, c10, 4
    bx lr
}

asm void IC_InvalidateAll(void) {
    mov r0, #0
    mcr p15, 0, r0, c7, c5, 0
    bx lr
}

asm void IC_InvalidateRange(register void *startAddr, register u32 nBytes) {
    add r1, r1, r0
    bic r0, r0, #HW_CACHE_LINE_SIZE - 1
@loop:
    mcr p15, 0, r0, c7, c5, 1
    add r0, r0, #HW_CACHE_LINE_SIZE
    cmp r0, r1
    blt @loop
    bx lr
}
