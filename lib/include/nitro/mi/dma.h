#ifndef NITRO_MI_DMA_H_
#define NITRO_MI_DMA_H_

#include <nitro/mi/dma_shared.h>
#include <nitro/hw/io_reg.h>
#include <nitro/os/system.h>

typedef void (*MIDmaCallback)(void *);

#define MI_DMA_MAX_NUM          3

#define REG_ADDR_DMA0CNT        0x40000b8
#define REG_ADDR_DMA0_CLR_DATA  0x40000e0

#define MI_CNT_CLEAR32(size)    (0x85000000 | ((size)/4))
#define MI_CNT_CLEAR32_IF(size) (0xc5000000 | ((size)/4))
#define MI_CNT_COPY32(size)     (0x84000000 | ((size)/4))
#define MI_CNT_COPY32_IF(size)  (0xc4000000 | ((size)/4))
#define MI_CNT_COPY16(size)     (0x80000000 | ((size)/2))

#define MI_DMA_SRC_FIX          (2UL << 23)
#define MI_DMA_SRC_INC          (0UL << 23)

#define MI_DMA_16BIT_BUS        (0UL << 26)
#define MI_DMA_32BIT_BUS        (1UL << 26)

#define MIi_DMA_TIMING_ANY      (u32)(~0)
#define MI_DMA_TIMING_H_BLANK   (2UL << 27)

typedef union
{
    u32 b32;
    u16 b16;
} MIiDmaClearSrc;

void MI_DmaFill32(u32 dmaNo, void *dest, u32 data, u32 size);
void MI_DmaCopy32(u32 dmaNo, const void *src, void *dest, u32 size);
void MI_DmaCopy16(u32 dmaNo, const void *src, void *dest, u32 size);
void MI_DmaFill32Async(u32 dmaNo, void *dest, u32 data, u32 size, MIDmaCallback callback, void *arg);
void MI_DmaCopy32Async(u32 dmaNo, const void *src, void *dest, u32 size, MIDmaCallback callback, void *arg);
void MI_WaitDma(u32 dmaNo);
void MI_StopDma(u32 dmaNo);
void MIi_CheckAnotherAutoDMA(u32 dmaNo, u32 dmaType);
void MIi_CheckDma0SourceAddress(u32 dmaNo, u32 src, u32 size, u32 dir);
void MIi_DmaSetParams(u32 dmaNo, u32 src, u32 dest, u32 ctrl);
void MIi_DmaSetParams_wait(u32 dmaNo, u32 src, u32 dest, u32 ctrl);
void MIi_DmaSetParams_noInt(u32 dmaNo, u32 src, u32 dest, u32 ctrl);
void MIi_DmaSetParams_wait_noInt(u32 dmaNo, u32 src, u32 dest, u32 ctrl);

static inline void MIi_DmaSetParams_wait_src32(u32 dmaNo, u32 data, u32 dest, u32 ctrl)
{
    OSIntrMode lastIntrMode = OS_DisableInterrupts();

    MIiDmaClearSrc *scrp = (MIiDmaClearSrc *) ((u32)REG_ADDR_DMA0_CLR_DATA + dmaNo * 4);
    scrp->b32 = data;
    MIi_DmaSetParams_wait_noInt(dmaNo, (u32)scrp, dest, ctrl);

    (void)OS_RestoreInterrupts(lastIntrMode);
}

static inline void MIi_DmaSetParams_src32(u32 dmaNo, u32 data, u32 dest, u32 ctrl)
{
    OSIntrMode lastIntrMode = OS_DisableInterrupts();

    MIiDmaClearSrc *srcp = (MIiDmaClearSrc *) ((u32)REG_ADDR_DMA0_CLR_DATA + dmaNo * 4);
    srcp->b32 = data;
    MIi_DmaSetParams_noInt(dmaNo, (u32)srcp, dest, ctrl);

    (void)OS_RestoreInterrupts(lastIntrMode);
}

static inline void MIi_CallCallback(MIDmaCallback callback, void *arg)
{
    if (callback)
    {
        (callback) (arg);
    }
}

#endif //NITRO_MI_DMA_H_
