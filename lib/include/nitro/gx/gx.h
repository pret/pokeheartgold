#ifndef NITRO_GX_GX_H_
#define NITRO_GX_GX_H_

#include <nitro/hw/io_reg.h>

typedef enum {
    GX_DISPMODE_GRAPHICS = 0x01,
    GX_DISPMODE_VRAM_A = 0x02,
    GX_DISPMODE_VRAM_B = 0x06,
    GX_DISPMODE_VRAM_C = 0x0a,
    GX_DISPMODE_VRAM_D = 0x0e,
    GX_DISPMODE_MMEM = 0x03
} GXDispMode;

typedef enum {
    GX_BGMODE_0 = 0,
    GX_BGMODE_1 = 1,
    GX_BGMODE_2 = 2,
    GX_BGMODE_3 = 3,
    GX_BGMODE_4 = 4,
    GX_BGMODE_5 = 5,
    GX_BGMODE_6 = 6
} GXBGMode;

typedef enum {
    GX_BG0_AS_2D = 0,
    GX_BG0_AS_3D = 1
} GXBG0As;

typedef enum {
    GX_BGSCROFFSET_0x00000 = 0x00,
    GX_BGSCROFFSET_0x10000 = 0x01,
    GX_BGSCROFFSET_0x20000 = 0x02,
    GX_BGSCROFFSET_0x30000 = 0x03,
    GX_BGSCROFFSET_0x40000 = 0x04,
    GX_BGSCROFFSET_0x50000 = 0x05,
    GX_BGSCROFFSET_0x60000 = 0x06,
    GX_BGSCROFFSET_0x70000 = 0x07
} GXBGScrOffset;

typedef enum {
    GX_BGCHAROFFSET_0x00000 = 0x00,
    GX_BGCHAROFFSET_0x10000 = 0x01,
    GX_BGCHAROFFSET_0x20000 = 0x02,
    GX_BGCHAROFFSET_0x30000 = 0x03,
    GX_BGCHAROFFSET_0x40000 = 0x04,
    GX_BGCHAROFFSET_0x50000 = 0x05,
    GX_BGCHAROFFSET_0x60000 = 0x06,
    GX_BGCHAROFFSET_0x70000 = 0x07
} GXBGCharOffset;

typedef enum {
    GX_OBJVRAMMODE_CHAR_2D = (0 << REG_GX_DISPCNT_OBJMAP_SHIFT) | (0 << REG_GX_DISPCNT_EXOBJ_SHIFT),
    GX_OBJVRAMMODE_CHAR_1D_32K =
    (1 << REG_GX_DISPCNT_OBJMAP_SHIFT) | (0 << REG_GX_DISPCNT_EXOBJ_SHIFT),
    GX_OBJVRAMMODE_CHAR_1D_64K =
    (1 << REG_GX_DISPCNT_OBJMAP_SHIFT) | (1 << REG_GX_DISPCNT_EXOBJ_SHIFT),
    GX_OBJVRAMMODE_CHAR_1D_128K =
    (1 << REG_GX_DISPCNT_OBJMAP_SHIFT) | (2 << REG_GX_DISPCNT_EXOBJ_SHIFT),
    GX_OBJVRAMMODE_CHAR_1D_256K =
    (1 << REG_GX_DISPCNT_OBJMAP_SHIFT) | (3 << REG_GX_DISPCNT_EXOBJ_SHIFT)
} GXOBJVRamModeChar;

void GX_SetGraphicsMode(GXDispMode dispMode, GXBGMode bgMode, GXBG0As bg0_2d3d);
void GXS_SetGraphicsMode(GXBGMode bgMode);

static inline s32 GX_GetVCount() {
    return reg_GX_VCOUNT;
}

static inline s32 GX_GetVCountEqVal(void) {
    u16 val = reg_GX_DISPSTAT;
    return ((val >> 8) & 0x00ff) | ((val << 1) & 0x0100);
}

static inline void GX_VCountEqIntr(BOOL enable) {
    if (enable) {
        reg_GX_DISPSTAT |= REG_GX_DISPSTAT_VQI_MASK;
    } else {
        reg_GX_DISPSTAT &= ~REG_GX_DISPSTAT_VQI_MASK;
    }
}

static inline void GX_SetVCountEqVal(s32 val) {
    reg_GX_DISPSTAT = (u16)(reg_GX_DISPSTAT & (REG_GX_DISPSTAT_VBLK_MASK | REG_GX_DISPSTAT_HBLK_MASK | REG_GX_DISPSTAT_LYC_MASK | REG_GX_DISPSTAT_VBI_MASK | REG_GX_DISPSTAT_HBI_MASK | REG_GX_DISPSTAT_VQI_MASK) | ((val & 0xFF) << 8) | ((val & 0x100) >> 1));
}

static inline void GX_SetBGScrOffset(GXBGScrOffset offset)
{
    reg_GX_DISPCNT = (u32)((reg_GX_DISPCNT & ~REG_GX_DISPCNT_BGSCREENOFFSET_MASK) |
                           (offset << REG_GX_DISPCNT_BGSCREENOFFSET_SHIFT));
}

static inline void GX_SetBGCharOffset(GXBGCharOffset offset) {
    reg_GX_DISPCNT = (u32)((reg_GX_DISPCNT & ~REG_GX_DISPCNT_BGCHAROFFSET_MASK) |
                           (offset << REG_GX_DISPCNT_BGCHAROFFSET_SHIFT));
}


#endif //NITRO_GX_GX_H_
