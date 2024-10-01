#ifndef POKEHEARTGOLD_MI_DMA_CARD_H
#define POKEHEARTGOLD_MI_DMA_CARD_H

#include "nitro/types.h"

void MIi_CardDmaCopy32(u32 dmaNo, const void *src, void *dest, u32 size);

#endif // POKEHEARTGOLD_MI_DMA_CARD_H
