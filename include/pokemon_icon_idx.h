#ifndef POKEHEARTGOLD_POKEMON_ICON_IDX_H
#define POKEHEARTGOLD_POKEMON_ICON_IDX_H

#include "pokemon_types_def.h"

u32 Boxmon_GetIconNaix(BOXMON *boxmon);
u32 Pokemon_GetIconNaix(POKEMON *pokemon);
u32 GetMonIconNaixEx(u32 species, BOOL isEgg, u32 forme);
u32 GetBattleMonIconNaixEx(u32 species, BOOL isEgg, u32 forme);
const u8 GetMonIconPaletteEx(u32 species, u32 forme, u32 isEgg);
const u8 GetBattleMonIconPaletteEx(u32 species, u32 forme, BOOL isEgg);
const u8 Boxmon_GetIconPalette(BOXMON *boxmon);
const u8 Pokemon_GetIconPalette(POKEMON *pokemon);
u32 sub_02074490(void);
u32 sub_02074494(void);
u32 sub_02074498(void);
u32 sub_0207449C(void);
u32 sub_020744A0(void);
u32 sub_020744A4(void);
u32 sub_020744A8(void);

#endif //POKEHEARTGOLD_POKEMON_ICON_IDX_H
