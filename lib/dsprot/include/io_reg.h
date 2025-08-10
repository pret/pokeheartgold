#ifndef IO_REG_H
#define IO_REG_H

// Nitro defs
// <nitro/hw/io_reg.h>
#define HW_REG_BASE  (0x04000000)
#define REG_EXMEMCNT_OFFSET  (0x204)
#define reg_MI_EXMEMCNT  (*(REGType16v *)(HW_REG_BASE + REG_EXMEMCNT_OFFSET))
#define REG_MI_EXMEMCNT_MP_MASK  (0x800)

#endif
