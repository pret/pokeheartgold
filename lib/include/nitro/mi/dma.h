#ifndef NITRO_MI_DMA_H
#define NITRO_MI_DMA_H

#include <nitro/hw/io_reg.h>
#include <nitro/mi/dma_shared.h>
#include <nitro/os/system.h>

typedef void (*MIDmaCallback)(void *);

#define MI_DMA_MAX_NUM 3

#ifdef SDK_ARM9
#define MI_DMA_TIMING_MASK (7UL << 27)
#define MI_DMA_TIMING_CARD (5UL << 27)
#else
#define MI_DMA_TIMING_MASK (3UL << 28)
#define MI_DMA_TIMING_CARD (2UL << 28)
#endif // SDK_ARM9

#define MI_CNT_CARDRECV32(size) (MI_DMA_ENABLE | MI_DMA_TIMING_CARD | MI_DMA_SRC_FIX | MI_DMA_DEST_INC | MI_DMA_32BIT_BUS | ((size) / 4))

#define REG_ADDR_DMA0CNT       0x40000b8
#define REG_ADDR_DMA0_CLR_DATA 0x40000e0

#define MI_CNT_CLEAR32(size)    (0x85000000 | ((size) / 4))
#define MI_CNT_CLEAR32_IF(size) (0xc5000000 | ((size) / 4))
#define MI_CNT_COPY32(size)     (0x84000000 | ((size) / 4))
#define MI_CNT_COPY32_IF(size)  (0xc4000000 | ((size) / 4))
#define MI_CNT_COPY16(size)     (0x80000000 | ((size) / 2))

#define MIi_DMA_TIMING_ANY    (u32)(~0)
#define MI_DMA_TIMING_H_BLANK (2UL << 27)

#define MIi_WAIT_BEFOREDMA(dmaCntp, dmaNo)                    \
    do {                                                      \
        dmaCntp = &((vu32 *)REG_DMA0SAD_ADDR)[dmaNo * 3 + 2]; \
        while (*dmaCntp & REG_MI_DMA0CNT_E_MASK) {}           \
    } while (0)

typedef union {
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

static inline void MIi_DmaSetParams_wait_src32(u32 dmaNo, u32 data, u32 dest, u32 ctrl) {
    OSIntrMode lastIntrMode = OS_DisableInterrupts();

    MIiDmaClearSrc *scrp = (MIiDmaClearSrc *)((u32)REG_ADDR_DMA0_CLR_DATA + dmaNo * 4);
    scrp->b32            = data;
    MIi_DmaSetParams_wait_noInt(dmaNo, (u32)scrp, dest, ctrl);

    (void)OS_RestoreInterrupts(lastIntrMode);
}

static inline void MIi_DmaSetParams_src32(u32 dmaNo, u32 data, u32 dest, u32 ctrl) {
    OSIntrMode lastIntrMode = OS_DisableInterrupts();

    MIiDmaClearSrc *srcp = (MIiDmaClearSrc *)((u32)REG_ADDR_DMA0_CLR_DATA + dmaNo * 4);
    srcp->b32            = data;
    MIi_DmaSetParams_noInt(dmaNo, (u32)srcp, dest, ctrl);

    (void)OS_RestoreInterrupts(lastIntrMode);
}

static inline void MIi_CallCallback(MIDmaCallback callback, void *arg) {
    if (callback) {
        (callback)(arg);
    }
}
void MI_SendGXCommand(u32 dmaNo, const void *src, u32 commandLength);
void MI_SendGXCommandAsync(u32 dmaNo, const void *src, u32 commandLength, MIDmaCallback callback, void *arg);
void MI_SendGXCommandFast(u32 dmaNo, const void *src, u32 commandLength);
void MI_SendGXCommandAsyncFast(u32 dmaNo, const void *src, u32 commandLength, MIDmaCallback callback, void *arg);

#endif // NITRO_MI_DMA_H
