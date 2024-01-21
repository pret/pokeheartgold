#ifndef POKEHEARTGOLD_UNK_02025534_H
#define POKEHEARTGOLD_UNK_02025534_H

#include "heap.h"

struct _2DGfxRawResObj {
    int id;
    void *data;
};

struct _2DGfxRawResMan {
    struct _2DGfxRawResObj *vals;
    int max;
    int num;
};

struct UnkStruct_02025B04 {
    struct _2DGfxRawResObj *obj;
    NNSG3dTexKey texKey;
    NNSG3dTexKey tex4x4Key;
    NNSG3dPlttKey plttKey;
    void *resFileHeader;
    u16 unk_14;
    u16 unk_16;
};

struct UnkStruct_02025780 {
    struct _2DGfxRawResMan *man;
    struct UnkStruct_02025B04 *unk_4;
};

struct _2DGfxRawResMan *Create2DGfxResMan(int num, HeapID heapId);
void Destroy2DGfxResMan(struct _2DGfxRawResMan *a0);
BOOL sub_020255A0(struct _2DGfxRawResMan *resourceMgr, int id);
struct _2DGfxRawResObj *sub_020255C4(struct _2DGfxRawResMan *resourceMgr, void *resource, int id);
struct _2DGfxRawResObj *sub_02025600(struct _2DGfxRawResMan *resourceMgr, const char *name, int id, HeapID heapId);
void sub_02025658(struct _2DGfxRawResMan *resourceMgr, struct _2DGfxRawResObj *a1);
int Get2DGfxRawResObjId(struct _2DGfxRawResObj *resource);
void *sub_020256FC(struct _2DGfxRawResObj *resource);
void sub_0202570C(struct _2DGfxRawResObj *resource, void *newPtr);
struct UnkStruct_02025780 *sub_02025780(int num, HeapID heapId);
void sub_020257C4(struct UnkStruct_02025780 *a0);
BOOL sub_020257E8(struct UnkStruct_02025780 *a0, int id);
struct UnkStruct_02025B04 *sub_02025800(struct UnkStruct_02025780 *a0, void *a1, int a2, u32 a3, HeapID heapId);
struct UnkStruct_02025B04 *sub_02025844(struct UnkStruct_02025780 *a0, void *a1, int a2, u32 a3, HeapID heapId);
void sub_020258E0(struct UnkStruct_02025780 *a0, int a1);
void sub_02025900(struct UnkStruct_02025780 *a0);
NNSG3dResTex *sub_0202599C(struct UnkStruct_02025B04 *a0);
void sub_020259E0(struct UnkStruct_02025780 *a0, int a1);
void sub_020259FC(struct UnkStruct_02025B04 *a0);
void sub_02025A48(struct UnkStruct_02025780 *a0, int a1);
NNSG3dTexKey sub_02025A9C(struct UnkStruct_02025B04 *a0);
NNSG3dTexKey sub_02025AAC(struct UnkStruct_02025B04 *a0);
NNSG3dPlttKey sub_02025ABC(struct UnkStruct_02025B04 *a0);
u32 sub_02025ACC(const NNSG3dResFileHeader *header);

#endif //POKEHEARTGOLD_UNK_02025534_H
