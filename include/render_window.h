#ifndef POKEHEARTGOLD_RENDER_WINDOW_H
#define POKEHEARTGOLD_RENDER_WINDOW_H

#include "bg_window.h"
#include "pokemon_types_def.h"

// These are for the typical window frame used by basic menus and choice-boxes.
#define STANDARD_WINDOW_TILE_W     3
#define STANDARD_WINDOW_TILE_H     3
#define STANDARD_WINDOW_TILE_COUNT (STANDARD_WINDOW_TILE_W * STANDARD_WINDOW_TILE_H)

// These are for the typical dialogue window frame used by, for example, NPC conversations.
// The frame style for this window is customizable by the player, but its size is still constant.
#define MESSAGE_BOX_TILE_W     6
#define MESSAGE_BOX_TILE_H     3
#define MESSAGE_BOX_TILE_COUNT (MESSAGE_BOX_TILE_W * MESSAGE_BOX_TILE_H)

// These are the blank tiles in the dialogue window where messages get printed.
#define MESSAGE_WINDOW_TILE_W     27
#define MESSAGE_WINDOW_TILE_H     4
#define MESSAGE_WINDOW_TILE_COUNT (MESSAGE_WINDOW_TILE_W * MESSAGE_WINDOW_TILE_H)

// This is for the down arrow used as a prompt for dialogue that must wrap its text across viewports
// or information dialogues which otherwise wait for player confirmation before the text disappears.
#define SCROLLING_CURSOR_FRAME_TILE_W     2
#define SCROLLING_CURSOR_FRAME_TILE_H     2
#define SCROLLING_CURSOR_FRAME_TILE_COUNT (SCROLLING_CURSOR_FRAME_TILE_W * SCROLLING_CURSOR_FRAME_TILE_H)
#define SCROLLING_CURSOR_FRAME_COUNT      3
#define SCROLLING_CURSOR_TILE_COUNT       (SCROLLING_CURSOR_FRAME_TILE_COUNT * SCROLLING_CURSOR_FRAME_COUNT)
#define SCROLLING_MESSAGE_BOX_TILE_COUNT  (MESSAGE_BOX_TILE_COUNT + SCROLLING_CURSOR_TILE_COUNT)

typedef struct WaitingIcon WaitingIcon; // todo: copy from pokediamond
struct PokepicManager;

void LoadUserFrameGfx1(BgConfig *bg_config, GFBgLayer layer, u16 baseTile, u8 palette_num, u8 frame, enum HeapID heapID);
void DrawFrameAndWindow1(Window *window, BOOL dont_copy_to_vram, u16 baseTile, u8 palette_num);
void LoadUserFrameGfx2(BgConfig *bgConfig, GFBgLayer layer, u16 baseTile, u8 paletteNum, u8 frame, enum HeapID heapID);
void DrawFrameAndWindow2(Window *window, BOOL dont_copy_to_vram, u16 baseTile, u8 palette_num);
void ClearFrameAndWindow2(Window *window, BOOL dont_copy_to_vram);
void DrawFrameAndWindow3(Window *window, BOOL dont_copy_to_vram, u16 baseTile, u8 palette_num, u8 type);
void ClearWindowPixelBuffer(Window *window, BOOL dont_copy_to_vram);
void LoadMapSignpostFrameAndGraphic(BgConfig *bgConfig, u8 bgId, u16 baseTile, u8 plttNum, u8 type, u16 map, enum HeapID heapId);
WaitingIcon *WaitingIcon_New(Window *window, u16 tileNum);
void sub_0200F450(WaitingIcon *waitingIcon);
struct PokepicManager *DrawPokemonPicFromSpecies(BgConfig *bgConfig, GFBgLayer layer, int x, int y, u8 paletteNum, u16 baseTile, u16 species, u8 gender, enum HeapID heapID);
struct PokepicManager *DrawPokemonPicFromMon(BgConfig *bgConfig, GFBgLayer layer, int x, int y, u8 paletteNum, u16 baseTile, Pokemon *mon, enum HeapID heapID);
void sub_0200E398(BgConfig *bgConfig, GFBgLayer layer, u32 tileStart, u32 a3, enum HeapID heapID);
u32 sub_0200E3D8(void);
u32 sub_0200E63C(int frame);
u32 sub_0200E640(int frame);
void sub_0200EB68(Window *window, int a1);
void sub_0200F478(void);

#endif // POKEHEARTGOLD_RENDER_WINDOW_H
