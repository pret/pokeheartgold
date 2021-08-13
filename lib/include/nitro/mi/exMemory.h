#ifndef NITRO_MI_EXMEMORY_H_
#define NITRO_MI_EXMEMORY_H_

#include <nitro/hw/consts.h>

typedef enum {
    MI_PROCESSOR_ARM9 = 0,
    MI_PROCESSOR_ARM7 = 1
} MIProcessor;

typedef enum
{
    MI_CTRDG_ROMCYCLE1_10 = 0,
    MI_CTRDG_ROMCYCLE1_8 = 1,
    MI_CTRDG_ROMCYCLE1_6 = 2,
    MI_CTRDG_ROMCYCLE1_18 = 3
} MICartridgeRomCycle1st;

typedef enum
{
    MI_CTRDG_ROMCYCLE2_6 = 0,
    MI_CTRDG_ROMCYCLE2_4 = 1
} MICartridgeRomCycle2nd;

typedef enum
{
    MI_CTRDG_RAMCYCLE_10 = 0,
    MI_CTRDG_RAMCYCLE_8 = 1,
    MI_CTRDG_RAMCYCLE_6 = 2,
    MI_CTRDG_RAMCYCLE_18 = 3
} MICartridgeRamCycle;

static inline void MIi_SetCardProcessor(MIProcessor proc)
{
    reg_MI_EXMEMCNT =
            (u16)((reg_MI_EXMEMCNT & ~0x0800) | (proc << 11));
}

static inline void MIi_SetCartridgeProcessor(MIProcessor proc)
{
    reg_MI_EXMEMCNT =
            (u16)((reg_MI_EXMEMCNT & ~0x0080) | (proc << 7));
}

static inline MICartridgeRomCycle1st MI_GetCartridgeRomCycle1st(void)
{
    return (MICartridgeRomCycle1st)((reg_MI_EXMEMCNT & 0xc) >> 2);
}

static inline MICartridgeRomCycle2nd MI_GetCartridgeRomCycle2nd(void)
{
    return (MICartridgeRomCycle2nd)((reg_MI_EXMEMCNT & 0x10) >> 4);
}

static inline void MI_SetCartridgeRomCycle1st(MICartridgeRomCycle1st c1)
{
    reg_MI_EXMEMCNT = (u16)((reg_MI_EXMEMCNT & ~0xc) | (c1 << 2));
}

static inline void MI_SetCartridgeRomCycle2nd(MICartridgeRomCycle2nd c2)
{
    reg_MI_EXMEMCNT = (u16)((reg_MI_EXMEMCNT & ~0x10) | (c2 << 4));
}

static inline void MI_SetCartridgeRamCycle(MICartridgeRamCycle c)
{
    reg_MI_EXMEMCNT = (u16)((reg_MI_EXMEMCNT & ~3) | (c << 0));
}

static inline MICartridgeRamCycle MI_GetCartridgeRamCycle(void)
{
    return (MICartridgeRamCycle)((reg_MI_EXMEMCNT & 3) >> 0);
}

#endif //NITRO_MI_EXMEMORY_H_
