#ifndef NITRO_CARD_H
#define NITRO_CARD_H

#include "nitro_types.h"

// <nitro/card.h>
#define CARD_ROM_PAGE_SIZE (0x200)

extern void CARD_LockRom(u16 lock_id);
extern void CARD_UnlockRom(u16 lock_id);

#endif
