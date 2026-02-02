#ifndef DSPROT_SDK_H
#define DSPROT_SDK_H

#ifdef SDK_TWL

// Use Twl SDK if available
#include <twl.h>

#else // SDK_TWL

// Else use Nitro and add back in the needed Twl SDK defs
#include <nitro.h>

// Twl SDK only
#ifndef REG_A9ROM_OFFSET
#define REG_A9ROM_OFFSET (0x4000)
#endif // REG_A9ROM_OFFSET

#ifndef REG_SCFG_A9ROM_SEC_MASK
#define REG_SCFG_A9ROM_SEC_MASK (0x01)
#endif // REG_SCFG_A9ROM_SEC_MASK

#endif // SDK_TWL


// Not included in all SDK versions, regardless of Nitro/Twl
// Ensure they are defined
#ifndef CARDMST_ENABLE
#define CARDMST_ENABLE (0x80)
#endif // CARDMST_ENABLE

#ifndef CARD_DATA_READY
#define CARD_DATA_READY (0x00800000)
#endif // CARD_DATA_READY

#ifndef CARD_COMMAND_PAGE
#define CARD_COMMAND_PAGE (0x01000000)
#endif // CARD_COMMAND_PAGE

#ifndef CARD_COMMAND_MASK
#define CARD_COMMAND_MASK (0x07000000)
#endif // CARD_COMMAND_MASK

#ifndef CARD_RESET_HI
#define CARD_RESET_HI (0x20000000)
#endif // CARD_RESET_HI

#ifndef CARD_READ_MODE
#define CARD_READ_MODE (0x00000000)
#endif // CARD_READ_MODE

#ifndef CARD_START
#define CARD_START (0x80000000)
#endif // CARD_START

#ifndef MROMOP_G_READ_PAGE
#define MROMOP_G_READ_PAGE (0xB7000000)
#endif // MROMOP_G_READ_PAGE

#endif // DSPROT_SDK_H
