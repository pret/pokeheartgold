#include <nitro.h>

extern void SDK_IRQ_STACKSIZE(void);
#define OSi_IRQ_STACKSIZE ((s32)SDK_IRQ_STACKSIZE)
extern void SDK_SYS_STACKSIZE(void);
#define OSi_SYS_STACKSIZE ((s32)SDK_SYS_STACKSIZE)

extern void SDK_SECTION_ARENA_DTCM_START(void);
#define OSi_DTCM_ARENA_LO_DEFAULT ((s32)SDK_SECTION_ARENA_DTCM_START)

extern void SDK_SECTION_ARENA_ITCM_START(void);
#define OSi_ITCM_ARENA_LO_DEFAULT ((s32)SDK_SECTION_ARENA_ITCM_START)

extern void SDK_MAIN_ARENA_LO(void);
#define OSi_MAIN_ARENA_LO_DEFAULT ((s32)SDK_MAIN_ARENA_LO)

BOOL OSi_Initialized = FALSE;
BOOL OSi_MainArenaEnabled = FALSE;

void OS_InitArena(void) {
    if (OSi_Initialized) {
        return;
    }
    OSi_Initialized = TRUE;
    OS_SetArenaHi(OS_ARENA_MAIN, OS_GetInitArenaHi(OS_ARENA_MAIN));
    OS_SetArenaLo(OS_ARENA_MAIN, OS_GetInitArenaLo(OS_ARENA_MAIN));
    OS_SetArenaLo(OS_ARENA_MAINEX, NULL);
    OS_SetArenaHi(OS_ARENA_MAINEX, NULL);
    OS_SetArenaHi(OS_ARENA_ITCM, OS_GetInitArenaHi(OS_ARENA_ITCM));
    OS_SetArenaLo(OS_ARENA_ITCM, OS_GetInitArenaLo(OS_ARENA_ITCM));
    OS_SetArenaHi(OS_ARENA_DTCM, OS_GetInitArenaHi(OS_ARENA_DTCM));
    OS_SetArenaLo(OS_ARENA_DTCM, OS_GetInitArenaLo(OS_ARENA_DTCM));
    OS_SetArenaHi(OS_ARENA_SHARED, OS_GetInitArenaHi(OS_ARENA_SHARED));
    OS_SetArenaLo(OS_ARENA_SHARED, OS_GetInitArenaLo(OS_ARENA_SHARED));
    OS_SetArenaHi(OS_ARENA_WRAM_MAIN, OS_GetInitArenaHi(OS_ARENA_WRAM_MAIN));
    OS_SetArenaLo(OS_ARENA_WRAM_MAIN, OS_GetInitArenaLo(OS_ARENA_WRAM_MAIN));
}

void OS_InitArenaEx(void) {
    OS_SetArenaHi(OS_ARENA_MAINEX, OS_GetInitArenaHi(OS_ARENA_MAINEX));
    OS_SetArenaLo(OS_ARENA_MAINEX, OS_GetInitArenaLo(OS_ARENA_MAINEX));
    if (!OSi_MainArenaEnabled || (OS_GetConsoleType() & OS_CONSOLE_SIZE_MASK) == OS_CONSOLE_SIZE_4MB) {
        OS_SetProtectionRegion(1, HW_MAIN_MEM_MAIN, 4MB);
        OS_SetProtectionRegion(2, HW_MAIN_MEM_MAIN_END, 128KB);
    }
}

void *OS_GetArenaHi(OSArenaId arena) {
    return OSi_GetArenaInfo().hi[arena];
}

void *OS_GetArenaLo(OSArenaId arena) {
    return OSi_GetArenaInfo().lo[arena];
}

