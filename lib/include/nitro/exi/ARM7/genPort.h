#ifndef NITRO_EXI_GENPORT_H_
#define NITRO_EXI_GENPORT_H_

#include <nitro/hw/ARM7/io_reg.h>

typedef enum {
    EXI_GPIOIF_SERIAL = 0x0000,
    EXI_GPIOIF_UNDEF = REG_EXI_RCNT0_L_RE0_MASK,
    EXI_GPIOIF_GPIO = REG_EXI_RCNT0_L_RE1_MASK,
    EXI_GPIOIF_JOY = REG_EXI_RCNT0_L_RE1_MASK | REG_EXI_RCNT0_L_RE0_MASK
} EXIGpioIF;

void EXIi_SetBitRcnt0L(u16 mask, u16 data);
void EXIi_SelectRcnt(EXIGpioIF type);

#endif //NITRO_EXI_GENPORT_H_
