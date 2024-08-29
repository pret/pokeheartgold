#ifndef POKEHEARTGOLD_CONSTANTS_SDK_EXTRAS_H
#define POKEHEARTGOLD_CONSTANTS_SDK_EXTRAS_H

// Header for constants that play the role of SDK defines but are not actually provided by any SDK
// Any define that should be typed, must be gated behind defined(PM_ASM)

// alias
#ifndef PM_ASM
#include <nnsys.h>
// NNS_G2D_VRAM_TYPE_3DMAIN
#define NNS_G2D_VRAM_TYPE_NEITHER ((NNS_G2D_VRAM_TYPE)0)
// NNS_G2D_VRAM_TYPE_MAX
#define NNS_G2D_VRAM_TYPE_2DBOTH ((NNS_G2D_VRAM_TYPE)(NNS_G2D_VRAM_TYPE_2DMAIN | NNS_G2D_VRAM_TYPE_2DSUB))
#endif // PM_ASM

#endif // POKEHEARTGOLD_CONSTANTS_SDK_EXTRAS_H
