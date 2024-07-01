#ifndef NITRO_MI_EXMEMORY_H_
#define NITRO_MI_EXMEMORY_H_

#include <nitro/hw/consts.h>

#ifdef SDK_ARM7
#define reg_MI_EXMEMCNT              reg_MI_EXMEMCNT_L

#define REG_MI_EXMEMCNT_EP_SHIFT     REG_MI_EXMEMCNT_L_EP_SHIFT
#define REG_MI_EXMEMCNT_EP_SIZE      REG_MI_EXMEMCNT_L_EP_SIZE
#define REG_MI_EXMEMCNT_EP_MASK      REG_MI_EXMEMCNT_L_EP_MASK

#define REG_MI_EXMEMCNT_MP_SHIFT     REG_MI_EXMEMCNT_L_MP_SHIFT
#define REG_MI_EXMEMCNT_MP_SIZE      REG_MI_EXMEMCNT_L_MP_SIZE
#define REG_MI_EXMEMCNT_MP_MASK      REG_MI_EXMEMCNT_L_MP_MASK

#define REG_MI_EXMEMCNT_CP_SHIFT     REG_MI_EXMEMCNT_L_CP_SHIFT
#define REG_MI_EXMEMCNT_CP_SIZE      REG_MI_EXMEMCNT_L_CP_SIZE
#define REG_MI_EXMEMCNT_CP_MASK      REG_MI_EXMEMCNT_L_CP_MASK

#define REG_MI_EXMEMCNT_PHI_SHIFT    REG_MI_EXMEMCNT_L_PHI_SHIFT
#define REG_MI_EXMEMCNT_PHI_SIZE     REG_MI_EXMEMCNT_L_PHI_SIZE
#define REG_MI_EXMEMCNT_PHI_MASK     REG_MI_EXMEMCNT_L_PHI_MASK

#define REG_MI_EXMEMCNT_ROM2nd_SHIFT REG_MI_EXMEMCNT_L_ROM2nd_SHIFT
#define REG_MI_EXMEMCNT_ROM2nd_SIZE  REG_MI_EXMEMCNT_L_ROM2nd_SIZE
#define REG_MI_EXMEMCNT_ROM2nd_MASK  REG_MI_EXMEMCNT_L_ROM2nd_MASK

#define REG_MI_EXMEMCNT_ROM1st_SHIFT REG_MI_EXMEMCNT_L_ROM1st_SHIFT
#define REG_MI_EXMEMCNT_ROM1st_SIZE  REG_MI_EXMEMCNT_L_ROM1st_SIZE
#define REG_MI_EXMEMCNT_ROM1st_MASK  REG_MI_EXMEMCNT_L_ROM1st_MASK

#define REG_MI_EXMEMCNT_RAM_SHIFT    REG_MI_EXMEMCNT_L_RAM_SHIFT
#define REG_MI_EXMEMCNT_RAM_SIZE     REG_MI_EXMEMCNT_L_RAM_SIZE
#define REG_MI_EXMEMCNT_RAM_MASK     REG_MI_EXMEMCNT_L_RAM_MASK
#endif // SDK_ARM7

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

#ifdef SDK_ARM9
static inline void MIi_SetCardProcessor(MIProcessor proc)
{
    reg_MI_EXMEMCNT =
            (u16)((reg_MI_EXMEMCNT & ~REG_MI_EXMEMCNT_MP_MASK) | (proc << REG_MI_EXMEMCNT_MP_SHIFT));
}
#endif //SDK_ARM9

#ifdef SDK_ARM9
static inline void MIi_SetCartridgeProcessor(MIProcessor proc)
{
    reg_MI_EXMEMCNT =
            (u16)((reg_MI_EXMEMCNT & ~REG_MI_EXMEMCNT_CP_MASK) | (proc << REG_MI_EXMEMCNT_CP_SHIFT));
}
#endif //SDK_ARM9

static inline MICartridgeRomCycle1st MI_GetCartridgeRomCycle1st(void)
{
    return (MICartridgeRomCycle1st)((reg_MI_EXMEMCNT & REG_MI_EXMEMCNT_ROM1st_MASK) >> REG_MI_EXMEMCNT_ROM1st_SHIFT);
}

static inline MICartridgeRomCycle2nd MI_GetCartridgeRomCycle2nd(void)
{
    return (MICartridgeRomCycle2nd)((reg_MI_EXMEMCNT & REG_MI_EXMEMCNT_ROM2nd_MASK) >> REG_MI_EXMEMCNT_ROM2nd_SHIFT);
}

#ifdef SDK_ARM9
static inline void MI_SetCartridgeRomCycle1st(MICartridgeRomCycle1st c1) {
    reg_MI_EXMEMCNT = (u16)((reg_MI_EXMEMCNT & ~REG_MI_EXMEMCNT_ROM1st_MASK) | (c1 << REG_MI_EXMEMCNT_ROM1st_SHIFT));
}
#endif //SDK_ARM9

#ifdef SDK_ARM9
static inline void MI_SetCartridgeRomCycle2nd(MICartridgeRomCycle2nd c2) {
    reg_MI_EXMEMCNT = (u16)((reg_MI_EXMEMCNT & ~REG_MI_EXMEMCNT_ROM2nd_MASK) | (c2 << REG_MI_EXMEMCNT_ROM2nd_SHIFT));
}
#endif //SDK_ARM9

#ifdef SDK_ARM9
static inline void MI_SetCartridgeRamCycle(MICartridgeRamCycle c) {
    reg_MI_EXMEMCNT = (u16)((reg_MI_EXMEMCNT & ~REG_MI_EXMEMCNT_RAM_MASK) | (c << REG_MI_EXMEMCNT_RAM_SHIFT));
}
#endif //SDK_ARM9

static inline MICartridgeRamCycle MI_GetCartridgeRamCycle(void)
{
    return (MICartridgeRamCycle)((reg_MI_EXMEMCNT & REG_MI_EXMEMCNT_RAM_MASK) >> REG_MI_EXMEMCNT_RAM_SHIFT);
}

#endif //NITRO_MI_EXMEMORY_H_
