/*
 * NOTE:
 * This file is shared between ARM9 and ARM7
 * DO NOT PUT PROC SPECIFIC CODE IN HERE
 * Thank You!
 */

/*
 * DO NOT INCLUDE THIS FILE DIRECTLY
 * Include OS_arena.h from the specific proc's lib
 */

#ifndef NITRO_OS_ARENA_SHARED_H
#define NITRO_OS_ARENA_SHARED_H

#include <nitro/types.h>
#include <nitro/hw/consts_shared.h>

typedef enum {
    OS_ARENA_MAIN = 0,
    OS_ARENA_MAIN_SUBPRIV = 1,
    OS_ARENA_MAINEX = 2,
    OS_ARENA_ITCM = 3,
    OS_ARENA_DTCM = 4,
    OS_ARENA_SHARED = 5,
    OS_ARENA_WRAM_MAIN = 6,
    OS_ARENA_WRAM_SUB = 7,
    OS_ARENA_WRAM_SUBPRIV = 8,
    OS_ARENA_MAX = 9
} OSArenaId;

typedef struct {
    void* lo[OS_ARENA_MAX];
    void* hi[OS_ARENA_MAX];
    u16 initialized;
    u8 padding[2];
} OSArenaInfo;

#endif //NITRO_OS_ARENA_SHARED_H
