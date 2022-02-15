#ifndef NITRO_OS_RESET_H
#define NITRO_OS_RESET_H

#include <nitro/types.h>
#include <nitro/os/common/reset_shared.h>
#include <nitro/pxi/fifo.h>

void OS_InitReset(void);
BOOL OS_IsResetOccurred(void);
void OSi_CommonCallback(PXIFifoTag tag, u32 data, BOOL err);
void OSi_SendToPxi(u16 data);

#ifdef SDK_ARM9
void OS_ResetSystem(u32 parameter);

static inline u32 OS_GetResetParameter(void) {
    return *(u32 *)HW_RESET_PARAMETER_BUF;
}
#else
void OS_ResetSystem(void);
#endif

#endif //NITRO_OS_RESET_H
