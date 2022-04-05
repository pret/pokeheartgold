#ifndef POKEHEARTGOLD_UNK_0200E398_H
#define POKEHEARTGOLD_UNK_0200E398_H

#include "window.h"

void LoadUserFrameGfx1(BGCONFIG* bg_config, enum GFBgLayer layer, u16 baseTile, u8 palette_num, u8 frame, HeapID heap_id);
void DrawFrameAndWindow1(WINDOW* window, BOOL dont_copy_to_vram, u16 baseTile, u8 palette_num);
void LoadUserFrameGfx2(BGCONFIG *bgConfig, enum GFBgLayer layer, u16 baseTile, u8 paletteNum, u8 frame, HeapID heapId);
void DrawFrameAndWindow2(WINDOW *window, BOOL dont_copy_to_vram, u16 baseTile, u8 palette_num);
void ClearFrameAndWindow2(WINDOW *window, BOOL dont_copy_to_vram);
void sub_0200E5D4(WINDOW *window, BOOL dont_copy_to_vram);

#endif //POKEHEARTGOLD_UNK_0200E398_H
