#ifndef POKEHEARTGOLD_UNK_0200E398_H
#define POKEHEARTGOLD_UNK_0200E398_H

#include "window.h"

void sub_0200E644(BGCONFIG *bgConfig, int layer, u32 baseTile, int a3, int frame, HeapID heapId);
void DrawFrameAndWindow2(WINDOW *window, int a1, u32 baseTile, int a3);
void ClearFrameAndWindow2(WINDOW *window, int a1);
void sub_0200E3DC(BGCONFIG* bg_config, enum GFBgLayer layer, u32 a2, u32 a3, u32 a4, HeapID heap_id);
void DrawFrameAndWindow1(WINDOW* window, BOOL dont_copy_to_vram, u16 a2, u8 palette_num);

#endif //POKEHEARTGOLD_UNK_0200E398_H
