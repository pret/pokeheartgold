#ifndef POKEHEARTGOLD_UNK_02025534_H
#define POKEHEARTGOLD_UNK_02025534_H

#include "heap.h"

struct _2DGfxRawResObj {
    int unk0;
    void *unk4;
};

struct _2DGfxRawResMan {
    struct _2DGfxRawResObj *vals;
    int max;
    int num;
};

struct _2DGfxRawResMan *Create2DGfxResMan(int num, HeapID heapId);
void Destroy2DGfxResMan(struct _2DGfxRawResMan *a0);
BOOL sub_020255A0(struct _2DGfxRawResMan *resourceMgr, int a1);
struct _2DGfxRawResObj *sub_02025600(struct _2DGfxRawResMan *resourceMgr, const char *name, int id, HeapID heapId);
struct _2DGfxRawResObj *sub_020255C4(struct _2DGfxRawResMan *resourceMgr, const void *resource, int id);
void sub_02025658(struct _2DGfxRawResMan *resourceMgr, struct _2DGfxRawResObj *a1);
void sub_0202570C(struct _2DGfxRawResObj *resource, void *newPtr);
int Get2DGfxRawResObjId(struct _2DGfxRawResObj *resource);
void *sub_020256FC(struct _2DGfxRawResObj *resource);

#endif //POKEHEARTGOLD_UNK_02025534_H
