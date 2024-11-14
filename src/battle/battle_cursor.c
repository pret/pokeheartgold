#include "battle/battle_cursor.h"

#include "global.h"

#include "unk_0200CF18.h"

static void BattleCursor_Update(SysTask *task, void *data);

void BattleCursor_LoadResources(SpriteRenderer *renderer, SpriteGfxHandler *gfxHandler, PaletteData *plttData, HeapID heapId, u32 character, u32 pal, u32 cell, u32 animation) {
    NARC *narc = NARC_New(NARC_a_0_0_8, heapId);
    sub_0200D68C(plttData, PLTTBUF_SUB_OBJ, renderer, gfxHandler, narc, 80, 0, 1, NNS_G2D_VRAM_TYPE_2DSUB, pal);
    SpriteRenderer_LoadCharResObjFromOpenNarc(renderer, gfxHandler, narc, 250, 1, NNS_G2D_VRAM_TYPE_2DSUB, character);
    SpriteRenderer_LoadCellResObjFromOpenNarc(renderer, gfxHandler, narc, 251, 1, cell);
    SpriteRenderer_LoadAnimResObjFromOpenNarc(renderer, gfxHandler, narc, 252, 1, animation);
    NARC_Delete(narc);
}

void BattleCursor_FreeResources(SpriteGfxHandler *gfxHandler, u32 character, u32 pal, u32 cell, u32 animation) {
    SpriteGfxHandler_UnloadCharObjById(gfxHandler, character);
    SpriteGfxHandler_UnloadPlttObjById(gfxHandler, pal);
    SpriteGfxHandler_UnloadCellObjById(gfxHandler, cell);
    SpriteGfxHandler_UnloadAnimObjById(gfxHandler, animation);
}

static const UnkTemplate_0200D748 ov12_0226EBA0 = {
    .x = 0,
    .y = 0,
    .z = 0,
    .animation = 0,
    .spritePriority = 0,
    .pal = 0,
    .vram = NNS_G2D_VRAM_TYPE_2DSUB,
    .resIdList = { 0, 0, 0, 0, -1, -1 },
    .bgPriority = 0,
    .vramTransfer = 0
};

BattleCursor *BattleCursor_New(SpriteRenderer *renderer, SpriteGfxHandler *gfxHandler, HeapID heapId, u32 character, u32 pal, u32 cell, u32 animation, u32 a7, u32 a8) {
    BattleCursor *cursor;
    UnkTemplate_0200D748 unkStruct;
    int i;

    unkStruct = ov12_0226EBA0;
    unkStruct.resIdList[0] = character;
    unkStruct.resIdList[1] = pal;
    unkStruct.resIdList[2] = cell;
    unkStruct.resIdList[3] = animation;
    unkStruct.spritePriority = a7;
    unkStruct.bgPriority = a8;

    cursor = AllocFromHeap(heapId, sizeof(BattleCursor));
    MI_CpuFill8(cursor, 0, sizeof(BattleCursor));

    for (i = 0; i < 5; i++) {
        cursor->unk0[i] = SpriteRenderer_LoadResourcesAndCreateSprite(renderer, gfxHandler, &unkStruct);
        UnkImageStruct_SetSpriteVisibleFlag(cursor->unk0[i], FALSE);
    }

    cursor->task = SysTask_CreateOnMainQueue(BattleCursor_Update, cursor, 0x9C40);

    return cursor;
}

void BattleCursor_Delete(BattleCursor *cursor) {
    for (int i = 0; i < 5; i++) {
        UnkImageStruct_Delete(cursor->unk0[i]);
    }

    SysTask_Destroy(cursor->task);
    FreeToHeap(cursor);
}

void ov12_0226BA4C(BattleCursor *cursor, int x0, int y0, int x1, int y1, int x2, int y2, int x3, int y3, fx32 a9) {
    int i;

    UnkImageStruct_SetSpritePositionXY_CustomScreenYOffset(cursor->unk0[0], x0, y0, a9);
    UnkImageStruct_SetSpritePositionXY_CustomScreenYOffset(cursor->unk0[1], x1, y1, a9);
    UnkImageStruct_SetSpritePositionXY_CustomScreenYOffset(cursor->unk0[2], x2, y2, a9);
    UnkImageStruct_SetSpritePositionXY_CustomScreenYOffset(cursor->unk0[3], x3, y3, a9);

    UnkImageStruct_SetSpriteAnimSeqNo(cursor->unk0[0], 0);
    UnkImageStruct_SetSpriteAnimSeqNo(cursor->unk0[1], 1);
    UnkImageStruct_SetSpriteAnimSeqNo(cursor->unk0[2], 2);
    UnkImageStruct_SetSpriteAnimSeqNo(cursor->unk0[3], 3);

    for (i = 0; i < 4; i++) {
        UnkImageStruct_SetSpriteVisibleFlag(cursor->unk0[i], TRUE);
    }
}

void ov12_0226BAD4(BattleCursor *cursor, int x0, int y0, int x1, int y1, int x2, int y2, int x3, int y3) {
    ov12_0226BA4C(cursor, x0, y0, x1, y1, x2, y2, x3, y3, (fx32)0xC0000);
}

void ov12_0226BAFC(BattleCursor *cursor, int left, int right, int top, int bottom) {
    ov12_0226BAD4(cursor, left, top, right, top, left, bottom, right, bottom);
}

void ov12_0226BB1C(BattleCursor *cursor, int left, int right, int top, int bottom, fx32 a5) {
    ov12_0226BA4C(cursor, left, top, right, top, left, bottom, right, bottom, a5);
}

void ov12_0226BB40(BattleCursor *cursor, int x, int y, int a3, fx32 a4) {
    UnkImageStruct_SetSpritePositionXY_CustomScreenYOffset(cursor->unk0[4], x, y, a4);
    UnkImageStruct_SetSpriteAnimSeqNo(cursor->unk0[4], a3);
    UnkImageStruct_SetSpriteVisibleFlag(cursor->unk0[4], TRUE);
}

void BattleCursor_Disable(BattleCursor *cursor) {
    for (int i = 0; i < 5; i++) {
        UnkImageStruct_SetSpriteVisibleFlag(cursor->unk0[i], FALSE);
    }
}

void ov12_0226BB84(BattleCursor *cursor) {
    UnkImageStruct_SetSpriteVisibleFlag(cursor->unk0[4], FALSE);
}

static void BattleCursor_Update(SysTask *task, void *data) {
    BattleCursor *cursor = data;
    int i;

    if (!UnkImageStruct_GetSpriteVisibleFlag(cursor->unk0[0])) {
        return;
    }

    for (i = 0; i < 4; i++) {
        UnkImageStruct_TickSpriteAnimation1Frame(cursor->unk0[i]);
    }
    if (UnkImageStruct_GetSpriteVisibleFlag(cursor->unk0[4]) == TRUE) {
        UnkImageStruct_TickSpriteAnimation1Frame(cursor->unk0[4]);
    }
}
