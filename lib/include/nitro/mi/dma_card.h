#ifndef NITRO_MI_DMA_CARD_H
#define NITRO_MI_DMA_CARD_H

#include "nitro/types.h"

void MIi_CardDmaCopy32(u32 dmaNo, const void *src, void *dest, u32 size);

#endif // NITRO_MI_DMA_CARD_H
