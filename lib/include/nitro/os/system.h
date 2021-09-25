#ifndef NITRO_OS_SYSTEM_H_
#define NITRO_OS_SYSTEM_H_

#include <nitro/types.h>
#include <nitro/hw/io_reg.h>
#include <nitro/os/common/system_shared.h>
#include <nitro/os/common/armArch.h>

#ifdef SDK_ARM9
#include <nitro/os/ARM9/system.h>
#else
#include <nitro/os/ARM7/system.h>
#endif //SDK_ARM9

OSIntrMode OS_EnableInterrupts(void);
OSIntrMode OS_DisableInterrupts(void);
OSIntrMode OS_RestoreInterrupts(OSIntrMode state);
OSIntrMode OS_DisableInterrupts_IrqAndFiq(void);
OSIntrMode OS_RestoreInterrupts_IrqAndFiq(OSIntrMode state);
OSIntrMode_Irq OS_GetCpsrIrq(void);
OSProcMode OS_GetProcMode(void);
void OS_SpinWait(u32 cycles);
void OS_WaitVBlankIntr(void);

#endif //NITRO_OS_SYSTEM_H_
