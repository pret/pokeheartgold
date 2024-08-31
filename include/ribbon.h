#ifndef POKEHEARTGOLD_RIBBON_H
#define POKEHEARTGOLD_RIBBON_H

#include "global.h"

typedef enum {
    RIBBONDAT_MONDATNO,
    RIBBONDAT_NCGR,
    RIBBONDAT_NCLR,
    RIBBONDAT_NAMEGMM,
    RIBBONDAT_DESCGMM,
} RibbonAttr;

u32 GetRibbonAttr(u8 ribbon, RibbonAttr attr);
int GetRibbonDescGmm(const u8 *a0, u8 ribbon);
u8 GetSpecialRibbonNo(u8 ribbon);

#endif // POKEHEARTGOLD_RIBBON_H
