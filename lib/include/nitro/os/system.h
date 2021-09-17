#ifndef NITRO_OS_SYSTEM_H_
#define NITRO_OS_SYSTEM_H_

#include <nitro/hw/io_reg.h>
#include <nitro/os/common/system_shared.h>

OSIntrMode OS_EnableInterrupts(void);
OSIntrMode OS_DisableInterrupts(void);
OSIntrMode OS_RestoreInterrupts(OSIntrMode state);
OSIntrMode OS_DisableInterrupts_IrqAndFiq(void);
OSIntrMode OS_RestoreInterrupts_IrqAndFiq(OSIntrMode state);
OSIntrMode OS_GetCpsrIrq(void);
OSProcMode OS_GetProcMode(void);
void OS_SpinWait(u32 cycles);
void OS_WaitVBlankIntr(void);

#endif //NITRO_OS_SYSTEM_H_
