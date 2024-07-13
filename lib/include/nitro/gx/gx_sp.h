#ifndef NITRO_GX_GX_SP_H_
#define NITRO_GX_GX_SP_H_

#include <nitro/hw/io_reg.h>

#ifdef __cplusplus
extern "C" {
#endif

static inline s32 GX_GetVCount(){
    return reg_GX_VCOUNT;
}

static inline void GX_SetVCountEqVal(s32 val) {
    reg_GX_DISPSTAT = (u16)((reg_GX_DISPSTAT & (REG_GX_DISPSTAT_VBLK_MASK |
                                                REG_GX_DISPSTAT_HBLK_MASK |
                                                REG_GX_DISPSTAT_LYC_MASK |
                                                REG_GX_DISPSTAT_VBI_MASK |
                                                REG_GX_DISPSTAT_HBI_MASK |
                                                REG_GX_DISPSTAT_VQI_MASK)) |
                            ((val & 0xff) << 8) | ((val & 0x100) >> 1));
}

static inline void GX_VCountEqIntr(BOOL enable) {
    if (enable) {
        reg_GX_DISPSTAT |= REG_GX_DISPSTAT_VQI_MASK;
    } else {
        reg_GX_DISPSTAT &= ~REG_GX_DISPSTAT_VQI_MASK;
    }
}

static inline s32 GX_GetVCountEqVal(void) {
    u16 val = reg_GX_DISPSTAT;
    return ((val >> 8) & 0x00ff) | ((val << 1) & 0x0100);
}

#ifdef __cplusplus
}
#endif

#endif //NITRO_GX_GX_SP_H_
