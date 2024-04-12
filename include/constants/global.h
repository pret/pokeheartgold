#ifndef POKEHEARTGOLD_CONSTANTS_GLOBAL_H
#define POKEHEARTGOLD_CONSTANTS_GLOBAL_H

#include "constants/gx.h"
#include "constants/charcode.h"
#include "constants/global.fieldmap.h"

#define PLAYER_NAME_LENGTH      7
#define POKEMON_NAME_LENGTH     10

#define PLAYER_GENDER_MALE       0
#define PLAYER_GENDER_FEMALE     1

#define PARTY_SIZE 6

// alias
#ifndef PM_ASM
// NNS_G2D_VRAM_TYPE_3DMAIN
#define NNS_G2D_VRAM_TYPE_NEITHER   ((NNS_G2D_VRAM_TYPE)0)
// NNS_G2D_VRAM_TYPE_MAX
#define NNS_G2D_VRAM_TYPE_BOTH      ((NNS_G2D_VRAM_TYPE)(NNS_G2D_VRAM_TYPE_2DMAIN|NNS_G2D_VRAM_TYPE_2DSUB))
#endif //PM_ASM

// move this to msl header?
#define S16_MAX                 32767
#define U32_MAX                 4294967292

#endif //POKEHEARTGOLD_CONSTANTS_GLOBAL_H
