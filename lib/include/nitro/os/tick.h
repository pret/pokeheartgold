#ifndef NITRO_OS_TICK_H
#define NITRO_OS_TICK_H

#include <nitro/os/common/tick_shared.h>

void OS_InitTick(void);
BOOL OS_IsTickAvailable(void);
void OSi_CountUpTick(void);
OSTick OS_GetTick(void);
u16 OS_GetTickLo(void);
void OS_SetTick(OSTick tick);

extern vu64 OSi_TickCounter;

#endif //NITRO_OS_TICK_H
