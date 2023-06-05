#ifndef POKEHEARTGOLD_BATTLE_CURSOR_H
#define POKEHEARTGOLD_BATTLE_CURSOR_H

#include "battle.h"
#include "unk_0200E320.h"

typedef struct BattleCursor {
    void *unk0[5];
    SysTask *task;
} BattleCursor;

void BattleCursor_LoadResources(void *a0, void *a1, void *a3, HeapID heapId, u32 character, u32 pal, u32 cell, u32 animation);
void BattleCursor_FreeResources(void *a0, u32 character, u32 pal, u32 cell, u32 animation);
BattleCursor *BattleCursor_New(void *a0, void *a1, HeapID heapId, u32 character, u32 pal, u32 cell, u32 animation, u32 a7, u32 a8);
void BattleCursor_Delete(BattleCursor *cursor);
void ov12_0226BA4C(BattleCursor *cursor, s32 x0, s32 y0, s32 x1, s32 y1, s32 x2, s32 y2, s32 x3, s32 y3, fx32 a9);
void ov12_0226BAD4(BattleCursor *cursor, s32 x0, s32 y0, s32 x1, s32 y1, s32 x2, s32 y2, s32 x3, s32 y3);
void ov12_0226BAFC(BattleCursor *cursor, s32 left, s32 right, s32 top, s32 bottom);
void ov12_0226BB1C(BattleCursor *cursor, s32 left, s32 right, s32 top, s32 bottom, fx32 a5);
void ov12_0226BB40(BattleCursor *cursor, s32 x, s32 y, s32 a3, fx32 a4);
void BattleCursor_Disable(BattleCursor *cursor);
void ov12_0226BB84(BattleCursor *cursor);

#endif
