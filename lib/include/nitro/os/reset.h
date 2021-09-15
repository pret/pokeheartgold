#ifndef NITRO_OS_RESET_H
#define NITRO_OS_RESET_H

#include <nitro/types.h>
#include <nitro/os/reset_shared.h>
#include <nitro/pxi/fifo.h>

void OS_InitReset(void);
BOOL OS_IsResetOccurred(void);
static void OSi_CommonCallback(PXIFifoTag tag, u32 data, BOOL err);
static void OSi_SendToPxi(u16 data);
void OS_ResetSystem(void);

#endif //NITRO_OS_RESET_H
