#include <nitro.h>

u32 OSi_ContextTypeCache = OSi_CONSOLE_NOT_DETECT;

BOOL OS_IsRunOnEmulator(void) {
    // In non-retail ROMs, this would actually detect
    // the IS emulator.
    return FALSE;
}

u32 OS_GetConsoleType(void) {
    OSi_ContextTypeCache = OS_CONSOLE_NITRO | OS_CONSOLE_DEV_CARD | OS_CONSOLE_SIZE_4MB;
    return OSi_ContextTypeCache;
}
