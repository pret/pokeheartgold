#include "battle/battle_cursor.h"

#include "global.h"

#include "sprite_system.h"

static void BattleCursor_Update(SysTask *task, void *data);

void BattleCursor_LoadResources(SpriteSystem *renderer, SpriteManager *gfxHandler, PaletteData *plttData, HeapID heapId, u32 character, u32 pal, u32 cell, u32 animation) {
    NARC *narc = NARC_New(NARC_a_0_0_8, heapId);
    SpriteSystem_LoadPaletteBufferFromOpenNarc(plttData, PLTTBUF_SUB_OBJ, renderer, gfxHandler, narc, 80, 0, 1, NNS_G2D_VRAM_TYPE_2DSUB, pal);
    SpriteSystem_LoadCharResObjFromOpenNarc(renderer, gfxHandler, narc, 250, 1, NNS_G2D_VRAM_TYPE_2DSUB, character);
    SpriteSystem_LoadCellResObjFromOpenNarc(renderer, gfxHandler, narc, 251, 1, cell);
    SpriteSystem_LoadAnimResObjFromOpenNarc(renderer, gfxHandler, narc, 252, 1, animation);
    NARC_Delete(narc);
}

void BattleCursor_FreeResources(SpriteManager *gfxHandler, u32 character, u32 pal, u32 cell, u32 animation) {
    SpriteManager_UnloadCharObjById(gfxHandler, character);
    SpriteManager_UnloadPlttObjById(gfxHandler, pal);
    SpriteManager_UnloadCellObjById(gfxHandler, cell);
    SpriteManager_UnloadAnimObjById(gfxHandler, animation);
}

static const ManagedSpriteTemplate ov12_0226EBA0 = {
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

BattleCursor *BattleCursor_New(SpriteSystem *renderer, SpriteManager *gfxHandler, HeapID heapId, u32 character, u32 pal, u32 cell, u32 animation, u32 a7, u32 a8) {
    BattleCursor *cursor;
    ManagedSpriteTemplate unkStruct;
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
        cursor->unk0[i] = SpriteSystem_NewSprite(renderer, gfxHandler, &unkStruct);
        ManagedSprite_SetDrawFlag(cursor->unk0[i], FALSE);
    }

    cursor->task = SysTask_CreateOnMainQueue(BattleCursor_Update, cursor, 0x9C40);

    return cursor;
}

void BattleCursor_Delete(BattleCursor *cursor) {
    for (int i = 0; i < 5; i++) {
        Sprite_DeleteAndFreeResources(cursor->unk0[i]);
    }

    SysTask_Destroy(cursor->task);
    Heap_Free(cursor);
}

void ov12_0226BA4C(BattleCursor *cursor, int x0, int y0, int x1, int y1, int x2, int y2, int x3, int y3, fx32 a9) {
    int i;

    ManagedSprite_SetPositionXYWithSubscreenOffset(cursor->unk0[0], x0, y0, a9);
    ManagedSprite_SetPositionXYWithSubscreenOffset(cursor->unk0[1], x1, y1, a9);
    ManagedSprite_SetPositionXYWithSubscreenOffset(cursor->unk0[2], x2, y2, a9);
    ManagedSprite_SetPositionXYWithSubscreenOffset(cursor->unk0[3], x3, y3, a9);

    ManagedSprite_SetAnim(cursor->unk0[0], 0);
    ManagedSprite_SetAnim(cursor->unk0[1], 1);
    ManagedSprite_SetAnim(cursor->unk0[2], 2);
    ManagedSprite_SetAnim(cursor->unk0[3], 3);

    for (i = 0; i < 4; i++) {
        ManagedSprite_SetDrawFlag(cursor->unk0[i], TRUE);
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
    ManagedSprite_SetPositionXYWithSubscreenOffset(cursor->unk0[4], x, y, a4);
    ManagedSprite_SetAnim(cursor->unk0[4], a3);
    ManagedSprite_SetDrawFlag(cursor->unk0[4], TRUE);
}

void BattleCursor_Disable(BattleCursor *cursor) {
    for (int i = 0; i < 5; i++) {
        ManagedSprite_SetDrawFlag(cursor->unk0[i], FALSE);
    }
}

void ov12_0226BB84(BattleCursor *cursor) {
    ManagedSprite_SetDrawFlag(cursor->unk0[4], FALSE);
}

static void BattleCursor_Update(SysTask *task, void *data) {
    BattleCursor *cursor = data;
    int i;

    if (!ManagedSprite_GetDrawFlag(cursor->unk0[0])) {
        return;
    }

    for (i = 0; i < 4; i++) {
        ManagedSprite_TickFrame(cursor->unk0[i]);
    }
    if (ManagedSprite_GetDrawFlag(cursor->unk0[4]) == TRUE) {
        ManagedSprite_TickFrame(cursor->unk0[4]);
    }
}
