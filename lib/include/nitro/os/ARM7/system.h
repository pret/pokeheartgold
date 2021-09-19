#ifndef NITRO_OS_ARM7_SYSTEM_H
#define NITRO_OS_ARM7_SYSTEM_H

#include <nitro/os/systemCall.h>

static inline void OS_Halt(void) {
    SVC_Halt();
}

#endif //NITRO_OS_ARM7_SYSTEM_H
