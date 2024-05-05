#ifndef NITRO_PAD_PAD_H_
#define NITRO_PAD_PAD_H_

#include <nitro/hw/mmap_shared.h>
#include <nitro/hw/io_reg.h>

#define PAD_PLUS_KEY_MASK       0x00f0
#define PAD_BUTTON_MASK         0x2f0f
#define PAD_DEBUG_BUTTON_MASK   0x2000
#define PAD_ALL_MASK            0x2fff
#define PAD_RCNTPORT_MASK       0x2c00
#define PAD_KEYPORT_MASK        0x03ff

#define PAD_DETECT_FOLD_MASK    0x8000

#define PAD_BUTTON_A            0x0001
#define PAD_BUTTON_B            0x0002
#define PAD_BUTTON_SELECT       0x0004
#define PAD_BUTTON_START        0x0008
#define PAD_KEY_RIGHT           0x0010
#define PAD_KEY_LEFT            0x0020
#define PAD_KEY_UP              0x0040
#define PAD_KEY_DOWN            0x0080
#define PAD_BUTTON_R            0x0100
#define PAD_BUTTON_L            0x0200
#define PAD_BUTTON_X            0x0400
#define PAD_BUTTON_Y            0x0800
#define PAD_BUTTON_DEBUG        0x2000

static inline u16 PAD_Read(void) {
    return (u16)(((reg_PAD_KEYINPUT | *(vu16 *)HW_BUTTON_XY_BUF) ^
                  (PAD_PLUS_KEY_MASK | PAD_BUTTON_MASK)) & (PAD_PLUS_KEY_MASK | PAD_BUTTON_MASK));
}

static inline BOOL PAD_DetectFold(void) {
    return (BOOL)((*(vu16 *)HW_BUTTON_XY_BUF & PAD_DETECT_FOLD_MASK) >> 15);
}

#endif //NITRO_PAD_PAD_H_
