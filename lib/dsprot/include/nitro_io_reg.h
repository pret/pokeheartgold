#ifndef NITRO_IO_REG_H
#define NITRO_IO_REG_H

#include "nitro_types.h"

// <nitro/hw/io_reg.h>
#define HW_REG_BASE (0x04000000)

#define REG_EXMEMCNT_OFFSET      (0x204)
#define reg_MI_EXMEMCNT          (*(REGType16v *)(HW_REG_BASE + REG_EXMEMCNT_OFFSET))
#define REG_MI_EXMEMCNT_MP_MASK  (0x800)
#define REG_MI_EXMEMCNT_MP_SHIFT (11)

#define REG_A9ROM_OFFSET        (0x4000)
#define REG_SCFG_A9ROM_SEC_MASK (0x01)

#define MI_PROCESSOR_ARM9 (0)

#endif
