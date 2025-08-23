#ifndef POKEHEARTGOLD_RENDER_WINDOW_H
#define POKEHEARTGOLD_RENDER_WINDOW_H

#include "bg_window.h"
#include "pokemon_types_def.h"

typedef struct WaitingIcon WaitingIcon; // todo: copy from pokediamond
struct PokepicManager;

void LoadUserFrameGfx1(BgConfig *bg_config, GFBgLayer layer, u16 baseTile, u8 palette_num, u8 frame, HeapID heapId);
void DrawFrameAndWindow1(Window *window, BOOL dont_copy_to_vram, u16 baseTile, u8 palette_num);
void LoadUserFrameGfx2(BgConfig *bgConfig, GFBgLayer layer, u16 baseTile, u8 paletteNum, u8 frame, HeapID heapId);
void DrawFrameAndWindow2(Window *window, BOOL dont_copy_to_vram, u16 baseTile, u8 palette_num);
void ClearFrameAndWindow2(Window *window, BOOL dont_copy_to_vram);
void sub_0200E5D4(Window *window, BOOL dont_copy_to_vram);
WaitingIcon *WaitingIcon_New(Window *window, u16 tileNum);
void sub_0200F450(WaitingIcon *waitingIcon);
struct PokepicManager *DrawPokemonPicFromSpecies(BgConfig *bgConfig, GFBgLayer layer, int x, int y, u8 paletteNum, u16 baseTile, u16 species, u8 gender, HeapID heapId);
struct PokepicManager *DrawPokemonPicFromMon(BgConfig *bgConfig, GFBgLayer layer, int x, int y, u8 paletteNum, u16 baseTile, Pokemon *mon, HeapID heapId);
void sub_0200E398(BgConfig *bgConfig, u32 a1, u32 a2, u32 a3, HeapID heapId);
u32 sub_0200E3D8(void);
void sub_0200EB68(Window *window, int a1);

#endif // POKEHEARTGOLD_RENDER_WINDOW_H
