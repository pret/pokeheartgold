#ifndef NITRO_OS_COMMON_ARMARCH_H_
#define NITRO_OS_COMMON_ARMARCH_H_

#define HW_PSR_CPU_MODE_MASK       0x1f

#define HW_PSR_USER_MODE           0x10
#define HW_PSR_FIQ_MODE            0x11
#define HW_PSR_IRQ_MODE            0x12
#define HW_PSR_SVC_MODE            0x13
#define HW_PSR_ABORT_MODE          0x17
#define HW_PSR_UNDEF_MODE          0x1b
#define HW_PSR_SYS_MODE            0x1f

#define HW_PSR_ARM_STATE           0x0
#define HW_PSR_THUMB_STATE         0x20

#define HW_PSR_FIQ_DISABLE         0x40
#define HW_PSR_IRQ_DISABLE         0x80
#define HW_PSR_IRQ_FIQ_DISABLE     0xc0

#define HW_PSR_Q_FLAG              0x08000000
#define HW_PSR_V_FLAG              0x10000000
#define HW_PSR_C_FLAG              0x20000000
#define HW_PSR_Z_FLAG              0x40000000
#define HW_PSR_N_FLAG              0x80000000

#define HW_C7_ICACHE_INDEX_MASK    0x00000fe0
#define HW_C7_DCACHE_INDEX_MASK    0x000003e0
#define HW_C7_CACHE_SET_NO_MASK    0xc0000000

#define HW_C7_CACHE_INDEX_SHIFT    5
#define HW_C7_CACHE_SET_NO_SHIFT   30

#define HW_CPU_CLOCK_ARM7           33513982
#define HW_CPU_CLOCK_ARM9           67027964

#endif //NITRO_OS_COMMON_ARMARCH_H_
