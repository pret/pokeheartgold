#ifndef POKEHEARTGOLD_POKEMON_ICON_IDX_H
#define POKEHEARTGOLD_POKEMON_ICON_IDX_H

#include "pokemon_types_def.h"

u32 sub_02074170(BOXMON *boxmon);
u32 Pokemon_GetIconNaix(POKEMON *pokemon);
u32 sub_020741BC(u32 species, BOOL isEgg, u32 forme);
u32 sub_02074274(u32 species, BOOL isEgg, u32 forme);
u16 sub_020742CC(BOXMON *boxmon);
const u8 GetMonIconPaletteEx(u32 species, u32 forme, u32 isEgg);
const u8 sub_0207440C(u32 species, u32 forme, BOOL isEgg);
const u8 sub_02074444(BOXMON *boxmon);
const u8 sub_02074484(POKEMON *pokemon);
u32 sub_02074490(void);
u32 sub_02074494(void);
u32 sub_02074498(void);
u32 sub_0207449C(void);
u32 sub_020744A0(void);
u32 sub_020744A4(void);
u32 sub_020744A8(void);

#endif //POKEHEARTGOLD_POKEMON_ICON_IDX_H
