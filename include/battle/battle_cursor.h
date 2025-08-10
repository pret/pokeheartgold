#ifndef POKEHEARTGOLD_BATTLE_CURSOR_H
#define POKEHEARTGOLD_BATTLE_CURSOR_H

#include "battle/battle.h"

#include "sys_task_api.h"

typedef struct BattleCursor {
    void *unk0[5];
    SysTask *task;
} BattleCursor;

void BattleCursor_LoadResources(SpriteSystem *renderer, SpriteManager *gfxHandler, PaletteData *plttData, HeapID heapId, u32 character, u32 pal, u32 cell, u32 animation);
void BattleCursor_FreeResources(SpriteManager *gfxHandler, u32 character, u32 pal, u32 cell, u32 animation);
BattleCursor *BattleCursor_New(SpriteSystem *renderer, SpriteManager *gfxHandler, HeapID heapId, u32 character, u32 pal, u32 cell, u32 animation, u32 a7, u32 a8);
void BattleCursor_Delete(BattleCursor *cursor);
void ov12_0226BA4C(BattleCursor *cursor, int x0, int y0, int x1, int y1, int x2, int y2, int x3, int y3, fx32 a9);
void ov12_0226BAD4(BattleCursor *cursor, int x0, int y0, int x1, int y1, int x2, int y2, int x3, int y3);
void ov12_0226BAFC(BattleCursor *cursor, int left, int right, int top, int bottom);
void ov12_0226BB1C(BattleCursor *cursor, int left, int right, int top, int bottom, fx32 a5);
void ov12_0226BB40(BattleCursor *cursor, int x, int y, int a3, fx32 a4);
void BattleCursor_Disable(BattleCursor *cursor);
void ov12_0226BB84(BattleCursor *cursor);

#endif
