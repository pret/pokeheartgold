#ifndef POKEHEARTGOLD_RENDER_WINDOW_H
#define POKEHEARTGOLD_RENDER_WINDOW_H

#include "bg_window.h"

typedef struct WaitingIcon WaitingIcon; //todo: copy from pokediamond
struct PokepicManager;

void LoadUserFrameGfx1(BgConfig* bg_config, enum GFBgLayer layer, u16 baseTile, u8 palette_num, u8 frame, HeapID heapId);
void DrawFrameAndWindow1(Window* window, BOOL dont_copy_to_vram, u16 baseTile, u8 palette_num);
void LoadUserFrameGfx2(BgConfig *bgConfig, enum GFBgLayer layer, u16 baseTile, u8 paletteNum, u8 frame, HeapID heapId);
void DrawFrameAndWindow2(Window *window, BOOL dont_copy_to_vram, u16 baseTile, u8 palette_num);
void ClearFrameAndWindow2(Window *window, BOOL dont_copy_to_vram);
void sub_0200E5D4(Window *window, BOOL dont_copy_to_vram);
WaitingIcon *WaitingIcon_New(Window *window, u16 tileNum);
void sub_0200F450(WaitingIcon *waitingIcon);
struct PokepicManager *DrawPokemonPicFromSpecies(BgConfig *bgConfig, enum GFBgLayer layer, int x, int y, u8 paletteNum, u16 baseTile, u16 species, u8 gender, HeapID heapId);
struct PokepicManager *DrawPokemonPicFromMon(BgConfig *bgConfig, enum GFBgLayer layer, int x, int y, u8 paletteNum, u16 baseTile, Pokemon *mon, HeapID heapId);

#endif //POKEHEARTGOLD_RENDER_WINDOW_H
