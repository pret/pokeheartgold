#ifndef POKEHEARTGOLD_RENDER_WINDOW_H
#define POKEHEARTGOLD_RENDER_WINDOW_H

#include "window.h"

typedef struct WaitingIcon WaitingIcon; //todo: copy from pokediamond
struct PokepicManager;

void LoadUserFrameGfx1(BGCONFIG* bg_config, enum GFBgLayer layer, u16 baseTile, u8 palette_num, u8 frame, HeapID heap_id);
void DrawFrameAndWindow1(WINDOW* window, BOOL dont_copy_to_vram, u16 baseTile, u8 palette_num);
void LoadUserFrameGfx2(BGCONFIG *bgConfig, enum GFBgLayer layer, u16 baseTile, u8 paletteNum, u8 frame, HeapID heapId);
void DrawFrameAndWindow2(WINDOW *window, BOOL dont_copy_to_vram, u16 baseTile, u8 palette_num);
void ClearFrameAndWindow2(WINDOW *window, BOOL dont_copy_to_vram);
void sub_0200E5D4(WINDOW *window, BOOL dont_copy_to_vram);
WaitingIcon *WaitingIcon_new(WINDOW *window, u16 tileNum);
void sub_0200F450(WaitingIcon *waitingIcon);
struct PokepicManager *sub_0200F4A0(BGCONFIG *bgConfig, enum GFBgLayer layer, int x, int y, u8 paletteNum, u16 baseTile, u16 species, u8 gender, HeapID heapId);
struct PokepicManager *sub_0200F4F8(BGCONFIG *bgConfig, enum GFBgLayer layer, int x, int y, u8 paletteNum, u16 baseTile, POKEMON *pokemon, HeapID heapId);

#endif //POKEHEARTGOLD_RENDER_WINDOW_H
