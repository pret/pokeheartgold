#ifndef POKEHEARTGOLD_POKEMON_ICON_IDX_H
#define POKEHEARTGOLD_POKEMON_ICON_IDX_H

#include "pokemon_types_def.h"

u32 Boxmon_GetIconNaix(BoxPokemon *boxMon);
u32 Pokemon_GetIconNaix(Pokemon *mon);
u32 GetMonIconNaixEx(u32 species, BOOL isEgg, u32 form);
u32 GetBattleMonIconNaixEx(u32 species, BOOL isEgg, u32 form);
const u8 GetMonIconPaletteEx(u32 species, u32 form, u32 isEgg);
const u8 GetBattleMonIconPaletteEx(u32 species, u32 form, BOOL isEgg);
const u8 Boxmon_GetIconPalette(BoxPokemon *boxMon);
const u8 Pokemon_GetIconPalette(Pokemon *mon);
u32 sub_02074490(void);
u32 sub_02074494(void);
u32 sub_02074498(void);
u32 sub_0207449C(void);
u32 sub_020744A0(void);
u32 sub_020744A4(void);
u32 sub_020744A8(void);

#endif // POKEHEARTGOLD_POKEMON_ICON_IDX_H
