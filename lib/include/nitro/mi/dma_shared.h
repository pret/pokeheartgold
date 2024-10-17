/*
 * NOTE:
 * This file is shared between ARM9 and ARM7
 * DO NOT PUT PROC SPECIFIC CODE IN HERE
 * Thank You!
 */

/*
 * DO NOT INCLUDE THIS FILE DIRECTLY
 * Include MI_dma.h from the specific proc's lib
 */

#ifndef NITRO_MI_DMA_SHARED_H
#define NITRO_MI_DMA_SHARED_H

#define REG_MI_DMA0CNT_E_MASK 0x80000000

#define MI_DMA_ENABLE        (1UL << 31)
#define MI_DMA_IF_ENABLE     (1UL << 30)
#define MI_DMA_16BIT_BUS     (0UL << 26)
#define MI_DMA_32BIT_BUS     (1UL << 26)
#define MI_DMA_CONTINUOUS_ON (1UL << 25)
#define MI_DMA_SRC_INC       (0UL << 23)
#define MI_DMA_SRC_DEC       (1UL << 23)
#define MI_DMA_SRC_FIX       (2UL << 23)
#define MI_DMA_DEST_INC      (0UL << 21)
#define MI_DMA_DEST_DEC      (1UL << 21)
#define MI_DMA_DEST_FIX      (2UL << 21)
#define MI_DMA_DEST_RELOAD   (3UL << 21)

#define DMA_DREQ_ON       0x0800
#define DMA_START_NOW     0x0000
#define DMA_START_VBLANK  0x1000
#define DMA_START_HBLANK  0x2000
#define DMA_START_SPECIAL 0x3000

#endif // NITRO_MI_DMA_SHARED_H