void *OS_GetInitArenaHi(OSArenaId arena) {
    switch (arena) {
    case OS_ARENA_MAIN:
        return (void *)OSi_MAIN_ARENA_HI_DEFAULT;
    case OS_ARENA_MAINEX:
        if (!OSi_MainArenaEnabled || (OS_GetConsoleType() & OS_CONSOLE_SIZE_MASK) == OS_CONSOLE_SIZE_4MB) {
            return NULL;
        } else {
            return (void *)OSi_MAINEX_ARENA_HI_DEFAULT;
        }
    case OS_ARENA_ITCM:
        return (void *)HW_ITCM_ARENA_HI_DEFAULT;
    case OS_ARENA_DTCM: {
        u32 irqStackLo;
        u32 sysStackLo;

        irqStackLo = (u32)HW_DTCM_IRQ_STACK_END - OSi_IRQ_STACKSIZE;

        if (OSi_SYS_STACKSIZE == 0) {
            sysStackLo = HW_DTCM;
            if (sysStackLo < OSi_DTCM_ARENA_LO_DEFAULT) {
                sysStackLo = OSi_DTCM_ARENA_LO_DEFAULT;
            }
        } else if (OSi_SYS_STACKSIZE < 0) {
            sysStackLo = OSi_DTCM_ARENA_LO_DEFAULT - OSi_SYS_STACKSIZE;
        } else {
            sysStackLo = irqStackLo - OSi_SYS_STACKSIZE;
        }
        return (void *)sysStackLo;
    }
    case OS_ARENA_SHARED:
        return (void *)HW_SHARED_ARENA_HI_DEFAULT;
    case OS_ARENA_WRAM_MAIN:
        return (void *)OSi_WRAM_MAIN_ARENA_HI_DEFAULT;
    default:
        ;
    }
    return NULL;
}

void *OS_GetInitArenaLo(OSArenaId arena) {
    switch (arena) {
    case OS_ARENA_MAIN:
        return (void *)OSi_MAIN_ARENA_LO_DEFAULT;
    case OS_ARENA_MAINEX:
        if (!OSi_MainArenaEnabled || (OS_GetConsoleType() & OS_CONSOLE_SIZE_MASK) == OS_CONSOLE_SIZE_4MB) {
            return NULL;
        } else {
            return (void *)OSi_MAINEX_ARENA_LO_DEFAULT;
        }
    case OS_ARENA_ITCM:
        return (void *)OSi_ITCM_ARENA_LO_DEFAULT;
    case OS_ARENA_DTCM:
        return (void *)OSi_DTCM_ARENA_LO_DEFAULT;
    case OS_ARENA_SHARED:
        return (void *)HW_SHARED_ARENA_LO_DEFAULT;
    case OS_ARENA_WRAM_MAIN:
        return (void *)OSi_WRAM_MAIN_ARENA_LO_DEFAULT;
    default:
        ;
    }
    return NULL;
}

void OS_SetArenaHi(OSArenaId arena, void *ptr) {
    OSi_GetArenaInfo().hi[arena] = ptr;
}

void OS_SetArenaLo(OSArenaId arena, void *ptr) {
    OSi_GetArenaInfo().lo[arena] = ptr;
}

void *OS_AllocFromArenaLo(OSArenaId arena, u32 size, u32 align) {
    void *ptr;
    u8 *arenaLo;

    ptr = OS_GetArenaLo(arena);
    if (ptr == NULL) {
        return NULL;
    }

    arenaLo = ptr = (void *)OSi_ROUND(ptr, align);
    arenaLo += size;
    arenaLo = (u8 *)OSi_ROUND(arenaLo, align);
    if (arenaLo > (u8 *)OS_GetArenaHi(arena)) {
        return NULL;
    }
    OS_SetArenaLo(arena, arenaLo);
    return ptr;
}

void *OS_AllocFromArenaHi(OSArenaId arena, u32 size, u32 align) {
    void *ptr;
    u8 *arenaHi;

    arenaHi = OS_GetArenaHi(arena);
    if (arenaHi == NULL) {
        return NULL;
    }

    arenaHi = (u8 *)OSi_TRUNC(arenaHi, align);
    arenaHi -= size;
    arenaHi = ptr = (void *)OSi_TRUNC(arenaHi, align);
    if (arenaHi < (u8 *)OS_GetArenaLo(arena)) {
        return NULL;
    }
    OS_SetArenaHi(arena, arenaHi);
    return ptr;
}
