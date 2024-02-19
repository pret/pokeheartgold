/*
 * NOTE:
 * This file is shared between ARM9 and ARM7
 * DO NOT PUT PROC SPECIFIC CODE IN HERE
 * Thank You!
 */

/*
 * DO NOT INCLUDE THIS FILE DIRECTLY
 * Include OS_interrupt.h from the specific proc's lib
 */

#ifndef NITRO_OS_INTERRUPT_SHARED_H
#define NITRO_OS_INTERRUPT_SHARED_H

#include <nitro/types.h>
#include <nitro/hw/io_reg.h>

typedef u32 OSIrqMask;

typedef void (*OSIrqFunction) (void);

#define OS_IE_VBLANK        (1UL << REG_OS_IE_VB_SHIFT)
#define OS_IE_HBLANK        (1UL << REG_OS_IE_HB_SHIFT)
#define OS_IE_V_COUNT       (1UL << REG_OS_IE_VE_SHIFT)
#define OS_IE_TIMER0        (1UL << REG_OS_IE_T0_SHIFT)
#define OS_IE_TIMER1        (1UL << REG_OS_IE_T1_SHIFT)
#define OS_IE_TIMER2        (1UL << REG_OS_IE_T2_SHIFT)
#define OS_IE_TIMER3        (1UL << REG_OS_IE_T3_SHIFT)
#define OS_IE_SIO           (1UL << 7                 )
#define OS_IE_DMA0          (1UL << REG_OS_IE_D0_SHIFT)
#define OS_IE_DMA1          (1UL << REG_OS_IE_D1_SHIFT)
#define OS_IE_DMA2          (1UL << REG_OS_IE_D2_SHIFT)
#define OS_IE_DMA3          (1UL << REG_OS_IE_D3_SHIFT)
#define OS_IE_KEY           (1UL << REG_OS_IE_K_SHIFT)
#define OS_IE_CARTRIDGE     (1UL << REG_OS_IE_I_D_SHIFT)
#define OS_IE_SUBP          (1UL << REG_OS_IE_A7_SHIFT)
#define OS_IE_SPFIFO_SEND   (1UL << REG_OS_IE_IFE_SHIFT)
#define OS_IE_SPFIFO_RECV   (1UL << REG_OS_IE_IFN_SHIFT)
#define OS_IE_CARD_DATA     (1UL << REG_OS_IE_MC_SHIFT)
#define OS_IE_CARD_IREQ     (1UL << REG_OS_IE_MI_SHIFT)

typedef struct
{
    void (*func) (void *);
    u32 enable;
    void* arg;
} OSIrqCallbackInfo;

static inline OSIrqMask OS_GetRequestIrqMask(void) {
    return reg_OS_IF;
}

#endif //NITRO_OS_INTERRUPT_SHARED_H
