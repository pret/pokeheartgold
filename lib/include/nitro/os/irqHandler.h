#ifndef NITRO_OS_IRQHANDLER_H
#define NITRO_OS_IRQHANDLER_H

#include <nitro/os/common/interrupt_shared.h>

void OS_IrqHandler(register OSIrqMask irq);
void OS_IrqHandler_ThreadSwitch(void);

#endif //NITRO_OS_IRQHANDLER_H
