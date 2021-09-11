#ifndef POKEDIAMOND_ARM7_OS_SYSTEM_H
#define POKEDIAMOND_ARM7_OS_SYSTEM_H

#include "nitro/types.h"
#include "consts.h"
#include "nitro/OS_system_shared.h"

OSIntrMode OS_EnableInterrupts(void);
OSIntrMode OS_DisableInterrupts(void);
OSIntrMode OS_RestoreInterrupts(OSIntrMode state);
OSIntrMode OS_DisableInterrupts_IrqAndFiq(void);
OSIntrMode OS_RestoreInterrupts_IrqAndFiq(OSIntrMode state);
OSProcMode OS_GetProcMode(void);
void OS_SpinWait(u32 cycle);

#endif //POKEDIAMOND_ARM7_OS_SYSTEM_H
